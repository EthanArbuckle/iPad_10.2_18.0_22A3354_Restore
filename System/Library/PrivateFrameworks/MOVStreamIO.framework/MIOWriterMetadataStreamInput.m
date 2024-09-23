@implementation MIOWriterMetadataStreamInput

- (MIOWriterMetadataStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4
{
  id v6;
  MIOWriterMetadataStreamInput *v7;
  MIOWriterMetadataStreamInput *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MIOWriterMetadataStreamInput;
  v7 = -[MIOWriterStreamInput init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MIOWriterStreamInput setStreamId:](v7, "setStreamId:", v6);
    -[MIOWriterStreamInput setMediaType:](v8, "setMediaType:", 2);
    v8->_inputFormatDesc = a4;
    CFRetain(a4);
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
  v4.super_class = (Class)MIOWriterMetadataStreamInput;
  -[MIOWriterMetadataStreamInput dealloc](&v4, sel_dealloc);
}

- (AVAssetWriterInput)metadataInput
{
  return self->_metadataInput;
}

- (void)customizeMetadataInput:(id)a3
{
  void *v4;
  void *v5;
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
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (-[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale") < 1)
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMediaTimeScale:", objc_msgSend(v4, "baseMediaTimeScale"));

  }
  else
  {
    objc_msgSend(v20, "setMediaTimeScale:", -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale"));
  }
  -[MIOWriterStreamInput writer](self, "writer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setExpectsMediaDataInRealTime:", objc_msgSend(v5, "realTime"));

  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput streamId](self, "streamId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackMetadataItemWithStreamId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v6, "addObject:", v9);
  v10 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput streamId](self, "streamId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "qtTrackMetadataItemsForStreamId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v12);

  v13 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput customMetadata](self, "customMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customTrackMetadataItems:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v15);
  -[MIOWriterStreamInput customMetadataItems](self, "customMetadataItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[MIOWriterStreamInput customMetadataItems](self, "customMetadataItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v18);

  }
  -[MIOWriterMetadataStreamInput inputSpecificTrackMetadataItems](self, "inputSpecificTrackMetadataItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v19);
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v20, "setMetadata:", v6);

}

- (BOOL)appendMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMetadata:", v4);

  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enqueue:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = -[MIOWriterStreamInput finalizeProcessing](self, "finalizeProcessing");
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v11, 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOWriterStreamInput writer](self, "writer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportError:", v12);

    v8 = 0;
  }

  return v8;
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v6;
  opaqueCMFormatDescription *inputFormatDesc;
  id v8;
  AVAssetWriterInput *v9;
  AVAssetWriterInput *metadataInput;
  AVAssetWriterInputMetadataAdaptor *v11;
  AVAssetWriterInputMetadataAdaptor *metadataAdaptor;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  inputFormatDesc = self->_inputFormatDesc;
  if (!inputFormatDesc)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Cannot create metadata format description for stream '%@'."), v18);
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, v15, 11);
    v16 = 0;
    goto LABEL_7;
  }
  v8 = objc_alloc(MEMORY[0x24BDB2408]);
  v9 = (AVAssetWriterInput *)objc_msgSend(v8, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, inputFormatDesc);
  metadataInput = self->_metadataInput;
  self->_metadataInput = v9;

  -[MIOWriterMetadataStreamInput customizeMetadataInput:](self, "customizeMetadataInput:", self->_metadataInput);
  objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", self->_metadataInput);
  v11 = (AVAssetWriterInputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
  metadataAdaptor = self->_metadataAdaptor;
  self->_metadataAdaptor = v11;

  objc_msgSend(v6, "avWriter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "canAddInput:", self->_metadataInput);

  if (!v14)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Cannot add AVAssetWriterInputs for stream '%@'."), v18);
    goto LABEL_6;
  }
  objc_msgSend(v6, "avWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addInput:", self->_metadataInput);
  v16 = 1;
LABEL_7:

  return v16;
}

- (id)inputSpecificTrackMetadataItems
{
  return 0;
}

- (BOOL)writeNextItemFromFifo
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t buf[16];

  -[MIOWriterStreamInput writer](self, "writer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canWrite");

  if ((v4 & 1) == 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_INFO, "writeNextItemFromFifo canceled because writer does not allow writing anymore.", buf, 2u);
    }

    return 0;
  }
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usage");

  if (!v6)
    return 0;
  v7 = (void *)MEMORY[0x212BC9B10]();
  if (-[MIOWriterMetadataStreamInput areAllInputsReady](self, "areAllInputsReady"))
  {
    -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (-[MIOWriterStreamInput resolveSample](self, "resolveSample"),
          -[MIOWriterStreamInput writer](self, "writer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "startSession"),
          v10,
          v11))
    {
      -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "perfLogHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[MIOWriterStreamInput perfLogHandle](self, "perfLogHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v18 = v14;
      v19 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)v34 = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, v34, 2u);
      }

      -[MIOWriterMetadataStreamInput metadataAdaptor](self, "metadataAdaptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "appendTimedMetadataGroup:", v21);

      v23 = v18;
      v24 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v23, OS_SIGNPOST_INTERVAL_END, v24, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, v33, 2u);
      }

      if ((v22 & 1) != 0)
      {
        v17 = 0;
      }
      else
      {
        v25 = (void *)MEMORY[0x24BDD17C8];
        -[MIOWriterStreamInput writer](self, "writer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "avWriter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOWriterStreamInput streamId](self, "streamId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("Error occurred during appendTimedMetadataGroup %@ for stream '%@'."), v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v30, 21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOWriterStreamInput writer](self, "writer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "reportError:", v31);

        v17 = 1;
      }

    }
    else
    {
      v17 = 1;
    }

  }
  else
  {
    v17 = 1;
  }
  objc_autoreleasePoolPop(v7);
  return v17 == 0;
}

- (id)allWriterInputs
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_metadataInput;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)areAllInputsReady
{
  return -[AVAssetWriterInput isReadyForMoreMediaData](self->_metadataInput, "isReadyForMoreMediaData");
}

- (id)mainAVInput
{
  return self->_metadataInput;
}

- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataAdaptor, 0);
  objc_storeStrong((id *)&self->_metadataInput, 0);
}

@end
