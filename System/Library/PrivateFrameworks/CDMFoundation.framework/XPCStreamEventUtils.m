@implementation XPCStreamEventUtils

+ (id)getXPCEventName:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *string;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (MEMORY[0x220744C98]() != MEMORY[0x24BDACFA0])
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v9 = 136315138;
    v10 = "+[XPCStreamEventUtils getXPCEventName:]";
    v8 = "%s [ERR]: Cannot extract name from XPC event of non-dictionary type";
LABEL_10:
    _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_3;
  }
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF50]);
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = "+[XPCStreamEventUtils getXPCEventName:]";
    v8 = "%s [ERR]: Cannot extract name from XPC event, since the key is missing";
    goto LABEL_10;
  }
LABEL_3:

  v5 = 0;
LABEL_6:

  return v5;
}

@end
