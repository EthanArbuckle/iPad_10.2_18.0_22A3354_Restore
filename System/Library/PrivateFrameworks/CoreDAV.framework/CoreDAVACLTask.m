@implementation CoreDAVACLTask

- (CoreDAVACLTask)initWithURL:(id)a3
{
  CDVInheritedInitializerUsageDisallowed();
}

- (CoreDAVACLTask)initWithAccessControlEntities:(id)a3 atURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CoreDAVACLTask *v10;
  CoreDAVACLTask *v11;
  id v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7 || (v9 = v8, !objc_msgSend(v7, "count")))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Non-nil and non-empty accessControlEntities required."), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVACLTask;
  v10 = -[CoreDAVTask initWithURL:](&v14, sel_initWithURL_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_accessControlEntities, a3);

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVACLTask;
  -[CoreDAVTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVACLTask accessControlEntities](self, "accessControlEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Number of access control entities: [%lu]"), objc_msgSend(v5, "count"));

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("ACL");
}

- (id)requestBody
{
  CoreDAVXMLData *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("acl"), CFSTR("DAV:"), 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CoreDAVACLTask accessControlEntities](self, "accessControlEntities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "write:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("acl"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v3, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v23 = (id)objc_opt_class();
          v11 = v23;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_9:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v23 = (id)objc_opt_class();
        v24 = 2112;
        v25 = v5;
        v11 = v23;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 22;
        goto LABEL_9;
      }
LABEL_10:

    }
    v17 = v5;
  }
  self->super._numDownloadedElements = 0;
  -[CoreDAVTask delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "aclTask:error:", self, v5);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v21.receiver = self;
  v21.super_class = (Class)CoreDAVACLTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v21, sel_finishCoreDAVTaskWithError_, v5);

}

- (NSArray)accessControlEntities
{
  return self->_accessControlEntities;
}

- (void)setAccessControlEntities:(id)a3
{
  objc_storeStrong((id *)&self->_accessControlEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEntities, 0);
}

@end
