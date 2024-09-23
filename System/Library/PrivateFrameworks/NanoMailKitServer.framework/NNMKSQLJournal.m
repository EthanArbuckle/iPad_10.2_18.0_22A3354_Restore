@implementation NNMKSQLJournal

- (NNMKSQLJournal)initWithPath:(id)a3
{
  id v5;
  NNMKSQLJournal *v6;
  NNMKSQLJournal *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *journalQueue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NNMKSQLJournal;
  v6 = -[NNMKSQLJournal init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryPath, a3);
    v8 = dispatch_queue_create("com.apple.NanoMailKit.SQLJournal", 0);
    journalQueue = v7->_journalQueue;
    v7->_journalQueue = (OS_dispatch_queue *)v8;

    v7->_filesCount = -[NNMKSQLJournal _currentFilesCount](v7, "_currentFilesCount");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7->_directoryPath, 1, MEMORY[0x24BDBD1B8], 0);

  }
  return v7;
}

- (BOOL)appendSQLStatement:(id)a3
{
  id v4;
  NSObject *journalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__NNMKSQLJournal_appendSQLStatement___block_invoke;
  block[3] = &unk_24F9F6CE8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(journalQueue, block);
  LOBYTE(journalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)journalQueue;
}

void __37__NNMKSQLJournal_appendSQLStatement___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (objc_msgSend(*(id *)(a1 + 32), "isJournalOverflow"))
  {
    v2 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __37__NNMKSQLJournal_appendSQLStatement___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 16);
      *(_QWORD *)(v11 + 16) = v10;

    }
    objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appendBytes:length:", &v14, 8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appendData:", v13);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "length") >= 0xA00000)
      objc_msgSend(*(id *)(a1 + 32), "_flush");

  }
}

- (void)flushIfNeeded
{
  NSObject *journalQueue;
  _QWORD block[5];

  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__NNMKSQLJournal_flushIfNeeded__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_sync(journalQueue, block);
}

_QWORD *__31__NNMKSQLJournal_flushIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
    return (_QWORD *)objc_msgSend(result, "_flush");
  return result;
}

- (void)mergeUsingBlock:(id)a3
{
  id v4;
  NSObject *journalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[NNMKSQLJournal flushIfNeeded](self, "flushIfNeeded");
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__NNMKSQLJournal_mergeUsingBlock___block_invoke;
  block[3] = &unk_24F9F6D10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(journalQueue, block);

}

void __34__NNMKSQLJournal_mergeUsingBlock___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  id obj;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isJournalOverflow"))
  {
    v3 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      __34__NNMKSQLJournal_mergeUsingBlock___block_invoke_cold_1((uint64_t)v2, v3, v4);
  }
  else
  {
    objc_msgSend(*v2, "_sortedJournalFiles");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v30)
    {
      v26 = 0;
      v29 = *(_QWORD *)v34;
      *(_QWORD *)&v5 = 138543874;
      v25 = v5;
      v28 = v2;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(*((id *)*v2 + 1), "stringByAppendingPathComponent:", v7, v25);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v32 = 0;
            if (objc_msgSend(v9, "length"))
            {
              v11 = 0;
              while (1)
              {
                v12 = v11 + 8;
                if (v11 + 8 > objc_msgSend(v10, "length"))
                  break;
                objc_msgSend(v10, "getBytes:range:", &v32, v11, 8);
                v13 = v32 + v12;
                if (v13 > objc_msgSend(v10, "length"))
                {
                  v14 = qword_253E87A90;
                  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v38 = v7;
                    _os_log_error_impl(&dword_22E161000, v14, OS_LOG_TYPE_ERROR, "Error reading journal file - invalid length. (Path: %{public}@).", buf, 0xCu);
                  }
                }
                objc_msgSend(v10, "subdataWithRange:", v12, v32);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = v32 + v12;
                v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v15, 4);
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                if (v11 >= objc_msgSend(v10, "length"))
                  goto LABEL_22;
              }
              v18 = (void *)__logCategories;
              if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
              {
                v23 = v18;
                v24 = objc_msgSend(v10, "length");
                *(_DWORD *)buf = v25;
                v38 = v7;
                v39 = 2048;
                v40 = v11;
                v41 = 2048;
                v42 = v24;
                _os_log_error_impl(&dword_22E161000, v23, OS_LOG_TYPE_ERROR, "Error journal file has data at the end of it that is smaller than NSUInteger of new data. (Path: %{public}@) cursor: %lu data length: %lu.", buf, 0x20u);

              }
            }
LABEL_22:
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
            v20 = objc_msgSend(v19, "removeItemAtPath:error:", v8, &v31);
            v21 = v31;

            if ((v20 & 1) == 0)
            {
              v26 = objc_msgSend(v7, "longLongValue");
              v22 = qword_253E87A90;
              if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v38 = v7;
                v39 = 2114;
                v40 = (unint64_t)v21;
                _os_log_error_impl(&dword_22E161000, v22, OS_LOG_TYPE_ERROR, "Error deleting journal file after applying. (Path: %{public}@, Error: %{public}@).", buf, 0x16u);
              }
            }

            v2 = v28;
          }
          else
          {
            v17 = qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v38 = v7;
              _os_log_error_impl(&dword_22E161000, v17, OS_LOG_TYPE_ERROR, "Error reading journal file from file system. (Path: %{public}@).", buf, 0xCu);
            }
          }

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v30);
    }
    else
    {
      v26 = 0;
    }
    *((_QWORD *)*v2 + 4) = v26;

  }
}

- (void)deleteJournalFiles
{
  NSObject *journalQueue;
  _QWORD block[5];

  -[NNMKSQLJournal flushIfNeeded](self, "flushIfNeeded");
  journalQueue = self->_journalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NNMKSQLJournal_deleteJournalFiles__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_sync(journalQueue, block);
}

void __36__NNMKSQLJournal_deleteJournalFiles__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    __36__NNMKSQLJournal_deleteJournalFiles__block_invoke_cold_1(v2);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_journalFilesEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v16);
        v11 = v16;

        if ((v10 & 1) == 0)
        {
          v12 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
          {
            v13 = v12;
            objc_msgSend(v8, "lastPathComponent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v22 = v14;
            v23 = 2114;
            v24 = v11;
            _os_log_error_impl(&dword_22E161000, v13, OS_LOG_TYPE_ERROR, "Error deleting journal file. (Path: %{public}@, Error: %{public}@).", buf, 0x16u);

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

  *(_QWORD *)(*(_QWORD *)(v15 + 32) + 32) = 0;
}

- (BOOL)isJournalOverflow
{
  return self->_filesCount >> 4 > 0x270;
}

- (unint64_t)_currentFilesCount
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NNMKSQLJournal _journalFilesEnumerator](self, "_journalFilesEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "compare:", v4) == 1)
        {
          v8 = v7;

          v4 = v8;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);

    if (!v4)
      return 0;
    v3 = objc_msgSend(v4, "longLongValue") + 1;
    v2 = v4;
  }

  return v3;
}

- (id)_journalFilesEnumerator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_directoryPath);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v4, 5, &__block_literal_global_8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  return 1;
}

- (void)_flush
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_5(&dword_22E161000, a3, (uint64_t)a3, "Error flushing journal file. (Path: %{public}@ - Error: %{public}@).", (uint8_t *)&v3);
  OUTLINED_FUNCTION_15();
}

- (id)_nextFilePath
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.15lu"), self->_filesCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sortedJournalFiles
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", self->_directoryPath, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
  objc_storeStrong((id *)&self->_directoryPath, a3);
}

- (NSMutableData)currentFileData
{
  return self->_currentFileData;
}

- (void)setCurrentFileData:(id)a3
{
  objc_storeStrong((id *)&self->_currentFileData, a3);
}

- (OS_dispatch_queue)journalQueue
{
  return self->_journalQueue;
}

- (void)setJournalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_journalQueue, a3);
}

- (unint64_t)filesCount
{
  return self->_filesCount;
}

- (void)setFilesCount:(unint64_t)a3
{
  self->_filesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalQueue, 0);
  objc_storeStrong((id *)&self->_currentFileData, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

void __37__NNMKSQLJournal_appendSQLStatement___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22E161000, a1, a3, "Journal Files count hit the limit (more than %lu). No longer appending SQL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

void __34__NNMKSQLJournal_mergeUsingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = 10000;
  OUTLINED_FUNCTION_5(&dword_22E161000, a2, a3, "Unable to Merge, Journal Files count is %lu (exceeding limit: %lu)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_15();
}

void __36__NNMKSQLJournal_deleteJournalFiles__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Deleting journal files", v1, 2u);
}

void __41__NNMKSQLJournal__journalFilesEnumerator__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22E161000, a2, a3, "Error reading journal file from folder. (Error: %{public}@).", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_15();
}

@end
