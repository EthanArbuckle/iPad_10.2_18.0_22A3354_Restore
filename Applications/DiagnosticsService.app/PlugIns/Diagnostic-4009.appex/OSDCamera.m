@implementation OSDCamera

+ (BOOL)checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unsigned __int8 v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(v7), "conformsToProtocol:", v8);

  if ((v9 & 1) == 0)
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a5, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> %@ does not provide this implementation."), objc_opt_class(OSDCamera), v7);

  return v9;
}

- (OSDCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  id v8;
  OSDCamera *v9;
  void *v10;
  int v11;
  _OSDH9Camera *v12;
  _OSDCameraInterface *cameraImp;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OSDCamera;
  v9 = -[OSDCamera init](&v15, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OSDCaptureDevice ispVersion](OSDCaptureDevice, "ispVersion"));
    v11 = objc_msgSend(v10, "intValue");

    if (v11 >= 7)
    {
      v12 = -[_OSDH9Camera initWithCaptureDevice:cameraSource:error:]([_OSDH9Camera alloc], "initWithCaptureDevice:cameraSource:error:", v8, a4, a5);
      cameraImp = v9->_cameraImp;
      v9->_cameraImp = (_OSDCameraInterface *)v12;

    }
  }

  return v9;
}

- (BOOL)activate:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  LOBYTE(a3) = objc_msgSend(v4, "getDeviceAndStreams:", a3);

  return (char)a3;
}

- (void)setPreviewLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  objc_msgSend(v5, "setPreviewLayer:", v4);

}

- (void)setFrameHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  objc_msgSend(v5, "setFrameHandler:", v4);

}

- (void)deactivate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  objc_msgSend(v2, "doneWithDeviceAndStreams");

}

- (id)name:(id *)a3
{
  void *v5;
  void *v6;

  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name:", a3));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4
{
  _BOOL4 v7;
  void *v8;
  unsigned __int8 v9;

  v7 = -[OSDCamera implementorActive:](self, "implementorActive:", a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v9 = objc_msgSend(v8, "startStreamingWithOptions:error:", a3, a4);

    LOBYTE(v7) = v9;
  }
  return v7;
}

- (BOOL)stopStreaming:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  unsigned __int8 v7;

  v5 = -[OSDCamera implementorActive:](self, "implementorActive:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v7 = objc_msgSend(v6, "stopStreaming:", a3);

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (BOOL)isStreaming
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  v3 = objc_msgSend(v2, "isStreaming");

  return v3;
}

- (unint64_t)streamingOptions:(id *)a3
{
  void *v4;
  id v5;

  if (!-[OSDCamera implementorActive:](self, "implementorActive:", a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  v5 = objc_msgSend(v4, "streamingOptions");

  return (unint64_t)v5;
}

- (id)frameCount:(id *)a3
{
  void *v4;
  void *v5;

  if (-[OSDCamera implementorActive:](self, "implementorActive:", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frameCount"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)errorCountForType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  if (-[OSDCamera implementorActive:](self, "implementorActive:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "errorCountForType:error:", a3, a4));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)setFrameRate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a3;
  if (-[OSDCamera implementorActive:](self, "implementorActive:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v8 = objc_msgSend(v7, "setFrameRate:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a3;
  if (-[OSDCamera implementorActive:](self, "implementorActive:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v8 = objc_msgSend(v7, "setMinimumFrameRate:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setFormatIndex:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a3;
  if (-[OSDCamera implementorActive:](self, "implementorActive:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v8 = objc_msgSend(v7, "setFormatIndex:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formatIndex:(id *)a3
{
  void *v4;
  void *v5;

  if (-[OSDCamera implementorActive:](self, "implementorActive:", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatIndex"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)supportedFormats:(id *)a3
{
  void *v5;
  void *v6;

  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supportedFormats:", a3));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  if (!-[OSDCamera implementorActive:](self, "implementorActive:", a4)
    || !-[OSDCamera _checkProtocol:error:](self, "_checkProtocol:error:", &OBJC_PROTOCOL____OSDCameraTestInterface, a4))
  {
    return 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  v8 = objc_msgSend(v7, "enableTestPatternPN9:error:", v5, a4);

  return v8;
}

- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  v7 = -[OSDCamera implementorActive:](self, "implementorActive:", a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v9 = objc_msgSend(v8, "enableAgileClocking:error:", v5, a4);

    LOBYTE(v7) = v9;
  }
  return v7;
}

- (id)useMaxAvailableDataRate:(id *)a3
{
  void *v5;
  void *v6;

  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "useMaxAvailableDataRate:", a3));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)implementorActive:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  v7 = objc_msgSend(v6, "isActive");

  if ((v7 & 1) == 0)
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> Camera is not active!"), self);
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)_checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5
{
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(a4), "conformsToProtocol:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = objc_opt_class(OSDCamera);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a5, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> %@ does not provide this implementation."), v10, v11);

  }
  return v9;
}

- (BOOL)_checkProtocol:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  LOBYTE(a4) = -[OSDCamera _checkProtocol:obj:error:](self, "_checkProtocol:obj:error:", v6, v7, a4);

  return (char)a4;
}

- (BOOL)_checkSelector:(SEL)a3 error:(id *)a4
{
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
  v8 = objc_opt_respondsToSelector(v7, a3);

  if ((v8 & 1) == 0)
  {
    v9 = objc_opt_class(OSDCamera);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSDCamera cameraImp](self, "cameraImp"));
    v11 = NSStringFromSelector(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a4, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> %@ does not provide this implementation : '%@'."), v9, v10, v12);

  }
  return v8 & 1;
}

- (_OSDCameraInterface)cameraImp
{
  return self->_cameraImp;
}

- (void)setCameraImp:(id)a3
{
  objc_storeStrong((id *)&self->_cameraImp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraImp, 0);
}

@end
