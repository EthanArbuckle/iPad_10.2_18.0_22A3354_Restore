@implementation MUStatistics

+ (void)logFileTypeOpened:(id)a3 byProcess:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v5 = (__CFString *)a4;
  v6 = (__CFString *)a3;
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("unknown");
  v8 = v7;

  if (-[__CFString length](v5, "length"))
    v9 = v5;
  else
    v9 = CFSTR("unknown");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.markup.%@"), CFSTR("open"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  v15 = v8;
  v12 = v8;
  v13 = v10;
  AnalyticsSendEventLazy();

}

id __44__MUStatistics_logFileTypeOpened_byProcess___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("host");
  v3[1] = CFSTR("contentType");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)logFileTypeSaved:(id)a3 byProcess:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v5 = (__CFString *)a4;
  v6 = (__CFString *)a3;
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("unknown");
  v8 = v7;

  if (-[__CFString length](v5, "length"))
    v9 = v5;
  else
    v9 = CFSTR("unknown");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.markup.%@"), CFSTR("save"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  v15 = v8;
  v12 = v8;
  v13 = v10;
  AnalyticsSendEventLazy();

}

id __43__MUStatistics_logFileTypeSaved_byProcess___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("host");
  v3[1] = CFSTR("contentType");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
