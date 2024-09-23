BOOL ARFileDescriptorIsTTY(FILE *a1)
{
  int v2;
  BOOL v3;

  if (ARFileDescriptorIsTTY_onceToken != -1)
    dispatch_once(&ARFileDescriptorIsTTY_onceToken, &__block_literal_global);
  v2 = fileno(a1);
  if (isatty(v2))
    v3 = ARFileDescriptorIsTTY_isSSHTTY == 0;
  else
    v3 = 1;
  return !v3;
}

void _printFormat(FILE *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, a3);

  v8 = objc_retainAutorelease(v7);
  fprintf(a1, "%s\n", (const char *)objc_msgSend(v8, "UTF8String"));
  _ARLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2144EE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1)
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_42);
  return (id)_ARLogGeneral_logObj;
}

void _printMessageWithColor(FILE *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (ARFileDescriptorIsTTY(a1))
  {
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), a1);
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), a1);
    v7 = (const char *)objc_msgSend(CFSTR("\x1B[0m"), "UTF8String");
  }
  else
  {
    v7 = (const char *)&unk_2144EFBF9;
    fputs((const char *)&unk_2144EFBF9, a1);
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), a1);
  }
  fprintf(a1, "%s\n", v7);
  _ARLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2144EE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

}

void printMessage(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _printFormat((FILE *)*MEMORY[0x24BDAC8E8], a1, (uint64_t)&a9);
}

void _printMessage(void *a1, uint64_t a2)
{
  _printFormat((FILE *)*MEMORY[0x24BDAC8E8], a1, a2);
}

double printVector3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double result;

  printMessage(CFSTR("%s: (%f, %f, %f)"), a2, a3, a4, a5, a6, a7, a8, a1);
  return result;
}

void printError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _printError(a1, (uint64_t)&a9);
}

void _printError(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "initWithFormat:arguments:", v6, a2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌  ERROR: %@\n"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _printMessageWithColor((FILE *)*MEMORY[0x24BDAC8D8], CFSTR("\x1B[1;35m"), v7);

}

void printInfo(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _printInfo(a1, (uint64_t)&a9);
}

void _printInfo(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "initWithFormat:arguments:", v6, a2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ℹ️  INFO: %@\n"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _printMessageWithColor((FILE *)*MEMORY[0x24BDAC8E8], CFSTR("\x1B[1;35m"), v7);

}

void printWarning(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _printWarning(a1, (uint64_t)&a9);
}

void _printWarning(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "initWithFormat:arguments:", v6, a2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⚠️  WARNING: %@\n"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _printMessageWithColor((FILE *)*MEMORY[0x24BDAC8E8], CFSTR("\x1B[1;35m"), v7);

}

void printColoredMessage(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _printColoredMessage(a1, a2, (uint64_t)&a9);
}

void _printColoredMessage(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a2;
  v7 = a1;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "initWithFormat:arguments:", v9, a3);
  _printMessageWithColor((FILE *)*MEMORY[0x24BDAC8E8], v7, v10);

}

void ARPrintUsageStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t vars0;

  printColoredMessage(CFSTR("\x1B[1m"), CFSTR("Usage:"), a3, a4, a5, a6, a7, a8, vars0);
  printMessage(CFSTR(" arkitctl <COMMAND> [help]\n"), v9, v10, v11, v12, v13, v14, v15, a9);
}

uint64_t ARPrintToiTerm(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  printf("\x1B]1337;File=[size=%lld;inline=1;preserveAspectRatio=1]:", objc_msgSend(v1, "length"));
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  puts((const char *)objc_msgSend(v3, "UTF8String"));

  return puts("\a");
}

uint64_t ARPrintEscapeEnableAlternativeBuffer()
{
  printf("%s", "\x1B[?1049h");
  return fflush((FILE *)*MEMORY[0x24BDAC8E8]);
}

uint64_t ARPrintEscapeDisableAlternativeBuffer()
{
  printf("%s", "\x1B[?1049l");
  return fflush((FILE *)*MEMORY[0x24BDAC8E8]);
}

uint64_t ARPrintEscapeEraseScreen()
{
  printf("%s", "\x1B[2J");
  return fflush((FILE *)*MEMORY[0x24BDAC8E8]);
}

uint64_t ARPrintEscapeMoveToLocation(int a1, int a2)
{
  printf("\x1B[%d;%dH", a1, a2);
  return fflush((FILE *)*MEMORY[0x24BDAC8E8]);
}

id ARKitBuildVersionString()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1488], "_bundleWithIdentifier:andLibraryName:", CFSTR("com.apple.ARKit"), CFSTR("ARKit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

