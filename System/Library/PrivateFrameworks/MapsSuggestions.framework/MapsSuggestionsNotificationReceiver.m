@implementation MapsSuggestionsNotificationReceiver

- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;
  void *__p[2];
  char v18;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsNotificationReceiver;
  v10 = -[MapsSuggestionsNotificationReceiver init](&v16, sel_init);
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__MapsSuggestionsNotificationReceiver_initWithDarwinNotification_queue_block___block_invoke;
    v14[3] = &unk_1E4BDF568;
    v15 = v9;
    v11 = _Block_copy(v14);
    v12 = operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
    MSg::NotificationReceiver::NotificationReceiver(v12, (__int128 *)__p, v8, v11);
    if (v18 < 0)
      operator delete(__p[0]);
    std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)v10 + 1, v12);

  }
  return (MapsSuggestionsNotificationReceiver *)v10;
}

void __78__MapsSuggestionsNotificationReceiver_initWithDarwinNotification_queue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  MapsSuggestionsNotification *v4;

  v4 = -[MapsSuggestionsNotification initWithCppNotification:]([MapsSuggestionsNotification alloc], "initWithCppNotification:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, MapsSuggestionsNotification *))(v3 + 16))(v3, v4);

}

- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 block:(id)a4
{
  NSObject *v7;
  id v8;
  dispatch_queue_t v9;
  MapsSuggestionsNotificationReceiver *v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a4;
  v9 = dispatch_queue_create("MapsSuggestionsNotificationReceiver", v7);
  v10 = -[MapsSuggestionsNotificationReceiver initWithDarwinNotification:queue:block:](self, "initWithDarwinNotification:queue:block:", a3, v9, v8);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_receiver, 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsNotificationReceiver;
  -[MapsSuggestionsNotificationReceiver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_receiver, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
