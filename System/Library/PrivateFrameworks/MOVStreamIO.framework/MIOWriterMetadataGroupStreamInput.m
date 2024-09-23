@implementation MIOWriterMetadataGroupStreamInput

- (MIOWriterMetadataGroupStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 associateToInput:(id)a5
{
  id v8;
  MIOWriterMetadataGroupStreamInput *v9;
  uint64_t v10;
  NSString *associatedInputUUID;
  MIOWriterMetadataGroupStreamInput *v12;

  v8 = a5;
  v9 = -[MIOWriterMetadataGroupStreamInput initWithStreamId:format:](self, "initWithStreamId:format:", a3, a4);
  if (v9)
  {
    if (!objc_msgSend(v8, "registerForAssociating:trackRelation:", v9, *MEMORY[0x24BDB20E8]))
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v8, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    associatedInputUUID = v9->_associatedInputUUID;
    v9->_associatedInputUUID = (NSString *)v10;

  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (MIOWriterMetadataGroupStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIOWriterMetadataGroupStreamInput;
  return -[MIOWriterMetadataStreamInput initWithStreamId:format:](&v5, sel_initWithStreamId_format_, a3, a4);
}

- (BOOL)superAppendMetadata:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MIOWriterMetadataGroupStreamInput;
  return -[MIOWriterMetadataStreamInput appendMetadata:](&v4, sel_appendMetadata_, a3);
}

- (BOOL)appendMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t (**v9)(_QWORD);
  int64_t v10;
  _QWORD block[4];
  uint64_t (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id location[2];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeRange");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }
  *(_OWORD *)location = v19;
  v18 = v20;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", location, a4))
  {
    objc_initWeak(location, self);
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke;
    v14[3] = &unk_24CA44E40;
    objc_copyWeak(&v16, location);
    v15 = v7;
    v9 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v14);
    v10 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
    if (v10)
    {
      if (v10 == 1)
        LOBYTE(self) = v9[2](v9);
    }
    else
    {
      -[MIOWriterStreamInput processingQueue](self, "processingQueue");
      self = (MIOWriterMetadataGroupStreamInput *)objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke_2;
      block[3] = &unk_24CA44BB0;
      v13 = v9;
      dispatch_async(&self->super.super.super, block);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x212BC9B10]();
    v4 = objc_msgSend(WeakRetained, "superAppendMetadata:", *(_QWORD *)(a1 + 32));
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __58__MIOWriterMetadataGroupStreamInput_appendMetadata_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (MIOWriterBufferStreamInput)associateToInput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MIOWriterStreamInput associatedInputs](self, "associatedInputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonretainedObjectValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOWriterBufferStreamInput *)v5;
}

- (id)uuid
{
  NSString *uuid;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%ld_%@"), v5, -[MIOWriterStreamInput mediaType](self, "mediaType"), self->_associatedInputUUID);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInputUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
