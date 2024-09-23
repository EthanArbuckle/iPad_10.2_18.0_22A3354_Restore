@implementation ICASSessionSummaryArrayItemData

- (ICASSessionSummaryArrayItemData)initWithSessionType:(id)a3 sessionDuration:(id)a4 sessionCount:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICASSessionSummaryArrayItemData *v12;
  ICASSessionSummaryArrayItemData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASSessionSummaryArrayItemData;
  v12 = -[ICASSessionSummaryArrayItemData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionType, a3);
    objc_storeStrong((id *)&v13->_sessionDuration, a4);
    objc_storeStrong((id *)&v13->_sessionCount, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SessionSummaryArrayItemData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("sessionType");
  -[ICASSessionSummaryArrayItemData sessionType](self, "sessionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSessionSummaryArrayItemData sessionType](self, "sessionType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = CFSTR("sessionDuration");
  -[ICASSessionSummaryArrayItemData sessionDuration](self, "sessionDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASSessionSummaryArrayItemData sessionDuration](self, "sessionDuration");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = CFSTR("sessionCount");
  -[ICASSessionSummaryArrayItemData sessionCount](self, "sessionCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASSessionSummaryArrayItemData sessionCount](self, "sessionCount");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ICASSessionType)sessionType
{
  return self->_sessionType;
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (NSNumber)sessionCount
{
  return self->_sessionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCount, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
}

@end
