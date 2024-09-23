@implementation SNNError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreml.foundation"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SNNLogging framework](SNNLogging, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_242A44000, v9, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid state : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid inputs : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidMILProgramErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid MIL program : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidEspressoContextErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid Espresso context : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidEspressoPlanErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid Espresso plan : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidEspressoNetworkErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid Espresso network : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invalidEspressoConfigurationErrorForMethod:(id)a3 description:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: invalid Espresso configuration : %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:description:", -7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
