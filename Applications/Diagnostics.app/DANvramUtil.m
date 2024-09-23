@implementation DANvramUtil

+ (id)sharedInstance
{
  if (qword_10016E868 != -1)
    dispatch_once(&qword_10016E868, &stru_100133208);
  return (id)qword_10016E860;
}

- (void)syncASTDefaultsToNVRam
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[16];

  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DANvramUtil: syncASTDefaultsToNVRam", buf, 2u);
  }

  v5 = ASTDomain;
  v6 = ASTServerKey;
  v7 = ASTCustomServerKey;
  v8 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", ASTDomain);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v5, v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v5, v7));
  if (v9 && (objc_msgSend(v9, "isEqualToNumber:", &off_10013F040) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
    -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", v11, v13);

    if (!v10)
      goto LABEL_9;
  }
  else
  {
    -[DANvramUtil _clearNVRamVariable:](self, "_clearNVRamVariable:", v11);
    if (!v10)
      goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isEqualToString:", &stru_10013CDC8) & 1) == 0)
  {
    -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", v12, v10);
    goto LABEL_11;
  }
LABEL_9:
  -[DANvramUtil _clearNVRamVariable:](self, "_clearNVRamVariable:", v12);
LABEL_11:

}

- (void)setNextBootRecovery
{
  -[DANvramUtil clearNextBootCheckerBoardPersistent](self, "clearNextBootCheckerBoardPersistent");
  -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", CFSTR("auto-boot"), CFSTR("0"));
}

- (void)setNextBootCheckerBoard
{
  -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", CFSTR("one-time-boot-command"), CFSTR("checkerboard"));
}

- (void)setNextBootCheckerBoardPersistent
{
  -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", CFSTR("boot-command"), CFSTR("checkerboard"));
}

- (void)clearNextBootCheckerBoardPersistent
{
  -[DANvramUtil _clearNVRamVariable:](self, "_clearNVRamVariable:", CFSTR("boot-command"));
}

- (void)_writeNVRamVariable:(id)a3 value:(id)a4
{
  __CFString *v5;
  id v6;
  io_registry_entry_t v7;
  io_object_t v8;
  kern_return_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  __CFString *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  kern_return_t v18;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v7)
  {
    v8 = v7;
    v9 = IORegistryEntrySetCFProperty(v7, v5, v6);
    v10 = DiagnosticLogHandleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "failed";
      v13 = 138412802;
      v14 = v5;
      if (!v9)
        v12 = "succeeded.";
      v15 = 2080;
      v16 = v12;
      v17 = 1024;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DANvramUtil: Writing %@ to nvram %s with result %x", (uint8_t *)&v13, 0x1Cu);
    }

    IOObjectRelease(v8);
  }

}

- (void)_clearNVRamVariable:(id)a3
{
  id v3;
  io_registry_entry_t v4;
  io_object_t v5;
  kern_return_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  kern_return_t v15;

  v3 = a3;
  v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v4)
  {
    v5 = v4;
    v6 = IORegistryEntrySetCFProperty(v4, CFSTR("IONVRAM-DELETE-PROPERTY"), v3);
    v7 = DiagnosticLogHandleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "failed";
      v10 = 138412802;
      v11 = v3;
      if (!v6)
        v9 = "succeeded.";
      v12 = 2080;
      v13 = v9;
      v14 = 1024;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DANvramUtil: Deleting %@ from nvram %s with result %x", (uint8_t *)&v10, 0x1Cu);
    }

    IOObjectRelease(v5);
  }

}

@end
