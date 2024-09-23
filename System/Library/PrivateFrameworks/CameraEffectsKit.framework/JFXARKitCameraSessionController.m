@implementation JFXARKitCameraSessionController

- (JFXARKitCameraSessionController)initWithAVCaptureSession:(id)a3 captureDevice:(id)a4 arSessionDelegateQueue:(id)a5
{
  id v8;
  id v9;
  JFXARKitCameraSessionController *v10;
  JFXARKitCameraSessionController *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)JFXARKitCameraSessionController;
  v10 = -[JFXARKitCameraSessionController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[JFXARKitCameraSessionController setUnderlyingAVCaptureSession:](v10, "setUnderlyingAVCaptureSession:", v8);
    -[JFXARKitCameraSessionController setUnderlyingAVCaptureDevice:](v11, "setUnderlyingAVCaptureDevice:", v9);
    v11->_running = 0;
    v11->_arSessionDelegateQueue = (OS_dispatch_queue *)a5;
  }

  return v11;
}

- (void)dealloc
{
  ARSession *arSession;
  objc_super v4;

  -[ARSession pause](self->_arSession, "pause");
  -[ARSession setDelegate:](self->_arSession, "setDelegate:", 0);
  -[ARSession setDelegateQueue:](self->_arSession, "setDelegateQueue:", 0);
  arSession = self->_arSession;
  self->_arSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXARKitCameraSessionController;
  -[JFXARKitCameraSessionController dealloc](&v4, sel_dealloc);
}

- (void)startARSession
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!-[JFXARKitCameraSessionController running](self, "running"))
  {
    v5 = 0;
    if (!-[JFXARKitCameraSessionController JT_setupARSession:](self, "JT_setupARSession:", &v5) || v5)
    {
      -[JFXARKitCameraSessionController stopARSession](self, "stopARSession");
    }
    else
    {
      -[JFXARKitCameraSessionController arSession](self, "arSession");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "runWithConfiguration:options:", v4, 1);

      -[JFXARKitCameraSessionController setRunning:](self, "setRunning:", 1);
    }
  }
}

- (void)stopARSession
{
  void *v3;

  -[JFXARKitCameraSessionController arSession](self, "arSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[JFXARKitCameraSessionController setRunning:](self, "setRunning:", 0);
}

- (void)provideSensorFrameSet:(id)a3 trackedFacesMetadata:(id)a4 faceObjectsMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[JFXARKitCameraSessionController customImageSensor](self, "customImageSensor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXARKitCameraSessionController underlyingAVCaptureDevice](self, "underlyingAVCaptureDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXARKitCameraSessionController underlyingAVCaptureSession](self, "underlyingAVCaptureSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createImageDataFromFrameSet:captureDevice:captureSession:trackedFacesMetadata:faceObjectsMetadata:", v10, v11, v12, v9, v8);

}

- (void)processExternalSensorData:(id)a3
{
  id v4;
  Float64 v5;
  void *v6;
  CMTime v7;
  CMTime time;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  CMTimeMakeWithSeconds(&v7, v5, 1000000000);
  time = v7;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  -[JFXARKitCameraSessionController customImageSensor](self, "customImageSensor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputSensorData:", v4);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[JFXARKitCameraSessionController frameDelegate](self, "frameDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didUpdateFrame:", v5);

}

- (BOOL)JT_setupARSession:(id *)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  JFXCustomImageSensor *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDB14C0], "isSupported");
  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    -[JFXARKitCameraSessionController setArSession:](self, "setArSession:", v6);

    -[JFXARKitCameraSessionController arSession](self, "arSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[JFXARKitCameraSessionController arSessionDelegateQueue](self, "arSessionDelegateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXARKitCameraSessionController arSession](self, "arSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegateQueue:", v8);

    v10 = (void *)objc_opt_new();
    -[JFXARKitCameraSessionController setMotionManager:](self, "setMotionManager:", v10);

    v11 = objc_alloc_init(JFXCustomImageSensor);
    -[JFXARKitCameraSessionController setCustomImageSensor:](self, "setCustomImageSensor:", v11);

    v12 = objc_alloc(MEMORY[0x24BDB14F8]);
    -[JFXARKitCameraSessionController motionManager](self, "motionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithMotionManager:", v13);
    -[JFXARKitCameraSessionController setMotionSensor:](self, "setMotionSensor:", v14);

    v15 = objc_alloc(MEMORY[0x24BDB1498]);
    -[JFXARKitCameraSessionController motionManager](self, "motionManager");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithMotionManager:alignment:", v16, 2);
    -[JFXARKitCameraSessionController setOrientationSensor:](self, "setOrientationSensor:", v17);

    v18 = objc_alloc_init(MEMORY[0x24BDB14C0]);
    -[JFXARKitCameraSessionController setFaceTrackingConfiguration:](self, "setFaceTrackingConfiguration:", v18);

    -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDisableRenderSyncScheduling:", 1);

    }
    -[JFXARKitCameraSessionController motionSensor](self, "motionSensor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXARKitCameraSessionController orientationSensor](self, "orientationSensor", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    -[JFXARKitCameraSessionController customImageSensor](self, "customImageSensor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCustomSensors:", v24);

    -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLightEstimationEnabled:", 0);

    -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWorldAlignment:", 2);

    if (objc_msgSend(MEMORY[0x24BDB14C0], "supportsFrameSemantics:", 1))
    {
      -[JFXARKitCameraSessionController faceTrackingConfiguration](self, "faceTrackingConfiguration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrameSemantics:", objc_msgSend(v28, "frameSemantics") | 1);

    }
  }
  else if (*a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1420], 100, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (JFXARKitFrameDelegate)frameDelegate
{
  return (JFXARKitFrameDelegate *)objc_loadWeakRetained((id *)&self->_frameDelegate);
}

- (void)setFrameDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_frameDelegate, a3);
}

- (ARSession)arSession
{
  return self->_arSession;
}

- (void)setArSession:(id)a3
{
  objc_storeStrong((id *)&self->_arSession, a3);
}

- (ARFaceTrackingConfiguration)faceTrackingConfiguration
{
  return self->_faceTrackingConfiguration;
}

- (void)setFaceTrackingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingConfiguration, a3);
}

- (JFXCustomImageSensor)customImageSensor
{
  return self->_customImageSensor;
}

- (void)setCustomImageSensor:(id)a3
{
  objc_storeStrong((id *)&self->_customImageSensor, a3);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (ARMotionSensor)motionSensor
{
  return self->_motionSensor;
}

- (void)setMotionSensor:(id)a3
{
  objc_storeStrong((id *)&self->_motionSensor, a3);
}

- (ARDeviceOrientationSensor)orientationSensor
{
  return self->_orientationSensor;
}

- (void)setOrientationSensor:(id)a3
{
  objc_storeStrong((id *)&self->_orientationSensor, a3);
}

- (AVCaptureSession)underlyingAVCaptureSession
{
  return self->_underlyingAVCaptureSession;
}

- (void)setUnderlyingAVCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingAVCaptureSession, a3);
}

- (AVCaptureDevice)underlyingAVCaptureDevice
{
  return self->_underlyingAVCaptureDevice;
}

- (void)setUnderlyingAVCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingAVCaptureDevice, a3);
}

- (OS_dispatch_queue)arSessionDelegateQueue
{
  return self->_arSessionDelegateQueue;
}

- (void)setArSessionDelegateQueue:(id)a3
{
  self->_arSessionDelegateQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAVCaptureDevice, 0);
  objc_storeStrong((id *)&self->_underlyingAVCaptureSession, 0);
  objc_storeStrong((id *)&self->_orientationSensor, 0);
  objc_storeStrong((id *)&self->_motionSensor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_customImageSensor, 0);
  objc_storeStrong((id *)&self->_faceTrackingConfiguration, 0);
  objc_storeStrong((id *)&self->_arSession, 0);
  objc_destroyWeak((id *)&self->_frameDelegate);
}

@end
