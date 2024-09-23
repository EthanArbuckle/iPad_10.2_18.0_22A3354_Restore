@implementation ATXUserEducationSuggestionBaseServer

- (ATXUserEducationSuggestionBaseServer)init
{
  ATXUserEducationSuggestionBaseServer *v2;
  void *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)ATXUserEducationSuggestionBaseServer;
  v2 = -[ATXUserEducationSuggestionBaseServer init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), objc_opt_class(), CFSTR("serialQueue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_context_user_education_suggestions();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[ATXUserEducationSuggestionBaseServer init]";
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: Starting up serial queue: %@", buf, 0x16u);
    }

    v5 = objc_retainAutorelease(v3);
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)performBlockOnInternalSerialQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
