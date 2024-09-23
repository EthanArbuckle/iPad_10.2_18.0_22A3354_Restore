@implementation NEFilterExtensionProviderContext

- (OS_dispatch_queue)queue
{
  NEFilterExtensionProviderContext *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("NEFilterExtensionProviderContext queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  objc_sync_exit(v2);

  return v2->_queue;
}

- (NSString)description
{
  return self->_description;
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilterConfiguration:", v9);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Extension: %@]"), v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v10);

  }
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  -[NEExtensionProviderContext startWithOptions:completionHandler:](self, "startWithOptions:completionHandler:", 0, a4);
}

- (void)stopWithReason:(int)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  NEFilterExtensionProviderContext *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2080;
    v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  if (self && (a3 - 1) <= 0x28)
    v7 = qword_19BED5F68[a3 - 1];
  else
    v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_1E3CC1388;
  v9 = a3;
  v8[4] = self;
  objc_msgSend(v5, "stopFilterWithReason:completionHandler:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  v2 = *(unsigned int *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)NEFilterExtensionProviderContext;
  objc_msgSendSuper2(&v4, sel_stopWithReason_, v2);
  return objc_msgSend(*(id *)(a1 + 32), "dispose");
}

@end
