@implementation DADeviceDecoratorWithUI

+ (id)decorateWithDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v4);

  return v5;
}

- (DADeviceDecoratorWithUI)initWithDevice:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  DSHardwareButtonEventMonitor *v8;
  DSHardwareButtonEventMonitor *buttonEventMonitor;

  objc_storeStrong((id *)&self->_original, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](DATestQueue, "testQueueWithDelegate:", self));
  -[DADeviceMaterialized setTestQueue:](self->_original, "setTestQueue:", v6);

  v8 = (DSHardwareButtonEventMonitor *)objc_opt_new(DSHardwareButtonEventMonitor, v7);
  buttonEventMonitor = self->_buttonEventMonitor;
  self->_buttonEventMonitor = v8;

  self->_ignoreButtonEvents = 0;
  return self;
}

- (DADeviceWithUIDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (DADeviceWithUIDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  DADeviceDecoratorWithUI *v10;
  DADeviceDecoratorWithUI *v11;
  DADeviceDecoratorWithUI *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v5 = DiagnosticLogHandleForCategory(10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fast forwarding %@ to %@", (uint8_t *)&v14, 0x16u);

  }
  v10 = (DADeviceDecoratorWithUI *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  if ((objc_opt_respondsToSelector(v10, a3) & 1) != 0)
    v11 = v10;
  else
    v11 = self;
  v12 = v11;

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Slow forwarding %@ to %@", (uint8_t *)&v11, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v4, "invokeWithTarget:", v10);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DADeviceDecoratorWithUI;
  v5 = -[DADeviceDecoratorWithUI methodSignatureForSelector:](&v9, "methodSignatureForSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "methodSignatureForSelector:", a3));

  }
  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v5;
  char isKindOfClass;

  if ((Class)objc_opt_class(self) == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    isKindOfClass = objc_opt_isKindOfClass(v5, a3);

  }
  return isKindOfClass & 1;
}

- (void)setViewControllerDelegate:(id)a3
{
  DKViewControllerDelegate **p_viewControllerDelegate;
  id v5;
  id v6;

  p_viewControllerDelegate = &self->_viewControllerDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_viewControllerDelegate, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "setViewControllerDelegate:", v5);

}

- (void)setVolumeHUDResponder:(id)a3
{
  DKVolumeHUDResponder **p_volumeHUDResponder;
  id v5;
  id v6;

  p_volumeHUDResponder = &self->_volumeHUDResponder;
  v5 = a3;
  objc_storeWeak((id *)p_volumeHUDResponder, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "setVolumeHUDResponder:", v5);

}

- (void)setBrightnessResponder:(id)a3
{
  DKBrightnessResponder **p_brightnessResponder;
  id v5;
  id v6;

  p_brightnessResponder = &self->_brightnessResponder;
  v5 = a3;
  objc_storeWeak((id *)p_brightnessResponder, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "setBrightnessResponder:", v5);

}

- (void)setUserAlertResponder:(id)a3
{
  DKUserAlertResponder **p_userAlertResponder;
  id v5;
  id v6;

  p_userAlertResponder = &self->_userAlertResponder;
  v5 = a3;
  objc_storeWeak((id *)p_userAlertResponder, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "setUserAlertResponder:", v5);

}

- (void)setStatusBarResponder:(id)a3
{
  DKStatusBarResponder **p_statusBarResponder;
  id v5;
  id v6;

  p_statusBarResponder = &self->_statusBarResponder;
  v5 = a3;
  objc_storeWeak((id *)p_statusBarResponder, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "setStatusBarResponder:", v5);

}

- (void)connect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v2, "connect");

}

- (void)start
{
  void *v3;
  id v4;
  id v5;

  BKSDisplayBrightnessGetCurrent(self, a2);
  -[DADeviceDecoratorWithUI setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)DSHardwareButtonEventMonitor);
    -[DADeviceDecoratorWithUI setButtonEventMonitor:](self, "setButtonEventMonitor:", v4);

  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v5, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v2, "idle");

}

- (void)suspendTests
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v2, "suspendTests");

}

- (void)resumeTests
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  objc_msgSend(v2, "resumeTests");

}

- (void)end
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C8B0;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  v8 = objc_opt_respondsToSelector(v7, "requestSuiteStart:completionHandler:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    objc_msgSend(v9, "requestSuiteStart:completionHandler:", v10, v6);

  }
}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  v5 = objc_opt_respondsToSelector(v4, "requestSuiteFinishWithCompletionHandler:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    objc_msgSend(v6, "requestSuiteFinishWithCompletionHandler:", v7);

  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = DiagnosticLogHandleForCategory(10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[DADeviceDecoratorWithUI executeTestWithTestAttributes:parameters:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI delegate](self, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v15 = objc_msgSend(v8, "isHeadless");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002CBFC;
  v19[3] = &unk_100133AE0;
  objc_copyWeak(&v23, (id *)buf);
  v19[4] = self;
  v16 = v8;
  v20 = v16;
  v17 = v9;
  v21 = v17;
  v18 = v10;
  v22 = v18;
  objc_msgSend(v13, "device:shouldStartTestWithTestId:fullscreen:response:", self, v14, v15 ^ 1, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (void)testViewPresented:(id)a3
{
  -[DADeviceDecoratorWithUI setIgnoreButtonEvents:](self, "setIgnoreButtonEvents:", 0);
}

- (void)handleButtonEvent:(unint64_t)a3
{
  uint64_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id location;

  if (!-[DADeviceDecoratorWithUI ignoreButtonEvents](self, "ignoreButtonEvents"))
  {
    if ((uint64_t)a3 >= 0x8000)
    {
      if ((uint64_t)a3 >= 0x200000)
      {
        if ((uint64_t)a3 > 0x7FFFFFF)
        {
          if (a3 == 0x20000000)
            goto LABEL_25;
          v5 = 0x8000000;
        }
        else
        {
          if (a3 == 0x200000)
            goto LABEL_25;
          v5 = 0x2000000;
        }
        if (a3 != v5)
          return;
LABEL_25:
        objc_initWeak(&location, self);
        global_queue = dispatch_get_global_queue(0, 0);
        v7 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002CFAC;
        block[3] = &unk_100133B08;
        block[4] = self;
        objc_copyWeak(&v9, &location);
        dispatch_async(v7, block);

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
        return;
      }
      if (a3 == 0x8000 || a3 == 0x20000 || a3 == 0x80000)
        goto LABEL_25;
    }
    else
    {
      if ((uint64_t)a3 <= 127)
      {
        if (a3 > 0x20 || ((1 << a3) & 0x100000114) == 0)
          return;
        goto LABEL_25;
      }
      if ((uint64_t)a3 > 2047)
      {
        if (a3 == 2048 || a3 == 0x2000)
          goto LABEL_25;
      }
      else if (a3 == 128 || a3 == 512)
      {
        goto LABEL_25;
      }
    }
  }
}

- (void)_startInterceptingButtonEvents
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D194;
  v4[3] = &unk_100132950;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "startWithPriority:completion:", 26, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_reset
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.Diagnostics.DKViewControllerPresented"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002D2F0;
    v7[3] = &unk_100132838;
    v7[4] = self;
    objc_msgSend(v5, "stopWithCompletion:", v7);

  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D330;
  v6[3] = &unk_100132838;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (DKVolumeHUDResponder)volumeHUDResponder
{
  return (DKVolumeHUDResponder *)objc_loadWeakRetained((id *)&self->_volumeHUDResponder);
}

- (DKBrightnessResponder)brightnessResponder
{
  return (DKBrightnessResponder *)objc_loadWeakRetained((id *)&self->_brightnessResponder);
}

- (DKUserAlertResponder)userAlertResponder
{
  return (DKUserAlertResponder *)objc_loadWeakRetained((id *)&self->_userAlertResponder);
}

- (DKStatusBarResponder)statusBarResponder
{
  return (DKStatusBarResponder *)objc_loadWeakRetained((id *)&self->_statusBarResponder);
}

- (DKViewControllerDelegate)viewControllerDelegate
{
  return (DKViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, a3);
}

- (DADeviceMaterialized)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
  objc_storeStrong((id *)&self->_original, a3);
}

- (BOOL)ignoreButtonEvents
{
  return self->_ignoreButtonEvents;
}

- (void)setIgnoreButtonEvents:(BOOL)a3
{
  self->_ignoreButtonEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_destroyWeak((id *)&self->_statusBarResponder);
  objc_destroyWeak((id *)&self->_userAlertResponder);
  objc_destroyWeak((id *)&self->_brightnessResponder);
  objc_destroyWeak((id *)&self->_volumeHUDResponder);
}

@end
