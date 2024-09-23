@implementation AXEventRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AXEventRepresentation)representationWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  objc_msgSend(v3, "secureUnarchiveData:withExpectedClass:otherAllowedClasses:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXEventRepresentation *)v5;
}

+ (AXEventRepresentation)representationWithType:(unsigned int)a3 subtype:(int)a4 time:(unint64_t)a5 location:(CGPoint)a6 windowLocation:(CGPoint)a7 handInfo:(id)a8
{
  double y;
  double x;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  id v15;
  AXEventRepresentation *v16;

  y = a7.y;
  x = a7.x;
  v10 = a6.y;
  v11 = a6.x;
  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v15 = a8;
  v16 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v16, "setType:", v14);
  -[AXEventRepresentation setSubtype:](v16, "setSubtype:", v13);
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v16, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)a5));
  -[AXEventRepresentation setLocation:](v16, "setLocation:", v11, v10);
  -[AXEventRepresentation setWindowLocation:](v16, "setWindowLocation:", x, y);
  -[AXEventRepresentation setHandInfo:](v16, "setHandInfo:", v15);

  -[AXEventRepresentation setIsGeneratedEvent:](v16, "setIsGeneratedEvent:", 1);
  return v16;
}

- (unsigned)pathIndexMask
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[AXEventRepresentation type](self, "type") != 3001
    || (-[AXEventRepresentation handInfo](self, "handInfo"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    _AXAssert();
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXEventRepresentation handInfo](self, "handInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "pathIndex");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cancelEventForPathIndexMask:(unsigned int)a3
{
  AXEventRepresentation *v4;
  AXEventHandInfoRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  int i;
  AXEventPathInfoRepresentation *v10;
  void *v11;

  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", 3001);
  v5 = objc_alloc_init(AXEventHandInfoRepresentation);
  -[AXEventRepresentation setHandInfo:](v4, "setHandInfo:", v5);

  -[AXEventRepresentation handInfo](v4, "handInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandEventMask:", 128);

  -[AXEventRepresentation handInfo](v4, "handInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEventType:", 8);

  -[AXEventRepresentation setIsDisplayIntegrated:](v4, "setIsDisplayIntegrated:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
  {
    if (((a3 >> i) & 1) != 0)
    {
      v10 = objc_alloc_init(AXEventPathInfoRepresentation);
      -[AXEventPathInfoRepresentation setPathIndex:](v10, "setPathIndex:", i);
      -[AXEventPathInfoRepresentation setPathEventMask:](v10, "setPathEventMask:", 128);
      objc_msgSend(v8, "addObject:", v10);

    }
  }
  -[AXEventRepresentation handInfo](v4, "handInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPaths:", v8);

  return v4;
}

+ (id)_digitizerRepresentation:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4
{
  AXEventRepresentation *v5;
  uint64_t IntegerValue;
  uint64_t v7;
  uint64_t v8;
  CFIndex v9;
  uint64_t Children;
  _BOOL4 v11;
  const __CFArray *v12;
  CFIndex Count;
  const __CFArray *v14;
  const __CFArray *v15;
  AXEventHandInfoRepresentation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CFIndex v31;
  uint64_t v32;
  int v33;
  AXEventPathInfoRepresentation *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 Phase;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  ValueWitnessTable *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned __int16 v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned __int16 v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  BOOL v102;
  int v103;
  char v104;
  char v106;
  _BOOL4 v107;
  __IOHIDEvent *v108;
  int v109;
  const __CFArray *v110;
  AXEventRepresentation *v111;
  id v112;
  void *v113;
  int v114;
  CFIndex v115;
  uint64_t v116;
  int v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v112 = a4;
  v5 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setSenderID:](v5, "setSenderID:", IOHIDEventGetSenderID());
  IntegerValue = IOHIDEventGetIntegerValue();
  v7 = IOHIDEventGetIntegerValue();
  v8 = IOHIDEventGetIntegerValue();
  if (IOHIDEventGetIntegerValue())
  {
    v9 = IOHIDEventGetIntegerValue();
    Children = IOHIDEventGetChildren();
    v11 = (Children | v9) != 0;
    if (Children && !v9)
    {
      v12 = (const __CFArray *)Children;
      do
      {
        Count = CFArrayGetCount(v12);
        v11 = v9 < Count;
        if (v9 >= Count)
          break;
        CFArrayGetValueAtIndex(v12, v9++);
      }
      while (!IOHIDEventGetIntegerValue());
    }
  }
  else
  {
    v11 = 0;
  }
  if (IOHIDEventGetPhase() == 1)
  {
    objc_msgSend((id)HIDStreamLock, "lock");
    objc_msgSend((id)HIDStreamIdentifierPhasesForTouches, "removeAllObjects");
    objc_msgSend((id)HIDStreamLock, "unlock");
  }
  v14 = (const __CFArray *)IOHIDEventGetChildren();
  v15 = v14;
  if (v14)
    v115 = CFArrayGetCount(v14);
  else
    v115 = 0;
  v16 = objc_alloc_init(AXEventHandInfoRepresentation);
  -[AXEventRepresentation setHandInfo:](v5, "setHandInfo:", v16);

  -[AXEventRepresentation handInfo](v5, "handInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSystemGesturePossible:", 1);

  -[AXEventRepresentation handInfo](v5, "handInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHandIdentity:", v7);

  -[AXEventRepresentation handInfo](v5, "handInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHandIndex:", v8);

  -[AXEventRepresentation handInfo](v5, "handInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHandEventMask:", IntegerValue);

  IOHIDEventGetFloatValue();
  v22 = v21;
  IOHIDEventGetFloatValue();
  v24 = v23;
  -[AXEventRepresentation handInfo](v5, "handInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHandPosition:", v22, v24);

  if (IOHIDEventGetAttributeDataLength() >= 1)
  {
    BKSHIDEventGetDigitizerAttributes();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = objc_msgSend(v26, "systemGesturesPossible");
      -[AXEventRepresentation handInfo](v5, "handInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSystemGesturePossible:", v28);

      -[AXEventRepresentation setContextId:](v5, "setContextId:", _ContextIDFromEvent((uint64_t)a3));
    }

  }
  v107 = v11;
  v108 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v115);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v5;
  v113 = v30;
  v106 = IntegerValue;
  if (v115 < 1)
  {
    v32 = 0;
    v109 = 0;
    v117 = 0;
    v114 = 0;
  }
  else
  {
    v31 = 0;
    v114 = 0;
    v117 = 0;
    v32 = 0;
    v33 = 0;
    v109 = 0;
    v110 = v15;
    do
    {
      CFArrayGetValueAtIndex(v15, v31);
      if (IOHIDEventGetType() == 11 || IOHIDEventGetType() == 32)
      {
        v34 = objc_alloc_init(AXEventPathInfoRepresentation);
        IOHIDEventGetFloatValue();
        v36 = v35;
        IOHIDEventGetFloatValue();
        -[AXEventPathInfoRepresentation setPathLocation:](v34, "setPathLocation:", v36, v37);
        IOHIDEventGetFloatValue();
        -[AXEventPathInfoRepresentation setPathZValue:](v34, "setPathZValue:");
        objc_msgSend(v30, "addObject:", v34);
        -[AXEventPathInfoRepresentation setPathIndex:](v34, "setPathIndex:", IOHIDEventGetIntegerValue());
        if (IOHIDEventGetIntegerValue())
        {
          -[AXEventPathInfoRepresentation setPathProximity:](v34, "setPathProximity:", -[AXEventPathInfoRepresentation pathProximity](v34, "pathProximity") | 1);
          v109 = 1;
        }
        v38 = IOHIDEventGetIntegerValue();
        if (v38)
        {
          -[AXEventPathInfoRepresentation setPathProximity:](v34, "setPathProximity:", -[AXEventPathInfoRepresentation pathProximity](v34, "pathProximity") | 2);
          ++v32;
        }
        v39 = v38 != 0;
        v40 = IOHIDEventGetIntegerValue();
        v41 = v40;
        if (v32)
          v114 |= (v40 & 0x41C04) != 0;
        v116 = v32;
        if ((v40 & 0x80) != 0)
          Phase = 8;
        else
          Phase = IOHIDEventGetPhase();
        v43 = -[AXEventPathInfoRepresentation pathIndex](v34, "pathIndex");
        v44 = v112;
        if (_initializeHIDStreamCountsIfNeeded_onceToken != -1)
          dispatch_once(&_initializeHIDStreamCountsIfNeeded_onceToken, &__block_literal_global_708);
        v117 |= v39;
        objc_msgSend((id)HIDStreamLock, "lock");
        objc_msgSend((id)HIDStreamIdentifierPhasesForTouches, "objectForKey:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v45, "mutableCopy");
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v49 = v48;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", Phase);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKey:", v50, v51);

        objc_msgSend((id)HIDStreamIdentifierPhasesForTouches, "setObject:forKey:", v49, v44);
        objc_msgSend((id)HIDStreamLock, "unlock");

        IOHIDEventGetFloatValue();
        -[AXEventPathInfoRepresentation setPathIdentity:](v34, "setPathIdentity:", (int)v52);
        IOHIDEventGetFloatValue();
        *(float *)&v53 = v53;
        -[AXEventPathInfoRepresentation setPathPressure:](v34, "setPathPressure:", v53);
        IOHIDEventGetFloatValue();
        *(float *)&v54 = v54;
        -[AXEventPathInfoRepresentation setPathMajorRadius:](v34, "setPathMajorRadius:", v54);
        IOHIDEventGetFloatValue();
        *(float *)&v55 = v55;
        -[AXEventPathInfoRepresentation setPathMinorRadius:](v34, "setPathMinorRadius:", v55);
        IOHIDEventGetFloatValue();
        *(float *)&v56 = v56;
        -[AXEventPathInfoRepresentation setPathMajorRadiusTolerance:](v34, "setPathMajorRadiusTolerance:", v56);
        IOHIDEventGetFloatValue();
        *(float *)&v57 = v57;
        -[AXEventPathInfoRepresentation setPathTwist:](v34, "setPathTwist:", v57);
        IOHIDEventGetFloatValue();
        *(float *)&v58 = v58;
        -[AXEventPathInfoRepresentation setPathQuality:](v34, "setPathQuality:", v58);
        IOHIDEventGetFloatValue();
        *(float *)&v59 = v59;
        -[AXEventPathInfoRepresentation setPathDensity:](v34, "setPathDensity:", v59);
        -[AXEventPathInfoRepresentation setPathEventMask:](v34, "setPathEventMask:", v41);
        v5 = v111;
        -[AXEventPathInfoRepresentation setPathWindowContextID:](v34, "setPathWindowContextID:", -[AXEventRepresentation contextId](v111, "contextId"));
        IOHIDEventGetFloatValue();
        *(float *)&v60 = v60;
        -[AXEventPathInfoRepresentation setOrbValue:](v34, "setOrbValue:", v60);
        -[AXEventPathInfoRepresentation setTransducerType:](v34, "setTransducerType:", IOHIDEventGetIntegerValue());
        IOHIDEventGetFloatValue();
        *(float *)&v61 = v61;
        -[AXEventPathInfoRepresentation setAltitude:](v34, "setAltitude:", v61);
        IOHIDEventGetFloatValue();
        *(float *)&v62 = v62;
        -[AXEventPathInfoRepresentation setAzimuth:](v34, "setAzimuth:", v62);
        IOHIDEventGetFloatValue();
        *(float *)&v63 = v63;
        -[AXEventPathInfoRepresentation setBarrelPressure:](v34, "setBarrelPressure:", v63);
        -[AXEventPathInfoRepresentation setWillUpdateMask:](v34, "setWillUpdateMask:", IOHIDEventGetIntegerValue());
        -[AXEventPathInfoRepresentation setDidUpdateMask:](v34, "setDidUpdateMask:", IOHIDEventGetIntegerValue());

        v15 = v110;
        v30 = v113;
        v32 = v116;
      }
      v31 = ++v33;
    }
    while (v115 > v33);
  }
  -[AXEventRepresentation handInfo](v5, "handInfo");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPaths:", v30);

  IOHIDEventGetFloatValue();
  v66 = v65;
  IOHIDEventGetFloatValue();
  v68 = v67;
  v69 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*MEMORY[0x1E0C9D538] == v66 && v69 == v67)
  {
    v71 = &_s6SpeechC14SelectionScopeOWV;
    if (objc_msgSend(v30, "count", *MEMORY[0x1E0C9D538], v69))
    {
      objc_msgSend(v30, "objectAtIndex:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "pathLocation");
      v66 = v73;
      v68 = v74;

    }
  }
  else
  {
    v71 = &_s6SpeechC14SelectionScopeOWV;
  }
  -[AXEventRepresentation setWindowLocation:](v5, "setWindowLocation:", v66, v68);
  -[AXEventRepresentation setLocation:](v5, "setLocation:", v66, v68);
  -[AXEventRepresentation setType:](v5, "setType:", 3001);
  v75 = *(void **)&v71[19].flags;
  v76 = v112;
  objc_msgSend(v75, "lock");
  objc_msgSend((id)HIDStreamIdentifierTouchCounts, "objectForKey:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = objc_msgSend(v77, "integerValue");
  objc_msgSend(*(id *)&v71[19].flags, "unlock");
  -[AXEventRepresentation handInfo](v5, "handInfo");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setCurrentFingerCount:", (unsigned __int16)v32);

  -[AXEventRepresentation handInfo](v5, "handInfo");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v78 <= 0)
    v82 = v115;
  else
    v82 = v78;
  objc_msgSend(v80, "setInitialFingerCount:", v82);

  v83 = v76;
  objc_msgSend(*(id *)&v71[19].flags, "lock");
  objc_msgSend((id)HIDStreamIdentifierPhasesForTouches, "objectForKey:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(v84, "allValues");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
  if (v86)
  {
    v87 = v86;
    v88 = v32;
    v89 = 0;
    v90 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v119 != v90)
          objc_enumerationMutation(v85);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * i), "unsignedIntValue") != 8)
          ++v89;
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
    }
    while (v87);
    v5 = v111;
    v32 = v88;
    v71 = &_s6SpeechC14SelectionScopeOWV;
  }
  else
  {
    v89 = 0;
  }

  objc_msgSend(*(id *)&v71[19].flags, "unlock");
  -[AXEventRepresentation handInfo](v5, "handInfo");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setLifetimeFingerCount:", v89);

  if (v106 < 0)
  {
    -[AXEventRepresentation handInfo](v5, "handInfo");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setEventType:", 8);

    _setInitialTouchCount(0, v83);
    objc_msgSend(*(id *)&v71[19].flags, "lock");
    objc_msgSend((id)HIDStreamIdentifierPhasesForTouches, "removeAllObjects");
    objc_msgSend(*(id *)&v71[19].flags, "unlock");
    v93 = v107;
  }
  else
  {
    v93 = v107;
    if (v107)
    {
      -[AXEventRepresentation handInfo](v5, "handInfo");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v94;
      v96 = 11;
LABEL_64:
      objc_msgSend(v94, "setEventType:", v96);

      v97 = v113;
      goto LABEL_91;
    }
    if (!v32 || v78 < 1 || v78 == v32 || ((v117 ^ 1) & 1) != 0)
    {
      if (!v32 || v78)
      {
        if (!v15)
        {
          -[AXEventRepresentation handInfo](v5, "handInfo");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v94;
          v96 = 12;
          goto LABEL_64;
        }
        if (v32)
          v102 = 1;
        else
          v102 = v78 == 0;
        v103 = v102;
        if (((v103 | v109) & 1) != 0)
        {
          if (((v32 == 0) & (v114 ^ 1)) != 0)
          {
            if ((v109 & 1) != 0)
            {
              -[AXEventRepresentation handInfo](v5, "handInfo");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v99;
              v101 = 9;
            }
            else if (v78)
            {
              _AXAssert();
              -[AXEventRepresentation handInfo](v5, "handInfo", v108, 0, v78, 0);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v99;
              v101 = 0;
            }
            else
            {
              -[AXEventRepresentation handInfo](v5, "handInfo");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v99;
              v101 = 10;
            }
          }
          else
          {
            -[AXEventRepresentation handInfo](v5, "handInfo");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v99;
            v101 = 2;
          }
        }
        else
        {
          -[AXEventRepresentation handInfo](v5, "handInfo");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v99;
          v101 = 6;
        }
      }
      else
      {
        -[AXEventRepresentation handInfo](v5, "handInfo");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v99;
        v101 = 1;
      }
    }
    else
    {
      -[AXEventRepresentation handInfo](v5, "handInfo");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v99;
      v101 = 5;
    }
    objc_msgSend(v99, "setEventType:", v101);

  }
  if (v15)
    v104 = v93;
  else
    v104 = 1;
  v97 = v113;
  if ((v104 & 1) == 0)
    goto LABEL_92;
LABEL_91:
  if ((IOHIDEventGetIntegerValue() & 0x200) != 0)
LABEL_92:
    _setInitialTouchCount(v32, v83);

  return v5;
}

- (void)resetInitialTouchCountValueForHidStreamIdentifier:(id)a3
{
  _setInitialTouchCount(0, a3);
}

- (BOOL)isUpdate
{
  unsigned int v3;
  void *v4;
  void *v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;

  if (!-[AXEventRepresentation generationCount](self, "generationCount"))
    return 0;
  v3 = -[AXEventRepresentation didUpdateMask](self, "didUpdateMask");
  -[AXEventRepresentation handInfo](self, "handInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = 1;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v5, "count");
      v6 = v7 < v8;
      if (v7 >= v8)
        break;
      objc_msgSend(v5, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "didUpdateMask");

      ++v7;
    }
    while (!v10);
  }

  return v6;
}

- (BOOL)willBeUpdated
{
  unsigned int v3;
  void *v4;
  void *v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;

  if (!-[AXEventRepresentation generationCount](self, "generationCount"))
    return 0;
  v3 = -[AXEventRepresentation willUpdateMask](self, "willUpdateMask");
  -[AXEventRepresentation handInfo](self, "handInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = 1;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v5, "count");
      v6 = v7 < v8;
      if (v7 >= v8)
        break;
      objc_msgSend(v5, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "willUpdateMask");

      ++v7;
    }
    while (!v10);
  }

  return v6;
}

+ (void)_appendKeyInfoToMediaKey:(id)a3 usage:(int64_t)a4 downEvent:(BOOL)a5
{
  _BOOL8 v5;
  AXEventKeyInfoRepresentation *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v7 = objc_alloc_init(AXEventKeyInfoRepresentation);
  if (a4 <= 225)
  {
    if (a4 > 183)
    {
      v8 = v10;
      if (a4 == 184)
        goto LABEL_18;
      if (a4 == 205)
      {
        a4 = 65;
        goto LABEL_18;
      }
    }
    else
    {
      v8 = v10;
      if (a4 == 179)
      {
        a4 = 66;
        goto LABEL_18;
      }
      if (a4 == 180)
      {
        a4 = 64;
LABEL_18:
        objc_msgSend(v10, "setOriginalType:", objc_msgSend(v8, "type"));
        if (v5)
          v9 = 10;
        else
          v9 = 11;
        objc_msgSend(v10, "setType:", v9);
        goto LABEL_22;
      }
    }
    goto LABEL_15;
  }
  if (a4 <= 233)
  {
    v8 = v10;
    if (a4 == 226)
    {
      a4 = 67;
      goto LABEL_18;
    }
    if (a4 == 233)
    {
      a4 = 69;
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  v8 = v10;
  if (a4 == 234)
  {
    a4 = 68;
    goto LABEL_22;
  }
  if (a4 != 669)
  {
LABEL_15:
    a4 = 0;
    goto LABEL_18;
  }
LABEL_22:
  -[AXEventKeyInfoRepresentation setUsagePage:](v7, "setUsagePage:", 7);
  -[AXEventKeyInfoRepresentation setKeyCode:](v7, "setKeyCode:", a4);
  -[AXEventKeyInfoRepresentation setKeyDown:](v7, "setKeyDown:", v5);
  objc_msgSend(v10, "setKeyInfo:", v7);

}

+ (id)_keyboardButtonEvent:(__IOHIDEvent *)a3
{
  AXEventRepresentation *v5;
  uint64_t IntegerValue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  AXEventKeyInfoRepresentation *v12;
  uint64_t v13;
  AXEventKeyInfoRepresentation *v14;
  uint64_t v15;
  BOOL v16;
  unsigned int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  id v23;
  AXEventRepresentation *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = objc_alloc_init(AXEventRepresentation);
  IntegerValue = IOHIDEventGetIntegerValue();
  v7 = IOHIDEventGetIntegerValue();
  v8 = IOHIDEventGetIntegerValue();
  v9 = v8;
  if (IntegerValue > 143)
  {
    if (IntegerValue == 144)
    {
      if (v7 != 33)
        goto LABEL_134;
      v10 = v8 == 0;
      v11 = 1044;
      goto LABEL_130;
    }
    if (IntegerValue != 255 && IntegerValue != 65281)
      goto LABEL_134;
LABEL_9:
    v12 = objc_alloc_init(AXEventKeyInfoRepresentation);
    if (v9)
      v13 = 10;
    else
      v13 = 11;
    -[AXEventRepresentation setType:](v5, "setType:", v13);
    if (IntegerValue == 65281)
    {
      if (v7 > 31)
      {
        switch(v7)
        {
          case 32:
            v14 = v12;
            v15 = 59;
            goto LABEL_69;
          case 33:
            v14 = v12;
            v15 = 58;
            goto LABEL_69;
          case 512:
            if (v9)
              v18 = 1105;
            else
              v18 = 1106;
            -[AXEventRepresentation setType:](v5, "setType:", v18);
            goto LABEL_70;
        }
      }
      else if (v7 == 2 || v7 == 4)
      {
        -[AXEventKeyInfoRepresentation setAlternativeKeyCode:](v12, "setAlternativeKeyCode:", 61);
      }
      else if (v7 == 16)
      {
        v14 = v12;
        v15 = 60;
LABEL_69:
        -[AXEventKeyInfoRepresentation setAlternativeKeyCode:](v14, "setAlternativeKeyCode:", v15);
LABEL_70:
        -[AXEventKeyInfoRepresentation setKeyCode:](v12, "setKeyCode:", (unsigned __int16)v7);
        -[AXEventKeyInfoRepresentation setUsagePage:](v12, "setUsagePage:", IntegerValue);
        -[AXEventKeyInfoRepresentation setKeyDown:](v12, "setKeyDown:", v9 != 0);
        -[AXEventRepresentation setKeyInfo:](v5, "setKeyInfo:", v12);
        -[AXEventRepresentation setFlags:](v5, "setFlags:", IOHIDEventGetEventFlags());

        goto LABEL_134;
      }
    }
    v19 = IntegerValue == 65281 || IntegerValue == 255;
    if (v19 && v7 == 3)
    {
      _AXEventKeyInfoSetSimulatedFNKeyDown(v9 != 0);
      objc_msgSend(a1, "_appendKeyInfoToMediaKey:usage:downEvent:", v5, 3, v9 != 0);
    }
    goto LABEL_70;
  }
  switch(IntegerValue)
  {
    case 1:
      if (v7 > 133)
      {
        switch(v7)
        {
          case 134:
            v10 = v8 == 0;
            v11 = 1216;
            goto LABEL_130;
          case 138:
            v10 = v8 == 0;
            v11 = 1214;
            goto LABEL_130;
          case 139:
            v10 = v8 == 0;
            v11 = 1212;
            goto LABEL_130;
          case 140:
            v10 = v8 == 0;
            v11 = 1208;
            goto LABEL_130;
          case 141:
            v10 = v8 == 0;
            v11 = 1210;
            goto LABEL_130;
          default:
            goto LABEL_134;
        }
        goto LABEL_134;
      }
      switch(v7)
      {
        case 1:
LABEL_53:
          v10 = v8 == 0;
          v11 = 4200;
          break;
        case 2:
LABEL_54:
          v10 = v8 == 0;
          v11 = 4202;
          break;
        case 3:
LABEL_52:
          v10 = v8 == 0;
          v11 = 4204;
          break;
        default:
          goto LABEL_134;
      }
      break;
    case 7:
      goto LABEL_9;
    case 9:
      switch(v7)
      {
        case 3:
          goto LABEL_52;
        case 2:
          goto LABEL_54;
        case 1:
          goto LABEL_53;
      }
      goto LABEL_134;
    case 11:
      if (v7 == 45)
      {
        v16 = v8 == 0;
        v17 = 1042;
      }
      else
      {
        if (v7 != 46)
          goto LABEL_134;
        v16 = v8 == 0;
        v17 = 1012;
      }
      if (v16)
        v20 = v17;
      else
        v20 = v17 + 1;
      goto LABEL_133;
    case 12:
      if (v7 > 175)
      {
        if (v7 <= 225)
        {
          switch(v7)
          {
            case 176:
              v10 = v8 == 0;
              v11 = 1027;
              goto LABEL_130;
            case 177:
              v10 = v8 == 0;
              v11 = 1036;
              goto LABEL_130;
            case 178:
              v10 = v8 == 0;
              v11 = 1021;
              goto LABEL_130;
            case 179:
              v21 = v8 != 0;
              if (v8)
                v27 = 1038;
              else
                v27 = 1039;
              -[AXEventRepresentation setType:](v5, "setType:", v27);
              v23 = a1;
              v24 = v5;
              v25 = 179;
              goto LABEL_127;
            case 180:
              v21 = v8 != 0;
              if (v8)
                v28 = 1040;
              else
                v28 = 1041;
              -[AXEventRepresentation setType:](v5, "setType:", v28);
              v23 = a1;
              v24 = v5;
              v25 = 180;
              goto LABEL_127;
            case 181:
            case 182:
            case 183:
              goto LABEL_135;
            case 184:
              v21 = v8 != 0;
              if (v8)
                v29 = 1029;
              else
                v29 = 1030;
              -[AXEventRepresentation setType:](v5, "setType:", v29);
              v23 = a1;
              v24 = v5;
              v25 = 184;
              goto LABEL_127;
            default:
              if (v7 != 205)
                goto LABEL_135;
              v21 = v8 != 0;
              if (v8)
                v26 = 1032;
              else
                v26 = 1033;
              -[AXEventRepresentation setType:](v5, "setType:", v26);
              v23 = a1;
              v24 = v5;
              v25 = 205;
              break;
          }
          goto LABEL_127;
        }
        if (v7 > 432)
        {
          switch(v7)
          {
            case 433:
              v10 = v8 == 0;
              v11 = 1023;
              goto LABEL_130;
            case 669:
              v21 = v8 != 0;
              if (v8)
                v32 = 4500;
              else
                v32 = 4501;
              -[AXEventRepresentation setType:](v5, "setType:", v32);
              _AXEventKeyInfoSetSimulatedFNKeyDown(v21);
              v23 = a1;
              v24 = v5;
              v25 = 669;
              goto LABEL_127;
            case 547:
              v10 = v8 == 0;
              v11 = 1034;
              goto LABEL_130;
          }
        }
        else
        {
          switch(v7)
          {
            case 226:
              v21 = v8 != 0;
              if (v8)
                v30 = 1025;
              else
                v30 = 1026;
              -[AXEventRepresentation setType:](v5, "setType:", v30);
              v23 = a1;
              v24 = v5;
              v25 = 226;
              goto LABEL_127;
            case 233:
              v21 = v8 != 0;
              if (v8)
                v31 = 1006;
              else
                v31 = 1007;
              -[AXEventRepresentation setType:](v5, "setType:", v31);
              v23 = a1;
              v24 = v5;
              v25 = 233;
              goto LABEL_127;
            case 234:
              v21 = v8 != 0;
              if (v8)
                v22 = 1008;
              else
                v22 = 1009;
              -[AXEventRepresentation setType:](v5, "setType:", v22);
              v23 = a1;
              v24 = v5;
              v25 = 234;
LABEL_127:
              objc_msgSend(v23, "_appendKeyInfoToMediaKey:usage:downEvent:", v24, v25, v21);
              goto LABEL_134;
          }
        }
LABEL_135:

        v5 = 0;
        goto LABEL_134;
      }
      if (v7 > 95)
      {
        if (v7 > 140)
        {
          if (v7 == 141)
          {
            v10 = v8 == 0;
            v11 = 1226;
            break;
          }
          if (v7 == 149)
          {
            v10 = v8 == 0;
            v11 = 1103;
            break;
          }
        }
        else
        {
          if (v7 == 96)
          {
            v10 = v8 == 0;
            v11 = 1222;
            break;
          }
          if (v7 == 128)
          {
            v10 = v8 == 0;
            v11 = 1220;
            break;
          }
        }
        goto LABEL_135;
      }
      switch(v7)
      {
        case '@':
          v10 = v8 == 0;
          v11 = 1000;
          goto LABEL_130;
        case 'A':
          v10 = v8 == 0;
          v11 = 1218;
          goto LABEL_130;
        case 'B':
          v10 = v8 == 0;
          v11 = 1200;
          goto LABEL_130;
        case 'C':
          v10 = v8 == 0;
          v11 = 1202;
          goto LABEL_130;
        case 'D':
          v10 = v8 == 0;
          v11 = 1204;
          goto LABEL_130;
        case 'E':
          v10 = v8 == 0;
          v11 = 1206;
          goto LABEL_130;
        default:
          if (v7 == 4)
          {
            v10 = v8 == 0;
            v11 = 1224;
          }
          else
          {
            if (v7 != 48)
              goto LABEL_135;
            v10 = v8 == 0;
            v11 = 1010;
          }
          break;
      }
      break;
    default:
      goto LABEL_134;
  }
LABEL_130:
  if (v10)
    v20 = v11 + 1;
  else
    v20 = v11;
LABEL_133:
  -[AXEventRepresentation setType:](v5, "setType:", v20);
LABEL_134:
  -[AXEventRepresentation setContextId:](v5, "setContextId:", _ContextIDFromEvent((uint64_t)a3));
  return v5;
}

+ (id)_wheelEvent:(__IOHIDEvent *)a3
{
  AXEventRepresentation *v3;
  const __CFArray *Children;
  const __CFArray *v5;
  double v6;

  v3 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v3, "setType:", 1100);
  -[AXEventRepresentation setScrollAmount:](v3, "setScrollAmount:", IOHIDEventGetIntegerValue());
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    v5 = Children;
    if (CFArrayGetCount(Children) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      IOHIDEventGetFloatValue();
      -[AXEventRepresentation setScrollAccelAmount:](v3, "setScrollAccelAmount:", (uint64_t)v6);
    }
  }
  return v3;
}

+ (id)_gameControllerEvent:(__IOHIDEvent *)a3
{
  AXEventRepresentation *v4;
  void *v5;

  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", 1300);
  +[AXGameControllerEvent axGameControllerInfoRepresentationFromEvent:](AXGameControllerEvent, "axGameControllerInfoRepresentationFromEvent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventRepresentation setGameControllerInfo:](v4, "setGameControllerInfo:", v5);

  return v4;
}

+ (id)_gameKeyboardControllerEvent:(__IOHIDEvent *)a3
{
  return +[AXGameControllerEvent axGameControllerInfoRepresentationFromEvent:](AXGameControllerEvent, "axGameControllerInfoRepresentationFromEvent:", a3);
}

+ (id)_pointerControllerEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 serviceClient:(__IOHIDServiceClient *)a5
{
  id v7;
  AXEventRepresentation *v8;
  AXEventPointerInfoRepresentation *v9;
  const __CFArray *Children;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const void *ValueAtIndex;
  int Type;
  void *v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v7 = a4;
  v8 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v8, "setType:", 3200);
  v9 = objc_alloc_init(AXEventPointerInfoRepresentation);
  -[AXEventRepresentation setPointerControllerInfo:](v8, "setPointerControllerInfo:", v9);
  IOHIDEventGetFloatMultiple();
  -[AXEventPointerInfoRepresentation setPointerX:](v9, "setPointerX:", v19);
  -[AXEventPointerInfoRepresentation setPointerY:](v9, "setPointerY:", v20);
  -[AXEventPointerInfoRepresentation setPointerZ:](v9, "setPointerZ:", v21);
  -[AXEventPointerInfoRepresentation setPointerButtonMask:](v9, "setPointerButtonMask:", v22);
  -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v9, "setPointerButtonNumber:", v23);
  -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v9, "setPointerButtonClickCount:", v24);
  -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v9, "setPointerButtonPressure:", v25);
  -[AXEventPointerInfoRepresentation setPointerIsAbsolute:](v9, "setPointerIsAbsolute:", IOHIDEventGetEventFlags() & 1);
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    v11 = Children;
    Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      v13 = Count;
      v14 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, v14);
        Type = IOHIDEventGetType();
        if (Type > 10)
          break;
        if (Type == 2)
        {
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonMask:](v9, "setPointerButtonMask:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v9, "setPointerButtonNumber:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v9, "setPointerButtonClickCount:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v9, "setPointerButtonPressure:");
        }
        else if (Type == 6)
        {
          objc_msgSend(a1, "representationWithHIDEvent:hidStreamIdentifier:", ValueAtIndex, v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXEventPointerInfoRepresentation setScrollEvent:](v9, "setScrollEvent:", v17);
LABEL_13:

        }
LABEL_14:
        if (v13 == ++v14)
          goto LABEL_15;
      }
      if (Type != 11)
      {
        if (Type == 17)
        {
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelX:](v9, "setPointerAccelX:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelY:](v9, "setPointerAccelY:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelZ:](v9, "setPointerAccelZ:");
          -[AXEventPointerInfoRepresentation setIsPointerMove:](v9, "setIsPointerMove:", 1);
        }
        goto LABEL_14;
      }
      objc_msgSend(a1, "representationWithHIDEvent:hidStreamIdentifier:", ValueAtIndex, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXEventPointerInfoRepresentation setTrackpadHandEvent:](v9, "setTrackpadHandEvent:", v17);
      goto LABEL_13;
    }
  }
LABEL_15:
  -[AXEventRepresentation setContextId:](v8, "setContextId:", _ContextIDFromEvent((uint64_t)a3));

  return v8;
}

+ (id)_motionGestureTapEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7
{
  return 0;
}

+ (id)_vendorDefinedAccessibilityEvent:(__IOHIDEvent *)a3
{
  AXEventRepresentation *v3;

  if (objc_msgSend(a1, "_HIDEventIsAccessibilityEvent:", a3))
  {
    v3 = objc_alloc_init(AXEventRepresentation);
    -[AXEventRepresentation setType:](v3, "setType:", 5000);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (AXEventRepresentation)representationWithLocation:(CGPoint)a3 windowLocation:(CGPoint)a4 handInfo:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v9 = a5;
  +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 0, 0, mach_absolute_time(), v9, v8, v7, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXEventRepresentation *)v10;
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4
{
  return (AXEventRepresentation *)objc_msgSend(a1, "representationWithHIDEvent:hidStreamIdentifier:clientID:taskPort:", a3, a4, 0, 0);
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5
{
  return (AXEventRepresentation *)objc_msgSend(a1, "representationWithHIDEvent:serviceClient:hidStreamIdentifier:clientID:taskPort:", a3, a4, a5, 0, 0);
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 clientID:(id)a5 taskPort:(unsigned int)a6
{
  return (AXEventRepresentation *)objc_msgSend(a1, "representationWithHIDEvent:serviceClient:hidStreamIdentifier:clientID:taskPort:", a3, 0, a4, a5, *(_QWORD *)&a6);
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  int Type;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t AttributeDataLength;
  void *v20;
  _BOOL8 v21;
  unint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  void *v30;
  const __CFArray *Children;
  const __CFArray *v32;
  const void *ValueAtIndex;
  void *v34;
  int v35;
  void *v36;
  int v37;
  _BOOL8 v38;
  __IOHIDEvent *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v7 = *(_QWORD *)&a7;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    v15 = 0;
LABEL_27:
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CF39B8], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "ignoreLogging");

      if ((v25 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39B8], "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v27 = objc_claimAutoreleasedReturnValue();

        v28 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v27, v28))
        {
          AXColorizeFormatLog();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = a3;
          v41 = v12;
          _AXStringForArgs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, v28))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v30;
            _os_log_impl(&dword_18C62B000, v27, v28, "%{public}@", buf, 0xCu);
          }

        }
      }
    }
    goto LABEL_34;
  }
  Type = IOHIDEventGetType();
  v15 = 0;
  v16 = 1;
  if (Type > 10)
  {
    switch(Type)
    {
      case 35:
        objc_msgSend(a1, "_gameControllerEvent:", a3);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 17:
        objc_msgSend(a1, "_pointerControllerEvent:hidStreamIdentifier:serviceClient:", a3, v12, a4);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 11:
        objc_msgSend(a1, "_digitizerRepresentation:hidStreamIdentifier:", a3, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_19;
    }
  }
  else
  {
    if (Type == 1)
    {
      objc_msgSend(a1, "_vendorDefinedAccessibilityEvent:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;
      goto LABEL_19;
    }
    if (Type == 3)
    {
      objc_msgSend(a1, "_keyboardButtonEvent:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(a1, "_gameKeyboardControllerEvent:", a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setGameControllerInfo:", v18);

      }
      goto LABEL_18;
    }
    if (Type != 6)
      goto LABEL_19;
    objc_msgSend(a1, "_wheelEvent:", a3);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v17;
LABEL_18:
  v16 = 0;
LABEL_19:
  objc_msgSend(v15, "setClientId:", v13);
  objc_msgSend(v15, "setTaskPort:", v7);
  AttributeDataLength = IOHIDEventGetAttributeDataLength();
  if (AttributeDataLength >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", IOHIDEventGetAttributeDataPtr(), AttributeDataLength);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHIDAttributeData:", v20);

  }
  objc_msgSend(v15, "setIsBuiltIn:", IOHIDEventGetIntegerValue() != 0);
  v21 = IOHIDEventGetType() == 11 && IOHIDEventGetIntegerValue() != 0;
  objc_msgSend(v15, "setIsDisplayIntegrated:", v21);
  objc_msgSend(v15, "setGenerationCount:", IOHIDEventGetIntegerValue());
  objc_msgSend(v15, "setWillUpdateMask:", IOHIDEventGetIntegerValue());
  objc_msgSend(v15, "setDidUpdateMask:", IOHIDEventGetIntegerValue());
  objc_msgSend(v15, "setSenderID:", IOHIDEventGetSenderID());
  objc_msgSend(v15, "setHIDTime:", IOHIDEventGetTimeStamp());
  v22 = objc_msgSend(v15, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  objc_msgSend(v15, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v22));
  objc_msgSend(v15, "setIsGeneratedEvent:", 0);
  objc_msgSend(v15, "setCreatorHIDEvent:", a3);
  objc_msgSend(v15, "setCreatorHIDServiceClient:", a4);
  objc_msgSend(v15, "_accessibilityDataFromRealEvent:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityData:", v23);

  if (!v16)
    goto LABEL_27;
LABEL_34:
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (!Children)
    goto LABEL_39;
  v32 = Children;
  if (CFArrayGetCount(Children) < 1)
    goto LABEL_39;
  ValueAtIndex = CFArrayGetValueAtIndex(v32, 0);
  _GetSubEventInfoFromDigitizerEventForPathEvent((uint64_t)a3, (uint64_t)ValueAtIndex);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "locus");

  if (!v35)
    goto LABEL_39;
  _GetSubEventInfoFromDigitizerEventForPathEvent((uint64_t)a3, (uint64_t)ValueAtIndex);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "userIdentifier");

  if (v37)
    v38 = _ContextIDFromEvent((uint64_t)a3) != 0;
  else
LABEL_39:
    v38 = 0;
  objc_msgSend(v15, "setSystemDrag:", v38, v40, v41);

  return (AXEventRepresentation *)v15;
}

+ (id)accelerometerRepresentation:(id)a3
{
  id v3;
  AXEventRepresentation *v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", 23);
  -[AXEventRepresentation setHIDTime:](v4, "setHIDTime:", mach_absolute_time());
  v5 = -[AXEventRepresentation HIDTime](v4, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v4, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5));
  -[AXEventRepresentation setAccelerometerInfo:](v4, "setAccelerometerInfo:", v3);

  return v4;
}

+ (id)keyRepresentationWithType:(unsigned int)a3
{
  uint64_t v3;
  AXEventRepresentation *v4;
  unint64_t v5;
  AXEventKeyInfoRepresentation *v6;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", v3);
  -[AXEventRepresentation setHIDTime:](v4, "setHIDTime:", mach_absolute_time());
  v5 = -[AXEventRepresentation HIDTime](v4, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v4, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5));
  v6 = objc_alloc_init(AXEventKeyInfoRepresentation);
  -[AXEventKeyInfoRepresentation setKeyDown:](v6, "setKeyDown:", (_DWORD)v3 == 10);
  -[AXEventKeyInfoRepresentation setUsagePage:](v6, "setUsagePage:", 7);
  -[AXEventRepresentation setKeyInfo:](v4, "setKeyInfo:", v6);
  -[AXEventRepresentation setIsGeneratedEvent:](v4, "setIsGeneratedEvent:", 1);

  return v4;
}

+ (id)buttonRepresentationWithType:(unsigned int)a3
{
  uint64_t v3;
  AXEventRepresentation *v4;
  unint64_t v5;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", v3);
  -[AXEventRepresentation setHIDTime:](v4, "setHIDTime:", mach_absolute_time());
  v5 = -[AXEventRepresentation HIDTime](v4, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v4, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5));
  -[AXEventRepresentation setIsGeneratedEvent:](v4, "setIsGeneratedEvent:", 1);
  return v4;
}

+ (id)iosmacPointerRepresentationWithTypeWithPointerInfo:(id)a3
{
  id v3;
  AXEventRepresentation *v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v4, "setType:", 3201);
  -[AXEventRepresentation setHIDTime:](v4, "setHIDTime:", mach_absolute_time());
  v5 = -[AXEventRepresentation HIDTime](v4, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v4, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5));
  -[AXEventRepresentation setIsGeneratedEvent:](v4, "setIsGeneratedEvent:", 1);
  -[AXEventRepresentation setIosmacPointerInfo:](v4, "setIosmacPointerInfo:", v3);

  return v4;
}

+ (id)gestureRepresentationWithHandType:(unsigned int)a3 locations:(id)a4
{
  uint64_t v4;
  id v5;
  AXEventHandInfoRepresentation *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  AXEventPathInfoRepresentation *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(AXEventHandInfoRepresentation);
  -[AXEventHandInfoRepresentation setEventType:](v6, "setEventType:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v14 = objc_alloc_init(AXEventPathInfoRepresentation);
        objc_msgSend(v13, "axCGPointValue");
        -[AXEventPathInfoRepresentation setPathLocation:](v14, "setPathLocation:");
        -[AXEventPathInfoRepresentation setPathIndex:](v14, "setPathIndex:", (v11 + i));
        -[AXEventPathInfoRepresentation setPathIdentity:](v14, "setPathIdentity:", (v11 + i));
        -[AXEventPathInfoRepresentation setTransducerType:](v14, "setTransducerType:", 2);
        if (v4 <= 0xB && ((1 << v4) & 0x826) != 0)
          -[AXEventPathInfoRepresentation setPathProximity:](v14, "setPathProximity:", -[AXEventPathInfoRepresentation pathProximity](v14, "pathProximity") | 3);
        -[AXEventHandInfoRepresentation setHandIndex:](v6, "setHandIndex:", 1);
        objc_msgSend(v7, "addObject:", v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v11 += i;
    }
    while (v9);
  }

  -[AXEventHandInfoRepresentation setPaths:](v6, "setPaths:", v7);
  v15 = mach_absolute_time();
  objc_msgSend(obj, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axCGPointValue");
  v18 = v17;
  v20 = v19;
  objc_msgSend(obj, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "axCGPointValue");
  +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 3001, 0, v15, v6, v18, v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)touchRepresentationWithHandType:(unsigned int)a3 location:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v6;
  AXEventHandInfoRepresentation *v7;
  AXEventPathInfoRepresentation *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  y = a4.y;
  x = a4.x;
  v6 = *(_QWORD *)&a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(AXEventHandInfoRepresentation);
  -[AXEventHandInfoRepresentation setEventType:](v7, "setEventType:", v6);
  v8 = objc_alloc_init(AXEventPathInfoRepresentation);
  -[AXEventPathInfoRepresentation setPathLocation:](v8, "setPathLocation:", x, y);
  -[AXEventPathInfoRepresentation setPathIndex:](v8, "setPathIndex:", 1);
  -[AXEventPathInfoRepresentation setTransducerType:](v8, "setTransducerType:", 2);
  if (v6 <= 0xB && ((1 << v6) & 0x806) != 0)
    -[AXEventPathInfoRepresentation setPathProximity:](v8, "setPathProximity:", -[AXEventPathInfoRepresentation pathProximity](v8, "pathProximity") | 3);
  -[AXEventHandInfoRepresentation setHandIndex:](v7, "setHandIndex:", 1);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventHandInfoRepresentation setPaths:](v7, "setPaths:", v9);

  if ((_DWORD)v6 == 1)
    objc_msgSend((id)objc_opt_class(), "incrementTouchCounter");
  +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 3001, 0, mach_absolute_time(), v7, x, y, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5
{
  return (id)objc_msgSend(a1, "accessibilityEventRepresentationWithSender:usagePage:usage:modifierFlags:", a3, a4, a5, 0);
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6
{
  double v6;
  double v7;

  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  return (id)objc_msgSend(a1, "accessibilityEventRepresentationWithSender:usagePage:usage:modifierFlags:eventValue1:eventValue2:", a3, a4, a5, a6, v6, v7);
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8
{
  AXEventRepresentation *v14;
  unint64_t v15;
  double v16;
  double v17;
  void *v18;

  v14 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v14, "setType:", 5000);
  -[AXEventRepresentation setHIDTime:](v14, "setHIDTime:", mach_absolute_time());
  v15 = -[AXEventRepresentation HIDTime](v14, "HIDTime");
  if (_AXGSEventConvertFromMachTime_onceToken != -1)
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_706);
  -[AXEventRepresentation setTime:](v14, "setTime:", (unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v15));
  -[AXEventRepresentation setIsGeneratedEvent:](v14, "setIsGeneratedEvent:", 1);
  *(float *)&v16 = a7;
  *(float *)&v17 = a8;
  +[AXEventData dataWithSender:page:usage:modifierFlags:eventValue1:eventValue2:](AXEventData, "dataWithSender:page:usage:modifierFlags:eventValue1:eventValue2:", a3, a4, a5, a6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventRepresentation setAccessibilityData:](v14, "setAccessibilityData:", v18);

  return v14;
}

- (id)dataRepresentation
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__IOHIDEvent)newHIDEventRef
{
  uint64_t v3;
  __IOHIDEvent *v4;
  __IOHIDEvent *v5;
  char v6;

  v3 = -[AXEventRepresentation originalType](self, "originalType");
  v4 = 0;
  if ((int)v3 <= 1100)
  {
    if ((int)v3 <= 999)
    {
      if ((v3 - 10) >= 3)
      {
        if ((_DWORD)v3 != 23)
          return v4;
        v5 = -[AXEventRepresentation _newAccelerometerHIDEventRef](self, "_newAccelerometerHIDEventRef");
      }
      else
      {
        v5 = -[AXEventRepresentation _newKeyboardHIDEventRef](self, "_newKeyboardHIDEventRef", v3);
      }
      goto LABEL_21;
    }
    v6 = v3 + 24;
    if ((v3 - 1000) <= 0x33)
    {
      if (((1 << v6) & 0xFCF66603FC3) != 0)
        goto LABEL_20;
      if (((1 << v6) & 0xFF00000000000) != 0)
      {
        v5 = -[AXEventRepresentation _newTostadaButtonHIDEventRefWithType:](self, "_newTostadaButtonHIDEventRefWithType:", v3);
        goto LABEL_21;
      }
    }
    if ((_DWORD)v3 != 1100)
      return v4;
    return -[AXEventRepresentation _newScrollHIDEventRef](self, "_newScrollHIDEventRef");
  }
  else
  {
    if ((int)v3 <= 3200)
    {
      if (((v3 - 1200) > 0x19 || ((1 << (v3 + 80)) & 0x3CFFFFF) == 0) && (v3 - 1101) >= 6)
      {
        if ((_DWORD)v3 == 3001)
        {
          v5 = -[AXEventRepresentation _newHandHIDEventRef](self, "_newHandHIDEventRef");
          goto LABEL_21;
        }
        return v4;
      }
      goto LABEL_20;
    }
    if ((int)v3 <= 4499)
    {
      if ((v3 - 4200) >= 6)
      {
        if ((_DWORD)v3 != 3201)
          return v4;
        v5 = -[AXEventRepresentation _newIOSMACPointerRef](self, "_newIOSMACPointerRef");
LABEL_21:
        v4 = v5;
        if (v5)
        {
          -[AXEventRepresentation isBuiltIn](self, "isBuiltIn");
          IOHIDEventSetIntegerValue();
          -[AXEventRepresentation _applyAccessibilityDataToRealEvent:](self, "_applyAccessibilityDataToRealEvent:", v4);
        }
        return v4;
      }
LABEL_20:
      v5 = -[AXEventRepresentation _newButtonHIDEventRefWithType:](self, "_newButtonHIDEventRefWithType:", v3);
      goto LABEL_21;
    }
    if ((v3 - 4500) < 2)
      goto LABEL_20;
    if ((_DWORD)v3 != 5000)
      return v4;
    return -[AXEventRepresentation _newAccessibilityHIDEventRef](self, "_newAccessibilityHIDEventRef");
  }
}

- (BOOL)isDownEvent
{
  int v2;
  BOOL result;
  unsigned int v4;
  BOOL v5;
  int v6;

  v2 = -[AXEventRepresentation type](self, "type");
  result = 1;
  if (v2 > 1199)
  {
    v4 = v2 - 1200;
    v5 = v4 > 0x1E;
    v6 = (1 << v4) & 0x55555555;
    if (!v5 && v6 != 0)
      return result;
    return 0;
  }
  if (((v2 - 1006) > 0x1A || ((1 << (v2 + 18)) & 0x4200005) == 0)
    && ((v2 - 1101) > 4 || ((1 << (v2 - 77)) & 0x15) == 0)
    && v2 != 10)
  {
    return 0;
  }
  return result;
}

- (unint64_t)_machTimeForHIDEventRef
{
  uint64_t v3;

  v3 = mach_absolute_time();
  if (-[AXEventRepresentation useOriginalHIDTime](self, "useOriginalHIDTime"))
    return -[AXEventRepresentation HIDTime](self, "HIDTime");
  else
    return v3;
}

- (__IOHIDEvent)_newAccelerometerHIDEventRef
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __IOHIDEvent *AccelerometerEventWithType;

  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  -[AXEventRepresentation accelerometerInfo](self, "accelerometerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "x");
  -[AXEventRepresentation accelerometerInfo](self, "accelerometerInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "y");
  -[AXEventRepresentation accelerometerInfo](self, "accelerometerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "z");
  -[AXEventRepresentation accelerometerInfo](self, "accelerometerInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  AccelerometerEventWithType = (__IOHIDEvent *)IOHIDEventCreateAccelerometerEventWithType();

  -[AXEventRepresentation senderID](self, "senderID");
  IOHIDEventSetSenderID();
  return AccelerometerEventWithType;
}

- (__IOHIDEvent)_newScrollHIDEventRef
{
  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  -[AXEventRepresentation scrollAmount](self, "scrollAmount");
  return (__IOHIDEvent *)IOHIDEventCreateScrollEvent();
}

- (__IOHIDEvent)_newKeyboardHIDEventRef
{
  void *v3;
  __IOHIDEvent *KeyboardEvent;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[AXEventRepresentation keyInfo](self, "keyInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usagePage");

  -[AXEventRepresentation isDownEvent](self, "isDownEvent");
  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
  -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "bytes");
    -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "length");
    IOHIDEventSetAttributeData();

  }
  -[AXEventRepresentation senderID](self, "senderID");
  IOHIDEventSetSenderID();
  -[AXEventRepresentation keyInfo](self, "keyInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyCode");
  IOHIDEventSetIntegerValue();

  IOHIDEventSetIntegerValue();
  -[AXEventRepresentation flags](self, "flags");
  IOHIDEventSetEventFlags();
  return KeyboardEvent;
}

- (__IOHIDEvent)_newButtonHIDEventRefWithType:(unsigned int)a3
{
  __IOHIDEvent *KeyboardEvent;
  int v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  KeyboardEvent = 0;
  if ((int)a3 <= 4199)
  {
    switch(a3)
    {
      case 0x4B0u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B1u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B2u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B3u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B4u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B5u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B6u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B7u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B8u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4B9u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BAu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BBu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BCu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BDu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BEu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4BFu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C0u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C1u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C2u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C3u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C4u:
      case 0x4C5u:
        return KeyboardEvent;
      case 0x4C6u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C7u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C8u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4C9u:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CAu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CBu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CCu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CDu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CEu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      case 0x4CFu:
        v5 = 0;
        v6 = 0;
        goto LABEL_105;
      default:
        v5 = 0;
        v6 = 0;
        switch(a3)
        {
          case 0x3E8u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3E9u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3EAu:
          case 0x3EBu:
          case 0x3ECu:
          case 0x3EDu:
          case 0x3F6u:
          case 0x3F7u:
          case 0x3F8u:
          case 0x3F9u:
          case 0x3FAu:
          case 0x3FBu:
          case 0x3FCu:
          case 0x403u:
          case 0x404u:
          case 0x407u:
          case 0x40Cu:
          case 0x40Du:
            return KeyboardEvent;
          case 0x3EEu:
            v6 = 0;
            v5 = 1;
            goto LABEL_105;
          case 0x3EFu:
            v6 = 0;
            v5 = 1;
            goto LABEL_105;
          case 0x3F0u:
            v5 = 0;
            v6 = 1;
            goto LABEL_105;
          case 0x3F1u:
            v5 = 0;
            v6 = 1;
            goto LABEL_105;
          case 0x3F2u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3F3u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3F4u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3F5u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3FDu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3FEu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x3FFu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x400u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x401u:
            goto LABEL_105;
          case 0x402u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x405u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x406u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x408u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x409u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x40Au:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x40Bu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x40Eu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x40Fu:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x410u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x411u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x412u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          case 0x413u:
            v5 = 0;
            v6 = 0;
            goto LABEL_105;
          default:
            switch(a3)
            {
              case 0x44Du:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              case 0x44Eu:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              case 0x44Fu:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              case 0x450u:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              case 0x451u:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              case 0x452u:
                v5 = 0;
                v6 = 0;
                goto LABEL_105;
              default:
                return KeyboardEvent;
            }
        }
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1068u:
        v5 = 0;
        v6 = 0;
        break;
      case 0x1069u:
        v5 = 0;
        v6 = 0;
        break;
      case 0x106Au:
        v5 = 0;
        v6 = 0;
        break;
      case 0x106Bu:
        v5 = 0;
        v6 = 0;
        break;
      case 0x106Cu:
        v5 = 0;
        v6 = 0;
        break;
      case 0x106Du:
        v5 = 0;
        v6 = 0;
        break;
      default:
        if (a3 == 4500)
        {
          v5 = 0;
          v6 = 0;
        }
        else
        {
          if (a3 != 4501)
            return KeyboardEvent;
          v5 = 0;
          v6 = 0;
        }
        break;
    }
LABEL_105:
    -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
    KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
    -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "bytes");
      -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "length");
      IOHIDEventSetAttributeData();

    }
    v10 = -[AXEventRepresentation additionalFlags](self, "additionalFlags");
    if (v5 | v6)
      v11 = v10 | 0x40;
    else
      v11 = v10;
    if (v11)
    {
      IOHIDEventGetEventFlags();
      IOHIDEventSetEventFlags();
    }
    -[AXEventRepresentation senderID](self, "senderID");
    IOHIDEventSetSenderID();
  }
  return KeyboardEvent;
}

- (__IOHIDEvent)_newTostadaButtonHIDEventRefWithType:(unsigned int)a3
{
  __IOHIDEvent *TouchSensitiveButtonEvent;
  const void *ForceStageEvent;

  if (a3 - 1044 > 7)
    return 0;
  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  TouchSensitiveButtonEvent = (__IOHIDEvent *)IOHIDEventCreateTouchSensitiveButtonEvent();
  ForceStageEvent = (const void *)IOHIDEventCreateForceStageEvent();
  -[AXEventRepresentation senderID](self, "senderID");
  IOHIDEventSetSenderID();
  IOHIDEventAppendEvent();
  CFRelease(ForceStageEvent);
  return TouchSensitiveButtonEvent;
}

- (__IOHIDEvent)_newAccessibilityHIDEventRef
{
  void *v3;
  void *v4;
  __IOHIDEvent *VendorDefinedEvent;

  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  -[AXEventRepresentation accessibilityData](self, "accessibilityData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "dataBytes");
    objc_msgSend(v4, "dataLength");
    VendorDefinedEvent = (__IOHIDEvent *)IOHIDEventCreateVendorDefinedEvent();
    -[AXEventRepresentation senderID](self, "senderID");
    IOHIDEventSetSenderID();
  }
  else
  {
    VendorDefinedEvent = 0;
  }

  return VendorDefinedEvent;
}

- (id)normalizedEventRepresentation:(BOOL)a3 scale:(BOOL)a4
{
  _BOOL4 v4;
  AXEventRepresentation *v5;
  AXEventRepresentation *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = (AXEventRepresentation *)-[AXEventRepresentation copy](self, "copy");
  else
    v5 = self;
  v6 = v5;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXEventRepresentation handInfo](v5, "handInfo", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "pathLocation");
        objc_msgSend(v13, "setPathLocation:", AXNormalizePoint(v4, v14));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)fakeTouchScaleEventRepresentation:(BOOL)a3
{
  AXEventRepresentation *v5;
  double v6;
  AXEventRepresentation *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (fakeTouchScaleEventRepresentation__onceToken == -1)
  {
    if (a3)
    {
LABEL_3:
      v5 = (AXEventRepresentation *)-[AXEventRepresentation copy](self, "copy");
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&fakeTouchScaleEventRepresentation__onceToken, &__block_literal_global_33);
    if (a3)
      goto LABEL_3;
  }
  v5 = self;
LABEL_6:
  v7 = v5;
  LODWORD(v6) = fakeTouchScaleEventRepresentation__TouchScaleFactor;
  if (*(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor != 1.0)
  {
    -[AXEventRepresentation handInfo](v5, "handInfo", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handPosition");
    v10 = v9 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor;
    -[AXEventRepresentation handInfo](v7, "handInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handPosition");
    v13 = v12 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor;
    -[AXEventRepresentation handInfo](v7, "handInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHandPosition:", v10, v13);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[AXEventRepresentation handInfo](v7, "handInfo", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v21, "pathLocation");
          objc_msgSend(v21, "setPathLocation:", v22 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor, v23 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v18);
    }

  }
  return v7;
}

float __59__AXEventRepresentation_fakeTouchScaleEventRepresentation___block_invoke()
{
  double v0;
  double v1;

  GSMainScreenPixelSize();
  if (v0 == 1280.0)
  {
    GSMainScreenPixelSize();
    LODWORD(v0) = 0;
    if (v1 == 2272.0)
    {
      GSMainScreenScaleFactor();
      *(float *)&v0 = 4.0 / *(float *)&v0;
      fakeTouchScaleEventRepresentation__TouchScaleFactor = LODWORD(v0);
    }
  }
  return *(float *)&v0;
}

- (void)modifyPoints:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXEventRepresentation handInfo](self, "handInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "pathLocation");
        v4[2](v4);
        objc_msgSend(v11, "setPathLocation:");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)neuterUpdates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXEventRepresentation handInfo](self, "handInfo", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "setDidUpdateMask:", 0);
        objc_msgSend(v9, "setWillUpdateMask:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[AXEventRepresentation setGenerationCount:](self, "setGenerationCount:", 0);
  -[AXEventRepresentation setDidUpdateMask:](self, "setDidUpdateMask:", 0);
  -[AXEventRepresentation setWillUpdateMask:](self, "setWillUpdateMask:", 0);
}

- (id)denormalizedEventRepresentation:(BOOL)a3 descale:(BOOL)a4
{
  AXEventRepresentation *v4;
  AXEventRepresentation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = (AXEventRepresentation *)-[AXEventRepresentation copy](self, "copy");
  else
    v4 = self;
  v5 = v4;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXEventRepresentation handInfo](v4, "handInfo", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "pathLocation");
        AXDenormalizePoint();
        objc_msgSend(v12, "setPathLocation:");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

- (__IOHIDEvent)_newIOSMACPointerRef
{
  void *v3;
  void *v4;
  void *v5;
  __IOHIDEvent *MouseEvent;

  -[AXEventRepresentation HIDTime](self, "HIDTime");
  -[AXEventRepresentation iosmacPointerInfo](self, "iosmacPointerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  -[AXEventRepresentation iosmacPointerInfo](self, "iosmacPointerInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  -[AXEventRepresentation iosmacPointerInfo](self, "iosmacPointerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pressed");
  MouseEvent = (__IOHIDEvent *)IOHIDEventCreateMouseEvent();

  if (-[AXEventRepresentation contextId](self, "contextId"))
  {
    -[AXEventRepresentation contextId](self, "contextId");
    BKSHIDEventSetSimpleInfo();
  }
  return MouseEvent;
}

- (__IOHIDEvent)_newHandHIDEventRef
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t DigitizerEvent;
  __IOHIDEvent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  unsigned int v27;
  int v28;
  float v29;
  const void *DigitizerFingerEventWithQuality;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v38;
  double v39;
  uint64_t v40;
  __IOHIDEvent *v41;
  uint64_t v42;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventType");

  switch(v4)
  {
    case 1u:
    case 6u:
      AXDeviceHasHomeButton();
      break;
    default:
      break;
  }
  -[AXEventRepresentation _machTimeForHIDEventRef](self, "_machTimeForHIDEventRef");
  if (!-[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"))
  {
    -[AXEventRepresentation handInfo](self, "handInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handEventMask");

  }
  v6 = (v4 < 0xC) & (0x826u >> v4);
  if (-[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"))
  {
    -[AXEventRepresentation handInfo](self, "handInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "additionalHandEventFlagsForGeneratedEvents");

  }
  -[AXEventRepresentation handInfo](self, "handInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handIndex");
  -[AXEventRepresentation handInfo](self, "handInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handIdentity");
  -[AXEventRepresentation handInfo](self, "handInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handPosition");
  -[AXEventRepresentation handInfo](self, "handInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handPosition");
  DigitizerEvent = IOHIDEventCreateDigitizerEvent();

  v13 = (__IOHIDEvent *)DigitizerEvent;
  if (v4 <= 0xB && ((1 << v4) & 0x826) != 0)
    IOHIDEventSetIntegerValue();
  -[AXEventRepresentation generationCount](self, "generationCount", v6);
  IOHIDEventSetIntegerValue();
  -[AXEventRepresentation willUpdateMask](self, "willUpdateMask");
  IOHIDEventSetIntegerValue();
  -[AXEventRepresentation didUpdateMask](self, "didUpdateMask");
  IOHIDEventSetIntegerValue();
  -[AXEventRepresentation handInfo](self, "handInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "paths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v42 = v16;
  if (v16 >= 1)
  {
    v17 = 0;
    v41 = v13;
    do
    {
      -[AXEventRepresentation handInfo](self, "handInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paths");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "pathLocation");
      v22 = v21;
      v24 = v23;
      if (!-[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"))
        objc_msgSend(v20, "pathEventMask");
      if (-[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"))
      {
        -[AXEventRepresentation handInfo](self, "handInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "additionalHandEventFlagsForGeneratedEvents");

      }
      v26 = v6;
      if (!-[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"))
      {
        v27 = objc_msgSend(v20, "pathProximity");
        objc_msgSend(v20, "pathProximity");
        v26 = (v27 >> 1) & 1;
      }
      if (-[AXEventRepresentation screenEdgeForPoint:](self, "screenEdgeForPoint:", v22, v24))
        AXDeviceHasHomeButton();
      v28 = objc_msgSend(v20, "transducerType");
      objc_msgSend(v20, "pathIndex");
      objc_msgSend(v20, "pathIdentity");
      if (v28)
      {
        objc_msgSend(v20, "pathPressure");
        objc_msgSend(v20, "pathTwist");
        objc_msgSend(v20, "pathMinorRadius");
        objc_msgSend(v20, "pathMajorRadius");
        objc_msgSend(v20, "pathQuality");
        objc_msgSend(v20, "pathDensity");
        v40 = 0;
        v39 = v29;
        DigitizerFingerEventWithQuality = (const void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
      }
      else
      {
        objc_msgSend(v20, "pathZValue");
        objc_msgSend(v20, "pathPressure");
        objc_msgSend(v20, "barrelPressure");
        objc_msgSend(v20, "pathTwist");
        objc_msgSend(v20, "altitude");
        objc_msgSend(v20, "azimuth");
        if (v26)
          v31 = 0x20000;
        else
          v31 = 0;
        LODWORD(v38) = v31;
        DigitizerFingerEventWithQuality = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();
        objc_msgSend(v20, "pathQuality", v38);
        IOHIDEventSetFloatValue();
        objc_msgSend(v20, "pathDensity");
        IOHIDEventSetFloatValue();
        objc_msgSend(v20, "pathMajorRadius");
        IOHIDEventSetFloatValue();
        objc_msgSend(v20, "pathMinorRadius");
        IOHIDEventSetFloatValue();
      }
      v13 = v41;
      objc_msgSend(v20, "willUpdateMask", *(_QWORD *)&v39, v40);
      IOHIDEventSetIntegerValue();
      objc_msgSend(v20, "didUpdateMask");
      IOHIDEventSetIntegerValue();
      objc_msgSend(v20, "orbValue");
      IOHIDEventSetFloatValue();
      objc_msgSend(v20, "transducerType");
      IOHIDEventSetIntegerValue();
      objc_msgSend(v20, "orbValue");
      objc_msgSend(v20, "pathMajorRadiusTolerance");
      IOHIDEventSetFloatValue();
      -[AXEventRepresentation generationCount](self, "generationCount");
      IOHIDEventSetIntegerValue();
      if (objc_msgSend(v20, "shouldSetTouchFlag"))
      {
        IOHIDEventGetIntegerValue();
        IOHIDEventSetIntegerValue();
      }
      if (-[AXEventRepresentation secureName](self, "secureName"))
      {
        IOHIDEventGetTimeStamp();
        IOHIDEventCreateVendorDefinedEvent();
        IOHIDEventAppendEvent();
      }
      IOHIDEventAppendEvent();
      CFRelease(DigitizerFingerEventWithQuality);

      ++v17;
    }
    while (v42 != v17);
  }
  -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v33, "bytes");
    -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "length");
    IOHIDEventSetAttributeData();

  }
  -[AXEventRepresentation senderID](self, "senderID");
  IOHIDEventSetSenderID();
  -[AXEventRepresentation handInfo](self, "handInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "eventType");

  if (v36 == 8)
    -[AXEventRepresentation isDisplayIntegrated](self, "isDisplayIntegrated");
  IOHIDEventSetIntegerValue();
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = objc_alloc_init(AXEventRepresentation);
  -[AXEventRepresentation setType:](v5, "setType:", -[AXEventRepresentation type](self, "type"));
  -[AXEventRepresentation setOriginalType:](v5, "setOriginalType:", -[AXEventRepresentation originalType](self, "originalType"));
  -[AXEventRepresentation setSubtype:](v5, "setSubtype:", -[AXEventRepresentation subtype](self, "subtype"));
  -[AXEventRepresentation location](self, "location");
  -[AXEventRepresentation setLocation:](v5, "setLocation:");
  -[AXEventRepresentation windowLocation](self, "windowLocation");
  -[AXEventRepresentation setWindowLocation:](v5, "setWindowLocation:");
  -[AXEventRepresentation setWindow:](v5, "setWindow:", -[AXEventRepresentation window](self, "window"));
  -[AXEventRepresentation setTime:](v5, "setTime:", -[AXEventRepresentation time](self, "time"));
  -[AXEventRepresentation setFlags:](v5, "setFlags:", -[AXEventRepresentation flags](self, "flags"));
  -[AXEventRepresentation setPid:](v5, "setPid:", -[AXEventRepresentation pid](self, "pid"));
  -[AXEventRepresentation handInfo](self, "handInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  -[AXEventRepresentation setHandInfo:](v5, "setHandInfo:", v7);
  -[AXEventRepresentation data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);

  -[AXEventRepresentation setData:](v5, "setData:", v9);
  -[AXEventRepresentation clientId](self, "clientId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);

  -[AXEventRepresentation setClientId:](v5, "setClientId:", v11);
  -[AXEventRepresentation setTaskPort:](v5, "setTaskPort:", -[AXEventRepresentation taskPort](self, "taskPort"));
  -[AXEventRepresentation setHIDTime:](v5, "setHIDTime:", -[AXEventRepresentation HIDTime](self, "HIDTime"));
  -[AXEventRepresentation HIDAttributeData](self, "HIDAttributeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventRepresentation setHIDAttributeData:](v5, "setHIDAttributeData:", v12);

  -[AXEventRepresentation setAdditionalFlags:](v5, "setAdditionalFlags:", -[AXEventRepresentation additionalFlags](self, "additionalFlags"));
  -[AXEventRepresentation setContextId:](v5, "setContextId:", -[AXEventRepresentation contextId](self, "contextId"));
  -[AXEventRepresentation setDisplayId:](v5, "setDisplayId:", -[AXEventRepresentation displayId](self, "displayId"));
  -[AXEventRepresentation setSenderID:](v5, "setSenderID:", -[AXEventRepresentation senderID](self, "senderID"));
  -[AXEventRepresentation keyInfo](self, "keyInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[AXEventRepresentation setKeyInfo:](v5, "setKeyInfo:", v14);

  -[AXEventRepresentation accelerometerInfo](self, "accelerometerInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventRepresentation setAccelerometerInfo:](v5, "setAccelerometerInfo:", v15);

  -[AXEventRepresentation setIsGeneratedEvent:](v5, "setIsGeneratedEvent:", -[AXEventRepresentation isGeneratedEvent](self, "isGeneratedEvent"));
  -[AXEventRepresentation setScrollAmount:](v5, "setScrollAmount:", -[AXEventRepresentation scrollAmount](self, "scrollAmount"));
  -[AXEventRepresentation setScrollAccelAmount:](v5, "setScrollAccelAmount:", -[AXEventRepresentation scrollAccelAmount](self, "scrollAccelAmount"));
  -[AXEventRepresentation setIsDisplayIntegrated:](v5, "setIsDisplayIntegrated:", -[AXEventRepresentation isDisplayIntegrated](self, "isDisplayIntegrated"));
  -[AXEventRepresentation setWillUpdateMask:](v5, "setWillUpdateMask:", -[AXEventRepresentation willUpdateMask](self, "willUpdateMask"));
  -[AXEventRepresentation setDidUpdateMask:](v5, "setDidUpdateMask:", -[AXEventRepresentation didUpdateMask](self, "didUpdateMask"));
  -[AXEventRepresentation setGenerationCount:](v5, "setGenerationCount:", -[AXEventRepresentation generationCount](self, "generationCount"));
  -[AXEventRepresentation setRedirectEvent:](v5, "setRedirectEvent:", -[AXEventRepresentation isRedirectEvent](self, "isRedirectEvent"));
  -[AXEventRepresentation setSystemDrag:](v5, "setSystemDrag:", -[AXEventRepresentation isSystemDrag](self, "isSystemDrag"));
  -[AXEventRepresentation gameControllerInfo](self, "gameControllerInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);

  -[AXEventRepresentation setGameControllerInfo:](v5, "setGameControllerInfo:", v17);
  -[AXEventRepresentation pointerControllerInfo](self, "pointerControllerInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);

  -[AXEventRepresentation setPointerControllerInfo:](v5, "setPointerControllerInfo:", v19);
  -[AXEventRepresentation iosmacPointerInfo](self, "iosmacPointerInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[AXEventRepresentation setIosmacPointerInfo:](v5, "setIosmacPointerInfo:", v21);

  -[AXEventRepresentation setCreatorHIDEvent:](v5, "setCreatorHIDEvent:", -[AXEventRepresentation creatorHIDEvent](self, "creatorHIDEvent"));
  -[AXEventRepresentation setIsBuiltIn:](v5, "setIsBuiltIn:", -[AXEventRepresentation isBuiltIn](self, "isBuiltIn"));
  -[AXEventRepresentation auxiliaryData](self, "auxiliaryData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventRepresentation setAuxiliaryData:](v5, "setAuxiliaryData:", v22);

  return v5;
}

- (AXEventRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *auxiliaryData;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AXEventRepresentation;
  v5 = -[AXEventRepresentation init](&v23, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v5->_originalType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("originalType"));
    v5->_subtype = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("subtype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getValue:size:", &v5->_location, 16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windowLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getValue:size:", &v5->_windowLocation, 16);

    v5->_time = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("time"));
    v5->_window = (void *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("window"));
    v5->_flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flags"));
    v5->_pid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
    v5->_redirectEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRedirectEvent"));
    v5->_systemDrag = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemDrag"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setHandInfo:](v5, "setHandInfo:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setKeyInfo:](v5, "setKeyInfo:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gameInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setGameControllerInfo:](v5, "setGameControllerInfo:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setPointerControllerInfo:](v5, "setPointerControllerInfo:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accelerometerInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setAccelerometerInfo:](v5, "setAccelerometerInfo:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setData:](v5, "setData:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iosmacPointerInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setIosmacPointerInfo:](v5, "setIosmacPointerInfo:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setClientId:](v5, "setClientId:", v15);

    v5->_taskPort = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("taskPort"));
    v5->_HIDTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HIDTime"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HIDAttributeData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventRepresentation setHIDAttributeData:](v5, "setHIDAttributeData:", v16);

    -[AXEventRepresentation setAdditionalFlags:](v5, "setAdditionalFlags:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("additionalFlags")));
    v5->_contextId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("contextId"));
    v5->_displayId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("displayId"));
    v5->_senderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HIDSenderId"));
    v5->_isBuiltIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBuiltIn"));
    v5->_isDisplayIntegrated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDisplayIntegrated"));
    v5->_generationCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("generationCount"));
    v5->_willUpdateMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("willUpdateMask"));
    v5->_didUpdateMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("didUpdateMask"));
    v5->_isGeneratedEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGeneratedEvent"));
    v5->_scrollAmount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scrollAmount"));
    v5->_scrollAccelAmount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("scrollAccelAmount"));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("auxiliaryData"));
    v20 = objc_claimAutoreleasedReturnValue();
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSDictionary *)v20;

  }
  return v5;
}

- (void)dealloc
{
  __IOHIDEvent *creatorHIDEvent;
  __IOHIDServiceClient *creatorHIDServiceClient;
  objc_super v5;

  creatorHIDEvent = self->_creatorHIDEvent;
  if (creatorHIDEvent)
  {
    CFRelease(creatorHIDEvent);
    self->_creatorHIDEvent = 0;
  }
  creatorHIDServiceClient = self->_creatorHIDServiceClient;
  if (creatorHIDServiceClient)
  {
    CFRelease(creatorHIDServiceClient);
    self->_creatorHIDServiceClient = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AXEventRepresentation;
  -[AXEventRepresentation dealloc](&v5, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  type = self->_type;
  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", type, CFSTR("type"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_originalType, CFSTR("originalType"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_location, "{CGPoint=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("location"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_windowLocation, "{CGPoint=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("windowLocation"));

  objc_msgSend(v8, "encodeInt64:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_window, CFSTR("window"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_flags, CFSTR("flags"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_pid, CFSTR("pid"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handInfo, CFSTR("handInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_gameControllerInfo, CFSTR("gameInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_pointerControllerInfo, CFSTR("pointerInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_keyInfo, CFSTR("keyInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_accelerometerInfo, CFSTR("accelerometerInfo"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_clientId, CFSTR("clientId"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_taskPort, CFSTR("taskPort"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_HIDTime, CFSTR("HIDTime"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_HIDAttributeData, CFSTR("HIDAttributeData"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_additionalFlags, CFSTR("additionalFlags"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_contextId, CFSTR("contextId"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_displayId, CFSTR("displayId"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_senderID, CFSTR("HIDSenderId"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isBuiltIn, CFSTR("isBuiltIn"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isDisplayIntegrated, CFSTR("isDisplayIntegrated"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_generationCount, CFSTR("generationCount"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_willUpdateMask, CFSTR("willUpdateMask"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_didUpdateMask, CFSTR("didUpdateMask"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isGeneratedEvent, CFSTR("isGeneratedEvent"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_scrollAmount, CFSTR("scrollAmount"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_scrollAccelAmount, CFSTR("scrollAccelAmount"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_redirectEvent, CFSTR("isRedirectEvent"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_systemDrag, CFSTR("isSystemDrag"));
  -[AXEventRepresentation iosmacPointerInfo](self, "iosmacPointerInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("iosmacPointerInfo"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_auxiliaryData, CFSTR("auxiliaryData"));
}

- (unsigned)firstPathContextId
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AXEventRepresentation type](self, "type") != 3001)
    return 0;
  -[AXEventRepresentation handInfo](self, "handInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v5, "pathWindowContextID");
  return v3;
}

- (id)accessibilityEventRepresentationTabularDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>\n  Type:             %u (orig:%u)\n  Subtype:          %d\n  Location:         x:%f y:%f\n  Window Location:  x:%f y:%f\n  Window:           %p\n  Flags:            %d\n  PID:              %d\n  Time:             %llu\n  HIDTime:          %llu\n  Data:             %@\n  Task Port:        %d\n  client ID:        %@\n  context ID:       %u\n"), v5, self, self->_type, self->_originalType, self->_subtype, *(_QWORD *)&self->_location.x, *(_QWORD *)&self->_location.y, *(_QWORD *)&self->_windowLocation.x, *(_QWORD *)&self->_windowLocation.y, self->_window, self->_flags, self->_pid, self->_time, self->_HIDTime, self->_data, self->_taskPort,
    self->_clientId,
    self->_contextId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXEventRepresentation handInfo](self, "handInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXEventRepresentation handInfo](self, "handInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityEventRepresentationTabularDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

  }
  -[AXEventRepresentation gameControllerInfo](self, "gameControllerInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AXEventRepresentation gameControllerInfo](self, "gameControllerInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityEventRepresentationTabularDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v12);

  }
  -[AXEventRepresentation pointerControllerInfo](self, "pointerControllerInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AXEventRepresentation pointerControllerInfo](self, "pointerControllerInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessibilityEventRepresentationTabularDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v15);

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  CGFloat x;
  CGFloat y;
  unint64_t time;
  unint64_t HIDTime;
  NSString *clientId;
  uint64_t flags;
  uint64_t taskPort;
  uint64_t pid;
  uint64_t contextId;
  void *v13;
  void *v14;
  uint64_t subtype;
  void *window;
  uint64_t type;
  CGPoint location;
  void *v20;
  objc_super v21;

  v20 = (void *)MEMORY[0x1E0CB37A0];
  v21.receiver = self;
  v21.super_class = (Class)AXEventRepresentation;
  -[AXEventRepresentation description](&v21, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  x = self->_windowLocation.x;
  y = self->_windowLocation.y;
  time = self->_time;
  clientId = self->_clientId;
  HIDTime = self->_HIDTime;
  window = self->_window;
  type = self->_type;
  flags = self->_flags;
  subtype = self->_subtype;
  taskPort = self->_taskPort;
  pid = self->_pid;
  contextId = self->_contextId;
  -[AXEventRepresentation _senderNameForID](self, "_senderNameForID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@. type:%u subtype:%d loc:[x:%f y:%f] windowLoc:[x:%f y:%f] window:%p flags:%d pid:%d time:%llu HIDTime:%llu taskPort:%d client:%@ ctxtID:%u sender:%@ data:[%lu bytes]"), v3, type, subtype, location, *(_QWORD *)&x, *(_QWORD *)&y, window, flags, pid, time, HIDTime, taskPort, clientId, contextId, v13, -[NSData length](self->_data, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_accessibilityData)
    objc_msgSend(v14, "appendFormat:", CFSTR("\nAXData: %@"), self->_accessibilityData);
  if (self->_handInfo)
    objc_msgSend(v14, "appendFormat:", CFSTR("\nHand Info: %@"), self->_handInfo);
  if (self->_keyInfo)
    objc_msgSend(v14, "appendFormat:", CFSTR("\nKey Info: %@"), self->_keyInfo);
  return (NSString *)v14;
}

- (id)_senderNameForID
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[AXEventRepresentation senderID](self, "senderID");
  if (v3 + 0x7FFFFFF7E8CE6C8FLL >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (ID:0x%04llx)"), -[AXEventRepresentation senderID](self, "senderID"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E24C8530[v3 - 0x817319371];
  }
  return v4;
}

- (unint64_t)fingerCount
{
  void *v2;
  unint64_t v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentFingerCount");

  return v3;
}

- (BOOL)isTouchDown
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 1;

  return v3;
}

- (BOOL)isMove
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 2;

  return v3;
}

- (BOOL)isChordChange
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 5;

  return v3;
}

- (BOOL)isLift
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 6;

  return v3;
}

- (BOOL)isInRange
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 9;

  return v3;
}

- (BOOL)isInRangeLift
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 10;

  return v3;
}

- (BOOL)isCancel
{
  void *v2;
  BOOL v3;

  -[AXEventRepresentation handInfo](self, "handInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 8;

  return v3;
}

- (unsigned)screenEdgeForPoint:(CGPoint)a3
{
  if (a3.x < 0.01)
    return 1;
  if (a3.x > 0.99)
    return 2;
  if (a3.y >= 0.01)
    return 4 * (a3.y > 0.99);
  return 3;
}

- (unsigned)originalType
{
  if (self->_originalType)
    return self->_originalType;
  else
    return -[AXEventRepresentation type](self, "type");
}

- (void)applyAccessibilityDataToCreatorHIDEvent
{
  __IOHIDEvent *v3;

  v3 = -[AXEventRepresentation creatorHIDEvent](self, "creatorHIDEvent");
  if (v3)
    -[AXEventRepresentation _applyAccessibilityDataToRealEvent:](self, "_applyAccessibilityDataToRealEvent:", v3);
}

+ (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3
{
  int IntegerValue;
  int v4;

  if (!a3)
    return 0;
  if (IOHIDEventGetType() == 1)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v4 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v4 == 34)
      return 1;
  }
  return 0;
}

- (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3
{
  return objc_msgSend((id)objc_opt_class(), "_HIDEventIsAccessibilityEvent:", a3);
}

- (__IOHIDEvent)_accessibilityEventFromRealEvent:(__IOHIDEvent *)a3
{
  __IOHIDEvent *ValueAtIndex;
  const __CFArray *Children;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;

  ValueAtIndex = a3;
  if (a3 && !-[AXEventRepresentation _HIDEventIsAccessibilityEvent:](self, "_HIDEventIsAccessibilityEvent:", a3))
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (v6 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      v8 = Count;
      v9 = 0;
      while (1)
      {
        ValueAtIndex = (__IOHIDEvent *)CFArrayGetValueAtIndex(v6, v9);
        if (-[AXEventRepresentation _HIDEventIsAccessibilityEvent:](self, "_HIDEventIsAccessibilityEvent:", ValueAtIndex))
        {
          break;
        }
        if (v8 == ++v9)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return ValueAtIndex;
}

- (void)_applyAccessibilityDataToRealEvent:(__IOHIDEvent *)a3
{
  void *v5;
  const void *VendorDefinedEvent;
  id v7;

  -[AXEventRepresentation accessibilityData](self, "accessibilityData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && v5)
  {
    v7 = v5;
    if (-[AXEventRepresentation _HIDEventIsAccessibilityEvent:](self, "_HIDEventIsAccessibilityEvent:", a3)
      || -[AXEventRepresentation _accessibilityEventFromRealEvent:](self, "_accessibilityEventFromRealEvent:", a3))
    {
      _AXAssert();
    }
    else
    {
      IOHIDEventGetTimeStamp();
      objc_msgSend(v7, "dataBytes");
      objc_msgSend(v7, "dataLength");
      VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
      IOHIDEventAppendEvent();
      v5 = v7;
      if (!VendorDefinedEvent)
        goto LABEL_7;
      CFRelease(VendorDefinedEvent);
    }
    v5 = v7;
  }
LABEL_7:

}

- (id)_accessibilityDataFromRealEvent:(__IOHIDEvent *)a3
{
  __IOHIDEvent *v3;
  uint64_t DataValue;

  if (a3)
  {
    v3 = -[AXEventRepresentation _accessibilityEventFromRealEvent:](self, "_accessibilityEventFromRealEvent:");
    if (v3)
    {
      DataValue = IOHIDEventGetDataValue();
      if (DataValue)
      {
        +[AXEventData dataWithBytes:length:](AXEventData, "dataWithBytes:length:", DataValue, IOHIDEventGetIntegerValue());
        v3 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _AXLogWithFacility();
        v3 = 0;
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (void)incrementTouchCounter
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "touchCounter");
  if ((v3 + 1) > 1)
    v4 = (v3 + 1);
  else
    v4 = 1;
  objc_msgSend(a1, "setTouchCounter:", v4);
}

+ (unsigned)touchCounter
{
  return touchCounter;
}

+ (void)setTouchCounter:(unsigned int)a3
{
  touchCounter = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void)setOriginalType:(unsigned int)a3
{
  self->_originalType = a3;
}

- (int)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int)a3
{
  self->_subtype = a3;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (CGPoint)windowLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_windowLocation.x;
  y = self->_windowLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setWindowLocation:(CGPoint)a3
{
  self->_windowLocation = a3;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (AXEventHandInfoRepresentation)handInfo
{
  return self->_handInfo;
}

- (void)setHandInfo:(id)a3
{
  objc_storeStrong((id *)&self->_handInfo, a3);
}

- (AXEventKeyInfoRepresentation)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_keyInfo, a3);
}

- (AXEventAccelerometerInfoRepresentation)accelerometerInfo
{
  return self->_accelerometerInfo;
}

- (void)setAccelerometerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometerInfo, a3);
}

- (AXEventGameControllerInfoRepresentation)gameControllerInfo
{
  return self->_gameControllerInfo;
}

- (void)setGameControllerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_gameControllerInfo, a3);
}

- (AXEventPointerInfoRepresentation)pointerControllerInfo
{
  return self->_pointerControllerInfo;
}

- (void)setPointerControllerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pointerControllerInfo, a3);
}

- (AXEventIOSMACPointerInfoRepresentation)iosmacPointerInfo
{
  return self->_iosmacPointerInfo;
}

- (void)setIosmacPointerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_iosmacPointerInfo, a3);
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (unsigned)taskPort
{
  return self->_taskPort;
}

- (void)setTaskPort:(unsigned int)a3
{
  self->_taskPort = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unint64_t)HIDTime
{
  return self->_HIDTime;
}

- (void)setHIDTime:(unint64_t)a3
{
  self->_HIDTime = a3;
}

- (NSData)HIDAttributeData
{
  return self->_HIDAttributeData;
}

- (void)setHIDAttributeData:(id)a3
{
  objc_storeStrong((id *)&self->_HIDAttributeData, a3);
}

- (int64_t)scrollAmount
{
  return self->_scrollAmount;
}

- (void)setScrollAmount:(int64_t)a3
{
  self->_scrollAmount = a3;
}

- (int64_t)scrollAccelAmount
{
  return self->_scrollAccelAmount;
}

- (void)setScrollAccelAmount:(int64_t)a3
{
  self->_scrollAccelAmount = a3;
}

- (unint64_t)additionalFlags
{
  return self->_additionalFlags;
}

- (void)setAdditionalFlags:(unint64_t)a3
{
  self->_additionalFlags = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (unsigned)displayId
{
  return self->_displayId;
}

- (void)setDisplayId:(unsigned int)a3
{
  self->_displayId = a3;
}

- (BOOL)isBuiltIn
{
  return self->_isBuiltIn;
}

- (void)setIsBuiltIn:(BOOL)a3
{
  self->_isBuiltIn = a3;
}

- (BOOL)isDisplayIntegrated
{
  return self->_isDisplayIntegrated;
}

- (void)setIsDisplayIntegrated:(BOOL)a3
{
  self->_isDisplayIntegrated = a3;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_generationCount = a3;
}

- (unsigned)willUpdateMask
{
  return self->_willUpdateMask;
}

- (void)setWillUpdateMask:(unsigned int)a3
{
  self->_willUpdateMask = a3;
}

- (unsigned)didUpdateMask
{
  return self->_didUpdateMask;
}

- (void)setDidUpdateMask:(unsigned int)a3
{
  self->_didUpdateMask = a3;
}

- (BOOL)isGeneratedEvent
{
  return self->_isGeneratedEvent;
}

- (void)setIsGeneratedEvent:(BOOL)a3
{
  self->_isGeneratedEvent = a3;
}

- (BOOL)useOriginalHIDTime
{
  return self->_useOriginalHIDTime;
}

- (void)setUseOriginalHIDTime:(BOOL)a3
{
  self->_useOriginalHIDTime = a3;
}

- (__IOHIDEvent)creatorHIDEvent
{
  return self->_creatorHIDEvent;
}

- (void)setCreatorHIDEvent:(__IOHIDEvent *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (__IOHIDServiceClient)creatorHIDServiceClient
{
  return self->_creatorHIDServiceClient;
}

- (void)setCreatorHIDServiceClient:(__IOHIDServiceClient *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (BOOL)isRedirectEvent
{
  return self->_redirectEvent;
}

- (void)setRedirectEvent:(BOOL)a3
{
  self->_redirectEvent = a3;
}

- (BOOL)isSystemDrag
{
  return self->_systemDrag;
}

- (void)setSystemDrag:(BOOL)a3
{
  self->_systemDrag = a3;
}

- (NSDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (void)setAuxiliaryData:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryData, a3);
}

- (AXEventData)accessibilityData
{
  return self->_accessibilityData;
}

- (void)setAccessibilityData:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityData, a3);
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (void)setSecureName:(unsigned int)a3
{
  self->_secureName = a3;
}

- (void)window
{
  return self->_window;
}

- (void)setWindow:(void *)a3
{
  self->_window = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_accessibilityData, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_HIDAttributeData, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_iosmacPointerInfo, 0);
  objc_storeStrong((id *)&self->_pointerControllerInfo, 0);
  objc_storeStrong((id *)&self->_gameControllerInfo, 0);
  objc_storeStrong((id *)&self->_accelerometerInfo, 0);
  objc_storeStrong((id *)&self->_keyInfo, 0);
  objc_storeStrong((id *)&self->_handInfo, 0);
}

@end
