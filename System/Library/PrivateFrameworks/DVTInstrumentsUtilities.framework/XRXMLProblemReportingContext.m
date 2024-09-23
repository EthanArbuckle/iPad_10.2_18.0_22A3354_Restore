@implementation XRXMLProblemReportingContext

- (XRXMLProblemReportingContext)init
{
  XRXMLProblemReportingContext *v2;
  XRXMLProblemReportingContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)XRXMLProblemReportingContext;
  v2 = -[XRXMLProblemReportingContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_log, MEMORY[0x24BDACB78]);
    v3->_passed = 1;
  }
  return v3;
}

- (void)reportProblemWithElement:(id)a3 failure:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSFileHandle *errorFile;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *log;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = [v7 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v9, v10, (uint64_t)v8, (uint64_t)&v45, v11);

  if (objc_msgSend_length(v12, v13, v14, v15, v16))
  {
    objc_msgSend_path(self->_urlBeingParsed, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    errorFile = self->_errorFile;
    objc_msgSend_lineAndColumnForElementStart(v6, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xr_writeStringWithFormat_(errorFile, v28, (uint64_t)CFSTR("%@:%@: error: %@\n"), v29, v30, v21, v27, v12);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v32 = log;
      objc_msgSend_lineAndColumnForElementStart(v6, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v21;
      v40 = 2112;
      v41 = v37;
      v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_22634C000, v32, OS_LOG_TYPE_ERROR, "%@:%@: error: %@\n", buf, 0x20u);

    }
    self->_passed = 0;

  }
}

- (void)reportWarningWithElement:(id)a3 failure:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSFileHandle *errorFile;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *log;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = [v7 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v9, v10, (uint64_t)v8, (uint64_t)&v45, v11);

  if (objc_msgSend_length(v12, v13, v14, v15, v16))
  {
    objc_msgSend_path(self->_urlBeingParsed, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    errorFile = self->_errorFile;
    objc_msgSend_lineAndColumnForElementStart(v6, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xr_writeStringWithFormat_(errorFile, v28, (uint64_t)CFSTR("%@:%@: warning: %@\n"), v29, v30, v21, v27, v12);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v32 = log;
      objc_msgSend_lineAndColumnForElementStart(v6, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v21;
      v40 = 2112;
      v41 = v37;
      v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_22634C000, v32, OS_LOG_TYPE_ERROR, "%@:%@: warning: %@\n", buf, 0x20u);

    }
  }

}

- (NSFileHandle)errorFile
{
  return self->_errorFile;
}

- (void)setErrorFile:(id)a3
{
  objc_storeStrong((id *)&self->_errorFile, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSURL)urlBeingParsed
{
  return self->_urlBeingParsed;
}

- (void)setUrlBeingParsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)passed
{
  return self->_passed;
}

- (void)setPassed:(BOOL)a3
{
  self->_passed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingParsed, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_errorFile, 0);
}

@end
