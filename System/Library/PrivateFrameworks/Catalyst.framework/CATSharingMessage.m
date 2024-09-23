@implementation CATSharingMessage

- (CATSharingMessage)initWithContentMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CATSharingMessage *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "messageType");
  objc_msgSend(v4, "dictionaryValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CATSharingMessage initWithMessageType:contentDictionary:](self, "initWithMessageType:contentDictionary:", v5, v6);
  return v7;
}

- (CATSharingMessage)initWithMessageType:(int64_t)a3 contentDictionary:(id)a4
{
  id v6;
  CATSharingMessage *v7;
  CATSharingMessage *v8;
  uint64_t v9;
  NSDictionary *contentDictionaryValue;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSharingMessage;
  v7 = -[CATSharingMessage init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_messageType = a3;
    v9 = objc_msgSend(v6, "copy");
    contentDictionaryValue = v8->_contentDictionaryValue;
    v8->_contentDictionaryValue = (NSDictionary *)v9;

  }
  return v8;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("SharingMessageType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATSharingMessage messageType](self, "messageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("SharingMessageContent");
  v8[0] = v3;
  -[CATSharingMessage contentDictionaryValue](self, "contentDictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharingMessageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharingMessageContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageType:contentDictionary:", v8, v11);
  }
  else
  {
    if (_CATLogGeneral_onceToken_18 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_18, &__block_literal_global_27);
    v13 = (void *)_CATLogGeneral_logObj_18;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_18, OS_LOG_TYPE_ERROR))
      +[CATSharingMessage instanceWithDictionary:].cold.1(v13, (objc_class *)a1, (uint64_t)v4);
    v12 = 0;
  }

  return v12;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSDictionary)contentDictionaryValue
{
  return self->_contentDictionaryValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDictionaryValue, 0);
}

+ (void)instanceWithDictionary:(uint64_t)a3 .cold.1(void *a1, objc_class *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_209592000, v5, OS_LOG_TYPE_ERROR, "%{public}@ is unable to decode contentDictionary from parent: %{public}@.", (uint8_t *)&v7, 0x16u);

}

@end
