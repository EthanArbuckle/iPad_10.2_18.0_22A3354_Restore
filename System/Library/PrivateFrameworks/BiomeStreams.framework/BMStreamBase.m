@implementation BMStreamBase

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (id)publisherWithUseCase:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_publisherWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_storeStreamForUseCase:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  BMStoreStream *storeStream;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BMStoreStream *v11;
  void *v12;
  BMStoreStream *v13;
  BMStoreStream *v14;
  BMStoreStream *v15;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  storeStream = self->_storeStream;
  if (!storeStream)
    goto LABEL_4;
  -[BMStoreStream useCase](storeStream, "useCase");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v7 == v4)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[BMStoreStream useCase](self->_storeStream, "useCase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v4);

  if ((v10 & 1) == 0)
  {
LABEL_4:
    v11 = [BMStoreStream alloc];
    -[BMStreamConfiguration streamIdentifier](self->_configuration, "streamIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStreamConfiguration storeConfig](self->_configuration, "storeConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v11, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v8, v12, 2, -[BMStreamConfiguration eventClass](self->_configuration, "eventClass"), v4);
    v14 = self->_storeStream;
    self->_storeStream = v13;

    goto LABEL_5;
  }
LABEL_6:
  v15 = self->_storeStream;
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (BMStreamBase)initWithIdentifier:(id)a3 schema:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMStreamBase *v11;
  BMStreamBase *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMStreamBase;
  v11 = -[BMStreamBase init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend(v8, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_schema, a4);
    objc_storeStrong((id *)&v12->_configuration, a5);
  }

  return v12;
}

- (id)source
{
  void *v2;
  void *v3;

  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", *MEMORY[0x1E0D01CB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publisherWithOptions:(id)a3
{
  return -[BMStreamBase publisherWithUseCase:options:](self, "publisherWithUseCase:options:", *MEMORY[0x1E0D01C98], a3);
}

- (id)publisher
{
  return -[BMStreamBase publisherWithUseCase:options:](self, "publisherWithUseCase:options:", *MEMORY[0x1E0D01C98], 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (id)tombstoneStoreStreamForUseCase:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BMStoreStream *v9;
  void *v10;
  void *v11;
  void *v12;
  BMStoreStream *v13;

  v4 = a3;
  -[BMStreamBase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableTombstoneSubstream");

  if (v6)
  {
    -[BMStreamBase identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(":tombstones"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [BMStoreStream alloc];
    -[BMStreamBase configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tombstonesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v9, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v8, v12, 2, objc_opt_class(), v4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)tombstoneStoreStreamForUseCase:(id)a3 account:(id)a4
{
  return 0;
}

- (id)tombstonePublisherWithUseCase:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[BMStreamBase configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableTombstoneSubstream");

  if (v9)
  {
    -[BMStreamBase tombstoneStoreStreamForUseCase:](self, "tombstoneStoreStreamForUseCase:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_publisherWithOptions:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)tombstonePublisherWithUseCase:(id)a3 device:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BMStreamBase configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enableTombstoneSubstream");

  if (v12)
  {
    -[BMStreamBase tombstoneStoreStreamForUseCase:](self, "tombstoneStoreStreamForUseCase:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_publisherForDevice:options:", v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)tombstonePublisherWithUseCase:(id)a3 account:(id)a4 device:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[BMStreamBase configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "enableTombstoneSubstream");

  if (v15)
  {
    -[BMStreamBase tombstoneStoreStreamForUseCase:account:](self, "tombstoneStoreStreamForUseCase:account:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_publisherForDevice:options:", v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)tombstoneDSLPublisherWithUseCase:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BMDSLStreamPublisher *v9;

  v4 = a3;
  -[BMStreamBase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableTombstoneSubstream");

  if (v6)
  {
    -[BMStreamBase identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(":tombstones"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[BMDSLStreamPublisher initWithIdentifier:streamType:useCase:eventDataClass:]([BMDSLStreamPublisher alloc], "initWithIdentifier:streamType:useCase:eventDataClass:", v8, 2, v4, objc_opt_class());
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMStoreStream)storeStream
{
  return (BMStoreStream *)-[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", *MEMORY[0x1E0D01C98]);
}

- (id)_storeStreamForAccount:(id)a3 useCase:(id)a4
{
  return 0;
}

- (id)storeStreamWithLegacyClass:(Class)a3
{
  BMStoreStream *v5;
  void *v6;
  void *v7;
  BMStoreStream *v8;

  v5 = [BMStoreStream alloc];
  -[BMStreamConfiguration streamIdentifier](self->_configuration, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStreamConfiguration storeConfig](self->_configuration, "storeConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v5, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v6, v7, 2, a3, *MEMORY[0x1E0D01C98]);

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<BMStream identifier:%@>"), self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMStreamBase identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)publisherWithUseCase:(id)a3
{
  return -[BMStreamBase publisherWithUseCase:options:](self, "publisherWithUseCase:options:", a3, 0);
}

- (id)DSLPublisher
{
  return -[BMStreamBase DSLPublisherWithUseCase:](self, "DSLPublisherWithUseCase:", *MEMORY[0x1E0D01C98]);
}

- (id)DSLPublisherWithUseCase:(id)a3
{
  id v4;
  BMDSLStreamPublisher *v5;
  void *v6;
  BMDSLStreamPublisher *v7;

  v4 = a3;
  v5 = [BMDSLStreamPublisher alloc];
  -[BMStreamBase identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMDSLStreamPublisher initWithIdentifier:streamType:useCase:eventDataClass:](v5, "initWithIdentifier:streamType:useCase:eventDataClass:", v6, 2, v4, -[BMStreamConfiguration eventClass](self->_configuration, "eventClass"));

  return v7;
}

- (id)pruner
{
  void *v2;
  BMPruner *v3;

  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", *MEMORY[0x1E0D01CA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[BMPruner initWithStoreStream:remote:]([BMPruner alloc], "initWithStoreStream:remote:", v2, 0);

  return v3;
}

- (id)prunerForDevice:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  BMPruner *v7;
  void *v8;
  BMPruner *v9;

  v4 = *MEMORY[0x1E0D01CA8];
  v5 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [BMPruner alloc];
  objc_msgSend(v5, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BMPruner initWithStoreStream:remote:](v7, "initWithStoreStream:remote:", v6, v8);
  return v9;
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  _BOOL8 v6;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a5;
  v10 = *MEMORY[0x1E0D01C98];
  v11 = a6;
  v12 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publishersForDevices:startTime:includeLocal:pipeline:", v12, v6, v11, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  _BOOL8 v10;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v10 = a8;
  v17 = *MEMORY[0x1E0D01C98];
  v18 = a10;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a9;
  objc_msgSend(v24, "publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v23, v22, v21, v20, v19, v10, v27, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v7 = a6;
  v12 = a7;
  v13 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "publishersForDevices:startTime:includeLocal:pipeline:", v13, v7, v12, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v18 = a11;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a10;
  objc_msgSend(v24, "publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v23, v22, v21, v20, v19, a9, v27, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publisherForDevice:withUseCase:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "publisherForDevice:withUseCase:options:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)remoteDevicesWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", *MEMORY[0x1E0D01C98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDevicesWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *MEMORY[0x1E0D01C98];
  v7 = a3;
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteDevicesForAccount:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v17 = a10;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  -[BMStreamBase publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v22, *MEMORY[0x1E0D01C98], v21, v20, v19, v18, v25, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __108__BMStreamBase_publishersForRemoteDevices_startTime_endTime_maxEvents_lastN_reversed_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D027D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v3, 0, 0, 0, 0);

  return v4;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;

  v6 = a5;
  v10 = a6;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStreamBase publishersForDevices:withUseCase:startTime:includeLocal:pipeline:](self, "publishersForDevices:withUseCase:startTime:includeLocal:pipeline:", v11, *MEMORY[0x1E0D01C98], v6, v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __75__BMStreamBase_publishersForRemoteDevices_startTime_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D027D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v3, 0, 0, 0, 0);

  return v4;
}

- (id)remoteDevices
{
  void *v2;
  void *v3;

  -[BMStreamBase remoteDevicesWithError:](self, "remoteDevicesWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __29__BMStreamBase_remoteDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceIdentifier");
}

- (id)sharedDeviceAccountsWithUseCase:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D01CE0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUseCase:", v4);

  if (v5)
  {
    objc_msgSend(v5, "accounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sharedDeviceAccountsWithError:(id *)a3
{
  return -[BMStreamBase sharedDeviceAccountsWithUseCase:](self, "sharedDeviceAccountsWithUseCase:", *MEMORY[0x1E0D01C98]);
}

- (id)publishersForAccounts:(id)a3 deviceTypes:(unsigned int)a4 includeLocal:(BOOL)a5 options:(id)a6 useCase:(id)a7 pipeline:(id)a8
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  BMSharedPublishers *v26;
  id v28;
  id obj;
  uint64_t v30;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v32 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v35 = a6;
  v12 = a7;
  v13 = (void (**)(id, _QWORD))a8;
  v34 = v12;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01CE0]), "initWithUseCase:", v12);
  if (v33)
  {
    v14 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = v11;
    obj = v11;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v36)
    {
      v30 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v44 != v30)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v33, "deviceIdentifiersForAccount:", v16);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_pas_mappedArrayWithTransform:", &__block_literal_global_65);
          v17 = objc_claimAutoreleasedReturnValue();
          -[BMStreamBase _storeStreamForAccount:useCase:](self, "_storeStreamForAccount:useCase:", v16, v34);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)v17;
          objc_msgSend(v18, "_publishersForDevices:includeLocal:options:", v17, v32, v35);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v19, "publishers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                v13[2](v13, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v22);
          }

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v36);
    }

    v26 = -[BMSharedPublishers initWithPublishers:]([BMSharedPublishers alloc], "initWithPublishers:", v14);
    v11 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id __88__BMStreamBase_publishersForAccounts_deviceTypes_includeLocal_options_useCase_pipeline___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D027D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v3, 0, 0, 0, 0);

  return v4;
}

- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  -[BMStreamBase _storeStreamForAccount:useCase:](self, "_storeStreamForAccount:useCase:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "_publisherForDevice:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  -[BMStreamBase _storeStreamForAccount:useCase:](self, "_storeStreamForAccount:useCase:", a3, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_publisherForDevice:options:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BMStreamConfiguration)configuration
{
  return self->_configuration;
}

- (void)executePruningPolicyForAccount:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  _QWORD block[5];
  __int128 buf;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[BMStreamBase _storeStreamForUseCase:](self, "_storeStreamForUseCase:", *MEMORY[0x1E0D01CA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pruningPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v16 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__BMStreamBase_PeriodicMaintenance__executePruningPolicyForAccount___block_invoke;
    block[3] = &unk_1E2647EA8;
    block[4] = &buf;
    if (executePruningPolicyForAccount__onceToken != -1)
      dispatch_once(&executePruningPolicyForAccount__onceToken, block);
    v9 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      -[BMStreamBase identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_18D810000, v8, v9, "Tried to prune stream with no pruning policy: %@", (uint8_t *)&buf, 0xCu);

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 52428800, 2419200.0);
  }
  v11 = objc_msgSend(v7, "maxStreamSize");
  if (v11 != *MEMORY[0x1E0D024A8])
    objc_msgSend(v5, "pruneStreamBySize:", objc_msgSend(v7, "maxStreamSize"));
  objc_msgSend(v7, "maxAge");
  if (v12 != *MEMORY[0x1E0D02498])
    objc_msgSend(v5, "pruneExpiredEventsWithBlock:", &__block_literal_global_8);
  if (!a3)
    -[BMStreamBase _executePruningPolicyOnSubscriptionSubstream](self, "_executePruningPolicyOnSubscriptionSubstream");
  -[BMStreamBase _pruneEmptyRemotesNotRecentlyModified](self, "_pruneEmptyRemotesNotRecentlyModified");

}

uint64_t __68__BMStreamBase_PeriodicMaintenance__executePruningPolicyForAccount___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)_executePruningPolicyOnSubscriptionSubstream
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CFAbsoluteTime Current;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  _QWORD aBlock[4];
  id v26;
  CFAbsoluteTime v27;

  -[BMStreamBase configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableSubscriptionSubstream");

  if (v4)
  {
    -[BMStreamBase configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptionsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pruningPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMStreamBase subscriptionStoreStreamForUseCase:](self, "subscriptionStoreStreamForUseCase:", *MEMORY[0x1E0D01CA8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pruneStreamBySize:", objc_msgSend(v8, "maxStreamSize"));
    Current = CFAbsoluteTimeGetCurrent();
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke;
    aBlock[3] = &unk_1E26482F0;
    v27 = Current;
    v26 = v8;
    v12 = v8;
    v13 = _Block_copy(aBlock);
    v14 = *MEMORY[0x1E0D01CA0];
    v15 = (void *)objc_opt_new();
    -[BMStreamBase subscriptionPublisherWithUseCase:options:](self, "subscriptionPublisherWithUseCase:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[BMPairedEventSession sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:](BMPairedEventSession, "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:", v16, &__block_literal_global_7, &__block_literal_global_9, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStreamBase subscriptionPruner](self, "subscriptionPruner");
    v23 = v13;
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4;
    v24[3] = &unk_1E2648358;
    v24[4] = self;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_12;
    v21[3] = &unk_1E2648380;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    v19 = v13;
    v20 = (id)objc_msgSend(v17, "sinkWithCompletion:receiveInput:", v24, v21);

  }
}

BOOL __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *(double *)(a1 + 40);
  objc_msgSend(a2, "timestamp");
  v5 = v3 - v4;
  objc_msgSend(*(id *)(a1 + 32), "maxAge");
  return v5 > v6;
}

uint64_t __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

id __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(v2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4_cold_1(a1, (uint64_t)v3, v4);

  }
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "endEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v15, "endEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    if ((_DWORD)v4)
    {
      objc_msgSend(v15, "startEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v15, "startEvent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deleteStoreEvent:", v8);

      }
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v15, "endEvent");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v15, "startEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v15, "startEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);

      if ((_DWORD)v12)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v15, "startEvent");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v14 = (void *)v10;
        objc_msgSend(v9, "deleteStoreEvent:", v10);

      }
    }
  }

}

+ (BOOL)_atLeastOneSegmentFileInDirectory:(id)a3 fileManager:(id)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(a4, "contentsOfDirectoryAtPath:error:", a3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((_PASIsAllDigits() & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_pruneEmptyRemotesNotRecentlyModified
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[4];
  uint64_t v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[BMStreamBase configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datastorePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStreamBase identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithDirectAccessToDirectory:cachingOptions:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v9, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v21;
        v38[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pathWithComponents:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend((id)objc_opt_class(), "_atLeastOneSegmentFileInDirectory:fileManager:", v23, v8) & 1) == 0)
        {
          v30 = v11;
          v24 = objc_msgSend(v8, "modificationTimeOfFileAtPath:error:", v23, &v30);
          v25 = v30;

          v11 = v25;
          if (v25)
            goto LABEL_8;
          if (v24 >= (unint64_t)(v14 + -259200.0))
          {
            v11 = 0;
            goto LABEL_15;
          }
          v29 = 0;
          objc_msgSend(v8, "removeDirectoryAtPath:error:", v23, &v29);
          v11 = v29;
          if (v11)
          {
LABEL_8:
            __biome_log_for_category();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[BMStreamBase(PeriodicMaintenance) _pruneEmptyRemotesNotRecentlyModified].cold.1(v36, (uint64_t)v23, &v37, v26);

          }
        }
LABEL_15:

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v16);
  }

}

- (id)subscriptionStoreStreamForUseCase:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BMStoreStream *v9;
  void *v10;
  void *v11;
  void *v12;
  BMStoreStream *v13;

  v4 = a3;
  -[BMStreamBase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableSubscriptionSubstream");

  if (v6)
  {
    -[BMStreamBase identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(":subscriptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [BMStoreStream alloc];
    -[BMStreamBase configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscriptionsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v9, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v8, v12, 2, objc_opt_class(), v4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)subscriptionSource
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[BMStreamBase configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableSubscriptionSubstream");

  if (v4)
  {
    -[BMStreamBase subscriptionStoreStreamForUseCase:](self, "subscriptionStoreStreamForUseCase:", *MEMORY[0x1E0D01CB8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)subscriptionPruner
{
  void *v3;
  int v4;
  void *v5;
  BMPruner *v6;

  -[BMStreamBase configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableSubscriptionSubstream");

  if (v4)
  {
    -[BMStreamBase subscriptionStoreStreamForUseCase:](self, "subscriptionStoreStreamForUseCase:", *MEMORY[0x1E0D01CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BMPruner initWithStoreStream:remote:]([BMPruner alloc], "initWithStoreStream:remote:", v5, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)subscriptionPublisherWithUseCase:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[BMStreamBase configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableSubscriptionSubstream");

  if (v9)
  {
    -[BMStreamBase subscriptionStoreStreamForUseCase:](self, "subscriptionStoreStreamForUseCase:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_publisherWithOptions:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)subscriptionDSLPublisher
{
  return -[BMStreamBase subscriptionDSLPublisherWithUseCase:](self, "subscriptionDSLPublisherWithUseCase:", *MEMORY[0x1E0D01C98]);
}

- (id)subscriptionDSLPublisherWithUseCase:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BMDSLStreamPublisher *v9;

  v4 = a3;
  -[BMStreamBase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableSubscriptionSubstream");

  if (v6)
  {
    -[BMStreamBase identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(":subscriptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[BMDSLStreamPublisher initWithIdentifier:streamType:useCase:eventDataClass:]([BMDSLStreamPublisher alloc], "initWithIdentifier:streamType:useCase:eventDataClass:", v8, 2, v4, objc_opt_class());
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)subscriptionPublisherWithOptions:(id)a3
{
  return -[BMStreamBase subscriptionPublisherWithUseCase:options:](self, "subscriptionPublisherWithUseCase:options:", *MEMORY[0x1E0D01C98], a3);
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_fault_impl(&dword_18D810000, a3, OS_LOG_TYPE_FAULT, "Failed to prune %{public}@:subscriptions with error %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
