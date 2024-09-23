@implementation DAPlatform_iOS_Swift

+ (id)sharedInstance
{
  if (qword_10016E950[0] != -1)
    dispatch_once(qword_10016E950, &stru_100133B68);
  return (id)qword_10016E948;
}

- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  dispatch_semaphore_t v26;
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002E434;
  v22[3] = &unk_100133BE0;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = dispatch_semaphore_create(0);
  v27 = v14;
  v28 = v15;
  v16 = v14;
  v17 = v15;
  v18 = v26;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

}

@end
