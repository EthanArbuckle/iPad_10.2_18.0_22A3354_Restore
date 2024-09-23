@implementation _GCAppleTVRemoteControllerProfile

- (void)setOwner:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[5];

  if (self->_owner != a3)
  {
    -[GCPhysicalInputProfile _motion](self, "_motion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setGravity:", 0.0, 0.0, -1.0);

    -[GCPhysicalInputProfile _motion](self, "_motion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setUserAcceleration:", 0.0, 0.0, 0.0);

    -[GCPhysicalInputProfile _motion](self, "_motion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAttitude:", 0.0, 0.0, 0.0, 1.0);

    -[GCPhysicalInputProfile _motion](self, "_motion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setRotationRate:", 0.0, 0.0, 0.0);

    -[GCPhysicalInputProfile _motion](self, "_motion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueChangedHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[GCPhysicalInputProfile controller](self, "controller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handlerQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_6;
      -[GCPhysicalInputProfile controller](self, "controller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handlerQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke;
      block[3] = &unk_24D2B2B20;
      block[4] = self;
      dispatch_async(v14, block);

    }
LABEL_6:
    -[GCPhysicalInputProfile _motion](self, "_motion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internalValueChangedHandler");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[GCPhysicalInputProfile controller](self, "controller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handlerQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_10:
        self->_owner = a3;
        return;
      }
      -[GCPhysicalInputProfile controller](self, "controller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handlerQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke_2;
      v21[3] = &unk_24D2B2B20;
      v21[4] = self;
      dispatch_async(v20, v21);

    }
    goto LABEL_10;
  }
}

- (BOOL)ownershipClaimingElementsZero
{
  void *v3;
  float v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  BOOL v13;

  -[GCMicroGamepad buttonA](self, "buttonA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  if (v4 == 0.0)
  {
    -[GCMicroGamepad buttonX](self, "buttonX");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    if (v6 == 0.0)
    {
      -[GCMicroGamepad dpad](self, "dpad");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "xAxis");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      if (v9 == 0.0)
      {
        -[GCMicroGamepad dpad](self, "dpad");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "yAxis");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v13 = v12 == 0.0;

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)sampleRate
{
  return self->_sampleCount;
}

- (void)handleReport:(unsigned int)a3 data:(id)a4
{
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  id v12;

  if (a3 == 226)
  {
    v5 = objc_msgSend(objc_retainAutorelease(a4), "bytes");
    v6 = (unsigned __int16)(*(_WORD *)(v5 + 10) << 7);
    if (8 * *(_WORD *)(v5 + 8))
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = v5;
      v9 = NormalizedLogicalAxisValueRaw((double)(__int16)(8 * *(_WORD *)(v5 + 8)) / 10240.0, -0.5, 0.5);
      v10 = NormalizedLogicalAxisValueRaw((double)v6 / 10240.0, 2.7, 5.0);
      if (*(_WORD *)(v8 + 12))
      {
        v11 = v10;
      }
      else
      {
        v9 = 0.0;
        v11 = 0.0;
      }
      -[GCMicroGamepad dpad](self, "dpad", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v12, -v11, v9);

    }
  }
}

- (void)processOrientationData:(id)a3
{
  double v4;
  double v5;
  double v6;
  int v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  id v14;

  objc_msgSend(a3, "gravity");
  v6 = fabs(v4);
  if (v5 <= -1.0 || v5 >= -0.55 || v6 >= 0.2)
  {
    if (fabs(v5) >= 0.2 || (v6 > 0.55 ? (v8 = v6 < 1.0) : (v8 = 0), !v8))
    {
      if (self->_candidateOrientation == -1)
        return;
      v12 = 0;
      self->_candidateOrientation = -1;
      v13 = 1;
      goto LABEL_21;
    }
    if (v4 < 0.0)
      v7 = 1;
    else
      v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  if (v7 == self->_candidateOrientation)
  {
    if (v7 != self->_orientation)
    {
      +[NSDate date](&off_254DF6DA0, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", self->_candidateOrientationTimestamp);
      v11 = v10;

      if (v11 >= 1.2)
        self->_orientation = self->_candidateOrientation;
    }
    return;
  }
  self->_candidateOrientation = v7;
  +[NSDate date](&off_254DF6DA0, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_21:
  v14 = v12;
  objc_storeStrong((id *)&self->_candidateOrientationTimestamp, v12);
  if ((v13 & 1) == 0)

}

- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  _BOOL8 v7;
  unsigned int digitizerTouchState;
  unsigned int v13;
  id v14;

  v7 = a7;
  digitizerTouchState = self->_digitizerTouchState;
  if (!digitizerTouchState)
  {
    v13 = 1;
    goto LABEL_5;
  }
  if (digitizerTouchState == 1)
  {
    v13 = 2;
LABEL_5:
    self->_digitizerTouchState = v13;
  }
  v14 = a3;
  kdebug_trace();
  -[_GCAppleTVRemoteControllerProfile setDpad:x:y:timestamp:forceSkipDpadRotation:](self, "setDpad:x:y:timestamp:forceSkipDpadRotation:", v14, a6, v7, a4, a5);

}

- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  kdebug_trace();
  self->_digitizerTouchState = 0;
  -[_GCAppleTVRemoteControllerProfile setDpad:x:y:timestamp:forceSkipDpadRotation:](self, "setDpad:x:y:timestamp:forceSkipDpadRotation:", v8, a4, v5, 0.0, 0.0);

}

- (void)getPositionInSlidingWindowForRealX:(double)a3 realY:(double)a4 outXInWindow:(double *)a5 outYInWindow:(double *)a6
{
  double v6;
  double v7;
  double deadzoneSize;
  double v12;
  __double2 v13;

  *a5 = 0.0;
  *a6 = 0.0;
  v6 = a3 - self->_windowX;
  v7 = a4 - self->_windowY;
  deadzoneSize = self->_deadzoneSize;
  if (sqrt(v7 * v7 + v6 * v6) >= deadzoneSize)
  {
    v12 = atan2(a4 - self->_windowY, v6);
    v13 = __sincos_stret(v12);
    *a5 = v6 - deadzoneSize * v13.__cosval;
    *a6 = v7 - self->_deadzoneSize * v13.__sinval;
    *a5 = clamp(*a5 / (self->_windowSize - self->_deadzoneSize), -1.0, 1.0);
    *a6 = clamp(*a6 / (self->_windowSize - self->_deadzoneSize), -1.0, 1.0);
  }
}

- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  id v11;
  unsigned int digitizerTouchState;
  double windowX;
  double windowSize;
  double v15;
  double v16;
  double v17;
  double windowY;
  double v19;
  double *windowBufferSize;
  double v21;
  double v22;
  double v23;
  int orientation;
  double v25;
  objc_super v26;
  double v27;
  double v28;

  v11 = a3;
  if (-[GCMicroGamepad reportsAbsoluteDpadValues](self, "reportsAbsoluteDpadValues"))
    goto LABEL_28;
  v27 = 0.0;
  v28 = 0.0;
  digitizerTouchState = self->_digitizerTouchState;
  if (digitizerTouchState)
  {
    if (digitizerTouchState == 1)
    {
      self->_windowSize = 0.5;
      self->_deadzoneSize = 0.03;
      memset_pattern16(self->_windowBufferSize, &unk_21526CE60, 0x20uLL);
      self->_windowX = a4;
      self->_windowY = a5;
      goto LABEL_26;
    }
    windowX = self->_windowX;
    windowSize = self->_windowSize;
    if (vabdd_f64(a4, windowX) > windowSize)
    {
      if (windowX <= a4)
      {
        v17 = self->_windowBufferSize[3];
        if (windowX + windowSize > 1.0 - v17)
          goto LABEL_16;
        v16 = a4 - windowSize;
        if (v16 >= 0.5 - v17)
          v16 = 0.5 - v17;
      }
      else
      {
        v15 = self->_windowBufferSize[2];
        if (windowX - windowSize < v15 + -1.0)
          goto LABEL_16;
        v16 = windowSize + a4;
        if (v16 < v15 + -0.5)
          v16 = v15 + -0.5;
      }
      self->_windowX = v16;
    }
LABEL_16:
    windowY = self->_windowY;
    v19 = self->_windowSize;
    if (vabdd_f64(a5, windowY) > v19)
    {
      windowBufferSize = self->_windowBufferSize;
      if (windowY <= a5)
      {
        v23 = *windowBufferSize;
        if (windowY + v19 > 1.0 - *windowBufferSize)
          goto LABEL_26;
        v22 = a5 - v19;
        if (v22 >= 0.5 - v23)
          v22 = 0.5 - v23;
      }
      else
      {
        v21 = self->_windowBufferSize[1];
        if (windowY - v19 < v21 + -1.0)
          goto LABEL_26;
        v22 = v19 + a5;
        if (v22 < v21 + -0.5)
          v22 = v21 + -0.5;
      }
      self->_windowY = v22;
    }
LABEL_26:
    -[_GCAppleTVRemoteControllerProfile getPositionInSlidingWindowForRealX:realY:outXInWindow:outYInWindow:](self, "getPositionInSlidingWindowForRealX:realY:outXInWindow:outYInWindow:", &v28, &v27, a4, a5);
    goto LABEL_27;
  }
  self->_windowX = 0.0;
  self->_windowY = 0.0;
  self->_windowSize = 0.0;
  self->_deadzoneSize = 0.0;
  *(_OWORD *)self->_windowBufferSize = 0u;
  *(_OWORD *)&self->_windowBufferSize[2] = 0u;
LABEL_27:
  a5 = v27;
  a4 = v28;
  if (a7 || !-[GCMicroGamepad allowsRotation](self, "allowsRotation"))
    goto LABEL_33;
LABEL_28:
  orientation = self->_orientation;
  if (orientation == 1)
  {
    a5 = -a5;
    v25 = a4;
    goto LABEL_34;
  }
  if (orientation == 2)
  {
    v25 = -a4;
  }
  else
  {
LABEL_33:
    v25 = a5;
    a5 = a4;
  }
LABEL_34:
  v26.receiver = self;
  v26.super_class = (Class)_GCAppleTVRemoteControllerProfile;
  -[GCPhysicalInputProfile setDpad:x:y:](&v26, sel_setDpad_x_y_, v11, a5, v25);

}

- (void)initCommon:(id)a3
{
  NSDate *candidateOrientationTimestamp;
  id v5;
  _GCAppleTVRemoteMotionProfile *v6;

  self->_orientation = 0;
  self->_candidateOrientation = 0;
  candidateOrientationTimestamp = self->_candidateOrientationTimestamp;
  self->_candidateOrientationTimestamp = 0;
  v5 = a3;

  v6 = -[_GCAppleTVRemoteMotionProfile initWithController:]([_GCAppleTVRemoteMotionProfile alloc], "initWithController:", v5);
  -[_GCAppleTVRemoteMotionProfile _setMotionLite:](v6, "_setMotionLite:", 1);
  -[GCPhysicalInputProfile set_motion:](self, "set_motion:", v6);
  self->_digitizerTouchState = 0;
  self->_windowX = 0.0;
  self->_windowY = 0.0;

}

- (_GCAppleTVRemoteControllerProfile)initWithController:(id)a3
{
  id v4;
  _GCAppleTVRemoteControllerProfile *v5;
  _GCAppleTVRemoteControllerProfile *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCAppleTVRemoteControllerProfile;
  v5 = -[GCPhysicalInputProfile initWithController:](&v8, sel_initWithController_, v4);
  v6 = v5;
  if (v5)
    -[_GCAppleTVRemoteControllerProfile initCommon:](v5, "initCommon:", v4);

  return v6;
}

- (id)name
{
  return CFSTR("Remote");
}

- (void)setAllowsRotation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;
  objc_super v10;

  v3 = a3;
  if (-[GCMicroGamepad allowsRotation](self, "allowsRotation") != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCAppleTVRemoteControllerProfile;
    -[GCMicroGamepad setAllowsRotation:](&v10, sel_setAllowsRotation_, v3);
    if (v3)
    {
      objc_initWeak(&location, self);
      v7 = MEMORY[0x24BDAC760];
      objc_copyWeak(&v8, &location);
      -[GCPhysicalInputProfile _motion](self, "_motion", v7, 3221225472, __55___GCAppleTVRemoteControllerProfile_setAllowsRotation___block_invoke, &unk_24D2B4180);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInternalValueChangedHandler:", &v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[GCPhysicalInputProfile _motion](self, "_motion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalValueChangedHandler:", 0);

    }
  }
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _GCAppleTVRemoteControllerProfile *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "Setting %@ device type to %ld", (uint8_t *)&v8, 0x16u);
    }

  }
  -[GCPhysicalInputProfile controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForwarded:", (unint64_t)(a3 - 3) < 2);

  self->_deviceType = a3;
  -[GCPhysicalInputProfile controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVendorName:", 0);

}

- (unint64_t)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateOrientationTimestamp, 0);
}

@end
