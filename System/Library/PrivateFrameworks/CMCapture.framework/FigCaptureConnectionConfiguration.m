@implementation FigCaptureConnectionConfiguration

- (BOOL)smartCameraRequired
{
  OpaqueFigCaptureSource *v3;
  OpaqueFigCaptureSource *v4;
  void (*v5)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, id *);
  id v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  id v13;

  v3 = -[FigCaptureSourceConfiguration source](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "source");
  if (v3)
  {
    v13 = 0;
    v4 = -[FigCaptureSourceConfiguration source](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "source");
    v5 = *(void (**)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
    if (v5)
    {
      v5(v4, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v13);
      v6 = v13;
    }
    else
    {
      v6 = 0;
    }
    v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SmartCameraSupported")), "BOOLValue");

    if (!v7)
      goto LABEL_12;
    v8 = -[NSArray containsObject:](-[FigCaptureSourceVideoFormat AVCaptureSessionPresets](-[FigCaptureSourceConfiguration requiredFormat](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "requiredFormat"), "AVCaptureSessionPresets"), "containsObject:", CFSTR("AVCaptureSessionPresetPhoto"));
    v9 = -[FigCaptureSourceConfiguration depthDataDeliveryEnabled](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "depthDataDeliveryEnabled");
    v10 = -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "spatialOverCaptureEnabled");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FigCaptureConnectionConfiguration portraitAutoSuggestEnabled](self, "portraitAutoSuggestEnabled");
      if (!v8)
        goto LABEL_12;
    }
    else
    {
      v11 = 0;
      if (!v8)
        goto LABEL_12;
    }
    if ((!v9 | v10 | v11) == 1)
    {
      LOBYTE(v3) = -[FigCaptureSourceConfiguration imageControlMode](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "imageControlMode") != 4;
      return (char)v3;
    }
LABEL_12:
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (FigCaptureSourceConfiguration)sourceConfiguration
{
  return self->_sourceConfiguration;
}

- (FigCaptureVideoPreviewSinkConfiguration)videoPreviewSinkConfiguration
{
  FigCaptureVideoPreviewSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureVideoPreviewSinkConfiguration sinkType](v2, "sinkType") == 1)
    return v2;
  else
    return 0;
}

- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration
{
  FigCaptureIrisSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureIrisSinkConfiguration sinkType](v2, "sinkType") == 10)
    return v2;
  else
    return 0;
}

- (FigCaptureSinkConfiguration)sinkConfiguration
{
  return self->_sinkConfiguration;
}

- (int)underlyingDeviceType
{
  return self->_underlyingDeviceType;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  objc_class *v4;
  const char *Name;
  id v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  xpc_dictionary_set_string(v3, "class", Name);
  v6 = -[FigCaptureSinkConfiguration copyXPCEncoding](-[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), "copyXPCEncoding");
  -[FigCaptureConnectionConfiguration connectionID](self, "connectionID");
  FigXPCMessageSetCFString();
  xpc_dictionary_set_int64(v3, "mediaType", -[FigCaptureConnectionConfiguration mediaType](self, "mediaType"));
  xpc_dictionary_set_int64(v3, "underlyingDeviceType", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"));
  xpc_dictionary_set_value(v3, "sink", v6);
  xpc_dictionary_set_BOOL(v3, "enabled", -[FigCaptureConnectionConfiguration enabled](self, "enabled"));
  xpc_release(v6);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConnectionID:", -[FigCaptureConnectionConfiguration connectionID](self, "connectionID"));
  objc_msgSend(v5, "setMediaType:", -[FigCaptureConnectionConfiguration mediaType](self, "mediaType"));
  objc_msgSend(v5, "setUnderlyingDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"));
  objc_msgSend(v5, "setEnabled:", -[FigCaptureConnectionConfiguration enabled](self, "enabled"));
  v6 = -[FigCaptureSourceConfiguration copyWithZone:](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "copyWithZone:", a3);
  objc_msgSend(v5, "setSourceConfiguration:", v6);

  v7 = -[FigCaptureSinkConfiguration copyWithZone:](-[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), "copyWithZone:", a3);
  objc_msgSend(v5, "setSinkConfiguration:", v7);

  return v5;
}

- (void)setSourceConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setUnderlyingDeviceType:(int)a3
{
  self->_underlyingDeviceType = a3;
}

- (void)setSinkConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (FigCaptureConnectionConfiguration)init
{
  FigCaptureConnectionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureConnectionConfiguration;
  result = -[FigCaptureConnectionConfiguration init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (void)setConnectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  FigCaptureSourceConfiguration *v16;
  FigCaptureSinkConfiguration *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v19 = v5;
    v20 = v4;
    v21 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      LOBYTE(v12) = 0;
      return v12;
    }
    v11 = -[FigCaptureConnectionConfiguration connectionID](self, "connectionID");
    if (v11 == (NSString *)objc_msgSend(a3, "connectionID")
      || (v12 = -[NSString isEqual:](-[FigCaptureConnectionConfiguration connectionID](self, "connectionID"), "isEqual:", objc_msgSend(a3, "connectionID"))) != 0)
    {
      v13 = -[FigCaptureConnectionConfiguration mediaType](self, "mediaType", v6, v19, v20, v21, v7, v8);
      if (v13 != objc_msgSend(a3, "mediaType"))
        goto LABEL_8;
      v14 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
      if (v14 != objc_msgSend(a3, "underlyingDeviceType"))
        goto LABEL_8;
      v15 = -[FigCaptureConnectionConfiguration enabled](self, "enabled");
      if (v15 != objc_msgSend(a3, "enabled"))
        goto LABEL_8;
      v16 = -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration");
      if (v16 == (FigCaptureSourceConfiguration *)objc_msgSend(a3, "sourceConfiguration")
        || (v12 = -[FigCaptureSourceConfiguration isEqual:](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "isEqual:", objc_msgSend(a3, "sourceConfiguration"))) != 0)
      {
        v17 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
        if (v17 == (FigCaptureSinkConfiguration *)objc_msgSend(a3, "sinkConfiguration")
          || (v12 = -[FigCaptureSinkConfiguration isEqual:](-[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), "isEqual:", objc_msgSend(a3, "sinkConfiguration"))) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
  }
  return v12;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureConnectionConfiguration;
  -[FigCaptureConnectionConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureStillImageSinkConfiguration)stillImageSinkConfiguration
{
  FigCaptureStillImageSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureStillImageSinkConfiguration sinkType](v2, "sinkType") == 3)
    return v2;
  else
    return 0;
}

- (FigCaptureVideoThumbnailSinkConfiguration)thumbnailSinkConfiguration
{
  FigCaptureVideoThumbnailSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureVideoThumbnailSinkConfiguration sinkType](v2, "sinkType") == 12)
    return v2;
  else
    return 0;
}

- (FigCaptureDepthDataSinkConfiguration)depthDataSinkConfiguration
{
  FigCaptureDepthDataSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureDepthDataSinkConfiguration sinkType](v2, "sinkType") == 11)
    return v2;
  else
    return 0;
}

- (FigCaptureVideoDataSinkConfiguration)videoDataSinkConfiguration
{
  FigCaptureVideoDataSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureVideoDataSinkConfiguration sinkType](v2, "sinkType") == 6)
    return v2;
  else
    return 0;
}

- (FigCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureConnectionConfiguration *v3;
  xpc_object_t value;
  const char *string;
  Class Class;
  uint64_t v8;
  objc_super v10;

  v3 = self;
  if (!a3)
  {
    fig_log_get_emitter();
    goto LABEL_10;
  }
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureConnectionConfiguration;
  v3 = -[FigCaptureConnectionConfiguration init](&v10, sel_init);
  if (v3)
  {
    value = xpc_dictionary_get_value(a3, "sink");
    FigXPCMessageCopyCFString();
    v3->_mediaType = xpc_dictionary_get_int64(a3, "mediaType");
    v3->_underlyingDeviceType = xpc_dictionary_get_int64(a3, "underlyingDeviceType");
    string = xpc_dictionary_get_string(value, "class");
    if (!string)
      goto LABEL_11;
    Class = objc_getClass(string);
    if (!-[objc_class isSubclassOfClass:](Class, "isSubclassOfClass:", objc_opt_class()))
      goto LABEL_11;
    v8 = objc_msgSend([Class alloc], "initWithXPCEncoding:", value);
    v3->_sinkConfiguration = (FigCaptureSinkConfiguration *)v8;
    if (v8)
    {
      v3->_enabled = xpc_dictionary_get_BOOL(a3, "enabled");
      return v3;
    }
    fig_log_get_emitter();
LABEL_10:
    FigDebugAssert3();
LABEL_11:

    return 0;
  }
  return v3;
}

- (BOOL)sourcesFromUnderlyingStream
{
  int v3;

  v3 = -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType");
  return v3 != -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
}

- (FigCapturePointCloudDataSinkConfiguration)pointCloudDataSinkConfiguration
{
  FigCapturePointCloudDataSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCapturePointCloudDataSinkConfiguration sinkType](v2, "sinkType") == 15)
    return v2;
  else
    return 0;
}

- (FigCaptureCameraCalibrationDataSinkConfiguration)cameraCalibrationDataSinkConfiguration
{
  FigCaptureCameraCalibrationDataSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureCameraCalibrationDataSinkConfiguration sinkType](v2, "sinkType") == 16)
    return v2;
  else
    return 0;
}

- (FigCaptureMovieFileSinkConfiguration)movieFileSinkConfiguration
{
  FigCaptureMovieFileSinkConfiguration *v2;

  v2 = -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (-[FigCaptureMovieFileSinkConfiguration sinkType](v2, "sinkType") == 4)
    return v2;
  else
    return 0;
}

@end
