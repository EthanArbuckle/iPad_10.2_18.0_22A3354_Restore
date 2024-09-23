@implementation MIOWriterTimeRangeMetadataStreamInput

- (MIOWriterTimeRangeMetadataStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterTimeRangeMetadataStreamInput)initWithStreamId:(id)a3
{
  id v4;
  const void *v5;
  MIOWriterTimeRangeMetadataStreamInput *v6;
  MIOWriterTimeRangeMetadataStreamInput *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = (const void *)objc_msgSend(MEMORY[0x24BDB2588], "createMIOTimeRangeMetadataStreamFormatDescription");
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MIOWriterTimeRangeMetadataStreamInput;
    v6 = -[MIOWriterMetadataStreamInput initWithStreamId:format:](&v10, sel_initWithStreamId_format_, v4, v5);
    CFRelease(v5);
    self = v6;
    v7 = self;
  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v8, OS_LOG_TYPE_ERROR, "Cannot create format description for time range metadata track.", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD);
  uint64_t v14;
  _QWORD v16[4];
  uint64_t (**v17)(_QWORD);
  _QWORD v18[5];
  id v19[3];
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  int64_t var3;
  id location;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25;

  v11 = (uint64_t)self;
  v25 = *a6;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &v25, a7))
  {
    objc_initWeak(&location, (id)v11);
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke;
    v18[3] = &unk_24CA44FF0;
    objc_copyWeak(v19, &location);
    v19[1] = (id)a4;
    v19[2] = (id)a5;
    v20 = *(_OWORD *)&a3->subframes;
    v21 = *(_QWORD *)&a3->hours;
    v22 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    v18[4] = v11;
    v13 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v18);
    v14 = objc_msgSend((id)v11, "threadingOption");
    if (v14)
    {
      if (v14 == 1)
        LOBYTE(v11) = v13[2](v13);
    }
    else
    {
      objc_msgSend((id)v11, "processingQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke_139;
      v16[3] = &unk_24CA44C28;
      v17 = v13;
      dispatch_async((dispatch_queue_t)v11, v16);

      LOBYTE(v11) = 1;
    }

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11 & 1;
}

id __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_super v20;
  CMTime duration;
  CMTime start;
  CMTimeRange v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
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
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeRangeMetadataStartTime:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeRangeMetadataEndTime:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    v24 = *(_OWORD *)(a1 + 64);
    v25 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemForTimeCode:", &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    if ((*(_BYTE *)(a1 + 100) & 1) != 0)
    {
      v17 = objc_alloc(MEMORY[0x24BDB26C0]);
      start = *(CMTime *)(a1 + 88);
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
      CMTimeRangeMake(&v23, &start, &duration);
      v18 = (void *)objc_msgSend(v17, "initWithItems:timeRange:", v7, &v23);
      if (v18)
      {
        v20.receiver = *(id *)(a1 + 32);
        v20.super_class = (Class)MIOWriterTimeRangeMetadataStreamInput;
        v16 = objc_msgSendSuper2(&v20, sel_appendMetadata_, v18);
LABEL_12:

        objc_autoreleasePoolPop(v6);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("No metadata appended because the AVTimedMetadataGroup* is nil"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportError:", v13);
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Invalid time stamp is not supported for metadata for stream '%@'."), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v13, 16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reportError:", v14);

    }
    v18 = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __94__MIOWriterTimeRangeMetadataStreamInput_appendTimeCode_startTime_endTime_withTimeStamp_error___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)inputSpecificTrackMetadataItems
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithTimeRangeMetadata:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
