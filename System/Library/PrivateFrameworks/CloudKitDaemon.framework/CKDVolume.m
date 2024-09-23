@implementation CKDVolume

+ (id)volumeForPath:(const char *)a3
{
  void *v4;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  CKDVolume *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int128 v25;
  _OWORD v26[65];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  memset(v26, 0, 496);
  v19 = xmmword_1BECBC2E8;
  v20 = 0;
  if (getattrlist(a3, &v19, &v25, 0x420uLL, 0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v16 = v4;
      v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 136446466;
      v22 = a3;
      v23 = 2082;
      v24 = v18;
      _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "getattrlist() failed for path %{public}s - %{public}s", buf, 0x16u);

    }
    return 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v8 = (void *)objc_msgSend_initWithUUIDBytes_(v6, v7, (uint64_t)v26);
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v9, (uint64_t)&v25 + SDWORD2(v25) + 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [CKDVolume alloc];
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v12, DWORD1(v25));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_initWithVolumeUUID_deviceID_mountToPath_(v11, v14, (uint64_t)v8, v13, v10);

    return v15;
  }
}

+ (id)mountedVolumes
{
  int v3;
  id v4;
  const char *v5;
  const char *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  statfs *v13;

  v13 = 0;
  v3 = getmntinfo_r_np(&v13, 2);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend_initWithCapacity_(v4, v5, v3);
  if (v3 >= 1)
  {
    v8 = 0;
    v9 = 2168 * v3;
    do
    {
      objc_msgSend_volumeForPath_(a1, v6, (uint64_t)v13[v8 / 0x878].f_mntonname);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend_addObject_(v7, v10, (uint64_t)v11);

      v8 += 2168;
    }
    while (v9 != v8);
  }
  if (v13)
    free(v13);
  return v7;
}

- (CKDVolume)initWithVolumeUUID:(id)a3 deviceID:(id)a4 mountToPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CKDVolume *v13;
  CKDVolume *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 || !v10)
    __assert_rtn("-[CKDVolume initWithVolumeUUID:deviceID:mountToPath:]", "CKDVolume.m", 63, "volumeUUID && deviceID && \"volumeUUID && deviceID\");
  v12 = v11;
  v16.receiver = self;
  v16.super_class = (Class)CKDVolume;
  v13 = -[CKDVolume init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_volumeUUID, a3);
    objc_storeStrong((id *)&v14->_deviceID, a4);
    objc_storeStrong((id *)&v14->_mountPath, a5);
  }

  return v14;
}

- (BOOL)isRootVolume
{
  return objc_msgSend_isEqualToString_(self->_mountPath, a2, (uint64_t)CFSTR("/"));
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_volumeUUID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mountPath(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v15, (uint64_t)CFSTR("volumeUUID=%@, deviceID=%@, mountPath=%@"), v8, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDVolume *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSString)mountPath
{
  return self->_mountPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPath, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
}

@end
