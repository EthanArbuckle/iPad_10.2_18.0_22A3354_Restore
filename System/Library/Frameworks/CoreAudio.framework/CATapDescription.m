@implementation CATapDescription

- (CATapDescription)init
{
  CATapDescription *v3;
  NSUUID *v4;
  NSUUID *UUID;
  NSArray *v6;
  NSArray *processes;
  NSString *deviceUID;
  NSNumber *stream;

  v3 = [CATapDescription alloc];

  if (v3)
  {
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    UUID = v3->_UUID;
    v3->_UUID = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D18]);
    processes = v3->_processes;
    v3->_processes = v6;

    *(_DWORD *)&v3->_mono = 0x1000000;
    deviceUID = v3->_deviceUID;
    v3->_muteBehavior = 0;
    v3->_deviceUID = 0;

    stream = v3->_stream;
    v3->_stream = 0;

  }
  return v3;
}

- (id)initStereoMixdownOfProcesses:(id)a3
{
  id v5;
  CATapDescription *v6;

  v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v6->_mixdown = 1;
  }

  return v6;
}

- (id)initStereoGlobalTapButExcludeProcesses:(id)a3
{
  id v5;
  CATapDescription *v6;

  v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    *(_WORD *)&v6->_exclusive = 257;
  }

  return v6;
}

- (id)initMonoMixdownOfProcesses:(id)a3
{
  id v5;
  CATapDescription *v6;

  v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v6->_mono = 1;
    v6->_mixdown = 1;
  }

  return v6;
}

- (id)initMonoGlobalTapButExcludeProcesses:(id)a3
{
  id v5;
  CATapDescription *v6;

  v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    *(_WORD *)&v6->_mono = 257;
    v6->_mixdown = 1;
  }

  return v6;
}

- (CATapDescription)initWithProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5
{
  id v9;
  id v10;
  CATapDescription *v11;
  uint64_t v12;
  NSNumber *stream;

  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(CATapDescription);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_processes, a3);
    objc_storeStrong((id *)&v11->_deviceUID, a4);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a5);
    stream = v11->_stream;
    v11->_stream = (NSNumber *)v12;

  }
  return v11;
}

- (id)initExcludingProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5
{
  id v9;
  id v10;
  CATapDescription *v11;
  uint64_t v12;
  NSNumber *stream;

  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(CATapDescription);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_processes, a3);
    objc_storeStrong((id *)&v11->_deviceUID, a4);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a5);
    stream = v11->_stream;
    v11->_stream = (NSNumber *)v12;

    v11->_exclusive = 1;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)processes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcesses:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isMono
{
  return self->_mono;
}

- (void)setMono:(BOOL)a3
{
  self->_mono = a3;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)isMixdown
{
  return self->_mixdown;
}

- (void)setMixdown:(BOOL)a3
{
  self->_mixdown = a3;
}

- (BOOL)isPrivate
{
  return self->_privateTap;
}

- (void)setPrivate:(BOOL)a3
{
  self->_privateTap = a3;
}

- (int64_t)isMuted
{
  return self->_muteBehavior;
}

- (void)setMuteBehavior:(int64_t)a3
{
  self->_muteBehavior = a3;
}

- (NSString)deviceUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)stream
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStream:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (CATapDescription)initWithDictionary:(id)a3
{
  id v5;
  CATapDescription *v6;
  CATapDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *deviceUID;
  void *v21;
  uint64_t v22;
  NSNumber *stream;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = objc_alloc_init(CATapDescription);
  v7 = v6;

  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("TapUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CATapDescription.mm"), 138, CFSTR("Tap dictionary is missing UUID"));

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("Processes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CATapDescription.mm"), 139, CFSTR("Tap dictionary is missing process list"));

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("TapName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_name, v10);
    objc_msgSend(v5, "objectForKey:", CFSTR("TapUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
    objc_storeStrong((id *)&v6->_UUID, v12);
    objc_msgSend(v5, "objectForKey:", CFSTR("Processes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_processes, v13);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsMono"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mono = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsExclusive"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_exclusive = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsMixdown"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mixdown = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsPrivate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_privateTap = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MuteBehavior"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_muteBehavior = (int)objc_msgSend(v18, "intValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("DeviceUID"));
    v19 = objc_claimAutoreleasedReturnValue();
    deviceUID = v7->_deviceUID;
    v7->_deviceUID = (NSString *)v19;

    objc_msgSend(v5, "objectForKey:", CFSTR("Stream"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Stream"));
      v22 = objc_claimAutoreleasedReturnValue();
      stream = v7->_stream;
      v7->_stream = (NSNumber *)v22;

    }
  }

  return v7;
}

@end
