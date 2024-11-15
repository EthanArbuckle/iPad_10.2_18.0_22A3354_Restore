@implementation CameraKitHubClassSetupPortNotificationHandlerHelper

void ____CameraKitHubClassSetupPortNotificationHandlerHelper_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  NSObject *v15;
  kern_return_t ChildEntry;
  kern_return_t v17;
  kern_return_t v18;
  NSObject *v19;
  kern_return_t v20;
  id v21;
  const char *v22;
  id v23;
  __CFRunLoop *Main;
  IONotificationPort *v25;
  __CFRunLoopSource *RunLoopSource;
  id v27;
  const char *v28;
  id v29;
  NSObject *v30;
  uint32_t v31;
  id v32;
  id v33;
  io_registry_entry_t child;
  io_object_t notification;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  kern_return_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  notification = -1431655766;
  if ((_DWORD)v2 == 3)
  {
    if (objc_msgSend(v3, "ioUSB30CameraKitHubService"))
    {
      if (gLogObjects)
        v6 = gNumLogObjects < 1;
      else
        v6 = 1;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v15 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      else
      {
        v15 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v37 = 3;
        v38 = 1024;
        v39 = objc_msgSend(v4, "ioUSB30CameraKitHubService");
        _os_log_impl(&dword_2171EA000, v15, OS_LOG_TYPE_INFO, "__CameraKitHubClassSetupPortNotificationHandler: pRefCon=%x ioUSB30CameraKitHubService=%d", buf, 0xEu);
      }

      child = -1431655766;
      ChildEntry = IORegistryEntryGetChildEntry(objc_msgSend(v4, "ioUSB30CameraKitHubService"), "IOService", &child);
      if (ChildEntry)
      {
        v17 = ChildEntry;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v14 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v14 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_61;
        *(_DWORD *)buf = 67109376;
        v37 = 3;
        v38 = 1024;
        v39 = v17;
        v22 = "__CameraKitHubClassSetupPortNotificationHandler: ERROR: couldn't get CameraKitHubService(%d) %#x";
        goto LABEL_60;
      }
      objc_msgSend(v4, "setIoUSB30CameraKitHubPortService:", child);
      IOObjectRetain(objc_msgSend(v4, "ioUSB30CameraKitHubPortService"));
      v20 = IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(v4, "ioUSB30CameraKitHubNotifyPort"), objc_msgSend(v4, "ioUSB30CameraKitHubPortService"), "IOGeneralInterest", (IOServiceInterestCallback)__USBCameraKitHubPortInterest, v2, &notification);
      objc_msgSend(v4, "setIoUSB30CameraKitHubPortNotification:", notification);
      if (v20)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v19 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          v19 = MEMORY[0x24BDACB70];
          v29 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_79;
        *(_DWORD *)buf = 67109120;
        v37 = v20;
        v28 = "__CameraKitHubClassSetupPortNotificationHandler: ERROR: couldn't add interest notification %#x";
LABEL_77:
        v30 = v19;
        v31 = 8;
LABEL_78:
        _os_log_impl(&dword_2171EA000, v30, OS_LOG_TYPE_DEFAULT, v28, buf, v31);
LABEL_79:

        IOObjectRelease(child);
        goto LABEL_80;
      }
      if (IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(v4, "ioUSB30CameraKitHubNotifyPort")))
      {
        Main = CFRunLoopGetMain();
        v25 = (IONotificationPort *)objc_msgSend(v4, "ioUSB30CameraKitHubNotifyPort");
        goto LABEL_66;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v19 = MEMORY[0x24BDACB70];
        v33 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_79;
      *(_WORD *)buf = 0;
      v28 = "__CameraKitHubClassSetupPortNotificationHandler: ERROR: IONotificationPortGetRunLoopSource(ioUSB30CameraKitH"
            "ubNotifyPort) returned NULL!";
LABEL_97:
      v30 = v19;
      v31 = 2;
      goto LABEL_78;
    }
LABEL_16:
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v37 = (int)v2;
      _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_DEFAULT, "__CameraKitHubClassSetupPortNotificationHandler: ERROR: Invalid pRefCon(%d)", buf, 8u);
    }

    goto LABEL_80;
  }
  if ((_DWORD)v2 != 2 || !objc_msgSend(v3, "ioUSB20CameraKitHubService"))
    goto LABEL_16;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v37 = 2;
    v38 = 1024;
    v39 = objc_msgSend(v4, "ioUSB20CameraKitHubService");
    _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_INFO, "__CameraKitHubClassSetupPortNotificationHandler: pRefCon=%x ioUSB20CameraKitHubService=%d", buf, 0xEu);
  }

  child = -1431655766;
  v12 = IORegistryEntryGetChildEntry(objc_msgSend(v4, "ioUSB20CameraKitHubService"), "IOService", &child);
  if (!v12)
  {
    objc_msgSend(v4, "setIoUSB20CameraKitHubPortService:", child);
    IOObjectRetain(objc_msgSend(v4, "ioUSB20CameraKitHubPortService"));
    v18 = IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(v4, "ioUSB20CameraKitHubNotifyPort"), objc_msgSend(v4, "ioUSB20CameraKitHubPortService"), "IOGeneralInterest", (IOServiceInterestCallback)__USBCameraKitHubPortInterest, v2, &notification);
    objc_msgSend(v4, "setIoUSB20CameraKitHubPortNotification:", notification);
    if (v18)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v19 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_79;
      *(_DWORD *)buf = 67109120;
      v37 = v18;
      v28 = "__CameraKitHubClassSetupPortNotificationHandler: ERROR: couldn't add interest notification %#x";
      goto LABEL_77;
    }
    if (IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(v4, "ioUSB20CameraKitHubNotifyPort")))
    {
      Main = CFRunLoopGetMain();
      v25 = (IONotificationPort *)objc_msgSend(v4, "ioUSB20CameraKitHubNotifyPort");
LABEL_66:
      RunLoopSource = IONotificationPortGetRunLoopSource(v25);
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      IOObjectRelease(child);

      return;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v19 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_WORD *)buf = 0;
    v28 = "__CameraKitHubClassSetupPortNotificationHandler: ERROR: IONotificationPortGetRunLoopSource(ioUSB20CameraKitHub"
          "NotifyPort) returned NULL!";
    goto LABEL_97;
  }
  v13 = v12;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v14 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    goto LABEL_61;
  *(_DWORD *)buf = 67109376;
  v37 = 2;
  v38 = 1024;
  v39 = v13;
  v22 = "__CameraKitHubClassSetupPortNotificationHandler: couldn't get CameraKitHubService(%d) %#x";
LABEL_60:
  _os_log_impl(&dword_2171EA000, v14, OS_LOG_TYPE_DEFAULT, v22, buf, 0xEu);
LABEL_61:

LABEL_80:
  __CameraKitHubClassSetupPortNotificationHandlerHelper(*(_QWORD *)(a1 + 32));
}

@end
