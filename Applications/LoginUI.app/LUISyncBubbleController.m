@implementation LUISyncBubbleController

- (LUISyncBubbleController)init
{
  LUISyncBubbleController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *syncBubbleQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUISyncBubbleController;
  v2 = -[LUISyncBubbleController init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.LoginUI.syncBubbleQueue", 0);
    syncBubbleQueue = v2->_syncBubbleQueue;
    v2->_syncBubbleQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)scheduleSyncBubbleTerminationForUser:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  LUISyncBubbleController *v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trying to stop sync bubble for user: %@", buf, 0xCu);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[LUISyncBubbleController syncBubbleQueue](self, "syncBubbleQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019320;
  v8[3] = &unk_100068C30;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)waitUntilSyncBubbleIsTerminatedForUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  LUISyncBubbleController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[LUISyncBubbleController syncBubbleQueue](self, "syncBubbleQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000195FC;
  block[3] = &unk_100069548;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_queue_terminateBubbleForID:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  int v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Terminating sync bubble for session ID: %d", buf, 8u);
  }
  -[LUISyncBubbleController setCurrentBubbleUID:](self, "setCurrentBubbleUID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019954;
  v10[3] = &unk_100069330;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "terminateSyncWithCompletionHandler:", v10);

}

- (OS_dispatch_queue)syncBubbleQueue
{
  return self->_syncBubbleQueue;
}

- (void)setSyncBubbleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncBubbleQueue, a3);
}

- (int)currentBubbleUID
{
  return self->_currentBubbleUID;
}

- (void)setCurrentBubbleUID:(int)a3
{
  self->_currentBubbleUID = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_syncBubbleQueue, 0);
}

@end
