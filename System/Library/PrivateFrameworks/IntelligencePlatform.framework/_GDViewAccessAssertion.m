@implementation _GDViewAccessAssertion

- (_GDViewAccessAssertion)initWithViewName:(id)a3 extensionToken:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _GDViewAccessAssertion *v10;
  const char *v11;
  uint64_t v12;
  _GDViewAccessAssertion *v13;
  uint64_t v14;
  NSString *viewName;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSURL *viewArtifactURL;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *viewArtifactTableName;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSString *v46;
  NSURL *v47;
  _GDViewAccessAssertion *v48;
  void *v50;
  int *v51;
  char *v52;
  const char *v53;
  NSURL *v54;
  NSObject *v55;
  id v56;
  const char *v57;
  void *v58;
  const char *v59;
  NSString *v60;
  objc_super v61;
  uint64_t v62;
  NSURL *v63;
  uint8_t buf[4];
  NSString *v65;
  __int16 v66;
  NSURL *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v61.receiver = self;
  v61.super_class = (Class)_GDViewAccessAssertion;
  v10 = -[_GDViewAccessAssertion init](&v61, sel_init);
  v13 = v10;
  if (!v10)
    goto LABEL_7;
  v10->_handle = -1;
  v14 = objc_msgSend_copy(v8, v11, v12);
  viewName = v13->_viewName;
  v13->_viewName = (NSString *)v14;

  objc_msgSend_url(v9, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v18, v19, v20);
  viewArtifactURL = v13->_viewArtifactURL;
  v13->_viewArtifactURL = (NSURL *)v21;

  objc_msgSend_tableName(v9, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_copy(v25, v26, v27);
  viewArtifactTableName = v13->_viewArtifactTableName;
  v13->_viewArtifactTableName = (NSString *)v28;

  v13->_alwaysAvailable = objc_msgSend_alwaysAvailable(v9, v30, v31);
  objc_msgSend_token(v9, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_length(v34, v35, v36);

  if (!v37)
  {
LABEL_7:
    v48 = v13;
    goto LABEL_8;
  }
  objc_msgSend_token(v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bytes(v40, v41, v42);
  v43 = sandbox_extension_consume();
  if (v43 != -1)
  {
    v44 = v43;
    GDViewLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v13->_viewName;
      v47 = v13->_viewArtifactURL;
      *(_DWORD *)buf = 138412546;
      v65 = v46;
      v66 = 2112;
      v67 = v47;
      _os_log_impl(&dword_1AE4F2000, v45, OS_LOG_TYPE_DEFAULT, "Consumed sandbox extension for %@ at %@", buf, 0x16u);
    }

    v13->_handle = v44;
    goto LABEL_7;
  }
  v50 = (void *)MEMORY[0x1E0CB3940];
  v51 = __error();
  v52 = strerror(*v51);
  objc_msgSend_stringWithCString_encoding_(v50, v53, (uint64_t)v52, 4);
  v54 = (NSURL *)objc_claimAutoreleasedReturnValue();
  GDViewLog();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
  {
    v60 = v13->_viewName;
    *(_DWORD *)buf = 138412546;
    v65 = v60;
    v66 = 2112;
    v67 = v54;
    _os_log_fault_impl(&dword_1AE4F2000, v55, OS_LOG_TYPE_FAULT, "Error consuming sandbox extension token for %@: %@", buf, 0x16u);
  }

  if (a5)
  {
    v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v62 = *MEMORY[0x1E0CB2D50];
    v63 = v54;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)&v63, &v62, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v56, v59, (uint64_t)CFSTR("GDErrorDomain"), 11, v58);

  }
  v48 = 0;
LABEL_8:

  return v48;
}

- (void)dealloc
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSURL *viewArtifactURL;
  NSString *viewName;
  int *v9;
  char *v10;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_handle != -1)
  {
    v3 = sandbox_extension_release();
    GDViewLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == -1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        viewName = self->_viewName;
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 138412546;
        v13 = viewName;
        v14 = 2080;
        v15 = v10;
        _os_log_fault_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_FAULT, "Error releasing sandbox extension token for %@: %s", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_viewName;
      viewArtifactURL = self->_viewArtifactURL;
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = viewArtifactURL;
      _os_log_impl(&dword_1AE4F2000, v5, OS_LOG_TYPE_DEFAULT, "Released sandbox extension for %@ at %@", buf, 0x16u);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)_GDViewAccessAssertion;
  -[_GDViewAccessAssertion dealloc](&v11, sel_dealloc);
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSURL)viewArtifactURL
{
  return self->_viewArtifactURL;
}

- (NSString)viewArtifactTableName
{
  return self->_viewArtifactTableName;
}

- (BOOL)alwaysAvailable
{
  return self->_alwaysAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewArtifactTableName, 0);
  objc_storeStrong((id *)&self->_viewArtifactURL, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
}

@end
