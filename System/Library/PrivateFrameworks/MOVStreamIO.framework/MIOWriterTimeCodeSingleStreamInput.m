@implementation MIOWriterTimeCodeSingleStreamInput

- (MIOWriterTimeCodeSingleStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterTimeCodeSingleStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6;
  MIOWriterTimeCodeSingleStreamInput *v7;
  MIOWriterTimeCodeSingleStreamInput *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MIOWriterTimeCodeSingleStreamInput;
  v7 = -[MIOWriterBufferStreamInput init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MIOWriterStreamInput setStreamId:](v7, "setStreamId:", v6);
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
    -[MIOWriterBufferStreamInput setDoNotRecordAttachments:](v8, "setDoNotRecordAttachments:", 1);
    -[MIOWriterStreamInput setMediaType:](v8, "setMediaType:", 4);
  }

  return v8;
}

- (BOOL)appendTimeCode:(CVSMPTETime *)a3 pts:(id *)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t (**v9)(_QWORD);
  int64_t v10;
  char v11;
  NSObject *v12;
  _QWORD block[4];
  uint64_t (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  int64_t var3;
  id location;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;

  v23 = *a4;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &v23, a5))
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke;
    v16[3] = &unk_24CA44C00;
    objc_copyWeak(&v17, &location);
    v18 = *(_OWORD *)&a3->subframes;
    v19 = *(_QWORD *)&a3->hours;
    v20 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v9 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v16);
    v10 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
    if (v10)
    {
      if (v10 == 1)
      {
        v11 = v9[2](v9);
LABEL_8:

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
        return v11;
      }
    }
    else
    {
      -[MIOWriterStreamInput processingQueue](self, "processingQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke_11;
      block[3] = &unk_24CA44C28;
      v15 = v9;
      dispatch_async(v12, block);

    }
    v11 = 1;
    goto LABEL_8;
  }
  return 0;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  opaqueCMSampleBuffer *v16;
  void *v17;
  char v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  id v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perfLogHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "processingSignPostID");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
    }

    v6 = (void *)MEMORY[0x212BC9B10]();
    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      v36 = *(_OWORD *)(a1 + 40);
      v37 = *(_QWORD *)(a1 + 56);
      v15 = v3[32];
      v34 = *(_OWORD *)(a1 + 64);
      v35 = *(_QWORD *)(a1 + 80);
      v33 = 0;
      v16 = +[MOVStreamIOUtility createTimecodeSampleBufferWithSMPTETime:formatDescription:pts:error:](MOVStreamIOUtility, "createTimecodeSampleBufferWithSMPTETime:formatDescription:pts:error:", &v36, v15, &v34, &v33);
      v9 = v33;
      if (v16)
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setSampleBuffer:", v16);
        objc_msgSend(v10, "setMetadata:", 0);
        objc_msgSend(v3, "fifoBuffer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "enqueue:", v10);

        if ((v18 & 1) != 0)
        {
          objc_msgSend(v3, "perfLogHandle");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v3, "processingSignPostID");
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v19, OS_SIGNPOST_INTERVAL_END, v20, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
          }

          v14 = objc_msgSend(v3, "finalizeProcessing");
          goto LABEL_25;
        }
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "streamId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v27);
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v12, 21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "writer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "reportError:", v28);

        CFRelease(v16);
        objc_msgSend(v3, "perfLogHandle");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v3, "processingSignPostID");
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v30, OS_SIGNPOST_INTERVAL_END, v31, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "streamId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Cannot create time code sample buffer for stream %@."), v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v10, 21);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "writer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reportError:", v12);

        objc_msgSend(v3, "perfLogHandle");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v3, "processingSignPostID");
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v24, OS_SIGNPOST_INTERVAL_END, v25, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
        }

      }
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Cannot write invalid time code sample to stream %@."), v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v9, 21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reportError:", v10);

      objc_msgSend(v3, "perfLogHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "processingSignPostID");
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v12, OS_SIGNPOST_INTERVAL_END, v13, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
      }
    }

    v14 = 0;
LABEL_25:

    objc_autoreleasePoolPop(v6);
    goto LABEL_26;
  }
  v14 = 0;
LABEL_26:

  return v14;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendTimeCode_pts_error___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t (**v8)(_QWORD);
  int64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  uint64_t (**v18)(_QWORD);
  _QWORD v19[4];
  id v20[2];
  id location;
  CMTime v22;
  CMTime v23;

  memset(&v23, 0, sizeof(v23));
  CMSampleBufferGetPresentationTimeStamp(&v23, a3);
  v22 = v23;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &v22, a4))
  {
    if (a3)
    {
      objc_initWeak(&location, self);
      v7 = MEMORY[0x24BDAC760];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke;
      v19[3] = &unk_24CA44C50;
      objc_copyWeak(v20, &location);
      v20[1] = a3;
      v8 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v19);
      v9 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = v8[2](v8);
LABEL_10:

          objc_destroyWeak(v20);
          objc_destroyWeak(&location);
          return v10;
        }
      }
      else
      {
        -[MIOWriterStreamInput processingQueue](self, "processingQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke_15;
        block[3] = &unk_24CA44C28;
        v18 = v8;
        dispatch_async(v15, block);

      }
      v10 = 1;
      goto LABEL_10;
    }
    -[MIOWriterStreamInput writer](self, "writer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Cannot append nil sample buffer to time code input: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportWarning:", v14);

  }
  return 0;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perfLogHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "processingSignPostID");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
    }

    v6 = (void *)MEMORY[0x212BC9B10]();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setSampleBuffer:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "setMetadata:", 0);
    objc_msgSend(v3, "fifoBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "enqueue:", v7);

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v3, "perfLogHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "processingSignPostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v10, OS_SIGNPOST_INTERVAL_END, v11, "mio.processing", (const char *)&unk_2106EBECF, v21, 2u);
      }

      v12 = objc_msgSend(v3, "finalizeProcessing");
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v15, 21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reportError:", v16);

      CFRelease(*(CFTypeRef *)(a1 + 40));
      objc_msgSend(v3, "perfLogHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v3, "processingSignPostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v18, OS_SIGNPOST_INTERVAL_END, v19, "mio.processing", (const char *)&unk_2106EBECF, v22, 2u);
      }

      v12 = 0;
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __63__MIOWriterTimeCodeSingleStreamInput_appendSampleBuffer_error___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sampleInputOutputSettings
{
  return 0;
}

- (id)avMediaType
{
  return (id)*MEMORY[0x24BDB1D48];
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_inputFormatDesc;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return self->_inputFormatDesc;
}

- (void)customizeSampleInput:(id)a3
{
  void *v3;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale");
  if (v5 < 1)
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "baseMediaTimeScale");
  }
  else
  {
    v6 = -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale");
  }
  objc_msgSend(v8, "setMediaTimeScale:", v6);
  if (v5 <= 0)

  -[MIOWriterStreamInput writer](self, "writer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpectsMediaDataInRealTime:", objc_msgSend(v7, "realTime"));

  objc_msgSend(v8, "setMediaDataLocation:", *MEMORY[0x24BDB19F8]);
  objc_msgSend(v8, "setNaturalSize:", 640.0, 16.0);

}

@end
