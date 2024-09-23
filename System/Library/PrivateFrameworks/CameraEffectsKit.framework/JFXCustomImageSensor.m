@implementation JFXCustomImageSensor

- (unint64_t)providedDataTypes
{
  return 49;
}

- (void)start
{
  void *v3;
  char v4;
  id v5;

  -[JFXCustomImageSensor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[JFXCustomImageSensor delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensorDidStart:", self);

  }
}

- (void)stop
{
  void *v3;
  char v4;
  id v5;

  -[JFXCustomImageSensor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[JFXCustomImageSensor delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensorDidPause:", self);

  }
}

- (void)createImageDataFromFrameSet:(id)a3 captureDevice:(id)a4 captureSession:(id)a5 trackedFacesMetadata:(id)a6 faceObjectsMetadata:(id)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  CFTypeRef v22;
  CVImageBufferRef ImageBuffer;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  CMTime time;
  CMAttachmentMode attachmentModeOut;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  if (v14)
  {
    objc_msgSend(v14, "activeVideoMinFrameDuration");
    v7 = (int)((int)v32 / v31);
  }
  objc_msgSend(v13, "colorSampleBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "sampleBufferRef");

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB14E8]), "initWithSampleBuffer:captureFramePerSecond:captureDevice:captureSession:", v19, v7, v14, v15);
  attachmentModeOut = 1;
  v21 = (const __CFString *)*MEMORY[0x24BDD9470];
  v22 = CMGetAttachment(v19, (CFStringRef)*MEMORY[0x24BDD9470], &attachmentModeOut);
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v19);
  CMSetAttachment(ImageBuffer, v21, v22, 1u);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB14B0]), "initWithMetadataObjects:mirroredVideoInput:stripDetectionData:", v16, 0, 0);
  objc_msgSend(v20, "setFaceData:", v24);

  objc_msgSend(v13, "depthData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v20, "setDepthData:", v25);
    if (v13)
      objc_msgSend(v13, "presentationTimeStamp");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(v20, "setDepthDataTimestamp:", CMTimeGetSeconds(&time));
  }
  objc_msgSend(v20, "setMirrored:", 1);
  objc_msgSend(v20, "setCameraPosition:", 2);
  if (v20)
  {
    -[JFXCustomImageSensor delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0)
    {
      -[JFXCustomImageSensor delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sensor:didOutputSensorData:", self, v20);

    }
  }

}

- (void)outputSensorData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[JFXCustomImageSensor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[JFXCustomImageSensor delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sensor:didOutputSensorData:", self, v7);

  }
}

- (ARSensorDelegate)delegate
{
  return (ARSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
