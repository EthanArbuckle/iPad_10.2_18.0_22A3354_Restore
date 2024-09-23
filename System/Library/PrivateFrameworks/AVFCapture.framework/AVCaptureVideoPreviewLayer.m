@implementation AVCaptureVideoPreviewLayer

- (BOOL)isDepthDataDeliveryEnabled
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthDataDeliveryEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (id)videoPreviewFilters
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (void *)-[NSArray copy](self->_internal->videoPreviewFilters, "copy");
  objc_sync_exit(internal);
  return v4;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  CGRect v16;

  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqualToString:", -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04478]))
    {
      if (!self->_internal->isPreviewing)
      {
        -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("previewing"));
        self->_internal->isPreviewing = 1;
        -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("previewing"));
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureVideoPreviewLayerDidStartRunningNotification"), self);
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04480]))
    {
      if (self->_internal->isPreviewing)
      {
        -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("previewing"));
        self->_internal->isPreviewing = 0;
        -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("previewing"));
      }
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04488]))
    {
      -[AVCaptureVideoPreviewLayer didUpdatePreviewFormatDescription:](self, "didUpdatePreviewFormatDescription:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04370]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04588]))
    {
      v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04220]);
      v8 = objc_msgSend(v7, "intValue");
      v9 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04210]);
      v10 = v9;
      if (v7 && !v9)
        v10 = objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", v8);
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04230]), "floatValue");
      v12 = v11;
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04228]), "floatValue");
      v14 = v13;
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04218]), "floatValue");
      -[AVCaptureVideoPreviewLayer didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:](self, "didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:", v8, v10, v12, v14, v15);
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04598]))
    {
      memset(&v16, 0, sizeof(v16));
      if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04710]), &v16))
      {
        -[AVCaptureVideoPreviewLayer _updateZoomPIPOverlayRect:](self, "_updateZoomPIPOverlayRect:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
      }
    }
  }
}

- (id)sinkID
{
  return self->_internal->sinkID;
}

- (BOOL)isZoomPictureInPictureOverlayEnabled
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->zoomPictureInPictureOverlayEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isPortraitAutoSuggestEnabled
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->portraitAutoSuggestEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isFilterRenderingEnabled
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->filterRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)didUpdatePreviewFormatDescription:(opaqueCMFormatDescription *)a3
{
  unint64_t Dimensions;
  int32_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  int32_t v9;
  unint64_t v10;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v12;
  double previewRotationDegrees;
  _BOOL4 v14;
  BOOL v15;
  int v16;
  double v17;
  int v18;

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  v5 = Dimensions;
  v6 = HIDWORD(Dimensions);
  v7 = (void *)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat");
  v8 = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v7, "formatDescription"));
  v9 = v8;
  v10 = HIDWORD(v8);
  internal = self->_internal;
  objc_sync_enter(internal);
  v12 = self->_internal;
  previewRotationDegrees = v12->previewRotationDegrees;
  v14 = previewRotationDegrees == 90.0;
  if (previewRotationDegrees == 270.0)
    v14 = 1;
  v15 = !v14;
  if (v14)
    v16 = v6;
  else
    v16 = v5;
  v17 = (double)v16;
  if (v15)
    v18 = v6;
  else
    v18 = v5;
  v12->previewSize.width = v17;
  self->_internal->previewSize.height = (double)v18;
  self->_internal->sensorSize.width = (double)v9;
  self->_internal->sensorSize.height = (double)(int)v10;
  self->_internal->sensorToPreviewVTScalingMode = (NSString *)objc_msgSend(v7, "vtScalingMode");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_sync_exit(internal);
}

- (void)_updateZoomPIPOverlayRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v10, self->_internal->zoomPictureInPictureOverlayRect))
  {
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayRect"));
    v9 = self->_internal;
    v9->zoomPictureInPictureOverlayRect.origin.x = x;
    v9->zoomPictureInPictureOverlayRect.origin.y = y;
    v9->zoomPictureInPictureOverlayRect.size.width = width;
    v9->zoomPictureInPictureOverlayRect.size.height = height;
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayRect"));
  }
  objc_sync_exit(internal);
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) == 0)
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (self->_internal->connection)
  {
    v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)layoutSublayers
{
  void *v3;
  void *v4;
  AVCaptureVideoPreviewLayerInternal *internal;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (self->_internal->disableActions)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  }
  else
  {
    v3 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds"));
    if (v3
      || (v3 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds.size"))) != 0
      || (v3 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds.origin"))) != 0)
    {
      v4 = (void *)MEMORY[0x1E0CD28B0];
      objc_msgSend(v3, "duration");
      objc_msgSend(v4, "setAnimationDuration:");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", objc_msgSend(v3, "timingFunction"));
    }
  }
  internal = self->_internal;
  if (internal->previewSize.width != *MEMORY[0x1E0C9D820]
    || internal->previewSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_sync_enter(self->_internal);
    -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
    objc_sync_exit(internal);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer layoutSublayers](&v7, sel_layoutSublayers);
}

- (BOOL)_zoomPictureInPictureOverlaySupported
{
  id v2;
  BOOL v3;
  void *v4;
  CMTime v6;
  CMTime time1;

  v2 = -[AVCaptureConnection sourceDevice](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "sourceDevice");
  v3 = (__CFString *)objc_msgSend(v2, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInDualCamera")
    || (__CFString *)objc_msgSend(v2, "deviceType") == CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera")
    || objc_msgSend(v2, "deviceType") == (_QWORD)CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
  v4 = (void *)objc_msgSend(v2, "activeFormat");
  if (v4)
    objc_msgSend(v4, "lowestSupportedVideoFrameDuration");
  else
    memset(&time1, 0, sizeof(time1));
  CMTimeMake(&v6, 1, 60);
  return CMTimeCompare(&time1, &v6) >= 0 && v3;
}

- (void)_updatePreviewTransforms
{
  AVCaptureConnection *connection;
  NSString *gravity;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  AVCaptureVideoPreviewLayerInternal *internal;
  double v10;
  double v11;
  double v12;
  double v13;
  AVCaptureVideoPreviewLayerInternal *v14;
  double oddScreenScale;
  double oddScreenWidth;
  double width;
  double height;
  double *v19;
  _BOOL4 v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  BOOL v29;
  double v31;
  double v32;
  CGFloat m11;
  CGFloat m22;
  _BOOL4 v35;
  double v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  double v48;
  CALayer *sublayer;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  double previewRotationDegrees;
  CGFloat v58;
  __int128 v59;
  __int128 v60;
  CGFloat v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CATransform3D v74;
  CATransform3D v75;

  connection = self->_internal->connection;
  -[AVCaptureVideoPreviewLayer centerSublayer:](self, "centerSublayer:", -[AVCaptureConnection _videoOrientation](connection, "_videoOrientation"));
  gravity = self->_internal->gravity;
  v5 = -[AVCaptureConnection _videoOrientation](connection, "_videoOrientation");
  v6 = -[AVCaptureConnection isVideoMirrored](connection, "isVideoMirrored");
  v7 = -[AVCaptureConnection sourcesFromFrontFacingCamera](connection, "sourcesFromFrontFacingCamera");
  v8 = -[AVCaptureConnection sourcesFromExternalCamera](connection, "sourcesFromExternalCamera");
  internal = self->_internal;
  previewRotationDegrees = internal->previewRotationDegrees;
  -[AVCaptureVideoPreviewLayer bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v14 = self->_internal;
  oddScreenWidth = v14->oddScreenWidth;
  oddScreenScale = v14->oddScreenScale;
  width = internal->previewSize.width;
  height = internal->previewSize.height;
  v19 = (double *)MEMORY[0x1E0CD2610];
  v55 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 24);
  v56 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 8);
  v72 = v56;
  v73 = v55;
  v53 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v69 = v54;
  v70 = v53;
  v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v71 = v52;
  v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v51 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v67 = v50;
  v68 = v51;
  v20 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
  v21 = -3;
  if (v20)
    v21 = -1;
  v22 = v21 + v5;
  if (v22 >= 2)
    v23 = width;
  else
    v23 = height;
  if (v22 >= 2)
    v24 = height;
  else
    v24 = width;
  if (oddScreenWidth != 0.0 && oddScreenScale != 0.0)
  {
    v25 = v22 >= 2 ? v13 : v11;
    v26 = oddScreenScale * v25;
    v29 = oddScreenWidth == v26;
    v27 = height;
    v28 = vabds_f32(v26, v27);
    v29 = v29 && v28 == 1.0;
    if (v29)
    {
      if (v22 >= 2)
        v23 = width;
      else
        v23 = oddScreenWidth;
      if (v22 >= 2)
        v24 = oddScreenWidth;
      else
        v24 = width;
    }
  }
  if (v23 != *MEMORY[0x1E0C9D820] || v24 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (-[NSString isEqualToString:](gravity, "isEqualToString:", *MEMORY[0x1E0CF2B28]))
    {
      v31 = v11 / v23;
      v32 = v13 / v24;
    }
    else
    {
      v35 = -[NSString isEqualToString:](gravity, "isEqualToString:", *MEMORY[0x1E0CF2B38]);
      v36 = fmin(v11 / v23, v13 / v24);
      v37 = fmax(v11 / v23, v13 / v24);
      if (v35)
        v31 = v37;
      else
        v31 = v36;
      if (v35)
        v32 = v37;
      else
        v32 = v36;
    }
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      switch(v5)
      {
        case 1:
          v38 = !v8;
          goto LABEL_47;
        case 2:
          v38 = !v8;
          goto LABEL_55;
        case 3:
          v38 = !v6;
          v39 = 180.0;
          v48 = 0.0;
          if (!v8 && v7)
            goto LABEL_56;
          if (!v6)
            v39 = 0.0;
          goto LABEL_58;
        case 4:
          v40 = previewRotationDegrees;
          v42 = v55;
          v41 = v56;
          v44 = v53;
          v43 = v54;
          v46 = v51;
          v45 = v52;
          v47 = v50;
          v39 = 180.0;
          if (v8 || !v7)
          {
            if (v6)
              v39 = 0.0;
          }
          else if (!v6)
          {
            v39 = 0.0;
          }
          goto LABEL_59;
        default:
          v39 = 0.0;
          goto LABEL_58;
      }
    }
    if (v5 == 4)
    {
      if (v7)
      {
LABEL_49:
        v38 = !v6;
LABEL_55:
        v39 = 270.0;
        v48 = 90.0;
        goto LABEL_56;
      }
    }
    else
    {
      if (v5 != 3)
      {
        v39 = 0.0;
        v40 = previewRotationDegrees;
        v42 = v55;
        v41 = v56;
        v44 = v53;
        v43 = v54;
        v46 = v51;
        v45 = v52;
        v47 = v50;
        if (v5 == 2)
          v39 = 180.0;
        goto LABEL_59;
      }
      if (!v7)
        goto LABEL_49;
    }
    v38 = !v6;
LABEL_47:
    v39 = 90.0;
    v48 = 270.0;
LABEL_56:
    if (!v38)
      v39 = v48;
LABEL_58:
    v40 = previewRotationDegrees;
    v42 = v55;
    v41 = v56;
    v44 = v53;
    v43 = v54;
    v46 = v51;
    v45 = v52;
    v47 = v50;
LABEL_59:
    *(_OWORD *)&v74.m12 = v41;
    *(_OWORD *)&v74.m14 = v42;
    v74.m11 = v31;
    v74.m22 = v32;
    *(_OWORD *)&v74.m33 = v43;
    *(_OWORD *)&v74.m41 = v44;
    *(_OWORD *)&v74.m43 = v45;
    *(_OWORD *)&v74.m23 = v47;
    *(_OWORD *)&v74.m31 = v46;
    CATransform3DRotate(&v75, &v74, (v39 - v40) * 3.14159265 / 180.0, 0.0, 0.0, 1.0);
    v72 = *(_OWORD *)&v75.m12;
    v73 = *(_OWORD *)&v75.m14;
    m11 = v75.m11;
    m22 = v75.m22;
    v69 = *(_OWORD *)&v75.m33;
    v70 = *(_OWORD *)&v75.m41;
    v71 = *(_OWORD *)&v75.m43;
    v67 = *(_OWORD *)&v75.m23;
    v68 = *(_OWORD *)&v75.m31;
    goto LABEL_60;
  }
  m11 = *v19;
  m22 = v19[5];
LABEL_60:
  v58 = m11;
  v59 = v72;
  sublayer = self->_internal->sublayer;
  v60 = v73;
  v61 = m22;
  v64 = v69;
  v65 = v70;
  v66 = v71;
  v62 = v67;
  v63 = v68;
  -[CALayer setTransform:](sublayer, "setTransform:", &v58, v50, v51, v52, v53, v54, v55, v56);
  -[AVCaptureVideoPreviewLayer _updateCaptureDeviceTransform](self, "_updateCaptureDeviceTransform");
}

- (void)_updateCaptureDeviceTransform
{
  AVCaptureVideoPreviewLayerInternal *internal;
  CGAffineTransform v3;

  internal = self->_internal;
  -[AVCaptureVideoPreviewLayer captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:](self, "captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:", internal->sensorToPreviewVTScalingMode, internal->sensorSize.width, internal->sensorSize.height, internal->previewSize.width, internal->previewSize.height);
  internal->captureDeviceTransform = v3;
}

- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  AVCaptureConnection *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t *p_rollAdjustment;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v27;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v13 = -[AVCaptureVideoPreviewLayer connection](self, "connection");
  -[AVCaptureVideoPreviewLayer bounds](self, "bounds");
  v27.origin.x = v14;
  v27.origin.y = v15;
  v27.size.width = v16;
  v27.size.height = v17;
  CGRectEqualToRect(*MEMORY[0x1E0C9D648], v27);
  v18 = -[AVCaptureConnection sourcesFromFrontFacingCamera](v13, "sourcesFromFrontFacingCamera");
  v19 = -[AVCaptureConnection sourcesFromExternalCamera](v13, "sourcesFromExternalCamera");
  v20 = -[AVCaptureConnection _videoOrientation](v13, "_videoOrientation");
  p_rollAdjustment = (uint64_t *)&self->_internal->rollAdjustment;
  -[AVCaptureVideoPreviewLayer bounds](self, "bounds");
  return AVCaptureVideoTransformForCaptureDevice(a6, v18, v19, 1, v20, p_rollAdjustment, 1, self->_internal->gravity, (uint64_t)retstr, v10, v9, width, height, v22, v23, v24, v25, 1, -[AVCaptureConnection isVideoMirrored](v13, "isVideoMirrored"));
}

- (AVCaptureConnection)connection
{
  return self->_internal->connection;
}

- (void)centerSublayer:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  AVCaptureVideoPreviewLayerInternal *internal;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double oddScreenScale;
  float v26;
  float height;

  -[AVCaptureVideoPreviewLayer bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  if (v5 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v12 = v5;
    v13 = v6;
    -[CALayer position](self->_internal->sublayer, "position");
    v15 = v14;
    v17 = v16;
    v18 = v8 + v12 * 0.5;
    v19 = v10 + v13 * 0.5;
    internal = self->_internal;
    if (internal->oddScreenWidth != 0.0 && internal->oddScreenScale != 0.0)
    {
      -[AVCaptureConnection sourcesFromExternalCamera](internal->connection, "sourcesFromExternalCamera");
      v21 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
      v22 = -3;
      if (v21)
        v22 = -1;
      v23 = v22 + a3;
      internal = self->_internal;
      if (v23 >= 2)
        v24 = v13;
      else
        v24 = v12;
      oddScreenScale = internal->oddScreenScale;
      v26 = v24 * oddScreenScale;
      if (internal->oddScreenWidth == v26)
      {
        height = internal->previewSize.height;
        if (vabds_f32(v26, height) == 1.0)
        {
          v18 = (float)(int)(v18 * oddScreenScale + 1.0) / oddScreenScale;
          v19 = (float)(int)(v19 * oddScreenScale + 1.0) / oddScreenScale;
        }
      }
    }
    if (v15 != v18 || v17 != v19)
      -[CALayer setPosition:](internal->sublayer, "setPosition:", v18, v19);
  }
}

uint64_t __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPortraitLightingEffectStrengthFromDeviceInput");
}

uint64_t __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSimulatedApertureFromDeviceInput");
}

- (AVCaptureVideoPreviewLayer)initWithSession:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)-[AVCaptureVideoPreviewLayer _initWithSession:makeConnection:](self, "_initWithSession:makeConnection:", session, 1);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_internal->disableActions = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (id)weakReference
{
  return self->_internal->weakReference;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04478], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04480], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04488], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04588], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04598], a3, 0);
}

- (AVCaptureSession)session
{
  return self->_internal->session;
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 || (id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    objc_opt_class();
  }
}

uint64_t __80__AVCaptureVideoPreviewLayer_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32));
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v6;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (v6->filterRenderingEnabled == v3)
  {
    objc_sync_exit(internal);
  }
  else
  {
    v6->filterRenderingEnabled = v3;
    objc_sync_exit(internal);
    -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v6;
  void *v7;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (v3 && !v6->portraitAutoSuggestSupported)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (v6->portraitAutoSuggestEnabled != v3)
  {
    v6->portraitAutoSuggestEnabled = v3;
    objc_sync_exit(internal);
    -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
    return;
  }
  objc_sync_exit(internal);
}

- (void)setZoomPictureInPictureOverlayEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v6;
  void *v7;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (v3 && !v6->zoomPictureInPictureOverlaySupported)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (v6->zoomPictureInPictureOverlayEnabled != v3)
  {
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayEnabled"));
    self->_internal->zoomPictureInPictureOverlayEnabled = v3;
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayEnabled"));
    -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
  }
  objc_sync_exit(internal);
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v6;
  void *v7;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (v3 && !v6->depthDataDeliverySupported)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
  else if (v6->depthDataDeliveryEnabled != v3)
  {
    v6->depthDataDeliveryEnabled = v3;
    objc_sync_exit(internal);
    -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
    return;
  }
  objc_sync_exit(internal);
}

- (void)bumpChangeSeed
{
  int *p_changeSeed;
  unsigned int v4;

  -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeSeed"));
  p_changeSeed = &self->_internal->changeSeed;
  do
    v4 = __ldxr((unsigned int *)p_changeSeed);
  while (__stxr(v4 + 1, (unsigned int *)p_changeSeed));
  -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeSeed"));
}

- (BOOL)isZoomPictureInPictureOverlaySupported
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->zoomPictureInPictureOverlaySupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isPortraitAutoSuggestSupported
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->portraitAutoSuggestSupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (BOOL)isDepthDataDeliverySupported
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->depthDataDeliverySupported;
  objc_sync_exit(internal);
  return (char)v2;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  void *v6;

  if (a4)
    *a4 = 0;
  if (a3)
  {
    self->_internal->connection = (AVCaptureConnection *)a3;
    objc_msgSend(a3, "_setVideoOrientation:", self->_internal->orientation);
    objc_msgSend(a3, "setAutomaticallyAdjustsVideoMirroring:", self->_internal->automaticallyAdjustsMirroring);
    if ((objc_msgSend(a3, "automaticallyAdjustsVideoMirroring") & 1) == 0)
      objc_msgSend(a3, "setVideoMirrored:", self->_internal->mirrored);
    -[AVCaptureConnection addObserver:forKeyPath:options:context:](self->_internal->connection, "addObserver:forKeyPath:options:context:", self, CFSTR("videoMirrored"), 3, AVCaptureVideoPreviewLayerVideoMirroredChangedContext);
    -[AVCaptureConnection addObserver:forKeyPath:options:context:](self->_internal->connection, "addObserver:forKeyPath:options:context:", self, CFSTR("automaticallyAdjustsVideoMirroring"), 3, AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext);
    -[AVCaptureConnection addObserver:forKeyPath:options:context:](self->_internal->connection, "addObserver:forKeyPath:options:context:", self, CFSTR("videoOrientation"), 3, AVCaptureVideoPreviewLayerVideoOrientationChangedContext);
    v6 = (void *)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self->_internal->connection, "inputPorts"), "firstObject"), "input");
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("simulatedAperture"), 3, AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("portraitLightingEffectStrength"), 3, AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext);
    -[AVCaptureVideoPreviewLayer _setSensorAndEstimatedPreviewSizes](self, "_setSensorAndEstimatedPreviewSizes");
    -[AVCaptureVideoPreviewLayer _updateDepthDataDeliverySupported](self, "_updateDepthDataDeliverySupported");
    -[AVCaptureVideoPreviewLayer _updateSemanticStyleRenderingSupported](self, "_updateSemanticStyleRenderingSupported");
    -[AVCaptureVideoPreviewLayer _updateZoomPictureInPictureOverlaySupported](self, "_updateZoomPictureInPictureOverlaySupported");
    -[AVCaptureVideoPreviewLayer _updatePortraitAutoSuggestSupported](self, "_updatePortraitAutoSuggestSupported");
  }
  return a3;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  -[AVCaptureVideoPreviewLayer _updateDepthDataDeliverySupported](self, "_updateDepthDataDeliverySupported", a3, a4);
  -[AVCaptureVideoPreviewLayer _updateSemanticStyleRenderingSupported](self, "_updateSemanticStyleRenderingSupported");
  -[AVCaptureVideoPreviewLayer _updateZoomPictureInPictureOverlaySupported](self, "_updateZoomPictureInPictureOverlaySupported");
  -[AVCaptureVideoPreviewLayer _updatePortraitAutoSuggestSupported](self, "_updatePortraitAutoSuggestSupported");
}

- (void)_updateZoomPictureInPictureOverlaySupported
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 zoomPictureInPictureOverlayEnabled;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  AVCaptureVideoPreviewLayerInternal *v17;
  CGRect v18;

  v3 = -[AVCaptureVideoPreviewLayer _zoomPictureInPictureOverlaySupported](self, "_zoomPictureInPictureOverlaySupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  if (v5->zoomPictureInPictureOverlaySupported != v3)
  {
    x = v5->zoomPictureInPictureOverlayRect.origin.x;
    y = v5->zoomPictureInPictureOverlayRect.origin.y;
    width = v5->zoomPictureInPictureOverlayRect.size.width;
    height = v5->zoomPictureInPictureOverlayRect.size.height;
    zoomPictureInPictureOverlayEnabled = v5->zoomPictureInPictureOverlayEnabled;
    if (v3)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v18.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v18.origin.y = v14;
      v18.size.width = v15;
      v18.size.height = v16;
      v12 = !CGRectEqualToRect(v18, v5->zoomPictureInPictureOverlayRect);
      v11 = zoomPictureInPictureOverlayEnabled;
      x = v13;
      y = v14;
      width = v15;
      height = v16;
      LOBYTE(zoomPictureInPictureOverlayEnabled) = 0;
    }
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zoomPictureInPictureOverlaySupported"));
    if (v11)
      -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayEnabled"));
    if (v12)
      -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayRect"));
    self->_internal->zoomPictureInPictureOverlaySupported = v3;
    v17 = self->_internal;
    v17->zoomPictureInPictureOverlayRect.origin.x = x;
    v17->zoomPictureInPictureOverlayRect.origin.y = y;
    v17->zoomPictureInPictureOverlayRect.size.width = width;
    v17->zoomPictureInPictureOverlayRect.size.height = height;
    self->_internal->zoomPictureInPictureOverlayEnabled = zoomPictureInPictureOverlayEnabled;
    if (v12)
      -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayRect"));
    if (v11)
      -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zoomPictureInPictureOverlayEnabled"));
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("zoomPictureInPictureOverlaySupported"));
  }
  objc_sync_exit(internal);
}

- (void)_updateDepthDataDeliverySupported
{
  int v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v5;
  int depthDataDeliverySupported;
  _BOOL4 v7;
  AVCaptureVideoPreviewLayerInternal *v8;

  v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isStreamingDisparitySupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  depthDataDeliverySupported = v5->depthDataDeliverySupported;
  v7 = (v3 & 1) == 0 && v5->depthDataDeliveryEnabled;
  objc_sync_exit(internal);
  if (depthDataDeliverySupported != v3)
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("depthDataDeliverySupported"));
  if (v7)
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("depthDataDeliveryEnabled"));
  v8 = self->_internal;
  objc_sync_enter(v8);
  self->_internal->depthDataDeliverySupported = v3;
  if (v7)
  {
    self->_internal->depthDataDeliveryEnabled = 0;
    objc_sync_exit(v8);
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("depthDataDeliveryEnabled"));
  }
  else
  {
    objc_sync_exit(v8);
  }
  if (depthDataDeliverySupported != v3)
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("depthDataDeliverySupported"));
}

- (void)_updatePortraitAutoSuggestSupported
{
  int v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v5;
  int portraitAutoSuggestSupported;
  _BOOL4 v7;
  AVCaptureVideoPreviewLayerInternal *v8;

  v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isPortraitAutoSuggestSupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  portraitAutoSuggestSupported = v5->portraitAutoSuggestSupported;
  v7 = (v3 & 1) == 0 && v5->portraitAutoSuggestEnabled;
  objc_sync_exit(internal);
  if (portraitAutoSuggestSupported != v3)
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitAutoSuggestSupported"));
  if (v7)
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitAutoSuggestEnabled"));
  v8 = self->_internal;
  objc_sync_enter(v8);
  self->_internal->portraitAutoSuggestSupported = v3;
  if (v7)
  {
    self->_internal->portraitAutoSuggestEnabled = 0;
    objc_sync_exit(v8);
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitAutoSuggestEnabled"));
  }
  else
  {
    objc_sync_exit(v8);
  }
  if (portraitAutoSuggestSupported != v3)
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitAutoSuggestSupported"));
}

- (void)_setSensorAndEstimatedPreviewSizes
{
  unint64_t Dimensions;
  int v4;
  unint64_t v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v13;
  AVCaptureVideoPreviewLayerInternal *v14;

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "formatDescription"));
  v4 = Dimensions;
  v5 = HIDWORD(Dimensions);
  if ((int)Dimensions >= 1 && SHIDWORD(Dimensions) >= 1)
  {
    v7 = (double)(int)Dimensions;
    v8 = (double)SHIDWORD(Dimensions);
    v9 = AVCaptureMainScreenPixelSize();
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    if (v9 < v10)
      v9 = v10;
    if (v4 * (int)v5 > (uint64_t)(v9 * v11))
    {
      if (v7 / v8 >= v9 / v11)
      {
        LODWORD(v5) = ((int)(((int)v9 & 0xFFFFFFFE) * v5) / v4) & 0xFFFFFFFE;
        v4 = (int)v9 & 0xFFFFFFFE;
      }
      else
      {
        v4 = ((int)(((int)v11 & 0xFFFFFFFE) * v4) / (int)v5) & 0xFFFFFFFE;
        LODWORD(v5) = (int)v11 & 0xFFFFFFFE;
      }
    }
    internal = self->_internal;
    objc_sync_enter(internal);
    v13 = self->_internal;
    v13->sensorSize.width = v7;
    v13->sensorSize.height = v8;
    v14 = self->_internal;
    v14->previewSize.width = (double)v4;
    v14->previewSize.height = (double)(int)v5;
    -[AVCaptureVideoPreviewLayer _updateCaptureDeviceTransform](self, "_updateCaptureDeviceTransform");
    objc_sync_exit(internal);
  }
}

- (void)setCaptureDeviceTransformNeedsUpdate
{
  AVCaptureVideoPreviewLayerInternal *internal;

  internal = self->_internal;
  objc_sync_enter(internal);
  -[AVCaptureVideoPreviewLayer _updateCaptureDeviceTransform](self, "_updateCaptureDeviceTransform");
  objc_sync_exit(internal);
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__AVCaptureVideoPreviewLayer_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E4216940;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4
{
  _BOOL4 v4;
  AVCaptureVideoPreviewLayer *v6;
  AVCaptureVideoPreviewLayerInternal *v7;
  id v8;
  objc_class *v9;
  id v10;
  AVCaptureVideoPreviewLayerInternal *internal;
  __int128 *v12;
  __int128 v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFNumber *Value;
  const __CFNumber *v17;
  uint64_t valuePtr;
  objc_super v20;

  v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AVCaptureVideoPreviewLayer;
  v6 = -[AVCaptureVideoPreviewLayer init](&v20, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureVideoPreviewLayerInternal);
    v6->_internal = v7;
    if (v7)
    {
      if (AVCaptureSessionIsLaunchPrewarmingEnabled())
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = (objc_class *)objc_opt_class();
        v10 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("<%@>"), NSStringFromClass(v9));
      }
      else
      {
        v10 = AVIdentifierForObject((uint64_t)v6);
      }
      -[AVCaptureVideoPreviewLayer setSinkID:](v6, "setSinkID:", v10);
      v6->_internal->figCaptureSessionSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("capture.videopreview.FigCaptureSessionSyncQueue", 0);
      v6->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v6);
      v6->_internal->orientation = 1;
      v6->_internal->automaticallyAdjustsMirroring = 1;
      internal = v6->_internal;
      v12 = (__int128 *)MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&internal->captureDeviceTransform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v13 = *v12;
      *(_OWORD *)&internal->captureDeviceTransform.c = v12[1];
      *(_OWORD *)&internal->captureDeviceTransform.a = v13;
      v6->_internal->previewRotationDegrees = 0.0;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
      -[AVCaptureVideoPreviewLayer setMasksToBounds:](v6, "setMasksToBounds:", 1);
      -[AVCaptureVideoPreviewLayer setVideoGravity:](v6, "setVideoGravity:", *MEMORY[0x1E0CF2B30]);
      -[AVCaptureVideoPreviewLayer setEdgeAntialiasingMask:](v6, "setEdgeAntialiasingMask:", 0);
      -[AVCaptureVideoPreviewLayer setInheritsTiming:](v6, "setInheritsTiming:", 0);
      v6->_internal->sublayer = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      -[CALayer setAllowsDisplayCompositing:](v6->_internal->sublayer, "setAllowsDisplayCompositing:", 1);
      -[AVCaptureVideoPreviewLayer addSublayer:](v6, "addSublayer:", v6->_internal->sublayer);
      -[CALayer setEdgeAntialiasingMask:](v6->_internal->sublayer, "setEdgeAntialiasingMask:", 0);
      -[CALayer setContentsGravity:](v6->_internal->sublayer, "setContentsGravity:", *MEMORY[0x1E0CD2F78]);
      -[AVCaptureVideoPreviewLayer centerSublayer:](v6, "centerSublayer:", 1);
      v14 = (const __CFDictionary *)MGCopyAnswer();
      if (v14)
      {
        v15 = v14;
        valuePtr = 0;
        Value = (const __CFNumber *)CFDictionaryGetValue(v14, CFSTR("main-screen-width"));
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
          if ((valuePtr & 0x100000000) != 0)
            v6->_internal->oddScreenWidth = (double)SHIDWORD(valuePtr);
        }
        if (v6->_internal->oddScreenWidth != 0.0)
        {
          v17 = (const __CFNumber *)CFDictionaryGetValue(v15, CFSTR("main-screen-scale"));
          if (v17)
          {
            CFNumberGetValue(v17, kCFNumberFloatType, &valuePtr);
            v6->_internal->oddScreenScale = *(float *)&valuePtr;
          }
        }
        CFRelease(v15);
      }
      v6->_internal->videoPreviewFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      if (v4)
        -[AVCaptureVideoPreviewLayer setSession:](v6, "setSession:", a3);
      else
        -[AVCaptureVideoPreviewLayer setSessionWithNoConnection:](v6, "setSessionWithNoConnection:", a3);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  NSString *gravity;
  NSString *v6;
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v9;
  void *v10;
  AVCaptureVideoPreviewLayerInternal *v11;

  gravity = self->_internal->gravity;
  if ((videoGravity == 0) == (gravity != 0)
    || !-[NSString isEqualToString:](gravity, "isEqualToString:", videoGravity))
  {
    v6 = (NSString *)-[NSString copyWithZone:](videoGravity, "copyWithZone:", 0);

    self->_internal->gravity = v6;
    internal = self->_internal;
    if (internal->previewSize.width != *MEMORY[0x1E0C9D820]
      || internal->previewSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if ((objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions") & 1) == 0)
      {
        v9 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds"));
        if (v9
          || (v9 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds.size"))) != 0|| (v9 = (void *)-[AVCaptureVideoPreviewLayer animationForKey:](self, "animationForKey:", CFSTR("bounds.origin"))) != 0)
        {
          v10 = (void *)MEMORY[0x1E0CD28B0];
          objc_msgSend(v9, "duration");
          objc_msgSend(v10, "setAnimationDuration:");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", objc_msgSend(v9, "timingFunction"));
        }
      }
      v11 = self->_internal;
      objc_sync_enter(v11);
      -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
      objc_sync_exit(v11);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (void)setSinkID:(id)a3
{

  self->_internal->sinkID = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setSession:(AVCaptureSession *)session
{
  AVCaptureSession *v5;
  void *v6;
  uint64_t v7;

  if (self->_internal->session != session && (-[AVCaptureSession isEqual:](session, "isEqual:") & 1) == 0)
  {
    v5 = self->_internal->session;
    if (v5)
    {
      -[AVCaptureSession _removeVideoPreviewLayer:](v5, "_removeVideoPreviewLayer:", self);

      self->_internal->session = 0;
    }
    if (session)
    {
      self->_internal->session = session;
      v7 = 0;
      if (!-[AVCaptureSession _addVideoPreviewLayer:exceptionReason:](session, "_addVideoPreviewLayer:exceptionReason:", self, &v7))
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v6);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
      }
    }
  }
}

- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6
{
  double height;
  double width;
  AVCaptureVideoPreviewLayerInternal *internal;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVCaptureVideoPreviewLayerInternal *v14;
  double previewRotationDegrees;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  height = a6.height;
  width = a6.width;
  v18 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  objc_sync_enter(internal);
  if (dword_1ECFED600)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_internal->previewRotationDegrees = a5;
  if (a4)
  {
    self->_internal->imageQueueSlot = a3;
    if (width != 0.0 && height != 0.0)
    {
      v14 = self->_internal;
      previewRotationDegrees = v14->previewRotationDegrees;
      if (previewRotationDegrees == 90.0 || previewRotationDegrees == 270.0)
      {
        v14->previewSize.width = height;
        v14 = self->_internal;
      }
      else
      {
        v14->previewSize.width = width;
        width = height;
      }
      v14->previewSize.height = width;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin", v16, v17);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
    -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
    -[CALayer setContents:](self->_internal->sublayer, "setContents:", a4);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  objc_sync_exit(internal);
}

uint64_t __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(v1 + 32))
    __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke_cold_1();
  v3 = *(const void **)(a1 + 40);
  *(_QWORD *)(v1 + 32) = v3;
  if (v3)
    CFRetain(v3);
  return objc_msgSend(*(id *)(a1 + 32), "attachSafelyToFigCaptureSession:", *(_QWORD *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  NSObject *figCaptureSessionSyncQueue;
  _QWORD *v10;
  int v11;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v13;
  int v16;
  AVCaptureVideoPreviewLayerInternal *v17;
  int v18;
  _BOOL8 v19;
  int v20;
  AVCaptureVideoPreviewLayerInternal *v21;
  AVCaptureVideoPreviewLayerInternal *v22;
  void *v24;
  _QWORD v25[5];
  _QWORD block[5];

  if ((void *)AVCaptureVideoPreviewLayerVideoMirroredChangedContext == a6)
  {
    v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4), "BOOLValue");
    if (v11 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue"))
    {
      internal = self->_internal;
      objc_sync_enter(internal);
      v13 = self->_internal;
      if (v13->previewSize.width != *MEMORY[0x1E0C9D820]
        || v13->previewSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
        -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
      objc_sync_exit(internal);
      -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else if ((void *)AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext == a6)
  {
    v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if ((objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue") & 1) == 0
      && v16)
    {
      -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mirrored"));
      v17 = self->_internal;
      objc_sync_enter(v17);
      v18 = objc_msgSend(a4, "isVideoMirrored");
      v19 = -[AVCaptureConnection sourcesFromFrontFacingCamera](self->_internal->connection, "sourcesFromFrontFacingCamera");
      objc_sync_exit(v17);
      if (v18 != v19)
        objc_msgSend(a4, "_setVideoMirrored:", v19);
      -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mirrored"));
    }
  }
  else if ((void *)AVCaptureVideoPreviewLayerVideoOrientationChangedContext == a6)
  {
    v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4), "intValue");
    if (v20 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "intValue"))
    {
      v21 = self->_internal;
      objc_sync_enter(v21);
      v22 = self->_internal;
      if (v22->previewSize.width != *MEMORY[0x1E0C9D820]
        || v22->previewSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
        -[AVCaptureVideoPreviewLayer _updatePreviewTransforms](self, "_updatePreviewTransforms");
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
      objc_sync_exit(v21);
    }
  }
  else
  {
    if ((void *)AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext == a6)
    {
      v24 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
      if ((objc_msgSend(v24, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8])) & 1) != 0)
        return;
      figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E42165A8;
      block[4] = self;
      v10 = block;
      goto LABEL_29;
    }
    if ((void *)AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext == a6)
    {
      v8 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
      if ((objc_msgSend(v8, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8])) & 1) == 0)
      {
        figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __77__AVCaptureVideoPreviewLayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v25[3] = &unk_1E42165A8;
        v25[4] = self;
        v10 = v25;
LABEL_29:
        dispatch_sync(figCaptureSessionSyncQueue, v10);
      }
    }
  }
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  objc_super v6;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  self->_internal->visible = v3;
  objc_sync_exit(internal);
  if (v3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureVideoPreviewLayerDidBecomeVisibleNotification"), self);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer layerDidBecomeVisible:](&v6, sel_layerDidBecomeVisible_, v3);
}

- (void)_setSimulatedApertureFromDeviceInput
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v4;
  OpaqueFigCaptureSession *figCaptureSession;
  id v6;
  void *v7;
  uint64_t v8;
  void (*v9)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t);

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    v4 = (void *)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](internal->connection, "inputPorts"), "firstObject"), "input");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      figCaptureSession = self->_internal->figCaptureSession;
      v6 = -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "simulatedAperture");
      v8 = objc_msgSend(v7, "numberWithFloat:");
      v9 = *(void (**)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
      if (v9)
        v9(figCaptureSession, v6, *MEMORY[0x1E0D044E8], v8);
    }
  }
}

- (void)_setPortraitLightingEffectStrengthFromDeviceInput
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v4;
  OpaqueFigCaptureSession *figCaptureSession;
  id v6;
  void *v7;
  uint64_t v8;
  void (*v9)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t);

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  internal = self->_internal;
  if (internal->figCaptureSession)
  {
    v4 = (void *)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](internal->connection, "inputPorts"), "firstObject"), "input");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      figCaptureSession = self->_internal->figCaptureSession;
      v6 = -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "portraitLightingEffectStrength");
      v8 = objc_msgSend(v7, "numberWithFloat:");
      v9 = *(void (**)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
      if (v9)
        v9(figCaptureSession, v6, *MEMORY[0x1E0D044C8], v8);
    }
  }
}

+ (AVCaptureVideoPreviewLayer)layerWithSession:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSession:", session);
}

+ (AVCaptureVideoPreviewLayer)layerWithSessionWithNoConnection:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSessionWithNoConnection:", session);
}

- (AVCaptureVideoPreviewLayer)init
{
  return -[AVCaptureVideoPreviewLayer initWithSession:](self, "initWithSession:", 0);
}

- (AVCaptureVideoPreviewLayer)initWithSessionWithNoConnection:(AVCaptureSession *)session
{
  return (AVCaptureVideoPreviewLayer *)-[AVCaptureVideoPreviewLayer _initWithSession:makeConnection:](self, "_initWithSession:makeConnection:", session, 0);
}

- (double)previewRotationDegrees
{
  AVCaptureVideoPreviewLayerInternal *internal;
  double previewRotationDegrees;

  internal = self->_internal;
  objc_sync_enter(internal);
  previewRotationDegrees = self->_internal->previewRotationDegrees;
  objc_sync_exit(internal);
  return previewRotationDegrees;
}

- (AVCaptureVideoPreviewLayer)initWithLayer:(id)a3
{
  AVCaptureVideoPreviewLayerInternal *v5;
  id v6;
  objc_class *v7;
  id v8;
  double v9;
  AVCaptureVideoPreviewLayerInternal *internal;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v16.receiver = self;
  v16.super_class = (Class)AVCaptureVideoPreviewLayer;
  self = -[AVCaptureVideoPreviewLayer initWithLayer:](&v16, sel_initWithLayer_, a3);
  if (!self)
    return self;
  v5 = objc_alloc_init(AVCaptureVideoPreviewLayerInternal);
  self->_internal = v5;
  if (!v5)
  {
LABEL_6:

    return 0;
  }
  if (AVCaptureSessionIsLaunchPrewarmingEnabled())
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (objc_class *)objc_opt_class();
    v8 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@>"), NSStringFromClass(v7));
  }
  else
  {
    v8 = AVIdentifierForObject((uint64_t)self);
  }
  -[AVCaptureVideoPreviewLayer setSinkID:](self, "setSinkID:", v8);
  self->_internal->isPresentationLayer = 1;
  self->_internal->gravity = (NSString *)(id)objc_msgSend(a3, "videoGravity");
  self->_internal->session = (AVCaptureSession *)(id)objc_msgSend(a3, "session");
  self->_internal->connection = (AVCaptureConnection *)(id)objc_msgSend(a3, "connection");
  if (!self->_internal->connection)
  {
    self->_internal->orientation = objc_msgSend(a3, "_orientation");
    self->_internal->automaticallyAdjustsMirroring = objc_msgSend(a3, "_automaticallyAdjustsMirroring");
    self->_internal->mirrored = objc_msgSend(a3, "_isMirrored");
  }
  objc_msgSend(a3, "previewRotationDegrees");
  self->_internal->previewRotationDegrees = v9;
  self->_internal->depthDataDeliverySupported = objc_msgSend(a3, "isDepthDataDeliverySupported");
  self->_internal->depthDataDeliveryEnabled = objc_msgSend(a3, "isDepthDataDeliveryEnabled");
  self->_internal->filterRenderingEnabled = objc_msgSend(a3, "isFilterRenderingEnabled");
  self->_internal->unoptimizedFilterRenderingEnabled = objc_msgSend(a3, "isUnoptimizedFilterRenderingEnabled");
  self->_internal->videoPreviewFilters = (NSArray *)(id)objc_msgSend(a3, "videoPreviewFilters");
  self->_internal->semanticStyleRenderingSupported = objc_msgSend(a3, "isSemanticStyleRenderingSupported");
  self->_internal->semanticStyleRenderingEnabled = objc_msgSend(a3, "isSemanticStyleRenderingEnabled");
  self->_internal->semanticStyle = (AVSemanticStyle *)(id)objc_msgSend(a3, "semanticStyle");
  self->_internal->zoomPictureInPictureOverlaySupported = objc_msgSend(a3, "isZoomPictureInPictureOverlaySupported");
  self->_internal->zoomPictureInPictureOverlayEnabled = objc_msgSend(a3, "isZoomPictureInPictureOverlayEnabled");
  internal = self->_internal;
  objc_msgSend(a3, "zoomPictureInPictureOverlayRect");
  internal->zoomPictureInPictureOverlayRect.origin.x = v11;
  internal->zoomPictureInPictureOverlayRect.origin.y = v12;
  internal->zoomPictureInPictureOverlayRect.size.width = v13;
  internal->zoomPictureInPictureOverlayRect.size.height = v14;
  self->_internal->portraitAutoSuggestEnabled = objc_msgSend(a3, "isPortraitAutoSuggestEnabled");
  self->_internal->portraitAutoSuggestSupported = objc_msgSend(a3, "isPortraitAutoSuggestSupported");
  return self;
}

- (void)dealloc
{
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v4;
  AVCaptureSession *session;
  AVCaptureVideoPreviewLayerInternal *v6;
  objc_super v7;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    session = v4->session;
    if (session)
    {
      if (!v4->isPresentationLayer)
      {
        -[AVCaptureSession _removeVideoPreviewLayer:](session, "_removeVideoPreviewLayer:", self);
        -[AVCaptureVideoPreviewLayer removeConnection:](self, "removeConnection:", self->_internal->connection);
        session = self->_internal->session;
      }

      v4 = self->_internal;
    }

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (!pthread_main_np())
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v6 = self->_internal;
    if (v6->figCaptureSession)
    {
      -[AVCaptureVideoPreviewLayer detachFromFigCaptureSession:](self, "detachFromFigCaptureSession:");
      v6 = self->_internal;
    }

    self->_internal = 0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer dealloc](&v7, sel_dealloc);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setSessionWithNoConnection:(AVCaptureSession *)session
{
  AVCaptureSession *v5;
  void *v6;
  uint64_t v7;

  if (self->_internal->session != session && (-[AVCaptureSession isEqual:](session, "isEqual:") & 1) == 0)
  {
    v5 = self->_internal->session;
    if (v5)
    {
      -[AVCaptureSession _removeVideoPreviewLayer:](v5, "_removeVideoPreviewLayer:", self);

      self->_internal->session = 0;
    }
    if (session)
    {
      self->_internal->session = session;
      v7 = 0;
      if (!-[AVCaptureSession _addVideoPreviewLayerWithNoConnection:exceptionReason:](session, "_addVideoPreviewLayerWithNoConnection:exceptionReason:", self, &v7))
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v6);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
      }
    }
  }
}

- (BOOL)isPreviewing
{
  return self->_internal->isPreviewing;
}

- (AVLayerVideoGravity)videoGravity
{
  if (self->_internal->gravity)
    return self->_internal->gravity;
  else
    return (AVLayerVideoGravity)*MEMORY[0x1E0CF2B30];
}

- (BOOL)isOrientationSupported
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureConnection *connection;
  char v9;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureConnection's -isVideoOrientationSupported"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  connection = self->_internal->connection;
  if (connection)
    v9 = -[AVCaptureConnection isVideoOrientationSupported](connection, "isVideoOrientationSupported");
  else
    v9 = 1;
  objc_sync_exit(internal);
  return v9;
}

- (AVCaptureVideoOrientation)orientation
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v8;
  AVCaptureConnection *connection;
  AVCaptureVideoOrientation orientation;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureConnection's -videoOrientation"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = self->_internal;
  connection = v8->connection;
  if (connection)
    orientation = -[AVCaptureConnection videoOrientation](connection, "videoOrientation");
  else
    orientation = v8->orientation;
  objc_sync_exit(internal);
  return orientation;
}

- (int64_t)_orientation
{
  return self->_internal->orientation;
}

- (void)setOrientation:(AVCaptureVideoOrientation)orientation
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v10;
  AVCaptureConnection *connection;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureConnection's -setVideoOrientation:"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v10 = self->_internal;
  connection = v10->connection;
  if (connection)
    -[AVCaptureConnection setVideoOrientation:](connection, "setVideoOrientation:", orientation);
  else
    v10->orientation = orientation;
  objc_sync_exit(internal);
}

- (BOOL)isMirroringSupported
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureConnection's -isVideoMirroringSupported"));
    }
  }
  return 1;
}

- (BOOL)automaticallyAdjustsMirroring
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v8;
  AVCaptureConnection *connection;
  BOOL automaticallyAdjustsMirroring;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureConnection's -automaticallyAdjustsVideoMirroring"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = self->_internal;
  connection = v8->connection;
  if (connection)
    automaticallyAdjustsMirroring = -[AVCaptureConnection automaticallyAdjustsVideoMirroring](connection, "automaticallyAdjustsVideoMirroring");
  else
    automaticallyAdjustsMirroring = v8->automaticallyAdjustsMirroring;
  objc_sync_exit(internal);
  return automaticallyAdjustsMirroring;
}

- (BOOL)_automaticallyAdjustsMirroring
{
  return self->_internal->automaticallyAdjustsMirroring;
}

- (void)setAutomaticallyAdjustsMirroring:(BOOL)automaticallyAdjustsMirroring
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v10;
  AVCaptureConnection *connection;

  v3 = automaticallyAdjustsMirroring;
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureConnection's -setAutomaticallyAdjustsVideoMirroring:"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v10 = self->_internal;
  connection = v10->connection;
  if (connection)
  {
    objc_sync_exit(internal);
    -[AVCaptureConnection setAutomaticallyAdjustsVideoMirroring:](connection, "setAutomaticallyAdjustsVideoMirroring:", v3);
  }
  else
  {
    v10->automaticallyAdjustsMirroring = v3;
    objc_sync_exit(internal);
  }
}

- (BOOL)isMirrored
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v8;
  AVCaptureConnection *connection;
  BOOL mirrored;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureConnection's -isVideoMirrored"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  v8 = self->_internal;
  connection = v8->connection;
  if (connection)
    mirrored = -[AVCaptureConnection isVideoMirrored](connection, "isVideoMirrored");
  else
    mirrored = v8->mirrored;
  objc_sync_exit(internal);
  return mirrored;
}

- (BOOL)_isMirrored
{
  return self->_internal->mirrored;
}

- (void)setMirrored:(BOOL)mirrored
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureConnection *connection;
  void *v11;

  v3 = mirrored;
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureVPLOrientationAndMirroringPropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureConnection's -setVideoMirrored:"));
    }
  }
  internal = self->_internal;
  objc_sync_enter(internal);
  connection = self->_internal->connection;
  if (connection)
  {
    objc_sync_exit(internal);
    -[AVCaptureConnection setVideoMirrored:](connection, "setVideoMirrored:", v3);
    return;
  }
  if (-[AVCaptureVideoPreviewLayer isMirroringSupported](self, "isMirroringSupported"))
  {
    if (!-[AVCaptureVideoPreviewLayer automaticallyAdjustsMirroring](self, "automaticallyAdjustsMirroring"))
    {
      self->_internal->mirrored = v3;
      goto LABEL_15;
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
  }
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
LABEL_15:
  objc_sync_exit(internal);
}

- (BOOL)isPaused
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->isPaused;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setVideoPreviewFilters:(id)a3
{
  void *v3;
  uint64_t v4;

  v4 = 0;
  if (!-[AVCaptureVideoPreviewLayer _setVideoPreviewFilters:checkForExceptionalInput:exceptionReason:](self, "_setVideoPreviewFilters:checkForExceptionalInput:exceptionReason:", a3, 1, &v4))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (BOOL)isUnoptimizedFilterRenderingEnabled
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LOBYTE(v2) = v2->_internal->unoptimizedFilterRenderingEnabled;
  objc_sync_exit(internal);
  return (char)v2;
}

- (void)setUnoptimizedFilterRenderingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = self->_internal;
  if (v6->unoptimizedFilterRenderingEnabled != v3)
  {
    v6->unoptimizedFilterRenderingEnabled = v3;
    if (!v3)
    {
      v8 = 0;
      if (!-[AVCaptureVideoPreviewLayer _filtersAreOptimized:exceptionReason:](self, "_filtersAreOptimized:exceptionReason:", self->_internal->videoPreviewFilters, &v8))
      {
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
        if (AVCaptureShouldThrowForAPIViolations())
          objc_exception_throw(v7);
        NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
      }
    }
  }
  objc_sync_exit(internal);
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_internal->semanticStyleRenderingSupported;
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_internal->semanticStyleRenderingEnabled;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v6;

  internal = self->_internal;
  if (a3)
  {
    if (internal->semanticStyleRenderingSupported)
    {
      if (internal->semanticStyleRenderingEnabled == a3)
        return;
LABEL_8:
      internal->semanticStyleRenderingEnabled = a3;
      -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
      return;
    }
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else if (internal->semanticStyleRenderingEnabled)
  {
    if (internal->semanticStyle)
    {
      -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));

      self->_internal->semanticStyle = 0;
      -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
      internal = self->_internal;
    }
    goto LABEL_8;
  }
}

- (id)semanticStyle
{
  return self->_internal->semanticStyle;
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v8;
  _QWORD v9[6];
  BOOL v10;

  internal = self->_internal;
  if (internal->semanticStyleRenderingEnabled)
  {
    if (!-[AVSemanticStyle isEqual:](internal->semanticStyle, "isEqual:"))
    {
      -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));

      self->_internal->semanticStyle = (AVSemanticStyle *)a3;
      if (!-[AVCaptureSession isBeingConfigured](-[AVCaptureVideoPreviewLayer session](self, "session"), "isBeingConfigured"))
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __56__AVCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke;
        v9[3] = &unk_1E4216848;
        v10 = a4;
        v9[4] = a3;
        v9[5] = self;
        -[AVCaptureVideoPreviewLayer performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v9);
      }
      -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

uint64_t __56__AVCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = *(void **)(result + 32);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0D03BF8];
      objc_msgSend(v4, "toneBias");
      v7 = v6;
      objc_msgSend(*(id *)(v3 + 32), "warmthBias");
      LODWORD(v9) = v8;
      LODWORD(v10) = v7;
      v11 = objc_msgSend(v5, "semanticStyleWithToneBias:warmthBias:", v10, v9);
      v12 = *MEMORY[0x1E0D044F8];
      v24[0] = v11;
      v13 = *MEMORY[0x1E0D044F0];
      v23[0] = v12;
      v23[1] = v13;
      v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v3 + 48));
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = v23;
      v17 = 2;
    }
    else
    {
      v21 = *MEMORY[0x1E0D044F0];
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v3 + 48));
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v22;
      v16 = &v21;
      v17 = 1;
    }
    v18 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
    v19 = objc_msgSend(*(id *)(v3 + 40), "sinkID");
    result = CMBaseObjectGetVTable();
    v20 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v20)
      return v20(a2, v19, *MEMORY[0x1E0D044E0], v18);
  }
  return result;
}

- (unsigned)imageQueueSlot
{
  AVCaptureVideoPreviewLayer *v2;
  AVCaptureVideoPreviewLayerInternal *internal;

  v2 = self;
  internal = self->_internal;
  objc_sync_enter(internal);
  LODWORD(v2) = v2->_internal->imageQueueSlot;
  objc_sync_exit(internal);
  return v2;
}

- (CGRect)zoomPictureInPictureOverlayRect
{
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = self->_internal;
  x = v4->zoomPictureInPictureOverlayRect.origin.x;
  y = v4->zoomPictureInPictureOverlayRect.origin.y;
  width = v4->zoomPictureInPictureOverlayRect.size.width;
  height = v4->zoomPictureInPictureOverlayRect.size.height;
  objc_sync_exit(internal);
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B90];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)removeConnection:(id)a3
{
  AVCaptureVideoPreviewLayerInternal *internal;
  void *v6;
  AVCaptureVideoPreviewLayerInternal *v7;
  AVCaptureVideoPreviewLayerInternal *v8;
  AVCaptureVideoPreviewLayerInternal *v9;

  if (a3 && objc_msgSend(a3, "isEqual:", self->_internal->connection))
  {
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connection"));
    internal = self->_internal;
    if (!internal->isPresentationLayer)
    {
      -[AVCaptureConnection removeObserver:forKeyPath:context:](internal->connection, "removeObserver:forKeyPath:context:", self, CFSTR("videoMirrored"), AVCaptureVideoPreviewLayerVideoMirroredChangedContext);
      -[AVCaptureConnection removeObserver:forKeyPath:context:](self->_internal->connection, "removeObserver:forKeyPath:context:", self, CFSTR("automaticallyAdjustsVideoMirroring"), AVCaptureVideoPreviewLayerAutomaticallyAdjustsVideoMirroringChangedContext);
      -[AVCaptureConnection removeObserver:forKeyPath:context:](self->_internal->connection, "removeObserver:forKeyPath:context:", self, CFSTR("videoOrientation"), AVCaptureVideoPreviewLayerVideoOrientationChangedContext);
      v6 = (void *)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self->_internal->connection, "inputPorts"), "firstObject"), "input");
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("simulatedAperture"), AVCaptureVideoPreviewLayerDeviceInputSimulatedApertureChangedContext);
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("portraitLightingEffectStrength"), AVCaptureVideoPreviewLayerDeviceInputPortraitLightingEffectStrengthChangedContext);
      self->_internal->orientation = objc_msgSend(a3, "_videoOrientation");
      self->_internal->automaticallyAdjustsMirroring = objc_msgSend(a3, "automaticallyAdjustsVideoMirroring");
      self->_internal->mirrored = objc_msgSend(a3, "isVideoMirrored");
      internal = self->_internal;
    }

    self->_internal->connection = 0;
    v7 = self->_internal;
    objc_sync_enter(v7);
    v8 = self->_internal;
    v8->sensorSize.width = 0.0;
    v8->sensorSize.height = 0.0;
    v9 = self->_internal;
    v9->previewSize.width = 0.0;
    v9->previewSize.height = 0.0;
    -[AVCaptureVideoPreviewLayer _updateCaptureDeviceTransform](self, "_updateCaptureDeviceTransform");
    objc_sync_exit(v7);
    -[AVCaptureVideoPreviewLayer _updateDepthDataDeliverySupported](self, "_updateDepthDataDeliverySupported");
    -[AVCaptureVideoPreviewLayer _updateSemanticStyleRenderingSupported](self, "_updateSemanticStyleRenderingSupported");
    -[AVCaptureVideoPreviewLayer _updateZoomPictureInPictureOverlaySupported](self, "_updateZoomPictureInPictureOverlaySupported");
    -[AVCaptureVideoPreviewLayer _updatePortraitAutoSuggestSupported](self, "_updatePortraitAutoSuggestSupported");
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connection"));
  }
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_internal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

void __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  const void *v4;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) != *(_QWORD *)(v2[4] + 32))
    __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke_cold_1();
  objc_msgSend(v2, "detachSafelyFromFigCaptureSession:");
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 32) = 0;
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04478], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04480], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04488], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04588], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vpl_figCaptureSessionNotification, *MEMORY[0x1E0D04598], a3);
}

- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)pointInLayer
{
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v5;
  CGFloat tx;
  CGFloat ty;
  float64x2_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  double y;
  double x;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGPoint result;

  y = pointInLayer.y;
  x = pointInLayer.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  v10 = *(_OWORD *)&v5->captureDeviceTransform.c;
  v11 = *(_OWORD *)&v5->captureDeviceTransform.a;
  tx = v5->captureDeviceTransform.tx;
  ty = v5->captureDeviceTransform.ty;
  objc_sync_exit(internal);
  *(_OWORD *)&v14.a = v11;
  *(_OWORD *)&v14.c = v10;
  v14.tx = tx;
  v14.ty = ty;
  CGAffineTransformInvert(&v15, &v14);
  v8 = vaddq_f64(*(float64x2_t *)&v15.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v15.c, y), *(float64x2_t *)&v15.a, x));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)captureDevicePointOfInterest
{
  double y;
  double x;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v7;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v14;
  double v15;
  CGPoint result;

  y = captureDevicePointOfInterest.y;
  x = captureDevicePointOfInterest.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v7 = self->_internal;
  a = v7->captureDeviceTransform.a;
  b = v7->captureDeviceTransform.b;
  c = v7->captureDeviceTransform.c;
  d = v7->captureDeviceTransform.d;
  tx = v7->captureDeviceTransform.tx;
  ty = v7->captureDeviceTransform.ty;
  objc_sync_exit(internal);
  v14 = tx + y * c + a * x;
  v15 = ty + y * d + b * x;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)_input
{
  id result;
  _OWORD v3[4];
  _BYTE v4[128];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](-[AVCaptureConnection inputPorts](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "inputPorts", 0), "countByEnumeratingWithState:objects:count:", v3, v4, 16);
  if (result)
    return (id)objc_msgSend(**((id **)&v3[0] + 1), "input");
  return result;
}

- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject
{
  id v5;
  id v7;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v9;
  __int128 v10;
  _BOOL8 v11;
  double rollAdjustment;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = -[AVMetadataObject input](metadataObject, "input");
  if (v5 != -[AVCaptureVideoPreviewLayer _input](self, "_input"))
    return 0;
  v7 = -[AVMetadataObject originalMetadataObject](metadataObject, "originalMetadataObject");
  internal = self->_internal;
  objc_sync_enter(internal);
  v9 = self->_internal;
  v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  v14 = *(_OWORD *)&v9->captureDeviceTransform.a;
  v15 = v10;
  v16 = *(_OWORD *)&v9->captureDeviceTransform.tx;
  v11 = -[AVCaptureConnection isVideoMirrored](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "isVideoMirrored");
  rollAdjustment = self->_internal->rollAdjustment;
  objc_sync_exit(internal);
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  return (AVMetadataObject *)+[AVMetadataObject derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:](AVMetadataObject, "derivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:", v7, v13, v11, rollAdjustment);
}

- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInLayerCoordinates
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGRect v13;

  height = rectInLayerCoordinates.size.height;
  width = rectInLayerCoordinates.size.width;
  y = rectInLayerCoordinates.origin.y;
  x = rectInLayerCoordinates.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v9 = self->_internal;
  v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&v9->captureDeviceTransform.a;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = *(_OWORD *)&v9->captureDeviceTransform.tx;
  objc_sync_exit(internal);
  v11 = v12;
  CGAffineTransformInvert(&v12, &v11);
  v11 = v12;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGRect v12;

  height = rectInMetadataOutputCoordinates.size.height;
  width = rectInMetadataOutputCoordinates.size.width;
  y = rectInMetadataOutputCoordinates.origin.y;
  x = rectInMetadataOutputCoordinates.origin.x;
  internal = self->_internal;
  objc_sync_enter(internal);
  v9 = self->_internal;
  v10 = *(_OWORD *)&v9->captureDeviceTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&v9->captureDeviceTransform.a;
  *(_OWORD *)&v11.c = v10;
  *(_OWORD *)&v11.tx = *(_OWORD *)&v9->captureDeviceTransform.tx;
  objc_sync_exit(internal);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (void)_updateSemanticStyleRenderingSupported
{
  int v3;
  AVCaptureVideoPreviewLayerInternal *internal;
  AVCaptureVideoPreviewLayerInternal *v5;
  int semanticStyleRenderingSupported;
  _BOOL4 semanticStyleRenderingEnabled;
  _BOOL4 v8;
  AVCaptureVideoPreviewLayerInternal *v9;

  v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](self->_internal->connection, "sourceDevice"), "activeFormat"), "isSemanticStyleRenderingSupported");
  internal = self->_internal;
  objc_sync_enter(internal);
  v5 = self->_internal;
  semanticStyleRenderingSupported = v5->semanticStyleRenderingSupported;
  if ((v3 & 1) != 0)
  {
    semanticStyleRenderingEnabled = 0;
    v8 = 0;
  }
  else
  {
    semanticStyleRenderingEnabled = v5->semanticStyleRenderingEnabled;
    v8 = v5->semanticStyle != 0;
  }
  objc_sync_exit(internal);
  if (semanticStyleRenderingSupported == v3)
  {
    if (!semanticStyleRenderingEnabled)
      goto LABEL_6;
  }
  else
  {
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
    if (!semanticStyleRenderingEnabled)
    {
LABEL_6:
      if (!v8)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
  if (v8)
LABEL_7:
    -[AVCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));
LABEL_8:
  v9 = self->_internal;
  objc_sync_enter(v9);
  self->_internal->semanticStyleRenderingSupported = v3;
  if (semanticStyleRenderingEnabled)
    self->_internal->semanticStyleRenderingEnabled = 0;
  if (!v8)
  {
    objc_sync_exit(v9);
    if (!semanticStyleRenderingEnabled)
      goto LABEL_18;
    goto LABEL_17;
  }

  self->_internal->semanticStyle = 0;
  objc_sync_exit(v9);
  -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
  if (semanticStyleRenderingEnabled)
LABEL_17:
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
LABEL_18:
  if (semanticStyleRenderingSupported != v3)
    -[AVCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
}

- (BOOL)_filtersAreOptimized:(id)a3 exceptionReason:(id *)a4
{
  AVCaptureConnection *connection;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  connection = self->_internal->connection;
  if (!connection)
    return 1;
  v7 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](connection, "sourceDevice"), "activeFormat"), "optimizedVideoPreviewFilterNames"));
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(a3);
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "name"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  objc_msgSend(v8, "minusSet:", v7);
  if (!objc_msgSend(v8, "count"))
    return 1;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The following filters are unsupported: %@"), objc_msgSend(v8, "allObjects"));
  result = 0;
  *a4 = v13;
  return result;
}

- (BOOL)_setVideoPreviewFilters:(id)a3 checkForExceptionalInput:(BOOL)a4 exceptionReason:(id *)a5
{
  AVCaptureVideoPreviewLayerInternal **p_internal;
  AVCaptureVideoPreviewLayerInternal *internal;
  BOOL depthDataDeliveryEnabled;
  NSObject *figCaptureSessionSyncQueue;
  BOOL result;
  const __CFString *v13;
  _QWORD v14[6];
  BOOL v15;
  __CFString *v16;

  v16 = 0;
  if (!a4)
  {
    p_internal = &self->_internal;
    internal = self->_internal;
    objc_sync_enter(internal);
    goto LABEL_8;
  }
  if (a3)
  {
    if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering) & 1) != 0)
    {
      p_internal = &self->_internal;
      internal = self->_internal;
      objc_sync_enter(internal);
      if (!self->_internal->unoptimizedFilterRenderingEnabled
        && !-[AVCaptureVideoPreviewLayer _filtersAreOptimized:exceptionReason:](self, "_filtersAreOptimized:exceptionReason:", a3, &v16))
      {
        objc_sync_exit(internal);
        goto LABEL_13;
      }
LABEL_8:

      (*p_internal)->videoPreviewFilters = (NSArray *)objc_msgSend(a3, "copy");
      depthDataDeliveryEnabled = (*p_internal)->depthDataDeliveryEnabled;
      objc_sync_exit(internal);
      figCaptureSessionSyncQueue = (*p_internal)->figCaptureSessionSyncQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __95__AVCaptureVideoPreviewLayer__setVideoPreviewFilters_checkForExceptionalInput_exceptionReason___block_invoke;
      v14[3] = &unk_1E421D198;
      v14[4] = self;
      v14[5] = a3;
      v15 = depthDataDeliveryEnabled;
      dispatch_sync(figCaptureSessionSyncQueue, v14);
      return 1;
    }
    v13 = CFSTR("App lacks proper entitlements");
  }
  else
  {
    v13 = CFSTR("videoPreviewFilters must be a non-nil value (empty array is permissible)");
  }
  v16 = (__CFString *)v13;
LABEL_13:
  result = 0;
  if (a5)
    *a5 = v16;
  return result;
}

_QWORD *__95__AVCaptureVideoPreviewLayer__setVideoPreviewFilters_checkForExceptionalInput_exceptionReason___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  result = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(result[4] + 32);
  if (v3)
  {
    v4 = objc_msgSend(result, "sinkID");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
      v6(v3, v4, *MEMORY[0x1E0D044C0], v5);
    result = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "count");
    if (result)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "_setSimulatedApertureFromDeviceInput");
        return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_setPortraitLightingEffectStrengthFromDeviceInput");
      }
    }
  }
  return result;
}

void __56__AVCaptureVideoPreviewLayer_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureVideoPreviewLayer attachToFigCaptureSession:]_block_invoke", "AVCaptureVideoPreviewLayer.m", 1335, "_internal->figCaptureSession == NULL");
}

void __58__AVCaptureVideoPreviewLayer_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureVideoPreviewLayer detachFromFigCaptureSession:]_block_invoke", "AVCaptureVideoPreviewLayer.m", 1358, "figCaptureSession == _internal->figCaptureSession");
}

@end
