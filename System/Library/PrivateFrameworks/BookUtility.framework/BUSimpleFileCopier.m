@implementation BUSimpleFileCopier

- (BUSimpleFileCopier)initWithURL:(id)a3
{
  id v5;
  BUSimpleFileCopier *v6;
  BUSimpleFileCopier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUSimpleFileCopier;
  v6 = -[BUSimpleFileCopier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fromURL, a3);

  return v7;
}

- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  objc_msgSend_fromURL(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend_countFilesAndSizesInDirectory_totalFileSize_totalFileCount_totalFileCountExcludeDir_(BUSimpleFileCopier, v10, (uint64_t)v9, a3, 0, a4);
  return (char)a4;
}

- (void)_finishCurrentCopyItem
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  char isEqualToString;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;

  objc_msgSend_currentCopyItemURL(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_path(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend_attributesOfItemAtPath_error_(v11, v12, (uint64_t)v8, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;

    if (!v14)
    {
      objc_msgSend_objectForKeyedSubscript_(v13, v15, *MEMORY[0x24BDD0D30]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x24BDD0D38]);

      if ((isEqualToString & 1) == 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v13, v19, *MEMORY[0x24BDD0D08]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_longLongValue(v20, v21, v22);
        objc_msgSend_delegate(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_respondsToSelector();

        if ((v27 & 1) != 0)
        {
          objc_msgSend_delegate(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_didCopyItemToURL_fileSize_(v30, v31, (uint64_t)v7, v23);

        }
      }
    }

  }
  objc_msgSend_setCurrentCopyItemURL_(self, v5, 0);

}

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int shouldCopyItemToURL;
  BOOL v18;

  v6 = a5;
  objc_msgSend__finishCurrentCopyItem(self, v7, v8);
  objc_msgSend_delegate(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && (objc_msgSend_delegate(self, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        shouldCopyItemToURL = objc_msgSend_shouldCopyItemToURL_(v15, v16, (uint64_t)v6),
        v15,
        !shouldCopyItemToURL))
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend_setCurrentCopyItemURL_(self, v13, (uint64_t)v6);
    v18 = 1;
  }

  return v18;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  char ResourceValue_forKey_error;
  id v25;
  id v26;
  const char *v27;
  char v28;
  id v29;
  const char *v30;
  uint64_t v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  id v37;
  id v38;

  v6 = (objc_class *)MEMORY[0x24BDD1580];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend_setDelegate_(v8, v9, (uint64_t)self);
  objc_msgSend_fromURL(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_path(v7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fromURL(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v22 = *MEMORY[0x24BDBCC60];
  v37 = 0;
  ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v21, v23, (uint64_t)&v38, v22, &v37);
  v25 = v38;
  v26 = v37;

  if ((ResourceValue_forKey_error & 1) != 0)
  {
    v36 = v26;
    v28 = objc_msgSend_copyItemAtPath_toPath_error_(v8, v27, (uint64_t)v15, v18, &v36);
    v29 = v36;

    objc_msgSend__finishCurrentCopyItem(self, v30, v31);
    if ((v28 & 1) != 0)
    {
      v32 = 1;
      v26 = v29;
      if (!a4)
        goto LABEL_13;
      goto LABEL_12;
    }
    v26 = v29;
  }
  else
  {
    BookUtilityLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_212E6CA78(self, (const char *)v26, v33);

  }
  BookUtilityLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_212E6CA04((uint64_t)v26, v34);

  v32 = 0;
  if (a4)
LABEL_12:
    *a4 = objc_retainAutorelease(v26);
LABEL_13:

  return v32;
}

+ (BOOL)countFilesAndSizesInDirectory:(id)a3 totalFileSize:(unint64_t *)a4 totalFileCount:(unint64_t *)a5 totalFileCountExcludeDir:(unint64_t *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  char isEqualToString;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  unint64_t *v39;
  unint64_t *v40;
  unint64_t *v41;
  id v42;

  v9 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumeratorAtPath_(v12, v13, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v39 = a4;
    v40 = a5;
    v41 = a6;
    v42 = v9;
    objc_msgSend_nextObject(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = *MEMORY[0x24BDD0D30];
      v24 = *MEMORY[0x24BDD0D38];
      v25 = *MEMORY[0x24BDD0D08];
      do
      {
        objc_msgSend_fileAttributes(v14, v18, v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v26, v27, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v28, v29, v24);

        if ((isEqualToString & 1) == 0)
        {
          ++v22;
          objc_msgSend_objectForKeyedSubscript_(v26, v31, v25);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v20 += objc_msgSend_longLongValue(v32, v33, v34);

        }
        objc_msgSend_nextObject(v14, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        ++v21;
      }
      while (v37);
    }
    else
    {
      v22 = 0;
      v21 = 0;
      v20 = 0;
    }
    if (v39)
      *v39 = v20;
    if (v40)
      *v40 = v21;
    v9 = v42;
    if (v41)
      *v41 = v22;
  }

  return v14 != 0;
}

- (BUFileCopierDelegate)delegate
{
  return (BUFileCopierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)fromURL
{
  return self->_fromURL;
}

- (void)setFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_fromURL, a3);
}

- (NSURL)currentCopyItemURL
{
  return self->_currentCopyItemURL;
}

- (void)setCurrentCopyItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentCopyItemURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCopyItemURL, 0);
  objc_storeStrong((id *)&self->_fromURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
