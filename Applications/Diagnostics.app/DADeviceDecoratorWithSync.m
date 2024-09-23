@implementation DADeviceDecoratorWithSync

+ (id)decorateDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v4);

  return v5;
}

- (DADeviceDecoratorWithSync)initWithDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_original, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "state"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_deviceStateDidChange:", CFSTR("com.apple.Diagnostics.deviceStateChangedNotification"), v8);

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  DADeviceDecoratorWithSync *v10;
  DADeviceDecoratorWithSync *v11;
  DADeviceDecoratorWithSync *v12;
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fast forwarding %@ to %@", (uint8_t *)&v14, 0x16u);

  }
  v10 = (DADeviceDecoratorWithSync *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Slow forwarding %@ to %@", (uint8_t *)&v11, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v4, "invokeWithTarget:", v10);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "methodSignatureForSelector:", a3));

  return v5;
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    isKindOfClass = objc_opt_isKindOfClass(v5, a3);

  }
  return isKindOfClass & 1;
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  _BOOL4 v8;
  void (**v11)(id, __CFString *, id);
  id v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSNumber *v25;
  void *v26;
  __CFString *v27;
  id v28;

  v8 = a6;
  v28 = a3;
  v11 = (void (**)(id, __CFString *, id))a7;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync destination](self, "destination"));
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v15 = CFSTR("messageReceived");
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("wakeDevice")))
    {
      if (-[DADeviceDecoratorWithSync _isDeviceLocked](self, "_isDeviceLocked"))
      {
        v16 = off_100133740;
LABEL_19:
        v27 = *v16;

        v22 = 0;
        v15 = v27;
        goto LABEL_20;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "state"));
      if (objc_msgSend(v18, "phase") == (id)1)
      {

LABEL_14:
        -[DADeviceDecoratorWithSync start](self, "start");
        goto LABEL_15;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "state"));
      v21 = objc_msgSend(v20, "phase");

      if (!v21)
        goto LABEL_14;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("endDevice")))
    {
      -[DADeviceDecoratorWithSync end](self, "end");
    }
    else
    {
      if (!objc_msgSend(v28, "isEqualToString:", CFSTR("idleDevice")))
      {
        if (!objc_msgSend(v28, "isEqualToString:", CFSTR("requestDeviceState")))
        {
          v16 = off_100133748;
          goto LABEL_19;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "state"));
        v22 = objc_msgSend(v24, "copy");

        v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        objc_msgSend(v22, "setTimestamp:", v26);

LABEL_20:
        if (v8)
          v11[2](v11, v15, v22);

        goto LABEL_23;
      }
      -[DADeviceDecoratorWithSync idle](self, "idle");
    }
LABEL_15:
    v22 = 0;
    goto LABEL_20;
  }
  if (v8)
    v11[2](v11, CFSTR("destinationMismatch"), 0);
LABEL_23:

}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v2, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v2, "idle");

}

- (void)suspendTests
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v2, "suspendTests");

}

- (void)resumeTests
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v2, "resumeTests");

}

- (void)end
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  objc_msgSend(v2, "end");

}

- (void)_syncState:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSNumber *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  DADeviceDecoratorWithSync *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  if (-[DADeviceDecoratorWithSync _isDeviceLocked](self, "_isDeviceLocked"))
  {
    v5 = DiagnosticLogHandleForCategory(7);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is locked. Will not sync device state: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = objc_msgSend(v4, "copy");
    v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "setTimestamp:", v9);

    global_queue = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002DE30;
    v12[3] = &unk_1001328B0;
    v13 = v7;
    v14 = self;
    v6 = v7;
    dispatch_async(v11, v12);

  }
}

- (void)_deviceStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v5 = v12;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("info")));

    v5 = v12;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("info")));

      v10 = objc_opt_class(DADeviceStateChangeNotificationInfo);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));
        -[DADeviceDecoratorWithSync _syncState:](self, "_syncState:", v11);

      }
      v5 = v12;
    }
  }

}

- (BOOL)_isDeviceLocked
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v7[2];

  v2 = MKBGetDeviceLockState(0, a2);
  v3 = DiagnosticLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current device lock state: %i", (uint8_t *)v7, 8u);
  }

  return v2 == -1 || (v2 - 1) < 2;
}

- (DAIDSMessageSender)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (DADevice)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
  objc_storeStrong((id *)&self->_original, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
}

@end
