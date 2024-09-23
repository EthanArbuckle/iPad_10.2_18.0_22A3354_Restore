@implementation IMMessageHistoryDateRangeSummary

- (IMMessageHistoryDateRangeSummary)initWithDateInterval:(id)a3 messages:(id)a4
{
  id v7;
  id v8;
  IMMessageHistoryDateRangeSummary *v9;
  IMMessageHistoryDateRangeSummary *v10;
  uint64_t v11;
  NSArray *messages;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageHistoryDateRangeSummary;
  v9 = -[IMMessageHistoryDateRangeSummary init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    v11 = objc_msgSend(v8, "copy");
    messages = v10->_messages;
    v10->_messages = (NSArray *)v11;

  }
  return v10;
}

- (id)messagesMatchingDateInterval:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  IMMessageHistoryDateRangeSummary *v13;
  void *v14;
  IMMessageHistoryDateRangeSummary *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_messages;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "date", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsDate:", v12))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v13 = [IMMessageHistoryDateRangeSummary alloc];
  v14 = (void *)objc_msgSend(v5, "copy");
  v15 = -[IMMessageHistoryDateRangeSummary initWithDateInterval:messages:](v13, "initWithDateInterval:messages:", v4, v14);

  return v15;
}

- (int64_t)totalMessagePartCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_messages;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "messagePartCount", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDateInterval:messages:", self->_dateInterval, self->_messages);
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messages, CFSTR("messages"));

}

- (IMMessageHistoryDateRangeSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  IMMessageHistoryDateRangeSummary *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("messages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[IMMessageHistoryDateRangeSummary initWithDateInterval:messages:](self, "initWithDateInterval:messages:", v5, v6);
    v8 = self;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
