@implementation CATIDSServiceConnectionDataAggregation

- (CATIDSServiceConnectionDataAggregation)initWithWorkQueue:(id)a3
{
  id v5;
  CATIDSServiceConnectionDataAggregation *v6;
  CATIDSServiceConnectionDataAggregation *v7;
  uint64_t v8;
  NSMutableDictionary *mDataSegmentsBySegmentNumber;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATIDSServiceConnectionDataAggregation;
  v6 = -[CATIDSServiceConnectionDataAggregation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWorkQueue, a3);
    v8 = objc_opt_new();
    mDataSegmentsBySegmentNumber = v7->mDataSegmentsBySegmentNumber;
    v7->mDataSegmentsBySegmentNumber = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)updateWithDataContent:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[CATIDSServiceConnectionDataAggregation hydrateWithContentIfNeededWithContent:](self, "hydrateWithContentIfNeededWithContent:", v7);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "segmentNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->mPendingSegmentNumbers, "containsObject:", v4))
  {
    v5 = -[CATIDSServiceConnectionDataAggregation dataNumber](self, "dataNumber");
    if (v5 != objc_msgSend(v7, "dataNumber"))
      -[CATIDSServiceConnectionDataAggregation setDataNumber:](self, "setDataNumber:", objc_msgSend(v7, "dataNumber"));
    objc_msgSend(v7, "dataSegment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mDataSegmentsBySegmentNumber, "setObject:forKeyedSubscript:", v6, v4);

    -[NSMutableSet removeObject:](self->mPendingSegmentNumbers, "removeObject:", v4);
    if (!-[NSMutableSet count](self->mPendingSegmentNumbers, "count"))
      -[CATIDSServiceConnectionDataAggregation finishAggregating](self, "finishAggregating");
  }

}

- (void)finishAggregating
{
  uint64_t v3;
  unint64_t v4;
  unint64_t i;
  NSMutableDictionary *mDataSegmentsBySegmentNumber;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_opt_new();
  v3 = -[NSMutableDictionary count](self->mDataSegmentsBySegmentNumber, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 1; i <= v4; ++i)
    {
      mDataSegmentsBySegmentNumber = self->mDataSegmentsBySegmentNumber;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](mDataSegmentsBySegmentNumber, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = self->mDataSegmentsBySegmentNumber;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v10);

      objc_msgSend(v13, "appendData:", v8);
    }
  }
  v11 = (void *)objc_msgSend(v13, "copy");
  -[CATIDSServiceConnectionDataAggregation setTotalData:](self, "setTotalData:", v11);

  -[CATIDSServiceConnectionDataAggregation delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataAggregationCompleted:", self);

}

- (void)hydrateWithContentIfNeededWithContent:(id)a3
{
  id v4;

  v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (!self->mPerformedInitialHydration)
  {
    -[CATIDSServiceConnectionDataAggregation hydratePendingNumbersWithContent:](self, "hydratePendingNumbersWithContent:", v4);
    -[CATIDSServiceConnectionDataAggregation hydrateStartingSequenceNumber:](self, "hydrateStartingSequenceNumber:", v4);
    self->mPerformedInitialHydration = 1;
  }

}

- (void)hydratePendingNumbersWithContent:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *mPendingSegmentNumbers;
  unint64_t v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(v9, "totalSegments") * 1.5));
  mPendingSegmentNumbers = self->mPendingSegmentNumbers;
  self->mPendingSegmentNumbers = v4;

  if (objc_msgSend(v9, "totalSegments"))
  {
    v6 = 1;
    do
    {
      v7 = self->mPendingSegmentNumbers;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v7, "addObject:", v8);

      ++v6;
    }
    while (v6 <= objc_msgSend(v9, "totalSegments"));
  }

}

- (void)hydrateStartingSequenceNumber:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *mStartingSequenceNumber;
  NSNumber *v10;
  NSNumber *mTotalSegments;
  id v12;

  v12 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  objc_msgSend(v12, "sequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "sequenceNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    v7 = v6 - objc_msgSend(v12, "segmentNumber") + 1;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mStartingSequenceNumber = self->mStartingSequenceNumber;
    self->mStartingSequenceNumber = v8;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "totalSegments"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mTotalSegments = self->mTotalSegments;
    self->mTotalSegments = v10;

  }
}

- (id)pendingSequenceNumbersDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet sortedArrayUsingDescriptors:](self->mPendingSegmentNumbers, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__CATIDSServiceConnectionDataAggregation_pendingSequenceNumbersDescription__block_invoke;
  v11[3] = &unk_24C1C5AD8;
  v11[4] = self;
  objc_msgSend(v5, "cat_map:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@]"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __75__CATIDSServiceConnectionDataAggregation_pendingSequenceNumbersDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "unsignedIntegerValue");
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithUnsignedInteger:", v5 + v6 - 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CATIDSServiceConnectionDataAggregation dataNumber](self, "dataNumber");
  -[CATIDSServiceConnectionDataAggregation pendingSequenceNumbersDescription](self, "pendingSequenceNumbersDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { dataNumber = %lu, pendingSequenceNumbers = %@ }>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CATIDSServiceConnectionDataAggregationDelegate)delegate
{
  return (CATIDSServiceConnectionDataAggregationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)dataNumber
{
  return self->_dataNumber;
}

- (void)setDataNumber:(unint64_t)a3
{
  self->_dataNumber = a3;
}

- (NSData)totalData
{
  return self->_totalData;
}

- (void)setTotalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mTotalSegments, 0);
  objc_storeStrong((id *)&self->mStartingSequenceNumber, 0);
  objc_storeStrong((id *)&self->mPendingSegmentNumbers, 0);
  objc_storeStrong((id *)&self->mDataSegmentsBySegmentNumber, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end
