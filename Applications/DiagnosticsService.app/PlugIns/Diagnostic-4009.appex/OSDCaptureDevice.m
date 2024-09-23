@implementation OSDCaptureDevice

+ (id)ispBinary
{
  char *v2;

  v2 = sub_100005994()[4];
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2);
}

+ (id)ispVersion
{
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100005994() + 6));
}

- (OSDCaptureDevice)init
{
  OSDCaptureDevice *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureDevice;
  result = -[OSDCaptureDevice init](&v3, "init");
  if (result)
  {
    result->_deviceRef = 0;
    result->_owners = 0;
  }
  return result;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  OSDCaptureDevice *v4;
  BOOL v5;

  v4 = self;
  objc_sync_enter(v4);
  if (-[OSDCaptureDevice owners](v4, "owners")
    || -[OSDCaptureDevice setupCaptureDevice:](v4, "setupCaptureDevice:", a3)
    && -[OSDCaptureDevice setupCaptureStreams:](v4, "setupCaptureStreams:", a3))
  {
    -[OSDCaptureDevice setOwners:](v4, "setOwners:", (char *)-[OSDCaptureDevice owners](v4, "owners") + 8);
    v5 = 1;
  }
  else
  {
    -[OSDCaptureDevice teardown](v4, "teardown");
    v5 = 0;
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)doneWithDeviceAndStreams
{
  OSDCaptureDevice *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  OSDCaptureDevice *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (-[OSDCaptureDevice owners](v2, "owners"))
  {
    -[OSDCaptureDevice setOwners:](v2, "setOwners:", (char *)-[OSDCaptureDevice owners](v2, "owners") - 8);
    if (!-[OSDCaptureDevice owners](v2, "owners"))
      -[OSDCaptureDevice teardown](v2, "teardown");
  }
  else
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ >> Attempted to deactivate a camera with no matching activiation!", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_sync_exit(v2);

}

- (BOOL)setupCaptureDevice:(id *)a3
{
  char **v5;
  void *v6;
  uint64_t (*v7)(const CFAllocatorRef, _QWORD, OpaqueFigCaptureDevice **);
  uint64_t (*v8)(const CFAllocatorRef, _QWORD, OpaqueFigCaptureDevice **);
  OpaqueFigCaptureDevice **p_deviceRef;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v15;
  id *v16;
  char *v17;
  NSNumber *v19;
  NSNumber *ispVersion;
  uint64_t v21;
  NSObject *v22;
  NSNumber *v23;
  OSDCaptureDevice *v24;
  uint64_t v25;
  char **v26;
  uint8_t buf[4];
  _QWORD v28[2];

  v5 = sub_100005994();
  v6 = dlopen(v5[1], 4);
  if (!v6)
  {
    v17 = dlerror();
    v15 = CFSTR("%@ >> Unable to open the isp plugin: %s");
    v24 = self;
    v25 = (uint64_t)v17;
LABEL_15:
    v16 = a3;
    goto LABEL_16;
  }
  v7 = (uint64_t (*)(const CFAllocatorRef, _QWORD, OpaqueFigCaptureDevice **))dlsym(v6, v5[2]);
  if (!v7)
  {
    v15 = CFSTR("%@ >> Unable to load the isp symbols.");
    v24 = self;
    goto LABEL_15;
  }
  v8 = v7;
  v26 = v5;
  p_deviceRef = &self->_deviceRef;
  v10 = v7(kCFAllocatorDefault, 0, &self->_deviceRef);
  if ((_DWORD)v10 == -536870187)
  {
    v11 = 2;
    do
    {
      v12 = DiagnosticLogHandleForCategory(3);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v28[0]) = 2;
        WORD2(v28[0]) = 1024;
        *(_DWORD *)((char *)v28 + 6) = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Camera creation returned kIOReturnBusy. Delaying %d seconds to retry. (%d retries left)", buf, 0xEu);
      }

      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 2.0, 0);
      v10 = v8(kCFAllocatorDefault, 0, p_deviceRef);
      if ((_DWORD)v10 != -536870187)
        break;
    }
    while (v11-- > 0);
  }
  if ((_DWORD)v10)
  {
    *p_deviceRef = 0;
    v15 = CFSTR("%@ >> Unable to create the FigCaptureDevice with status: (0x%08x)");
    v24 = self;
    v25 = v10;
LABEL_12:
    v16 = a3;
LABEL_16:
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", v16, CFSTR("com.apple.osdiags.OSDCaptureDevice"), 1, v15, v24, v25);
    return 0;
  }
  if (!*p_deviceRef)
  {
    v15 = CFSTR("%@ >> CRITICAL CreateCaptureDevice returned success but the device was NULL");
    v24 = self;
    goto LABEL_12;
  }
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v26 + 6)));
  ispVersion = self->_ispVersion;
  self->_ispVersion = v19;

  v21 = DiagnosticLogHandleForCategory(3);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_ispVersion;
    *(_DWORD *)buf = 138412290;
    v28[0] = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "OSD using isp version %@", buf, 0xCu);
  }

  return 1;
}

- (BOOL)setupCaptureStreams:(id *)a3
{
  id v5;
  BOOL v6;
  OpaqueFigCaptureDevice *v7;
  _QWORD *v8;
  uint64_t (*v9)(OpaqueFigCaptureDevice *, id, _QWORD);
  int v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  OSDCaptureStream *v18;
  uint64_t v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *portToStreamMap;
  uint64_t v23;
  NSObject *v24;
  NSUInteger v25;
  int v27;
  uint64_t v28;
  NSObject *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  OSDCaptureDevice *v38;
  __int16 v39;
  int v40;

  v5 = -[OSDPropertyBasedDevice copyProperty:error:](self, "copyProperty:error:", kFigCaptureDeviceProperty_StreamArray, a3);
  if (a3 && *a3)
  {
    v6 = 0;
  }
  else
  {
    v7 = -[OSDCaptureDevice deviceRef](self, "deviceRef");
    v8 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v8 < 2uLL
      || (v9 = (uint64_t (*)(OpaqueFigCaptureDevice *, id, _QWORD))v8[2]) == 0
      || ((v10 = v9(v7, v5, 0), v10 != -12782) ? (v11 = v10 == 0) : (v11 = 1), v11))
    {
      v6 = 1;
    }
    else
    {
      v27 = v10;
      v28 = DiagnosticLogHandleForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = self;
        v39 = 1024;
        v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Failed to request control of the streams! %d", buf, 0x12u);
      }

      v6 = 0;
    }
    v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v31 = v5;
      v16 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = -[OSDCaptureStream initWithStream:]([OSDCaptureStream alloc], "initWithStream:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
          v19 = objc_claimAutoreleasedReturnValue(-[OSDCaptureStream name:](v18, "name:", a3));
          if (!v19)
          {

            v6 = 0;
            v5 = v31;
            goto LABEL_22;
          }
          v20 = (void *)v19;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
          continue;
        break;
      }
      v5 = v31;
    }
LABEL_22:

    v21 = (NSDictionary *)objc_msgSend(v12, "copy");
    portToStreamMap = self->_portToStreamMap;
    self->_portToStreamMap = v21;

    v23 = DiagnosticLogHandleForCategory(3);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = -[NSDictionary count](self->_portToStreamMap, "count");
      *(_DWORD *)buf = 134217984;
      v38 = (OSDCaptureDevice *)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "OSDCaptureDevice has %lu streams", buf, 0xCu);
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[OSDCaptureDevice teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)OSDCaptureDevice;
  -[OSDCaptureDevice dealloc](&v3, "dealloc");
}

- (void)teardown
{
  NSDictionary *portToStreamMap;
  OpaqueFigCaptureDevice *deviceRef;

  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_portToStreamMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100010518);
  portToStreamMap = self->_portToStreamMap;
  self->_portToStreamMap = 0;

  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    CFRelease(deviceRef);
    self->_deviceRef = 0;
  }
}

- (id)captureStreamForPortType:(__CFString *)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCaptureDevice portToStreamMap](self, "portToStreamMap", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", a3));

  return v6;
}

- (void)backingRef
{
  return self->_deviceRef;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, __CFString *, void *);

  FigBaseObject = FigCaptureDeviceGetFigBaseObject(self->_deviceRef, a2);
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

  FigBaseObject = FigCaptureDeviceGetFigBaseObject(self->_deviceRef, a2);
  v7 = *(uint64_t (**)(uint64_t, __CFString *, const CFAllocatorRef, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
  if (v7)
    return v7(FigBaseObject, a3, kCFAllocatorDefault, a4);
  else
    return -12782;
}

- (OpaqueFigCaptureDevice)deviceRef
{
  return self->_deviceRef;
}

- (NSNumber)ispVersion
{
  return self->_ispVersion;
}

- (unint64_t)owners
{
  return self->_owners;
}

- (void)setOwners:(unint64_t *)a3
{
  self->_owners = a3;
}

- (NSDictionary)portToStreamMap
{
  return self->_portToStreamMap;
}

- (void)setPortToStreamMap:(id)a3
{
  objc_storeStrong((id *)&self->_portToStreamMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portToStreamMap, 0);
  objc_storeStrong((id *)&self->_ispVersion, 0);
}

@end
