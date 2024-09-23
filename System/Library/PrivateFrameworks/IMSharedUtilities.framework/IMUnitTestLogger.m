@implementation IMUnitTestLogger

- (void)writeOutputToStdout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v5);

  IMLogHandleForCategory("IMUnitTesting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)log:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestLogger writeOutputToStdout:](self, "writeOutputToStdout:", v7);

}

@end
