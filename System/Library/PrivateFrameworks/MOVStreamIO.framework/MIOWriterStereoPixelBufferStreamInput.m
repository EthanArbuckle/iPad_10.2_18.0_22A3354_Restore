@implementation MIOWriterStereoPixelBufferStreamInput

- (MIOWriterStereoPixelBufferStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterStereoPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5
{
  id v8;
  id v9;
  MIOWriterStereoPixelBufferStreamInput *v10;
  MIOWriterStereoPixelBufferStreamInput *v11;
  NSArray *videoLayerIDs;
  uint64_t v13;
  NSArray *viewIDs;
  uint64_t v15;
  NSArray *leftAndRightViewIDs;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  uint64_t v26;
  NSArray *v27;
  void *v28;
  void *v29;
  __CFArray *tagCollectionArray;
  id v32;
  objc_super v33;

  v8 = a3;
  v9 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  v10 = -[MIOWriterPixelBufferStreamInput initWithStreamId:format:recordingConfig:](&v33, sel_initWithStreamId_format_recordingConfig_, v8, a4, v9);
  v11 = v10;
  if (v10)
  {
    videoLayerIDs = v10->_videoLayerIDs;
    v10->_videoLayerIDs = (NSArray *)&unk_24CA5C0C0;

    v13 = -[NSArray copy](v11->_videoLayerIDs, "copy");
    viewIDs = v11->_viewIDs;
    v11->_viewIDs = (NSArray *)v13;

    v15 = -[NSArray copy](v11->_videoLayerIDs, "copy");
    leftAndRightViewIDs = v11->_leftAndRightViewIDs;
    v11->_leftAndRightViewIDs = (NSArray *)v15;

    objc_msgSend(v9, "objectForKey:", CFSTR("CustomOutputSettings"));
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "objectForKey:", *MEMORY[0x24BDB22C8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDF92A8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "copy");
      v21 = v11->_videoLayerIDs;
      v11->_videoLayerIDs = (NSArray *)v20;

    }
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDF92B0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_msgSend(v22, "copy");
      v24 = v11->_viewIDs;
      v11->_viewIDs = (NSArray *)v23;

    }
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDF92A0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_msgSend(v25, "copy");
      v27 = v11->_leftAndRightViewIDs;
      v11->_leftAndRightViewIDs = (NSArray *)v26;

    }
    -[NSArray objectAtIndex:](v11->_videoLayerIDs, "objectAtIndex:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unsignedIntegerValue");

    -[NSArray objectAtIndex:](v11->_videoLayerIDs, "objectAtIndex:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "unsignedIntegerValue");

    -[MIOWriterStereoPixelBufferStreamInput setLeftBufferPrimary:](v11, "setLeftBufferPrimary:", -[MIOWriterStereoPixelBufferStreamInput leftBufferUsesPrimaryLayer](v11, "leftBufferUsesPrimaryLayer"));
    v11->_tagCollectionArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD690]);
    FigTagMakeWithSInt64Value();
    FigTagCollectionCreate();
    tagCollectionArray = v11->_tagCollectionArray;
    if (tagCollectionArray)
      CFRelease(tagCollectionArray);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("FigTagCollectionCreate left failed."), 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }

  return v11;
}

- (void)dealloc
{
  __CFArray *tagCollectionArray;
  objc_super v4;

  tagCollectionArray = self->_tagCollectionArray;
  if (tagCollectionArray)
    CFRelease(tagCollectionArray);
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  -[MIOWriterPixelBufferStreamInput dealloc](&v4, sel_dealloc);
}

- (BOOL)sampleReorderingEnabled
{
  return 0;
}

- (id)taggedPixelBufferAttributes
{
  void *v2;
  void *v3;

  -[MIOWriterPixelBufferStreamInput config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TaggedPixelBufferGroupAdaptorPixelBufferAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)leftBufferUsesPrimaryLayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[NSArray objectAtIndex:](self->_leftAndRightViewIDs, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[NSArray objectAtIndex:](self->_viewIDs, "objectAtIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[NSArray objectAtIndex:](self->_videoLayerIDs, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  return v8 == 0;
}

- (BOOL)appendLeftPixelBuffer:(__CVBuffer *)a3 rightPixelBuffer:(__CVBuffer *)a4 pts:(id *)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD);
  uint64_t v12;
  _QWORD v14[4];
  uint64_t (**v15)(_QWORD);
  _QWORD v16[4];
  id v17[3];
  __int128 v18;
  int64_t var3;
  id location;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v9 = (uint64_t)self;
  v21 = *a5;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &v21, a6))
  {
    CVPixelBufferRetain(a3);
    CVPixelBufferRetain(a4);
    objc_initWeak(&location, (id)v9);
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke;
    v16[3] = &unk_24CA450D8;
    objc_copyWeak(v17, &location);
    v17[1] = a3;
    v17[2] = a4;
    v18 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v11 = (uint64_t (**)(_QWORD))MEMORY[0x212BC9CCC](v16);
    v12 = objc_msgSend((id)v9, "threadingOption");
    if (v12)
    {
      if (v12 == 1)
        LOBYTE(v9) = v11[2](v11);
    }
    else
    {
      objc_msgSend((id)v9, "processingQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke_150;
      v14[3] = &unk_24CA44C28;
      v15 = v11;
      dispatch_async((dispatch_queue_t)v9, v14);

      LOBYTE(v9) = 1;
    }

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

uint64_t __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  __int128 *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CVBuffer *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CVBuffer *v36;
  uint64_t v37;
  __CFArray *Mutable;
  __CVBuffer *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  void *v61;
  char v62;
  NSObject *v63;
  os_signpost_id_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  __int128 v71;
  uint64_t v72;
  uint8_t v73[16];
  uint8_t buf[16];
  id v75;
  id v76;
  CMTime duration;
  CMTime start;
  CMTimeRange v79;
  id v80;
  __int128 v81;
  uint64_t v82;
  id v83;
  __int128 v84;
  uint64_t v85;
  _QWORD v86[4];

  v86[2] = *MEMORY[0x24BDAC8D0];
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

    v6 = *(_QWORD *)(a1 + 40);
    v84 = *(_OWORD *)(a1 + 56);
    v85 = *(_QWORD *)(a1 + 72);
    v83 = 0;
    objc_msgSend(MEMORY[0x24BDB2588], "attachmentsMIOMetadataItemForPixelBuffer:pts:error:", v6, &v84, &v83);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v83;
    if (v7)
    {
      v8 = v7;
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Cannot append frame, invalid pixel buffer attachments %@ for stream %@."), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v11, 21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reportError:", v12);

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      objc_msgSend(v3, "perfLogHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v3, "processingSignPostID");
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v14, OS_SIGNPOST_INTERVAL_END, v15, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
      }

LABEL_16:
      v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v17 = (__int128 *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 48);
    v81 = *(_OWORD *)(a1 + 56);
    v82 = *(_QWORD *)(a1 + 72);
    v80 = 0;
    objc_msgSend(MEMORY[0x24BDB2588], "attachmentsMIOMetadataItemForPixelBuffer:pts:error:", v18, &v81, &v80);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v80;
    if (v19)
    {
      v8 = v19;
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Cannot append frame, invalid pixel buffer attachments %@ for stream %@."), v8, v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v12, 21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportError:", v22);

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      objc_msgSend(v3, "perfLogHandle");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v3, "processingSignPostID");
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v24, OS_SIGNPOST_INTERVAL_END, v25, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
      }

      goto LABEL_16;
    }
    v27 = objc_alloc(MEMORY[0x24BDB26C0]);
    v86[0] = v70;
    v86[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&start.value = *v17;
    start.epoch = *(_QWORD *)(a1 + 72);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v79, &start, &duration);
    v12 = (void *)objc_msgSend(v27, "initWithItems:timeRange:", v28, &v79);

    objc_msgSend(v3, "processor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "attachmentsToEncode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v32 = (__CVBuffer *)objc_msgSend(v29, "processPixelBuffer:preserveAttachments:error:", v30, v31, &v76);
    v8 = v76;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
    if (!v32)
    {
      v40 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("Process pixel buffer failed %@ for stream %@."), v8, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v42, 21);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "reportError:", v43);

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      objc_msgSend(v3, "perfLogHandle");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v3, "processingSignPostID");
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v45, OS_SIGNPOST_INTERVAL_END, v46, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
      }

      goto LABEL_16;
    }
    objc_msgSend(v3, "processor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "attachmentsToEncode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v8;
    v36 = (__CVBuffer *)objc_msgSend(v33, "processPixelBuffer:preserveAttachments:error:", v34, v35, &v75);
    v69 = v75;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    if (!v36)
    {
      v47 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Process pixel buffer failed %@ for stream %@."), v69, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v49, 21);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "reportError:", v50);

      CVPixelBufferRelease(v32);
      objc_msgSend(v3, "perfLogHandle");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v3, "processingSignPostID");
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v52, OS_SIGNPOST_INTERVAL_END, v53, "mio.processing", (const char *)&unk_2106EBECF, buf, 2u);
      }

      v16 = 0;
      goto LABEL_44;
    }
    v37 = *MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD690]);
    if (objc_msgSend(v3, "leftBufferPrimary"))
    {
      CFArrayAppendValue(Mutable, v32);
      v39 = v36;
    }
    else
    {
      CFArrayAppendValue(Mutable, v36);
      v39 = v32;
    }
    CFArrayAppendValue(Mutable, v39);
    CVPixelBufferRelease(v32);
    CVPixelBufferRelease(v36);
    *(_QWORD *)buf = 0;
    if (MEMORY[0x212BC975C](v37, v3[47], Mutable, buf))
    {
      v54 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("FigTaggedBufferGroupCreate failed for stream %@."), v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", v56, 21);
      v57 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "writer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "reportError:", v57);

      objc_msgSend(v3, "perfLogHandle");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v3, "processingSignPostID");
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)v73 = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v59, OS_SIGNPOST_INTERVAL_END, v60, "mio.processing", (const char *)&unk_2106EBECF, v73, 2u);
      }
    }
    else
    {
      v56 = (void *)objc_opt_new();
      objc_msgSend(v56, "setTaggedBufferGroup:", *(_QWORD *)buf);
      v71 = *v17;
      v72 = *((_QWORD *)v17 + 2);
      objc_msgSend(v56, "setTaggedBufferPts:", &v71);
      objc_msgSend(v56, "setMetadata:", v12);
      objc_msgSend(v3, "fifoBuffer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "enqueue:", v56);

      if ((v62 & 1) != 0)
      {
        objc_msgSend(v3, "perfLogHandle");
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v3, "processingSignPostID");
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
        {
          *(_WORD *)v73 = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v63, OS_SIGNPOST_INTERVAL_END, v64, "mio.processing", (const char *)&unk_2106EBECF, v73, 2u);
        }

        v16 = objc_msgSend(v3, "finalizeProcessing");
        goto LABEL_43;
      }
      v65 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v66);
      v59 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v59, 21);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "reportError:", v67);

      v57 = (uint64_t)v69;
    }

    v16 = 0;
    v69 = (id)v57;
LABEL_43:

LABEL_44:
    v8 = v69;
    goto LABEL_17;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  v16 = 0;
LABEL_18:

  return v16;
}

uint64_t __90__MIOWriterStereoPixelBufferStreamInput_appendLeftPixelBuffer_rightPixelBuffer_pts_error___block_invoke_150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)leftBufferPrimary
{
  return self->_leftBufferPrimary;
}

- (void)setLeftBufferPrimary:(BOOL)a3
{
  self->_leftBufferPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftAndRightViewIDs, 0);
  objc_storeStrong((id *)&self->_viewIDs, 0);
  objc_storeStrong((id *)&self->_videoLayerIDs, 0);
}

@end
