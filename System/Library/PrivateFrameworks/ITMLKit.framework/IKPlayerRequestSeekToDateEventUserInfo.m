@implementation IKPlayerRequestSeekToDateEventUserInfo

- (IKPlayerRequestSeekToDateEventUserInfo)initWithRequestDate:(id)a3 currentDate:(id)a4
{
  id v7;
  id v8;
  IKPlayerRequestSeekToDateEventUserInfo *v9;
  IKPlayerRequestSeekToDateEventUserInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKPlayerRequestSeekToDateEventUserInfo;
  v9 = -[IKPlayerRequestSeekToDateEventUserInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedDate, a3);
    objc_storeStrong((id *)&v10->_currentDate, a4);
    v10->_shouldSeek = 1;
    objc_storeStrong((id *)&v10->_proposedDate, a3);
  }

  return v10;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requestedDate, CFSTR("requestedDate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_currentDate, CFSTR("currentDate"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  NSDate *v5;
  NSDate *proposedDate;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isNull"))
  {
    self->_shouldSeek = 0;
  }
  else if (objc_msgSend(v7, "isBoolean"))
  {
    self->_shouldSeek = objc_msgSend(v7, "toBool");
  }
  else if (objc_msgSend(v7, "isDate"))
  {
    objc_msgSend(v7, "toDate");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    proposedDate = self->_proposedDate;
    self->_proposedDate = v5;

  }
}

- (NSDate)requestedDate
{
  return self->_requestedDate;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (BOOL)shouldSeek
{
  return self->_shouldSeek;
}

- (NSDate)proposedDate
{
  return self->_proposedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedDate, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_requestedDate, 0);
}

@end
