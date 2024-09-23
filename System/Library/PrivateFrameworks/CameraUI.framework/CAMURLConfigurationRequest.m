@implementation CAMURLConfigurationRequest

- (CAMURLConfigurationRequest)initWithQueryDictionary:(id)a3
{
  id v4;
  CAMURLConfigurationRequest *v5;
  CAMURLConfigurationRequest *v6;
  CAMURLConfigurationRequest *v7;
  CAMURLConfigurationRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMURLConfigurationRequest;
  v5 = -[CAMURLConfigurationRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (-[CAMURLConfigurationRequest _initializeFromQueryDictionary:](v5, "_initializeFromQueryDictionary:", v4))
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (BOOL)_initializeFromQueryDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capturemode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMURLConfigurationRequest _captureModeFromString:outCaptureMode:](self, "_captureModeFromString:outCaptureMode:", v5, &self->_requestedCaptureMode);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capturedevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CAMURLConfigurationRequest _captureDeviceFromString:outCaptureDevice:](self, "_captureDeviceFromString:outCaptureDevice:", v7, &self->_requestedCaptureDevice) != 0;

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("qrcodes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qrcodes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wantsQRCodeForSession = objc_msgSend(v10, "isEqualToString:", CFSTR("true"));

  }
  else
  {
    self->_wantsQRCodeForSession = 0;
  }

  return v8;
}

- (BOOL)_captureModeFromString:(id)a3 outCaptureMode:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("photo")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("square")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("video")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("slomo")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("timelapse")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("panorama")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("portrait")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cinematic")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("spatialVideo")) & 1) != 0)
  {
    v6 = 8;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("spatialPhoto")))
    {
      v7 = 0;
      goto LABEL_22;
    }
    v6 = 9;
  }
  *a4 = v6;
  v7 = 1;
LABEL_22:

  return v7;
}

- (int64_t)_captureDeviceFromString:(id)a3 outCaptureDevice:(int64_t *)a4
{
  id v5;
  int64_t v6;
  int v7;
  int64_t v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("front")) & 1) != 0)
  {
    v6 = 1;
LABEL_4:
    *a4 = v6;
    v8 = 1;
    goto LABEL_5;
  }
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("back"));
  v6 = 0;
  v8 = 0;
  if (v7)
    goto LABEL_4;
LABEL_5:

  return v8;
}

- (int64_t)requestedCaptureMode
{
  return self->_requestedCaptureMode;
}

- (int64_t)requestedCaptureDevice
{
  return self->_requestedCaptureDevice;
}

- (BOOL)wantsQRCodeForSession
{
  return self->_wantsQRCodeForSession;
}

@end
