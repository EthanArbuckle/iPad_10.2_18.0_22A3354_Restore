@implementation LUITemporarySessionSupport

+ (id)sharedInstance
{
  if (qword_100088CF8 != -1)
    dispatch_once(&qword_100088CF8, &stru_100068DD0);
  return (id)qword_100088CF0;
}

- (LUITemporarySessionSupport)init
{
  LUITemporarySessionSupport *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LUITemporarySessionSupport;
  v2 = -[LUITemporarySessionSupport init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("LUIAnonymousTemporaryUserSupport Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v2->_isTemporarySessionAllowed = objc_msgSend(v5, "isSharedDeviceTemporarySessionAllowed");

    v2->_isTemporarySessionOnly = +[DMCMultiUserModeUtilities temporarySessionOnly](DMCMultiUserModeUtilities, "temporarySessionOnly");
    v2->_useDynamicQuotaSize = +[DMCMultiUserModeUtilities useDynamicQuotaSize](DMCMultiUserModeUtilities, "useDynamicQuotaSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = MCEffectiveSettingsChangedNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "_updateAnonymousTemporaryUserSetting", v7, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = MCSettingsChangedNotification;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_updateAnonymousTemporaryUserSetting", v10, v11);

  }
  return v2;
}

- (BOOL)isTemporarySessionAllowed
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007064;
  v5[3] = &unk_100068DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTemporarySessionOnly
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007108;
  v5[3] = &unk_100068DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)useDynamicQuotaSize
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000071AC;
  v5[3] = &unk_100068DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateAnonymousTemporaryUserSetting
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007218;
  block[3] = &unk_100068C58;
  block[4] = self;
  dispatch_barrier_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setIsTemporarySessionAllowed:(BOOL)a3
{
  self->_isTemporarySessionAllowed = a3;
}

- (void)setIsTemporarySessionOnly:(BOOL)a3
{
  self->_isTemporarySessionOnly = a3;
}

- (void)setUseDynamicQuotaSize:(BOOL)a3
{
  self->_useDynamicQuotaSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
