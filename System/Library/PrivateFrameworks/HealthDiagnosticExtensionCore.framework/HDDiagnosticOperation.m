@implementation HDDiagnosticOperation

- (HDDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3
{
  id v4;
  HDDiagnosticOperation *v5;
  uint64_t v6;
  NSURL *attachmentDirectoryURL;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDiagnosticOperation;
  v5 = -[HDDiagnosticOperation init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attachmentDirectoryURL = v5->_attachmentDirectoryURL;
    v5->_attachmentDirectoryURL = (NSURL *)v6;

    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

+ (id)operationWithAttachmentDirectoryURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttachmentDirectoryURL:", v4);

  return v5;
}

- (NSArray)attachments
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__HDDiagnosticOperation_attachments__block_invoke;
  v5[3] = &unk_24E0D8CB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__HDDiagnosticOperation_attachments__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSURL)healthDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Health"), 1);
}

- (NSString)reportFilename
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.txt"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)main
{
  NSObject *queue;
  _QWORD block[5];

  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Running..."));
  -[HDDiagnosticOperation run](self, "run");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HDDiagnosticOperation_main__block_invoke;
  block[3] = &unk_24E0D8CD8;
  block[4] = self;
  dispatch_sync(queue, block);
  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Finished running %@"), objc_opt_class());
}

void __29__HDDiagnosticOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "reportContents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "reportFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attachmentDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", CFSTR("Writing %@..."), v9);

    v14 = 0;
    LOBYTE(v9) = objc_msgSend(v2, "writeToURL:atomically:encoding:error:", v7, 1, 4, &v14);
    v10 = v14;
    if ((v9 & 1) == 0)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v7, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "log:", CFSTR("ERROR: Failed to write %@: %@"), v12, v10);

    }
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setReportContents:", v13);

  }
  else
  {
    objc_msgSend(v4, "log:", CFSTR("No report"));
  }

}

- (void)appendString:(id)a3
{
  -[HDDiagnosticOperation _appendString:newLine:](self, "_appendString:newLine:", a3, 1);
}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[HDDiagnosticOperation _appendString:newLine:](self, "_appendString:newLine:", v6, 1);
}

- (void)appendNewline
{
  -[HDDiagnosticOperation _appendString:newLine:](self, "_appendString:newLine:", &stru_24E0DA908, 1);
}

- (void)_appendString:(id)a3 newLine:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HDDiagnosticOperation__appendString_newLine___block_invoke;
  block[3] = &unk_24E0D8D00;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __47__HDDiagnosticOperation__appendString_newLine___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 280);
    *(_QWORD *)(v4 + 280) = v3;

    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[35];
    objc_msgSend(v6, "_headerString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  }
  result = objc_msgSend(v2, "appendString:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "appendString:", CFSTR("\n"));
  return result;
}

- (id)_headerString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDeviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInternalDeviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDeviceDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDeviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentOSName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentOSBuild");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Date:    %@\nDevice:  %@ %@\nName:    %@ (%@)\nBuild:   %@ %@\n\n\n"), v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)appendSeparator
{
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("------------------------------------------------------------------------------------------"));
}

- (void)appendStrongSeparator
{
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("=========================================================================================="));
}

- (void)submitAttachment:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HDDiagnosticOperation_submitAttachment___block_invoke;
  v7[3] = &unk_24E0D8D28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __42__HDDiagnosticOperation_submitAttachment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAttachment:", *(_QWORD *)(a1 + 40));
}

- (void)submitAttachments:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HDDiagnosticOperation *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HDDiagnosticOperation_submitAttachments___block_invoke;
  v7[3] = &unk_24E0D8D28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __43__HDDiagnosticOperation_submitAttachments___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_queue_submitAttachment:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_queue_submitAttachment:(id)a3
{
  id v4;
  NSMutableArray *attachments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attachments = self->_attachments;
  v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_attachments;
    self->_attachments = v6;

    v4 = v8;
    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v4);

}

- (void)log:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  -[HDDiagnosticOperation delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diagnosticOperation:logMessage:", self, v6);

}

- (BOOL)copyDatabaseFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  sqlite3 *v15;
  sqlite3 *ppDb;

  v6 = a3;
  v7 = a4;
  ppDb = 0;
  v8 = objc_retainAutorelease(v6);
  v9 = sqlite3_open_v2((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &ppDb, 1, 0);
  if ((_DWORD)v9)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Could not open original database at '%@'. %s (%d)\n"), v8, sqlite3_errmsg(ppDb), v9);
  }
  else
  {
    v15 = 0;
    v10 = objc_retainAutorelease(v7);
    v11 = sqlite3_open_v2((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v15, 6, 0);
    if (!(_DWORD)v11)
    {
      v13 = -[HDDiagnosticOperation _copyDatabase:toDatabase:](self, "_copyDatabase:toDatabase:", ppDb, v15);
      sqlite3_close(ppDb);
      sqlite3_close(v15);
      goto LABEL_6;
    }
    v12 = v11;
    sqlite3_close(ppDb);
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Could not open destination database at '%@'. %s (%d)\n"), v10, sqlite3_errmsg(ppDb), v12);
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (id)openReadOnlyDatabaseAtURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40E30]), "initWithDatabaseURL:", v4);
  v11 = 0;
  v6 = objc_msgSend(v5, "openForReadingWithError:", &v11);
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to open database at '%@': %@"), v4, v7);
    objc_msgSend(v5, "close");
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (int64_t)fileSizeForURL:(id)a3
{
  stat v4;

  memset(&v4, 0, sizeof(v4));
  if (stat((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v4))
  {
    return -1;
  }
  else
  {
    return v4.st_size;
  }
}

- (id)fileCreationDateForURL:(id)a3
{
  void *v3;
  void *v4;

  -[HDDiagnosticOperation _fileAttributesAtURL:](self, "_fileAttributesAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fileModificationDateForURL:(id)a3
{
  void *v3;
  void *v4;

  -[HDDiagnosticOperation _fileAttributesAtURL:](self, "_fileAttributesAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fileAttributesAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to get file attributes at path \"%@\": %@"), v9, v8);

  }
  return v7;
}

- (id)stringFromDate:(id)a3
{
  return (id)HKDiagnosticStringFromDate();
}

- (double)absoluteTimeForTimespec:(timespec)a3
{
  return (double)a3.tv_nsec / 1000000000.0 + (double)a3.tv_sec - *MEMORY[0x24BDBD238];
}

- (id)prettyPrintFileSize:(int64_t)a3
{
  double v3;
  uint64_t v5;

  if (a3 > 1023)
  {
    if ((unint64_t)a3 >> 20)
    {
      v3 = (double)a3;
      if ((unint64_t)a3 >> 30)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.3lfG (%lld bytes)"), v3 * 9.31322575e-10, a3);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.3lfM (%lld bytes)"), v3 * 0.000000953674316, a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.3lfK (%lld bytes)"), (double)a3 * 0.0009765625, a3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld bytes"), a3, v5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)getFileStatisticsForDirectoryWithURL:(id)a3 earliestModificationDate:(double *)a4 totalFileSize:(int64_t *)a5 maxFileSize:(int64_t *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  uint64_t v32;
  int64_t *v33;
  int64_t *v34;
  double *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v41 = 0;
  objc_msgSend(MEMORY[0x24BE40AC8], "journalChaptersForURL:error:", v10, &v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v41;
  if (!v11)
  {
    objc_msgSend(v10, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to retrieve contents of %@ directory: %@"), v29, v12);
LABEL_18:

    v30 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("No files in %@"), v29, v32);
    goto LABEL_18;
  }
  v33 = a5;
  v34 = a6;
  v35 = a4;
  v36 = v12;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = 0;
    v21 = *(_QWORD *)v38;
    v22 = 1.79769313e308;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v16);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "size");
        if (objc_msgSend(v24, "size") > v20)
          v20 = objc_msgSend(v24, "size");
        objc_msgSend(v24, "modificationTime");
        if (v26 != v15)
        {
          objc_msgSend(v24, "modificationTime");
          if (v27 < v22)
          {
            objc_msgSend(v24, "modificationTime");
            v22 = v28;
          }
        }
        v19 += v25;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v22 = 1.79769313e308;
  }

  if (v33)
    *v33 = v19;
  v12 = v36;
  if (v34)
    *v34 = v20;
  if (v35)
    *v35 = v22;
  v30 = objc_msgSend(v16, "count");
LABEL_27:

  return v30;
}

- (void)reportStatsForDatabaseAtURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("SQLite database %@:"), v8);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__HDDiagnosticOperation_reportStatsForDatabaseAtURL___block_invoke;
    v14[3] = &unk_24E0D8D50;
    v14[4] = self;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x22078C350](v14);
    ((void (**)(_QWORD, id))v9)[2](v9, v4);
    objc_msgSend(v4, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-wal"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathExtension:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v9)[2](v9, v13);
  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("No file present at %@."), v4);
  }

}

void __53__HDDiagnosticOperation_reportStatsForDatabaseAtURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  id v16;

  v16 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "fileSizeForURL:");
  v4 = *(void **)(a1 + 32);
  if (v3 < 0)
  {
    objc_msgSend(v16, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = __error();
    objc_msgSend(v4, "log:", CFSTR("Failed to get file size for \"%@\": %s"), v13, strerror(*v15));
  }
  else
  {
    v5 = v3;
    objc_msgSend(v16, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\t%@:"), v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "prettyPrintFileSize:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\t\tSize:\t\t%@"), v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "fileCreationDateForURL:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\t\tCreated:\t%@"), v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "fileModificationDateForURL:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("\t\tModified:\t%@"), v14);

  }
}

- (void)verifyPermissionsForFileAtURL:(id)a3
{
  id v4;
  void *v5;
  int *v6;
  char *v7;
  char *pw_name;
  void *v9;
  char st_mode;
  void *v11;
  stat v12;

  memset(&v12, 0, sizeof(v12));
  v4 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v12))
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __error();
    v7 = strerror(*v6);
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to stat '%@' when verifying permissions: %s"), v5, v7, *(_QWORD *)&v12.st_dev, v12.st_ino);
LABEL_9:

    goto LABEL_10;
  }
  if (v12.st_uid != 501)
  {
    pw_name = getpwuid(v12.st_uid)->pw_name;
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("ERROR: Unexpected owner (%s) of file at %@"), pw_name, v9, *(_QWORD *)&v12.st_dev, v12.st_ino);

  }
  st_mode = v12.st_mode;
  if ((v12.st_mode & 0x100) == 0)
  {
    objc_msgSend(v4, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("ERROR: Owner lacks read permission for file at %@"), v11);

    st_mode = v12.st_mode;
  }
  if ((st_mode & 0x80) == 0)
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("ERROR: Owner lacks write permission for file at %@"), v5);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)reportIntegrityForDatabase:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Checking integrity for %@..."), v6);

  v7 = MEMORY[0x24BDAC760];
  v17 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke;
  v16[3] = &unk_24E0D8858;
  v16[4] = self;
  LOBYTE(v6) = objc_msgSend(v4, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("PRAGMA INTEGRITY_CHECK"), &v17, 0, v16);
  v8 = v17;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("\tERROR: Failed to perform integrity check on %@: %@"), v10, v8);

  }
  objc_msgSend(v4, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Checking foreign keys for %@..."), v12);

  v14[4] = self;
  v15 = v8;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke_2;
  v14[3] = &unk_24E0D8858;
  LOBYTE(v12) = objc_msgSend(v4, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("PRAGMA FOREIGN_KEY_CHECK"), &v15, 0, v14);
  v13 = v15;

  if ((v12 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("\tERROR: Failed to perform foreign key check: %@"), v13);

}

uint64_t __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  MEMORY[0x22078BF9C](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ok")) & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    MEMORY[0x22078BF9C](a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tINTEGRITY_CHECK: %@"), v6);

  }
  return 1;
}

uint64_t __52__HDDiagnosticOperation_reportIntegrityForDatabase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  MEMORY[0x22078BF9C](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x22078BF9C](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF9C](a2, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tFOREIGN_KEY_CHECK: %@ row %lld has invalid reference to %@ (%@)"), v4, v5, v6, v7);

  return 1;
}

- (void)checkSchemaVersionForDatabase:(id)a3 currentSchema:(int)a4 futureSchema:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v29[4] = &v31;
  v30 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __82__HDDiagnosticOperation_checkSchemaVersionForDatabase_currentSchema_futureSchema___block_invoke;
  v29[3] = &unk_24E0D8D78;
  v9 = objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("PRAGMA USER_VERSION;"),
         &v30,
         0,
         v29);
  v10 = v30;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v8, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to check schema version for %@ database: %@"), v12, v10);

  }
  v13 = v32[3];
  if (v13 == (int)v6)
  {
    v14 = CFSTR("Database has current schema version %lld");
LABEL_7:
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", v14, v32[3]);
    goto LABEL_19;
  }
  if (v13 == (int)v5)
  {
    v14 = CFSTR("Database has future migrations enabled with schema version %lld");
    goto LABEL_7;
  }
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("ERROR: database has unexpected schema version %lld; current is %d, future is %d"),
    v13,
    v6,
    v5);
  v28 = v10;
  objc_msgSend(v8, "dumpSchemaWithError:", &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v28;

  if (v15)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Schema for %@:"), v20);
          objc_msgSend(v16, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@"), v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v17);
    }
  }
  else
  {
    objc_msgSend(v8, "fileURL");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to extract schema for %@ database: %@"), v22, v23);

  }
  v10 = v23;
LABEL_19:
  _Block_object_dispose(&v31, 8);

}

uint64_t __82__HDDiagnosticOperation_checkSchemaVersionForDatabase_currentSchema_futureSchema___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

- (void)reportCountsForDatabase:(id)a3 entityClasses:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HDDiagnosticOperation _reportCountOfObjectsForEntityClass:database:](self, "_reportCountOfObjectsForEntityClass:database:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)_copyDatabase:(sqlite3 *)a3 toDatabase:(sqlite3 *)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = sqlite3_file_control(a4, 0, 102, a3);
  if ((_DWORD)v6)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Could not perform database copy: %s (%d)"), sqlite3_errmsg(a4), v6);
    return 0;
  }
  v7 = sqlite3_exec(a4, "PRAGMA wal_checkpoint(RESTART);", 0, 0, 0);
  if ((_DWORD)v7)
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Could not checkpoint copied SQLite file: %s (%d)"), sqlite3_errmsg(a4), v7);
    return 0;
  }
  return 1;
}

- (int64_t)_reportCountOfObjectsForEntityClass:(Class)a3 database:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a4;
  -[objc_class databaseTable](a3, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDDiagnosticOperation _reportCountOfObjectsInTable:database:](self, "_reportCountOfObjectsInTable:database:", v7, v6);

  return v8;
}

- (int64_t)_reportCountOfObjectsInTable:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  HDDiagnosticOperation *v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __63__HDDiagnosticOperation__reportCountOfObjectsInTable_database___block_invoke;
  v17 = &unk_24E0D8C60;
  v20 = &v22;
  v18 = self;
  v9 = v6;
  v19 = v9;
  v10 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", v8, &v21, 0, &v14);
  v11 = v21;

  if ((v10 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to count rows in table '%@': %@"), v9, v11, v14, v15, v16, v17, v18);
  v12 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v12;
}

uint64_t __63__HDDiagnosticOperation__reportCountOfObjectsInTable_database___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%lld %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40));
  return 0;
}

- (HDDiagnosticOperationDelegate)delegate
{
  return (HDDiagnosticOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)attachmentDirectoryURL
{
  return self->_attachmentDirectoryURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableString)reportContents
{
  return self->_reportContents;
}

- (void)setReportContents:(id)a3
{
  objc_storeStrong((id *)&self->_reportContents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportContents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_attachmentDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
