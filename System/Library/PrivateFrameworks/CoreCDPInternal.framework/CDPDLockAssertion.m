@implementation CDPDLockAssertion

+ (id)lock
{
  return (id)objc_msgSend(a1, "lockWithError:", 0);
}

+ (id)lockWithError:(id *)a3
{
  CDPDLockAssertion *v4;
  void *v5;
  uint64_t (*v6)(void *, id *);
  uint64_t v7;
  NSObject *v8;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(CDPDLockAssertion);
  v16[0] = CFSTR("MKBAssertionKey");
  v16[1] = CFSTR("MKBAssertionTimeout");
  v17[0] = CFSTR("RemoteProfile");
  v17[1] = &unk_24C836770;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (uint64_t (*)(void *, id *))getMKBDeviceLockAssertionSymbolLoc_ptr;
  v15 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!getMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getMKBDeviceLockAssertionSymbolLoc_block_invoke;
    v11[3] = &unk_24C81D370;
    v11[4] = &v12;
    __getMKBDeviceLockAssertionSymbolLoc_block_invoke((uint64_t)v11);
    v6 = (uint64_t (*)(void *, id *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
    -[CDPDBuddyStateObserver eventReceived:eventValue:].cold.1();
    __break(1u);
  }
  v7 = v6(v5, &v10);
  if (v10)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CDPDLockAssertion lockWithError:].cold.2((uint64_t *)&v10, v8);

    if (a3)
      *a3 = v10;
    else
      CFRelease(v10);
  }
  if (v7)
  {
    v4->_assertionRef = (__MKBAssertion *)v7;
  }
  else
  {

    v4 = 0;
  }

  return v4;
}

- (void)unlock
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"Releasing device lock assertion\", v1, 2u);
}

+ (void)lockWithError:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to take device lock assertion: %@\", (uint8_t *)&v3, 0xCu);
}

@end
