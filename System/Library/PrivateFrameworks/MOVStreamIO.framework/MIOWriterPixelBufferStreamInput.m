@implementation MIOWriterPixelBufferStreamInput

- (MIOWriterPixelBufferStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5
{
  id v8;
  id v9;
  MIOWriterPixelBufferStreamInput *v10;
  MIOWriterPixelBufferStreamInput *v11;
  MIOWriterTimeCodeSingleStreamInput *timeCodeStreamInput;
  uint64_t v13;
  NSArray *attachmentsToEncode;
  void *v15;
  uint64_t v16;
  MIOFrameProcessor *processor;
  __int128 v18;
  _OWORD v20[3];
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MIOWriterPixelBufferStreamInput;
  v10 = -[MIOWriterBufferStreamInput init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MIOWriterStreamInput setStreamId:](v10, "setStreamId:", v8);
    -[MIOWriterStreamInput setMediaType:](v11, "setMediaType:", 0);
    CFRetain(a4);
    v11->_inputFormatDesc = a4;
    timeCodeStreamInput = v11->_timeCodeStreamInput;
    v11->_timeCodeStreamInput = 0;

    objc_storeStrong((id *)&v11->_config, a5);
    objc_msgSend(v9, "objectForKey:", CFSTR("EncodeAttachments"));
    v13 = objc_claimAutoreleasedReturnValue();
    attachmentsToEncode = v11->_attachmentsToEncode;
    v11->_attachmentsToEncode = (NSArray *)v13;

    objc_msgSend(v9, "objectForKey:", CFSTR("DoNotRecordAttachments"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOWriterBufferStreamInput setDoNotRecordAttachments:](v11, "setDoNotRecordAttachments:", objc_msgSend(v15, "BOOLValue"));

    +[MIOFrameProcessorFactory processorForConfig:formatDescription:](MIOFrameProcessorFactory, "processorForConfig:formatDescription:", v9, a4);
    v16 = objc_claimAutoreleasedReturnValue();
    processor = v11->_processor;
    v11->_processor = (MIOFrameProcessor *)v16;

    v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v20[0] = *MEMORY[0x24BDBD8B8];
    v20[1] = v18;
    v20[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[MIOWriterPixelBufferStreamInput setTransform:](v11, "setTransform:", v20);
  }

  return v11;
}

- (MIOWriterPixelBufferStreamInput)initWithStreamId:(id)a3 format:(opaqueCMFormatDescription *)a4 recordingConfig:(id)a5 timeCodeFormat:(opaqueCMFormatDescription *)a6
{
  id v10;
  id v11;
  MIOWriterPixelBufferStreamInput *v12;
  MIOWriterPixelBufferStreamInput *v13;
  MIOWriterTimeCodeSingleStreamInput *v14;
  void *v15;
  uint64_t v16;
  MIOWriterTimeCodeSingleStreamInput *timeCodeStreamInput;
  uint64_t v18;
  NSArray *attachmentsToEncode;
  uint64_t v20;
  MIOFrameProcessor *processor;
  __int128 v22;
  _OWORD v24[3];
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MIOWriterPixelBufferStreamInput;
  v12 = -[MIOWriterBufferStreamInput init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MIOWriterStreamInput setStreamId:](v12, "setStreamId:", v10);
    -[MIOWriterStreamInput setMediaType:](v13, "setMediaType:", 0);
    CFRetain(a4);
    v13->_inputFormatDesc = a4;
    v14 = [MIOWriterTimeCodeSingleStreamInput alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-time-code"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MIOWriterTimeCodeSingleStreamInput initWithStreamId:format:](v14, "initWithStreamId:format:", v15, a6);
    timeCodeStreamInput = v13->_timeCodeStreamInput;
    v13->_timeCodeStreamInput = (MIOWriterTimeCodeSingleStreamInput *)v16;

    -[MIOWriterStreamInput registerForAssociating:trackRelation:](v13->_timeCodeStreamInput, "registerForAssociating:trackRelation:", v13, *MEMORY[0x24BDB20F0]);
    objc_storeStrong((id *)&v13->_config, a5);
    objc_msgSend(v11, "objectForKey:", CFSTR("EncodeAttachments"));
    v18 = objc_claimAutoreleasedReturnValue();
    attachmentsToEncode = v13->_attachmentsToEncode;
    v13->_attachmentsToEncode = (NSArray *)v18;

    +[MIOFrameProcessorFactory processorForConfig:formatDescription:](MIOFrameProcessorFactory, "processorForConfig:formatDescription:", v11, a4);
    v20 = objc_claimAutoreleasedReturnValue();
    processor = v13->_processor;
    v13->_processor = (MIOFrameProcessor *)v20;

    v22 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v24[0] = *MEMORY[0x24BDBD8B8];
    v24[1] = v22;
    v24[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[MIOWriterPixelBufferStreamInput setTransform:](v13, "setTransform:", v24);
  }

  return v13;
}

- (void)dealloc
{
  opaqueCMFormatDescription *inputFormatDesc;
  objc_super v4;

  inputFormatDesc = self->_inputFormatDesc;
  if (inputFormatDesc)
  {
    CFRelease(inputFormatDesc);
    self->_inputFormatDesc = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOWriterPixelBufferStreamInput;
  -[MIOWriterPixelBufferStreamInput dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)MIOWriterPixelBufferStreamInput;
  -[MIOWriterStreamInput invalidate](&v7, sel_invalidate);
  if (self->_videoEncoderInterface)
  {
    v3 = dispatch_group_create();
    -[MOVStreamVideoEncoderInterface closeEncoderInDispatchGroup:](self->_videoEncoderInterface, "closeEncoderInDispatchGroup:", v3);
    v4 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v3, v4))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        -[MIOWriterStreamInput streamId](self, "streamId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v9 = v6;
        _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_ERROR, "Timeout closing encoder: %{public}@.", buf, 0xCu);

      }
    }

  }
}

- (id)stats
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MIOWriterStreamInput uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIOWriterStreamInput pendingSamples](self, "pendingSamples");
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "usage");
  -[MIOWriterPixelBufferStreamInput videoEncoderInterface](self, "videoEncoderInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "encodingQueueDepth");
  -[MIOWriterPixelBufferStreamInput videoEncoderInterface](self, "videoEncoderInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: PEND: %lld (FIFO: %zu ECDQ: %lld ENC: %lld) REDY: %d"), v4, v5, v7, v9, objc_msgSend(v10, "pendingFrames"), -[MIOWriterBufferStreamInput areAllInputsReady](self, "areAllInputsReady"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)underlyingInputs
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_timeCodeStreamInput)
  {
    v4[0] = self->_timeCodeStreamInput;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (id)avMediaType
{
  return (id)*MEMORY[0x24BDB1D50];
}

- (id)sampleInputOutputSettings
{
  void *v3;
  uint64_t v4;
  NSDictionary *config;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  MOVStreamVideoEncoderInterface *v14;
  void *v15;
  void *v16;
  MOVStreamVideoEncoderInterface *v17;
  MOVStreamVideoEncoderInterface *videoEncoderInterface;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[MIOWriterPixelBufferStreamInput processor](self, "processor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "formatDescriptionForEncoding");

  config = self->_config;
  -[MIOWriterStreamInput writer](self, "writer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultFrameRate");
  v8 = v7;
  -[MIOWriterStreamInput writer](self, "writer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "preferCustomCompression");
  -[MIOWriterStreamInput writer](self, "writer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOOutputSettingsFactory outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:](MIOOutputSettingsFactory, "outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:", config, v4, v10, objc_msgSend(v11, "enableAVEHighPerformanceProfile"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [MOVStreamVideoEncoderInterface alloc];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MOVStreamVideoEncoderInterface initForStream:configuration:delegate:](v14, "initForStream:configuration:delegate:", v15, v16, self);
    videoEncoderInterface = self->_videoEncoderInterface;
    self->_videoEncoderInterface = v17;

    -[MOVStreamVideoEncoderInterface setUseLegacyVTController:](self->_videoEncoderInterface, "setUseLegacyVTController:", 0);
    if (!-[MOVStreamVideoEncoderInterface preSetupWithFormatDescription:](self->_videoEncoderInterface, "preSetupWithFormatDescription:", v4))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Orig fd: %@  Used fd: %@"), self->_inputFormatDesc, v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput streamId](self, "streamId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Pre-initialize VTCompressionSession for stream '%@' failed (%@)! Will try again after first pixel buffer is appended..."), v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[MIOWriterStreamInput writer](self, "writer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportWarning:", v22);

    }
    v24 = 0;
  }
  else
  {
    objc_msgSend(v12, "settings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[MIOWriterStreamInput writer](self, "writer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "inProcessRecording");

      if (v27)
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        -[MIOWriterStreamInput streamId](self, "streamId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("MIOWriter.inProcessRecording requires custom or none encoder settings. Encoding for stream %@ will not performed in process!"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[MIOWriterStreamInput writer](self, "writer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "reportWarning:", v30);

      }
    }
    objc_msgSend(v12, "settings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (opaqueCMFormatDescription)formatDescription
{
  void *v2;
  opaqueCMFormatDescription *v3;

  -[MIOWriterPixelBufferStreamInput processor](self, "processor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (opaqueCMFormatDescription *)objc_msgSend(v2, "formatDescriptionForEncoding");

  return v3;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  return -[MIOWriterTimeCodeSingleStreamInput formatDescription](self->_timeCodeStreamInput, "formatDescription");
}

- (BOOL)sampleReorderingEnabled
{
  MOVStreamVideoEncoderInterface *videoEncoderInterface;

  videoEncoderInterface = self->_videoEncoderInterface;
  if (videoEncoderInterface)
    LOBYTE(videoEncoderInterface) = -[MOVStreamVideoEncoderInterface frameReorderingEnabled](videoEncoderInterface, "frameReorderingEnabled");
  return (char)videoEncoderInterface;
}

- (BOOL)strictlyEnforceBufferCapacity
{
  return self->_videoEncoderInterface != 0;
}

- (BOOL)trackEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  signed int MediaSubType;
  BOOL v10;
  int v11;

  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("MarksOutputTrackAsEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writerInputsWithMediaType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 1)
      goto LABEL_4;
    MediaSubType = CMFormatDescriptionGetMediaSubType(self->_inputFormatDesc);
    v5 = 0;
    if (MediaSubType > 1650943795)
    {
      if (MediaSubType > 1735549491)
      {
        v10 = MediaSubType == 1735549492;
        v11 = 1919379252;
      }
      else
      {
        v10 = MediaSubType == 1650943796;
        v11 = 1734505012;
      }
    }
    else if (MediaSubType > 1278226735)
    {
      v10 = MediaSubType == 1278226736;
      v11 = 1278226742;
    }
    else
    {
      v10 = MediaSubType == 825306677;
      v11 = 825437747;
    }
    if (!v10 && MediaSubType != v11)
LABEL_4:
      v5 = 1;
  }

  return v5;
}

- (void)prepareInputFinished
{
  uint64_t v3;
  void *v4;
  id v5;

  -[MIOWriterStreamInput writer](self, "writer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "bufferCacheMode");
  -[MIOWriterPixelBufferStreamInput processor](self, "processor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBufferCacheMode:", v3);

}

- (id)inputSpecificTrackMetadataItems
{
  void *v3;
  uint64_t MediaSubType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v3 = (void *)objc_opt_new();
  MediaSubType = CMFormatDescriptionGetMediaSubType(self->_inputFormatDesc);
  objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithInputPixelFormat:", MediaSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  if (+[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", MediaSubType))
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("RawBayerRearrangeTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithRawBayerRearrangeType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  else
  {
    v7 = v5;
  }
  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("OutputPixelFormatOverride"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithOutputPixelFormatOverride:", objc_msgSend(v8, "intValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "addObject:", v10);

  }
  -[MIOWriterPixelBufferStreamInput processor](self, "processor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "encodedPixelFormat");

  objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithEncodedPixelFormat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v3, "addObject:", v13);
  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("StereoVideoEncoding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("StereoVideoEncoding"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "BOOLValue");

  }
  objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithStereoViewEncoding:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v3, "addObject:", v16);
  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("AdditionalCompressionProperties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("AdditionalCompressionProperties"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDB2588], "trackMetadataItemWithAdditionalCompressionProperties:error:", v18, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput streamId](self, "streamId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Cannot create track metadata item for additional encoder settings of stream %@. Error: %@"), v22, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[MIOWriterStreamInput writer](self, "writer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reportWarning:", v23);

    }
    else if (v19)
    {
      objc_msgSend(v3, "addObject:", v19);
    }

  }
  else
  {
    v19 = v16;
  }

  return v3;
}

- (void)customizeSampleInput:(id)a3
{
  id v4;
  _OWORD v5[6];

  v4 = a3;
  -[MIOWriterPixelBufferStreamInput transform](self, "transform");
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  objc_msgSend(v4, "setTransform:", v5);
  objc_msgSend(v4, "setMarksOutputTrackAsEnabled:", -[MIOWriterPixelBufferStreamInput trackEnabled](self, "trackEnabled"));

}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 error:(id *)a5
{
  _QWORD v6[3];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  memset(v6, 0, sizeof(v6));
  return -[MIOWriterPixelBufferStreamInput appendPixelBuffer:pts:timeCode:error:](self, "appendPixelBuffer:pts:timeCode:error:", a3, &v7, v6, a5);
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 timeCode:(CVSMPTETime *)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD);
  uint64_t v12;
  _QWORD block[4];
  uint64_t (**v15)(_QWORD);
  _QWORD v16[5];
  id v17[2];
  __int128 v18;
  int64_t var3;
  __int128 v20;
  uint64_t v21;
  id location;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;

  v9 = (uint64_t)self;
  v23 = *a4;
  if (-[MIOWriterStreamInput prepareForAppendWithTimeStamp:error:](self, "prepareForAppendWithTimeStamp:error:", &v23, a6))
  {
    CVPixelBufferRetain(a3);
    objc_initWeak(&location, (id)v9);
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke;
    v16[3] = &unk_24CA45128;
    objc_copyWeak(v17, &location);
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v20 = *(_OWORD *)&a5->subframes;
    v21 = *(_QWORD *)&a5->hours;
    v17[1] = a3;
    v16[4] = v9;
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
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke_168;
      block[3] = &unk_24CA44C28;
      v15 = v11;
      dispatch_async((dispatch_queue_t)v9, block);

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

uint64_t __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CVBuffer *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  void *v37;
  char v38;
  __int128 v39;
  CMTimeEpoch v40;
  __int128 v41;
  CMTimeEpoch v42;
  const opaqueCMFormatDescription *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  os_signpost_id_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  os_signpost_id_t v69;
  uint8_t v70[8];
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo buf;
  __int128 v73;
  uint64_t v74;
  id v75;
  id v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  id v81;
  __int128 v82;
  uint64_t v83;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "perfLogHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "processingSignPostID");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mio.processing", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
    }

    v6 = (void *)MEMORY[0x212BC9B10]();
    if ((objc_msgSend(v3, "doNotRecordAttachments") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 48);
      v82 = *(_OWORD *)(a1 + 56);
      v83 = *(_QWORD *)(a1 + 72);
      v81 = 0;
      objc_msgSend(MEMORY[0x24BDB26C0], "attachmentsMIOTimedMetadataGroupForPixelBuffer:pts:error:", v9, &v82, &v81);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v81;
      if (v10)
      {
        v11 = v10;
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "streamId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Cannot append frame, invalid pixel buffer attachments %@ for stream %@."), v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v14, 21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "writer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reportError:", v15);

        CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
        objc_msgSend(v3, "perfLogHandle");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v3, "processingSignPostID");
        if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
          goto LABEL_38;
        LOWORD(buf.duration.value) = 0;
        goto LABEL_37;
      }
    }
    objc_msgSend(v3, "timeCodeStreamInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 || (v20 = *(_DWORD *)(a1 + 92), v19, (v20 & 1) == 0))
    {
      v21 = 0;
LABEL_15:
      objc_msgSend(v3, "processor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "attachmentsToEncode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v21;
      v25 = (__CVBuffer *)objc_msgSend(v22, "processPixelBuffer:preserveAttachments:error:", v23, v24, &v75);
      v11 = v75;

      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
      if (v25)
      {
        objc_msgSend(v3, "videoEncoderInterface");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = (void *)objc_opt_new();
          objc_msgSend(v27, "setMetadata:", v7);
          objc_msgSend(v3, "pendingAttachments");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v28, "enqueue:", v27);

          if ((v8 & 1) != 0)
          {
            objc_msgSend(v3, "videoEncoderInterface");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = *(_OWORD *)(a1 + 56);
            v74 = *(_QWORD *)(a1 + 72);
            objc_msgSend(v29, "encodeFrame:pts:frameProperties:metadata:", v25, &v73, 0, 0);

            CVPixelBufferRelease(v25);
          }
          else
          {
            v52 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v3, "streamId");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "stringWithFormat:", CFSTR("Attempted to enqueue metadata in full Fifo for stream %@.  Indicates leak in overall pending sample metadata tracking."), v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v54, 21);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "writer");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "reportError:", v55);

            CFRelease(v25);
            objc_msgSend(v3, "perfLogHandle");
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v3, "processingSignPostID");
            if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
            {
              LOWORD(buf.duration.value) = 0;
              _os_signpost_emit_with_name_impl(&dword_210675000, v57, OS_SIGNPOST_INTERVAL_END, v58, "mio.processing", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
            }

          }
          goto LABEL_40;
        }
        v39 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 48);
        *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 32);
        *(_OWORD *)&buf.decodeTimeStamp.value = v39;
        v40 = *(_QWORD *)(MEMORY[0x24BDC0DC0] + 64);
        v41 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 16);
        *(_OWORD *)&buf.duration.value = *MEMORY[0x24BDC0DC0];
        *(_OWORD *)&buf.duration.epoch = v41;
        *(_OWORD *)&buf.presentationTimeStamp.value = *(_OWORD *)(a1 + 56);
        v42 = *(_QWORD *)(a1 + 72);
        buf.decodeTimeStamp.epoch = v40;
        buf.presentationTimeStamp.epoch = v42;
        sampleBufferOut = 0;
        v43 = (const opaqueCMFormatDescription *)objc_msgSend(*(id *)(a1 + 32), "formatDescription");
        v44 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v25, 1u, 0, 0, v43, &buf, &sampleBufferOut);
        CVPixelBufferRelease(v25);
        if ((_DWORD)v44)
        {
          v45 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v3, "streamId");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("Cannot append frame, CMSampleBufferCreateForImageBuffer failed (err:%d) for stream %@."), v44, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v47, 21);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "writer");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "reportError:", v48);

          objc_msgSend(v3, "perfLogHandle");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v3, "processingSignPostID");
          if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
          {
            *(_WORD *)v70 = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v50, OS_SIGNPOST_INTERVAL_END, v51, "mio.processing", (const char *)&unk_2106EBECF, v70, 2u);
          }
        }
        else
        {
          v47 = (void *)objc_opt_new();
          objc_msgSend(v47, "setSampleBuffer:", sampleBufferOut);
          objc_msgSend(v47, "setMetadata:", v7);
          objc_msgSend(v3, "fifoBuffer");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "enqueue:", v47);

          if ((v64 & 1) != 0)
          {
            v8 = objc_msgSend(v3, "finalizeProcessing");
LABEL_49:

            goto LABEL_40;
          }
          v65 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v3, "streamId");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v66);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v48, 21);
          v50 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "writer");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "reportError:", v50);

          CFRelease(sampleBufferOut);
          objc_msgSend(v3, "perfLogHandle");
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v3, "processingSignPostID");
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
          {
            *(_WORD *)v70 = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v68, OS_SIGNPOST_INTERVAL_END, v69, "mio.processing", (const char *)&unk_2106EBECF, v70, 2u);
          }

        }
        v8 = 0;
        goto LABEL_49;
      }
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "streamId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Process pixel buffer failed %@ for stream %@."), v11, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v32, 21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "writer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "reportError:", v33);

      objc_msgSend(v3, "perfLogHandle");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v3, "processingSignPostID");
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        LOWORD(buf.duration.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_210675000, v35, OS_SIGNPOST_INTERVAL_END, v36, "mio.processing", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
      }

LABEL_39:
      v8 = 0;
LABEL_40:

      objc_autoreleasePoolPop(v6);
      goto LABEL_41;
    }
    objc_msgSend(v3, "timeCodeStreamInput");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = *(_OWORD *)(a1 + 80);
    v80 = *(_QWORD *)(a1 + 96);
    v77 = *(_OWORD *)(a1 + 56);
    v78 = *(_QWORD *)(a1 + 72);
    v76 = 0;
    v38 = objc_msgSend(v37, "appendTimeCode:pts:error:", &v79, &v77, &v76);
    v11 = v76;

    if ((v38 & 1) != 0)
    {
      v21 = v11;
      goto LABEL_15;
    }
    v59 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "streamId");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringWithFormat:", CFSTR("Cannot append time code to underlying tmcd stream for video stream %@."), v60);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v14, 21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "writer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "reportError:", v15);

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    objc_msgSend(v3, "perfLogHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "processingSignPostID");
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
    {
LABEL_38:

      goto LABEL_39;
    }
    LOWORD(buf.duration.value) = 0;
LABEL_37:
    _os_signpost_emit_with_name_impl(&dword_210675000, v17, OS_SIGNPOST_INTERVAL_END, v18, "mio.processing", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
    goto LABEL_38;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  v8 = 0;
LABEL_41:

  return v8;
}

uint64_t __72__MIOWriterPixelBufferStreamInput_appendPixelBuffer_pts_timeCode_error___block_invoke_168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishProcessing
{
  MOVStreamVideoEncoderInterface *videoEncoderInterface;

  videoEncoderInterface = self->_videoEncoderInterface;
  if (videoEncoderInterface)
    -[MOVStreamVideoEncoderInterface awaitEncoderClosed](videoEncoderInterface, "awaitEncoderClosed");
}

- (BOOL)shouldEnableInProcessEncoding
{
  void *v2;
  char v3;

  -[MIOWriterStreamInput writer](self, "writer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inProcessRecording");

  return v3;
}

- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[MIOWriterBufferStreamInput pendingAttachments](self, "pendingAttachments", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeue");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSampleBuffer:", a4);
  objc_msgSend(v19, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMetadata:", v11);

  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "enqueue:", v10);

  if ((v13 & 1) != 0)
  {
    -[MIOWriterStreamInput finalizeProcessing](self, "finalizeProcessing");
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Attempted to enqueue sample in full Fifo for stream %@.  Indicates leak in overall pending sample tracking."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v16, 21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOWriterStreamInput writer](self, "writer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reportError:", v17);

  }
}

- (void)encoder:(id)a3 encodingFailedForStream:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample buffer encoding failed (encoder status: %i flags: %d) for stream '%@'. Dropping frame."), objc_msgSend(v10, "lastEncodingStatus"), objc_msgSend(v10, "lastEncodingInfoFlags"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v7, 14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOWriterStreamInput writer](self, "writer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportError:", v8);

  -[MIOWriterStreamInput resolveSample](self, "resolveSample");
}

- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:codecTypeOverrideForstreamId:]", "MIOWriterPixelBufferStreamInput.mm", 492, "0");
}

- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:configureSessionOverride:streamId:]", "MIOWriterPixelBufferStreamInput.mm", 498, "0");
}

- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[MIOWriterPixelBufferStreamInput encoder:overrideVideoEncoderSpecificationForStreamId:]", "MIOWriterPixelBufferStreamInput.mm", 504, "0");
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_transform, a3, 48, 1, 0);
}

- (MOVStreamVideoEncoderInterface)videoEncoderInterface
{
  return (MOVStreamVideoEncoderInterface *)objc_getProperty(self, a2, 264, 1);
}

- (MIOWriterTimeCodeSingleStreamInput)timeCodeStreamInput
{
  return (MIOWriterTimeCodeSingleStreamInput *)objc_getProperty(self, a2, 272, 1);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (NSArray)attachmentsToEncode
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (MIOFrameProcessor)processor
{
  return (MIOFrameProcessor *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_attachmentsToEncode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_timeCodeStreamInput, 0);
  objc_storeStrong((id *)&self->_videoEncoderInterface, 0);
}

@end
