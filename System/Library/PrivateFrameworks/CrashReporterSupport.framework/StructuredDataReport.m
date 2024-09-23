@implementation StructuredDataReport

- (StructuredDataReport)initWithType:(int)a3 withFile:(id)a4
{
  StructuredDataReport *v6;
  StructuredDataReport *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)StructuredDataReport;
  v6 = -[OSAReport init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_log_type = a3;
    v6->_raw_logfile = (NSString *)a4;
    *(CFAbsoluteTime *)((char *)&v7->super.super.isa + (int)*MEMORY[0x1E0D64F08]) = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)((char *)&v7->super.super.isa + (int)*MEMORY[0x1E0D64F10]), "setObject:forKeyedSubscript:", CFSTR("ips.synced"), *MEMORY[0x1E0D64FE0]);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StructuredDataReport;
  -[StructuredDataReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_log_type);
}

- (BOOL)isActionable
{
  return GetNameForLogType(self->_log_type) != 0;
}

- (id)appleCareDetails
{
  return 0;
}

- (id)reportNamePrefix
{
  return (id)GetNameForLogType(self->_log_type);
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  __assert_rtn("-[StructuredDataReport generateLogAtLevel:withBlock:]", "StructuredDataReport.m", 62, "0");
}

- (void)generateCustomLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  FILE *v9;
  FILE *v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  int v14;
  NSString *raw_logfile;
  int *v16;
  char *v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = OSADateFormat();
  v8 = objc_msgSend((id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Date:%@\nIncident ID:%@\n%@\n"), v7, -[OSAReport incidentID](self, "incidentID"), GetDeviceConfig()), "dataUsingEncoding:allowLossyConversion:", 4, 1);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v8);
  v9 = fopen(-[NSString fileSystemRepresentation](self->_raw_logfile, "fileSystemRepresentation"), "r");
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x10000);
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        v13 = fread((void *)objc_msgSend(v12, "mutableBytes"), 1uLL, 0x10000uLL, v10);
        v14 = ferror(v10);
        if (!v13)
          break;
        if (v14)
          break;
        objc_msgSend(v12, "setLength:", v13);
        (*((void (**)(id, void *))a4 + 2))(a4, v12);
      }
      while (!feof(v10));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    raw_logfile = self->_raw_logfile;
    v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)buf = 138412546;
    v19 = raw_logfile;
    v20 = 2080;
    v21 = v17;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to open '%@': %s", buf, 0x16u);
  }
}

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke;
  v6[3] = &unk_1E57ED0E8;
  v6[4] = a4;
  v6[5] = &v7;
  -[StructuredDataReport generateCustomLogAtLevel:withBlock:](self, "generateCustomLogAtLevel:withBlock:", a3, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = result;
    result = objc_msgSend(a2, "length");
    if (result)
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

@end
