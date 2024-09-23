@implementation RecordingManager

+ (id)movSummaryItem:(float)a3 appName:(id)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v16[0] = CFSTR("frameRate");
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v16[1] = CFSTR("depthFrameRate");
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v16[2] = CFSTR("machTimeSince1970");
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v10, "numberWithDouble:", v12 - CACurrentMediaTime());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v17[3] = MEMORY[0x24BDBD1C8];
  v16[3] = CFSTR("hasVisageMetadataFaceObject");
  v16[4] = CFSTR("RecorderApp");
  v17[4] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (RecordingManager)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 colorStreamId:(id)a5 depthStreamId:(id)a6 appName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RecordingManager *v16;
  uint64_t v17;
  NSString *colorStreamID;
  uint64_t v19;
  NSString *depthStreamID;
  id v21;
  float v22;
  double v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  MOVWriterInterface *writerInterface;
  MOVWriterInterface *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  RecordingManager *v48;
  objc_super v50;
  _QWORD v51[3];
  _QWORD v52[3];
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v50.receiver = self;
  v50.super_class = (Class)RecordingManager;
  v16 = -[RecordingManager init](&v50, sel_init);
  if (!v16)
    goto LABEL_4;
  v17 = objc_msgSend(v13, "copy");
  colorStreamID = v16->_colorStreamID;
  v16->_colorStreamID = (NSString *)v17;

  v19 = objc_msgSend(v14, "copy");
  depthStreamID = v16->_depthStreamID;
  v16->_depthStreamID = (NSString *)v19;

  v21 = objc_alloc(MEMORY[0x24BE05940]);
  v22 = a4;
  *(float *)&v23 = v22;
  +[RecordingManager movSummaryItem:appName:](RecordingManager, "movSummaryItem:appName:", v15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC9B8];
  v26 = MEMORY[0x24BDAC9B8];
  v27 = objc_msgSend(v21, "initWithFileURL:expectedFrameRate:fileSummary:callbackQueue:", v12, v24, v25, a4);
  writerInterface = v16->_writerInterface;
  v16->_writerInterface = (MOVWriterInterface *)v27;

  v29 = v16->_writerInterface;
  if (v29)
  {
    -[MOVWriterInterface setInterface_delegate:](v29, "setInterface_delegate:", v16);
    -[MOVWriterInterface registerCVACameraCalibrationData](v16->_writerInterface, "registerCVACameraCalibrationData");
    v53 = *MEMORY[0x24BE63518];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *MEMORY[0x24BE634D0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc(MEMORY[0x24BE05948]);
    LODWORD(v33) = 1273291200;
    *(float *)&v34 = a4;
    v35 = (void *)objc_msgSend(v32, "initWithLossless:bitrate:forceH264:expectedFPS:extraConfigs:", 0, 0, v31, v33, v34);
    -[MOVWriterInterface registerStreamID:withConfigObject:](v16->_writerInterface, "registerStreamID:withConfigObject:", v16->_colorStreamID, v35);

    v36 = *MEMORY[0x24BE63500];
    v51[0] = *MEMORY[0x24BE63508];
    v51[1] = v36;
    v52[0] = &unk_24E71C658;
    v52[1] = &unk_24E71C670;
    v51[2] = *MEMORY[0x24BE634F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_alloc(MEMORY[0x24BE05948]);
    LODWORD(v40) = 0;
    *(float *)&v41 = a4;
    v42 = (void *)objc_msgSend(v39, "initWithLossless:bitrate:forceH264:expectedFPS:extraConfigs:", 1, 0, v38, v40, v41);
    -[MOVWriterInterface registerStreamID:withConfigObject:](v16->_writerInterface, "registerStreamID:withConfigObject:", v16->_depthStreamID, v42);

    v43 = (void *)MGCopyAnswer();
    -[MOVWriterInterface setSerialNumber:](v16->_writerInterface, "setSerialNumber:", v43);

    objc_msgSend(MEMORY[0x24BE05940], "makeDeviceString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface setDeviceString:](v16->_writerInterface, "setDeviceString:", v44);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface setDeviceName:](v16->_writerInterface, "setDeviceName:", v46);

    v47 = (void *)MGCopyAnswer();
    -[MOVWriterInterface setOsBuildVersion:](v16->_writerInterface, "setOsBuildVersion:", v47);

    v48 = v16;
  }
  else
  {
LABEL_4:
    v48 = 0;
  }

  return v48;
}

+ (void)copyBuffer:(__CVBuffer *)a3 dst:(__CVBuffer *)a4
{
  size_t PlaneCount;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t i;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  char *v13;
  size_t v14;
  size_t v15;
  size_t v16;
  int64_t HeightOfPlane;
  int64_t v18;
  const __CFDictionary *v19;

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1)
    v7 = 1;
  else
    v7 = PlaneCount;
  v8 = CVPixelBufferGetPlaneCount(a4);
  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  if (v7 != v9)
    +[RecordingManager copyBuffer:dst:].cold.1();
  for (i = 0; i != v7; ++i)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
    v13 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, i);
    v14 = CVPixelBufferGetBytesPerRowOfPlane(a4, i);
    v15 = v14;
    if (v14 >= BytesPerRowOfPlane)
      v16 = BytesPerRowOfPlane;
    else
      v16 = v14;
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, i);
    if (HeightOfPlane >= 1)
    {
      v18 = HeightOfPlane;
      do
      {
        memcpy(v13, BaseAddressOfPlane, v16);
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v13 += v15;
        --v18;
      }
      while (v18);
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  v19 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachments(a4, v19, kCVAttachmentMode_ShouldPropagate);
}

- (uint64_t)process:(__n128)a3 depthFrame:(__n128)a4 faceObject:(__n128)a5 timestamp:(double)a6 intrinsics:(uint64_t)a7 calibration:(uint64_t)a8 exposureTime:(__CVBuffer *)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  const __CFDictionary *v36;
  size_t Width;
  size_t Height;
  unsigned int v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v51;
  CMTime v52;
  CVPixelBufferRef pixelBufferOut;
  CMTime v54;
  CMTime v55;
  CMTime time;
  CMTime v57;
  _OWORD v58[3];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[12];
  _QWORD v62[14];

  v62[12] = *MEMORY[0x24BDAC8D0];
  v58[0] = a3;
  v58[1] = a4;
  v58[2] = a5;
  v15 = a10;
  v47 = a11;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE05938]), "initWithAVCameraCalibrationData:timestamp:streamID:", v47, *(_QWORD *)(a1 + 16), a2);
  objc_msgSend(*(id *)(a1 + 8), "processCVACameraCalibrationData:");
  memset(&v57, 0, sizeof(v57));
  CMTimeMakeWithSeconds(&v57, a2, 10000000);
  v51 = (void *)objc_opt_new();
  if (v15)
  {
    v61[0] = CFSTR("faceID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "faceID"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v46;
    v61[1] = CFSTR("hasRollAngle");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "hasRollAngle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v45;
    v61[2] = CFSTR("rollAngle");
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "rollAngle");
    objc_msgSend(v16, "numberWithDouble:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v44;
    v61[3] = CFSTR("hasYawAngle");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "hasYawAngle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v43;
    v61[4] = CFSTR("yawAngle");
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "yawAngle");
    objc_msgSend(v17, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v42;
    v61[5] = CFSTR("time");
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "time");
    objc_msgSend(v18, "numberWithDouble:", CMTimeGetSeconds(&time));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v19;
    v61[6] = CFSTR("duration");
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "duration");
    objc_msgSend(v20, "numberWithDouble:", CMTimeGetSeconds(&v55));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v21;
    v61[7] = CFSTR("rectX");
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "bounds");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v23;
    v61[8] = CFSTR("rectY");
    v24 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "bounds");
    objc_msgSend(v24, "numberWithDouble:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62[8] = v26;
    v61[9] = CFSTR("rectWidth");
    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "bounds");
    objc_msgSend(v27, "numberWithDouble:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v62[9] = v29;
    v61[10] = CFSTR("rectHeight");
    v30 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v15, "bounds");
    objc_msgSend(v30, "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v62[10] = v32;
    v61[11] = CFSTR("timestamp");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v62[11] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "setObject:forKeyedSubscript:", v34, CFSTR("VisageMetadataFaceObject"));
  }
  objc_msgSend(*(id *)(a1 + 8), "addFrameMetadata:streamID:", v51, *(_QWORD *)(a1 + 16));
  v54 = v57;
  v35 = objc_msgSend(*(id *)(a1 + 8), "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", a8, &v54, v58, *(_QWORD *)(a1 + 16), a6);
  pixelBufferOut = 0;
  v59 = *MEMORY[0x24BDC5668];
  v60 = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth(a9);
  Height = CVPixelBufferGetHeight(a9);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x4C303066u, v36, &pixelBufferOut))
  {
    NSLog(CFSTR("HRTFApp:RecordingManager - error creating buffer"));
    v39 = 0;
  }
  else
  {
    +[RecordingManager copyBuffer:dst:](RecordingManager, "copyBuffer:dst:", a9, pixelBufferOut);
    v40 = *(void **)(a1 + 8);
    v52 = v57;
    v39 = objc_msgSend(v40, "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", pixelBufferOut, &v52, 0, *(_QWORD *)(a1 + 24), -1.0);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v35 & v39;
}

- (void)stopRecording
{
  MOVWriterInterface *writerInterface;
  id v3;
  void *v4;
  void *v5;
  id v6;

  writerInterface = self->_writerInterface;
  v6 = 0;
  -[MOVWriterInterface finishWriting:](writerInterface, "finishWriting:", &v6);
  v3 = v6;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("HRTFApp:RecordingManager - ERROR - Not able to finish writing MOV file: %@"), v5);

  }
}

- (void)isReadyToRecord
{
  RecordingManagerDelegate **p_delegate;
  char v3;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "isReadyToRecord");

  }
}

- (void)didFinishRecording
{
  RecordingManagerDelegate **p_delegate;
  char v3;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "didFinishRecording");

  }
}

- (RecordingManagerDelegate)delegate
{
  return (RecordingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_depthStreamID, 0);
  objc_storeStrong((id *)&self->_colorStreamID, 0);
  objc_storeStrong((id *)&self->_writerInterface, 0);
}

+ (void)copyBuffer:dst:.cold.1()
{
  __assert_rtn("+[RecordingManager copyBuffer:dst:]", "RecordingManager.mm", 131, "planes == std::max(static_cast<size_t>(1), CVPixelBufferGetPlaneCount(dst))");
}

@end
