@implementation TouchEventGenerator

+ (id)sharedTouchEventGenerator
{
  void *v2;
  TouchEventGenerator *v3;
  void *v4;

  v2 = (void *)sharedTouchEventGenerator_eventGenerator;
  if (!sharedTouchEventGenerator_eventGenerator)
  {
    v3 = objc_alloc_init(TouchEventGenerator);
    v4 = (void *)sharedTouchEventGenerator_eventGenerator;
    sharedTouchEventGenerator_eventGenerator = (uint64_t)v3;

    v2 = (void *)sharedTouchEventGenerator_eventGenerator;
  }
  return v2;
}

- (TouchEventGenerator)init
{
  TouchEventGenerator *v2;
  TouchEventGenerator *v3;
  int *v4;
  uint64_t i;
  int v6;
  TouchEventGenerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TouchEventGenerator;
  v2 = -[TouchEventGenerator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = &fingerIdentifiers;
    for (i = 16; i != 256; i += 48)
    {
      v6 = *v4++;
      *(_DWORD *)((char *)&v2->super.isa + i) = v6;
    }
    v7 = v2;
  }

  return v3;
}

- (__IOHIDEvent)_createIOHIDEventType:(int)a3
{
  __IOHIDEvent *DigitizerEvent;
  unint64_t v6;
  unsigned __int8 *p_pathProximity;
  const void *DigitizerFingerEvent;

  mach_absolute_time();
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  IOHIDEventSetIntegerValue();
  if (self->_activePointCount)
  {
    v6 = 0;
    p_pathProximity = &self->_activePoints[0].pathProximity;
    do
    {
      if (a3 == 1)
      {
        if (*((double *)p_pathProximity - 2) == 0.0)
          *((_QWORD *)p_pathProximity - 2) = 0x4014000000000000;
        if (*((double *)p_pathProximity - 1) == 0.0)
          *((_QWORD *)p_pathProximity - 1) = 0;
        if (!*p_pathProximity)
          *p_pathProximity = 3;
      }
      else if ((a3 & 0xFFFFFFFE) == 4)
      {
        *((_QWORD *)p_pathProximity - 2) = 0;
        *((_QWORD *)p_pathProximity - 1) = 0;
        *p_pathProximity = 0;
      }
      DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
      IOHIDEventSetFloatValue();
      IOHIDEventSetFloatValue();
      IOHIDEventAppendEvent();
      CFRelease(DigitizerFingerEvent);
      ++v6;
      p_pathProximity += 48;
    }
    while (v6 < self->_activePointCount);
  }
  return DigitizerEvent;
}

- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3
{
  _QWORD block[5];

  if (!self->_ioSystemClient)
  {
    self->_ioSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    if (!a3)
      return 1;
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    CFRetain(a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TouchEventGenerator__sendHIDEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  return 1;
}

void __37__TouchEventGenerator__sendHIDEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "openSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_62);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("This code assumes a single window scene exists to correctly route touches."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_contextId");

  BKSHIDEventSetDigitizerInfo();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_enqueueHIDEvent:", *(_QWORD *)(a1 + 32));

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

id __37__TouchEventGenerator__sendHIDEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == (void *)*MEMORY[0x1E0DC5650])
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  unint64_t activePointCount;
  uint64_t v6;
  CGPoint *p_point;
  CGPoint v8;
  __IOHIDEvent *v9;

  activePointCount = self->_activePointCount;
  if (activePointCount)
  {
    if (!a4)
    {
      self->_activePointCount = 0;
      v6 = 4;
      goto LABEL_12;
    }
    if (activePointCount == a4)
      v6 = 2;
    else
      v6 = 3;
    self->_activePointCount = a4;
  }
  else
  {
    self->_activePointCount = a4;
    v6 = 1;
    if (!a4)
      goto LABEL_12;
  }
  p_point = &self->_activePoints[0].point;
  do
  {
    v8 = *a3++;
    *p_point = v8;
    p_point += 3;
    --a4;
  }
  while (a4);
LABEL_12:
  v9 = -[TouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", v6);
  -[TouchEventGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v9);
  CFRelease(v9);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t v5;
  CGPoint *p_point;
  CGPoint v7;
  __IOHIDEvent *v8;

  v5 = 5;
  if (a4 < 5)
    v5 = a4;
  if (v5)
  {
    p_point = &self->_activePoints[0].point;
    do
    {
      v7 = *a3++;
      *p_point = v7;
      p_point += 3;
      --v5;
    }
    while (v5);
  }
  v8 = -[TouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", 1);
  -[TouchEventGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v8);
  CFRelease(v8);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4
{
  unint64_t v4;
  char *v5;
  unint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 5)
    v4 = 5;
  else
    v4 = a4;
  if (v4)
  {
    v5 = (char *)&v7[1] - (16 * v4);
    v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  -[TouchEventGenerator touchDownAtPoints:touchCount:](self, "touchDownAtPoints:touchCount:", a3.x, a3.y);
}

- (void)touchDown:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  -[TouchEventGenerator touchDownAtPoints:touchCount:](self, "touchDownAtPoints:touchCount:", &v3, 1);
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t activePointCount;
  unint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  __int128 v9;
  __IOHIDEvent *v10;

  activePointCount = self->_activePointCount;
  if (a4 >= activePointCount)
    v6 = self->_activePointCount;
  else
    v6 = a4;
  if (v6 >= 5)
    v6 = 5;
  v7 = activePointCount - v6;
  if (v6)
  {
    v8 = (_OWORD *)((char *)&self->_activePoints[0].point.x + 48 * activePointCount - 48 * v6);
    do
    {
      v9 = (__int128)*a3++;
      *v8 = v9;
      v8 += 3;
      --v6;
    }
    while (v6);
  }
  v10 = -[TouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", 4);
  -[TouchEventGenerator _sendHIDEvent:](self, "_sendHIDEvent:", v10);
  CFRelease(v10);
  self->_activePointCount = v7;
}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4
{
  unint64_t v4;
  char *v5;
  unint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 5)
    v4 = 5;
  else
    v4 = a4;
  if (v4)
  {
    v5 = (char *)&v7[1] - (16 * v4);
    v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  -[TouchEventGenerator liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", a3.x, a3.y);
}

- (void)liftUp:(CGPoint)a3
{
  -[TouchEventGenerator liftUp:touchCount:](self, "liftUp:touchCount:", 1, a3.x, a3.y);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double Current;
  int v12;
  double v13;
  long double v14;
  uint64_t v15;
  CGPoint *p_point;
  float64x2_t v17;
  float64x2_t *v18;
  CGPoint *v19;
  unint64_t v20;
  float64x2_t *v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  double v26;
  timespec __rqtp;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a4 >= 5)
    v8 = 5;
  else
    v8 = a4;
  v9 = MEMORY[0x1E0C80A78](self, a2);
  MEMORY[0x1E0C80A78](v9, v10);
  Current = CFAbsoluteTimeGetCurrent();
  if (a5 + -0.016 > 0.0)
  {
    v12 = 0;
    v26 = 1000000000.0;
    do
    {
      v13 = CFAbsoluteTimeGetCurrent() - Current;
      if (v8)
      {
        v14 = sin(v13 / a5 * 3.14159265 * 0.5);
        *(double *)&v15 = sin(v13 / a5 * v14 * 3.14159265 * 0.5);
        p_point = &self->_activePoints[0].point;
        v17 = (float64x2_t)vdupq_lane_s64(v15, 0);
        v18 = (float64x2_t *)(&v26 - 2 * v8);
        v19 = a3;
        v20 = v8;
        v21 = v18;
        do
        {
          if (!v12)
            *v21 = *(float64x2_t *)p_point;
          v22 = *v21++;
          v23 = v22;
          v24 = *(float64x2_t *)v19++;
          *v18++ = vmlaq_f64(v23, v17, vsubq_f64(v24, v23));
          p_point += 3;
          --v20;
        }
        while (v20);
      }
      -[TouchEventGenerator _updateTouchPoints:count:](self, "_updateTouchPoints:count:", &v26 - 2 * v8, v8, *(_QWORD *)&v26);
      v25 = -(v13 - (double)v12 * 0.016);
      if (v25 > 0.0)
      {
        __rqtp.tv_sec = 0;
        __rqtp.tv_nsec = (uint64_t)(v25 * v26);
        nanosleep(&__rqtp, 0);
      }
      ++v12;
    }
    while (v13 < a5 + -0.016);
  }
  -[TouchEventGenerator _updateTouchPoints:count:](self, "_updateTouchPoints:count:", a3, v8);
}

@end
