@implementation ICDocCamDebugMovieController

- (ICDocCamDebugMovieController)initWithDelegate:(id)a3 videoConnection:(id)a4 referenceOrientation:(int64_t)a5
{
  id v8;
  id v9;
  ICDocCamDebugMovieController *v10;
  ICDocCamDebugMovieController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *movieURL;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *movieWritingQueue;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ICDocCamDebugMovieController;
  v10 = -[ICDocCamDebugMovieController init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_videoConnection, v9);
    v11->_referenceOrientation = a5;
    v12 = (void *)MEMORY[0x24BDBCF48];
    v13 = (void *)MEMORY[0x24BDD17C8];
    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("Movie.MOV"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    movieURL = v11->_movieURL;
    v11->_movieURL = (NSURL *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("Movie Writing Queue", v18);
    movieWritingQueue = v11->_movieWritingQueue;
    v11->_movieWritingQueue = (OS_dispatch_queue *)v19;

    v11->_backgroundRecordingID = *MEMORY[0x24BDF7608];
  }

  return v11;
}

- (void)recordFrame:(opaqueCMSampleBuffer *)a3 fromConnection:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  opaqueCMSampleBuffer *v11;

  v6 = a4;
  CFRetain(a3);
  -[ICDocCamDebugMovieController movieWritingQueue](self, "movieWritingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ICDocCamDebugMovieController_recordFrame_fromConnection___block_invoke;
  block[3] = &unk_24C5B81E8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __59__ICDocCamDebugMovieController_recordFrame_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "assetWriter");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "canRecordFrames");

    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "inputsReadyToRecord");
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "videoConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "readyToRecordVideo") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordVideo:", objc_msgSend(*(id *)(a1 + 32), "setupAssetWriterVideoInput:", CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 48))));
          recordFrame_fromConnection__frameNumber = 0;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "inputsReadyToRecord"))
          objc_msgSend(*(id *)(a1 + 32), "writeSampleBuffer:ofType:atFrame:", *(_QWORD *)(a1 + 48), *MEMORY[0x24BDB1D50], recordFrame_fromConnection__frameNumber);
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "readyToRecordMetadata") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordMetadata:", objc_msgSend(*(id *)(a1 + 32), "setupAssetWriterMetadataInputAndMetadataAdaptor"));
      if (objc_msgSend(*(id *)(a1 + 32), "inputsReadyToRecord"))
      {
        CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x24BDC0CD8], 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0u;
        v11 = 0u;
        v9 = 0u;
        objc_msgSend(v8, "getBytes:length:", &v9, 48);
        objc_msgSend(*(id *)(a1 + 32), "writeMetaDataAtFrame:intrinsicMatrix:", recordFrame_fromConnection__frameNumber++, *(double *)&v9, *(double *)&v10, *(double *)&v11);

      }
      if (((v5 | objc_msgSend(*(id *)(a1 + 32), "inputsReadyToRecord") ^ 1) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setRecordingWillBeStarted:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setRecording:", 1);
        objc_msgSend(*(id *)(a1 + 32), "recordingDidStart");
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)recordingWillStart
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ICDocCamDebugMovieController_recordingWillStart__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__ICDocCamDebugMovieController_recordingWillStart__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableRecordButton:", 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Stop"), CFSTR("Stop"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeRecordButtonTitle:", v4);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isMultitaskingSupported");

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBackgroundRecordingID:", objc_msgSend(v7, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_17));

  }
}

- (void)recordingDidStart
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamDebugMovieController_recordingDidStart__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__ICDocCamDebugMovieController_recordingDidStart__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableRecordButton:", 1);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableUIElementsForMovieRecording:", 0);

}

- (void)recordingWillStop
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamDebugMovieController_recordingWillStop__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __49__ICDocCamDebugMovieController_recordingWillStop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableRecordButton:", 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Record"), CFSTR("Record"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeRecordButtonTitle:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "pauseCaptureSessionForMovieRecording");
}

- (void)recordingDidStop
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ICDocCamDebugMovieController_recordingDidStop__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__ICDocCamDebugMovieController_recordingDidStop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableRecordButton:", 1);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdleTimerDisabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "resumeCaptureSessionForMovieRecording");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMultitaskingSupported");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundRecordingID"));

    objc_msgSend(*(id *)(a1 + 32), "setBackgroundRecordingID:", *MEMORY[0x24BDF7608]);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableUIElementsForMovieRecording:", 1);

}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 ofType:(id)a4 atFrame:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  CVImageBufferRef ImageBuffer;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  CMTime v26;
  __int128 v27;
  uint64_t v28;

  v8 = a4;
  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "status");

  if (!v10)
  {
    -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "startWriting");

    if (v12)
    {
      -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x24BDC0D88];
      v28 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      objc_msgSend(v13, "startSessionAtSourceTime:", &v27);
    }
    else
    {
      -[ICDocCamDebugMovieController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "showErrorForMovieRecording:", v15);

    }
  }
  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "status");

  if (v17 == 1 && (id)*MEMORY[0x24BDB1D50] == v8)
  {
    -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isReadyForMoreMediaData");

    if (v19)
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      -[ICDocCamDebugMovieController pixelBufferAdaptor](self, "pixelBufferAdaptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v26, a5, 30);
      v22 = objc_msgSend(v21, "appendPixelBuffer:withPresentationTime:", ImageBuffer, &v26);

      if ((v22 & 1) == 0)
      {
        -[ICDocCamDebugMovieController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "showErrorForMovieRecording:", v25);

      }
    }
  }
}

- (uint64_t)writeMetaDataAtFrame:(double)a3 intrinsicMatrix:(float32x2_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  float v28;
  CMTime duration;
  CMTime start;
  CMTimeRange v32;
  CMTime v33;
  _QWORD v34[5];

  v28 = *((float *)&a3 + 1);
  v34[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", CFSTR("mdta/com.docCamMovie.version.field"));
  objc_msgSend(v8, "setDataType:", *MEMORY[0x24BDC0C10]);
  objc_msgSend(v8, "setValue:", &unk_24C5D82F8);
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", CFSTR("mdta/com.docCamMovie.comment.field"));
  objc_msgSend(v9, "setDataType:", *MEMORY[0x24BDC0C40]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), (double)a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v10);

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("mdta/com.docCamMovie.pixelFocalLength.field"));
  v12 = *MEMORY[0x24BDC0BF8];
  objc_msgSend(v11, "setDataType:", *MEMORY[0x24BDC0BF8]);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a2, v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:", v13);

  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIdentifier:", CFSTR("mdta/com.docCamMovie.principalPoint.field"));
  objc_msgSend(v14, "setDataType:", v12);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", vcvtq_f64_f32(a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:", v15);

  memset(&v33, 0, sizeof(v33));
  CMTimeMake(&v33, a6, 30);
  v16 = objc_alloc(MEMORY[0x24BDB26C0]);
  v34[0] = v8;
  v34[1] = v9;
  v34[2] = v11;
  v34[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  start = v33;
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  CMTimeRangeMake(&v32, &start, &duration);
  v18 = (void *)objc_msgSend(v16, "initWithItems:timeRange:", v17, &v32);

  objc_msgSend(a1, "assetWriterMetadataIn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isReadyForMoreMediaData");

  if (v20)
  {
    objc_msgSend(a1, "assetWriterMetadataAdaptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "appendTimedMetadataGroup:", v18);

    if ((v22 & 1) == 0)
    {
      objc_msgSend(a1, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "assetWriter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "showErrorForMovieRecording:", v25);

    }
  }

  return 1;
}

- (BOOL)setupAssetWriterVideoInput:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  _QWORD v32[13];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 96000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB2250];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v8, *MEMORY[0x24BDB2318], *MEMORY[0x24BDB2338], *MEMORY[0x24BDB2348], MEMORY[0x24BDBD1C0], *MEMORY[0x24BDB2248], *MEMORY[0x24BDB2300], *MEMORY[0x24BDB2308], &unk_24C5D8310, *MEMORY[0x24BDB22E0], &unk_24C5D8310, *MEMORY[0x24BDB2260], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BDB2268];
  v34[0] = *MEMORY[0x24BDB2298];
  v11 = *MEMORY[0x24BDB2368];
  v33[0] = v10;
  v33[1] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", Dimensions.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v12;
  v33[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(uint64_t *)&Dimensions >> 32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = *MEMORY[0x24BDB22C8];
  v34[2] = v13;
  v34[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDB1D50];
  LODWORD(v7) = objc_msgSend(v15, "canApplyOutputSettings:forMediaType:", v14, *MEMORY[0x24BDB1D50]);

  if (!(_DWORD)v7)
  {
    NSLog(CFSTR("Couldn't apply video output settings."));
LABEL_6:
    v30 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController setAssetWriterVideoIn:](self, "setAssetWriterVideoIn:", v17);

  -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setExpectsMediaDataInRealTime:", 1);

  -[ICDocCamDebugMovieController transformFromCurrentVideoOrientationToOrientation:](self, "transformFromCurrentVideoOrientationToOrientation:", -[ICDocCamDebugMovieController referenceOrientation](self, "referenceOrientation"));
  -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v32 = *(_OWORD *)&v32[7];
  *(_OWORD *)&v32[2] = *(_OWORD *)&v32[9];
  *(_OWORD *)&v32[4] = *(_OWORD *)&v32[11];
  objc_msgSend(v19, "setTransform:", v32);

  v20 = objc_alloc(MEMORY[0x24BDB2418]);
  -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 875704422);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x24BDC56B8], 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v20, "initWithAssetWriterInput:sourcePixelBufferAttributes:", v21, v24);
  -[ICDocCamDebugMovieController setPixelBufferAdaptor:](self, "setPixelBufferAdaptor:", v25);

  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v26, "canAddInput:", v27);

  if (!(_DWORD)v24)
  {
    NSLog(CFSTR("Couldn't add asset writer video input."));
    goto LABEL_6;
  }
  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController assetWriterVideoIn](self, "assetWriterVideoIn");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addInput:", v29);

  v30 = 1;
LABEL_7:

  return v30;
}

- (BOOL)setupAssetWriterMetadataInputAndMetadataAdaptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  BOOL v23;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  formatDescriptionOut = 0;
  v4 = *MEMORY[0x24BDC0C48];
  v32[0] = *MEMORY[0x24BDC0C58];
  v3 = v32[0];
  v32[1] = v4;
  v5 = *MEMORY[0x24BDC0C10];
  v33[0] = CFSTR("mdta/com.docCamMovie.version.field");
  v33[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  v30[0] = v3;
  v30[1] = v4;
  v7 = *MEMORY[0x24BDC0C40];
  v31[0] = CFSTR("mdta/com.docCamMovie.comment.field");
  v31[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v8;
  v28[0] = v3;
  v28[1] = v4;
  v9 = *MEMORY[0x24BDC0BF8];
  v29[0] = CFSTR("mdta/com.docCamMovie.pixelFocalLength.field");
  v29[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v10;
  v26[0] = v3;
  v26[1] = v4;
  v27[0] = CFSTR("mdta/com.docCamMovie.principalPoint.field");
  v27[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x6D656278u, v12, &formatDescriptionOut))
  {
    NSLog(CFSTR("Failed to create format description with metadata specification: %@"), v12);
LABEL_6:
    v23 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDB2408], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x24BDB1D10], 0, formatDescriptionOut);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController setAssetWriterMetadataIn:](self, "setAssetWriterMetadataIn:", v13);

  v14 = (void *)MEMORY[0x24BDB2410];
  -[ICDocCamDebugMovieController assetWriterMetadataIn](self, "assetWriterMetadataIn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetWriterInputMetadataAdaptorWithAssetWriterInput:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController setAssetWriterMetadataAdaptor:](self, "setAssetWriterMetadataAdaptor:", v16);

  -[ICDocCamDebugMovieController assetWriterMetadataIn](self, "assetWriterMetadataIn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setExpectsMediaDataInRealTime:", 1);

  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController assetWriterMetadataIn](self, "assetWriterMetadataIn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "canAddInput:", v19);

  if (!v20)
  {
    NSLog(CFSTR("Couldn't add asset writer metadata input."));
    goto LABEL_6;
  }
  -[ICDocCamDebugMovieController assetWriter](self, "assetWriter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDebugMovieController assetWriterMetadataIn](self, "assetWriterMetadataIn");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addInput:", v22);

  v23 = 1;
LABEL_7:

  return v23;
}

- (void)startRecording
{
  NSObject *v3;
  _QWORD block[5];

  -[ICDocCamDebugMovieController resumeCaptureSessionForMovieRecording](self, "resumeCaptureSessionForMovieRecording");
  -[ICDocCamDebugMovieController movieWritingQueue](self, "movieWritingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamDebugMovieController_startRecording__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__ICDocCamDebugMovieController_startRecording__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "recordingWillBeStarted") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isRecording") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecordingWillBeStarted:", 1);
    objc_msgSend(*(id *)(a1 + 32), "recordingWillStart");
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "movieURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFile:", v3);

    v4 = objc_alloc(MEMORY[0x24BDB2400]);
    objc_msgSend(*(id *)(a1 + 32), "movieURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDB1C40];
    v10 = 0;
    v7 = (void *)objc_msgSend(v4, "initWithURL:fileType:error:", v5, v6, &v10);
    v8 = v10;
    objc_msgSend(*(id *)(a1 + 32), "setAssetWriter:", v7);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "showErrorForMovieRecording:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCanRecordFrames:", 1);

  }
}

- (void)stopRecording
{
  NSObject *v3;
  _QWORD block[5];

  -[ICDocCamDebugMovieController movieWritingQueue](self, "movieWritingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ICDocCamDebugMovieController_stopRecording__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__ICDocCamDebugMovieController_stopRecording__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "setCanRecordFrames:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "recordingWillBeStopped") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isRecording"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRecordingWillBeStopped:", 1);
      objc_msgSend(*(id *)(a1 + 32), "recordingWillStop");
      objc_msgSend(*(id *)(a1 + 32), "assetWriter");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __45__ICDocCamDebugMovieController_stopRecording__block_invoke_2;
      v3[3] = &unk_24C5B7AE0;
      v3[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v2, "finishWritingWithCompletionHandler:", v3);

    }
  }
}

void __45__ICDocCamDebugMovieController_stopRecording__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assetWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  if (v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetWriter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showErrorForMovieRecording:", v5);

  }
  else if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordVideo:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setReadyToRecordMetadata:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setAssetWriter:", 0);
    objc_msgSend(*(id *)(a1 + 32), "saveMovieToCameraRoll");
  }
}

- (BOOL)inputsReadyToRecord
{
  _BOOL4 v3;

  v3 = -[ICDocCamDebugMovieController readyToRecordVideo](self, "readyToRecordVideo");
  if (v3)
    LOBYTE(v3) = -[ICDocCamDebugMovieController readyToRecordMetadata](self, "readyToRecordMetadata");
  return v3;
}

- (void)pauseCaptureSessionForMovieRecording
{
  id v2;

  -[ICDocCamDebugMovieController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseCaptureSessionForMovieRecording");

}

- (void)resumeCaptureSessionForMovieRecording
{
  id v2;

  -[ICDocCamDebugMovieController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeCaptureSessionForMovieRecording");

}

- (void)saveMovieToCameraRoll
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsCompatibleWithSavedPhotosAlbum;
  NSString *v8;
  id v9;

  -[ICDocCamDebugMovieController movieURL](self, "movieURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICDocCamDebugMovieController movieURL](self, "movieURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v6);

    if (IsCompatibleWithSavedPhotosAlbum)
    {
      -[ICDocCamDebugMovieController movieURL](self, "movieURL");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      UISaveVideoAtPathToSavedPhotosAlbum(v8, self, sel_video_didFinishSavingWithError_contextInfo_, 0);

    }
  }
}

- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  v6 = a4;
  if (v6)
  {
    -[ICDocCamDebugMovieController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showErrorForMovieRecording:", v6);
  }
  else
  {
    -[ICDocCamDebugMovieController movieURL](self, "movieURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDebugMovieController removeFile:](self, "removeFile:", v7);
  }

  -[ICDocCamDebugMovieController movieWritingQueue](self, "movieWritingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ICDocCamDebugMovieController_video_didFinishSavingWithError_contextInfo___block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(v8, block);

}

uint64_t __75__ICDocCamDebugMovieController_video_didFinishSavingWithError_contextInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRecordingWillBeStopped:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRecording:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "recordingDidStop");
}

- (void)removeFile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fileExistsAtPath:", v7))
  {
    v11 = 0;
    v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &v11);
    v9 = v11;
    if ((v8 & 1) == 0)
    {
      -[ICDocCamDebugMovieController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "showErrorForMovieRecording:", v9);

    }
  }

}

- (double)angleOffsetFromPortraitOrientationToOrientation:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2)
    return dbl_20CF1B450[a3 - 2];
  return result;
}

- (CGAffineTransform)transformFromCurrentVideoOrientationToOrientation:(SEL)a3
{
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  CGAffineTransform *result;
  CGFloat v19;
  __int128 v20;
  CGAffineTransform v21;

  v7 = MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  -[ICDocCamDebugMovieController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "videoPreviewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "videoOrientation");

  -[ICDocCamDebugMovieController angleOffsetFromPortraitOrientationToOrientation:](self, "angleOffsetFromPortraitOrientationToOrientation:", a4);
  v14 = v13;
  -[ICDocCamDebugMovieController angleOffsetFromPortraitOrientationToOrientation:](self, "angleOffsetFromPortraitOrientationToOrientation:", v12);
  CGAffineTransformMakeRotation(retstr, v14 - v15);
  -[ICDocCamDebugMovieController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "statusBarOrientation");

  switch(v17)
  {
    case 1:
      v19 = 1.57079633;
      goto LABEL_6;
    case 2:
      v19 = 4.71238898;
      goto LABEL_6;
    case 3:
      v19 = 0.0;
      goto LABEL_6;
    case 4:
      v19 = 3.14159265;
LABEL_6:
      result = CGAffineTransformMakeRotation(&v21, v19);
      v20 = *(_OWORD *)&v21.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v21.a;
      *(_OWORD *)&retstr->c = v20;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v21.tx;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (int64_t)referenceOrientation
{
  return self->_referenceOrientation;
}

- (void)setReferenceOrientation:(int64_t)a3
{
  self->_referenceOrientation = a3;
}

- (AVCaptureConnection)videoConnection
{
  return (AVCaptureConnection *)objc_loadWeakRetained((id *)&self->_videoConnection);
}

- (void)setVideoConnection:(id)a3
{
  objc_storeWeak((id *)&self->_videoConnection, a3);
}

- (ICDocCamDebugMovieControllerDelegate)delegate
{
  return (ICDocCamDebugMovieControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
  objc_storeStrong((id *)&self->_movieURL, a3);
}

- (AVAssetWriter)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriter, a3);
}

- (AVAssetWriterInput)assetWriterVideoIn
{
  return self->_assetWriterVideoIn;
}

- (void)setAssetWriterVideoIn:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriterVideoIn, a3);
}

- (AVAssetWriterInput)assetWriterMetadataIn
{
  return self->_assetWriterMetadataIn;
}

- (void)setAssetWriterMetadataIn:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriterMetadataIn, a3);
}

- (AVAssetWriterInputMetadataAdaptor)assetWriterMetadataAdaptor
{
  return self->_assetWriterMetadataAdaptor;
}

- (void)setAssetWriterMetadataAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_assetWriterMetadataAdaptor, a3);
}

- (AVAssetWriterInputPixelBufferAdaptor)pixelBufferAdaptor
{
  return self->_pixelBufferAdaptor;
}

- (void)setPixelBufferAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferAdaptor, a3);
}

- (OS_dispatch_queue)movieWritingQueue
{
  return self->_movieWritingQueue;
}

- (void)setMovieWritingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_movieWritingQueue, a3);
}

- (BOOL)readyToRecordVideo
{
  return self->_readyToRecordVideo;
}

- (void)setReadyToRecordVideo:(BOOL)a3
{
  self->_readyToRecordVideo = a3;
}

- (BOOL)readyToRecordMetadata
{
  return self->_readyToRecordMetadata;
}

- (void)setReadyToRecordMetadata:(BOOL)a3
{
  self->_readyToRecordMetadata = a3;
}

- (BOOL)recordingWillBeStarted
{
  return self->_recordingWillBeStarted;
}

- (void)setRecordingWillBeStarted:(BOOL)a3
{
  self->_recordingWillBeStarted = a3;
}

- (BOOL)recordingWillBeStopped
{
  return self->_recordingWillBeStopped;
}

- (void)setRecordingWillBeStopped:(BOOL)a3
{
  self->_recordingWillBeStopped = a3;
}

- (BOOL)canRecordFrames
{
  return self->_canRecordFrames;
}

- (void)setCanRecordFrames:(BOOL)a3
{
  self->_canRecordFrames = a3;
}

- (int64_t)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int64_t)a3
{
  self->_videoOrientation = a3;
}

- (unint64_t)backgroundRecordingID
{
  return self->_backgroundRecordingID;
}

- (void)setBackgroundRecordingID:(unint64_t)a3
{
  self->_backgroundRecordingID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieWritingQueue, 0);
  objc_storeStrong((id *)&self->_pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->_assetWriterMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_assetWriterMetadataIn, 0);
  objc_storeStrong((id *)&self->_assetWriterVideoIn, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_videoConnection);
}

@end
