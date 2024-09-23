@implementation GCControllerTouchpad

- (GCControllerTouchpad)initWithDescriptionName:(id)a3
{
  __CFString *v4;
  GCControllerTouchpad *v5;
  GCControllerTouchpad *v6;
  __CFString *v7;
  NSString **p_descriptionName;
  void *v9;
  GCControllerDirectionPad *v10;
  GCControllerDirectionPad *touchSurface;
  void *v12;
  GCControllerButtonInput *v13;
  GCControllerButtonInput *button;
  objc_super v16;

  v4 = (__CFString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)GCControllerTouchpad;
  v5 = -[GCControllerElement init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = CFSTR("Touchpad");
    p_descriptionName = &v5->_descriptionName;
    objc_storeStrong((id *)&v5->_descriptionName, v7);
    -[GCControllerElement setPrimaryAlias:](v6, "setPrimaryAlias:", *p_descriptionName);
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ %@"), *p_descriptionName, CFSTR("Surface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GCControllerDirectionPad initWithDigital:descriptionName:]([GCControllerDirectionPad alloc], "initWithDigital:descriptionName:", 0, v9);
    touchSurface = v6->_touchSurface;
    v6->_touchSurface = v10;

    -[GCControllerElement setCollection:](v6->_touchSurface, "setCollection:", v6);
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ %@"), *p_descriptionName, CFSTR("Button"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GCControllerButtonInput initWithDescriptionName:]([GCControllerButtonInput alloc], "initWithDescriptionName:", v12);
    button = v6->_button;
    v6->_button = v13;

    -[GCControllerButtonInput setTouchedAndValueDistinct:](v6->_button, "setTouchedAndValueDistinct:", 1);
    -[GCControllerElement setCollection:](v6->_button, "setCollection:", v6);
    v6->_touchState = 0;
    v6->_touchpadRelativeWindowSize = 0.5;
    v6->_touchpadRelativeOriginBufferSize = 0.225;
    v6->_reportsAbsoluteTouchSurfaceValues = 1;
    v6->_previousButtonState = 0.0;
    -[GCControllerButtonInput setNonAnalog:](v6->_button, "setNonAnalog:", 1);

  }
  return v6;
}

- (GCControllerTouchpad)initWithCoder:(id)a3
{
  id v4;
  GCControllerTouchpad *v5;
  float v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerTouchpad;
  v5 = -[GCControllerElement init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_touchpadRelativeWindowSize"));
    v5->_touchpadRelativeWindowSize = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_touchpadRelativeOriginBufferRadius"));
    v5->_touchpadRelativeOriginBufferSize = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float touchpadRelativeWindowSize;
  double v5;
  double v6;
  id v7;

  touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  v7 = a3;
  *(float *)&v5 = touchpadRelativeWindowSize;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("_touchpadRelativeWindowSize"), v5);
  *(float *)&v6 = self->_touchpadRelativeOriginBufferSize;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("_touchpadRelativeOriginBufferSize"), v6);

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
  -[GCControllerTouchpad distanceBetweenCGPoint:andCGPoint:](self, "distanceBetweenCGPoint:andCGPoint:", a5, a3, a4, self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
  touchpadRelativeWindowSize = self->_touchpadRelativeWindowSize;
  if (v10 >= (float)(self->_touchpadRelativeOriginBufferSize * touchpadRelativeWindowSize)
    || self->_reportsAbsoluteTouchSurfaceValues)
  {
    leftBufferZone = 1;
    self->_leftBufferZone = 1;
    self->_absolutePosition.x = v6;
    self->_absolutePosition.y = v7;
    -[GCControllerTouchpad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:", v6 - p_absoluteWindowLocation->x, v7 - p_absoluteWindowLocation->y, 1.0 / touchpadRelativeWindowSize);
    v13 = v12;
    v15 = v14;
    -[GCControllerTouchpad normalizeCGPoint:](self, "normalizeCGPoint:");
    v17 = v16;
    v19 = v18;
    -[GCControllerTouchpad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:");
    -[GCControllerTouchpad addCGPoint:toPoint:](self, "addCGPoint:toPoint:");
    p_relativePosition = &self->_relativePosition;
    v23 = self->_absolutePosition.y - v22;
    self->_relativePosition.x = self->_absolutePosition.x - v20;
    self->_relativePosition.y = v23;
    -[GCControllerTouchpad mulCGPoint:byScalar:](self, "mulCGPoint:byScalar:");
    self->_relativePosition.x = v24;
    self->_relativePosition.y = v25;
    -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", v13, v15);
    if (v26 > 1.0)
    {
      v27 = 1.0 - self->_touchpadRelativeWindowSize;
      -[GCControllerTouchpad subCGPoint:fromPoint:](self, "subCGPoint:fromPoint:", v17, v19, v13, v15);
      -[GCControllerTouchpad addCGPoint:toPoint:](self, "addCGPoint:toPoint:", p_absoluteWindowLocation->x, p_absoluteWindowLocation->y, v28, v29);
      p_absoluteWindowLocation->x = v30;
      p_absoluteWindowLocation->y = v31;
      if (self->_beganTouchOutsideBounds)
      {
        -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
        if (v32 <= v27)
          self->_beganTouchOutsideBounds = 0;
      }
      else
      {
        -[GCControllerTouchpad clampPoint:toLength:](self, "clampPoint:toLength:");
        p_absoluteWindowLocation->x = v33;
        p_absoluteWindowLocation->y = v34;
      }
      -[GCControllerTouchpad scaleCGPoint:toLength:](self, "scaleCGPoint:toLength:", p_relativePosition->x, self->_relativePosition.y, 1.0);
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
  NSObject *v4;
  int *v5;
  double *v6;
  double v7;
  double v8;
  float v9;
  float v10;
  BOOL v11;
  int64_t touchState;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void (*v17)(uint64_t);
  double *p_block;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t block;
  uint64_t v29;

  v4 = a3;
  if (self->_reportsAbsoluteTouchSurfaceValues)
    v5 = &OBJC_IVAR___GCControllerTouchpad__absolutePosition;
  else
    v5 = &OBJC_IVAR___GCControllerTouchpad__relativePosition;
  v6 = (double *)((char *)self + *v5);
  v8 = *v6;
  v7 = v6[1];
  -[GCControllerButtonInput value](self->_button, "value");
  v10 = v9;
  v11 = -[GCControllerButtonInput isPressed](self->_button, "isPressed");
  self->_previousButtonState = v10;
  touchState = self->_touchState;
  switch(touchState)
  {
    case 0:
      -[GCControllerDirectionPad xAxis](self->_touchSurface, "xAxis");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 0;
      objc_msgSend(v19, "_setValue:queue:", v4, v20);

      -[GCControllerDirectionPad yAxis](self->_touchSurface, "yAxis");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 0;
      objc_msgSend(v21, "_setValue:queue:", v4, v22);

      v27 = MEMORY[0x24BDAC760];
      v17 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_3;
      p_block = (double *)&v27;
      goto LABEL_10;
    case 2:
      -[GCControllerDirectionPad xAxis](self->_touchSurface, "xAxis");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v24 = v8;
      objc_msgSend(v23, "_setValue:queue:", v4, v24);

      -[GCControllerDirectionPad yAxis](self->_touchSurface, "yAxis");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v26 = v7;
      objc_msgSend(v25, "_setValue:queue:", v4, v26);

      block = MEMORY[0x24BDAC760];
      v17 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_2;
      p_block = (double *)&block;
      goto LABEL_10;
    case 1:
      -[GCControllerDirectionPad xAxis](self->_touchSurface, "xAxis");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v14 = v8;
      objc_msgSend(v13, "_setValue:queue:", v4, v14);

      -[GCControllerDirectionPad yAxis](self->_touchSurface, "yAxis");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v16 = v7;
      objc_msgSend(v15, "_setValue:queue:", v4, v16);

      v29 = MEMORY[0x24BDAC760];
      v17 = __46__GCControllerTouchpad_reportDigitizerChange___block_invoke;
      p_block = (double *)&v29;
LABEL_10:
      *((_QWORD *)p_block + 1) = 3221225472;
      *((_QWORD *)p_block + 2) = v17;
      *((_QWORD *)p_block + 3) = &unk_24D2B3F80;
      *((_QWORD *)p_block + 4) = self;
      p_block[5] = v8;
      p_block[6] = v7;
      *((float *)p_block + 14) = v10;
      *((_BYTE *)p_block + 60) = v11;
      dispatch_async(v4, p_block);
      break;
  }

}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "touchDown");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "touchDown");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(double *)(a1 + 40);
    v4 = *(double *)(a1 + 48);
    (*((void (**)(id, _QWORD, _QWORD, float, float, float))v5 + 2))(v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));

  }
}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "touchMoved");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "touchMoved");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(double *)(a1 + 40);
    v4 = *(double *)(a1 + 48);
    (*((void (**)(id, _QWORD, _QWORD, float, float, float))v5 + 2))(v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));

  }
}

void __46__GCControllerTouchpad_reportDigitizerChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "touchUp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "touchUp");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(double *)(a1 + 40);
    v4 = *(double *)(a1 + 48);
    (*((void (**)(id, _QWORD, _QWORD, float, float, float))v5 + 2))(v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), v3, v4, *(float *)(a1 + 56));

  }
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

- (BOOL)setDigitizerX:(float)a3 digitizerY:(float)a4 touchDown:(BOOL)a5 queue:(id)a6
{
  _BOOL8 v6;
  id v10;
  float v11;
  float v12;
  float previousButtonState;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;

  v6 = a5;
  v10 = a6;
  -[GCControllerButtonInput value](self->_button, "value");
  v12 = v11;
  previousButtonState = self->_previousButtonState;
  *(float *)&v14 = a3;
  *(float *)&v15 = a4;
  if (!-[GCControllerTouchpad determineTouchStateWithDigitizerX:digitizerY:touchDown:](self, "determineTouchStateWithDigitizerX:digitizerY:touchDown:", v6, v14, v15)&& v12 == previousButtonState)
  {
    goto LABEL_3;
  }
  if (self->_touchState == 1)
  {
    self->_absoluteTouchDownPosition.x = a3;
    self->_absoluteTouchDownPosition.y = a4;
    self->_absoluteWindowLocation = self->_absoluteTouchDownPosition;
    self->_absolutePosition.x = a3;
    self->_absolutePosition.y = a4;
    self->_relativePosition = (CGPoint)*MEMORY[0x24BDBEFB0];
    self->_leftBufferZone = 0;
    v19 = 1.0 - self->_touchpadRelativeWindowSize;
    -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:", self->_absoluteWindowLocation.x, self->_absoluteWindowLocation.y);
    if (v20 > v19)
      self->_beganTouchOutsideBounds = 1;
    goto LABEL_9;
  }
  *(float *)&v16 = a3;
  *(float *)&v17 = a4;
  if (-[GCControllerTouchpad calculateRelativePositionWithDigitizerX:digitizerY:touchDown:](self, "calculateRelativePositionWithDigitizerX:digitizerY:touchDown:", v6, v16, v17)|| v12 != previousButtonState)
  {
LABEL_9:
    -[GCControllerTouchpad reportDigitizerChange:](self, "reportDigitizerChange:", v10);
    v18 = 1;
    goto LABEL_10;
  }
LABEL_3:
  v18 = 0;
LABEL_10:

  return v18;
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
  -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
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

  -[GCControllerTouchpad normalizeCGPoint:](self, "normalizeCGPoint:", a3.x, a3.y);
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
  -[GCControllerTouchpad magnitudeForCGPoint:](self, "magnitudeForCGPoint:");
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

- (id)description
{
  unint64_t touchState;
  const __CFString *v4;
  NSString *descriptionName;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  touchState = self->_touchState;
  if (touchState > 2)
    v4 = &stru_24D2B85A8;
  else
    v4 = off_24D2B3FA0[touchState];
  descriptionName = self->_descriptionName;
  -[GCControllerTouchpad button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPressed"))
    v7 = CFSTR("Pressed");
  else
    v7 = CFSTR("Not Pressed");
  -[GCControllerTouchpad touchSurface](self, "touchSurface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ (%@, %@, %@)"), descriptionName, v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerTouchpad description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis touchDown:(BOOL)touchDown buttonValue:(float)buttonValue
{
  _BOOL8 v7;
  char isKindOfClass;
  void *v12;
  char v13;
  void *v14;
  id v15;
  GCControllerTouchpad *v16;
  id v17;
  id v18;
  id v19;
  double v20;
  int v21;
  char v22;
  int v23;
  double v24;
  double v25;
  void *v26;

  v7 = touchDown;
  -[GCControllerElement device](self, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = v26;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_16;
    v13 = objc_msgSend(v26, "isSnapshot");
    v12 = v26;
    if ((v13 & 1) == 0)
      goto LABEL_16;
    objc_msgSend(v26, "handlerQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDAC9B8];
    v15 = MEMORY[0x24BDAC9B8];
  }
  v16 = self;
  v17 = v14;
  -[GCControllerTouchpad button](v16, "button");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v21 = !v7;
  if (buttonValue <= 0.0)
    v21 = 1;
  if (buttonValue != 0.0 && v21)
    -[GCControllerTouchpad setValueForXAxis:yAxis:touchDown:buttonValue:].cold.1();
  *(float *)&v20 = buttonValue;
  v22 = objc_msgSend(v18, "_setValue:queue:", v19, v20);
  v23 = objc_msgSend(v18, "_setTouched:queue:", v7, v19);
  if ((v22 & 1) != 0 || v23)
    objc_msgSend(0, "addObject:", v18);

  *(float *)&v24 = xAxis;
  *(float *)&v25 = yAxis;
  if (-[GCControllerTouchpad setDigitizerX:digitizerY:touchDown:queue:](v16, "setDigitizerX:digitizerY:touchDown:queue:", v7, v19, v24, v25))
  {
    objc_msgSend(0, "addObject:", v16);
  }

  v12 = v26;
LABEL_16:

}

- (GCControllerButtonInput)button
{
  return self->_button;
}

- (GCControllerTouchpadHandler)touchDown
{
  return self->_touchDown;
}

- (void)setTouchDown:(GCControllerTouchpadHandler)touchDown
{
  objc_setProperty_nonatomic_copy(self, a2, touchDown, 224);
}

- (GCControllerTouchpadHandler)touchMoved
{
  return self->_touchMoved;
}

- (void)setTouchMoved:(GCControllerTouchpadHandler)touchMoved
{
  objc_setProperty_nonatomic_copy(self, a2, touchMoved, 232);
}

- (GCControllerTouchpadHandler)touchUp
{
  return self->_touchUp;
}

- (void)setTouchUp:(GCControllerTouchpadHandler)touchUp
{
  objc_setProperty_nonatomic_copy(self, a2, touchUp, 240);
}

- (GCControllerDirectionPad)touchSurface
{
  return self->_touchSurface;
}

- (void)setTouchSurface:(id)a3
{
  objc_storeStrong((id *)&self->_touchSurface, a3);
}

- (GCTouchState)touchState
{
  return self->_touchState;
}

- (BOOL)reportsAbsoluteTouchSurfaceValues
{
  return self->_reportsAbsoluteTouchSurfaceValues;
}

- (void)setReportsAbsoluteTouchSurfaceValues:(BOOL)reportsAbsoluteTouchSurfaceValues
{
  self->_reportsAbsoluteTouchSurfaceValues = reportsAbsoluteTouchSurfaceValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchSurface, 0);
  objc_storeStrong(&self->_touchUp, 0);
  objc_storeStrong(&self->_touchMoved, 0);
  objc_storeStrong(&self->_touchDown, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_descriptionName, 0);
}

- (void)setValueForXAxis:yAxis:touchDown:buttonValue:.cold.1()
{
  __assert_rtn("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", 38, "(value > 0 && touched) || value == 0");
}

@end
