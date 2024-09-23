@implementation PHAssistantAnswerRequest

- (void)performWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint8_t buf[4];
  PHAssistantAnswerRequest *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_226FFC000, v5, OS_LOG_TYPE_DEFAULT, "Received Siri request to answer: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.mobilephone.%@"), objc_opt_class());
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);

  objc_msgSend(MEMORY[0x24BEB4938], "callCenterWithQueue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_226FFDB38;
  block[3] = &unk_24EF4A090;
  v12 = v8;
  v13 = v4;
  v9 = v4;
  v10 = v8;
  dispatch_sync(v7, block);

}

@end
