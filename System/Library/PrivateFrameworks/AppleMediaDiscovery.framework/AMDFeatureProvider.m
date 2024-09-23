@implementation AMDFeatureProvider

+ (id)getProviderForSource:(id)a3 WithDomain:(id)a4
{
  AMDStorageBasedProvider *v4;
  id v7;
  id location[3];
  AMDStorageBasedProvider *v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0]
    && ((objc_msgSend(location[0], "isEqualToString:", CFSTR("request")) & 1) != 0
     || (objc_msgSend(location[0], "isEqualToString:", CFSTR("model")) & 1) != 0))
  {
    v9 = (AMDStorageBasedProvider *)+[AMDMemoryBasedProvider sharedProvider](AMDMemoryBasedProvider, "sharedProvider");
  }
  else
  {
    v4 = [AMDStorageBasedProvider alloc];
    v9 = -[AMDStorageBasedProvider initWithDomain:](v4, "initWithDomain:", v7);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v10[15];
  char v11;
  id v12[2];
  id v13;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12[1] = a5;
  v12[0] = MEMORY[0x1E0C81028];
  v11 = 16;
  if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_ERROR))
  {
    log = v12[0];
    type = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_error_impl(&dword_1DC678000, log, type, "Method 'getFeatureWithName' not implemented in AMDFeatureProvider base class", v10, 2u);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)storeFeatureData:(id)a3 error:(id *)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *a4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 29, CFSTR("Store operation in base class AMDFeatureProvider not supported"));
  objc_storeStrong(location, 0);
}

- (id)fetchOutputRemapDictForUsecase:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v6[15];
  char v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = MEMORY[0x1E0C81028];
  v7 = 16;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_error_impl(&dword_1DC678000, log, type, "Method 'fetchOutputRemapDictForUsecase' not implemented in AMDFeatureProvider base class", v6, 2u);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)storeOutputRemapData:(id)a3 error:(id *)a4
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v7[7];
  char v8;
  id v9[2];
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9[1] = a4;
  v9[0] = MEMORY[0x1E0C81028];
  v8 = 16;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_ERROR))
  {
    log = v9[0];
    type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_error_impl(&dword_1DC678000, log, type, "Method 'storeOutputRemapData' not implemented in AMDFeatureProvider base class", v7, 2u);
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

@end
