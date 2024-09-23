@implementation CLSContextProviderService

- (CLSContextProviderService)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSContextProviderService)initWithExtension:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CLSContextProviderService;
  v6 = -[CLSContextProviderService init](&v41, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.ClassKit.ContextProviderServiceConnection", v8);
    v10 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v9;

    objc_storeStrong((id *)v6 + 2, a3);
    objc_msgSend_identifier(v5, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v13;

    v15 = objc_alloc(MEMORY[0x1E0CA5848]);
    v17 = (void *)objc_msgSend_initWithBundleIdentifier_error_(v15, v16, *((_QWORD *)v6 + 8), 0);
    v20 = v17;
    if (v17)
    {
      objc_msgSend_containingBundleRecord(v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_infoDictionary(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleIdentifier(v21, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)*((_QWORD *)v6 + 9);
      *((_QWORD *)v6 + 9) = v27;

      v29 = *MEMORY[0x1E0C9AE88];
      v30 = objc_opt_class();
      objc_msgSend_objectForKey_ofClass_(v24, v31, v29, v30);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)*((_QWORD *)v6 + 10);
      *((_QWORD *)v6 + 10) = v32;

      if (!objc_msgSend_length(*((void **)v6 + 10), v34, v35))
        objc_storeStrong((id *)v6 + 10, *((id *)v6 + 9));
      objc_msgSend_localizedName(v21, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)*((_QWORD *)v6 + 11);
      *((_QWORD *)v6 + 11) = v38;

    }
  }

  return (CLSContextProviderService *)v6;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *serviceConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A10AC;
  block[3] = &unk_1E974B678;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serviceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  NSObject *serviceConnectionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D40A1708;
  v4[3] = &unk_1E974AA98;
  objc_copyWeak(&v5, &location);
  dispatch_async(serviceConnectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)getMainAppContextPathWithCompletion:(id)a3
{
  id v4;
  NSObject *serviceConnectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A185C;
  block[3] = &unk_1E974B678;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serviceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serviceConnectionQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40A1BCC;
  v11[3] = &unk_1E974B6A0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(serviceConnectionQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("CLSContextProviderService: <%p>\n"), self);
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("  extensionIdentifier: %@\n"), self->_extensionIdentifier);
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("  appIdentifier      : %@\n"), self->_appIdentifier);
  objc_msgSend_appendFormat_(v3, v7, (uint64_t)CFSTR("  appName            : %@\n"), self->_appName);
  objc_msgSend_appendFormat_(v3, v8, (uint64_t)CFSTR("  localizedAppName   : %@\n"), self->_localizedAppName);
  objc_msgSend_appendFormat_(v3, v9, (uint64_t)CFSTR("  mainAppContextPath : %@\n"), self->_mainAppContextPath);
  v10 = atomic_load((unsigned int *)&self->_connectionCount);
  objc_msgSend_appendFormat_(v3, v11, (uint64_t)CFSTR("  connectionCount    : %d\n"), v10);
  v14 = (void *)objc_msgSend_copy(v3, v12, v13);

  return v14;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_mainAppContextPath, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_serviceConnectionQueue, 0);
}

@end
