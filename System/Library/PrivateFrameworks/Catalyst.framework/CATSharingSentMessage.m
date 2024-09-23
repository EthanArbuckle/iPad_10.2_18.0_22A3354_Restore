@implementation CATSharingSentMessage

- (CATSharingSentMessage)initWithContent:(id)a3
{
  id v5;
  CATSharingSentMessage *v6;
  uint64_t v7;
  NSData *content;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingSentMessage.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CATSharingSentMessage;
  v6 = -[CATSharingSentMessage init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    content = v6->_content;
    v6->_content = (NSData *)v7;

  }
  return v6;
}

- (int64_t)messageType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("SharingSendMessageContent");
  -[CATSharingSentMessage content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharingSendMessageContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContent:", v7);
  }
  else
  {
    if (_CATLogGeneral_onceToken_3 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_3, &__block_literal_global_5);
    v9 = (void *)_CATLogGeneral_logObj_3;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_3, OS_LOG_TYPE_ERROR))
      +[CATSharingSentMessage instanceWithDictionary:].cold.1(v9, (objc_class *)a1, (uint64_t)v4);
    v8 = 0;
  }

  return v8;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
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
  _os_log_error_impl(&dword_209592000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to initialize, data is missing from %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
