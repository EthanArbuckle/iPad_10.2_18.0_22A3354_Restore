@implementation NRDeviceCollectionHistoryEntry

- (NRDeviceCollectionHistoryEntry)initWithHistory:(id)a3 index:(unint64_t)a4 date:(id)a5 diff:(id)a6 switchIndex:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  NRDeviceCollectionHistoryEntry *v16;
  NRDeviceCollectionHistoryEntry *v17;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = -[NRDeviceCollectionHistoryEntry init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_historyManager, a3);
    v17->_index = a4;
    objc_storeStrong((id *)&v17->_date, a5);
    objc_storeStrong((id *)&v17->_diff, a6);
    v17->_switchIndex = a7;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDeviceCollectionHistoryEntry)initWithCoder:(id)a3
{
  id v4;
  NRDeviceCollectionHistoryEntry *v5;
  uint64_t v6;
  void *v7;
  NRPBDeviceCollectionHistoryEntry *v8;
  NRDeviceCollectionHistoryEntry *v9;
  uint64_t v10;
  NSDate *date;
  uint64_t v12;
  NRDeviceCollectionDiff *diff;

  v4 = a3;
  v5 = -[NRDeviceCollectionHistoryEntry init](self, "init");
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v5->_index = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("index"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v10 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diff"));
    v12 = objc_claimAutoreleasedReturnValue();
    diff = v5->_diff;
    v5->_diff = (NRDeviceCollectionDiff *)v12;

    v5->_switchIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("switchIndex"));
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDeviceCollectionHistoryEntry initWithData:]([NRPBDeviceCollectionHistoryEntry alloc], "initWithData:", v6);
  v9 = -[NRDeviceCollectionHistoryEntry initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRDeviceCollectionHistoryEntry protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (NRDeviceCollectionHistoryEntry)initWithProtobuf:(id)a3
{
  double *v4;
  NRDeviceCollectionHistoryEntry *v5;
  NRDeviceCollectionHistoryEntry *v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  NSDate *date;
  NRDeviceCollectionDiff *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NRDeviceCollectionDiff *diff;

  v4 = (double *)a3;
  v5 = -[NRDeviceCollectionHistoryEntry init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = *((_QWORD *)v4 + 2);
      v8 = v4[1];
    }
    else
    {
      v7 = 0;
      v8 = 0.0;
    }
    v5->_index = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    date = v6->_date;
    v6->_date = (NSDate *)v9;

    v11 = [NRDeviceCollectionDiff alloc];
    if (v4)
      v12 = (void *)*((_QWORD *)v4 + 3);
    else
      v12 = 0;
    v13 = v12;
    v14 = -[NRDeviceCollectionDiff initWithProtobuf:](v11, "initWithProtobuf:", v13);
    diff = v6->_diff;
    v6->_diff = (NRDeviceCollectionDiff *)v14;

  }
  return v6;
}

- (NRPBDeviceCollectionHistoryEntry)protobuf
{
  uint64_t v3;
  uint64_t v4;
  unint64_t index;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_new();
  v4 = v3;
  if (v3)
  {
    index = self->_index;
    *(_BYTE *)(v3 + 32) |= 2u;
    *(_QWORD *)(v3 + 16) = index;
    -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
    *(_BYTE *)(v4 + 32) |= 1u;
    *(_QWORD *)(v4 + 8) = v6;
  }
  else
  {
    -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  }
  -[NRDeviceCollectionDiff protobuf](self->_diff, "protobuf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceCollectionHistoryEntry setDiff:](v4, v7);

  return (NRPBDeviceCollectionHistoryEntry *)(id)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NRDeviceCollectionHistoryEntry *v4;

  v4 = -[NRDeviceCollectionHistoryEntry init](+[NRDeviceCollectionHistoryEntry allocWithZone:](NRDeviceCollectionHistoryEntry, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_historyManager, self->_historyManager);
  v4->_index = self->_index;
  objc_storeStrong((id *)&v4->_date, self->_date);
  objc_storeStrong((id *)&v4->_diff, self->_diff);
  v4->_switchIndex = self->_switchIndex;
  return v4;
}

- (unint64_t)hash
{
  NSDate *date;
  unint64_t index;
  uint64_t v5;
  uint64_t v6;

  index = self->_index;
  date = self->_date;
  if (index == -1)
    v5 = 529;
  else
    v5 = 23 * index + 529;
  v6 = v5 + -[NSDate hash](date, "hash");
  return self->_switchIndex + 23 * (-[NRDeviceCollectionDiff hash](self->_diff, "hash") + 23 * v6);
}

- (NRMutableDeviceCollection)state
{
  NRDeviceCollectionHistory *historyManager;
  unint64_t index;
  void *v4;
  void *v5;
  void *v6;
  NRMutableDeviceCollection *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *historyStateCache;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;

  historyManager = self->_historyManager;
  if (historyManager)
  {
    index = self->_index;
    v4 = (void *)MEMORY[0x1A1B01C40]();
    os_unfair_lock_lock(&historyManager->_cacheLock);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", index);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDeviceCollectionHistory _mostRecentStateBefore:](historyManager, "_mostRecentStateBefore:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", historyManager->_startIndex);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary objectForKeyedSubscript:](historyManager->_historyStateCache, "objectForKeyedSubscript:", v6);
    v7 = (NRMutableDeviceCollection *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "longLongValue") != index)
    {
      v8 = objc_msgSend(v6, "longLongValue") - historyManager->_startIndex;
      if (v7)
      {
        v9 = -[NRMutableDeviceCollection copyWithZone:](v7, "copyWithZone:", 0);

        ++v8;
        v7 = (NRMutableDeviceCollection *)v9;
      }
      else
      {
        v7 = objc_alloc_init(NRMutableDeviceCollection);
      }
      v10 = index - historyManager->_startIndex;
      if (v10 >= 4 && v10 - v8 >= 4)
      {
        v22 = v4;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](historyManager->_history, "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "diff");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NRMutableStateBase applyDiff:](v7, "applyDiff:", v12);

          ++v8;
        }
        while (historyManager->_startIndex + v8 <= index - 3);
        if (v5)
        {
          historyStateCache = historyManager->_historyStateCache;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", index - 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](historyStateCache, "setObject:forKeyedSubscript:", v7, v15);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", index - 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NRDeviceCollectionHistory _updateHistoryCachesWithIndex:](historyManager, "_updateHistoryCachesWithIndex:", v16);

          v17 = -[NRMutableDeviceCollection copyWithZone:](v7, "copyWithZone:", 0);
          v7 = (NRMutableDeviceCollection *)v17;
        }
        v4 = v22;
      }
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](historyManager->_history, "objectAtIndexedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "diff");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[NRMutableStateBase applyDiff:](v7, "applyDiff:", v19);

        ++v8;
      }
      while (historyManager->_startIndex + v8 <= index);
    }
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](historyManager->_historyStateCache, "setObject:forKeyedSubscript:", v7, v5);
      -[NRDeviceCollectionHistory _updateHistoryCachesWithIndex:](historyManager, "_updateHistoryCachesWithIndex:", v5);
    }

    os_unfair_lock_unlock(&historyManager->_cacheLock);
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)description
{
  void *v3;
  unint64_t index;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  index = self->_index;
  +[NRTextFormattingUtilities dateFormatter:](NRTextFormattingUtilities, "dateFormatter:", self->_date);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%06lld: %@ (switch=%u)"), index, v5, self->_switchIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NRDeviceCollectionDiff description](self->_diff, "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("(null)");
  +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NRDeviceCollectionHistoryEntry *v4;
  NRDeviceCollectionHistoryEntry *v5;
  NSDate *date;
  NRDeviceCollectionDiff *diff;
  BOOL v8;

  v4 = (NRDeviceCollectionHistoryEntry *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_14;
  }
  if (v4)
  {
    v5 = v4;
    v8 = self->_index == v5->_index
      && ((date = self->_date, !((unint64_t)date | (unint64_t)v5->_date))
       || -[NSDate isEqual:](date, "isEqual:"))
      && ((diff = self->_diff, !((unint64_t)diff | (unint64_t)v5->_diff))
       || -[NRDeviceCollectionDiff isEqual:](diff, "isEqual:"))
      && self->_switchIndex == v5->_switchIndex;

  }
  else
  {
LABEL_10:
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSDate)date
{
  return self->_date;
}

- (NRDeviceCollectionDiff)diff
{
  return self->_diff;
}

- (unsigned)switchIndex
{
  return self->_switchIndex;
}

- (void)setHistoryManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyManager, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
