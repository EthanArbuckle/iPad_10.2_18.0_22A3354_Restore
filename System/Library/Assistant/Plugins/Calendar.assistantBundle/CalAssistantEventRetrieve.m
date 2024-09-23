@implementation CalAssistantEventRetrieve

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  sub_22665D4E4();
  v5 = (void *)qword_25586B420;
  if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
    sub_22666049C(v5);
  v6 = (void *)*MEMORY[0x24BE08FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
    sub_226660400(v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)MEMORY[0x24BDC74E8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22665C3B8;
  v13[3] = &unk_24EE09ED8;
  v13[4] = self;
  v14 = v7;
  v15 = v4;
  v9 = v4;
  v10 = v7;
  objc_msgSend__ca_performBlock_(v8, v11, (uint64_t)v13, v12);

}

@end
