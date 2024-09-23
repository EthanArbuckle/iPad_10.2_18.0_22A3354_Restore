@implementation CRNVRAMController

+ (id)readNVRAMValueForKey:(id)a3 error:(id *)a4
{
  __CFString *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *CFProperty;
  io_registry_entry_t v12;
  io_object_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  NSObject *v23;
  const char *v24;
  mach_port_t mainPort;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  mainPort = 0;
  if (MEMORY[0x2199D13F0](*MEMORY[0x24BDAD2F0], &mainPort))
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_21457141C();

    if (!a4)
      goto LABEL_7;
    v8 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = CFSTR("Could not get main port");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v31, (uint64_t)&v30, 1);
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("com.apple.corerepair"), -74, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    CFProperty = 0;
    goto LABEL_15;
  }
  v12 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v12)
  {
    handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_2145713C4();

    if (!a4)
      goto LABEL_7;
    v8 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29 = CFSTR("Could not get options entry from the device tree");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)&v29, (uint64_t)&v28, 1);
    goto LABEL_6;
  }
  v13 = v12;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v12, v5, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2145713F0();

    if (a4)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("Could not read value"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v18;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v27, (uint64_t)&v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v17, v21, (uint64_t)CFSTR("com.apple.corerepair"), -74, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  IOObjectRelease(v13);
LABEL_15:

  return CFProperty;
}

+ (BOOL)setNVRAMValueForKey:(id)a3 value:(id)a4 error:(id *)a5
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  BOOL v14;
  io_registry_entry_t v15;
  io_object_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSObject *v34;
  const char *v35;
  mach_port_t mainPort;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  mainPort = 0;
  if (MEMORY[0x2199D13F0](*MEMORY[0x24BDAD2F0], &mainPort))
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21457141C();

    if (!a5)
      goto LABEL_7;
    v11 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("Could not get main port");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v42, (uint64_t)&v41, 1);
LABEL_6:
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, (uint64_t)CFSTR("com.apple.corerepair"), -47, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v14 = 0;
    goto LABEL_15;
  }
  v15 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v15)
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_2145713C4();

    if (!a5)
      goto LABEL_7;
    v11 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = CFSTR("Could not get options entry from the device tree");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v40, (uint64_t)&v39, 1);
    goto LABEL_6;
  }
  v16 = v15;
  v17 = IORegistryEntrySetCFProperty(v15, v7, v8);
  v14 = (_DWORD)v17 == 0;
  if ((_DWORD)v17)
  {
    v18 = v17;
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_214571448(v18, v19, v20, v21, v22, v23, v24, v25);

    if (a5)
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v26, (uint64_t)CFSTR("Could not set value. Error: 0x%08x"), v27, v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v29;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)&v38, (uint64_t)&v37, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, (uint64_t)CFSTR("com.apple.corerepair"), -47, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  IOObjectRelease(v16);
LABEL_15:

  return v14;
}

+ (BOOL)deleteNVRAMValueForKey:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  BOOL v11;
  io_registry_entry_t v12;
  io_object_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  NSObject *v31;
  const char *v32;
  mach_port_t mainPort;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  mainPort = 0;
  if (MEMORY[0x2199D13F0](*MEMORY[0x24BDAD2F0], &mainPort))
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_21457141C();

    if (!a4)
      goto LABEL_7;
    v8 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("Could not get main port");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v39, (uint64_t)&v38, 1);
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("com.apple.corerepair"), -48, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v11 = 0;
    goto LABEL_15;
  }
  v12 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v12)
  {
    handleForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_2145713C4();

    if (!a4)
      goto LABEL_7;
    v8 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37 = CFSTR("Could not get options entry from the device tree");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)&v37, (uint64_t)&v36, 1);
    goto LABEL_6;
  }
  v13 = v12;
  v14 = IORegistryEntrySetCFProperty(v12, CFSTR("IONVRAM-DELETE-PROPERTY"), v5);
  v11 = (_DWORD)v14 == 0;
  if ((_DWORD)v14)
  {
    v15 = v14;
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_2145714AC(v15, v16, v17, v18, v19, v20, v21, v22);

    if (a4)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, (uint64_t)CFSTR("Could not delete value. Error: 0x%08x"), v24, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v35, (uint64_t)&v34, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v25, v29, (uint64_t)CFSTR("com.apple.corerepair"), -48, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  IOObjectRelease(v13);
LABEL_15:

  return v11;
}

@end
