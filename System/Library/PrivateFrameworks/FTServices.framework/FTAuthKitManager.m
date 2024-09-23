@implementation FTAuthKitManager

+ (id)sharedInstance
{
  if (qword_1ECF9D830 != -1)
    dispatch_once(&qword_1ECF9D830, &unk_1E4DD9450);
  return (id)qword_1ECF9D878;
}

- (FTAuthKitManager)init
{
  FTAuthKitManager *v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  AKAppleIDSession *akAppleIDSession;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FTAuthKitManager;
  v2 = -[FTAuthKitManager init](&v12, sel_init);
  if (v2)
  {
    qword_1ECF9D6C8 = MEMORY[0x1A85A5DE0](CFSTR("AKAppleIDSession"), CFSTR("AuthKit"));
    v3 = objc_alloc((Class)qword_1ECF9D6C8);
    IMGetMainBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend_initWithIdentifier_(v3, v5, (uint64_t)v4);
    akAppleIDSession = v2->_akAppleIDSession;
    v2->_akAppleIDSession = (AKAppleIDSession *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.ids.ftauthkitmanager", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)anisetteHeadersForRequest:(id)a3 completionBlockQueue:(id)a4 completionBlock:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *queue;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = (void *)objc_msgSend_copy(a3, v9, v10);
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A4C95400;
    v15[3] = &unk_1E4DD9AF0;
    v15[4] = self;
    v16 = v12;
    v17 = v8;
    v18 = v11;
    v14 = v12;
    dispatch_async(queue, v15);

  }
}

- (void)handleResponse:(id)a3 forRequest:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A4C95738;
    v12[3] = &unk_1E4DD9AF0;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(queue, v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_akAppleIDSession, 0);
}

@end
