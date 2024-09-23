@implementation HTHangsDataEntry

- (HTHangsDataEntry)initWithPath:(id)a3 hangID:(id)a4 creationDate:(id)a5 duration:(double)a6 processBundleID:(id)a7 processPath:(id)a8 processRecord:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HTHangsDataEntry *v22;
  uint64_t v23;
  NSString *path;
  uint64_t v25;
  NSString *hangID;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *processBundleID;
  uint64_t v31;
  NSString *processPath;
  char v33;
  NSString *v34;
  BOOL v35;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v37.receiver = self;
  v37.super_class = (Class)HTHangsDataEntry;
  v22 = -[HTHangsDataEntry init](&v37, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    path = v22->_path;
    v22->_path = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    hangID = v22->_hangID;
    v22->_hangID = (NSString *)v25;

    objc_storeStrong((id *)&v22->_creationDate, a5);
    v22->_duration = a6;
    v27 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    processBundleID = v22->_processBundleID;
    v22->_processBundleID = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    processPath = v22->_processPath;
    v22->_processPath = (NSString *)v31;

    objc_storeStrong((id *)&v22->_processRecord, a9);
    if (-[NSString hasSuffix:](v22->_path, "hasSuffix:", CFSTR("ips")))
      v33 = 1;
    else
      v33 = -[NSString hasSuffix:](v22->_path, "hasSuffix:", CFSTR("ips.synced"));
    v22->_isLogFile = v33;
    v34 = v22->_path;
    if (v34)
      v35 = -[NSString length](v34, "length") == 0;
    else
      v35 = 1;
    v22->_isBeingProcessed = v35;
  }

  return v22;
}

- (int64_t)durationLevel
{
  return HTLevelForHangDuration(self->_duration);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_hangID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HTHangsDataEntry *v4;
  char v5;

  v4 = (HTHangsDataEntry *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSString isEqual:](v4->_hangID, "isEqual:", self->_hangID);
    else
      v5 = 0;
  }

  return v5;
}

- (NSString)displayName
{
  LSApplicationRecord *processRecord;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  if (displayName_onceToken != -1)
    dispatch_once(&displayName_onceToken, &__block_literal_global_2);
  processRecord = self->_processRecord;
  if (processRecord)
  {
    -[LSApplicationRecord localizedName](processRecord, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", displayName_characterSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    -[NSString componentsSeparatedByString:](self->_processBundleID, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", displayName_characterSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    -[NSString componentsSeparatedByString:](self->_processPath, "componentsSeparatedByString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", displayName_characterSet);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v14 = v4;
  }
  else
  {
    HTUIPlaceholderUnknownProcess();
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return (NSString *)v15;
}

void __31__HTHangsDataEntry_displayName__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)displayName_characterSet;
  displayName_characterSet = v1;

  v3 = (void *)displayName_characterSet;
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

}

- (unint64_t)fileSize
{
  void *v3;
  NSString *path;
  void *v5;
  id v6;
  unint64_t v7;
  BOOL v8;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  v10 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", path, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = objc_msgSend(v5, "fileSize");

  if (v6)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (v8)
  {
    NSLog(CFSTR("Unable to retrieve the size of file at path %@ (error = %@)"), self->_path, v6);
    v7 = 0;
  }

  return v7;
}

+ (id)sortedHangIDsByCreationDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__HTHangsDataEntry_sortedHangIDsByCreationDate___block_invoke;
  v8[3] = &unk_250E631C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __48__HTHangsDataEntry_sortedHangIDsByCreationDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
}

+ (id)sortedEntriesByFileType:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_14);
}

uint64_t __44__HTHangsDataEntry_sortedEntriesByFileType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isLogFile");
  v7 = objc_msgSend(v5, "isLogFile");
  if (v6 && v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[HTHangSymbolicator isLogFileSymbolicated:](HTHangSymbolicator, "isLogFileSymbolicated:", v10);

    if (v11)
    {
      v12 = 1;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileURLWithPath:isDirectory:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[HTHangSymbolicator isLogFileSymbolicated:](HTHangSymbolicator, "isLogFileSymbolicated:", v16);

    if (v17)
    {
      v12 = -1;
      goto LABEL_13;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v13 = v6 | v7;
  if (v6)
    v12 = -1;
  else
    v12 = 1;
  if ((v13 & 1) == 0)
    goto LABEL_12;
LABEL_13:

  return v12;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)hangID
{
  return self->_hangID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)processBundleID
{
  return self->_processBundleID;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (LSApplicationRecord)processRecord
{
  return self->_processRecord;
}

- (BOOL)isLogFile
{
  return self->_isLogFile;
}

- (BOOL)isBeingProcessed
{
  return self->_isBeingProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processRecord, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_processBundleID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_hangID, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
