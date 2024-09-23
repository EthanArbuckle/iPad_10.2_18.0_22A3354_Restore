@implementation AXUIMLElement

+ (void)setPerformFuzzyHitTestNextTime:(BOOL)a3
{
  AXPerformFuzzyHitTestNextTime = a3;
}

+ (BOOL)performFuzzyHitTestNextTime
{
  return AXPerformFuzzyHitTestNextTime;
}

+ (void)setFrameDelegate:(id)a3
{
  objc_storeWeak(&__frameDelegate, a3);
}

+ (id)cachedElementForParent:(__AXUIElement *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MLElementCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _AXUIElementIDForElement((uint64_t)a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedFingerController
{
  if (sharedFingerController_onceToken != -1)
    dispatch_once(&sharedFingerController_onceToken, &__block_literal_global_10);
  return (id)sharedFingerController___fingerController;
}

void __39__AXUIMLElement_sharedFingerController__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getAXPIFingerControllerClass_softClass;
  v8 = getAXPIFingerControllerClass_softClass;
  if (!getAXPIFingerControllerClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getAXPIFingerControllerClass_block_invoke;
    v4[3] = &unk_1E69194D0;
    v4[4] = &v5;
    __getAXPIFingerControllerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)sharedFingerController___fingerController;
  sharedFingerController___fingerController = (uint64_t)v2;

}

- (AXUIMLElement)initWithParentElement:(__AXUIElement *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  AXUIMLElement *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AXUIElement *parent;
  NSObject *v15;
  AXUIElement *v16;
  objc_super v18;
  pid_t pid;
  uint8_t buf[4];
  AXUIElement *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (initWithParentElement__onceToken == -1)
  {
    if (a3)
      goto LABEL_3;
LABEL_17:
    -[AXUIMLElement initWithParentElement:].cold.1();
  }
  dispatch_once(&initWithParentElement__onceToken, &__block_literal_global_188);
  if (!a3)
    goto LABEL_17;
LABEL_3:
  pid = 0;
  AXUIElementGetPid(a3, &pid);
  v5 = pid;
  if (pid < 0)
  {
    if (_mlCacheIdx == 9998)
      v6 = 10000;
    else
      v6 = _mlCacheIdx + 1;
    _mlCacheIdx = v6;
    v8 = v6;
  }
  else
  {
    v6 = _AXUIElementIDForElement((uint64_t)a3);
    v8 = v7;
    v5 = pid;
    if (pid >= 1)
    {
      v5 = -pid;
      pid = -pid;
    }
  }
  v9 = (const void *)_AXUIElementCreateWithPIDAndID(v5, v6, v8);
  v18.receiver = self;
  v18.super_class = (Class)AXUIMLElement;
  v10 = -[AXUIElement initWithAXElement:](&v18, sel_initWithAXElement_, v9);
  CFRelease(v9);
  v11 = (void *)MLElementCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v12);

  if (v9 && !CFEqual(a3, v9))
  {
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    parent = v10->_parent;
    v10->_parent = (AXUIElement *)v13;

  }
  AXMediaLogMLElement();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v10->_parent;
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1B54A6000, v15, OS_LOG_TYPE_INFO, "Initializing MLElement with parent: %@", buf, 0xCu);
  }

  return v10;
}

void __39__AXUIMLElement_initWithParentElement___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MLElementCache;
  MLElementCache = v0;

}

- (BOOL)_isTopLevelMLElement
{
  return -[AXUIElement pid](self->_parent, "pid") > 0;
}

- (id)_topLevelMLElement
{
  AXUIElement *v3;
  objc_class *v4;

  v3 = self->_parent;
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if ((-[AXUIElement _isTopLevelMLElement](self->_parent, "_isTopLevelMLElement") & 1) != 0)
        break;
      v4 = v3[1].super.isa;

      v3 = (AXUIElement *)v4;
    }
    while (v4);
  }
  return v3;
}

- (id)_appElement
{
  void *v2;
  void *v3;
  void *v4;

  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiElementsWithAttribute:", 2017);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_topLevelAppElement
{
  AXUIElement *hostingParent;
  AXUIElement *v4;
  objc_class *v5;
  void *v6;
  AXUIElement *v7;
  AXUIElement *v8;
  AXUIElement *v9;
  NSObject *v10;
  AXUIElement *parent;
  AXUIElement *v12;
  int v14;
  AXUIElement *v15;
  __int16 v16;
  AXUIElement *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  hostingParent = self->_hostingParent;
  if (!hostingParent)
  {
    v4 = self->_parent;
    if (v4)
    {
      do
      {
        if ((-[AXUIElement pid](v4, "pid") & 0x80000000) == 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v5 = v4[1].super.isa;

        v4 = (AXUIElement *)v5;
      }
      while (v5);
    }
    -[AXUIElement objectWithAXAttribute:](v4, "objectWithAXAttribute:", 5002);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[AXUIElement updateCache:](self->_parent, "updateCache:", 5002);
      -[AXUIElement objectWithAXAttribute:](self->_parent, "objectWithAXAttribute:", 5002);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", v6);
    v7 = (AXUIElement *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hostingParent;
    self->_hostingParent = v7;

    hostingParent = self->_hostingParent;
    if (!hostingParent)
      hostingParent = self->_parent;
  }
  v9 = hostingParent;
  AXMediaLogMLElement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    parent = self->_parent;
    v12 = self->_hostingParent;
    v14 = 138412546;
    v15 = parent;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1B54A6000, v10, OS_LOG_TYPE_INFO, "Top level app MLElement %@/%@", (uint8_t *)&v14, 0x16u);
  }

  return v9;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isValidForApplication:(id)a3
{
  return 1;
}

- (id)arrayWithAXAttribute:(int64_t)a3
{
  if (a3 == 2036)
    return self->_customActions;
  else
    return 0;
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  int64_t uiClass;

  v4 = 0;
  if (a3 > 2070)
  {
    if (a3 == 2071)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = -[NSString hash](self->_label, "hash");
      v10 = -[NSString hash](self->_value, "hash");
      uiClass = self->_uiClass;
      NSStringFromSize(self->_rotatedFrame.size);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%lu-%lu-%ld-%@"), v9, v10, uiClass, v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 3003)
        return v4;
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithAXAttribute:", 3003);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (id)v7;

    return v4;
  }
  if (a3 == 2001)
  {
    v5 = 128;
    goto LABEL_9;
  }
  if (a3 == 2006)
  {
    v5 = 96;
LABEL_9:
    v4 = *(id *)((char *)&self->super.super.isa + v5);
  }
  return v4;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;

  LOBYTE(v4) = 0;
  if (a3 > 2064)
  {
    if (a3 != 2065)
    {
      if (a3 == 3026 || a3 == 3066)
      {
        -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "BOOLWithAXAttribute:", a3);

        return v6;
      }
      return v4;
    }
    return -[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement");
  }
  if (a3 == 2016)
  {
    return !-[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement");
  }
  else if (a3 == 2046)
  {
    return -[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement");
  }
  return v4;
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t traits;
  void *v7;

  if (a3 <= 2051)
  {
    if (a3 == 2004)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      traits = self->_traits;
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberWithAXAttribute:", 2004);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedIntegerValue") | traits);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (a3 == 2021)
    {
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberWithAXAttribute:", 2021);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      return v4;
    }
    goto LABEL_8;
  }
  if (a3 == 2052)
  {
    v4 = &unk_1E6926B78;
    return v4;
  }
  if (a3 != 2701)
  {
LABEL_8:
    v4 = &unk_1E69266C8;
    return v4;
  }
  v4 = &unk_1E69266B0;
  return v4;
}

+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  AXValueRef v23;
  void *v24;
  void *v25;
  void *v26;
  const __AXValue *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect valuePtr;
  CGRect result;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  valuePtr = a3;
  if (_appRelativeRectForRect_contextId__onceToken != -1)
    dispatch_once(&_appRelativeRectForRect_contextId__onceToken, &__block_literal_global_201);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)AppFrameCache, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend((id)AppFrameCache, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rectValue");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v23 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
    +[AXUIElement uiSystemWideApplication](AXUIElement, "uiSystemWideApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (const __AXValue *)objc_msgSend(v24, "objectWithAXAttribute:parameter:", 91505, objc_msgSend(v25, "arrayWithObjects:", v23, v26, 0));

    if (v23)
      CFRelease(v23);
    if (v27)
    {
      AXValueGetValue(v27, kAXValueTypeCGRect, &valuePtr);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", valuePtr.origin.x, valuePtr.origin.y, valuePtr.size.width, valuePtr.size.height);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)AppFrameCache, "setObject:forKeyedSubscript:", v28, v12);

    }
    v20 = valuePtr.size.width;
    v22 = valuePtr.size.height;
    v16 = valuePtr.origin.x;
    v18 = valuePtr.origin.y;
  }

  v29 = v16;
  v30 = v18;
  v31 = v20;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

void __51__AXUIMLElement__appRelativeRectForRect_contextId___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)AppFrameCache;
  AppFrameCache = v0;

}

+ (CGRect)_screenRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4;
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = AXConvertPointToHostedCoordinates(*(uint64_t *)&a4, 0, a3.origin.x, a3.origin.y);
  v11 = v10;
  v13.size.width = AXConvertPointToHostedCoordinates(v4, 0, x + width, y + height) - v9;
  v13.size.height = v12 - v11;
  v13.origin.x = v9;
  v13.origin.y = v11;
  return CGRectStandardize(v13);
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if ((a3 == 2003 || a3 == 2709 || a3 == 2057) && !-[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement"))
  {
    -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  else
  {
    -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rectWithAXAttribute:", a3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  void *v5;
  CGPath *v6;

  if (a3 == 2042)
    return 0;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CGPath *)objc_msgSend(v5, "pathWithAXAttribute:", a3);

  return v6;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  double MidY;
  CGFloat MidX;
  double v6;
  double v7;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  if ((a3 == 2062 || a3 == 2007) && !-[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement"))
  {
    -[AXUIMLElement rotatedCenterPoint](self, "rotatedCenterPoint");
    if (*MEMORY[0x1E0C9D538] == v7 && *(double *)(MEMORY[0x1E0C9D538] + 8) == v6)
    {
      -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
      x = v16.origin.x;
      y = v16.origin.y;
      width = v16.size.width;
      height = v16.size.height;
      MidX = CGRectGetMidX(v16);
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MidY = CGRectGetMidY(v17);
    }
    else
    {
      -[AXUIMLElement rotatedCenterPoint](self, "rotatedCenterPoint");
      MidX = v9;
    }
  }
  else
  {
    MidX = *MEMORY[0x1E0C9D538];
    MidY = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v14 = MidX;
  result.y = MidY;
  result.x = v14;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CGColor)colorWithAXAttribute:(int64_t)a3
{
  return 0;
}

- (id)objectWithAXAttribute:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = 0;
  if (a3 > 2999)
  {
    if (a3 == 3000 || a3 == 3009)
    {
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectWithAXAttribute:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    if (a3 != 5002)
      return v4;
    v11.receiver = self;
    v11.super_class = (Class)AXUIMLElement;
    -[AXUIElement objectWithAXAttribute:](&v11, sel_objectWithAXAttribute_, 5002);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  switch(a3)
  {
    case 2017:
      goto LABEL_12;
    case 2092:
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2142:
      if (self->_parent)
      {
        -[AXUIElement objectWithAXAttribute:](self->_parent, "objectWithAXAttribute:", 2142);
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v4 = (void *)v5;
        return v4;
      }
LABEL_12:
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectWithAXAttribute:", 2017);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
  }
  return v4;
}

- (id)valueArrayWithAXAttributes:(__CFArray *)a3
{
  return 0;
}

- (id)uiElementsWithAttribute:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3 == 2017)
  {
    -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiElementsWithAttribute:", 2017);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4
{
  return 0;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5
{
  return 0;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  return 0;
}

- (BOOL)canPerformAXAction:(int)a3
{
  BOOL v3;

  if ((a3 - 2003) > 6)
    return 0;
  v3 = 1;
  if (((1 << (a3 + 45)) & 0x79) == 0)
    return self->_uiClass == 6;
  return v3;
}

- (BOOL)performAXAction:(int)a3
{
  return -[AXUIMLElement performAXAction:withValue:fencePort:](self, "performAXAction:withValue:fencePort:", *(_QWORD *)&a3, 0, 0);
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  void *v10;
  char v11;
  AXUIMLElement *v12;
  uint64_t v13;
  BOOL v14;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  switch((int)v6)
  {
    case 2003:
      v9 = -[AXUIMLElement _handleScrollToVisible:](self, "_handleScrollToVisible:", v8);
      goto LABEL_10;
    case 2004:
      if (self->_uiClass != 6)
        goto LABEL_11;
      v12 = self;
      v13 = 2009;
      goto LABEL_9;
    case 2005:
      if (self->_uiClass == 6)
      {
        v12 = self;
        v13 = 2008;
LABEL_9:
        v9 = -[AXUIMLElement performAXAction:](v12, "performAXAction:", v13);
LABEL_10:
        v14 = v9;
      }
      else
      {
LABEL_11:
        -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "performAXAction:withValue:fencePort:", v6, v8, v5);
LABEL_12:
        v14 = v11;

      }
      return v14;
    case 2006:
    case 2007:
    case 2008:
    case 2009:
      v9 = -[AXUIMLElement _handleScroll:](self, "_handleScroll:", v6);
      goto LABEL_10;
    default:
      -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "performAXAction:", v6);
      goto LABEL_12;
  }
}

- (BOOL)_handleScrollToVisible:(id)a3
{
  void *v4;
  int v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  double MidX;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("direction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  if (v5 == 2)
  {
    if (CGRectGetMinX(*(CGRect *)&v6) <= 60.0
      || (v40.origin.x = v10,
          v40.origin.y = v11,
          v40.size.width = v12,
          v40.size.height = v13,
          CGRectGetMinY(v40) <= 120.0))
    {
      v22 = MEMORY[0x1E0C9D538];
      v17 = *MEMORY[0x1E0C9D538];
      v41.origin.x = v10;
      v41.origin.y = v11;
      v41.size.width = v12;
      v41.size.height = v13;
      if (CGRectGetMinX(v41) < 60.0)
      {
        v23 = *(double *)&ScaledScreenSize_0 * 0.3;
        if (*(double *)&ScaledScreenSize_0 * 0.3 <= v12)
          v23 = v12;
        v17 = v17 - v23;
      }
      v19 = *(double *)(v22 + 8);
      v42.origin.x = v10;
      v42.origin.y = v11;
      v42.size.width = v12;
      v42.size.height = v13;
      if (CGRectGetMinY(v42) < 120.0)
      {
        v24 = *(double *)&ScaledScreenSize_1 * 0.3;
        if (*(double *)&ScaledScreenSize_1 * 0.3 <= v13)
          v24 = v13;
        v19 = v19 - v24;
      }
      goto LABEL_25;
    }
    goto LABEL_15;
  }
  if (v5 == 1)
  {
    v14 = *(double *)&ScaledScreenSize_1;
    v15 = *(double *)&ScaledScreenSize_0 + -60.0;
    if (CGRectGetMaxX(*(CGRect *)&v6) >= v15
      || (v37.origin.x = v10,
          v37.origin.y = v11,
          v37.size.width = v12,
          v37.size.height = v13,
          CGRectGetMaxY(v37) >= v14 + -120.0))
    {
      v16 = MEMORY[0x1E0C9D538];
      v17 = *MEMORY[0x1E0C9D538];
      v38.origin.x = v10;
      v38.origin.y = v11;
      v38.size.width = v12;
      v38.size.height = v13;
      if (CGRectGetMaxX(v38) > v15)
      {
        v18 = *(double *)&ScaledScreenSize_0 * 0.3;
        if (*(double *)&ScaledScreenSize_0 * 0.3 <= v12)
          v18 = v12;
        v17 = v17 + v18;
      }
      v19 = *(double *)(v16 + 8);
      v39.origin.x = v10;
      v39.origin.y = v11;
      v39.size.width = v12;
      v39.size.height = v13;
      if (CGRectGetMaxY(v39) > v14 + -120.0)
      {
        v20 = *(double *)&ScaledScreenSize_1 * 0.3;
        if (*(double *)&ScaledScreenSize_1 * 0.3 <= v13)
          v20 = v13;
        v19 = v19 + v20;
      }
      goto LABEL_25;
    }
LABEL_15:
    LOBYTE(v21) = 0;
    return v21;
  }
  v17 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_25:
  v43.origin.x = v10;
  v43.origin.y = v11;
  v43.size.width = v12;
  v43.size.height = v13;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = v10;
  v44.origin.y = v11;
  v44.size.width = v12;
  v44.size.height = v13;
  +[AXUIElement scrollAncestorAtCoordinate:](AXUIElement, "scrollAncestorAtCoordinate:", MidX, CGRectGetMidY(v44));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "updateCache:", 5064);
    objc_msgSend(v27, "pointWithAXAttribute:", 5064);
    AXMediaLogMLElement();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl(&dword_1B54A6000, v28, OS_LOG_TYPE_INFO, "Retrieving scroller to perform scrolling: %@", buf, 0xCu);
    }

    -[AXUIMLElement _appElement](self, "_appElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v17, v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v27, "performAXAction:withValue:", 2064, v30);

    if (v21)
    {
      objc_msgSend((id)MLElementTimer, "cancel");
      v32 = v27;
      v33 = v29;
      AXPerformBlockOnMainThreadAfterDelay();

    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

uint64_t __40__AXUIMLElement__handleScrollToVisible___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];

  objc_msgSend(*(id *)(a1 + 32), "updateCache:", 5064);
  objc_msgSend(*(id *)(a1 + 32), "pointWithAXAttribute:", 5064);
  v3 = v2 - *(double *)(a1 + 56);
  v5 = v4 - *(double *)(a1 + 64);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AXUIMLElement__handleScrollToVisible___block_invoke_2;
  v9[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v9[4] = v3;
  *(double *)&v9[5] = v5;
  return objc_msgSend(v6, "_forceMLElementRefresh:postDelegateCallback:completionBlock:", v7, 0, v9);
}

void __40__AXUIMLElement__handleScrollToVisible___block_invoke_2(NSPoint *a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXMediaLogMLElement();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromPoint(a1[2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B54A6000, v2, OS_LOG_TYPE_INFO, "Handling scroll to visible with actualized offset: %@", (uint8_t *)&v5, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained(&__frameDelegate);
  objc_msgSend(WeakRetained, "mlElementDetectorScrollToVisibleOccurred:", a1[2].x, a1[2].y);

}

- (BOOL)_handleScroll:(int)a3
{
  uint64_t v3;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  CGRect v16;
  CGRect v17;

  v3 = *(_QWORD *)&a3;
  -[AXUIMLElement _appElement](self, "_appElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  +[AXUIElement scrollAncestorAtCoordinate:](AXUIElement, "scrollAncestorAtCoordinate:", MidX, CGRectGetMidY(v17));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "performAXAction:withValue:", v3, MEMORY[0x1E0C9AAA0]);
  if (v11)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = -[AXUIMLElement _simulateScrollAction:withScreenDistanceFactor:forVisibleAction:](self, "_simulateScrollAction:withScreenDistanceFactor:forVisibleAction:", v3, 0, 0.75);
  }
  else
  {
    v14 = 1;
    -[AXUIMLElement _forceMLElementRefresh:postDelegateCallback:completionBlock:](self, "_forceMLElementRefresh:postDelegateCallback:completionBlock:", v5, 1, 0);
  }

  return v14;
}

- (void)updateCacheWithAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCacheWithAttributes:", v4);

}

- (id)nextElementsWithParameters:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("elementCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement nextElementsWithCount:baseElement:](self, "nextElementsWithCount:baseElement:", objc_msgSend(v4, "integerValue"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousElementsWithParameters:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("elementCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement previousElementsWithCount:baseElement:](self, "previousElementsWithCount:baseElement:", objc_msgSend(v4, "integerValue"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  return -[AXUIMLElement nextElementsWithCount:baseElement:](self, "nextElementsWithCount:baseElement:", a3, 0);
}

- (id)nextElementsWithCount:(unint64_t)a3 baseElement:(id)a4
{
  return +[AXUIMLElement elementsInDirection:withElement:nextElements:](AXUIMLElement, "elementsInDirection:withElement:nextElements:", 92501, self, 0);
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  return -[AXUIMLElement previousElementsWithCount:baseElement:](self, "previousElementsWithCount:baseElement:", a3, 0);
}

- (id)previousElementsWithCount:(unint64_t)a3 baseElement:(id)a4
{
  return +[AXUIMLElement elementsInDirection:withElement:nextElements:](AXUIMLElement, "elementsInDirection:withElement:nextElements:", 92502, self, 0);
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAXAttribute:withBOOL:", a3, v4);

}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withString:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  id v6;

  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAXAttribute:withLong:", a3, a4);

}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  double v6;
  id v7;

  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  objc_msgSend(v7, "setAXAttribute:withFloat:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withNumber:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withPoint:", a3, x, y);

}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withSize:", a3, width, height);

}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withRange:", a3, location, length);

}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withUIElement:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withUIElementArray:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withArray:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAXAttribute:withObject:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAXAttribute:withObject:synchronous:", a3, v8, v5);

}

+ (int64_t)_interfaceOrientationForElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  int64_t v13;

  objc_msgSend(a3, "uiElementsWithAttribute:", 2017);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithAXAttribute:", 3035);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if ((v6 - 1) >= 4)
  {
    +[AXUIElement uiSystemWideApplication](AXUIElement, "uiSystemWideApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiElementsWithAttribute:", 1001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "numberWithAXAttribute:", 1503);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11 <= 6)
      v6 = dword_1B54F058C[v11];

  }
  v12 = (v6 - 1);
  if (v12 < 4)
    v13 = v12 + 1;
  else
    v13 = 0;

  return v13;
}

+ (void)_applyAXTraitsForElement:(id)a3 uiClass:(int64_t)a4
{
  void *v4;
  _QWORD *v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;

  v6 = a3;
  v6[13] = a4;
  v19 = v6;
  if ((a4 | 8) == 0xF)
  {
    objc_msgSend(v6, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "length") == 0;
    v6 = v19;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  if ((a4 | 8) == 0xF)
  {

    v6 = v19;
  }
  if (!v8)
  {
    switch(a4)
    {
      case 1:
      case 13:
        v6[11] = 0x20000000000001;
        v11 = (void *)v6[12];
        v12 = CFSTR("0");
        goto LABEL_16;
      case 2:
      case 14:
        v6[11] = 0x20000000000001;
        v11 = (void *)v6[12];
        v12 = CFSTR("1");
LABEL_16:
        v6[12] = v12;

        v6 = v19;
        goto LABEL_32;
      case 3:
        objc_msgSend(v6, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          v15 = 64;
          v6 = v19;
LABEL_24:
          v6[11] = v15;
        }
        else
        {
          v6 = v19;
          v19[11] = 0;
        }
        break;
      case 6:
        v16 = (void *)v6[16];
        v6[16] = CFSTR("Page Picker");

        v6 = v19;
        goto LABEL_20;
      case 9:
LABEL_20:
        v17 = &kAXAdjustableTrait;
        goto LABEL_23;
      case 10:
        v17 = &kAXTabBarTrait;
        goto LABEL_23;
      case 12:
        v17 = &kAXTextEntryTrait;
LABEL_23:
        v15 = *v17;
        goto LABEL_24;
      case 16:
        v15 = v6[11] | 1;
        goto LABEL_24;
      case 17:
        v9 = v6[11];
        goto LABEL_27;
      case 18:
        v9 = v6[11];
        goto LABEL_29;
      default:
        goto LABEL_32;
    }
    goto LABEL_32;
  }
  v9 = 4;
  v6[11] = 4;
  switch(a4)
  {
    case 18:
LABEL_29:
      v18 = &kAXTabButtonTrait;
      goto LABEL_30;
    case 17:
LABEL_27:
      v18 = &kAXButtonTrait;
LABEL_30:
      v10 = v9 | *v18;
      goto LABEL_31;
    case 15:
      v10 = 5;
LABEL_31:
      v6[11] = v10;
      break;
  }
LABEL_32:
  v6[11] |= 0x200000000uLL;

}

+ (CGRect)_convertFrameToPortraitUp:(CGRect)a3 fromOrientation:(int64_t)a4 appFrame:(CGRect)a5
{
  double height;
  CGFloat width;
  CGFloat v7;
  CGFloat v8;
  double y;
  double x;
  CGFloat MinY;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MaxY;
  CGFloat v17;
  CGFloat MinX;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  switch(a4)
  {
    case 2:
      v14 = a5.origin.y;
      v15 = a5.origin.x;
      MaxX = CGRectGetMaxX(a5);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = v8;
      v29.size.height = v7;
      v25 = MaxX - CGRectGetMaxX(v29);
      v30.origin.x = v15;
      v30.origin.y = v14;
      v30.size.width = width;
      v30.size.height = height;
      MaxY = CGRectGetMaxY(v30);
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = v8;
      v31.size.height = v7;
      y = MaxY - CGRectGetMaxY(v31);
      x = v25;
      break;
    case 3:
      v17 = a5.size.width - CGRectGetMaxY(a3);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = v8;
      v32.size.height = v7;
      MinX = CGRectGetMinX(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = v8;
      v33.size.height = v7;
      v19 = CGRectGetHeight(v33);
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = v8;
      v34.size.height = v7;
      v7 = CGRectGetWidth(v34);
      v8 = v19;
      y = MinX;
      x = v17;
      break;
    case 4:
      MinY = CGRectGetMinY(a3);
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = v8;
      v26.size.height = v7;
      v12 = height - CGRectGetMaxX(v26);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = v8;
      v27.size.height = v7;
      v13 = CGRectGetHeight(v27);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = v8;
      v28.size.height = v7;
      v7 = CGRectGetWidth(v28);
      v8 = v13;
      y = v12;
      x = MinY;
      break;
  }
  v20 = x;
  v21 = y;
  v22 = v8;
  v23 = v7;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_216);
}

uint64_t __27__AXUIMLElement_initialize__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.Accessibility.AXUIMLElement", v1);
  v3 = (void *)__globalMediaQueue;
  __globalMediaQueue = (uint64_t)v2;

  v4 = objc_opt_new();
  v5 = (void *)AppLevelTopElements;
  AppLevelTopElements = v4;

  v6 = objc_opt_new();
  v7 = (void *)DetectedMLElements;
  DetectedMLElements = v6;

  return UIAccessibilityInstallSafeCategory();
}

+ (void)clearCaches
{
  NSObject *v2;
  uint8_t v3[16];

  AX_PERFORM_WITH_LOCK();
  AXMediaLogElementVision();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B54A6000, v2, OS_LOG_TYPE_INFO, "Cleared all cached", v3, 2u);
  }

}

void __28__AXUIMLElement_clearCaches__block_invoke()
{
  void *v0;

  objc_msgSend((id)DetectedMLElements, "removeAllObjects");
  objc_msgSend((id)AppFrameCache, "removeAllObjects");
  v0 = (void *)EquivalenceToken;
  EquivalenceToken = 0;

}

+ (void)clearCachesForAppsExcluding:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  v3 = a3;
  AXMediaLogElementVision();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Clearing ML element cache", buf, 2u);
  }

  objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_222);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  AX_PERFORM_WITH_LOCK();

}

uint64_t __45__AXUIMLElement_clearCachesForAppsExcluding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringWithAXAttribute:", 3003);
}

void __45__AXUIMLElement_clearCachesForAppsExcluding___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)DetectedMLElements, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v4 = 138412290;
    v10 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8, v10) & 1) == 0)
        {
          objc_msgSend((id)DetectedMLElements, "setObject:forKeyedSubscript:", 0, v8);
          objc_msgSend((id)AppFrameCache, "removeAllObjects");
          AXMediaLogElementVision();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            v16 = v8;
            _os_log_impl(&dword_1B54A6000, v9, OS_LOG_TYPE_INFO, "Clear cached for: %@", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

+ (void)setAutoRefresh:(BOOL)a3 forApp:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v6 = a4;
  if (setAutoRefresh_forApp__onceToken != -1)
    dispatch_once(&setAutoRefresh_forApp__onceToken, &__block_literal_global_223);
  objc_msgSend(v6, "stringWithAXAttribute:", 3003);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      objc_msgSend((id)AppLevelTopElements, "setObject:forKeyedSubscript:", v6, v7);
      objc_msgSend(a1, "_fireRefreshTimer");
    }
    else
    {
      objc_msgSend((id)AppLevelTopElements, "setObject:forKeyedSubscript:", 0, v7);
      objc_msgSend((id)RefreshTimer, "cancel");
    }
  }
  else
  {
    AXMediaLogMLElement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[AXUIMLElement setAutoRefresh:forApp:].cold.1();

  }
}

void __39__AXUIMLElement_setAutoRefresh_forApp___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0CF3978]);
  v1 = objc_msgSend(v0, "initWithTargetSerialQueue:", __globalMediaQueue);
  v2 = (void *)RefreshTimer;
  RefreshTimer = v1;

}

+ (void)_fireRefreshTimer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__AXUIMLElement__fireRefreshTimer__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend((id)RefreshTimer, "afterDelay:processBlock:", v2, 0.5);
}

uint64_t __34__AXUIMLElement__fireRefreshTimer__block_invoke(uint64_t a1)
{
  double Current;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)AppLevelTopElements, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        AXMediaLogMLElement();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218242;
          v17 = v10 - Current;
          v18 = 2112;
          v19 = v8;
          _os_log_impl(&dword_1B54A6000, v9, OS_LOG_TYPE_INFO, "Time to refresh elements: %f %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_queue_createMLElements:postDelegateCallback:", v8, 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_fireRefreshTimer");
}

+ (void)_setCachedMLElements:(id)a3 forID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  AXMediaLogElementVision();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v13 = objc_msgSend(v5, "count");
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B54A6000, v7, OS_LOG_TYPE_INFO, "Setting cached elements: %d for %@", buf, 0x12u);
  }

  v10 = v6;
  v11 = v5;
  v8 = v5;
  v9 = v6;
  AX_PERFORM_WITH_LOCK();

}

void __44__AXUIMLElement__setCachedMLElements_forID___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend((id)DetectedMLElements, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

}

+ (id)_cachedMLElementsForID:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v4 = v3;
  v10 = v4;
  AX_PERFORM_WITH_LOCK();
  AXMediaLogElementVision();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend((id)v12[5], "count", v9, 3221225472, __40__AXUIMLElement__cachedMLElementsForID___block_invoke, &unk_1E6919BB0, v4, &v11);
    *(_DWORD *)buf = 67109378;
    v18 = v6;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_INFO, "Retrieved ML element cache %d -> %@", buf, 0x12u);
  }

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __40__AXUIMLElement__cachedMLElementsForID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)DetectedMLElements, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_reconciledElements
{
  void *v3;
  void *v4;

  -[AXUIMLElement _currentMLElements](self, "_currentMLElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement _reconcileElements:](self, "_reconcileElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_reconcileElements:(id)a3
{
  return a3;
}

- (void)_forceMLElementRefresh:(id)a3 postDelegateCallback:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  AXMediaLogMLElement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1B54A6000, v10, OS_LOG_TYPE_INFO, "Force ML Refresh: %@", buf, 0xCu);
  }

  if (v8)
  {
    v11 = (void *)EquivalenceToken;
    EquivalenceToken = 0;

    objc_msgSend(v8, "stringWithAXAttribute:", 3003);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXUIMLElement _setCachedMLElements:forID:](AXUIMLElement, "_setCachedMLElements:forID:", 0, v12);

    v13 = (void *)MLElementTimer;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__AXUIMLElement__forceMLElementRefresh_postDelegateCallback_completionBlock___block_invoke;
    v14[3] = &unk_1E6919BD8;
    v14[4] = self;
    v15 = v8;
    v17 = a4;
    v16 = v9;
    objc_msgSend(v13, "afterDelay:processBlock:", v14, 0.0);

  }
}

uint64_t __77__AXUIMLElement__forceMLElementRefresh_postDelegateCallback_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)objc_opt_class(), "_queue_createMLElements:postDelegateCallback:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_currentMLElements
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v16[5];
  id v17;
  dispatch_semaphore_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_currentMLElements_onceToken != -1)
    dispatch_once(&_currentMLElements_onceToken, &__block_literal_global_226);
  -[AXUIMLElement _appElement](self, "_appElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringWithAXAttribute:", 3003);
    v5 = objc_claimAutoreleasedReturnValue();
    +[AXUIMLElement _cachedMLElementsForID:](AXUIMLElement, "_cachedMLElementsForID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      AXMediaLogMLElement();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B54A6000, v10, OS_LOG_TYPE_INFO, "Requesting current ML elements", buf, 2u);
      }

      if ((objc_msgSend((id)MLElementTimer, "isPending") & 1) == 0
        && (objc_msgSend((id)MLElementTimer, "isActive") & 1) == 0)
      {
        v11 = dispatch_semaphore_create(0);
        v12 = (void *)MLElementTimer;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __35__AXUIMLElement__currentMLElements__block_invoke_227;
        v16[3] = &unk_1E6919C20;
        v16[4] = self;
        v17 = v4;
        v18 = v11;
        v13 = v11;
        objc_msgSend(v12, "afterDelay:processBlock:", v16, 0.0);
        v14 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v13, v14);

      }
      +[AXUIMLElement _cachedMLElementsForID:](AXUIMLElement, "_cachedMLElementsForID:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    AXMediaLogMLElement();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = 0;
      _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_INFO, "No app element available: %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

void __35__AXUIMLElement__currentMLElements__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  DetectedElementsLock = 0;
  v0 = objc_alloc(MEMORY[0x1E0CF3978]);
  v1 = objc_msgSend(v0, "initWithTargetSerialQueue:", __globalMediaQueue);
  v2 = (void *)MLElementTimer;
  MLElementTimer = v1;

}

intptr_t __35__AXUIMLElement__currentMLElements__block_invoke_227(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_queue_createMLElements:postDelegateCallback:", *(_QWORD *)(a1 + 40), 1);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)isProbablyEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  void *v25;
  void *v26;
  char v27;

  v4 = a3;
  -[AXUIMLElement label](self, "label");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_15;
  v6 = (void *)v5;
  objc_msgSend(v4, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_15;
  objc_msgSend(v4, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v4, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIMLElement label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsString:", v11) & 1) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[AXUIMLElement label](self, "label");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "containsString:", v26);

  if ((v27 & 1) == 0)
  {
LABEL_15:
    v24 = 0;
    goto LABEL_16;
  }
LABEL_7:
  if (v4[11] != self->_traits)
    goto LABEL_15;
  if (v4[13] != self->_uiClass)
    goto LABEL_15;
  objc_msgSend(v4, "rotatedFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
  if (vabdd_f64(v13, v23) > 40.0
    || vabdd_f64(v15, v20) > 40.0
    || vabdd_f64(v17, v21) > 5.0
    || vabdd_f64(v19, v22) > 5.0)
  {
    goto LABEL_15;
  }
  v24 = 1;
LABEL_16:

  return v24;
}

+ (id)_textDetectionOptions:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getAXMTextDetectionOptionsClass_softClass;
  v20 = getAXMTextDetectionOptionsClass_softClass;
  if (!getAXMTextDetectionOptionsClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = __getAXMTextDetectionOptionsClass_block_invoke;
    v23 = &unk_1E69194D0;
    v24 = &v17;
    __getAXMTextDetectionOptionsClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v8, "defaultOptions", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "textDetectionOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textDetectionLocales");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      if (!v13)
      {
        AXMediaLogMLElement();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[AXUIMLElement _textDetectionOptions:options:].cold.1(v6, v14);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "insertObject:atIndex:", v10, 0);
      AXMediaLogElementVision();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1B54A6000, v15, OS_LOG_TYPE_INFO, "Using app locale for text detection options: %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v9, "setTextDetectionLocales:", v13);
    }

  }
  objc_msgSend(v9, "setRecognitionLevel:", 1);
  objc_msgSend(v9, "setUsesLanguageCorrection:", 1);

  return v9;
}

+ ($70A309F2B59E63663966B62550FEA657)_windowContextInformation:(SEL)a3
{
  void *v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  int v38;
  $70A309F2B59E63663966B62550FEA657 *result;
  id obj;
  void *v43;
  void *v44;
  __int128 valuePtr;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "arrayWithAXAttribute:", 3052);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = CFSTR("contextId");
    v12 = CFSTR("isKeyboardWindow");
    v13 = *(_QWORD *)v48;
    v14 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v12);
          v44 = v16;
          v19 = v17;
          v20 = v10;
          v21 = v13;
          v22 = v12;
          v23 = v14;
          v24 = v11;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          v11 = v24;
          v14 = v23;
          v12 = v22;
          v13 = v21;
          v10 = v20;
          v17 = v19;
          v16 = v44;

          if ((v26 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("frame"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        valuePtr = 0u;
        v46 = 0u;
        AXValueGetValue((AXValueRef)v27, kAXValueTypeCGRect, &valuePtr);
        objc_msgSend(v43, "axSafelyAddObject:", v17);
        v28 = objc_msgSend(v17, "unsignedIntValue");
        objc_msgSend(a2, "_appRelativeRectForRect:contextId:", v28, valuePtr, v46);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size.width = width;
        v53.size.height = height;
        if (CGRectIsEmpty(v53))
        {
          height = v36;
          width = v34;
          y = v32;
          x = v30;
        }
        else
        {
          v54.origin.x = x;
          v54.origin.y = y;
          v54.size.width = width;
          v54.size.height = height;
          v56.origin.x = v30;
          v56.origin.y = v32;
          v56.size.width = v34;
          v56.size.height = v36;
          v55 = CGRectUnion(v54, v56);
          x = v55.origin.x;
          y = v55.origin.y;
          width = v55.size.width;
          height = v55.size.height;
        }
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("isMainWindow"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "BOOLValue");

        if (v38)
          objc_msgSend(v17, "unsignedIntValue");
LABEL_15:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v10);
  }

  retstr->var0 = v43;
  retstr->var1.origin.x = x;
  retstr->var1.origin.y = y;
  retstr->var1.size.width = width;
  retstr->var1.size.height = height;

  return result;
}

+ (void)_queue_createMLElements:(id)a3 postDelegateCallback:(BOOL)a4
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id WeakRetained;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  int v40;
  __int128 v41;
  unint64_t i;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  _BOOL4 v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  Class (*v71)(uint64_t);
  void *v72;
  unint64_t j;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  _BOOL4 v100;
  Class (*v101)(uint64_t);
  void *v102;
  void *v103;
  uint64_t v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  unint64_t k;
  unint64_t m;
  void *v110;
  void *v111;
  id v112;
  NSObject *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t n;
  uint64_t v118;
  NSObject *v119;
  __int128 v120;
  void *v121;
  _BOOL4 v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  NSObject *v146;
  uint64_t v147;
  id v148;
  __int128 v149;
  __int128 v150;
  id v151;
  id v152;
  id v153;
  Class (*v154)(uint64_t);
  _OWORD v155[3];
  uint8_t buf[8];
  uint64_t v157;
  Class (*v158)(uint64_t);
  void *v159;
  _BYTE *v160;
  uint8_t v161[128];
  uint8_t v162[16];
  _BYTE v163[24];
  uint64_t v164;
  uint64_t v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v122 = a4;
  v165 = *MEMORY[0x1E0C80C00];
  v132 = a3;
  AXLogAppAccessibility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, a1);

  AXLogAppAccessibility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B54A6000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AXUIMLElementDetection", (const char *)&unk_1B54F7127, buf, 2u);
  }

  if (_queue_createMLElements_postDelegateCallback__onceToken != -1)
    dispatch_once(&_queue_createMLElements_postDelegateCallback__onceToken, &__block_literal_global_238);
  objc_msgSend(a1, "proxiedMLElementsForApp:", v132);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (v131)
  {
    objc_msgSend((id)__displayManager, "coreAnimationMainDisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;

    objc_msgSend(v132, "stringWithAXAttribute:", 2008);
    v129 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v155[0] = 0;
    *((_QWORD *)&v155[0] + 1) = v155;
    *(_QWORD *)&v155[1] = 0x2050000000;
    v12 = (void *)getAXMVisionScreenRecognitionOptionsClass_softClass;
    *((_QWORD *)&v155[1] + 1) = getAXMVisionScreenRecognitionOptionsClass_softClass;
    if (!getAXMVisionScreenRecognitionOptionsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v157 = 3221225472;
      v158 = __getAXMVisionScreenRecognitionOptionsClass_block_invoke;
      v159 = &unk_1E69194D0;
      v160 = v155;
      __getAXMVisionScreenRecognitionOptionsClass_block_invoke((uint64_t)buf);
      v12 = *(void **)(*((_QWORD *)&v155[0] + 1) + 24);
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(v155, 8);
    objc_msgSend(v13, "defaultOptions");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setDetectAXElements:", 1);
    objc_msgSend(a1, "_textDetectionOptions:options:", v129, v133);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setTextDetectionOptions:", v14);

    objc_msgSend(v133, "setDetectText:", 0);
    objc_msgSend(v132, "stringWithAXAttribute:", 3003);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cachedMLElementsForID:", v130);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") == 0;

    if (v16)
    {
      v17 = (void *)EquivalenceToken;
      EquivalenceToken = 0;

    }
    objc_msgSend(v133, "setEquivalenceToken:", EquivalenceToken);
    objc_msgSend(v133, "setIsRTL:", objc_msgSend(v132, "BOOLWithAXAttribute:", 3066));
    objc_msgSend(v133, "setOrientation:", objc_msgSend(a1, "_interfaceOrientationForElement:", v132));
    memset(v155, 0, 40);
    objc_msgSend(a1, "_windowContextInformation:", v132);
    objc_msgSend(v133, "setFullRect:", *((double *)v155 + 1), v155[1], *(double *)&v155[2]);
    objc_msgSend(v133, "setIncludedLayerContextIDs:", *(_QWORD *)&v155[0]);
    objc_msgSend(v133, "setPreserveInputImageSize:", 1);
    objc_msgSend(v133, "setEquivalenceToken:", EquivalenceToken);
    AXMediaLogMLElement();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[AXUIMLElement _queue_createMLElements:postDelegateCallback:].cold.4();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v163 = 0;
    *(_QWORD *)&v163[8] = v163;
    *(_QWORD *)&v163[16] = 0x2050000000;
    v19 = (void *)getAXMScreenRecognitionCenterClass_softClass;
    v164 = getAXMScreenRecognitionCenterClass_softClass;
    if (!getAXMScreenRecognitionCenterClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v157 = 3221225472;
      v158 = __getAXMScreenRecognitionCenterClass_block_invoke;
      v159 = &unk_1E69194D0;
      v160 = v163;
      __getAXMScreenRecognitionCenterClass_block_invoke((uint64_t)buf);
      v19 = *(void **)(*(_QWORD *)&v163[8] + 24);
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(v163, 8);
    objc_msgSend(v20, "sharedInstance");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v157 = 0;
    v158 = 0;
    v124 = v21;
    if (v21)
    {
      objc_msgSend(v21, "processFeatures:", v133);
      v21 = *(id *)buf;
    }
    if (objc_msgSend(v21, "isEqual:", EquivalenceToken))
    {
      AXMediaLogMLElement();
      v22 = objc_claimAutoreleasedReturnValue();
      v123 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        +[AXUIMLElement _queue_createMLElements:postDelegateCallback:].cold.2(v22);
    }
    else
    {
      objc_storeStrong((id *)&EquivalenceToken, *(id *)buf);
      v25 = (void *)objc_msgSend((id)v157, "mutableCopy");
      if (!v25)
      {

LABEL_74:
        v24 = (void *)v129;
        goto LABEL_75;
      }
      v139[0] = MEMORY[0x1E0C809B0];
      v139[1] = 3254779904;
      v139[2] = __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_239;
      v139[3] = &unk_1E6918890;
      v147 = v11;
      v26 = *(id *)&v155[0];
      v149 = *(_OWORD *)((char *)v155 + 8);
      v150 = *(_OWORD *)((char *)&v155[1] + 8);
      v148 = v26;
      v151 = a1;
      v140 = v133;
      v27 = v128;
      v141 = v27;
      v28 = v126;
      v142 = v28;
      v29 = v125;
      v143 = v29;
      v144 = v131;
      v152 = *(id *)buf;
      v153 = (id)v157;
      v154 = v158;
      v30 = v127;
      v145 = v30;
      v146 = v25;
      v123 = v146;
      -[NSObject enumerateObjectsUsingBlock:](v146, "enumerateObjectsUsingBlock:", v139);
      WeakRetained = objc_loadWeakRetained(&__frameDelegate);
      objc_msgSend(WeakRetained, "mlElementDetectorReceivedFrames:labels:uiClasses:", v27, v28, v29);

      AXMediaLogMLElement();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v163 = 67109120;
        *(_DWORD *)&v163[4] = (_DWORD)v158;
        _os_log_impl(&dword_1B54A6000, v32, OS_LOG_TYPE_INFO, "Handling results for ML detection for gen: %d", v163, 8u);
      }

      AXLogAppAccessibility();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)v163 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B54A6000, v34, OS_SIGNPOST_INTERVAL_END, v5, "AXUIMLElementDetection", (const char *)&unk_1B54F7127, v163, 2u);
      }

      +[AXUIMLElement _cachedMLElementsForID:](AXUIMLElement, "_cachedMLElementsForID:", v130);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "mutableCopy");

      if (!v36)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!_queue_createMLElements_postDelegateCallback___backupMLElements)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)_queue_createMLElements_postDelegateCallback___backupMLElements;
        _queue_createMLElements_postDelegateCallback___backupMLElements = v37;

      }
      v121 = (void *)objc_msgSend(v36, "copy");
      v39 = 0;
      v40 = 1;
      *(_QWORD *)&v41 = 138412546;
      v120 = v41;
      while (v39 < objc_msgSend(v30, "count", v120))
      {
        for (i = 0; i < objc_msgSend(v36, "count"); ++i)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", i);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isProbablyEqual:", v43);

          if (v45)
          {
            AXMediaLogMLElement();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v36, "objectAtIndexedSubscript:", i);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v163 = v120;
              *(_QWORD *)&v163[4] = v106;
              *(_WORD *)&v163[12] = 2112;
              *(_QWORD *)&v163[14] = v107;
              _os_log_debug_impl(&dword_1B54A6000, v46, OS_LOG_TYPE_DEBUG, "Keeping this element because we matched \nExisting: %@ New: %@", v163, 0x16u);

            }
            objc_msgSend(v36, "objectAtIndexedSubscript:", i);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:atIndexedSubscript:", v47, v39);

            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "rotatedFrame");
            v50 = v49;
            v52 = v51;
            v54 = v53;
            v56 = v55;
            objc_msgSend(v43, "rotatedFrame");
            v168.origin.x = v57;
            v168.origin.y = v58;
            v168.size.width = v59;
            v168.size.height = v60;
            v166.origin.x = v50;
            v166.origin.y = v52;
            v166.size.width = v54;
            v166.size.height = v56;
            v61 = CGRectEqualToRect(v166, v168);

            objc_msgSend(v43, "rotatedFrame");
            v63 = v62;
            v65 = v64;
            v67 = v66;
            v69 = v68;
            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setRotatedFrame:", v63, v65, v67, v69);

            v71 = v158;
            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setMlGeneration:", v71);

            objc_msgSend(v36, "removeObjectAtIndex:", i);
            v40 &= v61;
            break;
          }

        }
        for (j = 0; j < objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "count"); ++j)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "objectAtIndexedSubscript:", j);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isProbablyEqual:", v74);

          if (v76)
          {
            objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "objectAtIndexedSubscript:", j);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:atIndexedSubscript:", v77, v39);

            objc_msgSend(v74, "rotatedFrame");
            v79 = v78;
            v81 = v80;
            v83 = v82;
            v85 = v84;
            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setRotatedFrame:", v79, v81, v83, v85);

            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "rotatedFrame");
            v89 = v88;
            v91 = v90;
            v93 = v92;
            v95 = v94;
            objc_msgSend(v74, "rotatedFrame");
            v169.origin.x = v96;
            v169.origin.y = v97;
            v169.size.width = v98;
            v169.size.height = v99;
            v167.origin.x = v89;
            v167.origin.y = v91;
            v167.size.width = v93;
            v167.size.height = v95;
            v100 = CGRectEqualToRect(v167, v169);

            v101 = v158;
            objc_msgSend(v30, "objectAtIndexedSubscript:", v39);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "setMlGeneration:", v101);

            objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "removeObjectAtIndex:", j);
            v40 &= v100;
          }
          else
          {
            objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "objectAtIndexedSubscript:", j);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = objc_msgSend(v103, "mlGeneration");
            v105 = v104 + 10 > (unint64_t)v158;

            if (v105)
              objc_msgSend((id)_queue_createMLElements_postDelegateCallback___backupMLElements, "removeObjectAtIndex:", j);
          }

        }
        ++v39;
      }
      for (k = 0; k < objc_msgSend(v36, "count"); ++k)
      {
        for (m = 0; m < objc_msgSend(v30, "count"); ++m)
        {
          v110 = (void *)_queue_createMLElements_postDelegateCallback___backupMLElements;
          objc_msgSend(v36, "objectAtIndexedSubscript:", k);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "addObject:", v111);

        }
      }
      if (((v40 & 1) == 0 || (objc_msgSend(v121, "isEqualToArray:", v30) & 1) == 0) && v122)
      {
        objc_msgSend(a1, "_setCachedMLElements:forID:", v30, v130);
        v112 = objc_loadWeakRetained(&__frameDelegate);
        objc_msgSend(v112, "mlElementDetectorUpdatedElements");

      }
      AXMediaLogMLElement();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        +[AXUIMLElement _queue_createMLElements:postDelegateCallback:].cold.3(objc_msgSend(v30, "count"), v162, v113);

      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      v114 = v30;
      v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
      if (v115)
      {
        v116 = *(_QWORD *)v136;
        do
        {
          for (n = 0; n != v115; ++n)
          {
            if (*(_QWORD *)v136 != v116)
              objc_enumerationMutation(v114);
            v118 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * n);
            AXMediaLogMLElement();
            v119 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v163 = 138412290;
              *(_QWORD *)&v163[4] = v118;
              _os_log_debug_impl(&dword_1B54A6000, v119, OS_LOG_TYPE_DEBUG, "\tAdded element: %@", v163, 0xCu);
            }

          }
          v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
        }
        while (v115);
      }

    }
    goto LABEL_74;
  }
  AXMediaLogMLElement();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    +[AXUIMLElement _queue_createMLElements:postDelegateCallback:].cold.1();
    v24 = v23;
  }
LABEL_75:

}

void __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t);
  void *v19;
  dispatch_semaphore_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v0 = dispatch_semaphore_create(0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v1 = (void *)getAXMDisplayManagerClass_softClass;
  v25 = getAXMDisplayManagerClass_softClass;
  v2 = MEMORY[0x1E0C809B0];
  if (!getAXMDisplayManagerClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getAXMDisplayManagerClass_block_invoke;
    v21[3] = &unk_1E69194D0;
    v21[4] = &v22;
    __getAXMDisplayManagerClass_block_invoke((uint64_t)v21);
    v1 = (void *)v23[3];
  }
  v3 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v22, 8);
  v4 = [v3 alloc];
  v16 = v2;
  v17 = 3221225472;
  v18 = __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_2;
  v19 = &unk_1E6919A38;
  v20 = v0;
  v5 = v0;
  v6 = objc_msgSend(v4, "initWithCompletion:", &v16);
  v7 = (void *)__displayManager;
  __displayManager = v6;

  v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v8);
  objc_msgSend((id)__displayManager, "coreAnimationMainDisplay", v16, v17, v18, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  ScaledScreenSize_0 = v10;
  ScaledScreenSize_1 = v11;

  objc_msgSend((id)__displayManager, "coreAnimationMainDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  *(double *)&ScaledScreenSize_0 = *(double *)&ScaledScreenSize_0 / v13;

  objc_msgSend((id)__displayManager, "coreAnimationMainDisplay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  *(double *)&ScaledScreenSize_1 = *(double *)&ScaledScreenSize_1 / v15;

}

intptr_t __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__AXUIMLElement__queue_createMLElements_postDelegateCallback___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  AXUIMLElement *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSRect v51;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "activationPoint");
  v43 = v13;
  v44 = v12;
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8) == v13 && *MEMORY[0x1E0C9D538] == v12;
  v15 = 1.0 / *(double *)(a1 + 88);
  v16 = v5 * v15;
  v17 = v9 * v15;
  v18 = v11 * v15;
  v39 = *(double *)(a1 + 112);
  v41 = *(double *)(a1 + 104);
  v19 = v41 + v16;
  v20 = v7 * v15 + v39;
  v45 = v17;
  objc_msgSend(*(id *)(a1 + 136), "_convertFrameToPortraitUp:fromOrientation:appFrame:", objc_msgSend(*(id *)(a1 + 32), "orientation", *(_QWORD *)&v39, *(_QWORD *)&v41), v41 + v16, v20, v17, v18, v41, v39, *(double *)(a1 + 120), *(double *)(a1 + 128));
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v25 = *(void **)(a1 + 40);
  NSStringFromRect(v51);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v26);

  objc_msgSend(v3, "overrideLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    objc_msgSend(v3, "value");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  if (v30)
    v31 = v30;
  else
    v31 = &stru_1E691BCF0;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);
  v32 = *(void **)(a1 + 56);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v33 = (void *)getAXMVisionFeatureClass_softClass;
  v50 = getAXMVisionFeatureClass_softClass;
  if (!getAXMVisionFeatureClass_softClass)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __getAXMVisionFeatureClass_block_invoke;
    v46[3] = &unk_1E69194D0;
    v46[4] = &v47;
    __getAXMVisionFeatureClass_block_invoke((uint64_t)v46);
    v33 = (void *)v48[3];
  }
  v34 = objc_retainAutorelease(v33);
  _Block_object_dispose(&v47, 8);
  objc_msgSend(v34, "nameForUIClass:", objc_msgSend(v3, "uiClass"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v35);

  v36 = -[AXUIMLElement initWithParentElement:]([AXUIMLElement alloc], "initWithParentElement:", objc_msgSend(*(id *)(a1 + 64), "axElement"));
  objc_msgSend(v3, "overrideLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[AXUIMLElement setLabel:](v36, "setLabel:", v37);
  }
  else
  {
    objc_msgSend(v3, "value");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIMLElement setLabel:](v36, "setLabel:", v38);

  }
  -[AXUIMLElement setPortraitUpFrame:](v36, "setPortraitUpFrame:", x, y, width, height);
  -[AXUIMLElement setRotatedFrame:](v36, "setRotatedFrame:", v19, v20, v45, v18);
  if (!v14)
    -[AXUIMLElement setRotatedCenterPoint:](v36, "setRotatedCenterPoint:", v42 + v44 * v15, v43 * v15 + v40);
  -[AXUIMLElement setMlGeneration:](v36, "setMlGeneration:", *(_QWORD *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 136), "_applyAXTraitsForElement:uiClass:", v36, objc_msgSend(v3, "uiClass"));
  if (v36)
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v36);
  -[AXUIMLElement _applyCustomActionsForFeature:screenScale:screenRect:elements:](v36, "_applyCustomActionsForFeature:screenScale:screenRect:elements:", v3, *(_QWORD *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));

}

- (void)_applyCustomActionsForFeature:(id)a3 screenScale:(double)a4 screenRect:(CGRect)a5 elements:(id)a6
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "subfeatures", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v7, "uiClass");
        if ((unint64_t)(objc_msgSend(v14, "uiClass") - 15) <= 2)
        {
          if ((unint64_t)(v15 - 15) > 2)
          {
            if (objc_msgSend(v7, "uiClass") == 18)
              continue;
LABEL_12:
            objc_msgSend(v8, "addObject:", v14);
            continue;
          }
          objc_msgSend(v7, "subfeatures");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v16, "count") <= 1)
          {

          }
          else
          {
            v17 = objc_msgSend(v7, "uiClass");

            if (v17 != 18)
              goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)copyAttributeValue:(int64_t)a3
{
  return 0;
}

- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4
{
  return -[AXUIMLElement copyAttributeValue:parameter:baseElement:](self, "copyAttributeValue:parameter:baseElement:", a3, a4, self);
}

- (void)copyAttributeValue:(int64_t)a3 parameter:(void *)a4 baseElement:(id)a5
{
  AXUIMLElement *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  AXUIMLElement *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = (AXUIMLElement *)a5;
  if (a3 == 94500)
  {
    -[AXUIMLElement _currentMLElements](self, "_currentMLElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15++), "axElement", (_QWORD)v20));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

  }
  else if ((unint64_t)(a3 - 92501) > 1 || -[AXUIMLElement _isTopLevelMLElement](self, "_isTopLevelMLElement"))
  {
    v10 = 0;
  }
  else
  {
    -[AXUIMLElement _topLevelMLElement](self, "_topLevelMLElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v8)
      v18 = v8;
    else
      v18 = self;
    v10 = (void *)objc_msgSend(v16, "copyAttributeValue:parameter:baseElement:", a3, a4, v18);

  }
  return v10;
}

- (id)_reconcileAppElementsWithMLElements:(id)a3 flattenedElements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[AXUIMLElement _findMatchingElementForMLElement:flattenedAppElements:](self, "_findMatchingElementForMLElement:flattenedAppElements:", v13, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v8, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;

          objc_msgSend(v18, "addObject:", v13);
          objc_msgSend(v8, "setObject:forKey:", v18, v14);

        }
        else if (-[AXUIMLElement _shouldPromoteElement:](self, "_shouldPromoteElement:", v13))
        {
          objc_msgSend(v28, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[AXUIMLElement _shouldDemoteElement:withMLElements:](self, "_shouldDemoteElement:withMLElements:", v24, v25))
        {
          objc_msgSend(v28, "addObjectsFromArray:", v25);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  return v28;
}

- (BOOL)_shouldPromoteElement:(id)a3
{
  return 1;
}

- (BOOL)_shouldDemoteElement:(id)a3 withMLElements:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  BOOL v27;

  v6 = a3;
  if (objc_msgSend(a4, "count"))
  {
    -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rectWithAXAttribute:", 2003);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_opt_class();
    objc_msgSend(v7, "numberWithAXAttribute:", 2021);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_appRelativeRectForRect:contextId:", objc_msgSend(v17, "unsignedIntValue"), v9, v11, v13, v15);
    v19 = v18;
    v21 = v20;

    objc_msgSend(v6, "rectWithAXAttribute:", 2003);
    v24 = v19 < 10.0 || v21 < 10.0;
    v27 = !v24
       && (v25 = v22, v26 = v23, (objc_msgSend(v6, "BOOLWithAXAttribute:", 2065) & 1) == 0)
       && v25 * v26 / v19 / v21 > 0.9;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_flattenedAppElements
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL *p_isReconciling;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getAXSettingsClass_softClass;
  v21 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getAXSettingsClass_block_invoke;
    v17[3] = &unk_1E69194D0;
    v17[4] = &v18;
    __getAXSettingsClass_block_invoke((uint64_t)v17);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "automaticAccessibilityIgnoreAppAccessibilityPreferred");

  if ((v6 & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  -[AXUIMLElement uiElementsWithAttribute:](self, "uiElementsWithAttribute:", 2017);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uiElementsWithAttribute:", 3000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    p_isReconciling = &self->_isReconciling;
    self->_isReconciling = 1;
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextElementsWithCount:", 9999);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "ax_filteredArrayUsingBlock:", &__block_literal_global_245);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    *p_isReconciling = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

BOOL __38__AXUIMLElement__flattenedAppElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_findMatchingElementForMLElement:(id)a3 flattenedAppElements:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat MidX;
  _QWORD rect[5];
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  memset(&rect[1], 0, 32);
  v29 = 0u;
  v30 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &rect[1], v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)rect[3];
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)rect[3] != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(rect[2] + 8 * (_QWORD)i);
        objc_msgSend(v5, "rotatedFrame");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v10, "rectWithAXAttribute:", 2003);
        rect[0] = v19;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v34.origin.x = v12;
        v34.origin.y = v14;
        v34.size.width = v16;
        v34.size.height = v18;
        MidX = CGRectGetMidX(v34);
        v35.origin.x = v12;
        v35.origin.y = v14;
        v35.size.width = v16;
        v35.size.height = v18;
        v33.y = CGRectGetMidY(v35);
        *(_QWORD *)&v36.origin.x = rect[0];
        v36.origin.y = v21;
        v36.size.width = v23;
        v36.size.height = v25;
        v33.x = MidX;
        if (CGRectContainsPoint(v36, v33))
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &rect[1], v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (__AXUIElement)copyElementAtPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double MidX;
  CGFloat MidY;
  double v17;
  id v18;
  NSObject *v19;
  __AXUIElement *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  -[AXUIMLElement _currentMLElements](self, "_currentMLElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "portraitUpFrame", (_QWORD)v25);
        v35.x = x;
        v35.y = y;
        if (CGRectContainsPoint(v36, v35))
        {
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v14, "portraitUpFrame");
          MidX = CGRectGetMidX(v37);
          objc_msgSend(v14, "portraitUpFrame");
          MidY = CGRectGetMidY(v38);
          v17 = sqrt((MidX - x) * (MidX - x) + (MidY - y) * (MidY - y));
          if (v17 < v12)
          {
            v18 = v14;

            v10 = v18;
            v12 = v17;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v12 = 1.79769313e308;
  }

  if (objc_msgSend((id)objc_opt_class(), "performFuzzyHitTestNextTime")
    && !objc_msgSend(v6, "count")
    && v10)
  {
    AXMediaLogElementVision();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v30 = v12;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1B54A6000, v19, OS_LOG_TYPE_DEFAULT, "Logging fuzzy match: %f, %@", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(), "setPerformFuzzyHitTestNextTime:", 0);
    v20 = (__AXUIElement *)CFRetain((CFTypeRef)objc_msgSend(v10, "axElement"));
  }
  else
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_247, (_QWORD)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v20 = (__AXUIElement *)CFRetain((CFTypeRef)objc_msgSend(v22, "axElement"));
    else
      v20 = 0;

  }
  return v20;
}

uint64_t __39__AXUIMLElement_copyElementAtPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "frame");
  v49 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v21 = getAXMIntersectionOverUnionSymbolLoc_ptr;
  v54 = getAXMIntersectionOverUnionSymbolLoc_ptr;
  if (!getAXMIntersectionOverUnionSymbolLoc_ptr)
  {
    v22 = (void *)AXMediaUtilitiesLibrary();
    v21 = dlsym(v22, "AXMIntersectionOverUnion");
    v52[3] = (uint64_t)v21;
    getAXMIntersectionOverUnionSymbolLoc_ptr = v21;
  }
  _Block_object_dispose(&v51, 8);
  if (!v21)
    __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_1();
  if (((double (*)(double, double, double, double, double, double, double, double))v21)(v49, v8, v10, v12, v14, v16, v18, v20) <= 0.5)
  {
    objc_msgSend(v4, "frame");
    v50 = v23;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v5, "frame");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v38 = getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr;
    v54 = getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr;
    if (!getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr)
    {
      v39 = (void *)AXMediaUtilitiesLibrary();
      v38 = dlsym(v39, "AXMRatioOfIntersectedAreaToSmallerRectArea");
      v52[3] = (uint64_t)v38;
      getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr = v38;
    }
    _Block_object_dispose(&v51, 8);
    if (!v38)
      __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_2();
    if (((double (*)(double, double, double, double, double, double, double, double))v38)(v50, v25, v27, v29, v31, v33, v35, v37) <= 0.5)goto LABEL_14;
  }
  objc_msgSend(v4, "frame");
  v41 = v40;
  objc_msgSend(v4, "frame");
  v43 = v41 * v42;
  objc_msgSend(v5, "frame");
  v45 = v44;
  objc_msgSend(v5, "frame");
  v47 = v43 >= v45 * v46 ? 1 : -1;
  if (v43 >= v45 * v46 && v43 <= v45 * v46)
LABEL_14:
    v47 = 0;

  return v47;
}

+ (id)elementsInDirection:(int64_t)a3 withElement:(id)a4 nextElements:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v7 = a4;
  v8 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "isMLElement"))
  {
    if ((objc_msgSend(v7, "_isTopLevelMLElement") & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "topLevelMLElement");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v9;
    if (v9)
    {
LABEL_10:
      objc_msgSend(v13, "_reconciledElements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "indexOfObject:", v7);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3 == 92501)
        {
          objc_msgSend(v13, "_currentMLElements");
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v19 = (void *)v17;
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v17);
          v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_21:
          goto LABEL_22;
        }
      }
      else
      {
        v18 = v16;
        if (a3 == 92501)
        {
          if (v16 + 1 < (unint64_t)objc_msgSend(v15, "count"))
          {
            objc_msgSend(v15, "subarrayWithRange:", v18 + 1, objc_msgSend(v15, "count") + ~v18);
            v17 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        else if (v16)
        {
          objc_msgSend(v15, "subarrayWithRange:", 0, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "reverseObjectEnumerator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "allObjects");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
      }
      v14 = v8;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(v7, "uiElementsWithAttribute:", 2017);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "uiElementsWithAttribute:", 3051);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_10;
  }
  v14 = v8;
LABEL_22:

  return v14;
}

- (BOOL)isMLElement
{
  return 1;
}

- (BOOL)_simulateScrollAction:(int)a3 withScreenDistanceFactor:(double)a4 forVisibleAction:(BOOL)a5
{
  unsigned int v8;
  _BOOL4 v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  void *v32;
  id v33;
  _QWORD v35[5];
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  CGRect v43;
  CGRect v44;

  v8 = a3 & 0xFFFFFFFE;
  v10 = a3 == 2006 || a3 == 2009;
  -[AXUIMLElement rotatedFrame](self, "rotatedFrame");
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MidY = CGRectGetMidY(v44);
  v17 = ScaledScreenSize_1;
  if (v8 != 2006)
    v17 = ScaledScreenSize_0;
  v18 = *(double *)&v17 * a4;
  v19 = -(*(double *)&v17 * a4);
  if (v10)
  {
    v20 = *(double *)&ScaledScreenSize_0;
  }
  else
  {
    v19 = v18;
    v20 = 0.0;
  }
  if (v8 == 2006)
    v21 = 0.0;
  else
    v21 = v19;
  if (v8 == 2006)
    v22 = v19;
  else
    v22 = 0.0;
  v23 = (void *)objc_opt_class();
  -[AXUIMLElement _topLevelAppElement](self, "_topLevelAppElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "_interfaceOrientationForElement:", v24);

  v26 = (unint64_t)(v25 - 1) >= 2 || v8 == 2006;
  v27 = MidX + v21;
  v28 = MidY + v22;
  if (v26)
    v29 = v27;
  else
    v29 = v20;
  v30 = (id)EquivalenceToken;
  v31 = fabs(sqrt((v28 - MidY) * (v28 - MidY) + (v29 - MidX) * (v29 - MidX)));
  if (v31 >= 40.0)
  {
    -[AXUIMLElement _appElement](self, "_appElement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke;
    v35[3] = &unk_1E6919D38;
    v38 = MidX;
    v39 = MidY;
    v40 = v29;
    v41 = v28;
    v35[4] = self;
    v36 = v32;
    v42 = a5;
    v37 = v30;
    v33 = v32;
    dispatch_async(MEMORY[0x1E0C80D38], v35);

  }
  return v31 >= 40.0;
}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getAXNamedReplayableGestureClass_softClass;
  v17 = getAXNamedReplayableGestureClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getAXNamedReplayableGestureClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getAXNamedReplayableGestureClass_block_invoke;
    v13[3] = &unk_1E69194D0;
    v13[4] = &v14;
    __getAXNamedReplayableGestureClass_block_invoke((uint64_t)v13);
    v2 = (void *)v15[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v4, "scrollGestureFromPoint:toPoint:duration:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), 0.2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXUIMLElement sharedFingerController](AXUIMLElement, "sharedFingerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSenderID:", 0x8000000817319375);

  +[AXUIMLElement sharedFingerController](AXUIMLElement, "sharedFingerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_2;
  v9[3] = &unk_1E6919D10;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  v12 = *(_BYTE *)(a1 + 88);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "performGesture:completion:", v5, v9);

}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_3;
  v3[3] = &unk_1E6919CE8;
  v5 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_forceMLElementRefresh:postDelegateCallback:completionBlock:", v2, 1, v3);

}

void __81__AXUIMLElement__simulateScrollAction_withScreenDistanceFactor_forVisibleAction___block_invoke_3(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend((id)EquivalenceToken, "isEqualToData:", *(_QWORD *)(a1 + 32)))
    {
      AXPushNotificationToSystemForBroadcast();
    }
    else
    {
      +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", CFSTR(" "));
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setAttribute:forKey:", *MEMORY[0x1E0C9AE50], kAXPageScrollShouldSpeakElement[0]);
      AXPushNotificationToSystemForBroadcast();

    }
  }
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CGRect)portraitUpFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_portraitUpFrame.origin.x;
  y = self->_portraitUpFrame.origin.y;
  width = self->_portraitUpFrame.size.width;
  height = self->_portraitUpFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPortraitUpFrame:(CGRect)a3
{
  self->_portraitUpFrame = a3;
}

- (CGRect)rotatedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rotatedFrame.origin.x;
  y = self->_rotatedFrame.origin.y;
  width = self->_rotatedFrame.size.width;
  height = self->_rotatedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRotatedFrame:(CGRect)a3
{
  self->_rotatedFrame = a3;
}

- (CGPoint)rotatedCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_rotatedCenterPoint.x;
  y = self->_rotatedCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRotatedCenterPoint:(CGPoint)a3
{
  self->_rotatedCenterPoint = a3;
}

- (CGRect)screenFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_screenFrame.origin.x;
  y = self->_screenFrame.origin.y;
  width = self->_screenFrame.size.width;
  height = self->_screenFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScreenFrame:(CGRect)a3
{
  self->_screenFrame = a3;
}

- (unint64_t)mlGeneration
{
  return self->_mlGeneration;
}

- (void)setMlGeneration:(unint64_t)a3
{
  self->_mlGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_hostingParent, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

- (void)initWithParentElement:.cold.1()
{
  __assert_rtn("-[AXUIMLElement initWithParentElement:]", "AXUIMLElement.m", 147, "axElement != nil");
}

+ (void)setAutoRefresh:forApp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B54A6000, v0, v1, "No bundle id for %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)_textDetectionOptions:(void *)a1 options:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textDetectionOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B54A6000, a2, v4, "would expect textDetectionOptions to return locale list: %@", v5);

}

+ (void)_queue_createMLElements:postDelegateCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B54A6000, v0, v1, "Couldn't find toplevel ml element for %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)_queue_createMLElements:(os_log_t)log postDelegateCallback:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B54A6000, log, OS_LOG_TYPE_DEBUG, "Equivalence token is the same", v1, 2u);
}

+ (void)_queue_createMLElements:(os_log_t)log postDelegateCallback:.cold.3(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl(&dword_1B54A6000, log, OS_LOG_TYPE_DEBUG, "Finished ML elements creation: %d", buf, 8u);
}

+ (void)_queue_createMLElements:postDelegateCallback:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1B54A6000, v0, OS_LOG_TYPE_DEBUG, "CurrentMLElements for element: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat soft_AXMIntersectionOverUnion(CGRect, CGRect)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 31, CFSTR("%s"), dlerror());

  __break(1u);
}

void __39__AXUIMLElement_copyElementAtPosition___block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat soft_AXMRatioOfIntersectedAreaToSmallerRectArea(CGRect, CGRect)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 32, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
