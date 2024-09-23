@implementation NSKeyedArchiver(WFFileCoder)

+ (id)wf_securelyArchivedDataWithRootObject:()WFFileCoder fileCoder:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1618];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v8, "setWfFileCoder:", v6);
  objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x24BDD0E88]);

  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("WFFileCoder"));
  objc_msgSend(v8, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    getWFWorkflowExecutionLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "+[NSKeyedArchiver(WFFileCoder) wf_securelyArchivedDataWithRootObject:fileCoder:]";
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_ERROR, "%s Failed to encode data: %@", (uint8_t *)&v13, 0x16u);

    }
  }

  return v9;
}

@end
