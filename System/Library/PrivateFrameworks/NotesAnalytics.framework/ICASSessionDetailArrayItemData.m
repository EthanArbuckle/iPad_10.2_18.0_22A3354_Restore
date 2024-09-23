@implementation ICASSessionDetailArrayItemData

- (ICASSessionDetailArrayItemData)initWithSessionType:(id)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 sessionDuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASSessionDetailArrayItemData *v15;
  ICASSessionDetailArrayItemData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASSessionDetailArrayItemData;
  v15 = -[ICASSessionDetailArrayItemData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionType, a3);
    objc_storeStrong((id *)&v16->_startTimestamp, a4);
    objc_storeStrong((id *)&v16->_endTimestamp, a5);
    objc_storeStrong((id *)&v16->_sessionDuration, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SessionDetailArrayItemData");
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
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("sessionType");
  -[ICASSessionDetailArrayItemData sessionType](self, "sessionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSessionDetailArrayItemData sessionType](self, "sessionType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("startTimestamp");
  -[ICASSessionDetailArrayItemData startTimestamp](self, "startTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASSessionDetailArrayItemData startTimestamp](self, "startTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("endTimestamp");
  -[ICASSessionDetailArrayItemData endTimestamp](self, "endTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASSessionDetailArrayItemData endTimestamp](self, "endTimestamp");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("sessionDuration");
  -[ICASSessionDetailArrayItemData sessionDuration](self, "sessionDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASSessionDetailArrayItemData sessionDuration](self, "sessionDuration");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (ICASSessionType)sessionType
{
  return self->_sessionType;
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
}

@end
