@implementation BDSBookWidgetReadingHistoryDataFile

+ (id)sharedInstance
{
  if (qword_253F3C658 != -1)
    dispatch_once(&qword_253F3C658, &unk_24F089F58);
  return (id)qword_253F3C678;
}

- (BDSBookWidgetReadingHistoryDataFile)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSBookWidgetReadingHistoryDataFile *v6;
  void *v7;
  BDSSharedDataFile *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BDSSharedDataFile *dataFile;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BDSBookWidgetReadingHistoryDataFile;
  v6 = -[BDSBookWidgetReadingHistoryDataFile init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend_defaultDataURL(BDSBookWidgetReadingHistoryDataFile, v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [BDSSharedDataFile alloc];
    v12 = objc_msgSend_initWithURL_(v8, v9, (uint64_t)v7, v10, v11);
    dataFile = v6->_dataFile;
    v6->_dataFile = (BDSSharedDataFile *)v12;

  }
  return v6;
}

- (id)load
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataFile(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend_load_(v5, v6, (uint64_t)&v20, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;

  if (v10)
  {
    BDSWidgetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5A6B0();
LABEL_4:
    v12 = 0;
    goto LABEL_14;
  }
  if (!v9)
  {
    BDSWidgetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227D4F000, v11, OS_LOG_TYPE_DEFAULT, "Didn't find widget reading history data file, starting fresh.", buf, 2u);
    }
    goto LABEL_4;
  }
  v13 = (void *)MEMORY[0x24BDD1620];
  v14 = objc_opt_class();
  v19 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v13, v15, v14, (uint64_t)v9, (uint64_t)&v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  BDSWidgetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "Loaded widget reading history data read from disk: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_227E5A650();
  }

LABEL_14:
  return v12;
}

- (void)save:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *inited;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  id v42;
  uint8_t buf[8];
  id v44;

  v4 = (objc_class *)MEMORY[0x24BDD1618];
  v5 = a3;
  v6 = [v4 alloc];
  inited = (void *)objc_msgSend_initRequiringSecureCoding_(v6, v7, 1, v8, v9);
  objc_msgSend_setOutputFormat_(inited, v11, 200, v12, v13);
  objc_msgSend_encodeObject_forKey_(inited, v14, (uint64_t)v5, *MEMORY[0x24BDD0E88], v15);

  objc_msgSend_encodedData(inited, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataFile(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v28 = objc_msgSend_save_error_(v25, v26, (uint64_t)v20, (uint64_t)&v44, v27);
  v29 = v44;

  BDSWidgetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v28)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227D4F000, v31, OS_LOG_TYPE_DEFAULT, "Successfully saved widget reading history data.", buf, 2u);
    }
LABEL_10:

    v41 = v29;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_227E5A770();

  objc_msgSend_dataFile(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v29;
  v40 = objc_msgSend_remove_(v36, v37, (uint64_t)&v42, v38, v39);
  v41 = v42;

  if ((v40 & 1) == 0)
  {
    BDSWidgetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_227E5A710();
    v29 = v41;
    goto LABEL_10;
  }
LABEL_11:

}

+ (NSURL)defaultDataURL
{
  if (qword_25592A458 != -1)
    dispatch_once(&qword_25592A458, &unk_24F089F78);
  return (NSURL *)(id)qword_25592A450;
}

- (BDSSharedDataFile)dataFile
{
  return self->_dataFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFile, 0);
}

@end
