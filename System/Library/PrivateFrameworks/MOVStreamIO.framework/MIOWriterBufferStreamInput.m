@implementation MIOWriterBufferStreamInput

- (MIOWriterBufferStreamInput)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIOWriterBufferStreamInput;
  return -[MIOWriterStreamInput init](&v3, sel_init);
}

- (id)avMediaType
{
  __assert_rtn("-[MIOWriterBufferStreamInput avMediaType]", "MIOWriterBufferStreamInput.m", 56, "0");
}

- (id)sampleInputOutputSettings
{
  __assert_rtn("-[MIOWriterBufferStreamInput sampleInputOutputSettings]", "MIOWriterBufferStreamInput.m", 62, "0");
}

- (opaqueCMFormatDescription)formatDescription
{
  __assert_rtn("-[MIOWriterBufferStreamInput formatDescription]", "MIOWriterBufferStreamInput.m", 68, "0");
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  __assert_rtn("-[MIOWriterBufferStreamInput timeCodeFormatDescription]", "MIOWriterBufferStreamInput.m", 74, "0");
}

- (void)customizeSampleInput:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[MIOWriterBufferStreamInput customizeSampleInput:]", "MIOWriterBufferStreamInput.m", 80, "0");
}

- (void)customizeMetadataInput:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[MIOWriterBufferStreamInput customizeMetadataInput:]", "MIOWriterBufferStreamInput.m", 91, "0");
}

- (BOOL)sampleReorderingEnabled
{
  __assert_rtn("-[MIOWriterBufferStreamInput sampleReorderingEnabled]", "MIOWriterBufferStreamInput.m", 97, "0");
}

- (BOOL)applyWriterTimeScaleToSampleInput
{
  return 1;
}

- (id)taggedPixelBufferAttributes
{
  return 0;
}

- (id)inputSpecificTrackMetadataItems
{
  return 0;
}

- (id)allWriterInputs
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = self->_sampleInput;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_timeCodeInput)
    objc_msgSend(v4, "addObject:");
  if (self->_metadataInput)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (BOOL)areAllInputsReady
{
  void *v3;
  int v4;
  void *v5;
  AVAssetWriterInput *metadataInput;
  BOOL result;
  BOOL v8;
  void *v9;
  char v10;

  -[MIOWriterBufferStreamInput sampleInput](self, "sampleInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadyForMoreMediaData");

  if (self->_timeCodeInput)
  {
    if (!v4)
      return 0;
    -[MIOWriterBufferStreamInput timeCodeInput](self, "timeCodeInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isReadyForMoreMediaData");

  }
  metadataInput = self->_metadataInput;
  if (metadataInput)
    result = 0;
  else
    result = v4;
  if (metadataInput)
    v8 = v4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    -[MIOWriterBufferStreamInput metadataInput](self, "metadataInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isReadyForMoreMediaData");

    return v10;
  }
  return result;
}

- (id)mainAVInput
{
  return self->_sampleInput;
}

- (id)commonTrackMetadataItems
{
  void *v3;
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
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput streamId](self, "streamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackMetadataItemWithStreamId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput streamId](self, "streamId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "qtTrackMetadataItemsForStreamId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithSerializationMode:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v3, "addObject:", v10);
  v11 = (void *)MEMORY[0x24BDB2588];
  -[MIOWriterStreamInput customMetadata](self, "customMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customTrackMetadataItems:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v13);
  -[MIOWriterStreamInput customMetadataItems](self, "customMetadataItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[MIOWriterStreamInput customMetadataItems](self, "customMetadataItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v16);

  }
  return v3;
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  opaqueCMFormatDescription *v9;
  void *v10;
  char v11;
  AVAssetWriterInput *v12;
  AVAssetWriterInput *sampleInput;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *v23;
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *taggedPixelBufferGroupAdaptor;
  void *v25;
  int v26;
  void *v27;
  MIOFifoBuffer *v28;
  void *pendingAttachments;
  void *v30;
  void *v31;
  uint64_t v33;
  const void *v34;
  id v35;
  AVAssetWriterInput *v36;
  AVAssetWriterInput *metadataInput;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  AVAssetWriterInputMetadataAdaptor *v42;
  AVAssetWriterInputMetadataAdaptor *metadataAdaptor;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;

  v6 = a3;
  -[MIOWriterBufferStreamInput sampleInputOutputSettings](self, "sampleInputOutputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOWriterBufferStreamInput avMediaType](self, "avMediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MIOWriterBufferStreamInput formatDescription](self, "formatDescription");
  objc_msgSend(v6, "avWriter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canApplyOutputSettings:forMediaType:", v7, v8);

  if ((v11 & 1) != 0)
  {
    v57 = a4;
    v12 = (AVAssetWriterInput *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2408]), "initWithMediaType:outputSettings:sourceFormatHint:", v8, v7, v9);
    sampleInput = self->_sampleInput;
    self->_sampleInput = v12;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_sampleInput, "setExpectsMediaDataInRealTime:", objc_msgSend(v6, "realTime"));
    if (-[MIOWriterBufferStreamInput applyWriterTimeScaleToSampleInput](self, "applyWriterTimeScaleToSampleInput"))
    {
      if (-[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale") < 1)
      {
        -[MIOWriterStreamInput writer](self, "writer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVAssetWriterInput setMediaTimeScale:](self->_sampleInput, "setMediaTimeScale:", objc_msgSend(v18, "baseMediaTimeScale"));

      }
      else
      {
        -[AVAssetWriterInput setMediaTimeScale:](self->_sampleInput, "setMediaTimeScale:", -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale"));
      }
    }
    -[MIOWriterBufferStreamInput commonTrackMetadataItems](self, "commonTrackMetadataItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    -[MIOWriterBufferStreamInput inputSpecificTrackMetadataItems](self, "inputSpecificTrackMetadataItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
      objc_msgSend(v20, "addObjectsFromArray:", v21);
    -[AVAssetWriterInput setMetadata:](self->_sampleInput, "setMetadata:", v20);
    -[MIOWriterBufferStreamInput customizeSampleInput:](self, "customizeSampleInput:", self->_sampleInput);
    -[MIOWriterBufferStreamInput taggedPixelBufferAttributes](self, "taggedPixelBufferAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2420]), "initWithAssetWriterInput:sourcePixelBufferAttributes:", self->_sampleInput, v22);
      taggedPixelBufferGroupAdaptor = self->_taggedPixelBufferGroupAdaptor;
      self->_taggedPixelBufferGroupAdaptor = v23;

    }
    objc_msgSend(v6, "avWriter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "canAddInput:", self->_sampleInput);

    if (v26)
    {
      objc_msgSend(v6, "avWriter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addInput:", self->_sampleInput);

      if (self->_doNotRecordAttachments)
      {
LABEL_13:
        if (!-[MIOWriterStreamInput strictlyEnforceBufferCapacity](self, "strictlyEnforceBufferCapacity"))
        {
          v17 = 1;
          goto LABEL_19;
        }
        v28 = -[MIOFifoBuffer initWithCapacity:]([MIOFifoBuffer alloc], "initWithCapacity:", -[MIOWriterStreamInput bufferingCapacity](self, "bufferingCapacity"));
        pendingAttachments = self->_pendingAttachments;
        self->_pendingAttachments = v28;
        v17 = 1;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v33 = objc_msgSend(MEMORY[0x24BDB2588], "createMIOMetadataAttachmentsFormatDescription");
      if (v33)
      {
        v34 = (const void *)v33;
        v35 = objc_alloc(MEMORY[0x24BDB2408]);
        v36 = (AVAssetWriterInput *)objc_msgSend(v35, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, v34);
        metadataInput = self->_metadataInput;
        self->_metadataInput = v36;

        CFRelease(v34);
        -[MIOWriterStreamInput streamId](self, "streamId");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOVStreamIOUtility qtTrackNameForAssociatedAttachmentsTrack:](MOVStreamIOUtility, "qtTrackNameForAssociatedAttachmentsTrack:", v38);
        pendingAttachments = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDB2588], "qtTrackMetadataItemsForStreamId:", pendingAttachments);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVAssetWriterInput setMetadata:](self->_metadataInput, "setMetadata:");
        -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_metadataInput, "setExpectsMediaDataInRealTime:", objc_msgSend(v6, "realTime"));
        if (-[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale") < 1)
        {
          -[MIOWriterStreamInput writer](self, "writer");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAssetWriterInput setMediaTimeScale:](self->_metadataInput, "setMediaTimeScale:", objc_msgSend(v40, "baseMediaTimeScale"));

        }
        else
        {
          -[AVAssetWriterInput setMediaTimeScale:](self->_metadataInput, "setMediaTimeScale:", -[MIOWriterStreamInput mediaTimeScale](self, "mediaTimeScale"));
        }
        -[MIOWriterBufferStreamInput customizeMetadataInput:](self, "customizeMetadataInput:", self->_metadataInput);
        v41 = *MEMORY[0x24BDB20E8];
        if (-[AVAssetWriterInput canAddTrackAssociationWithTrackOfInput:type:](self->_metadataInput, "canAddTrackAssociationWithTrackOfInput:type:", self->_sampleInput, *MEMORY[0x24BDB20E8]))
        {
          -[AVAssetWriterInput addTrackAssociationWithTrackOfInput:type:](self->_metadataInput, "addTrackAssociationWithTrackOfInput:type:", self->_sampleInput, v41);
          objc_msgSend(MEMORY[0x24BDB2410], "assetWriterInputMetadataAdaptorWithAssetWriterInput:", self->_metadataInput);
          v42 = (AVAssetWriterInputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
          metadataAdaptor = self->_metadataAdaptor;
          self->_metadataAdaptor = v42;

          objc_msgSend(v6, "avWriter");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "canAddInput:", self->_metadataInput);

          if ((v45 & 1) != 0)
          {
            objc_msgSend(v6, "avWriter");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addInput:", self->_metadataInput);

            goto LABEL_13;
          }
          v54 = (void *)MEMORY[0x24BDD17C8];
          -[MIOWriterStreamInput streamId](self, "streamId");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("Cannot add metadata input for stream '%@'."), v55);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = (void *)MEMORY[0x24BDD1540];
          v51 = v57;
          v52 = v49;
          v53 = 11;
        }
        else
        {
          v47 = (void *)MEMORY[0x24BDD17C8];
          -[MIOWriterStreamInput streamId](self, "streamId");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("Cannot associate attachment metadata input with %@."), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = (void *)MEMORY[0x24BDD1540];
          v51 = v57;
          v52 = v49;
          v53 = 13;
        }
        objc_msgSend(v50, "populateStreamError:message:code:", v51, v52, v53);

LABEL_17:
        v17 = 0;
        goto LABEL_18;
      }
      v39 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput streamId](self, "streamId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Cannot create metadata format description for stream '%@'."), v31);
    }
    else
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput streamId](self, "streamId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Cannot add sample input for stream '%@'."), v31);
    }
    pendingAttachments = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, pendingAttachments, 11);
    goto LABEL_17;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[MIOWriterStreamInput streamId](self, "streamId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Unable to use output settings (%@) for stream '%@'."), v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, v16, 11);
  v17 = 0;
LABEL_20:

  return v17;
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
  void *v16;
  id v17;
  void *v18;
  int v20;
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *taggedPixelBufferGroupAdaptor;
  NSObject *v22;
  os_signpost_id_t v23;
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *v29;
  os_signpost_id_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  os_signpost_id_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BYTE v56[24];
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
      _os_log_impl(&dword_210675000, v15, OS_LOG_TYPE_INFO, "writeNextItemFromFifo dropped sample because writer does not allow writing anymore.", buf, 2u);
    }

    -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "dequeue");

    -[MIOWriterStreamInput resolveSample](self, "resolveSample");
    -[MIOWriterStreamInput writer](self, "writer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reportWarning:", CFSTR("Frame was dropped because writer or AV input state does not allow writing."));

    return 0;
  }
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usage");

  if (!v6)
    return 0;
  v7 = (void *)MEMORY[0x212BC9B10]();
  if (-[MIOWriterBufferStreamInput areAllInputsReady](self, "areAllInputsReady"))
  {
    -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (-[MIOWriterStreamInput resolveSample](self, "resolveSample"),
          -[MIOWriterStreamInput writer](self, "writer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "startSession"),
          v10,
          !v11))
    {
      v20 = 1;
LABEL_43:

      goto LABEL_44;
    }
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

    taggedPixelBufferGroupAdaptor = self->_taggedPixelBufferGroupAdaptor;
    v22 = v14;
    if (taggedPixelBufferGroupAdaptor)
    {
      v23 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, "mio.append.stereo.sample.buffer", (const char *)&unk_2106EBECF, buf, 2u);
      }

      v24 = self->_taggedPixelBufferGroupAdaptor;
      v25 = objc_msgSend(v9, "taggedBufferGroup");
      objc_msgSend(v9, "taggedBufferPts");
      v26 = -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor appendTaggedPixelBufferGroup:withPresentationTime:](v24, "appendTaggedPixelBufferGroup:withPresentationTime:", v25, v56);
      v27 = v22;
      v28 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        v29 = "mio.append.stereo.sample.buffer";
LABEL_28:
        _os_signpost_emit_with_name_impl(&dword_210675000, v27, OS_SIGNPOST_INTERVAL_END, v28, v29, (const char *)&unk_2106EBECF, buf, 2u);
      }
    }
    else
    {
      v30 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v30, "mio.append.sample.buffer", (const char *)&unk_2106EBECF, buf, 2u);
      }

      -[MIOWriterBufferStreamInput sampleInput](self, "sampleInput");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v31, "appendSampleBuffer:", objc_msgSend(v9, "sampleBuffer"));

      v27 = v22;
      v28 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        v29 = "mio.append.sample.buffer";
        goto LABEL_28;
      }
    }

    if ((v26 & 1) != 0)
    {
      -[MIOWriterBufferStreamInput metadataInput](self, "metadataInput");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        goto LABEL_38;
      v33 = v22;
      v34 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, "mio.append.sample.buffer.attachments", (const char *)&unk_2106EBECF, buf, 2u);
      }

      -[MIOWriterBufferStreamInput metadataAdaptor](self, "metadataAdaptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "appendTimedMetadataGroup:", v36);

      v38 = v33;
      v39 = -[MIOWriterStreamInput avfAppendSignPostID](self, "avfAppendSignPostID");
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v38, OS_SIGNPOST_INTERVAL_END, v39, "mio.append.sample.buffer.attachments", (const char *)&unk_2106EBECF, buf, 2u);
      }

      if ((v37 & 1) != 0)
      {
LABEL_38:
        v20 = 0;
LABEL_42:

        goto LABEL_43;
      }
      v48 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput writer](self, "writer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "avWriter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "error");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOWriterStreamInput streamId](self, "streamId");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("Error occurred during appendTimedMetadataGroup %@ for stream '%@'."), v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v53, 21);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOWriterStreamInput writer](self, "writer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "reportError:", v54);

    }
    else
    {
      v40 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput writer](self, "writer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "avWriter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "error");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOWriterStreamInput streamId](self, "streamId");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("Error occurred during AVWriter append %@ for stream '%@'."), v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v45, 21);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOWriterStreamInput writer](self, "writer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "reportError:", v46);

    }
    v20 = 1;
    goto LABEL_42;
  }
  v20 = 1;
LABEL_44:
  objc_autoreleasePoolPop(v7);
  return v20 == 0;
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)taggedPixelBufferGroupAdaptor
{
  return self->_taggedPixelBufferGroupAdaptor;
}

- (void)setTaggedPixelBufferGroupAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_taggedPixelBufferGroupAdaptor, a3);
}

- (AVAssetWriterInput)sampleInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 192, 1);
}

- (AVAssetWriterInput)metadataInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 208, 1);
}

- (AVAssetWriterInputMetadataAdaptor)metadataAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 216, 1);
}

- (AVAssetWriterInput)timeCodeInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 200, 1);
}

- (AVAssetWriterInputMetadataAdaptor)timeCodeAdaptor
{
  return (AVAssetWriterInputMetadataAdaptor *)objc_getProperty(self, a2, 248, 1);
}

- (MIOFifoBuffer)pendingAttachments
{
  return (MIOFifoBuffer *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)doNotRecordAttachments
{
  return self->_doNotRecordAttachments;
}

- (void)setDoNotRecordAttachments:(BOOL)a3
{
  self->_doNotRecordAttachments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCodeAdaptor, 0);
  objc_storeStrong((id *)&self->_taggedPixelBufferGroupAdaptor, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_storeStrong((id *)&self->_metadataAdaptor, 0);
  objc_storeStrong((id *)&self->_metadataInput, 0);
  objc_storeStrong((id *)&self->_timeCodeInput, 0);
  objc_storeStrong((id *)&self->_sampleInput, 0);
}

@end
