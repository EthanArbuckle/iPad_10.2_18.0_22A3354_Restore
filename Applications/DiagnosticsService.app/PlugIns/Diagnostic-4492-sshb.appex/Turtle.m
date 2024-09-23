@implementation Turtle

- (Turtle)init
{
  Turtle *v2;
  SSHBHIDManager *v3;
  SSHBHIDManager *hidManager;
  SSHBHIDManager *v5;
  SSHBHIDUsage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Turtle;
  v2 = -[Turtle init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SSHBHIDManager);
    hidManager = v2->_hidManager;
    v2->_hidManager = v3;

    v2->_turtleRef = 0;
    v5 = v2->_hidManager;
    v6 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", 100, 32);
    -[SSHBHIDManager registerDevice:forNotificationsFromDeviceWithUsage:](v5, "registerDevice:forNotificationsFromDeviceWithUsage:", v2, v6);

  }
  return v2;
}

- (void)deviceWasAdded:(__IOHIDDevice *)a3
{
  id v4;

  -[Turtle setTurtleRef:](self, "setTurtleRef:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[Turtle delegate](self, "delegate"));
  objc_msgSend(v4, "turtleWasConnected");

}

- (void)deviceWasRemoved:(__IOHIDDevice *)a3
{
  id v4;

  -[Turtle setTurtleRef:](self, "setTurtleRef:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[Turtle delegate](self, "delegate"));
  objc_msgSend(v4, "turtleWasDisconnected");

}

- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8
{
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  _BYTE v23[14];
  __int16 v24;
  int64_t v25;

  if (!a7)
  {
    v12 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v23 = self;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = a6;
      v14 = "%@: Invalid data from callback report ID %u!";
      v15 = v13;
      v16 = 18;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
LABEL_10:

    return;
  }
  if (a6 != 80)
  {
    v17 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v23 = self;
      v14 = "%@: Unsupported packet";
      v15 = v13;
      v16 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (a8 == 33)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[Turtle bytesToInputPacket:](self, "bytesToInputPacket:", a7, *(_QWORD *)&a4, *(_QWORD *)&a5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle delegate](self, "delegate"));
    objc_msgSend(v11, "turtleCallback:", v21);

  }
  else
  {
    v18 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v23 = 80;
      *(_WORD *)&v23[4] = 2048;
      *(_QWORD *)&v23[6] = 33;
      v24 = 2048;
      v25 = a8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Packet 0x%x length expected %lu, received %lu", buf, 0x1Cu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle delegate](self, "delegate"));
    objc_msgSend(v20, "turtleCallback:", 0);

  }
}

- (id)bytesToInputPacket:(id *)a3
{
  SSHBHIDSSHBTurtleInputPacket *v4;
  double v5;

  v4 = objc_alloc_init(SSHBHIDSSHBTurtleInputPacket);
  -[SSHBHIDSSHBTurtleInputPacket setReportID:](v4, "setReportID:", a3->var0);
  -[SSHBHIDSSHBTurtleInputPacket setFrameNumber:](v4, "setFrameNumber:", a3->var1);
  -[SSHBHIDSSHBTurtleInputPacket setTimestamp:](v4, "setTimestamp:", *(_QWORD *)(&a3->var1 + 1));
  -[SSHBHIDSSHBTurtleInputPacket setCookie_type:](v4, "setCookie_type:", BYTE2(a3->var2));
  -[SSHBHIDSSHBTurtleInputPacket setCookie:](v4, "setCookie:", *(unsigned __int16 *)((char *)&a3->var2 + 3));
  -[SSHBHIDSSHBTurtleInputPacket setCapValue:](v4, "setCapValue:", *(unsigned __int16 *)((char *)&a3->var2 + 5));
  -[SSHBHIDSSHBTurtleInputPacket setGapValue:](v4, "setGapValue:", *(unsigned int *)((char *)&a3->var4 + 1));
  -[SSHBHIDSSHBTurtleInputPacket setForceValue:](v4, "setForceValue:", *(__int16 *)((char *)&a3->var6 + 1));
  -[SSHBHIDSSHBTurtleInputPacket setMesaTemperature:](v4, "setMesaTemperature:", *(__int16 *)((char *)&a3->var6 + 3));
  -[SSHBHIDSSHBTurtleInputPacket setMesaFd:](v4, "setMesaFd:", HIBYTE(a3->var7));
  -[SSHBHIDSSHBTurtleInputPacket setMesaFdStuck:](v4, "setMesaFdStuck:", LOBYTE(a3->var8));
  *(float *)&v5 = (float)*(__int16 *)((char *)&a3->var6 + 3) * 0.25;
  -[SSHBHIDSSHBTurtleInputPacket setMesaTemperatureProcessed:](v4, "setMesaTemperatureProcessed:", v5);
  return v4;
}

- (void)waitForDuration:(double)a3
{
  CFRunLoopRunInMode(kCFRunLoopDefaultMode, a3, 0);
}

- (BOOL)gapSubtraction:(BOOL)a3 error:(id *)a4
{
  char v6;
  void *v7;
  __IOHIDDevice *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v12;
  _BYTE v13[2];

  if (a3)
    v6 = 1;
  else
    v6 = 2;
  v13[0] = -95;
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle hidManager](self, "hidManager"));
  v8 = -[Turtle turtleRef](self, "turtleRef");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v13, 2));
  LODWORD(v12) = 161;
  v10 = objc_msgSend(v7, "setReportForDevice:reportType:reportID:buffer:error:domain:code:", v8, 0, 161, v9, a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4492.Turtle"), v12);

  return v10;
}

- (BOOL)configureFrequentBackgroundScan:(BOOL)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  char v18;
  unsigned __int16 v19;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle _frequentScanPeriodMs:](self, "_frequentScanPeriodMs:", a4));
  v8 = v7;
  if (v7)
  {
    v18 = 33;
    v19 = (unsigned __int16)objc_msgSend(v7, "unsignedShortValue");
    if (qword_100014AB0)
    {
      if (a3)
      {
LABEL_4:
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v18, 3));
LABEL_8:
        v14 = v9;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle hidManager](self, "hidManager"));
        LODWORD(v17) = 33;
        v10 = objc_msgSend(v15, "setReportForDevice:reportType:reportID:buffer:error:domain:code:", -[Turtle turtleRef](self, "turtleRef"), 0, 33, v14, a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4492.Turtle"), v17);

        goto LABEL_9;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle hidManager](self, "hidManager"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getReportForDevice:reportType:reportID:error:", -[Turtle turtleRef](self, "turtleRef"), 0, 33, a4));
      v13 = (void *)qword_100014AB0;
      qword_100014AB0 = v12;

      if (a3)
        goto LABEL_4;
    }
    v9 = (id)qword_100014AB0;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)_frequentScanPeriodMs:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle hidManager](self, "hidManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getReportForDevice:reportType:reportID:error:", -[Turtle turtleRef](self, "turtleRef"), 0, 34, a3));

  if (objc_msgSend(v6, "length") == (id)3)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)objc_msgSend(objc_retainAutorelease(v6), "bytes") + 1)));
  else
    v7 = 0;

  return v7;
}

- (id)_getReport:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle hidManager](self, "hidManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getReportForDevice:reportType:reportID:error:domain:code:", -[Turtle turtleRef](self, "turtleRef"), 0, (int)v5, a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4492.Turtle"), v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 1, (char *)objc_msgSend(v8, "length") - 1));
  return v9;
}

- (id)criticalErrors:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle _getReport:error:](self, "_getReport:error:", 224, a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle _getReport:error:](self, "_getReport:error:", 225, a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle _getReport:error:](self, "_getReport:error:", 226, a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Turtle _getReport:error:](self, "_getReport:error:", 227, a3));
  if (v6)
  {
    v10 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v37[0] = CFSTR("scan");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v10 >> 1) & 1));
    v38[0] = v11;
    v37[1] = CFSTR("i2c");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v10 >> 2) & 1));
    v38[1] = v12;
    v37[2] = CFSTR("calibration");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v10 >> 3) & 1));
    v38[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("general"));

  }
  if (v7)
  {
    v15 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v35[0] = CFSTR("startScanFailures");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *v15));
    v36[0] = v30;
    v35[1] = CFSTR("stopScanFailures");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[1]));
    v36[1] = v16;
    v35[2] = CFSTR("readScanResultFailures");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v15[2]));
    v36[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 3));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("scan"));

  }
  if (v8)
  {
    v19 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v33[0] = CFSTR("readFailures");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *v19));
    v33[1] = CFSTR("writeFailures");
    v34[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v19[1]));
    v34[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("i2c"));

  }
  if (v9)
  {
    v23 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v31[0] = CFSTR("forceCal");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23 & 1));
    v32[0] = v24;
    v31[1] = CFSTR("gapCal");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v23 >> 1) & 1));
    v32[1] = v25;
    v31[2] = CFSTR("inverseFilterCal");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v23 >> 2) & 1));
    v32[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("calibration"));

  }
  v28 = objc_msgSend(v5, "copy");

  return v28;
}

- (SSHBHIDSSHBTurtleDelegate)delegate
{
  return (SSHBHIDSSHBTurtleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSHBHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(id)a3
{
  objc_storeStrong((id *)&self->_hidManager, a3);
}

- (__IOHIDDevice)turtleRef
{
  return self->_turtleRef;
}

- (void)setTurtleRef:(__IOHIDDevice *)a3
{
  self->_turtleRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
