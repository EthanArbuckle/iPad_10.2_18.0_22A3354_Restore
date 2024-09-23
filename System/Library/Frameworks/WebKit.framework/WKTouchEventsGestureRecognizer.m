@implementation WKTouchEventsGestureRecognizer

- (WKTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5
{
  WKTouchEventsGestureRecognizer *v8;
  WKTouchEventsGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *m_ptr;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WKTouchEventsGestureRecognizer;
  v8 = -[WKTouchEventsGestureRecognizer initWithTarget:action:](&v14, sel_initWithTarget_action_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_touchTarget, a3);
    v9->_touchAction = a4;
    objc_storeWeak((id *)&v9->_touchEventDelegate, a5);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = v10;
    if (v10)
      CFRetain(v10);
    m_ptr = v9->_activeTouchesByIdentifier.m_ptr;
    v9->_activeTouchesByIdentifier.m_ptr = v11;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WKTouchEventsGestureRecognizer reset](v9, "reset");
  }
  return v9;
}

- (void)reset
{
  unsigned int m_size;
  uint64_t v4;
  _QWORD *v5;
  CGPoint *v6;

  if (self->_wasExplicitlyCancelled && self->_lastTouchEvent.type <= 1u)
  {
    self->_lastTouchEvent.type = 3;
    m_size = self->_lastTouchEvent.touchPoints.m_size;
    if (m_size)
    {
      v4 = 88 * m_size;
      v5 = (_QWORD *)((char *)self->_lastTouchEvent.touchPoints.m_buffer + 40);
      do
      {
        *v5 = 4;
        v5 += 11;
        v4 -= 88;
      }
      while (v4);
    }
    -[WKTouchEventsGestureRecognizer performAction](self, "performAction");
  }
  self->_passedHitTest = 0;
  self->_defaultPrevented = 0;
  self->_dispatchingTouchEvents = 0;
  self->_wasExplicitlyCancelled = 0;
  self->_originalGestureDistance = NAN;
  self->_originalGestureAngle = NAN;
  self->_isPotentialTap = 0;
  self->_lastTouchEvent.type = 0;
  self->_lastTouchEvent.timestamp = 0.0;
  v6 = (CGPoint *)MEMORY[0x1E0C9D538];
  self->_lastTouchEvent.locationInScreenCoordinates = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastTouchEvent.locationInDocumentCoordinates = *v6;
  *(int64x2_t *)&self->_lastTouchEvent.scale = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  self->_lastTouchEvent.isPotentialTap = 0;
  self->_lastTouchesBeganTime = 0.0;
  if (self->_lastTouchesBeganLocation.__engaged_)
    self->_lastTouchesBeganLocation.__engaged_ = 0;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 328) = 0;
  *((_BYTE *)self + 344) = 0;
  *((_BYTE *)self + 352) = 0;
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 50) = 0;
  *((_QWORD *)self + 51) = 0;
  *((_BYTE *)self + 416) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_BYTE *)self + 440) = 0;
  *((_QWORD *)self + 56) = 0;
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    do
      incrementingTouchIdentifier = arc4random();
    while ((incrementingTouchIdentifier + 1) < 2);
  }
}

- (NSMapTable)activeTouchesByIdentifier
{
  return (NSMapTable *)self->_activeTouchesByIdentifier.m_ptr;
}

- (void)cancel
{
  unint64_t v3;
  uint64_t v4;

  self->_wasExplicitlyCancelled = 0;
  v3 = -[WKTouchEventsGestureRecognizer state](self, "state");
  if (v3 <= 2)
  {
    v4 = qword_1978D03C0[v3];
    self->_wasExplicitlyCancelled = 1;
    -[WKTouchEventsGestureRecognizer setState:](self, "setState:", v4);
  }
}

- (void)_updateTapStateWithTouches:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  optional<CGPoint> *p_lastTouchesBeganLocation;
  BOOL v11;

  if (objc_msgSend(a3, "count") == 1)
  {
    v5 = (void *)objc_msgSend(a3, "anyObject");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(v5, "locationInView:", -[WKTouchEventsGestureRecognizer view](self, "view"));
    p_lastTouchesBeganLocation = &self->_lastTouchesBeganLocation;
    if (!self->_lastTouchesBeganLocation.__engaged_)
    {
      self->_lastTouchesBeganTime = v7;
      p_lastTouchesBeganLocation->var0.__val_.x = v8;
      self->_lastTouchesBeganLocation.var0.__val_.y = v9;
      v11 = 1;
      self->_lastTouchesBeganLocation.__engaged_ = 1;
      goto LABEL_8;
    }
    if (v7 - self->_lastTouchesBeganTime <= 0.75 && vabdd_f64(p_lastTouchesBeganLocation->var0.__val_.x, v8) <= 45.0)
    {
      v11 = vabdd_f64(self->_lastTouchesBeganLocation.var0.__val_.y, v9) <= 45.0;
      goto LABEL_8;
    }
  }
  v11 = 0;
LABEL_8:
  self->_lastTouchEvent.isPotentialTap = v11;
  self->_isPotentialTap = v11;
}

- (void)_updateTapStateWithTouches:(id)a3 type:(unsigned __int8)a4
{
  switch(a4)
  {
    case 0u:
      goto LABEL_3;
    case 1u:
    case 2u:
      if (self->_isPotentialTap)
LABEL_3:
        -[WKTouchEventsGestureRecognizer _updateTapStateWithTouches:](self, "_updateTapStateWithTouches:", a3);
      break;
    case 3u:
      self->_lastTouchEvent.isPotentialTap = 0;
      self->_isPotentialTap = 0;
      break;
    default:
      return;
  }
}

- (void)_recordTouches:(id)a3 type:(unsigned __int8)a4
{
  WKTouchEvent *p_lastTouchEvent;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t m_size;
  unint64_t m_capacity;
  unint64_t v12;
  unint64_t v13;
  WTF *m_buffer;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  WTF *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  WKTouchPoint *v24;
  uint64_t v25;
  double v26;
  CFTimeInterval v27;
  double v28;
  uint64_t v29;
  unsigned int v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id AssociatedObject;
  char isKindOfClass;
  char v39;
  char v40;
  int v41;
  WKTouchEvent *v42;
  WKTouchPoint *v43;
  double *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  unint64_t v74;
  double v75;
  int v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  float v87;
  float v88;
  float v89;
  float v90;
  unint64_t v91;
  double v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  p_lastTouchEvent = &self->_lastTouchEvent;
  v95 = a4;
  self->_lastTouchEvent.type = a4;
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  v7 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  self->_dispatchingTouchEvents = 1;
  v8 = objc_msgSend(a3, "count");
  v9 = v8;
  m_size = p_lastTouchEvent->touchPoints.m_size;
  if (v8 != m_size)
  {
    if (v8 > m_size)
    {
      m_capacity = p_lastTouchEvent->touchPoints.m_capacity;
      if (v8 > m_capacity)
      {
        v12 = m_capacity + (m_capacity >> 2);
        if (v12 >= 0x10)
          v13 = v12 + 1;
        else
          v13 = 16;
        if (v13 <= v8)
          v13 = v8;
        if (v13 >= 0x2E8BA2F)
        {
          __break(0xC471u);
LABEL_84:
          JUMPOUT(0x197296DD0);
        }
        m_buffer = (WTF *)p_lastTouchEvent->touchPoints.m_buffer;
        v15 = 88 * v13;
        v16 = WTF::fastMalloc((WTF *)(88 * v13));
        p_lastTouchEvent->touchPoints.m_capacity = (v15 & 0xFFFFFFF8) / 0x58;
        p_lastTouchEvent->touchPoints.m_buffer = (WKTouchPoint *)v16;
        if ((_DWORD)m_size)
        {
          v18 = 88 * m_size;
          v19 = m_buffer;
          do
          {
            v20 = *((_OWORD *)v19 + 1);
            *(_OWORD *)v16 = *(_OWORD *)v19;
            *(_OWORD *)(v16 + 16) = v20;
            v21 = *((_OWORD *)v19 + 2);
            v22 = *((_OWORD *)v19 + 3);
            v23 = *((_OWORD *)v19 + 4);
            *(_QWORD *)(v16 + 80) = *((_QWORD *)v19 + 10);
            *(_OWORD *)(v16 + 48) = v22;
            *(_OWORD *)(v16 + 64) = v23;
            *(_OWORD *)(v16 + 32) = v21;
            v16 += 88;
            v19 = (WTF *)((char *)v19 + 88);
            v18 -= 88;
          }
          while (v18);
        }
        if (m_buffer)
        {
          if ((WTF *)p_lastTouchEvent->touchPoints.m_buffer == m_buffer)
          {
            p_lastTouchEvent->touchPoints.m_buffer = 0;
            p_lastTouchEvent->touchPoints.m_capacity = 0;
          }
          WTF::fastFree(m_buffer, v17);
        }
      }
      v24 = p_lastTouchEvent->touchPoints.m_buffer;
      if (v24)
      {
        v25 = p_lastTouchEvent->touchPoints.m_size;
        if (v9 != v25)
          bzero((char *)v24 + 88 * v25, 88 * ((88 * v9 - 88 * v25 - 88) / 0x58) + 88);
      }
    }
    p_lastTouchEvent->touchPoints.m_size = v9;
  }
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  v27 = CACurrentMediaTime() - v26;
  v28 = *MEMORY[0x1E0C9ADF8];
  p_lastTouchEvent->timestamp = v28 + CFAbsoluteTimeGetCurrent() - v27;
  objc_msgSend(self->_activeTouchesByIdentifier.m_ptr, "removeAllObjects");
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v96 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
  if (!v96)
  {
    v33 = v6;
    v85 = v7;
    v32 = v6;
    v84 = v7;
    v31 = v6;
    v86 = v7;
    goto LABEL_78;
  }
  v91 = v9;
  v29 = 0;
  v30 = 0;
  v94 = *(_QWORD *)v106;
  v98 = v7;
  v99 = v6;
  v31 = v6;
  v101 = v6;
  v102 = v7;
  v100 = v7;
  v103 = v7;
  v104 = v7;
  v32 = v6;
  v33 = v6;
  do
  {
    v34 = 0;
    v35 = 88 * v29;
    do
    {
      if (*(_QWORD *)v106 != v94)
        objc_enumerationMutation(a3);
      v36 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v34);
      AssociatedObject = objc_getAssociatedObject(v36, &associatedTouchIdentifierKey);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v39 = objc_msgSend(v36, "_isPointerTouch");
      if (v95)
        v40 = 0;
      else
        v40 = v39;
      if ((v40 & 1) != 0 || (isKindOfClass & 1) == 0 || !AssociatedObject)
      {
        if (incrementingTouchIdentifier == -2)
          v41 = 1;
        else
          v41 = incrementingTouchIdentifier + 1;
        incrementingTouchIdentifier = v41;
        AssociatedObject = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
        objc_setAssociatedObject(v36, &associatedTouchIdentifierKey, AssociatedObject, (void *)1);
      }
      v97 = v31;
      objc_msgSend(self->_activeTouchesByIdentifier.m_ptr, "setObject:forKey:", v36, AssociatedObject);
      if (v29 + v34 >= (unint64_t)p_lastTouchEvent->touchPoints.m_size)
      {
        __break(0xC471u);
        goto LABEL_84;
      }
      v42 = p_lastTouchEvent;
      v43 = p_lastTouchEvent->touchPoints.m_buffer;
      v44 = (double *)((char *)v43 + v35);
      objc_msgSend(v36, "locationInView:", 0);
      v46 = v45;
      v48 = v47;
      *v44 = v45;
      v44[1] = v47;
      objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "convertPoint:fromView:", 0, v45, v47);
      v50 = v49;
      v52 = v51;
      v44[2] = v49;
      v44[3] = v51;
      *((_DWORD *)v44 + 8) = objc_msgSend(AssociatedObject, "unsignedIntValue");
      *((_QWORD *)v44 + 5) = objc_msgSend(v36, "phase");
      objc_msgSend(v36, "majorRadius");
      *((_QWORD *)v44 + 6) = v53;
      objc_msgSend(v36, "maximumPossibleForce");
      v54 = 0.0;
      if (v55 > 0.0)
      {
        objc_msgSend(v36, "force");
        v93 = v33;
        v56 = v32;
        v57 = v7;
        v58 = v6;
        v60 = v59;
        objc_msgSend(v36, "maximumPossibleForce");
        v54 = v60 / v61;
        v6 = v58;
        v7 = v57;
        v32 = v56;
        v33 = v93;
      }
      v44[7] = v54;
      if (objc_msgSend(v36, "type") == 2)
      {
        *((_BYTE *)v44 + 80) = 1;
        objc_msgSend(v36, "altitudeAngle");
        *(_QWORD *)((char *)v43 + v35 + 64) = v62;
        objc_msgSend(v36, "azimuthAngleInView:", objc_msgSend((id)-[WKTouchEventsGestureRecognizer view](self, "view"), "window"));
      }
      else
      {
        *((_BYTE *)v44 + 80) = 0;
        *(_QWORD *)((char *)v43 + v35 + 64) = 0;
        v63 = 0;
      }
      v65 = v103;
      v64 = v104;
      v66 = v98;
      v67 = v99;
      v69 = v101;
      v68 = v102;
      v70 = v100;
      v71 = v100 + v46;
      *(_QWORD *)((char *)v43 + v35 + 72) = v63;
      v72 = v102 + v50;
      if (v30 == 1)
        v73 = v50;
      else
        v73 = v104;
      v74 = *((_QWORD *)v44 + 5) - 3;
      if (v30 == 1)
        v75 = v52;
      else
        v75 = v32;
      if (v30)
        v76 = v30 + 1;
      else
        v76 = 1;
      if (v30)
      {
        v77 = v103;
      }
      else
      {
        v73 = v104;
        v75 = v32;
        v77 = v50;
      }
      if (v30)
        v78 = v33;
      else
        v78 = v52;
      v79 = v98 + v46;
      v31 = v97;
      if (v74 > 1)
      {
        v68 = v102 + v50;
      }
      else
      {
        v6 = v6 + v52;
        v7 = v7 + v50;
        v66 = v79;
        v31 = v97 + v48;
      }
      if (v74 > 1)
        v69 = v101 + v52;
      v101 = v69;
      v102 = v68;
      if (v74 > 1)
        v70 = v71;
      v100 = v70;
      if (v74 > 1)
        v67 = v99 + v48;
      v98 = v66;
      v99 = v67;
      if (v74 > 1)
      {
        v30 = v76;
        v64 = v73;
        v32 = v75;
      }
      ++v34;
      if (v74 > 1)
        v65 = v77;
      v103 = v65;
      v104 = v64;
      v35 += 88;
      if (v74 > 1)
        v33 = v78;
      p_lastTouchEvent = v42;
    }
    while (v96 != v34);
    v29 += v34;
    v96 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v105, v109, 16, v72);
  }
  while (v96);
  if (v30)
  {
    v80 = v100 / (double)v30;
    v81 = v99 / (double)v30;
    v82 = v102 / (double)v30;
    v83 = v101 / (double)v30;
    v85 = v103;
    v84 = v104;
    goto LABEL_79;
  }
  v9 = v91;
  v85 = v103;
  v84 = v104;
  v86 = v98;
LABEL_78:
  v30 = 0;
  v80 = v86 / (double)v9;
  v81 = v31 / (double)v9;
  v82 = v7 / (double)v9;
  v83 = v6 / (double)v9;
LABEL_79:
  p_lastTouchEvent->scale = 0.0;
  p_lastTouchEvent->locationInScreenCoordinates.x = v80;
  p_lastTouchEvent->locationInScreenCoordinates.y = v81;
  p_lastTouchEvent->locationInDocumentCoordinates.x = v82;
  p_lastTouchEvent->locationInDocumentCoordinates.y = v83;
  p_lastTouchEvent->rotation = 0.0;
  if (v30 >= 2)
  {
    v87 = (v32 - v33) * (v32 - v33) + (v84 - v85) * (v84 - v85);
    p_lastTouchEvent->scale = sqrtf(v87) / self->_originalGestureDistance;
    v88 = v84 - v85;
    v89 = v32 - v33;
    v90 = atan2f(v88, v89) * 180.0 * 0.318309886;
    p_lastTouchEvent->rotation = self->_originalGestureAngle - v90;
    p_lastTouchEvent->inJavaScriptGesture = 1;
  }
  -[WKTouchEventsGestureRecognizer _updateTapStateWithTouches:type:](self, "_updateTapStateWithTouches:type:", a3, v95);
}

- (void)performAction
{
  objc_msgSend(objc_loadWeak(&self->_touchTarget), self->_touchAction, self);
}

- (BOOL)_hasActiveTouchesForEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a3, "touchesForGestureRecognizer:", self, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "phase") < 3)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "phase") != 2)
        {
          v15 = objc_msgSend(v14, "phase");
          if ((uint64_t)v11 <= v15)
            v11 = v15;
        }
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
    if (v11 <= 7)
      v16 = 0x201000302010100uLL >> (8 * v11);
    else
      v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  if ((_DWORD)v5 == v16)
  {
    -[WKTouchEventsGestureRecognizer _recordTouches:type:](self, "_recordTouches:type:", a3, v5);
    -[WKTouchEventsGestureRecognizer performAction](self, "performAction");
    if (self->_defaultPrevented)
    {
      if (-[WKTouchEventsGestureRecognizer state](self, "state"))
        v17 = 2;
      else
        v17 = 1;
      -[WKTouchEventsGestureRecognizer setState:](self, "setState:", v17);
    }
    if (v5 >= 2
      && !-[WKTouchEventsGestureRecognizer _hasActiveTouchesForEvent:](self, "_hasActiveTouchesForEvent:", a4))
    {
      if (-[WKTouchEventsGestureRecognizer state](self, "state"))
      {
        if ((_DWORD)v5 == 2)
        {
          v18 = 3;
        }
        else
        {
          if ((_DWORD)v5 != 3)
            return;
          v18 = 4;
        }
      }
      else
      {
        v18 = 5;
      }
      -[WKTouchEventsGestureRecognizer setState:](self, "setState:", v18);
    }
  }
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id Weak;

  v6 = objc_msgSend(a4, "touchesForGestureRecognizer:", self);
  Weak = objc_loadWeak((id *)&self->_touchEventDelegate);
  if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(Weak, "shouldIgnoreTouchEvent"))
  {
    if (self->_passedHitTest)
    {
LABEL_4:
      -[WKTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", v6, a4, 0);
      return;
    }
    if (((objc_opt_respondsToSelector() & 1) == 0
       || (objc_msgSend(Weak, "gestureRecognizer:shouldIgnoreTouchEvent:", self, a4) & 1) == 0)
      && (objc_msgSend(Weak, "isAnyTouchOverActiveArea:", v6) & 1) != 0)
    {
      self->_passedHitTest = 1;
      goto LABEL_4;
    }
  }
  -[WKTouchEventsGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[WKTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", objc_msgSend(a4, "touchesForGestureRecognizer:", self), a4, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[WKTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", objc_msgSend(a4, "touchesForGestureRecognizer:", self), a4, 2);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[WKTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", objc_msgSend(a4, "touchesForGestureRecognizer:", self), a4, 3);
}

- (const)lastTouchEvent
{
  return &self->_lastTouchEvent;
}

- (BOOL)isDefaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (BOOL)isDispatchingTouchEvents
{
  return self->_dispatchingTouchEvents;
}

- (void).cxx_destruct
{
  void *m_ptr;
  WKTouchPoint *m_buffer;

  m_ptr = self->_activeTouchesByIdentifier.m_ptr;
  self->_activeTouchesByIdentifier.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  m_buffer = self->_lastTouchEvent.touchPoints.m_buffer;
  if (m_buffer)
  {
    self->_lastTouchEvent.touchPoints.m_buffer = 0;
    self->_lastTouchEvent.touchPoints.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  objc_destroyWeak((id *)&self->_touchEventDelegate);
  objc_destroyWeak(&self->_touchTarget);
}

@end
