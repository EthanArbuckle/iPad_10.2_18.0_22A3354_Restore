@implementation GCDirectionalGamepad

- (GCDirectionalGamepad)initWithIdentifier:(id)a3
{
  GCDirectionalGamepad *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCDirectionalGamepad;
  result = -[GCMicroGamepad initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result)
  {
    result->_touchState = 0;
    result->_touchpadRelativeWindowSize = 0.5;
    result->_touchpadRelativeOriginBufferSize = 0.225;
    result->_previousButtonState = 0.0;
  }
  return result;
}

- (id)productCategory
{
  int64_t v3;
  id *v4;
  objc_super v6;

  if (!GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL))
    return CFSTR("Siri Remote");
  v3 = -[GCDirectionalGamepad deviceType](self, "deviceType");
  if (v3 == 6)
  {
    v4 = (id *)&GCProductCategorySiriRemote2ndGen;
    return *v4;
  }
  if (v3 == 5)
  {
    v4 = (id *)&GCProductCategoryUniversalElectronicsRemote;
    return *v4;
  }
  v6.receiver = self;
  v6.super_class = (Class)GCDirectionalGamepad;
  -[GCMicroGamepad productCategory](&v6, sel_productCategory);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsRotation
{
  return 0;
}

- (void)setReportsAbsoluteDpadValues:(BOOL)a3
{
  void *v5;
  char v6;

  -[GCMicroGamepad dpad](self, "dpad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nonAnalog");

  if ((v6 & 1) == 0)
    self->_reportsAbsoluteDpadValues = a3;
}

- (BOOL)reportsAbsoluteDpadValues
{
  return self->_reportsAbsoluteDpadValues;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  GCControllerButtonInput *v13;
  GCControllerButtonInput *centerButton;
  GCControllerDirectionPad *v15;
  GCControllerDirectionPad *cardinalDpad;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 treatOnlyCenterRingAsButtonA;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  GCDirectionalGamepad *v38;
  __int16 v39;
  _BYTE v40[10];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = self;
      v39 = 2048;
      *(_QWORD *)v40 = a3;
      _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_DEFAULT, "Setting %@ device type to %ld", buf, 0x16u);
    }

  }
  -[GCMicroGamepad dpad](self, "dpad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNonAnalog:", 0);

  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 5)
    {
      -[GCMicroGamepad dpad](self, "dpad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNonAnalog:", 1);

      -[GCPhysicalInputProfile controller](self, "controller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setForwarded:", 0);

    }
    else if (a3 != 6)
    {
LABEL_13:
      -[GCPhysicalInputProfile controller](self, "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
      goto LABEL_14;
    }
    if (!self->_cardinalDpad)
    {
      v11 = GCCurrentProcessLinkedOnAfter(0x7E50301FFFFFFFFuLL);
      v12 = GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL);
      self->_treatOnlyCenterRingAsButtonA = v11 & (v12 ^ 1);
      if (gc_isInternalBuild())
      {
        v25 = v12;
        getGCLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          treatOnlyCenterRingAsButtonA = self->_treatOnlyCenterRingAsButtonA;
          *(_DWORD *)buf = 138412802;
          if (treatOnlyCenterRingAsButtonA)
            v24 = CFSTR("YES");
          else
            v24 = CFSTR("NO");
          v38 = (GCDirectionalGamepad *)v24;
          v39 = 1024;
          *(_DWORD *)v40 = v11;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v25;
          _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "GCDirectionalGamepad - treatOnlyCenterRingAsButtonA? %@ (14.5 ? %d, 15.0 ? %d)", buf, 0x18u);
        }

      }
      if (!self->_treatOnlyCenterRingAsButtonA)
      {
        v33 = 0u;
        v34 = 0u;
        v36 = 0u;
        v35 = 0u;
        v32 = CFSTR("Button Center");
        LOWORD(v33) = 257;
        *(_QWORD *)&v36 = CFSTR("DIRECTIONAL_GAMEPAD_BUTTON_CENTER");
        -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v32);
        v13 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
        centerButton = self->_centerButton;
        self->_centerButton = v13;

      }
      v27 = 0u;
      v31 = 0;
      v29 = 0u;
      v28 = 0u;
      v26 = CFSTR("Cardinal Direction Pad");
      LOWORD(v27) = 1;
      v30 = CFSTR("DIRECTIONAL_GAMEPAD_CARDINAL_DIRECTION_PAD");
      -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", &v26);
      v15 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();
      cardinalDpad = self->_cardinalDpad;
      self->_cardinalDpad = v15;

      -[GCMicroGamepad buttonMenu](self, "buttonMenu");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTIONAL_GAMEPAD_BUTTON_MENU"));

      _GCFConvertStringToLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCMicroGamepad buttonMenu](self, "buttonMenu");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLocalizedName:", v18);

    }
    goto LABEL_13;
  }
  -[GCPhysicalInputProfile controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 1;
LABEL_14:
  objc_msgSend(v6, "setForwarded:", v8);

  self->_deviceType = a3;
  -[GCPhysicalInputProfile controller](self, "controller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVendorName:", 0);

}

- (BOOL)calculateRelativePositionWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5
{
  double v6;
  double v7;
  CGPoint *p_absoluteWindowLocation;
  float touchpadRelativeWindowSize;
  double v10;
  BOOL leftBufferZone;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint *p_relativePosition;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;

  v6 = a3;
  v7 = a4;
  p_absoluteWindowLocation = &self->_absoluteWindowLocation;
  -[GCDirectionalGamepad distanceBetweenCGPoint:andCGPoint:](self, "distanceBetweenCGPoint:andCGPoint:", a5, a3, a4, self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
  touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  if (v10 >= (float)(self->_touchpadRelativeOriginBufferSize * touchpadRelativeWindowSize)
    || self->_reportsAbsoluteDpadValues)
  {
    leftBufferZone = 1;
    self->_leftBufferZone = 1;
    self->_absolutePosition.x = v6;
    self->_absolutePosition.y = v7;
    -[GCDirectionalGamepad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:", v6 - p_absoluteWindowLocation->x, v7 - p_absoluteWindowLocation->y, 1.0 / touchpadRelativeWindowSize);
    v13 = v12;
    v15 = v14;
    -[GCDirectionalGamepad normalizeCGPoint:](self, "normalizeCGPoint:");
    v17 = v16;
    v19 = v18;
    -[GCDirectionalGamepad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:");
    -[GCDirectionalGamepad addCGPoint:toPoint:](self, "addCGPoint:toPoint:");
    p_relativePosition = &self->_relativePosition;
    v23 = self->_absolutePosition.y - v22;
    self->_relativePosition.x = self->_absolutePosition.x - v20;
    self->_relativePosition.y = v23;
    -[GCDirectionalGamepad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:");
    self->_relativePosition.x = v24;
    self->_relativePosition.y = v25;
    -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", v13, v15);
    if (v26 > 1.0)
    {
      v27 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCDirectionalGamepad subCGPoint:fromPoint:](self, "subCGPoint:fromPoint:", v17, v19, v13, v15);
      -[GCDirectionalGamepad addCGPoint:toPoint:](self, "addCGPoint:toPoint:", p_absoluteWindowLocation->x, p_absoluteWindowLocation->y, v28, v29);
      p_absoluteWindowLocation->x = v30;
      p_absoluteWindowLocation->y = v31;
      if (self->_beganTouchOutsideBounds)
      {
        -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
        if (v32 <= v27)
          self->_beganTouchOutsideBounds = 0;
      }
      else
      {
        -[GCDirectionalGamepad clampPoint:toLength:](self, "clampPoint:toLength:");
        p_absoluteWindowLocation->x = v33;
        p_absoluteWindowLocation->y = v34;
      }
      -[GCDirectionalGamepad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:", p_relativePosition->x, self->_relativePosition.y, 1.0);
      p_relativePosition->x = v35;
      self->_relativePosition.y = v36;
      return 1;
    }
  }
  else
  {
    self->_absolutePosition = *p_absoluteWindowLocation;
    self->_relativePosition = (CGPoint)*MEMORY[0x24BDBEFB0];
    if (self->_touchState)
      leftBufferZone = self->_leftBufferZone;
    else
      leftBufferZone = 1;
    self->_leftBufferZone = 0;
  }
  return leftBufferZone;
}

- (void)reportDigitizerChange:(id)a3
{
  id v4;
  int *v5;
  int64_t touchState;
  double *v7;
  double v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  char v18;
  void *v19;
  double v20;
  char v21;
  void *v22;
  void *v23;
  double v24;
  char v25;
  void *v26;
  double v27;
  int v28;
  id v29;

  v4 = a3;
  v5 = &OBJC_IVAR___GCDirectionalGamepad__absolutePosition;
  if (!self->_reportsAbsoluteDpadValues)
    v5 = &OBJC_IVAR___GCDirectionalGamepad__relativePosition;
  touchState = self->_touchState;
  if (!touchState)
  {
    v29 = v4;
    -[GCMicroGamepad dpad](self, "dpad");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](self, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handlerQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    objc_msgSend(v15, "xAxis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 0;
    v25 = objc_msgSend(v23, "_setValue:queue:", v14, v24);

    objc_msgSend(v15, "yAxis");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 0;
    v28 = objc_msgSend(v26, "_setValue:queue:", v14, v27);

    if ((v25 & 1) == 0 && !v28)
      goto LABEL_12;
LABEL_11:
    objc_msgSend(0, "addObject:", v15);
LABEL_12:

    v4 = v29;
    goto LABEL_13;
  }
  v7 = (double *)((char *)self + *v5);
  v8 = *v7;
  v9 = v7[1];
  if (touchState == 2 || touchState == 1)
  {
    v29 = v4;
    -[GCMicroGamepad dpad](self, "dpad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](self, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handlerQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(v15, "xAxis");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    *(float *)&v17 = v11;
    v18 = objc_msgSend(v16, "_setValue:queue:", v14, v17);

    objc_msgSend(v15, "yAxis");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    *(float *)&v20 = v12;
    v21 = objc_msgSend(v19, "_setValue:queue:", v14, v20);

    if ((v18 & 1) == 0 && (v21 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_13:

}

- (void)reportDirectionpadChange:(id)a3 onQueue:(id)a4
{
  float v6;
  float v7;
  float v8;
  float v9;
  id v10;
  void *v11;
  double v12;
  char v13;
  void *v14;
  double v15;
  int v16;
  id v17;

  v17 = a3;
  v6 = -1.0;
  if ((self->_directionPadButtonsState & 8) != 0)
    v7 = -1.0;
  else
    v7 = 0.0;
  if ((self->_directionPadButtonsState & 1) != 0)
    v8 = 1.0;
  else
    v8 = v7;
  if ((self->_directionPadButtonsState & 4) == 0)
    v6 = 0.0;
  if ((self->_directionPadButtonsState & 2) != 0)
    v9 = 1.0;
  else
    v9 = v6;
  v10 = a4;
  objc_msgSend(v17, "xAxis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v9;
  v13 = objc_msgSend(v11, "_setValue:queue:", v10, v12);

  objc_msgSend(v17, "yAxis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = v8;
  v16 = objc_msgSend(v14, "_setValue:queue:", v10, v15);

  if ((v13 & 1) != 0 || v16)
    objc_msgSend(0, "addObject:", v17);

}

- (BOOL)determineTouchStateWithDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5
{
  int64_t touchState;
  BOOL v6;
  _BOOL4 v7;
  int64_t v8;
  BOOL v9;
  uint64_t v10;
  _BOOL8 v11;

  touchState = self->_touchState;
  if (touchState)
    v6 = 0;
  else
    v6 = a5;
  v7 = touchState == 1 && a5;
  if (v6 || v7 || (v8 = self->_touchState, !a5))
  {
    v9 = !v7;
    v10 = 1;
    if (!v9)
      v10 = 2;
    if (a5)
      v8 = v10;
    else
      v8 = 0;
    self->_touchState = v8;
  }
  if (touchState)
    LOBYTE(v11) = 0;
  else
    v11 = !a5;
  return !v11 && (v8 != 2 || self->_absolutePosition.x != a3 || self->_absolutePosition.y != a4);
}

- (void)setDpad:(id)a3 digitizerX:(double)a4 digitizerY:(double)a5 touchDown:(BOOL)a6
{
  _BOOL8 v6;
  double v7;
  double v8;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a4;
  v11 = a5;
  *(float *)&a4 = v10;
  *(float *)&a5 = v11;
  if (-[GCDirectionalGamepad determineTouchStateWithDigitizerX:digitizerY:touchDown:](self, "determineTouchStateWithDigitizerX:digitizerY:touchDown:", a6, a4, a5))
  {
    if (self->_touchState == 1)
    {
      self->_absoluteTouchDownPosition.x = v8;
      self->_absoluteTouchDownPosition.y = v7;
      self->_absoluteWindowLocation = self->_absoluteTouchDownPosition;
      self->_absolutePosition.x = v8;
      self->_absolutePosition.y = v7;
      self->_relativePosition = (CGPoint)*MEMORY[0x24BDBEFB0];
      self->_leftBufferZone = 0;
      v14 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
      if (v15 > v14)
        self->_beganTouchOutsideBounds = 1;
    }
    else
    {
      *(float *)&v12 = v10;
      *(float *)&v13 = v11;
      if (!-[GCDirectionalGamepad calculateRelativePositionWithDigitizerX:digitizerY:touchDown:](self, "calculateRelativePositionWithDigitizerX:digitizerY:touchDown:", v6, v12, v13))return;
    }
    -[GCPhysicalInputProfile controller](self, "controller");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handlerQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCDirectionalGamepad reportDigitizerChange:](self, "reportDigitizerChange:", v16);

  }
}

- (double)magnitudeForCGPoint:(CGPoint)a3
{
  return sqrt(a3.y * a3.y + a3.x * a3.x);
}

- (double)distanceBetweenCGPoint:(CGPoint)a3 andCGPoint:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (CGPoint)normalizeCGPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
  v6 = y / v5;
  v7 = x / v5;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)scaleCGPoint:(CGPoint)a3 toLength:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[GCDirectionalGamepad normalizeCGPoint:](self, "normalizeCGPoint:", a3.x, a3.y);
  v6 = v5 * a4;
  v8 = v7 * a4;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)addCGPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)subCGPoint:(CGPoint)a3 fromPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.x - a3.x;
  v5 = a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)mulCGPoint:(CGPoint)a3 byScalar:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * a4;
  v5 = a3.y * a4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)clampPoint:(CGPoint)a3 toLength:(double)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[GCDirectionalGamepad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
  if (v7 > a4)
  {
    x = x / v7 * a4;
    y = y / v7 * a4;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void)setOwner:(unint64_t)a3
{
  self->_owner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_cardinalDpad, 0);
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

- (void)digitizerTouchEvent:(id)a3 x:(double)a4 y:(double)a5 timestamp:(unint64_t)a6 forceSkipDpadRotation:(BOOL)a7
{
  id v10;

  -[GCMicroGamepad dpad](self, "dpad", a3, a6, a7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GCDirectionalGamepad setDpad:digitizerX:digitizerY:touchDown:](self, "setDpad:digitizerX:digitizerY:touchDown:", v10, 1, a4, a5);

}

- (void)digitizerTouchUp:(id)a3 timestamp:(unint64_t)a4 forceSkipDpadRotation:(BOOL)a5
{
  id v6;

  -[GCMicroGamepad dpad](self, "dpad", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GCDirectionalGamepad setDpad:digitizerX:digitizerY:touchDown:](self, "setDpad:digitizerX:digitizerY:touchDown:", v6, 0, 0.0, 0.0);

}

- (id)dpadDirectionEvent:(id)a3 direction:(unint64_t)a4 pressed:(BOOL)a5
{
  unsigned __int8 directionPadButtonsState;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  GCControllerDirectionPad *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  int v28;
  _QWORD block[5];
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  directionPadButtonsState = self->_directionPadButtonsState;
  v7 = directionPadButtonsState ^ a4;
  v8 = directionPadButtonsState | a4;
  if (!a5)
    v8 = v7;
  self->_directionPadButtonsState = v8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = self->_directionPadButtonsState;
      *(_DWORD *)buf = 67109120;
      v31 = v28;
      _os_log_impl(&dword_215181000, v27, OS_LOG_TYPE_INFO, "Button State = %x", buf, 8u);
    }

  }
  -[GCMicroGamepad dpad](self, "dpad");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_deviceType == 6)
  {
    v11 = self->_cardinalDpad;

    if (!self->_treatOnlyCenterRingAsButtonA)
    {
      v12 = self->_directionPadButtonsState;
      v13 = self->_directionPadButtonsState != 0;
      -[GCMicroGamepad buttonA](self, "buttonA");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isPressed");

      if (v13 != v15 && !self->_centerButtonPressed)
      {
        -[GCPhysicalInputProfile controller](self, "controller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handlerQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = v17;
        }
        else
        {
          v19 = MEMORY[0x24BDAC9B8];
          v23 = MEMORY[0x24BDAC9B8];
        }

        -[GCMicroGamepad buttonA](self, "buttonA");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        LODWORD(v26) = 0;
        if (v12)
          *(float *)&v26 = 1.0;
        objc_msgSend(v24, "_setValue:queue:", v19, v26);

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __95__GCDirectionalGamepad_DirectionPadValueChangedDelegate__dpadDirectionEvent_direction_pressed___block_invoke;
        block[3] = &unk_24D2B2B20;
        block[4] = self;
        dispatch_async(v19, block);

      }
    }
  }
  else
  {
    v11 = (GCControllerDirectionPad *)v9;
  }
  -[GCPhysicalInputProfile controller](self, "controller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handlerQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCDirectionalGamepad reportDirectionpadChange:onQueue:](self, "reportDirectionpadChange:onQueue:", v11, v21);

  return v11;
}

void __95__GCDirectionalGamepad_DirectionPadValueChangedDelegate__dpadDirectionEvent_direction_pressed___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "debugName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "buttonA");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "buttonA");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v3)[2](v3, v4, v5);

  }
}

- (id)centerButtonEvent:(id)a3 pressed:(BOOL)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  double v15;
  double v16;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_centerButtonPressed == v4
    || ((self->_centerButtonPressed = v4, !self->_treatOnlyCenterRingAsButtonA) ? (v8 = v4 == 0) : (v8 = 1),
        !v8 && self->_directionPadButtonsState))
  {
    v9 = 0;
  }
  else
  {
    v9 = v6;
    if (v9)
    {
      -[GCPhysicalInputProfile controller](self, "controller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handlerQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        v13 = MEMORY[0x24BDAC9B8];
        v14 = MEMORY[0x24BDAC9B8];
      }

      *(float *)&v15 = (float)v4;
      objc_msgSend(v9, "_setValue:queue:", v13, v15);
      if (!self->_treatOnlyCenterRingAsButtonA)
      {
        *(float *)&v16 = (float)v4;
        -[GCControllerButtonInput _setValue:queue:](self->_centerButton, "_setValue:queue:", v13, v16);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __84__GCDirectionalGamepad_DirectionPadValueChangedDelegate__centerButtonEvent_pressed___block_invoke;
        block[3] = &unk_24D2B2B20;
        block[4] = self;
        dispatch_async(v13, block);
      }

    }
  }

  return v9;
}

void __84__GCDirectionalGamepad_DirectionPadValueChangedDelegate__centerButtonEvent_pressed___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 816);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 816));

  }
}

@end
