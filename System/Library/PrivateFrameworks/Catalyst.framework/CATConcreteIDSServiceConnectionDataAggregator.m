@implementation CATConcreteIDSServiceConnectionDataAggregator

- (CATConcreteIDSServiceConnectionDataAggregator)initWithWorkQueue:(id)a3 timerSource:(id)a4 missingItemInterval:(double)a5 supportsSequenceCorrection:(BOOL)a6
{
  id v11;
  id v12;
  CATConcreteIDSServiceConnectionDataAggregator *v13;
  CATConcreteIDSServiceConnectionDataAggregator *v14;
  uint64_t v15;
  NSMutableDictionary *mAggregationsByDataNumber;
  uint64_t v17;
  NSMutableIndexSet *mPendingSequenceNumbers;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CATConcreteIDSServiceConnectionDataAggregator;
  v13 = -[CATConcreteIDSServiceConnectionDataAggregator init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mWorkQueue, a3);
    objc_storeStrong((id *)&v14->mTimerSource, a4);
    v14->mMissingItemInterval = a5;
    v14->mSupportsSequenceCorrection = a6;
    v15 = objc_opt_new();
    mAggregationsByDataNumber = v14->mAggregationsByDataNumber;
    v14->mAggregationsByDataNumber = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    mPendingSequenceNumbers = v14->mPendingSequenceNumbers;
    v14->mPendingSequenceNumbers = (NSMutableIndexSet *)v17;

  }
  return v14;
}

- (id)missingSequenceNumbers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIndexes:", self->mPendingSequenceNumbers);
  objc_msgSend(MEMORY[0x24BDBCE30], "cat_arrayFromIndexSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)receivedSequenceNumber
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  return self->mNextExpectedSequenceNumber - 1;
}

- (void)receiveDataContent:(id)a3
{
  unint64_t v4;
  unint64_t mNextDeploymentNumber;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  char v10;
  void *v11;
  NSMutableDictionary *mAggregationsByDataNumber;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v4 = objc_msgSend(v15, "dataNumber");
  mNextDeploymentNumber = self->mNextDeploymentNumber;
  if (v4 <= mNextDeploymentNumber)
    v6 = self->mNextDeploymentNumber;
  else
    v6 = v4;
  if (v4 >= mNextDeploymentNumber)
    v7 = self->mNextDeploymentNumber;
  else
    v7 = v4;
  if (v7 + ~v6 > 0x186A0)
  {
    v8 = v4 >= mNextDeploymentNumber;
    v9 = v4 > mNextDeploymentNumber;
  }
  else
  {
    v8 = mNextDeploymentNumber >= v4;
    v9 = mNextDeploymentNumber > v4;
  }
  v10 = !v8;
  v11 = v15;
  if (v9 || (v10 & 1) == 0)
  {
    -[CATConcreteIDSServiceConnectionDataAggregator updateMissingContentTrackingForDataContent:](self, "updateMissingContentTrackingForDataContent:", v15);
    mAggregationsByDataNumber = self->mAggregationsByDataNumber;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "dataNumber"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](mAggregationsByDataNumber, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[CATConcreteIDSServiceConnectionDataAggregator updateExistingDataWindowWithContent:](self, "updateExistingDataWindowWithContent:", v15);
    else
      -[CATConcreteIDSServiceConnectionDataAggregator processNewDataWindowWithContent:](self, "processNewDataWindowWithContent:", v15);
    v11 = v15;
  }

}

- (void)receiveExpectedSequenceNumber:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  id v12;

  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v5 = self->mNextExpectedSequenceNumber - 1;
  if (a3 <= v5)
    v6 = self->mNextExpectedSequenceNumber - 1;
  else
    v6 = a3;
  if (a3 >= v5)
    v7 = self->mNextExpectedSequenceNumber - 1;
  else
    v7 = a3;
  if (v7 + ~v6 > 0x186A0)
  {
    v10 = v5 >= a3;
    v9 = v5 > a3;
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v8 = v5 > a3;
    v9 = v5 < a3;
    if (v8)
      goto LABEL_15;
  }
  if (!v9)
  {
LABEL_15:
    -[CATConcreteIDSServiceConnectionDataAggregator delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CATConcreteIDSServiceConnectionDataAggregator missingSequenceNumbers](self, "missingSequenceNumbers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectionDataAggregator:isMissingSequenceNumbers:", self, v11);

    goto LABEL_16;
  }
  -[CATConcreteIDSServiceConnectionDataAggregator delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connectionDataAggregatorWantsToReportSequenceNumber:", self);
LABEL_16:

}

- (void)processNewDataWindowWithContent:(id)a3
{
  NSObject *mWorkQueue;
  id v5;
  NSMutableDictionary *mAggregationsByDataNumber;
  void *v7;
  CATIDSServiceConnectionDataAggregation *v8;

  mWorkQueue = self->mWorkQueue;
  v5 = a3;
  CATAssertIsQueue(mWorkQueue);
  v8 = -[CATIDSServiceConnectionDataAggregation initWithWorkQueue:]([CATIDSServiceConnectionDataAggregation alloc], "initWithWorkQueue:", self->mWorkQueue);
  -[CATIDSServiceConnectionDataAggregation setDelegate:](v8, "setDelegate:", self);
  mAggregationsByDataNumber = self->mAggregationsByDataNumber;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "dataNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mAggregationsByDataNumber, "setObject:forKeyedSubscript:", v8, v7);

  -[CATConcreteIDSServiceConnectionDataAggregator updateExistingDataWindowWithContent:](self, "updateExistingDataWindowWithContent:", v5);
}

- (void)updateExistingDataWindowWithContent:(id)a3
{
  NSMutableDictionary *mAggregationsByDataNumber;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  mAggregationsByDataNumber = self->mAggregationsByDataNumber;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "dataNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mAggregationsByDataNumber, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATIDSServiceConnectionDataAggregator.m"), 138, CFSTR("Should have an aggregation for window number %ld"), objc_msgSend(v9, "dataNumber"));

  }
  objc_msgSend(v7, "updateWithDataContent:", v9);

}

- (void)updateMissingContentTrackingForDataContent:(id)a3
{
  id v4;
  unint64_t mNextExpectedSequenceNumber;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t mGreatestExpectedSequenceNumber;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  int v19;
  NSMutableIndexSet *mPendingSequenceNumbers;
  void *v21;
  int v22;
  NSMutableIndexSet *v23;
  _BOOL4 v24;
  CATTimerSource *mTimerSource;
  void *v26;
  double mMissingItemInterval;
  OS_dispatch_queue *mWorkQueue;
  CATTimer *v29;
  CATTimer *mMissingContentTimer;
  _QWORD v31[4];
  id v32;
  id location;

  v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!self->mSupportsSequenceCorrection)
    goto LABEL_34;
  mNextExpectedSequenceNumber = self->mNextExpectedSequenceNumber;
  objc_msgSend(v4, "sequenceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (mNextExpectedSequenceNumber <= v7)
    v8 = v7;
  else
    v8 = mNextExpectedSequenceNumber;
  if (mNextExpectedSequenceNumber >= v7)
    v9 = v7;
  else
    v9 = mNextExpectedSequenceNumber;
  if (v9 + ~v8 >= 0x186A1)
  {
    if (mNextExpectedSequenceNumber <= v7)
      goto LABEL_10;
LABEL_19:

    goto LABEL_34;
  }
  if (v7 > mNextExpectedSequenceNumber)
    goto LABEL_19;
LABEL_10:

  objc_msgSend(v4, "sequenceNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  v12 = v11 - objc_msgSend(v4, "segmentNumber");
  v13 = v12 + objc_msgSend(v4, "totalSegments");

  mGreatestExpectedSequenceNumber = self->mGreatestExpectedSequenceNumber;
  if (mGreatestExpectedSequenceNumber <= v13)
    v15 = v13;
  else
    v15 = self->mGreatestExpectedSequenceNumber;
  if (mGreatestExpectedSequenceNumber >= v13)
    v16 = v13;
  else
    v16 = self->mGreatestExpectedSequenceNumber;
  if (v16 + ~v15 >= 0x186A1)
  {
    v17 = mGreatestExpectedSequenceNumber >= v13;
    v18 = mGreatestExpectedSequenceNumber > v13;
  }
  else
  {
    v17 = v13 >= mGreatestExpectedSequenceNumber;
    v18 = v13 > mGreatestExpectedSequenceNumber;
  }
  v19 = !v17;
  if (!v18 && v19)
    self->mGreatestExpectedSequenceNumber = v13;
  mPendingSequenceNumbers = self->mPendingSequenceNumbers;
  objc_msgSend(v4, "sequenceNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableIndexSet addIndex:](mPendingSequenceNumbers, "addIndex:", objc_msgSend(v21, "unsignedIntegerValue"));

  v22 = -[NSMutableIndexSet containsIndex:](self->mPendingSequenceNumbers, "containsIndex:", self->mNextExpectedSequenceNumber);
  if (v22)
  {
    do
    {
      v23 = self->mPendingSequenceNumbers;
      ++self->mNextExpectedSequenceNumber;
      -[NSMutableIndexSet removeIndex:](v23, "removeIndex:");
    }
    while ((-[NSMutableIndexSet containsIndex:](self->mPendingSequenceNumbers, "containsIndex:", self->mNextExpectedSequenceNumber) & 1) != 0);
  }
  v24 = self->mGreatestExpectedSequenceNumber <= self->mNextDeploymentNumber && self->mMissingContentTimer == 0;
  if ((v22 | v24) == 1)
  {
    objc_initWeak(&location, self);
    -[CATTimer invalidate](self->mMissingContentTimer, "invalidate");
    mTimerSource = self->mTimerSource;
    objc_msgSend((id)objc_opt_class(), "missingContentTimerIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    mMissingItemInterval = self->mMissingItemInterval;
    mWorkQueue = self->mWorkQueue;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __92__CATConcreteIDSServiceConnectionDataAggregator_updateMissingContentTrackingForDataContent___block_invoke;
    v31[3] = &unk_24C1C5B28;
    objc_copyWeak(&v32, &location);
    -[CATTimerSource scheduleInfiniteTimerWithIdentifier:timeInterval:queue:fireHandler:](mTimerSource, "scheduleInfiniteTimerWithIdentifier:timeInterval:queue:fireHandler:", v26, mWorkQueue, v31, mMissingItemInterval);
    v29 = (CATTimer *)objc_claimAutoreleasedReturnValue();
    mMissingContentTimer = self->mMissingContentTimer;
    self->mMissingContentTimer = v29;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
LABEL_34:

}

void __92__CATConcreteIDSServiceConnectionDataAggregator_updateMissingContentTrackingForDataContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "missingContentTimerDidFire:fireCount:", v5, a3);

}

- (void)missingContentTimerDidFire:(id)a3 fireCount:(unint64_t)a4
{
  char v4;
  NSObject *mWorkQueue;
  CATTimer *v7;
  CATTimer *mMissingContentTimer;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  mWorkQueue = self->mWorkQueue;
  v7 = (CATTimer *)a3;
  CATAssertIsQueue(mWorkQueue);
  mMissingContentTimer = self->mMissingContentTimer;

  if (mMissingContentTimer == v7)
  {
    -[CATConcreteIDSServiceConnectionDataAggregator missingSequenceNumbers](self, "missingSequenceNumbers");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "count");
    if ((v4 & 1) != 0)
    {
      if (v9)
      {
        -[CATConcreteIDSServiceConnectionDataAggregator delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "connectionDataAggregator:isMissingSequenceNumbers:", self, v11);

      }
    }

  }
}

- (void)dataAggregationCompleted:(id)a3
{
  void *v4;
  unint64_t mNextDeploymentNumber;
  NSMutableDictionary *mAggregationsByDataNumber;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v4 = 0;
  mNextDeploymentNumber = self->mNextDeploymentNumber;
  while (1)
  {
    mAggregationsByDataNumber = self->mAggregationsByDataNumber;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", mNextDeploymentNumber);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](mAggregationsByDataNumber, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "totalData");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    -[CATConcreteIDSServiceConnectionDataAggregator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connectionDataAggregator:aggregatedData:withNumber:", self, v9, self->mNextDeploymentNumber);

    v11 = self->mAggregationsByDataNumber;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->mNextDeploymentNumber);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

    mNextDeploymentNumber = self->mNextDeploymentNumber + 1;
    self->mNextDeploymentNumber = mNextDeploymentNumber;
    v4 = (void *)v9;
  }

}

+ (id)missingContentTimerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-MissingContentTimer"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p { nextDeploymentNumber = %lu, aggregationsByDataNumber = %@ }>"), objc_opt_class(), self, self->mNextDeploymentNumber, self->mAggregationsByDataNumber);
}

- (CATIDSServiceConnectionDataAggregatorDelegate)delegate
{
  return (CATIDSServiceConnectionDataAggregatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMissingContentTimer, 0);
  objc_storeStrong((id *)&self->mPendingSequenceNumbers, 0);
  objc_storeStrong((id *)&self->mAggregationsByDataNumber, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end
