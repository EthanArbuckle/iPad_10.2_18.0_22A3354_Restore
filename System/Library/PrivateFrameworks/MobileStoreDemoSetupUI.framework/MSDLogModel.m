@implementation MSDLogModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_10_0);
  return (id)sharedInstance_shared_1;
}

void __29__MSDLogModel_sharedInstance__block_invoke()
{
  MSDLogModel *v0;
  void *v1;

  v0 = objc_alloc_init(MSDLogModel);
  v1 = (void *)sharedInstance_shared_1;
  sharedInstance_shared_1 = (uint64_t)v0;

}

- (void)logWithFormat:(id)a3 andArgs:(char *)a4
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a4);

  -[MSDLogModel logMessage:](self, "logMessage:", v8);
}

- (void)logMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSDLogModel *v8;
  id v9;

  v9 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("dd-MM-yyyy HH:mm:ss:SSS"));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@\n"), v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSDLogModel logFP](self, "logFP"))
  {
    v8 = self;
    objc_sync_enter(v8);
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -[MSDLogModel logFP](v8, "logFP"));
    fflush(-[MSDLogModel logFP](v8, "logFP"));
    objc_sync_exit(v8);

  }
}

- (BOOL)enableLogToFile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByExpandingTildeInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if ((objc_msgSend(v6, "fileExistsAtPath:", v8) & 1) != 0
    || objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0))
  {
    -[MSDLogModel setLogFP:](self, "setLogFP:", fopen((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), "a"));
    if (-[MSDLogModel logFP](self, "logFP"))
      v9 = 1;
  }

  return v9;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  char v29;
  _QWORD v30[5];
  id v31;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  v31 = 0;
  v29 = 97;
  if ((objc_msgSend(v10, "fileExistsAtPath:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    if ((v12 & 1) == 0)
    {
      v18 = 0;
      v20 = 0;
      v13 = 0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("testWritability.log"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v13, v14, 0);

  if (!v15)
  {
    v18 = 0;
    v20 = 0;
LABEL_10:
    v22 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v10, "removeItemAtPath:error:", v13, 0);
  v16 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateWithTimeInterval:sinceDate:", v17, (double)a5 * -86400.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentsOfDirectoryAtPath:error:", v8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __55__MSDLogModel_enableLogToFilesUnder_prefix_expireDays___block_invoke;
    v24[3] = &unk_24F47D630;
    v25 = v8;
    v26 = v18;
    v28 = v30;
    v27 = v10;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v24);

  }
  -[MSDLogModel fileNameForTodayUnder:prefix:](self, "fileNameForTodayUnder:prefix:", v8, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MSDLogModel enableLogToFile:](self, "enableLogToFile:", v21);

LABEL_7:
  _Block_object_dispose(v30, 8);

  return v22;
}

void __55__MSDLogModel_enableLogToFilesUnder_prefix_expireDays___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("/%@"), a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Checking existing log file (full path) %@ against %@"), v14, v6);

  objc_msgSend(*(id *)(a1 + 48), "attributesOfItemAtPath:error:", v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40));

  if (v11 == -1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Removing %@ whose creation date is %@."), v14, v13);

    objc_msgSend(*(id *)(a1 + 48), "removeItemAtPath:error:", v14, 0);
  }
  *a4 = 0;

}

- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x24BDBCE48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v10);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 28, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@-%4ld%02ld%02ld.log"), v7, v6, objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (__sFILE)logFP
{
  return self->_logFP;
}

- (void)setLogFP:(__sFILE *)a3
{
  self->_logFP = a3;
}

@end
