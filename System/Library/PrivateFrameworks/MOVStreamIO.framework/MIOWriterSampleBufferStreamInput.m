@implementation MIOWriterSampleBufferStreamInput

- (MIOWriterSampleBufferStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterSampleBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6;
  MIOWriterSampleBufferStreamInput *v7;
  MIOWriterSampleBufferStreamInput *v8;
  const opaqueCMFormatDescription *inputFormatDesc;
  uint64_t MediaType;
  NSString *v11;
  NSString *avMediaType;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MIOWriterSampleBufferStreamInput;
  v7 = -[MIOWriterBufferStreamInput init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MIOWriterStreamInput setStreamId:](v7, "setStreamId:", v6);
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
    inputFormatDesc = v8->_inputFormatDesc;
    if (inputFormatDesc)
    {
      MediaType = CMFormatDescriptionGetMediaType(inputFormatDesc);
      -[MIOWriterStreamInput setMediaType:](v8, "setMediaType:", +[MIOMediaTypeUtility matchingMIOMediaTypeFromCMType:](MIOMediaTypeUtility, "matchingMIOMediaTypeFromCMType:", MediaType));
      +[MIOMediaTypeUtility matchingAVMediaTypeFromCMType:](MIOMediaTypeUtility, "matchingAVMediaTypeFromCMType:", MediaType);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MIOWriterStreamInput setMediaType:](v8, "setMediaType:", 0);
      v11 = (NSString *)(id)*MEMORY[0x24BDB1D50];
    }
    avMediaType = v8->_avMediaType;
    v8->_avMediaType = v11;

  }
  return v8;
}

- (void)dealloc
{
  opaqueCMFormatDescription *inputFormatDesc;
  objc_super v4;

  inputFormatDesc = self->_inputFormatDesc;
  if (inputFormatDesc)
    CFRelease(inputFormatDesc);
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterSampleBufferStreamInput;
  -[MIOWriterSampleBufferStreamInput dealloc](&v4, sel_dealloc);
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 metadataGroup:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD);
  int64_t v11;
  _QWORD v13[4];
  uint64_t (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  id v17[2];
  CMTime location;
  CMTime v19;

  v8 = a4;
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetPresentationTimeStamp(&v19, a3);
  location = v19;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &location, a5))
  {
    CFRetain(a3);
    objc_initWeak((id *)&location, self);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke;
    v15[3] = &unk_24CA44B88;
    objc_copyWeak(v17, (id *)&location);
    v17[1] = a3;
    v16 = v8;
    v10 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v15);
    v11 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
    if (v11)
    {
      if (v11 == 1)
        LOBYTE(self) = v10[2](v10);
    }
    else
    {
      -[MIOWriterStreamInput processingQueue](self, "processingQueue");
      self = (MIOWriterSampleBufferStreamInput *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke_2;
      v13[3] = &unk_24CA44BB0;
      v14 = v10;
      dispatch_async(&self->super.super.super, v13);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x212BC9B10]();
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setSampleBuffer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "setMetadata:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "fifoBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "enqueue:", v4);

    if ((v6 & 1) != 0)
    {
      v7 = objc_msgSend(WeakRetained, "finalizeProcessing");
    }
    else
    {
      CFRelease(*(CFTypeRef *)(a1 + 48));
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(WeakRetained, "streamId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v10, 21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "writer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reportError:", v11);

      v7 = 0;
    }

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 48));
    v7 = 0;
  }

  return v7;
}

uint64_t __75__MIOWriterSampleBufferStreamInput_appendSampleBuffer_metadataGroup_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD);
  int64_t v11;
  _QWORD block[4];
  uint64_t (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  id v17[2];
  CMTime v18;
  CMTime location;
  CMTime v20;

  v8 = a4;
  memset(&v20, 0, sizeof(v20));
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  location = v20;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &location, a5))
  {
    CFRetain(a3);
    objc_initWeak((id *)&location, self);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke;
    v15[3] = &unk_24CA44BD8;
    objc_copyWeak(v17, (id *)&location);
    v17[1] = a3;
    v16 = v8;
    v18 = v20;
    v10 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v15);
    v11 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
    if (v11)
    {
      if (v11 == 1)
        LOBYTE(self) = v10[2](v10);
    }
    else
    {
      -[MIOWriterStreamInput processingQueue](self, "processingQueue");
      self = (MIOWriterSampleBufferStreamInput *)objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke_2;
      block[3] = &unk_24CA44BB0;
      v14 = v10;
      dispatch_async(&self->super.super.super, block);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x212BC9B10]();
    v4 = *(_QWORD *)(a1 + 32);
    v21 = *(_OWORD *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 72);
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDB26C0], "attachmentsMIOTimedMetadataGroupForDictionary:pts:error:", v4, &v21, &v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(WeakRetained, "streamId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Cannot append frame, invalid buffer attachments %@ for stream %@."), v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v9, 21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "writer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reportError:", v10);

      CFRelease(*(CFTypeRef *)(a1 + 48));
    }
    else
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setSampleBuffer:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v9, "setMetadata:", v5);
      objc_msgSend(WeakRetained, "fifoBuffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "enqueue:", v9);

      if ((v14 & 1) != 0)
      {
        v12 = objc_msgSend(WeakRetained, "finalizeProcessing");
LABEL_9:

        objc_autoreleasePoolPop(v3);
        goto LABEL_10;
      }
      CFRelease(*(CFTypeRef *)(a1 + 48));
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(WeakRetained, "streamId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v17, 21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "writer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reportError:", v18);

    }
    v12 = 0;
    goto LABEL_9;
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v12 = 0;
LABEL_10:

  return v12;
}

uint64_t __73__MIOWriterSampleBufferStreamInput_appendSampleBuffer_attachments_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sampleInputOutputSettings
{
  return 0;
}

- (id)avMediaType
{
  return self->_avMediaType;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_inputFormatDesc;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return 0;
}

- (BOOL)sampleReorderingEnabled
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avMediaType, 0);
}

@end
