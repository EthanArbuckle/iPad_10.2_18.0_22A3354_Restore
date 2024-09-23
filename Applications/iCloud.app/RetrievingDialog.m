@implementation RetrievingDialog

- (RetrievingDialog)init
{
  RetrievingDialog *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RetrievingDialog;
  result = -[RetrievingDialog init](&v3, "init");
  if (result)
    result->_state = 0;
  return result;
}

- (const)stateName
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  return (&off_1000246D0)[-[RetrievingDialog state](self, "state")];
}

- (void)_dismiss
{
  __CFUserNotification *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = -[RetrievingDialog retrievingNotification](self, "retrievingNotification");
  if (v3)
  {
    CFUserNotificationCancel(v3);
    -[RetrievingDialog setRetrievingNotification:](self, "setRetrievingNotification:", 0);
  }
  -[RetrievingDialog setState:](self, "setState:", 5);
}

- (void)setRetrievingNotification:(__CFUserNotification *)a3
{
  __CFUserNotification *retrievingNotification;

  retrievingNotification = self->_retrievingNotification;
  if (retrievingNotification != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      retrievingNotification = self->_retrievingNotification;
    }
    self->_retrievingNotification = a3;
    if (retrievingNotification)
      CFRelease(retrievingNotification);
  }
}

- (void)abort
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042F4;
  block[3] = &unk_100024660;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_timeoutMinPeriod
{
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  switch(-[RetrievingDialog state](self, "state"))
  {
    case 0:
    case 1:
    case 4:
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RetrievingDialog.m"), 151, CFSTR("Invalid state when retrieving dialog min display timeout happened: %s"), -[RetrievingDialog stateName](self, "stateName"));

      break;
    case 2:
      -[RetrievingDialog setState:](self, "setState:", 4);
      break;
    case 3:
      -[RetrievingDialog _dismiss](self, "_dismiss");
      break;
    default:
      return;
  }
}

- (void)_display
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  CFUserNotificationRef v9;
  void *v10;
  double v11;
  double v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[2];
  _QWORD v19[2];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[RetrievingDialog setState:](self, "setState:", 2);
  v18[0] = kCFUserNotificationAlertHeaderKey;
  v3 = CKLocalizedString(CFSTR("SHARE_ACCEPTANCE_PROGRESS_HEADER"), &stru_100024D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v19[0] = v4;
  v18[1] = kCFUserNotificationDefaultButtonTitleKey;
  v5 = CKLocalizedString(CFSTR("SHARE_ACCEPTANCE_PROGRESS_CANCEL"), &stru_100024D00);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v19[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v7, 0));

  v9 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v8);
  -[RetrievingDialog setRetrievingNotification:](self, "setRetrievingNotification:", v9);
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000046BC;
  v15[3] = &unk_100024688;
  objc_copyWeak(&v16, &location);
  +[CKUserNotificationUtilities showUserNotification:withCompletionBlock:](CKUserNotificationUtilities, "showUserNotification:withCompletionBlock:", v9, v15);
  CFRelease(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](CKBehaviorOptions, "sharedOptions"));
  objc_msgSend(v10, "shareAcceptorRetrievingDialogMinPeriod");
  v12 = v11;

  v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000047E4;
  v14[3] = &unk_100024660;
  v14[4] = self;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)dismissDialog:(id)a3
{
  id v4;

  -[RetrievingDialog _dismiss](self, "_dismiss", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RetrievingDialog delegate](self, "delegate"));
  objc_msgSend(v4, "retrievingDialogCancelled");

}

- (void)_displayIfRequired
{
  void *v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  id v8;
  uint8_t buf[4];
  RetrievingDialog *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  switch(-[RetrievingDialog state](self, "state"))
  {
    case 0:
    case 2:
    case 3:
    case 4:
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RetrievingDialog.m"), 239, CFSTR("Invalid state when considering displaying retrieving dialog: %s"), -[RetrievingDialog stateName](self, "stateName"));

      break;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RetrievingDialog delegate](self, "delegate"));
      v5 = objc_msgSend(v4, "retrievingDialogShouldDisplay");

      if (v5)
      {
        -[RetrievingDialog _display](self, "_display");
      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        v6 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v10 = self;
          v7 = "Not displaying the retrieving dialog: %p as the delegate didn't want it";
          goto LABEL_13;
        }
      }
      break;
    case 5:
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v6 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v10 = self;
        v7 = "Not displaying the retrieving dialog: %p as it got aborted";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
      }
      break;
    default:
      return;
  }
}

- (void)_schedule
{
  void *v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](CKBehaviorOptions, "sharedOptions"));
  objc_msgSend(v4, "shareAcceptorRetrievingDialogDelay");
  v6 = v5;

  if (-[RetrievingDialog state](self, "state"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RetrievingDialog.m"), 248, CFSTR("Unexpected state in retrieving dialog schedule: %s"), -[RetrievingDialog stateName](self, "stateName"));

  }
  -[RetrievingDialog setState:](self, "setState:", 1);
  objc_initWeak(&location, self);
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004BE4;
  block[3] = &unk_1000246B0;
  objc_copyWeak(&v10, &location);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)schedule
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004C9C;
  v2[3] = &unk_1000246B0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int64_t state;
  void *v5;
  __CFUserNotification *retrievingNotification;
  objc_super v7;

  state = self->_state;
  if ((unint64_t)(state - 2) <= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RetrievingDialog.m"), 270, CFSTR("Retrieving dialog currently displayed and then abandoned. Current state: %s"), (&off_1000246D0)[state]);

  }
  retrievingNotification = self->_retrievingNotification;
  if (retrievingNotification)
  {
    CFRelease(retrievingNotification);
    self->_retrievingNotification = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)RetrievingDialog;
  -[RetrievingDialog dealloc](&v7, "dealloc");
}

- (RetrievingDialogDelegate)delegate
{
  return (RetrievingDialogDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__CFUserNotification)retrievingNotification
{
  return self->_retrievingNotification;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
