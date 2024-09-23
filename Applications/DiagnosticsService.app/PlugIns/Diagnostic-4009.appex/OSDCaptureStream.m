@implementation OSDCaptureStream

- (OSDCaptureStream)initWithStream:(OpaqueFigCaptureStream *)a3
{
  OSDCaptureStream *v4;
  OSDCaptureStream *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSDCaptureStream;
  v4 = -[OSDCaptureStream init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    if (!a3)
      sub_10000A914();
    v4->_streamRef = a3;
    CFRetain(a3);
    v6 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.OSDCaptureDevice.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[OSDCaptureStream teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureStream;
  -[OSDCaptureStream dealloc](&v3, "dealloc");
}

- (void)teardown
{
  OpaqueFigCaptureStream *streamRef;

  streamRef = self->_streamRef;
  if (streamRef)
  {
    CFRelease(streamRef);
    self->_streamRef = 0;
  }
}

- (id)name:(id *)a3
{
  return -[OSDPropertyBasedDevice copyProperty:error:](self, "copyProperty:error:", kFigCaptureStreamProperty_PortType, a3);
}

- (void)backingRef
{
  return self->_streamRef;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, __CFString *, void *);

  FigBaseObject = FigCaptureStreamGetFigBaseObject(self->_streamRef, a2);
  v7 = *(uint64_t (**)(uint64_t, __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    return v7(FigBaseObject, a3, a4);
  else
    return -12782;
}

- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, __CFString *, const CFAllocatorRef, const void **);

  FigBaseObject = FigCaptureStreamGetFigBaseObject(self->_streamRef, a2);
  v7 = *(uint64_t (**)(uint64_t, __CFString *, const CFAllocatorRef, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
  if (v7)
    return v7(FigBaseObject, a3, kCFAllocatorDefault, a4);
  else
    return -12782;
}

- (BOOL)_registerForStreamNotifications:(id *)a3
{
  uint64_t DefaultLocalCenter;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  OSDCaptureStream *v15;

  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(self, a2);
  v6 = kFigCaptureStreamNotification_Discontinuity;
  v7 = CMNotificationCenterAddListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_Discontinuity, -[OSDCaptureStream streamRef](self, "streamRef"), 0);
  v8 = v7 == 0;
  if (v7)
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to register for stream notification. Cannot add listener for %@"), self, v6);
  v9 = kFigCaptureStreamNotification_StreamStarted;
  if (CMNotificationCenterAddListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_StreamStarted, -[OSDCaptureStream streamRef](self, "streamRef"), 0))
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to register for stream notification. Cannot add listener for %@"), self, v9);
    v8 = 0;
  }
  v10 = kFigCaptureStreamNotification_StreamStopped;
  if (CMNotificationCenterAddListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_StreamStopped, -[OSDCaptureStream streamRef](self, "streamRef"), 0))
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to register for stream notification. Cannot add listener for %@"), self, v10);
    return 0;
  }
  if (!v8)
    return 0;
  v11 = DiagnosticLogHandleForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully added stream notifications to %@", buf, 0xCu);
  }

  return 1;
}

- (BOOL)_unregisterForStreamNotifications:(id *)a3
{
  uint64_t DefaultLocalCenter;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  OSDCaptureStream *v15;

  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(self, a2);
  v6 = kFigCaptureStreamNotification_Discontinuity;
  v7 = CMNotificationCenterRemoveListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_Discontinuity, -[OSDCaptureStream streamRef](self, "streamRef"));
  v8 = v7 == 0;
  if (v7)
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to unregister for stream notification. Cannot remove listener for %@"), self, v6);
  v9 = kFigCaptureStreamNotification_StreamStarted;
  if (CMNotificationCenterRemoveListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_StreamStarted, -[OSDCaptureStream streamRef](self, "streamRef")))
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to unregister for stream notification. Cannot remove listener for %@"), self, v9);
    v8 = 0;
  }
  v10 = kFigCaptureStreamNotification_StreamStopped;
  if (CMNotificationCenterRemoveListener(DefaultLocalCenter, self, sub_1000051CC, kFigCaptureStreamNotification_StreamStopped, -[OSDCaptureStream streamRef](self, "streamRef")))
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@: Failure to unregister for stream notification. Cannot remove listener for %@"), self, v10);
    return 0;
  }
  if (!v8)
    return 0;
  v11 = DiagnosticLogHandleForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully removed stream notifications from %@", buf, 0xCu);
  }

  return 1;
}

- (void)_receivedNotification:(__CFString *)a3 notificationObject:(id)a4 notificationPayload:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[OSDCaptureStream workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054F8;
  block[3] = &unk_1000104D8;
  objc_copyWeak(v12, &location);
  v12[1] = a3;
  dispatch_async(v10, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

- (BOOL)start:(id *)a3
{
  OSDCaptureStream *v4;
  dispatch_semaphore_t v5;
  OpaqueFigCaptureStream *v6;
  uint64_t (*v7)(OpaqueFigCaptureStream *);
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  BOOL v12;

  v4 = self;
  objc_sync_enter(v4);
  if (-[OSDCaptureStream _registerForStreamNotifications:](v4, "_registerForStreamNotifications:", a3))
  {
    v5 = dispatch_semaphore_create(0);
    -[OSDCaptureStream setStreamStartSemaphore:](v4, "setStreamStartSemaphore:", v5);

    v6 = -[OSDCaptureStream streamRef](v4, "streamRef");
    v7 = *(uint64_t (**)(OpaqueFigCaptureStream *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v7)
      v8 = v7(v6);
    else
      v8 = 4294954514;
    v9 = objc_claimAutoreleasedReturnValue(-[OSDCaptureStream streamStartSemaphore](v4, "streamStartSemaphore"));
    v10 = dispatch_time(0, 2000000000);
    v11 = dispatch_semaphore_wait(v9, v10);

    if (v11)
    {
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> timed out trying to start the stream!"), v4);
    }
    else
    {
      if (!(_DWORD)v8)
      {
        -[OSDCaptureStream setStreamStartSemaphore:](v4, "setStreamStartSemaphore:", 0);
        v12 = 1;
        goto LABEL_10;
      }
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> Error %d (0x%08x) cannot start the capture stream!"), v4, v8, v8);
    }
  }
  v12 = 0;
LABEL_10:
  objc_sync_exit(v4);

  return v12;
}

- (BOOL)stop:(id *)a3
{
  OSDCaptureStream *v4;
  dispatch_semaphore_t v5;
  OpaqueFigCaptureStream *v6;
  uint64_t (*v7)(OpaqueFigCaptureStream *);
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  BOOL v12;

  v4 = self;
  objc_sync_enter(v4);
  v5 = dispatch_semaphore_create(0);
  -[OSDCaptureStream setStreamStopSemaphore:](v4, "setStreamStopSemaphore:", v5);

  v6 = -[OSDCaptureStream streamRef](v4, "streamRef");
  v7 = *(uint64_t (**)(OpaqueFigCaptureStream *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v7)
    v8 = v7(v6);
  else
    v8 = 4294954514;
  v9 = objc_claimAutoreleasedReturnValue(-[OSDCaptureStream streamStopSemaphore](v4, "streamStopSemaphore"));
  v10 = dispatch_time(0, 2000000000);
  v11 = dispatch_semaphore_wait(v9, v10);

  if (v11)
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> timed out trying to stop the stream!"), v4);
  if ((_DWORD)v8)
  {
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, CFSTR("%@ >> Error %d (0x%08x) cannot stop the capture stream!"), v4, v8, v8);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if (!-[OSDCaptureStream _unregisterForStreamNotifications:](v4, "_unregisterForStreamNotifications:", a3))
    goto LABEL_10;
  -[OSDCaptureStream setStreamStopSemaphore:](v4, "setStreamStopSemaphore:", 0);
  v12 = 1;
LABEL_11:
  objc_sync_exit(v4);

  return v12;
}

- (OpaqueFigCaptureStream)streamRef
{
  return self->_streamRef;
}

- (OS_dispatch_semaphore)streamStartSemaphore
{
  return self->_streamStartSemaphore;
}

- (void)setStreamStartSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_streamStartSemaphore, a3);
}

- (OS_dispatch_semaphore)streamStopSemaphore
{
  return self->_streamStopSemaphore;
}

- (void)setStreamStopSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_streamStopSemaphore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_streamStopSemaphore, 0);
  objc_storeStrong((id *)&self->_streamStartSemaphore, 0);
}

@end
