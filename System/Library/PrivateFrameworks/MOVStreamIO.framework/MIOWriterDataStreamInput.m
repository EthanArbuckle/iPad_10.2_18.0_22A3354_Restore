@implementation MIOWriterDataStreamInput

- (MIOWriterDataStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterDataStreamInput)initWithStreamId:(id)a3
{
  return -[MIOWriterDataStreamInput initWithStreamId:copyData:](self, "initWithStreamId:copyData:", a3, 1);
}

- (MIOWriterDataStreamInput)initWithStreamId:(id)a3 copyData:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  const void *v8;
  MIOWriterDataStreamInput *v9;
  objc_super v11;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDB2588];
  v7 = a3;
  v8 = (const void *)objc_msgSend(v6, "createMIOMetadataStreamFormatDescription");
  v11.receiver = self;
  v11.super_class = (Class)MIOWriterDataStreamInput;
  v9 = -[MIOWriterMetadataStreamInput initWithStreamId:format:](&v11, sel_initWithStreamId_format_, v7, v8);

  if (v8)
    CFRelease(v8);
  if (v9)
    -[MIOWriterDataStreamInput setCopyData:](v9, "setCopyData:", v4);
  return v9;
}

- (BOOL)superAppendMetadata:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MIOWriterDataStreamInput;
  return -[MIOWriterMetadataStreamInput appendMetadata:](&v4, sel_appendMetadata_, a3);
}

- (BOOL)appendMetadata:(id)a3 withTimeStamp:(id *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD);
  int64_t v11;
  _QWORD v13[4];
  uint64_t (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE location;

  v8 = a3;
  location = *a4;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &location, a5))
  {
    objc_initWeak((id *)&location, self);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke;
    v15[3] = &unk_24CA44E68;
    objc_copyWeak(&v17, (id *)&location);
    v16 = v8;
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
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
      self = (MIOWriterDataStreamInput *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke_5;
      v13[3] = &unk_24CA44BB0;
      v14 = v10;
      dispatch_async(&self->super.super.super, v13);

      LOBYTE(self) = 1;
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

uint64_t __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perfLogHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "processingSignPostID");
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "mio.processing", (const char *)&unk_2106EBECF, (uint8_t *)&v14, 2u);
      }
    }

    v7 = (void *)MEMORY[0x212BC9B10]();
    v8 = (void *)MEMORY[0x24BDB26C0];
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(v3, "copyData");
    v14 = *(_OWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "metadataGroupForMetadataStreamFromData:timeStamp:copyData:", v9, &v14, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "superAppendMetadata:", v11);

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __63__MIOWriterDataStreamInput_appendMetadata_withTimeStamp_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)copyData
{
  return self->_copyData;
}

- (void)setCopyData:(BOOL)a3
{
  self->_copyData = a3;
}

@end
