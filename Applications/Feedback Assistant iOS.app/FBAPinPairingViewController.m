@implementation FBAPinPairingViewController

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAPinPairingViewController;
  -[FBAPinPairingViewController awakeFromNib](&v5, "awakeFromNib");
  -[FBAPinPairingViewController setContext:](self, "setContext:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FBAPinPairingViewController;
  -[FBAPinPairingViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  if ((id)-[FBAPinPairingViewController context](self, "context") == (id)1)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "didCancel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  }
  self->_failCount = 0;
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10003BA20;
  v9 = &unk_1000E7740;
  objc_copyWeak(&v10, &location);
  -[FBAPINEntryView setTextChangedHandler:](self->_pinEntryView, "setTextChangedHandler:", &v6);
  -[FBAPINEntryView becomeFirstResponder](self->_pinEntryView, "becomeFirstResponder", v6, v7, v8, v9);
  -[FBAPinPairingViewController showPINEntryUIWithFlags:](self, "showPINEntryUIWithFlags:", 2);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[FBAPINEntryView setTextChangedHandler:](self->_pinEntryView, "setTextChangedHandler:", 0);
  v5.receiver = self;
  v5.super_class = (Class)FBAPinPairingViewController;
  -[FBAPinPairingViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)didCancel
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController device](self, "device"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("FBAPinPairingViewControllerDidCancel"), v3);

}

- (void)tryPin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10009AE8C(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController device](self, "device"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003BC10;
  v8[3] = &unk_1000E7768;
  v8[4] = self;
  objc_msgSend(v6, "tryPairingDevice:withPin:completion:", v7, v4, v8);

}

- (void)showPINEntryUIWithFlags:(unsigned int)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  UILabel **p_infoLabel;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  if ((a3 & 1) != 0)
  {
    ++self->_failCount;
    -[FBAPINEntryView shake](self->_pinEntryView, "shake");
    if (self->_failCount >= 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PAIR_RETRY_PIN"), &stru_1000EA660, 0));
      p_infoLabel = &self->_infoLabel;
      -[UILabel setText:](self->_infoLabel, "setText:", v13);

      v11 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
LABEL_9:
      v14 = (void *)v11;
      -[UILabel setTextColor:](*p_infoLabel, "setTextColor:", v11);

    }
  }
  else if ((a3 & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController platform](self, "platform"));
    v5 = objc_msgSend(v4, "isEqualToString:", DEDDevicePlatformTV);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5)
      v8 = CFSTR("PAIR_ENTER_PIN_TV");
    else
      v8 = CFSTR("PAIR_ENTER_PIN");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1000EA660, 0));
    p_infoLabel = &self->_infoLabel;
    -[UILabel setText:](self->_infoLabel, "setText:", v9);

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    goto LABEL_9;
  }
  -[FBAPINEntryView setText:](self->_pinEntryView, "setText:", &stru_1000EA660);
}

- (void)showPINEntryUIWithFlags:(unsigned int)a3 inThrottleSeconds:(float)a4
{
  dispatch_time_t v6;
  _QWORD v7[5];
  unsigned int v8;

  v6 = dispatch_time(0, (uint64_t)(float)(a4 * 1000000000.0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BE74;
  v7[3] = &unk_1000E7790;
  v7[4] = self;
  v8 = a3;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (id)platform
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPinPairingViewController device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platform"));

  v4 = (void *)DEDDevicePlatformTV;
  if ((objc_msgSend(v3, "isEqualToString:", DEDDevicePlatformTV) & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing to device with usupported/unknown platform.", v8, 2u);
    }

  }
  v6 = v4;

  return v6;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pinEntryView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end
