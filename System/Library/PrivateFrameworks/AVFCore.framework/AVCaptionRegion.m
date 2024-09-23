@implementation AVCaptionRegion

- (AVCaptionRegion)init
{
  if (!FigCaptionRegionCreateMutable())
    return -[AVCaptionRegion initWithFigCaptionRegion:](self, "initWithFigCaptionRegion:", 0);

  return 0;
}

- (AVCaptionRegion)initWithFigCaptionRegion:(OpaqueFigCaptionRegion *)a3
{
  AVCaptionRegion *v4;
  AVCaptionRegionInternal *v5;
  AVCaptionRegion *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  if (!a3)
  {
    v9 = self;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"figCaptionRegion != NULL"), 0);
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVCaptionRegion;
  v4 = -[AVCaptionRegion init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptionRegionInternal);
    v4->_internal = v5;
    if (v5)
    {
      v4->_internal->figCaptionRegion = (OpaqueFigCaptionRegion *)CFRetain(a3);
      v4->_internal->position = 0;
      v4->_internal->endPosition = 0;
      v4->_internal->_overridePositionShouldBeNil = 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVCaptionRegion)initWithIdentifier:(id)a3
{
  objc_class *v3;
  uint64_t CMBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, id);
  uint64_t v7;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD);
  AVCaptionRegion *v9;
  AVCaptionPosition *v10;
  double v11;
  double v12;
  AVCaptionPosition *v13;
  double v14;
  double v15;
  AVCaptionPosition *v16;
  uint64_t v17;
  uint64_t v18;
  AVCaptionPosition *v19;
  double v20;
  double v21;
  AVCaptionPosition *v22;
  double v23;
  double v24;
  AVCaptionPosition *v25;
  double v26;
  double v27;
  AVCaptionPosition *v28;
  double v29;
  double v30;
  AVCaptionPosition *v31;
  double v32;
  double v33;
  AVCaptionRegion *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  v3 = (objc_class *)self;
  if (!a3)
  {
    v36 = self;
    v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(v3, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v37, v38, v39, v40, v41, (uint64_t)"identifier != NULL"), 0);
    objc_exception_throw(v42);
  }
  if (FigCaptionRegionCreateMutable())
  {

    v3 = 0;
  }
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v6 = *(unsigned int (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v6 || v6(CMBaseObject, *MEMORY[0x1E0CA3438], a3))
  {

    v3 = 0;
  }
  v7 = FigCaptionRegionGetCMBaseObject();
  v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v8 || v8(v7, *MEMORY[0x1E0CA3418], *MEMORY[0x1E0C9AE50]))
  {

    v3 = 0;
  }
  v9 = -[objc_class initWithFigCaptionRegion:](v3, "initWithFigCaptionRegion:", 0);
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CA3458]))
  {
    v10 = [AVCaptionPosition alloc];
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    -[AVCaptionRegion _setPosition:](v9, "_setPosition:", -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v10, "initWithRelativeToEnclosingRegionX:andY:", v11, v12));
    v13 = [AVCaptionPosition alloc];
    LODWORD(v14) = 1041865114;
    LODWORD(v15) = 1.0;
    v16 = -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v13, "initWithRelativeToEnclosingRegionX:andY:", v15, v14);
    v17 = 0;
    v18 = 0;
LABEL_19:
    -[AVCaptionRegion _setEndPosition:](v9, "_setEndPosition:", v16);
    -[AVCaptionRegion _setDisplayAlignment:](v9, "_setDisplayAlignment:", v17);
    -[AVCaptionRegion _setWritingMode:](v9, "_setWritingMode:", v18);
    -[AVCaptionRegion _setScroll:](v9, "_setScroll:", 1);
    return v9;
  }
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CA3440]))
  {
    v19 = [AVCaptionPosition alloc];
    LODWORD(v20) = 1062836634;
    LODWORD(v21) = 0;
    -[AVCaptionRegion _setPosition:](v9, "_setPosition:", -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v19, "initWithRelativeToEnclosingRegionX:andY:", v21, v20));
    v22 = [AVCaptionPosition alloc];
    LODWORD(v23) = 1.0;
    LODWORD(v24) = 1.0;
    v16 = -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v22, "initWithRelativeToEnclosingRegionX:andY:", v23, v24);
    v18 = 0;
    v17 = 2;
    goto LABEL_19;
  }
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CA3448]))
  {
    v25 = [AVCaptionPosition alloc];
    LODWORD(v26) = 0;
    LODWORD(v27) = 0;
    -[AVCaptionRegion _setPosition:](v9, "_setPosition:", -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v25, "initWithRelativeToEnclosingRegionX:andY:", v26, v27));
    v28 = [AVCaptionPosition alloc];
    LODWORD(v30) = 1041865114;
LABEL_18:
    LODWORD(v29) = 1.0;
    v16 = -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v28, "initWithRelativeToEnclosingRegionX:andY:", v30, v29);
    v17 = 0;
    v18 = 2;
    goto LABEL_19;
  }
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0CA3450]))
  {
    v31 = [AVCaptionPosition alloc];
    LODWORD(v32) = 1062836634;
    LODWORD(v33) = 0;
    -[AVCaptionRegion _setPosition:](v9, "_setPosition:", -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v31, "initWithRelativeToEnclosingRegionX:andY:", v32, v33));
    v28 = [AVCaptionPosition alloc];
    LODWORD(v30) = 1.0;
    goto LABEL_18;
  }
  return v9;
}

- (AVCaptionRegion)initWithCoder:(id)a3
{
  uint64_t v5;
  AVCaptionRegion *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionRegionArchiveKeyIdentifier"));
  if (v5)
    return -[AVCaptionRegion initWithIdentifier:](self, "initWithIdentifier:", v5);
  if (FigCaptionRegionCreateMutable())
  {

    return 0;
  }
  else
  {
    v6 = -[AVCaptionRegion initWithFigCaptionRegion:](self, "initWithFigCaptionRegion:", 0);
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionRegionArchiveKeyPosition"));
    if (v7)
      -[AVCaptionRegion _setPosition:](v6, "_setPosition:", v7);
    v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionRegionArchiveKeyEndPosition"));
    if (v8)
      -[AVCaptionRegion _setEndPosition:](v6, "_setEndPosition:", v8);
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionRegionArchiveKeyHeight"));
    if (v9)
      -[AVCaptionRegion _setHeight:](v6, "_setHeight:", v9);
    -[AVCaptionRegion _setScroll:](v6, "_setScroll:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionRegionArchiveKeyScroll")));
    -[AVCaptionRegion _setDisplayAlignment:](v6, "_setDisplayAlignment:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionRegionArchiveKeyDisplayAlignment")));
    -[AVCaptionRegion _setWritingMode:](v6, "_setWritingMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionRegionArchiveKeyWritingMode")));
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  id v7;
  AVCaptionLength *v8;
  CFTypeRef cf;

  cf = 0;
  -[AVCaptionRegion _figCaptionRegion](self, "_figCaptionRegion");
  -[NSCoder encodeInteger:forKey:](encoder, "encodeInteger:forKey:", 2, CFSTR("AVCaptionRegionArchiveKeyVersion"));
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v6 && (v6(CMBaseObject, *MEMORY[0x1E0CA3438], *MEMORY[0x1E0C9AE00], &cf), cf))
  {
    -[NSCoder encodeObject:forKey:](encoder, "encodeObject:forKey:", cf, CFSTR("AVCaptionRegionArchiveKeyIdentifier"));
  }
  else
  {
    v7 = -[AVCaptionRegion _position](self, "_position");
    if (v7)
      -[NSCoder encodeObject:forKey:](encoder, "encodeObject:forKey:", v7, CFSTR("AVCaptionRegionArchiveKeyPosition"));
    v8 = -[AVCaptionRegion height](self, "height");
    if (v8)
      -[NSCoder encodeObject:forKey:](encoder, "encodeObject:forKey:", v8, CFSTR("AVCaptionRegionArchiveKeyHeight"));
    -[NSCoder encodeInteger:forKey:](encoder, "encodeInteger:forKey:", -[AVCaptionRegion scroll](self, "scroll"), CFSTR("AVCaptionRegionArchiveKeyScroll"));
    -[NSCoder encodeInteger:forKey:](encoder, "encodeInteger:forKey:", -[AVCaptionRegion displayAlignment](self, "displayAlignment"), CFSTR("AVCaptionRegionArchiveKeyDisplayAlignment"));
    -[NSCoder encodeInteger:forKey:](encoder, "encodeInteger:forKey:", -[AVCaptionRegion writingMode](self, "writingMode"), CFSTR("AVCaptionRegionArchiveKeyWritingMode"));
  }
  if (cf)
    CFRelease(cf);
}

- (void)dealloc
{
  AVCaptionRegionInternal *internal;
  OpaqueFigCaptionRegion *figCaptionRegion;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    figCaptionRegion = internal->figCaptionRegion;
    if (figCaptionRegion)
    {
      CFRelease(figCaptionRegion);
      internal = self->_internal;
    }

    internal = self->_internal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCaptionRegion;
  -[AVCaptionRegion dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)object
{
  if (self == object)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[AVCaptionRegion _figCaptionRegion](self, "_figCaptionRegion");
  objc_msgSend(object, "_figCaptionRegion");
  return FigCFEqual() != 0;
}

- (unint64_t)hash
{
  return 0;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
  uint64_t v5;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVMutableCaptionRegion *v13;
  AVMutableCaptionRegion *v14;
  void *v16;
  CFTypeRef cf;
  CFTypeRef v18;

  cf = 0;
  v18 = 0;
  v5 = *MEMORY[0x1E0C9AE00];
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v7)
  {
    v7(CMBaseObject, *MEMORY[0x1E0CA3438], v5, &cf);
    if (cf)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Regions with identifier don't support mutable copy operation"), v8, v9, v10, v11, v12, (uint64_t)cf), 0);
      objc_exception_throw(v16);
    }
  }
  if (FigCaptionRegionCreateMutableCopy())
  {
    v14 = 0;
  }
  else
  {
    v13 = [AVMutableCaptionRegion alloc];
    v14 = -[AVMutableCaptionRegion initWithFigMutableCaptionRegion:](v13, "initWithFigMutableCaptionRegion:", v18);
  }
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);
  return v14;
}

- (NSString)identifier
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, void **);
  void *v4;
  void *v6;

  v6 = 0;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v3(CMBaseObject, *MEMORY[0x1E0CA3438], *MEMORY[0x1E0C9AE00], &v6);
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)_setPredefinedRegionPositionShouldBeNil:(BOOL)a3
{
  self->_internal->_overridePositionShouldBeNil = a3;
}

- (BOOL)_predefinedRegionPositionShouldBeNil
{
  NSString *v2;

  if (!self->_internal->_overridePositionShouldBeNil)
    return 0;
  v2 = -[AVCaptionRegion identifier](self, "identifier");
  if ((-[NSString isEqual:](v2, "isEqual:", *MEMORY[0x1E0CA3458]) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", *MEMORY[0x1E0CA3440]) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", *MEMORY[0x1E0CA3448]) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", *MEMORY[0x1E0CA3450]) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[NSString isEqual:](v2, "isEqual:", *MEMORY[0x1E0CA3460]);
  }
}

- (id)_position
{
  AVCaptionPosition *position;
  AVCaptionPosition *v3;
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  BOOL v8;
  CFTypeRef cf;

  cf = 0;
  position = self->_internal->position;
  if (position)
  {
    v3 = position;
  }
  else
  {
    CMBaseObject = FigCaptionRegionGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v6 = v5(CMBaseObject, *MEMORY[0x1E0CA3490], *MEMORY[0x1E0C9AE00], &cf);
      v7 = cf;
      if (v6)
        v8 = 1;
      else
        v8 = cf == 0;
      if (v8)
      {
        v3 = 0;
        if (!cf)
          return v3;
        goto LABEL_11;
      }
      FigCaptionDynamicStyleGetInitialValue();
      FigGeometryPointMakeFromDictionary();
    }
    v3 = 0;
  }
  v7 = cf;
  if (cf)
LABEL_11:
    CFRelease(v7);
  return v3;
}

- (AVCaptionPosition)position
{
  if (-[AVCaptionRegion _predefinedRegionPositionShouldBeNil](self, "_predefinedRegionPositionShouldBeNil"))
    return 0;
  else
    return (AVCaptionPosition *)-[AVCaptionRegion _position](self, "_position");
}

- (id)_endPosition
{
  AVCaptionPosition *endPosition;
  AVCaptionPosition *v3;
  AVCaptionPosition *v4;
  uint64_t CMBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  int v13;
  CFTypeRef v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  double v26;
  double v27;
  id v28;
  AVCaptionPosition *v30;
  float v31;
  float v32;
  float v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  CFTypeRef cf;
  CFTypeRef v41;

  cf = 0;
  v41 = 0;
  endPosition = self->_internal->endPosition;
  if (endPosition)
  {
    v3 = endPosition;
LABEL_3:
    v4 = v3;
    goto LABEL_19;
  }
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v8
    || ((v9 = *MEMORY[0x1E0C9AE00], !v8(CMBaseObject, *MEMORY[0x1E0CA34B0], *MEMORY[0x1E0C9AE00], &v41))
      ? (v10 = v41 == 0)
      : (v10 = 1),
        v10
     || (v11 = FigCaptionRegionGetCMBaseObject(),
         (v12 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48)) == 0)))
  {
    v4 = 0;
LABEL_19:
    v14 = cf;
    if (!cf)
      goto LABEL_21;
    goto LABEL_20;
  }
  v13 = v12(v11, *MEMORY[0x1E0CA3428], v9, &cf);
  v14 = cf;
  if (v13)
    v15 = 1;
  else
    v15 = cf == 0;
  if (!v15)
  {
    FigCaptionDynamicStyleGetInitialValue();
    v16 = FigGeometryDimensionMakeFromDictionary();
    v18 = v17;
    FigCaptionDynamicStyleGetInitialValue();
    v19 = FigGeometryDimensionMakeFromDictionary();
    if (v18 == v25)
    {
      v26 = *(double *)&v16;
      v27 = *(double *)&v19;
      v28 = -[AVCaptionRegion _position](self, "_position");
      if (v18 == 622862368)
      {
        v30 = [AVCaptionPosition alloc];
        objc_msgSend(v28, "relativeToEnclosingRegionX");
        v32 = v26 / 100.0 + v31;
        objc_msgSend(v28, "relativeToEnclosingRegionY");
        v34 = v27 / 100.0;
        v35 = v27 / 100.0 + v33;
        *(float *)&v34 = v35;
        *(float *)&v35 = v32;
        v3 = -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](v30, "initWithRelativeToEnclosingRegionX:andY:", v35, v34);
        goto LABEL_3;
      }
      if (v18 == 1667591276)
      {
        v3 = -[AVCaptionPosition initWithCellPositionX:andY:]([AVCaptionPosition alloc], "initWithCellPositionX:andY:", objc_msgSend(v28, "cellX") + (uint64_t)v26, objc_msgSend(v28, "cellY") + (uint64_t)v27);
        goto LABEL_3;
      }
      v36 = (void *)MEMORY[0x1E0C99DA0];
      v37 = *MEMORY[0x1E0C99768];
      v38 = CFSTR("endPosition uses an unrecognizable unit.");
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0C99DA0];
      v37 = *MEMORY[0x1E0C99768];
      v38 = CFSTR("endPosition uses different units for width and height.");
    }
    v39 = (void *)objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v37, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v38, v20, v21, v22, v23, v24, (uint64_t)cf), 0);
    objc_exception_throw(v39);
  }
  v4 = 0;
  if (cf)
LABEL_20:
    CFRelease(v14);
LABEL_21:
  if (v41)
    CFRelease(v41);
  return v4;
}

- (AVCaptionPosition)endPosition
{
  if (-[AVCaptionRegion _predefinedRegionPositionShouldBeNil](self, "_predefinedRegionPositionShouldBeNil"))
    return 0;
  else
    return (AVCaptionPosition *)-[AVCaptionRegion _endPosition](self, "_endPosition");
}

- (AVCaptionLength)height
{
  uint64_t CMBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  AVCaptionLength *v4;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3 || v3(CMBaseObject, *MEMORY[0x1E0CA3428], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_6;
  if (!cf)
  {
    v4 = 0;
    return v4;
  }
  FigCaptionDynamicStyleGetInitialValue();
  if (FigCaptionGeometryGetCellBasedDimensionFromDictionary())
LABEL_6:
    v4 = 0;
  else
    v4 = -[AVCaptionLength initWithCellCount:]([AVCaptionLength alloc], "initWithCellCount:", (uint64_t)0.0);
  if (cf)
    CFRelease(cf);
  return v4;
}

- (AVCaptionPoint)origin
{
  AVCaptionPoint *result;
  id v6;
  AVCaptionUnitsType v7;
  double v8;
  float v9;
  float v10;

  retstr->x = 0u;
  retstr->y = 0u;
  result = (AVCaptionPoint *)-[AVCaptionRegion _predefinedRegionPositionShouldBeNil](self, "_predefinedRegionPositionShouldBeNil");
  if ((result & 1) == 0)
  {
    v6 = -[AVCaptionRegion _position](self, "_position");
    result = (AVCaptionPoint *)objc_msgSend(v6, "unitType");
    if (result == (AVCaptionPoint *)1)
    {
      objc_msgSend(v6, "relativeToEnclosingRegionX");
      retstr->x.value = v9 * 100.0;
      v7 = AVCaptionUnitsTypePercent;
      retstr->x.units = AVCaptionUnitsTypePercent;
      result = (AVCaptionPoint *)objc_msgSend(v6, "relativeToEnclosingRegionY");
      v8 = v10 * 100.0;
    }
    else
    {
      if (result)
        return result;
      retstr->x.value = (double)objc_msgSend(v6, "cellX");
      v7 = AVCaptionUnitsTypeCells;
      retstr->x.units = AVCaptionUnitsTypeCells;
      result = (AVCaptionPoint *)objc_msgSend(v6, "cellY");
      v8 = (double)(uint64_t)result;
    }
    retstr->y.value = v8;
    retstr->y.units = v7;
  }
  return result;
}

- (AVCaptionSize)size
{
  AVCaptionSize *result;
  AVCaptionPosition *v6;
  AVCaptionPosition *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  AVCaptionUnitsType v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;

  retstr->width = 0u;
  retstr->height = 0u;
  result = (AVCaptionSize *)-[AVCaptionRegion _predefinedRegionPositionShouldBeNil](self, "_predefinedRegionPositionShouldBeNil");
  if ((result & 1) == 0)
  {
    v6 = -[AVCaptionRegion position](self, "position");
    v7 = -[AVCaptionRegion endPosition](self, "endPosition");
    result = -[AVCaptionPosition unitType](v6, "unitType");
    if (result == (AVCaptionSize *)1)
    {
      -[AVCaptionPosition relativeToEnclosingRegionX](v7, "relativeToEnclosingRegionX");
      v13 = v12;
      -[AVCaptionPosition relativeToEnclosingRegionX](v6, "relativeToEnclosingRegionX");
      retstr->width.value = (float)(v13 - v14) * 100.0;
      v11 = AVCaptionUnitsTypePercent;
      retstr->width.units = AVCaptionUnitsTypePercent;
      -[AVCaptionPosition relativeToEnclosingRegionY](v7, "relativeToEnclosingRegionY");
      v16 = v15;
      result = (AVCaptionSize *)-[AVCaptionPosition relativeToEnclosingRegionY](v6, "relativeToEnclosingRegionY");
      v10 = (float)(v16 - v17) * 100.0;
    }
    else
    {
      if (result)
        return result;
      v8 = -[AVCaptionPosition cellX](v7, "cellX");
      retstr->width.value = (double)(v8 - -[AVCaptionPosition cellX](v6, "cellX"));
      retstr->width.units = AVCaptionUnitsTypeUnspecified;
      v9 = -[AVCaptionPosition cellY](v7, "cellY");
      result = -[AVCaptionPosition cellY](v6, "cellY");
      v10 = (double)(v9 - (uint64_t)result);
      v11 = AVCaptionUnitsTypeCells;
    }
    retstr->height.value = v10;
    retstr->height.units = v11;
  }
  return result;
}

- (AVCaptionRegionScroll)scroll
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  int v6;
  AVCaptionRegionScroll v7;
  CFTypeRef cf1;

  cf1 = 0;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CA33E0], *MEMORY[0x1E0C9AE00], &cf1);
  v5 = cf1;
  if (v4)
  {
    v7 = AVCaptionRegionScrollNone;
    if (!cf1)
      return v7;
    goto LABEL_9;
  }
  if (!cf1)
    return 0;
  v6 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0CA3388]);
  v5 = cf1;
  if (v6)
  {
    v7 = AVCaptionRegionScrollRollUp;
    if (!cf1)
      return v7;
    goto LABEL_9;
  }
  CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0CA3380]);
  v7 = AVCaptionRegionScrollNone;
  v5 = cf1;
  if (cf1)
LABEL_9:
    CFRelease(v5);
  return v7;
}

- (AVCaptionRegionDisplayAlignment)displayAlignment
{
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const void *InitialValue;
  AVCaptionRegionDisplayAlignment v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x1E0CA3408], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_5;
  if (!cf)
    return 0;
  InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue();
  if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA3398]))
  {
LABEL_5:
    v7 = AVCaptionRegionDisplayAlignmentBefore;
  }
  else if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA33A0]))
  {
    v7 = AVCaptionRegionDisplayAlignmentCenter;
  }
  else
  {
    if (!CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA3390]))
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("displayAlignment uses an unrecognizable value."), v9, v10, v11, v12, v13, v15), 0);
      objc_exception_throw(v14);
    }
    v7 = AVCaptionRegionDisplayAlignmentAfter;
  }
  if (cf)
    CFRelease(cf);
  return v7;
}

- (AVCaptionRegionWritingMode)writingMode
{
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const void *InitialValue;
  AVCaptionRegionWritingMode v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x1E0CA34B8], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_5;
  if (!cf)
    return 0;
  InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue();
  if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA34D8]))
  {
LABEL_5:
    v7 = AVCaptionRegionWritingModeLeftToRightAndTopToBottom;
  }
  else
  {
    if (!CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA34F0]))
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("writingMode uses an unrecognizable value."), v8, v9, v10, v11, v12, v15), 0);
      objc_exception_throw(v14);
    }
    v7 = AVCaptionRegionWritingModeTopToBottomAndRightToLeft;
  }
  if (cf)
    CFRelease(cf);
  return v7;
}

- (OpaqueFigCaptionRegion)_figCaptionRegion
{
  if (-[AVCaptionRegion _updateFigCaptionRegion](self, "_updateFigCaptionRegion"))
    return 0;
  else
    return self->_internal->figCaptionRegion;
}

- (int)_updatePositionPropertyOfFigCaptionRegionWithPosition:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t CMBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD);
  int v14;
  void *v16;
  uint64_t v17;

  if (objc_msgSend(a3, "unitType") == 1)
  {
    objc_msgSend(a3, "relativeToEnclosingRegionX");
    FigGeometryDimensionMake();
    objc_msgSend(a3, "relativeToEnclosingRegionY");
  }
  else
  {
    if (objc_msgSend(a3, "unitType"))
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("position uses an unrecognizable unit."), v6, v7, v8, v9, v10, v17), 0);
      objc_exception_throw(v16);
    }
    objc_msgSend(a3, "cellX");
    FigGeometryDimensionMake();
    objc_msgSend(a3, "cellY");
  }
  FigGeometryDimensionMake();
  FigGeometryPointMake();
  v11 = (const void *)FigGeometryPointCopyAsDictionary();
  FigCaptionDynamicStyleCreate();
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v13)
  {
    v14 = -12782;
    if (!v11)
      return v14;
    goto LABEL_7;
  }
  v14 = v13(CMBaseObject, *MEMORY[0x1E0CA3490], 0);
  if (v11)
LABEL_7:
    CFRelease(v11);
  return v14;
}

- (int)_updateExtentPropertiesOfFigCaptionRegionWithPosition:(id)a3 endPosition:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  int v15;
  uint64_t CMBaseObject;
  uint64_t (*v17)(uint64_t, _QWORD, _QWORD);
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, _QWORD);
  int v20;
  void *v22;

  if (objc_msgSend(a3, "unitType") == 1)
  {
    objc_msgSend(a4, "relativeToEnclosingRegionX");
    objc_msgSend(a3, "relativeToEnclosingRegionX");
    objc_msgSend(a4, "relativeToEnclosingRegionY");
    objc_msgSend(a3, "relativeToEnclosingRegionY");
    FigGeometryDimensionMake();
  }
  else
  {
    if (objc_msgSend(a3, "unitType"))
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("endPosition uses an unrecognizable unit."), v8, v9, v10, v11, v12, 0), 0);
      objc_exception_throw(v22);
    }
    objc_msgSend(a4, "cellX");
    objc_msgSend(a3, "cellX");
    objc_msgSend(a4, "cellY");
    objc_msgSend(a3, "cellY");
    FigGeometryDimensionMake();
  }
  FigGeometryDimensionMake();
  v13 = (const void *)FigGeometryDimensionCopyAsDictionary();
  v14 = (const void *)FigGeometryDimensionCopyAsDictionary();
  v15 = FigCaptionDynamicStyleCreate();
  if (v15)
    goto LABEL_11;
  v15 = FigCaptionDynamicStyleCreate();
  if (v15)
    goto LABEL_11;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v17 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v17)
  {
    v15 = v17(CMBaseObject, *MEMORY[0x1E0CA34B0], 0);
    if (v15)
    {
LABEL_11:
      v20 = v15;
      goto LABEL_13;
    }
    v18 = FigCaptionRegionGetCMBaseObject();
    v19 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v19)
    {
      v15 = v19(v18, *MEMORY[0x1E0CA3428], 0);
      goto LABEL_11;
    }
  }
  v20 = -12782;
LABEL_13:
  if (v14)
    CFRelease(v14);
  if (v13)
    CFRelease(v13);
  return v20;
}

- (int)_updateFigCaptionRegion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AVCaptionRegionInternal *internal;
  int result;
  void *v11;
  uint64_t v12;

  internal = self->_internal;
  if (!internal->position)
  {
    if (!internal->endPosition)
      return 0;
    self->_internal->position = (AVCaptionPosition *)-[AVCaptionRegion _position](self, "_position");
    internal = self->_internal;
  }
  if (!internal->endPosition)
  {
    self->_internal->endPosition = (AVCaptionPosition *)-[AVCaptionRegion _endPosition](self, "_endPosition");
    internal = self->_internal;
    if (!internal->endPosition)
    {
      if (internal->position)
        goto LABEL_7;
      return 0;
    }
  }
  if (!internal->position)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("position is not specified even though endPosition is specified"), v2, v3, v4, v5, v6, v12), 0);
    objc_exception_throw(v11);
  }
LABEL_7:
  result = -[AVCaptionRegion _updatePositionPropertyOfFigCaptionRegionWithPosition:](self, "_updatePositionPropertyOfFigCaptionRegionWithPosition:");
  if (result)
    return result;

  self->_internal->position = 0;
  if (!self->_internal->endPosition)
    return 0;
  result = -[AVCaptionRegion _updateExtentPropertiesOfFigCaptionRegionWithPosition:endPosition:](self, "_updateExtentPropertiesOfFigCaptionRegionWithPosition:endPosition:", -[AVCaptionRegion _position](self, "_position"), self->_internal->endPosition);
  if (!result)
  {

    result = 0;
    self->_internal->endPosition = 0;
  }
  return result;
}

- (void)_setPosition:(id)a3
{

  self->_internal->position = (AVCaptionPosition *)a3;
}

- (void)_setEndPosition:(id)a3
{

  self->_internal->endPosition = (AVCaptionPosition *)a3;
}

- (void)_setHeight:(id)a3
{
  const void *v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD);

  if (a3)
  {
    objc_msgSend(a3, "numberOfCells");
    v3 = (const void *)FigCaptionGeometryCopyCellBasedDimensionAsDictionary();
    FigCaptionDynamicStyleCreate();
  }
  else
  {
    v3 = 0;
  }
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(CMBaseObject, *MEMORY[0x1E0CA3428], 0);
  if (v3)
    CFRelease(v3);
}

- (void)_setOrigin:(AVCaptionPoint *)a3
{
  const void *v5;
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);

  self->_internal->position = 0;
  self->_internal->endPosition = 0;
  _convertFigGeometryDimensionToAVCaptionDimension(*(_QWORD *)&a3->x.value, a3->x.units);
  _convertFigGeometryDimensionToAVCaptionDimension(*(_QWORD *)&a3->y.value, a3->y.units);
  FigGeometryPointMake();
  v5 = (const void *)FigGeometryPointCopyAsDictionary();
  FigCaptionDynamicStyleCreate();
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(CMBaseObject, *MEMORY[0x1E0CA3490], 0);
  if (v5)
    CFRelease(v5);
}

- (void)_setSize:(AVCaptionSize *)a3
{
  AVCaptionUnitsType units;
  const void *v6;
  AVCaptionUnitsType v7;
  const void *v8;
  uint64_t CMBaseObject;
  unsigned int (*v10)(uint64_t, _QWORD, _QWORD);
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, _QWORD);

  self->_internal->position = 0;
  self->_internal->endPosition = 0;
  units = a3->width.units;
  if (units)
  {
    _convertFigGeometryDimensionToAVCaptionDimension(*(_QWORD *)&a3->width.value, units);
    v6 = (const void *)FigGeometryDimensionCopyAsDictionary();
    FigCaptionDynamicStyleCreate();
    if (v6)
      CFRelease(v6);
  }
  v7 = a3->height.units;
  if (v7)
  {
    _convertFigGeometryDimensionToAVCaptionDimension(*(_QWORD *)&a3->height.value, v7);
    v8 = (const void *)FigGeometryDimensionCopyAsDictionary();
    FigCaptionDynamicStyleCreate();
    if (v8)
      CFRelease(v8);
  }
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v10 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v10 && !v10(CMBaseObject, *MEMORY[0x1E0CA34B0], 0))
  {
    v11 = FigCaptionRegionGetCMBaseObject();
    v12 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
      v12(v11, *MEMORY[0x1E0CA3428], 0);
  }
}

- (void)_setScroll:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  const void *v9;
  uint64_t CMBaseObject;
  void (*v11)(uint64_t, _QWORD, const void *);
  void *v12;
  uint64_t v13;

  if (a3 == 1)
  {
    v8 = (const void **)MEMORY[0x1E0CA3388];
  }
  else
  {
    if (a3)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("scroll must be one of the values defined in AVCaptionRegionScroll."), v3, v4, v5, v6, v7, v13), 0);
      objc_exception_throw(v12);
    }
    v8 = (const void **)MEMORY[0x1E0CA3380];
  }
  v9 = *v8;
  CMBaseObject = FigCaptionRegionGetCMBaseObject();
  v11 = *(void (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v11)
    v11(CMBaseObject, *MEMORY[0x1E0CA33E0], v9);
  if (v9)
    CFRelease(v9);
}

- (void)_setDisplayAlignment:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t CMBaseObject;
  void (*v10)(uint64_t, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;

  if ((unint64_t)a3 >= 3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("displayAlignment is invalid."), v3, v4, v5, v6, v7, v12), 0);
    objc_exception_throw(v11);
  }
  v8 = (const void *)**((_QWORD **)&unk_1E3031200 + a3);
  if (!FigCaptionDynamicStyleCreate())
  {
    CMBaseObject = FigCaptionRegionGetCMBaseObject();
    v10 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v10)
      v10(CMBaseObject, *MEMORY[0x1E0CA3408], 0);
  }
  if (v8)
    CFRelease(v8);
}

- (void)_setWritingMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  const void *v9;
  uint64_t CMBaseObject;
  void (*v11)(uint64_t, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;

  if (a3)
  {
    if (a3 != 2)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("writingMode is invalid."), v3, v4, v5, v6, v7, v13), 0);
      objc_exception_throw(v12);
    }
    v8 = (const void **)MEMORY[0x1E0CA34F0];
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E0CA34D8];
  }
  v9 = *v8;
  if (!FigCaptionDynamicStyleCreate())
  {
    CMBaseObject = FigCaptionRegionGetCMBaseObject();
    v11 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(CMBaseObject, *MEMORY[0x1E0CA34B8], 0);
  }
  if (v9)
    CFRelease(v9);
}

+ (id)appleiTTTop
{
  if (appleiTTTop_createOnceToken != -1)
    dispatch_once(&appleiTTTop_createOnceToken, &__block_literal_global_4);
  return (id)appleiTTTop_region;
}

uint64_t __30__AVCaptionRegion_appleiTTTop__block_invoke()
{
  AVCaptionRegion *v0;
  uint64_t result;

  v0 = [AVCaptionRegion alloc];
  result = -[AVCaptionRegion initWithIdentifier:](v0, "initWithIdentifier:", *MEMORY[0x1E0CA3458]);
  appleiTTTop_region = result;
  return result;
}

+ (id)appleiTTBottom
{
  if (appleiTTBottom_createOnceToken != -1)
    dispatch_once(&appleiTTBottom_createOnceToken, &__block_literal_global_143);
  return (id)appleiTTBottom_region;
}

uint64_t __33__AVCaptionRegion_appleiTTBottom__block_invoke()
{
  AVCaptionRegion *v0;
  uint64_t result;

  v0 = [AVCaptionRegion alloc];
  result = -[AVCaptionRegion initWithIdentifier:](v0, "initWithIdentifier:", *MEMORY[0x1E0CA3440]);
  appleiTTBottom_region = result;
  return result;
}

+ (id)appleiTTLeft
{
  if (appleiTTLeft_createOnceToken != -1)
    dispatch_once(&appleiTTLeft_createOnceToken, &__block_literal_global_144);
  return (id)appleiTTLeft_region;
}

uint64_t __31__AVCaptionRegion_appleiTTLeft__block_invoke()
{
  AVCaptionRegion *v0;
  uint64_t result;

  v0 = [AVCaptionRegion alloc];
  result = -[AVCaptionRegion initWithIdentifier:](v0, "initWithIdentifier:", *MEMORY[0x1E0CA3448]);
  appleiTTLeft_region = result;
  return result;
}

+ (id)appleiTTRight
{
  if (appleiTTRight_createOnceToken != -1)
    dispatch_once(&appleiTTRight_createOnceToken, &__block_literal_global_145);
  return (id)appleiTTRight_region;
}

uint64_t __32__AVCaptionRegion_appleiTTRight__block_invoke()
{
  AVCaptionRegion *v0;
  uint64_t result;

  v0 = [AVCaptionRegion alloc];
  result = -[AVCaptionRegion initWithIdentifier:](v0, "initWithIdentifier:", *MEMORY[0x1E0CA3450]);
  appleiTTRight_region = result;
  return result;
}

+ (id)subRipTextBottom
{
  if (subRipTextBottom_createOnceToken != -1)
    dispatch_once(&subRipTextBottom_createOnceToken, &__block_literal_global_146);
  return (id)subRipTextBottom_region;
}

uint64_t __35__AVCaptionRegion_subRipTextBottom__block_invoke()
{
  AVCaptionRegion *v0;
  uint64_t result;

  v0 = [AVCaptionRegion alloc];
  result = -[AVCaptionRegion initWithIdentifier:](v0, "initWithIdentifier:", *MEMORY[0x1E0CA3460]);
  subRipTextBottom_region = result;
  return result;
}

+ (AVCaptionRegion)appleITTTopRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTTop](AVCaptionRegion, "appleiTTTop");
}

+ (AVCaptionRegion)appleITTBottomRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTBottom](AVCaptionRegion, "appleiTTBottom");
}

+ (AVCaptionRegion)appleITTLeftRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTLeft](AVCaptionRegion, "appleiTTLeft");
}

+ (AVCaptionRegion)appleITTRightRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTRight](AVCaptionRegion, "appleiTTRight");
}

+ (AVCaptionRegion)subRipTextBottomRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion subRipTextBottom](AVCaptionRegion, "subRipTextBottom");
}

@end
