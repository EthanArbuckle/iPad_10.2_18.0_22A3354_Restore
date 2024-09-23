@implementation PHChangeHandlingDebugEvent

- (void)start
{
  __uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[PHChangeHandlingDebugEvent setStartTimestamp:](self, "setStartTimestamp:");
  -[PHChangeHandlingDebugEvent setQosClass:](self, "setQosClass:", qos_class_self());
  v3 = 0;
  pthread_threadid_np(0, &v3);
  -[PHChangeHandlingDebugEvent setThreadID:](self, "setThreadID:", v3);
}

- (void)reset
{
  -[PHChangeHandlingDebugEvent setStartTimestamp:](self, "setStartTimestamp:", 0.0);
  -[PHChangeHandlingDebugEvent setQosClass:](self, "setQosClass:", 0);
  -[PHChangeHandlingDebugEvent setThreadID:](self, "setThreadID:", 0);
  -[PHChangeHandlingDebugEvent setInternalObserversCount:](self, "setInternalObserversCount:", 0);
  -[PHChangeHandlingDebugEvent setExternalObserversCount:](self, "setExternalObserversCount:", 0);
  -[PHChangeHandlingDebugEvent setInsertedCount:](self, "setInsertedCount:", 0);
  -[PHChangeHandlingDebugEvent setUpdatedCount:](self, "setUpdatedCount:", 0);
  -[PHChangeHandlingDebugEvent setDeletedCount:](self, "setDeletedCount:", 0);
  -[PHChangeHandlingDebugEvent setUnknownMergeEvent:](self, "setUnknownMergeEvent:", 0);
  -[PHChangeHandlingDebugEvent setFetchResultCount:](self, "setFetchResultCount:", 0);
  -[PHChangeHandlingDebugEvent setDistributeInternalTimestamp:](self, "setDistributeInternalTimestamp:", 0.0);
  -[PHChangeHandlingDebugEvent setDistributeExternalTimestamp:](self, "setDistributeExternalTimestamp:", 0.0);
  -[PHChangeHandlingDebugEvent setEndTimestamp:](self, "setEndTimestamp:", 0.0);
  -[PHChangeHandlingDebugEvent setLastTransactionNumber:](self, "setLastTransactionNumber:", 0);
  -[PHChangeHandlingDebugEvent setTransactionCount:](self, "setTransactionCount:", 0);
  -[PHChangeHandlingDebugEvent setChangeCount:](self, "setChangeCount:", 0);
}

- (BOOL)isValid
{
  double v2;

  -[PHChangeHandlingDebugEvent startTimestamp](self, "startTimestamp");
  return v2 > 0.0;
}

- (id)description
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  const __CFString *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  const __CFString *v20;

  if (-[PHChangeHandlingDebugEvent isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeHandlingDebugEvent startTimestamp](self, "startTimestamp");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0D71088], "stringFromTimestamp:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHChangeHandlingDebugEvent threadID](self, "threadID");
    -[PHChangeHandlingDebugEvent qosClass](self, "qosClass");
    PLShortStringFromQoSClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: thr: 0x%-8llx qos: %@"), v6, v7, v8);

    objc_msgSend(v3, "appendFormat:", CFSTR(" int: %tu, ext: %tu"), -[PHChangeHandlingDebugEvent internalObserversCount](self, "internalObserversCount"), -[PHChangeHandlingDebugEvent externalObserversCount](self, "externalObserversCount"));
    v9 = -[PHChangeHandlingDebugEvent insertedCount](self, "insertedCount");
    v10 = -[PHChangeHandlingDebugEvent updatedCount](self, "updatedCount");
    v11 = -[PHChangeHandlingDebugEvent deletedCount](self, "deletedCount");
    v12 = -[PHChangeHandlingDebugEvent unknownMergeEvent](self, "unknownMergeEvent");
    v13 = CFSTR("NO");
    if (v12)
      v13 = CFSTR("YES");
    objc_msgSend(v3, "appendFormat:", CFSTR(" ins: %tu, upd: %tu, del: %tu: unk: %@"), v9, v10, v11, v13);
    objc_msgSend(v3, "appendFormat:", CFSTR(" fr cnt: %tu"), -[PHChangeHandlingDebugEvent fetchResultCount](self, "fetchResultCount"));
    objc_msgSend(v3, "appendFormat:", CFSTR(" tx#: %llu, tx cnt: %zd, ch cnt: %zd"), -[PHChangeHandlingDebugEvent lastTransactionNumber](self, "lastTransactionNumber"), -[PHChangeHandlingDebugEvent transactionCount](self, "transactionCount"), -[PHChangeHandlingDebugEvent changeCount](self, "changeCount"));
    -[PHChangeHandlingDebugEvent distributeInternalTimestamp](self, "distributeInternalTimestamp");
    if (v14 > 0.0)
    {
      -[PHChangeHandlingDebugEvent distributeInternalTimestamp](self, "distributeInternalTimestamp");
      objc_msgSend(v3, "appendFormat:", CFSTR(" dist int: %+.3f"), v15 - v5);
    }
    -[PHChangeHandlingDebugEvent distributeExternalTimestamp](self, "distributeExternalTimestamp");
    if (v16 > 0.0)
    {
      -[PHChangeHandlingDebugEvent distributeExternalTimestamp](self, "distributeExternalTimestamp");
      objc_msgSend(v3, "appendFormat:", CFSTR(" dist ext: %+.3f"), v17 - v5);
    }
    -[PHChangeHandlingDebugEvent endTimestamp](self, "endTimestamp");
    if (v18 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v20 = CFSTR(" now: %+.3f");
    }
    else
    {
      -[PHChangeHandlingDebugEvent endTimestamp](self, "endTimestamp");
      v20 = CFSTR(" end: %+.3f");
    }
    objc_msgSend(v3, "appendFormat:", v20, v19 - v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unused: %p>"), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (unint64_t)internalObserversCount
{
  return self->_internalObserversCount;
}

- (void)setInternalObserversCount:(unint64_t)a3
{
  self->_internalObserversCount = a3;
}

- (unint64_t)externalObserversCount
{
  return self->_externalObserversCount;
}

- (void)setExternalObserversCount:(unint64_t)a3
{
  self->_externalObserversCount = a3;
}

- (unint64_t)insertedCount
{
  return self->_insertedCount;
}

- (void)setInsertedCount:(unint64_t)a3
{
  self->_insertedCount = a3;
}

- (unint64_t)updatedCount
{
  return self->_updatedCount;
}

- (void)setUpdatedCount:(unint64_t)a3
{
  self->_updatedCount = a3;
}

- (unint64_t)deletedCount
{
  return self->_deletedCount;
}

- (void)setDeletedCount:(unint64_t)a3
{
  self->_deletedCount = a3;
}

- (BOOL)unknownMergeEvent
{
  return self->_unknownMergeEvent;
}

- (void)setUnknownMergeEvent:(BOOL)a3
{
  self->_unknownMergeEvent = a3;
}

- (unint64_t)fetchResultCount
{
  return self->_fetchResultCount;
}

- (void)setFetchResultCount:(unint64_t)a3
{
  self->_fetchResultCount = a3;
}

- (double)distributeInternalTimestamp
{
  return self->_distributeInternalTimestamp;
}

- (void)setDistributeInternalTimestamp:(double)a3
{
  self->_distributeInternalTimestamp = a3;
}

- (double)distributeExternalTimestamp
{
  return self->_distributeExternalTimestamp;
}

- (void)setDistributeExternalTimestamp:(double)a3
{
  self->_distributeExternalTimestamp = a3;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(double)a3
{
  self->_endTimestamp = a3;
}

- (unint64_t)lastTransactionNumber
{
  return self->_lastTransactionNumber;
}

- (void)setLastTransactionNumber:(unint64_t)a3
{
  self->_lastTransactionNumber = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(int64_t)a3
{
  self->_changeCount = a3;
}

- (BOOL)isValue
{
  return self->_valid;
}

@end
