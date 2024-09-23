@implementation TKTokenWatcherTokenInfo

- (TKTokenWatcherTokenInfo)initWithTokenInfo:(id)a3
{
  id v4;
  TKTokenWatcherTokenInfo *v5;
  uint64_t v6;
  NSString *tokenID;
  void *v8;
  uint64_t v9;
  NSString *driverName;
  void *v11;
  uint64_t v12;
  NSString *slotName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKTokenWatcherTokenInfo;
  v5 = -[TKTokenWatcherTokenInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    tokenID = v5->_tokenID;
    v5->_tokenID = (NSString *)v6;

    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v9 = objc_claimAutoreleasedReturnValue();
        driverName = v5->_driverName;
        v5->_driverName = (NSString *)v9;
      }
      else
      {
        driverName = v5->_driverName;
        v5->_driverName = 0;
      }

      if ((unint64_t)objc_msgSend(v4, "count") >= 3)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
          v12 = objc_claimAutoreleasedReturnValue();
          slotName = v5->_slotName;
          v5->_slotName = (NSString *)v12;
        }
        else
        {
          slotName = v5->_slotName;
          v5->_slotName = 0;
        }

      }
    }
  }

  return v5;
}

- (NSString)tokenID
{
  return self->_tokenID;
}

- (NSString)slotName
{
  return self->_slotName;
}

- (NSString)driverName
{
  return self->_driverName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
}

@end
