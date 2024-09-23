@implementation OSDCameraCenter

+ (id)sharedCenter
{
  if (qword_1000163B0 != -1)
    dispatch_once(&qword_1000163B0, &stru_1000105B0);
  return (id)qword_1000163A8;
}

+ (id)ispVersion
{
  return +[OSDCaptureDevice ispVersion](OSDCaptureDevice, "ispVersion");
}

+ (BOOL)syncCameras:(id)a3 slave:(id)a4 skipSlaveFrames:(BOOL)a5 enableSlaveOutput:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned __int8 v19;

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v12 = a4;
  if (objc_msgSend(v11, "implementorActive:", a7)
    && objc_msgSend(v12, "implementorActive:", a7)
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cameraImp")),
        v14 = +[OSDCamera checkProtocol:obj:error:](OSDCamera, "checkProtocol:obj:error:", &OBJC_PROTOCOL____OSDCameraSyncInterface, v13, a7), v13, v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cameraImp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cameraImp"));
    v17 = +[OSDCamera checkProtocol:obj:error:](OSDCamera, "checkProtocol:obj:error:", &OBJC_PROTOCOL____OSDCameraSyncInterface, v16, a7);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cameraImp"));
      v19 = objc_msgSend(v15, "syncSlave:skipFrames:enableOutput:error:", v18, v9, v8, a7);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)cameraForSource:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  switch(a3)
  {
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter _backCamera:](self, "_backCamera:", a4));
      return v6;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
      v8 = objc_claimAutoreleasedReturnValue(-[OSDCameraCenter _frontCameraWithDevice:error:](self, "_frontCameraWithDevice:error:", v7, a4));
      goto LABEL_8;
    case 3uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
      v8 = objc_claimAutoreleasedReturnValue(-[OSDCameraCenter _telephotoCameraWithDevice:error:](self, "_telephotoCameraWithDevice:error:", v7, a4));
      goto LABEL_8;
    case 4uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
      v8 = objc_claimAutoreleasedReturnValue(-[OSDCameraCenter _rearSuperWideCameraWithDevice:error:](self, "_rearSuperWideCameraWithDevice:error:", v7, a4));
      goto LABEL_8;
    case 5uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
      v8 = objc_claimAutoreleasedReturnValue(-[OSDCameraCenter _frontSuperWideCameraWithDevice:error:](self, "_frontSuperWideCameraWithDevice:error:", v7, a4));
LABEL_8:
      v6 = (void *)v8;

      break;
    default:
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> No known camera for source %lu"), self, a3);
      v6 = 0;
      break;
  }
  return v6;
}

- (id)_backCamera:(id *)a3
{
  void *v5;
  OSDCamera *v6;
  void *v7;
  OSDCamera *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter backCamera](self, "backCamera"));

  if (!v5)
  {
    v6 = [OSDCamera alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
    v8 = -[OSDCamera initWithCaptureDevice:cameraSource:error:](v6, "initWithCaptureDevice:cameraSource:error:", v7, 1, a3);
    -[OSDCameraCenter setBackCamera:](self, "setBackCamera:", v8);

  }
  return -[OSDCameraCenter backCamera](self, "backCamera");
}

- (id)_frontCameraWithDevice:(id)a3 error:(id *)a4
{
  void *v6;
  OSDCamera *v7;
  void *v8;
  OSDCamera *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter frontCamera](self, "frontCamera", a3));

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
    v9 = -[OSDCamera initWithCaptureDevice:cameraSource:error:](v7, "initWithCaptureDevice:cameraSource:error:", v8, 2, a4);
    -[OSDCameraCenter setFrontCamera:](self, "setFrontCamera:", v9);

  }
  return -[OSDCameraCenter frontCamera](self, "frontCamera");
}

- (id)_telephotoCameraWithDevice:(id)a3 error:(id *)a4
{
  void *v6;
  OSDCamera *v7;
  void *v8;
  OSDCamera *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter telephotoCamera](self, "telephotoCamera", a3));

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
    v9 = -[OSDCamera initWithCaptureDevice:cameraSource:error:](v7, "initWithCaptureDevice:cameraSource:error:", v8, 3, a4);
    -[OSDCameraCenter setTelephotoCamera:](self, "setTelephotoCamera:", v9);

  }
  return -[OSDCameraCenter telephotoCamera](self, "telephotoCamera");
}

- (id)_rearSuperWideCameraWithDevice:(id)a3 error:(id *)a4
{
  void *v6;
  OSDCamera *v7;
  void *v8;
  OSDCamera *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter telephotoCamera](self, "telephotoCamera", a3));

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
    v9 = -[OSDCamera initWithCaptureDevice:cameraSource:error:](v7, "initWithCaptureDevice:cameraSource:error:", v8, 4, a4);
    -[OSDCameraCenter setTelephotoCamera:](self, "setTelephotoCamera:", v9);

  }
  return -[OSDCameraCenter telephotoCamera](self, "telephotoCamera");
}

- (id)_frontSuperWideCameraWithDevice:(id)a3 error:(id *)a4
{
  void *v6;
  OSDCamera *v7;
  void *v8;
  OSDCamera *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter telephotoCamera](self, "telephotoCamera", a3));

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCameraCenter device](self, "device"));
    v9 = -[OSDCamera initWithCaptureDevice:cameraSource:error:](v7, "initWithCaptureDevice:cameraSource:error:", v8, 5, a4);
    -[OSDCameraCenter setTelephotoCamera:](self, "setTelephotoCamera:", v9);

  }
  return -[OSDCameraCenter telephotoCamera](self, "telephotoCamera");
}

- (OSDCaptureDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (OSDCamera)backCamera
{
  return self->_backCamera;
}

- (void)setBackCamera:(id)a3
{
  objc_storeStrong((id *)&self->_backCamera, a3);
}

- (OSDCamera)frontCamera
{
  return self->_frontCamera;
}

- (void)setFrontCamera:(id)a3
{
  objc_storeStrong((id *)&self->_frontCamera, a3);
}

- (OSDCamera)telephotoCamera
{
  return self->_telephotoCamera;
}

- (void)setTelephotoCamera:(id)a3
{
  objc_storeStrong((id *)&self->_telephotoCamera, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephotoCamera, 0);
  objc_storeStrong((id *)&self->_frontCamera, 0);
  objc_storeStrong((id *)&self->_backCamera, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
