@implementation CloudServicesAnalytics

+ (id)databasePath
{
  return (id)MEMORY[0x24BEDD108](CloudServicesAnalytics, sel_defaultAnalyticsDatabasePath_, CFSTR("CloudServicesAnalytics"));
}

+ (id)logger
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CloudServicesAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logSuccessForEvent:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logSuccessForEventNamed_(self, v4, (uint64_t)v5);

}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v26[0] = CFSTR("errorDomain");
    v10 = a3;
    objc_msgSend_domain(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("errorCode");
    v27[0] = v13;
    v14 = (void *)MEMORY[0x24BDD16E0];
    v17 = objc_msgSend_code(v10, v15, v16);

    objc_msgSend_numberWithInteger_(v14, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v27, v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v24 = (void *)objc_msgSend_mutableCopy(v9, v22, v23);
      objc_msgSend_setValuesForKeysWithDictionary_(v24, v25, (uint64_t)v21);

      v21 = v24;
    }
    objc_msgSend_logHardFailureForEventNamed_withAttributes_(self, v22, (uint64_t)v8, v21);

  }
}

@end
