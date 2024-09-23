@implementation BUUnarchivingFileCopier

- (BUUnarchivingFileCopier)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  BUUnarchivingFileCopier *v10;
  void *v11;
  id v12;
  NSObject *p_super;
  BUZipFileArchive *v14;
  BUUnarchivingFileCopier *v15;
  BUUnarchivingFileCopier *v16;
  id v18;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BUUnarchivingFileCopier;
  v10 = -[BUUnarchivingFileCopier init](&v19, sel_init);
  if (v10)
  {
    v18 = 0;
    objc_msgSend_zipArchiveFromURL_options_error_(BUZipFileArchive, v9, (uint64_t)v8, a4, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v12)
    {
      BUZipLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_212E6D90C((uint64_t)v8, (uint64_t)v12, p_super);
    }
    else
    {
      v14 = v11;
      p_super = &v10->_zipArchive->super.super;
      v10->_zipArchive = v14;
    }

    if (a5)
      goto LABEL_9;
  }
  else
  {
    v12 = 0;
    if (a5)
LABEL_9:
      *a5 = objc_retainAutorelease(v12);
  }
  if (v12)
    v15 = 0;
  else
    v15 = v10;
  v16 = v15;

  return v16;
}

- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_zipArchive(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
  {
    if (a3)
      *a3 = objc_msgSend_totalSize(v6, v7, v8);
    if (a4)
      *a4 = objc_msgSend_entriesCount(v9, v7, v8);
  }

  return v9 != 0;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  char Entry;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  objc_msgSend_zipArchive(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_delegate(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zipArchive(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_212E65E78;
    v23[3] = &unk_24CEDAC88;
    v24 = v12;
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = sub_212E65ED0;
    v21[3] = &unk_24CEDACB0;
    v22 = v24;
    v17 = v24;
    Entry = objc_msgSend_extractToURL_error_shouldExtractEntry_didExtractEntry_(v15, v18, (uint64_t)v6, a4, v23, v21);

  }
  else
  {
    Entry = 0;
  }

  return Entry;
}

- (BUFileCopierDelegate)delegate
{
  return (BUFileCopierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BUZipFileArchive)zipArchive
{
  return self->_zipArchive;
}

- (void)setZipArchive:(id)a3
{
  objc_storeStrong((id *)&self->_zipArchive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipArchive, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
