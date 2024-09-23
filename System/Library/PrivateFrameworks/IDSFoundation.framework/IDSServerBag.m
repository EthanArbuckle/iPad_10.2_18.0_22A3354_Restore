@implementation IDSServerBag

- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4 contentProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSServerBag *v12;
  IDSServerBag *v13;
  IDSServerBagContentProvider *contentProvider;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  uint64_t v19;
  id v20;
  IDSServerBagLoadedContents *loadedContents;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  NSMutableDictionary *overrideValues;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  NSObject *v46;
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  objc_super v52;
  uint8_t buf[4];
  IDSServerBag *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v52.receiver = self;
  v52.super_class = (Class)IDSServerBag;
  v12 = -[IDSServerBag init](&v52, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_contentsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_config, a3);
    objc_storeStrong((id *)&v13->_contentProvider, a5);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    contentProvider = v13->_contentProvider;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_19BA29CA0;
    v49[3] = &unk_1E3C209B8;
    objc_copyWeak(&v50, &location);
    objc_msgSend_setContentsUpdatedBlock_(contentProvider, v15, (uint64_t)v49, v16);
    os_unfair_lock_lock(&v13->_contentsLock);
    v48 = 0;
    objc_msgSend_currentLoadedContentsWithError_(v11, v17, (uint64_t)&v48, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v48;
    loadedContents = v13->_loadedContents;
    v13->_loadedContents = (IDSServerBagLoadedContents *)v19;

    objc_msgSend_loadOverrideValuesIfPresent(v13->_contentProvider, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_mutableCopy(v25, v26, v27, v28);
    overrideValues = v13->_overrideValues;
    v13->_overrideValues = (NSMutableDictionary *)v29;

    objc_msgSend_dictionary(v13->_loadedContents, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_count(v34, v35, v36, v37);

    v42 = objc_msgSend_count(v13->_overrideValues, v39, v40, v41);
    os_unfair_lock_unlock(&v13->_contentsLock);
    objc_msgSend_logCategory(v9, v43, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v54 = v13;
      v55 = 2114;
      v56 = v9;
      v57 = 2112;
      v58 = v11;
      v59 = 2050;
      v60 = v38;
      v61 = 2050;
      v62 = v42;
      _os_log_impl(&dword_19B949000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ created {config: %{public}@, contentProvider: %@, loadedContents.count: %{public}llu, overrideValues.count: %{public}llu}", buf, 0x34u);
    }

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return v13;
}

+ (id)sharedInstanceForBagType:(int64_t)a3
{
  double v3;

  if (a3 == 1)
    objc_msgSend__sharedCourierBag(a1, a2, 1, v3);
  else
    objc_msgSend__sharedIDSBag(a1, a2, a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_sharedCourierBag
{
  if (qword_1ECDD4890 != -1)
    dispatch_once(&qword_1ECDD4890, &unk_1E3C1B7D0);
  return (id)qword_1ECDD4898;
}

- (id)objectForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;

  v4 = a3;
  os_unfair_lock_lock(&self->_contentsLock);
  if (CUTIsInternalInstall())
  {
    objc_msgSend_stringByAppendingString_(CFSTR("server-bag-"), v5, (uint64_t)v4, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedDefaults(MEMORY[0x1E0D36AF8], v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appValueForKey_(v12, v13, (uint64_t)v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      || objc_msgSend_count(self->_overrideValues, v16, v17, v18)
      && (objc_msgSend_objectForKey_(self->_overrideValues, v19, (uint64_t)v4, v20),
          (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      os_unfair_lock_unlock(&self->_contentsLock);
      goto LABEL_10;
    }

  }
  objc_msgSend_loadedContents(self, v5, v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v25, v26, (uint64_t)v4, v27);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_contentsLock);
  if (v8)
  {
    v8 = v8;
    v15 = v8;
  }
  else
  {
    objc_msgSend_config(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultBag(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v35, v36, (uint64_t)v4, v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v15;
}

- (IDSServerBagLoadedContents)loadedContents
{
  return self->_loadedContents;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  IDSServerBagInProcessContentProvider *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  IDSServerBag *v14;

  v6 = a4;
  v7 = a3;
  v8 = [IDSServerBagInProcessContentProvider alloc];
  v11 = (void *)objc_msgSend_initWithConfig_queue_(v8, v9, (uint64_t)v7, v10, v6);
  v14 = (IDSServerBag *)objc_msgSend_initWithConfig_queue_contentProvider_(self, v12, (uint64_t)v7, v13, v6, v11);

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_config(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_bagType(v8, v9, v10, v11);
  _IDSServerBagTypeInternalString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("<%@:%p; %@>"), v15, v4, self, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_sharedIDSBag
{
  if (qword_1ECDD48C8 != -1)
    dispatch_once(&qword_1ECDD48C8, &unk_1E3C1BE70);
  return (id)qword_1ECDD48C0;
}

+ (id)sharedInstance
{
  double v2;

  return (id)objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 0, v2);
}

- (IDSServerBag)init
{
  const char *v2;
  uint64_t v3;
  IDSServerBag *v4;
  double v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSServerBag;
  v4 = -[IDSServerBag init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_serverBag(MEMORY[0x1E0D36AA8], v2, v3, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_19BAF609C(v6);

  }
  return v4;
}

- (void)startBagLoad
{
  uint64_t v2;
  double v3;
  const char *v4;
  double v5;
  id v6;
  id v7;

  objc_msgSend_contentProvider(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_updateContentsIfPossibleShouldForce_(v7, v4, 0, v5);

}

- (void)forceBagLoad
{
  uint64_t v2;
  double v3;
  const char *v4;
  double v5;
  id v6;
  id v7;

  objc_msgSend_contentProvider(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_updateContentsIfPossibleShouldForce_(v7, v4, 1, v5);

}

- (BOOL)isLoading
{
  uint64_t v2;
  double v3;

  return objc_msgSend_isLoading(self->_contentProvider, a2, v2, v3);
}

- (BOOL)isLoaded
{
  return self->_loadedContents != 0;
}

- (BOOL)isInDebilitatedMode
{
  uint64_t v2;
  double v3;
  const char *v5;
  double v6;
  BOOL v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;

  if (objc_msgSend_bagType(self->_config, a2, v2, v3))
    return 0;
  objc_msgSend_objectForKey_(self, v5, (uint64_t)CFSTR("vc-disaster-mode"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_intValue(v8, v9, v10, v11) != 0;

  return v7;
}

- (BOOL)requiresIDSConnection
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char v8;

  objc_msgSend_config(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_requiresIDSHost(v4, v5, v6, v7);

  return v8;
}

- (BOOL)requiresIDSHost
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char v8;

  objc_msgSend_config(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_requiresIDSHost(v4, v5, v6, v7);

  return v8;
}

- (NSURL)bagURL
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_config(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_url(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (NSString)apsEnvironmentName
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_config(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apsEnvironmentName(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)allowSelfSignedCertificates
{
  return 0;
}

- (BOOL)allowUnsignedBags
{
  return 0;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  double v4;
  Class v5;
  void *v6;

  v5 = a4;
  if (a4)
  {
    objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;

  }
  return v5;
}

- (id)urlWithKey:(id)a3
{
  double v3;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isServerAvailable(self, v6, v7, v8))
    objc_msgSend_startBagLoad(self, v9, v10, v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend_length(v5, v12, v13, v14);
    if (v15)
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v16, (uint64_t)v5, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)_clearOverrideValues
{
  os_unfair_lock_s *p_contentsLock;
  NSMutableDictionary *overrideValues;
  const char *v5;
  uint64_t v6;
  double v7;
  id v8;

  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  overrideValues = self->_overrideValues;
  self->_overrideValues = 0;

  os_unfair_lock_unlock(p_contentsLock);
  v8 = (id)objc_msgSend_clearOverrideValues(self->_contentProvider, v5, v6, v7);
}

- (void)_setOverrideValue:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  int isInternalInstall;
  const char *v15;
  double v16;
  NSMutableDictionary *overrideValues;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  const char *v20;
  double v21;
  id v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v10, v11, v12, v13);

  if (isInternalInstall)
  {
    os_unfair_lock_lock(&self->_contentsLock);
    overrideValues = self->_overrideValues;
    if (!overrideValues)
    {
      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19 = self->_overrideValues;
      self->_overrideValues = v18;

      overrideValues = self->_overrideValues;
    }
    objc_msgSend_setObject_forKey_(overrideValues, v15, (uint64_t)v23, v16, v6);
    os_unfair_lock_unlock(&self->_contentsLock);
    v22 = (id)objc_msgSend_writeOverrideValues_(self->_contentProvider, v20, (uint64_t)self->_overrideValues, v21);
  }

}

- (id)_overrideValues
{
  os_unfair_lock_s *p_contentsLock;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  v7 = (void *)objc_msgSend_copy(self->_overrideValues, v4, v5, v6);
  os_unfair_lock_unlock(p_contentsLock);
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v9 = v8;

  return v9;
}

- (id)copyLoadedContents
{
  os_unfair_lock_s *p_contentsLock;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;

  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  v7 = (void *)objc_msgSend_copy(self->_loadedContents, v4, v5, v6);
  os_unfair_lock_unlock(p_contentsLock);
  return v7;
}

- (BOOL)isServerAvailable
{
  uint64_t v2;
  double v3;

  return objc_msgSend_isServerAvailable(self->_contentProvider, a2, v2, v3);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@:%p; config: %@; contentProvider: %@>"),
               v6,
               v4,
               self,
               self->_config,
               self->_contentProvider);
}

- (void)setLoadedContents:(id)a3
{
  objc_storeStrong((id *)&self->_loadedContents, a3);
}

- (NSMutableDictionary)overrideValues
{
  return self->_overrideValues;
}

- (void)setOverrideValues:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValues, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)contentsLock
{
  return self->_contentsLock;
}

- (void)setContentsLock:(os_unfair_lock_s)a3
{
  self->_contentsLock = a3;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (IDSServerBagContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contentProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideValues, 0);
  objc_storeStrong((id *)&self->_loadedContents, 0);
}

@end
