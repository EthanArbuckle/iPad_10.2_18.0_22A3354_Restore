@implementation _WKTouchEventGenerator

+ (id)sharedTouchEventGenerator
{
  id result;

  if (_MergedGlobals_35 == 1)
    return (id)qword_1ECE71C78;
  result = objc_alloc_init(_WKTouchEventGenerator);
  qword_1ECE71C78 = (uint64_t)result;
  _MergedGlobals_35 = 1;
  return result;
}

+ (int64_t)nextEventCallbackID
{
  return +++[_WKTouchEventGenerator nextEventCallbackID]::callbackID;
}

- (_WKTouchEventGenerator)init
{
  _WKTouchEventGenerator *v2;
  _WKTouchEventGenerator *v3;
  uint64_t v4;
  $AEAF350CC348380BD96160ACEEB167AC *activePoints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKTouchEventGenerator;
  v2 = -[_WKTouchEventGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    activePoints = v2->_activePoints;
    do
    {
      activePoints->identifier = fingerIdentifiers[v4];
      ++activePoints;
      ++v4;
    }
    while (v4 != 5);
    v2->_eventCallbacks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKTouchEventGenerator;
  -[_WKTouchEventGenerator dealloc](&v3, sel_dealloc);
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
      if (DigitizerFingerEvent)
        CFRelease(DigitizerFingerEvent);
      ++v6;
      p_pathProximity += 48;
    }
    while (v6 < self->_activePointCount);
  }
  return DigitizerEvent;
}

- (BOOL)_sendHIDEvent:(__IOHIDEvent *)a3 window:(id)a4
{
  void *v7;
  void *m_ptr;
  WTF::RunLoop *v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  if (!self->_ioSystemClient.m_ptr)
  {
    v7 = (void *)IOHIDEventSystemClientCreate();
    m_ptr = self->_ioSystemClient.m_ptr;
    self->_ioSystemClient.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  if (a3)
  {
    v9 = (WTF::RunLoop *)objc_msgSend(a4, "_contextId");
    v10 = (int)v9;
    WTF::RunLoop::main(v9);
    CFRetain(a3);
    v11 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v11 = &off_1E34AAAD8;
    *(_QWORD *)(v11 + 8) = a3;
    *(_DWORD *)(v11 + 16) = v10;
    v13 = v11;
    WTF::RunLoop::dispatch();
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
  return 1;
}

- (BOOL)_sendMarkerHIDEventInWindow:(id)a3 completionBlock:(id)a4
{
  uint64_t VendorDefinedEvent;
  uint64_t v8;
  WTF::RunLoop *v9;
  int v10;
  uint64_t v11;
  uint64_t v13;
  int64_t v14;

  v14 = +[_WKTouchEventGenerator nextEventCallbackID](_WKTouchEventGenerator, "nextEventCallbackID");
  -[NSMutableDictionary setObject:forKey:](self->_eventCallbacks, "setObject:forKey:", _Block_copy(a4), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v14));
  mach_absolute_time();
  VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    v8 = VendorDefinedEvent;
    v9 = (WTF::RunLoop *)objc_msgSend(a3, "_contextId");
    v10 = (int)v9;
    WTF::RunLoop::main(v9);
    v11 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v11 = &off_1E34AAB00;
    *(_QWORD *)(v11 + 8) = v8;
    *(_DWORD *)(v11 + 16) = v10;
    v13 = v11;
    WTF::RunLoop::dispatch();
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
  return 1;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4 window:(id)a5
{
  unint64_t activePointCount;
  uint64_t v8;
  CGPoint *p_point;
  CGPoint v10;
  __IOHIDEvent *v11;

  activePointCount = self->_activePointCount;
  if (activePointCount)
  {
    if (a4)
    {
      if (activePointCount == a4)
        v8 = 2;
      else
        v8 = 3;
      self->_activePointCount = a4;
      goto LABEL_8;
    }
    self->_activePointCount = 0;
    v8 = 4;
  }
  else
  {
    self->_activePointCount = a4;
    v8 = 1;
    if (a4)
    {
LABEL_8:
      p_point = &self->_activePoints[0].point;
      do
      {
        v10 = *a3++;
        *p_point = v10;
        p_point += 3;
        --a4;
      }
      while (a4);
    }
  }
  v11 = -[_WKTouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", v8);
  -[_WKTouchEventGenerator _sendHIDEvent:window:](self, "_sendHIDEvent:window:", v11, a5);
  if (v11)
    CFRelease(v11);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t v7;
  CGPoint *p_point;
  CGPoint v9;
  __IOHIDEvent *v10;

  v7 = 5;
  if (a4 < 5)
    v7 = a4;
  self->_activePointCount = v7;
  if (v7)
  {
    p_point = &self->_activePoints[0].point;
    do
    {
      v9 = *a3++;
      *p_point = v9;
      p_point += 3;
      --v7;
    }
    while (v7);
  }
  v10 = -[_WKTouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", 1);
  -[_WKTouchEventGenerator _sendHIDEvent:window:](self, "_sendHIDEvent:window:", v10, a5);
  if (v10)
    CFRelease(v10);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t v7;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  CGFloat *v13;
  void *v14;

  if (a4 >= 5)
    v7 = 5;
  else
    v7 = a4;
  if (v7)
  {
    y = a3.y;
    x = a3.x;
    v10 = WTF::fastMalloc((WTF *)(16 * v7));
    v11 = (WTF *)v10;
    v12 = 0;
    do
    {
      v13 = (CGFloat *)(v10 + v12);
      *v13 = x;
      v13[1] = y;
      v12 += 16;
    }
    while (16 * v7 != v12);
  }
  else
  {
    v11 = 0;
  }
  -[_WKTouchEventGenerator touchDownAtPoints:touchCount:window:](self, "touchDownAtPoints:touchCount:window:", v11, v7, a5);
  if (v11)
    WTF::fastFree(v11, v14);
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t activePointCount;
  unint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  __int128 v12;
  __IOHIDEvent *v13;

  activePointCount = self->_activePointCount;
  if (a4 >= activePointCount)
    v8 = self->_activePointCount;
  else
    v8 = a4;
  if (v8 >= 5)
    v9 = 5;
  else
    v9 = v8;
  if (v9)
  {
    v10 = (_OWORD *)((char *)&self->_activePoints[0].point.x + 48 * activePointCount - 48 * v9);
    v11 = v9;
    do
    {
      v12 = (__int128)*a3++;
      *v10 = v12;
      v10 += 3;
      --v11;
    }
    while (v11);
  }
  v13 = -[_WKTouchEventGenerator _createIOHIDEventType:](self, "_createIOHIDEventType:", 4);
  -[_WKTouchEventGenerator _sendHIDEvent:window:](self, "_sendHIDEvent:window:", v13, a5);
  self->_activePointCount = activePointCount - v9;
  if (v13)
    CFRelease(v13);
}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4 window:(id)a5
{
  unint64_t v7;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  CGFloat *v13;
  void *v14;

  if (a4 >= 5)
    v7 = 5;
  else
    v7 = a4;
  if (v7)
  {
    y = a3.y;
    x = a3.x;
    v10 = WTF::fastMalloc((WTF *)(16 * v7));
    v11 = (WTF *)v10;
    v12 = 0;
    do
    {
      v13 = (CGFloat *)(v10 + v12);
      *v13 = x;
      v13[1] = y;
      v12 += 16;
    }
    while (16 * v7 != v12);
  }
  else
  {
    v11 = 0;
  }
  -[_WKTouchEventGenerator liftUpAtPoints:touchCount:window:](self, "liftUpAtPoints:touchCount:window:", v11, v7, a5);
  if (v11)
    WTF::fastFree(v11, v14);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5 window:(id)a6
{
  unint64_t v10;
  WTF *v11;
  WTF *v12;
  double Current;
  int v14;
  double v15;
  long double v16;
  uint64_t v17;
  CGPoint *p_point;
  float64x2_t v19;
  float64x2_t *v20;
  CGPoint *v21;
  float64x2_t *v22;
  unint64_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  double v27;
  void *v28;
  timespec __rqtp;

  if (a4 >= 5)
    v10 = 5;
  else
    v10 = a4;
  if (v10)
  {
    v11 = (WTF *)WTF::fastMalloc((WTF *)(16 * v10));
    v12 = (WTF *)WTF::fastMalloc((WTF *)(16 * v10));
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (a5 + -0.016 > 0.0)
  {
    v14 = 0;
    do
    {
      v15 = CFAbsoluteTimeGetCurrent() - Current;
      if (v10)
      {
        v16 = sin(v15 / a5 * 3.14159265 * 0.5);
        *(double *)&v17 = sin(v15 / a5 * v16 * 3.14159265 * 0.5);
        p_point = &self->_activePoints[0].point;
        v19 = (float64x2_t)vdupq_lane_s64(v17, 0);
        v20 = (float64x2_t *)v11;
        v21 = a3;
        v22 = (float64x2_t *)v12;
        v23 = v10;
        do
        {
          if (!v14)
            *v20 = *(float64x2_t *)p_point;
          v24 = *v20++;
          v25 = v24;
          v26 = *(float64x2_t *)v21++;
          *v22++ = vmlaq_f64(v25, v19, vsubq_f64(v26, v25));
          p_point += 3;
          --v23;
        }
        while (v23);
      }
      -[_WKTouchEventGenerator _updateTouchPoints:count:window:](self, "_updateTouchPoints:count:window:", v12, v10, a6);
      v27 = -(v15 - (double)v14 * 0.016);
      if (v27 > 0.0)
      {
        __rqtp.tv_sec = 0;
        __rqtp.tv_nsec = (uint64_t)(v27 * 1000000000.0);
        nanosleep(&__rqtp, 0);
      }
      ++v14;
    }
    while (v15 < a5 + -0.016);
  }
  -[_WKTouchEventGenerator _updateTouchPoints:count:window:](self, "_updateTouchPoints:count:window:", a3, v10, a6);
  if (v12)
    WTF::fastFree(v12, v28);
  if (v11)
    WTF::fastFree(v11, v28);
}

- (void)touchDown:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5
{
  -[_WKTouchEventGenerator touchDown:touchCount:window:](self, "touchDown:touchCount:window:", 1, a4, a3.x, a3.y);
  -[_WKTouchEventGenerator _sendMarkerHIDEventInWindow:completionBlock:](self, "_sendMarkerHIDEventInWindow:completionBlock:", a4, a5);
}

- (void)liftUp:(CGPoint)a3 window:(id)a4 completionBlock:(id)a5
{
  -[_WKTouchEventGenerator liftUp:touchCount:window:](self, "liftUp:touchCount:window:", 1, a4, a3.x, a3.y);
  -[_WKTouchEventGenerator _sendMarkerHIDEventInWindow:completionBlock:](self, "_sendMarkerHIDEventInWindow:completionBlock:", a4, a5);
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4 window:(id)a5 completionBlock:(id)a6
{
  CGPoint v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[_WKTouchEventGenerator moveToPoints:touchCount:duration:window:](self, "moveToPoints:touchCount:duration:window:", &v9, 1, a5, a4);
  -[_WKTouchEventGenerator _sendMarkerHIDEventInWindow:completionBlock:](self, "_sendMarkerHIDEventInWindow:completionBlock:", a5, a6);
}

- (void)receivedHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD);

  if (IOHIDEventGetType() == 1)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", IOHIDEventGetIntegerValue());
    v5 = -[NSMutableDictionary objectForKey:](self->_eventCallbacks, "objectForKey:", v4);
    if (v5)
    {
      v6 = (void (**)(_QWORD))v5;
      -[NSMutableDictionary removeObjectForKey:](self->_eventCallbacks, "removeObjectForKey:", v4);
      v6[2](v6);
      _Block_release(v6);
    }
  }
}

- (NSMutableDictionary)eventCallbacks
{
  return self->_eventCallbacks;
}

- (void)setEventCallbacks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_ioSystemClient.m_ptr;
  self->_ioSystemClient.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (_QWORD)_sendHIDEvent:(_QWORD *)a1 window:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34AAAD8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_sendHIDEvent:(WTF *)this window:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34AAAD8;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)_sendHIDEvent:(uint64_t)a1 window:
{
  softLinkBKSHIDEventSetDigitizerInfo(*(__IOHIDEvent **)(a1 + 8), *(_DWORD *)(a1 + 16), 0, 0, 0, 0.0, 0.0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "_enqueueHIDEvent:", *(_QWORD *)(a1 + 8));
}

- (_QWORD)_sendMarkerHIDEventInWindow:(_QWORD *)a1 completionBlock:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34AAB00;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_sendMarkerHIDEventInWindow:(WTF *)this completionBlock:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34AAB00;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)_sendMarkerHIDEventInWindow:(uint64_t)a1 completionBlock:
{
  softLinkBKSHIDEventSetDigitizerInfo(*(__IOHIDEvent **)(a1 + 8), *(_DWORD *)(a1 + 16), 0, 0, 0, 0.0, 0.0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "_enqueueHIDEvent:", *(_QWORD *)(a1 + 8));
}

@end
