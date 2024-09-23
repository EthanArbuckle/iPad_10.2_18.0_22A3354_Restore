@implementation FCTodayFeedConfigCKResult

- (NSDictionary)recordsByType
{
  return self->_recordsByType;
}

- (NSData)configData
{
  return self->_configData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByType, 0);
  objc_storeStrong((id *)&self->_configData, 0);
}

- (FCTodayFeedConfigCKResult)initWithRecordsByType:(id)a3
{
  id v5;
  FCTodayFeedConfigCKResult *v6;
  FCTodayFeedConfigCKResult *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *configData;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCTodayFeedConfigCKResult;
  v6 = -[FCTodayFeedConfigCKResult init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recordsByType, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470A9E8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onlyRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "todayFeedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = objc_claimAutoreleasedReturnValue();
    configData = v7->_configData;
    v7->_configData = (NSData *)v11;

  }
  return v7;
}

@end
