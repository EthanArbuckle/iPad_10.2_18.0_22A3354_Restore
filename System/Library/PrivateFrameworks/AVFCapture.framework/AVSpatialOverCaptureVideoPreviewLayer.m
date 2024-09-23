@implementation AVSpatialOverCaptureVideoPreviewLayer

- (id)semanticStyle
{
  return -[NSArray firstObject](self->_semanticStyles, "firstObject");
}

- (void)didUpdatePreviewImageQueueSlot:(unsigned int)a3 imageQueue:(id)a4 rotationDegrees:(double)a5 size:(CGSize)a6
{
  double height;
  double width;
  uint64_t v10;
  objc_super v12;

  height = a6.height;
  width = a6.width;
  v10 = *(_QWORD *)&a3;
  -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentSize"));
  self->_contentSize.width = width;
  self->_contentSize.height = height;
  -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentSize"));
  v12.receiver = self;
  v12.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer didUpdatePreviewImageQueueSlot:imageQueue:rotationDegrees:size:](&v12, sel_didUpdatePreviewImageQueueSlot_imageQueue_rotationDegrees_size_, v10, a4, a5, width, height);
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  return -[AVCaptureVideoPreviewLayer addConnection:error:](&v5, sel_addConnection_error_, a3, a4);
}

- (void)layoutSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double width;
  CGFloat height;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double MaxY;
  double v20;
  double v21;
  __int128 v22;
  objc_super v23;
  CGSize v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer layoutSublayers](&v23, sel_layoutSublayers);
  if (self->_automaticallyDimsOverCaptureRegion)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v22 = *MEMORY[0x1E0C9D538];
    v21 = 0.0;
    -[AVSpatialOverCaptureVideoPreviewLayer getPrimaryCaptureRectCenter:aspectRatio:uniqueID:](self, "getPrimaryCaptureRectCenter:aspectRatio:uniqueID:", &v22, &v21, 0);
    -[AVSpatialOverCaptureVideoPreviewLayer bounds](self, "bounds");
    *((double *)&v22 + 1) = *((double *)&v22 + 1) * v3;
    -[AVSpatialOverCaptureVideoPreviewLayer bounds](self, "bounds");
    v4 = v21;
    *(double *)&v22 = *(double *)&v22 * v5;
    -[AVSpatialOverCaptureVideoPreviewLayer bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v24.width = 1.0;
    v24.height = v4;
    v27.origin.x = v7;
    v27.origin.y = v9;
    v27.size.width = v11;
    v27.size.height = v13;
    v25 = AVMakeRectWithAspectRatioInsideRect(v24, v27);
    width = v25.size.width;
    height = v25.size.height;
    v16 = *((double *)&v22 + 1) - v25.size.width * 0.5;
    v17 = *(double *)&v22 - v25.size.height * 0.5;
    v18 = *MEMORY[0x1E0C9D648];
    v25.origin.x = v16;
    v25.origin.y = v17;
    -[CALayer setFrame:](self->_topDimmingOverlay, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v25.size.width, CGRectGetMinY(v25));
    v26.origin.x = v16;
    v26.origin.y = v17;
    v26.size.width = width;
    v26.size.height = height;
    MaxY = CGRectGetMaxY(v26);
    -[AVSpatialOverCaptureVideoPreviewLayer bounds](self, "bounds");
    -[CALayer setFrame:](self->_bottomDimmingOverlay, "setFrame:", v18, MaxY, width, v20 - MaxY);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setAutomaticallyDimsOverCaptureRegion:(BOOL)a3
{
  _BOOL4 v3;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v6;
  CGColorRef v7;
  CFTypeRef v8;
  CALayer *v9;
  CALayer *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_automaticallyDimsOverCaptureRegion != a3)
  {
    v3 = a3;
    self->_automaticallyDimsOverCaptureRegion = a3;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (v3)
    {
      v11 = 0u;
      v12 = 0u;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v6 = (CGColorSpace *)CFAutorelease(DeviceRGB);
      v7 = CGColorCreate(v6, (const CGFloat *)&v11);
      v8 = CFAutorelease(v7);
      v9 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer", v11, v12);
      self->_topDimmingOverlay = v9;
      -[CALayer setBackgroundColor:](v9, "setBackgroundColor:", v8);
      -[AVSpatialOverCaptureVideoPreviewLayer addSublayer:](self, "addSublayer:", self->_topDimmingOverlay);
      v10 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      self->_bottomDimmingOverlay = v10;
      -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", v8);
      -[AVSpatialOverCaptureVideoPreviewLayer addSublayer:](self, "addSublayer:", self->_bottomDimmingOverlay);
    }
    else
    {
      -[CALayer removeFromSuperlayer](self->_topDimmingOverlay, "removeFromSuperlayer");
      self->_topDimmingOverlay = 0;
      -[CALayer removeFromSuperlayer](self->_bottomDimmingOverlay, "removeFromSuperlayer");
      self->_bottomDimmingOverlay = 0;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)_updateSemanticStyleRenderingSupported
{
  int v3;
  int semanticStyleRenderingSupported;
  _BOOL4 semanticStyleRenderingEnabled;
  _BOOL4 v6;

  v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "sourceDevice"), "activeFormat"), "isSemanticStyleRenderingSupported");
  objc_sync_enter(self);
  semanticStyleRenderingSupported = self->_semanticStyleRenderingSupported;
  if ((v3 & 1) != 0)
  {
    semanticStyleRenderingEnabled = 0;
    v6 = 0;
  }
  else
  {
    semanticStyleRenderingEnabled = self->_semanticStyleRenderingEnabled;
    v6 = -[NSArray count](self->_semanticStyles, "count") != 0;
  }
  objc_sync_exit(self);
  if (semanticStyleRenderingSupported == v3)
  {
    if (!semanticStyleRenderingEnabled)
      goto LABEL_6;
  }
  else
  {
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
    if (!semanticStyleRenderingEnabled)
    {
LABEL_6:
      if (!v6)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
  -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxSemanticStyles"));
  if (v6)
  {
LABEL_7:
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyles"));
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStylesRegions"));
  }
LABEL_8:
  objc_sync_enter(self);
  self->_semanticStyleRenderingSupported = v3;
  if (semanticStyleRenderingEnabled)
  {
    self->_semanticStyleRenderingEnabled = 0;
    self->_maxSemanticStyles = 0;
  }
  if (!v6)
  {
    objc_sync_exit(self);
    if (!semanticStyleRenderingEnabled)
      goto LABEL_18;
    goto LABEL_17;
  }

  self->_semanticStyles = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  self->_semanticStylesRegions = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_sync_exit(self);
  -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStylesRegions"));
  -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyles"));
  -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
  if (semanticStyleRenderingEnabled)
  {
LABEL_17:
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxSemanticStyles"));
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingEnabled"));
  }
LABEL_18:
  if (semanticStyleRenderingSupported != v3)
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyleRenderingSupported"));
}

- (CGAffineTransform)captureDeviceTransformForSensorSize:(SEL)a3 previewSize:(CGSize)a4 sensorToPreviewVTScalingMode:(CGSize)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v12;
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  double v19;
  CGFloat v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v32;
  objc_super v33;
  CGAffineTransform v34;
  double v35;
  __int128 v36;

  height = a5.height;
  width = a5.width;
  v8 = a4.height;
  v9 = a4.width;
  v36 = *MEMORY[0x1E0C9D538];
  v35 = 0.0;
  -[AVSpatialOverCaptureVideoPreviewLayer getPrimaryCaptureRectCenter:aspectRatio:uniqueID:](self, "getPrimaryCaptureRectCenter:aspectRatio:uniqueID:", &v36, &v35, 0);
  v12 = width / height;
  memset(&v34, 0, sizeof(v34));
  v13 = *MEMORY[0x1E0CEDB38];
  v33.receiver = self;
  v33.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  v14 = v9 / v8;
  -[CGAffineTransform captureDeviceTransformForSensorSize:previewSize:sensorToPreviewVTScalingMode:](&v33, sel_captureDeviceTransformForSensorSize_previewSize_sensorToPreviewVTScalingMode_, v13, v9, v8, width, height);
  v15 = *MEMORY[0x1E0C9BAA8];
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v32.c = v16;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v32.tx = v17;
  v18 = v35;
  if (v35 > 0.0 && v35 != v14)
  {
    v23 = v16;
    v24 = v15;
    if (v35 <= v12)
      v19 = width / height;
    else
      v19 = v35;
    if (v35 >= v12)
      v18 = width / height;
    if (v12 <= v14)
      v18 = v9 / v8;
    else
      v19 = v9 / v8;
    v20 = fmax(v18 / v19, 1.0);
    v22 = v17;
    CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
    *(_OWORD *)&t1.a = v24;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = v22;
    CGAffineTransformConcat(&v32, &t1, &t2);
    CGAffineTransformMakeScale(&v29, v20, v20);
    v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v29);
    v32 = t1;
    CGAffineTransformMakeTranslation(&v27, 0.5, 0.5);
    v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v27);
    v17 = v22;
    v16 = v23;
    v32 = t1;
    v15 = v24;
  }
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = v17;
  if (*(double *)&v36 != 0.5 || *((double *)&v36 + 1) != 0.5)
    CGAffineTransformMakeTranslation(&t1, fmax(v12 / v14, 1.0) * (*(double *)&v36 + -0.5), fmax(1.0 / (v12 / v14), 1.0) * (*((double *)&v36 + 1) + -0.5));
  v28 = v32;
  v25 = t1;
  CGAffineTransformConcat(&v26, &v28, &v25);
  v28 = v34;
  return CGAffineTransformConcat(retstr, &v26, &v28);
}

- (void)getPrimaryCaptureRectCenter:(CGPoint *)a3 aspectRatio:(double *)a4 uniqueID:(int64_t *)a5
{
  os_unfair_lock_s *p_primaryCaptureRectLock;
  double primaryCaptureRectAspectRatio;
  int64_t primaryCaptureRectUniqueID;
  CGPoint primaryCaptureRectCenterPoint;

  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  primaryCaptureRectCenterPoint = self->_primaryCaptureRectCenterPoint;
  primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  if (a3)
    *a3 = primaryCaptureRectCenterPoint;
  if (a4)
    *a4 = primaryCaptureRectAspectRatio;
  if (a5)
    *a5 = primaryCaptureRectUniqueID;
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_semanticStyleRenderingSupported;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  double primaryCaptureRectAspectRatio;
  double x;
  double y;
  double primaryCaptureRectTransitionPercentComplete;
  int64_t primaryCaptureRectUniqueID;
  uint64_t v10;
  id v11;
  void (*v12)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t);
  void *v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer attachSafelyToFigCaptureSession:](&v15, sel_attachSafelyToFigCaptureSession_);
  if (a3)
  {
    if (self->_havePendingPrimaryCaptureRectChange)
    {
      self->_havePendingPrimaryCaptureRectChange = 0;
      os_unfair_lock_lock(&self->_primaryCaptureRectLock);
      primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
      x = self->_primaryCaptureRectCenterPoint.x;
      y = self->_primaryCaptureRectCenterPoint.y;
      primaryCaptureRectTransitionPercentComplete = self->_primaryCaptureRectTransitionPercentComplete;
      primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
      os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
      v16[0] = *MEMORY[0x1E0D04490];
      v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", primaryCaptureRectAspectRatio);
      v16[1] = *MEMORY[0x1E0D044A0];
      v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
      v16[2] = *MEMORY[0x1E0D044A8];
      v17[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
      v16[3] = *MEMORY[0x1E0D044B0];
      v17[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", primaryCaptureRectTransitionPercentComplete);
      v16[4] = *MEMORY[0x1E0D044B8];
      v17[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", primaryCaptureRectUniqueID);
      v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
      v11 = -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID");
      v12 = *(void (**)(OpaqueFigCaptureSession *, id, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 8);
      if (v12)
        v12(a3, v11, *MEMORY[0x1E0D044D8], v10);
    }
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v14 = -[AVCaptureVideoPreviewLayer weakReference](self, "weakReference");
  objc_msgSend(v13, "addListenerWithWeakReference:callback:name:object:flags:", v14, socvpl_figCaptureSessionNotification, *MEMORY[0x1E0D04590], a3, 0);
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  int v7;
  BOOL v8;
  BOOL v9;
  int v10;
  char v11;
  void *v12;
  _QWORD v13[6];
  BOOL v14;
  CGRect v15;
  CGRect v16;

  if (!-[AVSpatialOverCaptureVideoPreviewLayer isSemanticStyleRenderingEnabled](self, "isSemanticStyleRenderingEnabled"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
    return;
  }
  if (objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStyles](self, "semanticStyles"), "count") != 1
    || objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStylesRegions](self, "semanticStylesRegions"), "count") != 1)
  {
    v9 = 0;
    goto LABEL_12;
  }
  v7 = objc_msgSend((id)objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStyles](self, "semanticStyles"), "firstObject"), "isEqual:", a3);
  v15.origin.x = vpl_valueToRect((void *)objc_msgSend(-[AVSpatialOverCaptureVideoPreviewLayer semanticStylesRegions](self, "semanticStylesRegions"), "firstObject"));
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v8 = CGRectEqualToRect(v15, v16);
  v9 = v8;
  if (v7 && v8)
    return;
  if ((v7 & 1) == 0)
  {
LABEL_12:
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyles"));

    self->_semanticStyles = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a3, 0);
    v10 = 1;
    v11 = 1;
    if (v9)
      goto LABEL_14;
LABEL_13:
    -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStylesRegions"));

    v11 = 0;
    self->_semanticStylesRegions = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", vpl_rectToValue(0.0, 0.0, 1.0, 1.0), 0);
    goto LABEL_14;
  }
  v10 = 0;
  if (!v8)
    goto LABEL_13;
  v11 = 1;
LABEL_14:
  if (-[AVCaptureSession isBeingConfigured](-[AVCaptureVideoPreviewLayer session](self, "session"), "isBeingConfigured"))
  {
    if ((v11 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke;
    v13[3] = &unk_1E4216848;
    v14 = a4;
    v13[4] = a3;
    v13[5] = self;
    -[AVCaptureVideoPreviewLayer performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v13);
    if ((v11 & 1) != 0)
    {
LABEL_16:
      if (!v10)
        return;
      goto LABEL_17;
    }
  }
  -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStylesRegions"));
  if (v10)
  {
LABEL_17:
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyles"));
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
  }
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (id)semanticStyles
{
  return self->_semanticStyles;
}

- (id)semanticStylesRegions
{
  return self->_semanticStylesRegions;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  BOOL *p_semanticStyleRenderingEnabled;
  NSUInteger v6;
  void *v7;

  if (a3)
  {
    if (self->_semanticStyleRenderingSupported)
    {
      p_semanticStyleRenderingEnabled = &self->_semanticStyleRenderingEnabled;
      if (self->_semanticStyleRenderingEnabled != a3)
      {
        -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxSemanticStyles"));
        self->_maxSemanticStyles = 3;
LABEL_12:
        -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("maxSemanticStyles"));
        *p_semanticStyleRenderingEnabled = a3;
        -[AVCaptureVideoPreviewLayer bumpChangeSeed](self, "bumpChangeSeed");
      }
    }
    else
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v7);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    }
  }
  else
  {
    p_semanticStyleRenderingEnabled = &self->_semanticStyleRenderingEnabled;
    if (self->_semanticStyleRenderingEnabled)
    {
      v6 = -[NSArray count](self->_semanticStyles, "count");
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("maxSemanticStyles"));
      if (v6)
      {
        -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));
        -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyles"));
        -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStylesRegions"));

        self->_semanticStyles = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        self->_semanticStylesRegions = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        self->_maxSemanticStyles = 0;
        -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStylesRegions"));
        -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyles"));
        -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
      }
      else
      {
        self->_maxSemanticStyles = 0;
      }
      goto LABEL_12;
    }
  }
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4
{
  -[AVSpatialOverCaptureVideoPreviewLayer _setPrimaryCaptureRectAspectRatio:centerPoint:transitionPercentComplete:](self, "_setPrimaryCaptureRectAspectRatio:centerPoint:transitionPercentComplete:", a3, a4.x, a4.y, 0.0);
}

- (id)_initWithSession:(id)a3 makeConnection:(BOOL)a4
{
  _DWORD *v4;
  _BYTE *v5;
  __int128 v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  v4 = -[AVCaptureVideoPreviewLayer _initWithSession:makeConnection:](&v14, sel__initWithSession_makeConnection_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4[10] = 0;
    __asm { FMOV            V0.2D, #0.5 }
    *((_OWORD *)v4 + 3) = _Q0;
    *((_QWORD *)v4 + 8) = 0x3FF5555555555555;
    *((_QWORD *)v4 + 10) = objc_msgSend((id)objc_opt_class(), "uniqueID");
    v5[176] = 1;
    *((_QWORD *)v5 + 16) = 0;
    *((_QWORD *)v5 + 17) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v5 + 9) = _Q0;
    v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *((_OWORD *)v5 + 6) = *MEMORY[0x1E0C9D648];
    *((_OWORD *)v5 + 7) = v12;
    objc_msgSend(v5, "setAutomaticallyDimsOverCaptureRegion:", 1);
    *((_QWORD *)v5 + 29) = objc_alloc_init(MEMORY[0x1E0C99D20]);
    *((_QWORD *)v5 + 30) = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return v5;
}

+ (int64_t)uniqueID
{
  unint64_t v2;
  int64_t result;

  do
  {
    v2 = __ldxr(&uniqueID_sPrimaryCaptureRectUniqueID);
    result = v2 + 1;
  }
  while (__stxr(v2 + 1, &uniqueID_sPrimaryCaptureRectUniqueID));
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
}

- (void)_handleSpatialNotification:(id)a3 payload:(id)a4
{
  int64_t v7;
  double v8;
  CGFloat v9;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v11;
  CGColorRef v12;
  CFTypeRef v13;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqualToString:", -[AVCaptureVideoPreviewLayer sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04590]))
    {
      v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04470]), "integerValue");
      if (v7 != -[AVSpatialOverCaptureVideoPreviewLayer overCaptureStatus](self, "overCaptureStatus"))
      {
        -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overCaptureStatus"));
        os_unfair_lock_lock(&self->_primaryCaptureRectLock);
        self->_overCaptureStatus = v7;
        os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
        -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overCaptureStatus"));
        if (self->_automaticallyDimsOverCaptureRegion)
        {
          if ((objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureVideoPreviewLayer connection](self, "connection"), "sourceDevice"), "isRampingVideoZoom") & 1) != 0)
          {
            v8 = 0.4;
          }
          else if (CFAbsoluteTimeGetCurrent() - self->_lastAspectCenterUpdateTime >= 0.3)
          {
            v8 = 3.0;
          }
          else
          {
            v8 = 0.4;
          }
          v9 = 0.0;
          if ((unint64_t)(v7 - 2) <= 3)
            v9 = dbl_19EEEA0D8[v7 - 2];
          memset(components, 0, 24);
          components[3] = v9;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v11 = (CGColorSpace *)CFAutorelease(DeviceRGB);
          v12 = CGColorCreate(v11, components);
          v13 = CFAutorelease(v12);
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v8);
          -[CALayer setBackgroundColor:](self->_topDimmingOverlay, "setBackgroundColor:", v13);
          -[CALayer setBackgroundColor:](self->_bottomDimmingOverlay, "setBackgroundColor:", v13);
          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        }
      }
    }
  }
}

- (int64_t)overCaptureStatus
{
  os_unfair_lock_s *p_primaryCaptureRectLock;
  int64_t overCaptureStatus;

  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  overCaptureStatus = self->_overCaptureStatus;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return overCaptureStatus;
}

- (AVSpatialOverCaptureVideoPreviewLayer)initWithLayer:(id)a3
{
  AVSpatialOverCaptureVideoPreviewLayer *v5;
  AVSpatialOverCaptureVideoPreviewLayer *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  int64_t v16;
  double v17;
  CGPoint v18;
  objc_super v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
    v5 = -[AVCaptureVideoPreviewLayer initWithLayer:](&v19, sel_initWithLayer_, a3);
    v6 = v5;
    if (v5)
    {
      v5->_isPresentationLayer = 1;
      v5->_primaryCaptureRectLock._os_unfair_lock_opaque = 0;
      v18 = (CGPoint)*MEMORY[0x1E0C9D538];
      v16 = 0;
      v17 = 0.0;
      objc_msgSend(a3, "getPrimaryCaptureRectCenter:aspectRatio:uniqueID:", &v18, &v17, &v16);
      v6->_primaryCaptureRectCenterPoint = v18;
      v6->_primaryCaptureRectAspectRatio = v17;
      v6->_primaryCaptureRectUniqueID = v16;
      objc_msgSend(a3, "primaryCaptureRect");
      v6->_primaryCaptureRect.origin.x = v7;
      v6->_primaryCaptureRect.origin.y = v8;
      v6->_primaryCaptureRect.size.width = v9;
      v6->_primaryCaptureRect.size.height = v10;
      objc_msgSend(a3, "overCaptureRect");
      v6->_overCaptureRect.origin.x = v11;
      v6->_overCaptureRect.origin.y = v12;
      v6->_overCaptureRect.size.width = v13;
      v6->_overCaptureRect.size.height = v14;
      v6->_primaryAndOverCaptureCompositingEnabled = objc_msgSend(a3, "isPrimaryAndOverCaptureCompositingEnabled");
      -[AVSpatialOverCaptureVideoPreviewLayer setAutomaticallyDimsOverCaptureRegion:](v6, "setAutomaticallyDimsOverCaptureRegion:", objc_msgSend(a3, "automaticallyDimsOverCaptureRegion"));
      v6->_semanticStyleRenderingSupported = objc_msgSend(a3, "isSemanticStyleRenderingSupported");
      v6->_semanticStyleRenderingEnabled = objc_msgSend(a3, "isSemanticStyleRenderingEnabled");
      v6->_semanticStyles = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "semanticStyles"), "copy");
      v6->_semanticStylesRegions = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "semanticStylesRegions"), "copy");
      v6->_maxSemanticStyles = objc_msgSend(a3, "maxSemanticStyles");
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_semanticStyles = 0;
  self->_semanticStylesRegions = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer dealloc](&v3, sel_dealloc);
}

- (void)_setPrimaryCaptureRectAspectRatio:(double)a3 centerPoint:(CGPoint)a4 transitionPercentComplete:(double)a5
{
  double y;
  double x;
  double primaryCaptureRectAspectRatio;
  _BOOL4 v11;
  int64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[11];

  y = a4.y;
  x = a4.x;
  self->_lastAspectCenterUpdateTime = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  v11 = y != self->_primaryCaptureRectCenterPoint.y || x != self->_primaryCaptureRectCenterPoint.x;
  os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
  if (primaryCaptureRectAspectRatio != a3 || v11)
  {
    if (primaryCaptureRectAspectRatio != a3)
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryCaptureRectAspectRatio"));
    if (v11)
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("primaryCaptureRectCenterPoint"));
    os_unfair_lock_lock(&self->_primaryCaptureRectLock);
    self->_primaryCaptureRectAspectRatio = a3;
    self->_primaryCaptureRectCenterPoint.x = x;
    self->_primaryCaptureRectCenterPoint.y = y;
    self->_primaryCaptureRectTransitionPercentComplete = a5;
    v13 = objc_msgSend((id)objc_opt_class(), "uniqueID");
    self->_primaryCaptureRectUniqueID = v13;
    os_unfair_lock_unlock(&self->_primaryCaptureRectLock);
    if (!-[AVCaptureSession isBeingConfiguredOnCurrentThread](-[AVCaptureVideoPreviewLayer session](self, "session"), "isBeingConfiguredOnCurrentThread"))
    {
      if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
      {
        v14 = (void *)-[AVSpatialOverCaptureVideoPreviewLayer context](self, "context");
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03BD0]), "initWithPort:", objc_msgSend(v14, "createFencePort"));
        objc_msgSend(v14, "setFencePort:", objc_msgSend(v15, "port"));
      }
      else
      {
        v15 = 0;
      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __113__AVSpatialOverCaptureVideoPreviewLayer__setPrimaryCaptureRectAspectRatio_centerPoint_transitionPercentComplete___block_invoke;
      v16[3] = &unk_1E42167F8;
      *(double *)&v16[6] = a3;
      *(double *)&v16[7] = x;
      *(double *)&v16[8] = y;
      *(double *)&v16[9] = a5;
      v16[10] = v13;
      v16[4] = v15;
      v16[5] = self;
      -[AVCaptureVideoPreviewLayer performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v16);

    }
    -[AVCaptureVideoPreviewLayer setCaptureDeviceTransformNeedsUpdate](self, "setCaptureDeviceTransformNeedsUpdate");
    if (v11)
      -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryCaptureRectCenterPoint"));
    if (primaryCaptureRectAspectRatio != a3)
      -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("primaryCaptureRectAspectRatio"));
  }
  if (self->_automaticallyDimsOverCaptureRegion)
  {
    -[AVSpatialOverCaptureVideoPreviewLayer setNeedsLayout](self, "setNeedsLayout");
    -[AVSpatialOverCaptureVideoPreviewLayer layoutIfNeeded](self, "layoutIfNeeded");
  }
}

void __113__AVSpatialOverCaptureVideoPreviewLayer__setPrimaryCaptureRectAspectRatio_centerPoint_transitionPercentComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, _QWORD, id);
  uint64_t v12;
  id v13;

  if (a2)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D04490]);
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D044A0]);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D044A8]);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D044B0]);
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D044B8]);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D04498]);
    v10 = objc_msgSend(*(id *)(a1 + 40), "sinkID");
    v11 = *(void (**)(uint64_t, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v11)
      v11(a2, v10, *MEMORY[0x1E0D044D8], v13);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v12 + 88))
      *(_BYTE *)(v12 + 88) = 1;
  }
}

- (BOOL)isPrimaryAndOverCaptureCompositingEnabled
{
  return self->_primaryAndOverCaptureCompositingEnabled;
}

- (void)setPrimaryAndOverCaptureCompositingEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_primaryAndOverCaptureCompositingEnabled != a3)
  {
    self->_primaryAndOverCaptureCompositingEnabled = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __84__AVSpatialOverCaptureVideoPreviewLayer_setPrimaryAndOverCaptureCompositingEnabled___block_invoke;
    v3[3] = &unk_1E4216820;
    v3[4] = self;
    v4 = a3;
    -[AVCaptureVideoPreviewLayer performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v3);
  }
}

uint64_t __84__AVSpatialOverCaptureVideoPreviewLayer_setPrimaryAndOverCaptureCompositingEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v3 + 40));
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D044D0], v5);
  }
  return result;
}

- (CGPoint)primaryCaptureRectCenterPoint
{
  os_unfair_lock_s *p_primaryCaptureRectLock;
  CGFloat x;
  CGFloat y;
  double v6;
  double v7;
  CGPoint result;

  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  x = self->_primaryCaptureRectCenterPoint.x;
  y = self->_primaryCaptureRectCenterPoint.y;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  v6 = x;
  v7 = y;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)primaryCaptureRectAspectRatio
{
  os_unfair_lock_s *p_primaryCaptureRectLock;
  double primaryCaptureRectAspectRatio;

  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  primaryCaptureRectAspectRatio = self->_primaryCaptureRectAspectRatio;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return primaryCaptureRectAspectRatio;
}

- (int64_t)primaryCaptureRectUniqueID
{
  os_unfair_lock_s *p_primaryCaptureRectLock;
  int64_t primaryCaptureRectUniqueID;

  p_primaryCaptureRectLock = &self->_primaryCaptureRectLock;
  os_unfair_lock_lock(&self->_primaryCaptureRectLock);
  primaryCaptureRectUniqueID = self->_primaryCaptureRectUniqueID;
  os_unfair_lock_unlock(p_primaryCaptureRectLock);
  return primaryCaptureRectUniqueID;
}

- (BOOL)automaticallyDimsOverCaptureRegion
{
  return self->_automaticallyDimsOverCaptureRegion;
}

- (int64_t)maxSemanticStyles
{
  return self->_maxSemanticStyles;
}

uint64_t __67__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyle_animated___block_invoke(uint64_t result, uint64_t a2)
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

- (void)setSemanticStyles:(id)a3 semanticStylesRegions:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  char v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[6];
  CGRect v42;
  CGRect v43;

  if (!-[AVSpatialOverCaptureVideoPreviewLayer isSemanticStyleRenderingEnabled](self, "isSemanticStyleRenderingEnabled"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    goto LABEL_28;
  }
  v7 = objc_msgSend(a3, "count");
  if (v7 != objc_msgSend(a4, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    goto LABEL_28;
  }
  if (!objc_msgSend(a3, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    goto LABEL_28;
  }
  v8 = objc_msgSend(a3, "count");
  if (v8 <= -[AVSpatialOverCaptureVideoPreviewLayer maxSemanticStyles](self, "maxSemanticStyles"))
  {
    if (objc_msgSend(a4, "count") != 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = v14++;
        if (v14 < objc_msgSend(a4, "count"))
          break;
LABEL_25:
        if (v14 >= objc_msgSend(a4, "count") - 1)
          goto LABEL_10;
      }
      v16 = v14;
      while (1)
      {
        v17 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v16);
        v19 = vpl_valueToRect(v17);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v26 = vpl_valueToRect(v18);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v42.origin.x = v19;
        v42.origin.y = v21;
        v42.size.width = v23;
        v42.size.height = v25;
        v43.origin.x = v26;
        v43.origin.y = v28;
        v43.size.width = v30;
        v43.size.height = v32;
        if (CGRectIntersectsRect(v42, v43))
          break;
        if (++v16 >= objc_msgSend(a4, "count"))
          goto LABEL_25;
      }
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = vpl_rectToString(v19, v21, v23, v25);
      objc_msgSend(v33, "stringWithFormat:", CFSTR("Region %d (%@) and region %d (%@) may not overlap"), v15, v34, v16, vpl_rectToString(v26, v28, v30, v32));
      goto LABEL_28;
    }
LABEL_10:
    v11 = -[NSArray isEqual:](self->_semanticStyles, "isEqual:", a3);
    v12 = -[NSArray isEqual:](self->_semanticStylesRegions, "isEqual:", a4);
    v13 = v12;
    if (v11 && (v12 & 1) != 0)
      return;
    if ((v11 & 1) == 0)
    {
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyle"));
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStyles"));

      self->_semanticStyles = (NSArray *)objc_msgSend(a3, "copy");
    }
    if ((v13 & 1) == 0)
    {
      -[AVSpatialOverCaptureVideoPreviewLayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("semanticStylesRegions"));

      self->_semanticStylesRegions = (NSArray *)objc_msgSend(a4, "copy");
    }
    if (-[AVCaptureSession isBeingConfigured](-[AVCaptureVideoPreviewLayer session](self, "session"), "isBeingConfigured"))
    {
      if ((v13 & 1) != 0)
        goto LABEL_18;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
      {
        v36 = (void *)-[AVSpatialOverCaptureVideoPreviewLayer context](self, "context");
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03BD0]), "initWithPort:", objc_msgSend(v36, "createFencePort"));
        objc_msgSend(v36, "setFencePort:", objc_msgSend(v37, "port"));
      }
      else
      {
        v37 = 0;
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __81__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyles_semanticStylesRegions___block_invoke;
      v41[3] = &unk_1E4216870;
      v41[4] = self;
      v41[5] = v37;
      -[AVCaptureVideoPreviewLayer performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v41);

      if ((v13 & 1) != 0)
      {
LABEL_18:
        if ((v11 & 1) != 0)
          return;
        goto LABEL_36;
      }
    }
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStylesRegions"));
    if ((v11 & 1) != 0)
      return;
LABEL_36:
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyles"));
    -[AVSpatialOverCaptureVideoPreviewLayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("semanticStyle"));
    return;
  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("May only pass up to %d semantic styles and regions"), -[AVSpatialOverCaptureVideoPreviewLayer maxSemanticStyles](self, "maxSemanticStyles"), v38, v39, v40);
LABEL_28:
  v35 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v35);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v35);
}

void __81__AVSpatialOverCaptureVideoPreviewLayer_setSemanticStyles_semanticStylesRegions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, _QWORD, id);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0D03BF8];
          objc_msgSend(v10, "toneBias");
          v13 = v12;
          objc_msgSend(v10, "warmthBias");
          LODWORD(v15) = v14;
          LODWORD(v16) = v13;
          objc_msgSend(v4, "addObject:", objc_msgSend(v11, "semanticStyleWithToneBias:warmthBias:", v16, v15));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }
    v17 = objc_msgSend(MEMORY[0x1E0D03C00], "semanticStyleSetWithSemanticStyles:regions:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
    if (v17)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D04500]);
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D04498]);
    v19 = objc_msgSend(*(id *)(a1 + 32), "sinkID");
    v20 = *(void (**)(uint64_t, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v20)
      v20(a2, v19, *MEMORY[0x1E0D044E0], v21);

  }
}

- (BOOL)performContentUpdates:(id)a3
{
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  return 0;
}

- (void)removeConnection:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer removeConnection:](&v3, sel_removeConnection_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  id v6;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v6 = -[AVCaptureVideoPreviewLayer weakReference](self, "weakReference");
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, socvpl_figCaptureSessionNotification, *MEMORY[0x1E0D04590], a3);
  v7.receiver = self;
  v7.super_class = (Class)AVSpatialOverCaptureVideoPreviewLayer;
  -[AVCaptureVideoPreviewLayer detachSafelyFromFigCaptureSession:](&v7, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (CGRect)primaryCaptureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryCaptureRect.origin.x;
  y = self->_primaryCaptureRect.origin.y;
  width = self->_primaryCaptureRect.size.width;
  height = self->_primaryCaptureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)overCaptureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_overCaptureRect.origin.x;
  y = self->_overCaptureRect.origin.y;
  width = self->_overCaptureRect.size.width;
  height = self->_overCaptureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
