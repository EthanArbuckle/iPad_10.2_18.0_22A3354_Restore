@implementation CNGeminiResult

- (CNGeminiResult)initWithChannel:(id)a3 usage:(int64_t)a4 availableChannels:(id)a5
{
  id v9;
  id v10;
  CNGeminiResult *v11;
  NSObject *v12;
  uint64_t v13;
  NSArray *availableChannels;
  CNGeminiResult *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNGeminiResult;
  v11 = -[CNGeminiResult init](&v17, sel_init);
  if (v11)
  {
    if (!v9)
    {
      if (CNGuardOSLog_cn_once_token_0_0 != -1)
        dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_301);
      v12 = CNGuardOSLog_cn_once_object_0_0;
      if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
        -[CNGeminiResult initWithChannel:usage:availableChannels:].cold.1(v12);
    }
    objc_storeStrong((id *)&v11->_channel, a3);
    v11->_usage = a4;
    v13 = objc_msgSend(v10, "copy");
    availableChannels = v11->_availableChannels;
    v11->_availableChannels = (NSArray *)v13;

    v15 = v11;
  }

  return v11;
}

- (CNGeminiResult)init
{
  CNGeminiResult *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiResult)initWithCoder:(id)a3
{
  id v4;
  CNGeminiResult *v5;
  uint64_t v6;
  CNGeminiChannel *channel;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *availableChannels;
  CNGeminiResult *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNGeminiResult;
  v5 = -[CNGeminiResult init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channel"));
    v6 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (CNGeminiChannel *)v6;

    v5->_usage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_usage"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_availableChannels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    availableChannels = v5->_availableChannels;
    v5->_availableChannels = (NSArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CNGeminiChannel *channel;
  id v5;

  channel = self->_channel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", channel, CFSTR("_channel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_usage, CFSTR("_usage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableChannels, CFSTR("_availableChannels"));

}

- (CNGeminiChannel)channel
{
  return self->_channel;
}

- (int64_t)usage
{
  return self->_usage;
}

- (NSArray)availableChannels
{
  return self->_availableChannels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableChannels, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)initWithChannel:(os_log_t)log usage:availableChannels:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "parameter ‘channel’ must be nonnull", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
