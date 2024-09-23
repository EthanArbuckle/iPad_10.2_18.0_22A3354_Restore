@implementation AVCaption

+ (id)captionFromFigCaption:(OpaqueFigCaption *)a3
{
  void (*v5)(__int128 *__return_ptr, OpaqueFigCaption *);
  __int128 v6;
  uint64_t CMBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  id v9;
  void *v10;
  _OWORD v12[3];
  CFTypeRef cf;
  CFTypeRef v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v5 = *(void (**)(__int128 *__return_ptr, OpaqueFigCaption *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 8);
  if (v5)
  {
    v5(&v15, a3);
  }
  else
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v15 = *MEMORY[0x1E0CA2E40];
    v16 = v6;
    v17 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  }
  cf = 0;
  v14 = 0;
  CMBaseObject = FigCaptionGetCMBaseObject();
  v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v8
    || v8(CMBaseObject, *MEMORY[0x1E0CC3FD8], *MEMORY[0x1E0C9AE00], &v14)
    || FigCaptionDataCreateMutableCopy())
  {
    v10 = 0;
  }
  else
  {
    v9 = objc_alloc((Class)a1);
    v12[0] = v15;
    v12[1] = v16;
    v12[2] = v17;
    v10 = (void *)objc_msgSend(v9, "initWithFigMutableCaptionData:timeRange:", cf, v12);
  }
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
  return v10;
}

- (AVCaption)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithText_timeRange_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCaption)initWithFigMutableCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4
{
  AVCaption *v6;
  AVCaptionInternal *v7;
  AVCaptionInternal *internal;
  __int128 v9;
  __int128 v10;
  objc_class *v12;
  const char *v13;
  AVCaption *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  AVCaption *v23;
  void *v24;
  objc_super v25;

  if (!a3)
  {
    v12 = (objc_class *)self;
    v13 = a2;
    v23 = self;
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = "figCaptionData != NULL";
LABEL_11:
    v24 = (void *)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithObjectAndSelector(v12, v13, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v15, v16, v17, v18, v19, (uint64_t)v22), 0);
    objc_exception_throw(v24);
  }
  if ((a4->var0.var2 & 0x1D) != 1 || (a4->var1.var2 & 0x1D) != 1)
  {
    v12 = (objc_class *)self;
    v13 = a2;
    v14 = self;
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = "isValidCaptionTimeRange(timeRange)";
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)AVCaption;
  v6 = -[AVCaption init](&v25, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptionInternal);
    v6->_internal = v7;
    if (v7)
    {
      CFRetain(v7);
      internal = v6->_internal;
      v9 = *(_OWORD *)&a4->var0.var0;
      v10 = *(_OWORD *)&a4->var1.var1;
      *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&internal->timeRange.duration.timescale = v10;
      *(_OWORD *)&internal->timeRange.start.value = v9;
      v6->_internal->figCaptionData = (OpaqueFigCaptionData *)CFRetain(a3);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaption)initWithFigCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4
{
  objc_class *v4;
  __int128 v6;
  AVCaption *v7;
  AVCaption *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _OWORD v17[3];
  CFTypeRef v18;

  v4 = (objc_class *)self;
  if ((a4->var0.var2 & 0x1D) != 1 || (a4->var1.var2 & 0x1D) != 1)
  {
    v10 = self;
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(v4, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)"CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)"), 0);
    objc_exception_throw(v16);
  }
  v18 = 0;
  if (FigCaptionDataCreateMutableCopy())
  {

    v4 = 0;
  }
  v6 = *(_OWORD *)&a4->var0.var3;
  v17[0] = *(_OWORD *)&a4->var0.var0;
  v17[1] = v6;
  v17[2] = *(_OWORD *)&a4->var1.var1;
  v7 = -[objc_class initWithFigMutableCaptionData:timeRange:](v4, "initWithFigMutableCaptionData:timeRange:", v18, v17);
  if (v18)
    CFRelease(v18);
  return v7;
}

- (AVCaption)initWithText:(NSString *)text timeRange:(CMTimeRange *)timeRange
{
  objc_class *v4;
  unsigned int (*v7)(CFTypeRef, NSString *);
  __int128 v8;
  AVCaption *v9;
  const char *v11;
  AVCaption *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  AVCaption *v21;
  void *v22;
  _OWORD v23[3];
  CFTypeRef v24;

  v4 = (objc_class *)self;
  if (!text)
  {
    v11 = a2;
    v21 = self;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "text != nil";
LABEL_14:
    v22 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector(v4, v11, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v13, v14, v15, v16, v17, (uint64_t)v20), 0);
    objc_exception_throw(v22);
  }
  if ((timeRange->start.flags & 0x1D) != 1 || (timeRange->duration.flags & 0x1D) != 1)
  {
    v11 = a2;
    v12 = self;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)";
    goto LABEL_14;
  }
  v24 = 0;
  if (FigCaptionDataCreateMutable())
  {

    v4 = 0;
  }
  v7 = *(unsigned int (**)(CFTypeRef, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v7 || v7(v24, text))
  {

    v4 = 0;
  }
  v8 = *(_OWORD *)&timeRange->start.epoch;
  v23[0] = *(_OWORD *)&timeRange->start.value;
  v23[1] = v8;
  v23[2] = *(_OWORD *)&timeRange->duration.timescale;
  v9 = -[objc_class initWithFigMutableCaptionData:timeRange:](v4, "initWithFigMutableCaptionData:timeRange:", v24, v23);
  if (v24)
    CFRelease(v24);
  return v9;
}

- (AVCaption)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CFTypeRef v18;

  v18 = 0;
  if (FigCaptionDataCreateMutable())
    goto LABEL_2;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  if (!a3)
    goto LABEL_2;
  objc_msgSend(a3, "decodeCMTimeRangeForKey:", CFSTR("AVCaptionArchiveKeyTimeRange"));
  if ((BYTE12(v15) & 0x1D) != 1 || (BYTE4(v17) & 0x1D) != 1)
    goto LABEL_2;
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  self = -[AVCaption initWithFigMutableCaptionData:timeRange:](self, "initWithFigMutableCaptionData:timeRange:", v18, v14);
  if (!self)
    goto LABEL_3;
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionArchiveKeyText"));
  if (!v6)
  {
LABEL_2:

    self = 0;
    goto LABEL_3;
  }
  -[AVCaption _setText:](self, "_setText:", v6);
  -[AVCaption _setAnimation:](self, "_setAnimation:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionArchiveKeyAnimation")));
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionArchiveKeyRegion"));
  if (v7)
    -[AVCaption _setRegion:](self, "_setRegion:", v7);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionArchiveKeyTextAlignment")))
    -[AVCaption _setTextAlignment:](self, "_setTextAlignment:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionArchiveKeyTextAlignment")));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("AVCaptionArchiveKeyStyleProperties"));
  if (v13)
    -[AVCaption _setStylePropertiesForArchive:](self, "_setStylePropertiesForArchive:", v13);
LABEL_3:
  if (v18)
    CFRelease(v18);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _OWORD v5[3];

  objc_msgSend(a3, "encodeInteger:forKey:", 2, CFSTR("AVCaptionArchiveKeyVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption text](self, "text"), CFSTR("AVCaptionArchiveKeyText"));
  if (self)
    -[AVCaption timeRange](self, "timeRange");
  else
    memset(v5, 0, sizeof(v5));
  objc_msgSend(a3, "encodeCMTimeRange:forKey:", v5, CFSTR("AVCaptionArchiveKeyTimeRange"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption region](self, "region"), CFSTR("AVCaptionArchiveKeyRegion"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaption animation](self, "animation"), CFSTR("AVCaptionArchiveKeyAnimation"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaption textAlignment](self, "textAlignment"), CFSTR("AVCaptionArchiveKeyTextAlignment"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption _stylePropertiesForArchive](self, "_stylePropertiesForArchive"), CFSTR("AVCaptionArchiveKeyStyleProperties"));
}

- (void)dealloc
{
  AVCaptionInternal *internal;
  AVCaptionInternal *v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    if (internal->figCaptionData)
    {
      CFRelease(internal->figCaptionData);
      internal = self->_internal;
    }
    CFRelease(internal);
    v4 = self->_internal;
  }
  else
  {
    v4 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCaption;
  -[AVCaption dealloc](&v5, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableCaption *v4;
  OpaqueFigCaptionData *v5;
  _OWORD v7[3];

  v4 = [AVMutableCaption alloc];
  v5 = -[AVCaption _figCaptionData](self, "_figCaptionData");
  if (self)
    -[AVCaption timeRange](self, "timeRange");
  else
    memset(v7, 0, sizeof(v7));
  return -[AVCaption initWithFigCaptionData:timeRange:](v4, "initWithFigCaptionData:timeRange:", v5, v7);
}

- (NSString)text
{
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v3)(OpaqueFigCaptionData *);

  figCaptionData = self->_internal->figCaptionData;
  v3 = *(uint64_t (**)(OpaqueFigCaptionData *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v3)
    return (NSString *)v3(figCaptionData);
  else
    return (NSString *)&stru_1E303A378;
}

- (AVCaptionRegion)region
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  BOOL v6;
  AVCaptionRegion *v7;
  AVCaptionRegion *v8;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CA3340], *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
    v6 = 1;
  else
    v6 = cf == 0;
  if (!v6)
  {
    v7 = [AVCaptionRegion alloc];
    v8 = -[AVCaptionRegion initWithFigCaptionRegion:](v7, "initWithFigCaptionRegion:", cf);
    v5 = cf;
    if (!cf)
      return v8;
    goto LABEL_10;
  }
  v8 = 0;
  if (cf)
LABEL_10:
    CFRelease(v5);
  return v8;
}

- (CMTimeRange)timeRange
{
  _OWORD *v3;
  __int128 v4;

  v3 = *(_OWORD **)&self->start.timescale;
  v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (OpaqueFigCaptionData)_figCaptionData
{
  return self->_internal->figCaptionData;
}

- (id)description
{
  const __CFAllocator *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  CMTimeRange range;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[AVCaption timeRange](self, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, timeRange = %@ text=%@>"), NSStringFromClass(v6), self, v4, -[AVCaption text](self, "text"));
}

- (void)_setText:(id)a3
{
  OpaqueFigCaptionData *figCaptionData;
  void (*v5)(OpaqueFigCaptionData *, id);

  figCaptionData = self->_internal->figCaptionData;
  v5 = *(void (**)(OpaqueFigCaptionData *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v5)
    v5(figCaptionData, a3);
}

- (void)_setTimeRange:(id *)a3
{
  AVCaptionInternal *internal;
  __int128 v4;
  __int128 v5;

  internal = self->_internal;
  v4 = *(_OWORD *)&a3->var0.var0;
  v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&internal->timeRange.duration.timescale = v5;
  *(_OWORD *)&internal->timeRange.start.value = v4;
}

- (void)_setRegion:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t CMBaseObject;
  void (*v28)(uint64_t, _QWORD, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD, _QWORD, uint64_t *);
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = 0;
  if (!objc_msgSend(a3, "endPosition"))
    goto LABEL_9;
  v6 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "unitType");
  if (!v6)
  {
    v22 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "cellX");
    v23 = objc_msgSend((id)objc_msgSend(a3, "position"), "cellX");
    v24 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "cellY");
    v25 = objc_msgSend((id)objc_msgSend(a3, "position"), "cellY");
    if (v22 >= v23)
    {
      if (v24 <= v25)
        goto LABEL_6;
      goto LABEL_9;
    }
    goto LABEL_21;
  }
  if (v6 != 1)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unit type not valid");
LABEL_23:
    v32 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v21, v7, v8, v9, v10, v11, v33), 0);
    objc_exception_throw(v32);
  }
  objc_msgSend((id)objc_msgSend(a3, "endPosition"), "relativeToEnclosingRegionX");
  v13 = v12;
  objc_msgSend((id)objc_msgSend(a3, "position"), "relativeToEnclosingRegionX");
  v15 = v13 - v14;
  objc_msgSend((id)objc_msgSend(a3, "endPosition"), "relativeToEnclosingRegionY");
  v17 = v16;
  objc_msgSend((id)objc_msgSend(a3, "position"), "relativeToEnclosingRegionY");
  if (v15 <= 0.0)
  {
LABEL_21:
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("region width is negative.");
    goto LABEL_23;
  }
  if ((float)(v17 - v18) <= 0.0)
  {
LABEL_6:
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("region height is negative.");
    goto LABEL_23;
  }
LABEL_9:
  v26 = objc_msgSend(a3, "_figCaptionRegion");
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v28 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v28)
    v28(CMBaseObject, *MEMORY[0x1E0CA3340], v26);
  v29 = FigCaptionDataGetCMBaseObject();
  v30 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v30 || (v30(v29, *MEMORY[0x1E0CA3378], *MEMORY[0x1E0C9AE00], &v34), !v34))
  {
    if (+[AVCaptionRegion appleiTTTop](AVCaptionRegion, "appleiTTTop") == a3
      || +[AVCaptionRegion appleiTTBottom](AVCaptionRegion, "appleiTTBottom") == a3)
    {
      v31 = 2;
      goto LABEL_19;
    }
    if (+[AVCaptionRegion appleiTTLeft](AVCaptionRegion, "appleiTTLeft") == a3
      || +[AVCaptionRegion appleiTTRight](AVCaptionRegion, "appleiTTRight") == a3)
    {
      v31 = 0;
LABEL_19:
      -[AVCaption _setTextAlignment:](self, "_setTextAlignment:", v31);
    }
  }
}

- (void)_setAnimation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t CMBaseObject;
  void (*v11)(uint64_t, _QWORD, uint64_t);
  void *v12;
  uint64_t v13;

  if (a3)
  {
    if (a3 != 1)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("animation property must be one of the values defined in AVCaptionAnimation."), v3, v4, v5, v6, v7, v13), 0);
      objc_exception_throw(v12);
    }
    v8 = (uint64_t *)MEMORY[0x1E0CA3260];
  }
  else
  {
    v8 = (uint64_t *)MEMORY[0x1E0CA3268];
  }
  v9 = *v8;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v11 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v11)
    v11(CMBaseObject, *MEMORY[0x1E0CA3300], v9);
}

- (void)_setTextAlignment:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t CMBaseObject;
  void (*v9)(uint64_t, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;

  if ((unint64_t)a3 >= 5)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("textAlignment is not one of the supported value."), v3, v4, v5, v6, v7, v11), 0);
    objc_exception_throw(v10);
  }
  if (!FigCaptionDynamicStyleCreate())
  {
    CMBaseObject = FigCaptionDataGetCMBaseObject();
    v9 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v9)
      v9(CMBaseObject, *MEMORY[0x1E0CA3378], 0);
  }
}

- (void)_setTextColor:(CGColor *)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  OpaqueFigCaptionData *figCaptionData;
  void (*v8)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v9;
  void (*v10)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (a3)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        v8 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v8)
          v8(figCaptionData, *MEMORY[0x1E0CA35E8], 0, location, length);
      }
    }
    else
    {
      v9 = self->_internal->figCaptionData;
      v10 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v10)
        v10(v9, *MEMORY[0x1E0CA35E8], location, length);
    }
  }
}

- (void)_setBackgroundColor:(CGColor *)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  OpaqueFigCaptionData *figCaptionData;
  void (*v8)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v9;
  void (*v10)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (a3)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        v8 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v8)
          v8(figCaptionData, *MEMORY[0x1E0CA3558], 0, location, length);
      }
    }
    else
    {
      v9 = self->_internal->figCaptionData;
      v10 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v10)
        v10(v9, *MEMORY[0x1E0CA3558], location, length);
    }
  }
}

- (void)_setFontWeight:(int64_t)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  _QWORD *v10;
  OpaqueFigCaptionData *figCaptionData;
  void (*v12)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v13;
  void (*v14)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);
  void *v15;
  uint64_t v16;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    switch(a3)
    {
      case 0:
        goto LABEL_11;
      case 1:
        v10 = (_QWORD *)MEMORY[0x1E0CA35B0];
        break;
      case 2:
        v10 = (_QWORD *)MEMORY[0x1E0CA35A8];
        break;
      default:
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("fontWeight property must be one of the values defined in AVCaptionFontWeight."), a4.location, a4.length, v4, v5, v6, v16), 0);
        objc_exception_throw(v15);
    }
    if (*v10)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        v12 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v12)
          v12(figCaptionData, *MEMORY[0x1E0CA35A0], 0, location, length);
      }
    }
    else
    {
LABEL_11:
      v13 = self->_internal->figCaptionData;
      v14 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v14)
        v14(v13, *MEMORY[0x1E0CA35A0], location, length);
    }
  }
}

- (void)_setFontStyle:(int64_t)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  _QWORD *v10;
  OpaqueFigCaptionData *figCaptionData;
  void (*v12)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v13;
  void (*v14)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);
  void *v15;
  uint64_t v16;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    switch(a3)
    {
      case 0:
        goto LABEL_11;
      case 1:
        v10 = (_QWORD *)MEMORY[0x1E0CA3590];
        break;
      case 2:
        v10 = (_QWORD *)MEMORY[0x1E0CA3588];
        break;
      default:
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("fontStyle property must be one of the values defined in AVCaptionFontStyle."), a4.location, a4.length, v4, v5, v6, v16), 0);
        objc_exception_throw(v15);
    }
    if (*v10)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        v12 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v12)
          v12(figCaptionData, *MEMORY[0x1E0CA3580], 0, location, length);
      }
    }
    else
    {
LABEL_11:
      v13 = self->_internal->figCaptionData;
      v14 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v14)
        v14(v13, *MEMORY[0x1E0CA3580], location, length);
    }
  }
}

- (void)_setDecoration:(unint64_t)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CFNumberRef v7;
  OpaqueFigCaptionData *figCaptionData;
  void (*v9)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v10;
  void (*v11)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);
  unint64_t valuePtr;

  valuePtr = a3;
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (a3)
    {
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberNSIntegerType, &valuePtr);
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        v9 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v9)
          v9(figCaptionData, *MEMORY[0x1E0CA3560], 0, location, length);
      }
    }
    else
    {
      v10 = self->_internal->figCaptionData;
      v11 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v11)
        v11(v10, *MEMORY[0x1E0CA3560], location, length);
      v7 = 0;
    }
    if (v7)
      CFRelease(v7);
  }
}

- (void)_setTextCombine:(int64_t)a3 inRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  OpaqueFigCaptionData *v10;
  void (*v11)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *figCaptionData;
  void (*v13)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger);
  void *v14;
  uint64_t v15;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    switch(a3)
    {
      case -1:
      case 1:
      case 2:
      case 3:
      case 4:
        if (!FigCaptionDynamicStyleCreate())
        {
          figCaptionData = self->_internal->figCaptionData;
          v13 = *(void (**)(OpaqueFigCaptionData *, _QWORD, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
          if (v13)
            v13(figCaptionData, *MEMORY[0x1E0CA35F0], 0, location, length);
        }
        break;
      case 0:
        v10 = self->_internal->figCaptionData;
        v11 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 40);
        if (v11)
          v11(v10, *MEMORY[0x1E0CA35F0], location, length);
        break;
      default:
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("textCombine is not one of the supported value."), a4.location, a4.length, v4, v5, v6, v15), 0);
        objc_exception_throw(v14);
    }
  }
}

- (void)_setRuby:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v7;
  OpaqueFigCaptionData *figCaptionData;
  void (*v9)(OpaqueFigCaptionData *, _QWORD, const void *, NSUInteger, NSUInteger);
  OpaqueFigCaptionData *v10;
  void (*v11)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger);

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (a3)
    {
      v7 = (const void *)objc_msgSend(a3, "copyFigCaptionData");
      figCaptionData = self->_internal->figCaptionData;
      v9 = *(void (**)(OpaqueFigCaptionData *, _QWORD, const void *, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v9)
        v9(figCaptionData, *MEMORY[0x1E0CA35E0], v7, location, length);
      if (v7)
        CFRelease(v7);
    }
    else
    {
      v10 = self->_internal->figCaptionData;
      v11 = *(void (**)(OpaqueFigCaptionData *, _QWORD, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 40);
      if (v11)
        v11(v10, *MEMORY[0x1E0CA35E0], location, length);
    }
  }
}

- (void)_setStylePropertiesForArchive:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSRange v12;
  uint64_t v13;
  void *v14;
  uint64_t CGColorSRGBFromArray;
  CGColor *v16;
  uint64_t v17;
  uint64_t v18;
  CGColor *v19;
  CFTypeRef v20;
  OpaqueFigCaptionData *figCaptionData;
  unsigned int (*v22)(OpaqueFigCaptionData *, uint64_t, CFTypeRef, NSUInteger, NSUInteger);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFTypeRef cf;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v4)
    goto LABEL_49;
  v5 = v4;
  v34 = 0;
  v6 = *(_QWORD *)v36;
  v26 = *MEMORY[0x1E0CA35E0];
  v27 = *MEMORY[0x1E0CA35F0];
  v28 = *MEMORY[0x1E0CA3560];
  v29 = *MEMORY[0x1E0CA3580];
  v25 = *MEMORY[0x1E0CA3588];
  v31 = *MEMORY[0x1E0CA3558];
  v32 = *MEMORY[0x1E0CA35E8];
  v33 = *MEMORY[0x1E0CA35A0];
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(a3);
      v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVCaptionArchiveKeyStylePropertyName"));
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (NSString *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVCaptionArchiveKeyStylePropertyRange"));
          if (v11)
          {
            v12 = NSRangeFromString(v11);
            if (v12.length)
            {
              v13 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVCaptionArchiveKeyStylePropertyValue"));
              if (v13)
              {
                v14 = (void *)v13;
                if (cf)
                {
                  CFRelease(cf);
                  cf = 0;
                }
                if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeight"), v25))
                {
                  objc_opt_class();
                  v34 = v33;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeightNormal")))
                  {
                    v34 = v33;
                    if (!objc_msgSend(v14, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeightBold")))goto LABEL_31;
                  }
                  FigCaptionDynamicStyleCreate();
                  v17 = v33;
                }
                else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_TextColor")))
                {
                  objc_opt_class();
                  v34 = v32;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  CGColorSRGBFromArray = FigCreateCGColorSRGBFromArray();
                  v34 = v32;
                  if (!CGColorSRGBFromArray)
                    goto LABEL_31;
                  v16 = (CGColor *)CGColorSRGBFromArray;
                  FigCaptionDynamicStyleCreate();
                  CGColorRelease(v16);
                  v17 = v32;
                }
                else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_BackgroundColor")))
                {
                  objc_opt_class();
                  v34 = v31;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  v18 = FigCreateCGColorSRGBFromArray();
                  v34 = v31;
                  if (!v18)
                    goto LABEL_31;
                  v19 = (CGColor *)v18;
                  FigCaptionDynamicStyleCreate();
                  CGColorRelease(v19);
                  v17 = v31;
                }
                else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_FontStyle")))
                {
                  objc_opt_class();
                  v34 = v29;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("AVCaptionArchiveStylePropertyValue_FontStyleNormal")))
                  {
                    v34 = v29;
                    if (!objc_msgSend(v14, "isEqualToString:", CFSTR("AVCaptionArchiveStylePropertyValue_FontStyleItalic")))goto LABEL_31;
                  }
                  FigCaptionDynamicStyleCreate();
                  v17 = v29;
                }
                else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_Decoration")))
                {
                  objc_opt_class();
                  v34 = v28;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  FigCaptionDynamicStyleCreate();
                  v17 = v28;
                }
                else if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_TextCombine")))
                {
                  objc_opt_class();
                  v34 = v27;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_31;
                  FigCaptionDynamicStyleCreate();
                  v17 = v27;
                }
                else
                {
                  v23 = objc_msgSend(v10, "isEqualToString:", CFSTR("AVCaptionArchiveKeyStylePropertyName_RubyText"));
                  v17 = v34;
                  if (v23)
                  {
                    objc_opt_class();
                    v34 = v26;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_31;
                    cf = (CFTypeRef)objc_msgSend(v14, "copyFigCaptionData");
                    v17 = v26;
                  }
                }
                v34 = v17;
                if (v17)
                {
                  v20 = cf;
                  if (cf)
                  {
                    figCaptionData = self->_internal->figCaptionData;
                    v22 = *(unsigned int (**)(OpaqueFigCaptionData *, uint64_t, CFTypeRef, NSUInteger, NSUInteger))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
                    if (!v22 || v22(figCaptionData, v34, v20, v12.location, v12.length))
                      goto LABEL_49;
                  }
                }
              }
            }
          }
        }
      }
LABEL_31:
      ++v7;
    }
    while (v5 != v7);
    v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v5 = v24;
  }
  while (v24);
LABEL_49:
  if (cf)
    CFRelease(cf);
}

+ (void)_appendFigStyleKey:(__CFString *)a3 value:(void *)a4 range:(id)a5 toArray:(id)a6
{
  NSUInteger var1;
  NSUInteger var0;
  AVCaptionRuby *v11;
  const __CFString *v12;
  _QWORD v13[3];
  _QWORD v14[4];
  NSRange v15;

  var1 = a5.var1;
  var0 = a5.var0;
  v14[3] = *MEMORY[0x1E0C80C00];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA35A0]))
  {
    if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E0CA35B0]))
    {
      a4 = CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeightNormal");
    }
    else
    {
      if (!CFEqual(a4, (CFTypeRef)*MEMORY[0x1E0CA35A8]))
        return;
      a4 = CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeightBold");
    }
    v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_FontWeight");
    goto LABEL_13;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA35E8]))
  {
    v11 = (AVCaptionRuby *)FigCopyCGColorSRGBAsArray();
    v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_TextColor");
LABEL_11:
    a4 = v11;
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA3558]))
  {
    v11 = (AVCaptionRuby *)FigCopyCGColorSRGBAsArray();
    v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_BackgroundColor");
    goto LABEL_11;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA3580]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA3560]))
    {
      v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_Decoration");
    }
    else
    {
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA35F0]))
      {
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA35E0]))
        {
          v11 = -[AVCaptionRuby initWithFigCaptionData:]([AVCaptionRuby alloc], "initWithFigCaptionData:", a4);
          v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_RubyText");
          goto LABEL_11;
        }
        return;
      }
      v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_TextCombine");
    }
LABEL_12:
    if (!a4)
      return;
    goto LABEL_13;
  }
  if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E0CA3590]))
  {
    a4 = CFSTR("AVCaptionArchiveStylePropertyValue_FontStyleNormal");
LABEL_22:
    v12 = CFSTR("AVCaptionArchiveKeyStylePropertyName_FontStyle");
LABEL_13:
    v15.location = var0;
    v15.length = var1;
    v13[0] = CFSTR("AVCaptionArchiveKeyStylePropertyName");
    v13[1] = CFSTR("AVCaptionArchiveKeyStylePropertyValue");
    v14[0] = v12;
    v14[1] = a4;
    v13[2] = CFSTR("AVCaptionArchiveKeyStylePropertyRange");
    v14[2] = NSStringFromRange(v15);
    objc_msgSend(a6, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    return;
  }
  if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E0CA3588]))
  {
    a4 = CFSTR("AVCaptionArchiveStylePropertyValue_FontStyleItalic");
    goto LABEL_22;
  }
}

- (id)_stylePropertiesForArchive
{
  void *v3;
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v6;
  CFIndex v7;
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v9)(OpaqueFigCaptionData *);
  const __CFString *v10;
  CFIndex Length;
  CFIndex v12;
  CFIndex v13;
  const void *ValueAtIndex;
  const void *v15;
  uint64_t v16;
  OpaqueFigCaptionData *v17;
  unsigned int (*v18)(OpaqueFigCaptionData *, uint64_t, const void *, uint64_t, CFTypeRef *, uint64_t *);
  CFTypeID v19;
  uint64_t InitialValue;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  CFTypeRef cf;
  CFArrayRef theArray;

  cf = 0;
  theArray = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (v5)
  {
    v6 = *MEMORY[0x1E0C9AE00];
    if (!v5(CMBaseObject, *MEMORY[0x1E0CA3368], *MEMORY[0x1E0C9AE00], &theArray))
    {
      v7 = theArray ? CFArrayGetCount(theArray) : 0;
      figCaptionData = self->_internal->figCaptionData;
      v9 = *(uint64_t (**)(OpaqueFigCaptionData *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      v10 = v9 ? (const __CFString *)v9(figCaptionData) : &stru_1E303A378;
      Length = CFStringGetLength(v10);
      if (v7)
      {
        v12 = Length;
        v13 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v13);
          if (v12)
            break;
LABEL_24:
          if (++v13 == v7)
            goto LABEL_25;
        }
        v15 = ValueAtIndex;
        v16 = 0;
        while (1)
        {
          v24 = 0;
          v25 = 0;
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v17 = self->_internal->figCaptionData;
          v18 = *(unsigned int (**)(OpaqueFigCaptionData *, uint64_t, const void *, uint64_t, CFTypeRef *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
          if (!v18 || v18(v17, v16, v15, v6, &cf, &v24))
            break;
          if (cf)
          {
            v19 = CFGetTypeID(cf);
            if (v19 == FigCaptionDynamicStyleGetTypeID())
            {
              InitialValue = FigCaptionDynamicStyleGetInitialValue();
              v21 = v24;
              v22 = v25;
LABEL_22:
              +[AVCaption _appendFigStyleKey:value:range:toArray:](AVCaption, "_appendFigStyleKey:value:range:toArray:", v15, InitialValue, v21, v22, v3, v24, v25);
              goto LABEL_23;
            }
            InitialValue = (uint64_t)cf;
            if (cf)
            {
              v21 = v24;
              v22 = v25;
              goto LABEL_22;
            }
          }
LABEL_23:
          v16 = v25 + v24;
          if (v25 + v24 == v12)
            goto LABEL_24;
        }
      }
    }
  }
LABEL_25:
  if (theArray)
    CFRelease(theArray);
  if (cf)
    CFRelease(cf);
  return v3;
}

- (CGColor)copyTextColorAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v7)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *);
  int v8;
  CFTypeRef v9;
  CGColor *InitialValue;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v7)
    return 0;
  v8 = v7(figCaptionData, a3, *MEMORY[0x1E0CA35E8], *MEMORY[0x1E0C9AE00], &cf, a4);
  v9 = cf;
  if (v8)
  {
    InitialValue = 0;
    if (!cf)
      return InitialValue;
    goto LABEL_4;
  }
  InitialValue = (CGColor *)FigCaptionDynamicStyleGetInitialValue();
  CGColorRetain(InitialValue);
  v9 = cf;
  if (cf)
LABEL_4:
    CFRelease(v9);
  return InitialValue;
}

- (CGColor)copyBackgroundColorAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v7)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *);
  int v8;
  CFTypeRef v9;
  CGColor *InitialValue;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v7)
    return 0;
  v8 = v7(figCaptionData, a3, *MEMORY[0x1E0CA3558], *MEMORY[0x1E0C9AE00], &cf, a4);
  v9 = cf;
  if (v8)
  {
    InitialValue = 0;
    if (!cf)
      return InitialValue;
    goto LABEL_4;
  }
  InitialValue = (CGColor *)FigCaptionDynamicStyleGetInitialValue();
  CGColorRetain(InitialValue);
  v9 = cf;
  if (cf)
LABEL_4:
    CFRelease(v9);
  return InitialValue;
}

- (AVCaptionFontWeight)fontWeightAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  OpaqueFigCaptionData *figCaptionData;
  unsigned int (*v7)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *);
  AVCaptionFontWeight v8;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v7 || v7(figCaptionData, index, *MEMORY[0x1E0CA35A0], *MEMORY[0x1E0C9AE00], &cf, outRange))
  {
    v8 = AVCaptionFontWeightUnknown;
  }
  else
  {
    FigCaptionDynamicStyleGetInitialValue();
    if (FigCFEqual())
      v8 = AVCaptionFontWeightNormal;
    else
      v8 = 2 * (FigCFEqual() != 0);
  }
  if (cf)
    CFRelease(cf);
  return v8;
}

- (AVCaptionFontStyle)fontStyleAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  OpaqueFigCaptionData *figCaptionData;
  unsigned int (*v7)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *);
  AVCaptionFontStyle v8;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v7 || v7(figCaptionData, index, *MEMORY[0x1E0CA3580], *MEMORY[0x1E0C9AE00], &cf, outRange))
  {
    v8 = AVCaptionFontStyleUnknown;
  }
  else
  {
    FigCaptionDynamicStyleGetInitialValue();
    if (FigCFEqual())
      v8 = AVCaptionFontStyleNormal;
    else
      v8 = 2 * (FigCFEqual() != 0);
  }
  if (cf)
    CFRelease(cf);
  return v8;
}

- (AVCaptionDecoration)decorationAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  OpaqueFigCaptionData *figCaptionData;
  unsigned int (*v7)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *);
  const __CFNumber *InitialValue;
  AVCaptionDecoration v10;
  CFTypeRef cf;

  v10 = 0;
  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v7)
  {
    if (!v7(figCaptionData, index, *MEMORY[0x1E0CA3560], *MEMORY[0x1E0C9AE00], &cf, outRange))
    {
      InitialValue = (const __CFNumber *)FigCaptionDynamicStyleGetInitialValue();
      if (InitialValue)
        CFNumberGetValue(InitialValue, kCFNumberNSIntegerType, &v10);
    }
  }
  if (cf)
    CFRelease(cf);
  return v10;
}

- (AVCaptionTextCombine)textCombineAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v9)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *);
  int v10;
  CFTypeRef v11;
  BOOL v12;
  AVCaptionTextCombine v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v9 = *(uint64_t (**)(OpaqueFigCaptionData *, NSInteger, _QWORD, _QWORD, CFTypeRef *, NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v9)
    goto LABEL_7;
  v10 = v9(figCaptionData, index, *MEMORY[0x1E0CA35F0], *MEMORY[0x1E0C9AE00], &cf, outRange);
  v11 = cf;
  if (v10)
    v12 = 1;
  else
    v12 = cf == 0;
  if (v12)
  {
    v13 = AVCaptionTextCombineNone;
    if (!cf)
      return v13;
    goto LABEL_9;
  }
  FigCaptionDynamicStyleGetInitialValue();
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      v13 = AVCaptionTextCombineAll;
    }
    else if (FigCFEqual())
    {
      v13 = AVCaptionTextCombineOneDigit;
    }
    else if (FigCFEqual())
    {
      v13 = AVCaptionTextCombineTwoDigits;
    }
    else if (FigCFEqual())
    {
      v13 = AVCaptionTextCombineThreeDigits;
    }
    else
    {
      if (!FigCFEqual())
      {
        v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("textCombine value is unrecognizable; it is a programming error."),
                          v15,
                          v16,
                          v17,
                          v18,
                          v19,
                          v21),
                        0);
        objc_exception_throw(v20);
      }
      v13 = AVCaptionTextCombineFourDigits;
    }
  }
  else
  {
LABEL_7:
    v13 = AVCaptionTextCombineNone;
  }
  v11 = cf;
  if (cf)
LABEL_9:
    CFRelease(v11);
  return v13;
}

- (id)rubyTextAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  OpaqueFigCaptionData *figCaptionData;
  uint64_t (*v7)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *);
  int v8;
  CFTypeRef v9;
  BOOL v10;
  AVCaptionRuby *v11;
  AVCaptionRuby *v12;
  CFTypeRef cf;

  cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  v7 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, _QWORD, _QWORD, CFTypeRef *, _NSRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v7)
  {
    v8 = v7(figCaptionData, a3, *MEMORY[0x1E0CA35E0], *MEMORY[0x1E0C9AE00], &cf, a4);
    v9 = cf;
    if (v8)
      v10 = 1;
    else
      v10 = cf == 0;
    if (!v10)
    {
      v11 = [AVCaptionRuby alloc];
      v12 = -[AVCaptionRuby initWithFigCaptionData:](v11, "initWithFigCaptionData:", cf);
      v9 = cf;
      if (!cf)
        return v12;
      goto LABEL_10;
    }
    v12 = 0;
    if (cf)
LABEL_10:
      CFRelease(v9);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (AVCaptionAnimation)animation
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  BOOL v6;
  int v7;
  AVCaptionAnimation v8;
  CFTypeRef cf1;

  cf1 = 0;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CA3300], *MEMORY[0x1E0C9AE00], &cf1);
  v5 = cf1;
  if (v4)
    v6 = 1;
  else
    v6 = cf1 == 0;
  if (v6 || (v7 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0CA3268]), v5 = cf1, v7))
  {
    v8 = AVCaptionAnimationNone;
    if (!v5)
      return v8;
    goto LABEL_11;
  }
  v8 = (unint64_t)(CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0CA3260]) != 0);
  v5 = cf1;
  if (cf1)
LABEL_11:
    CFRelease(v5);
  return v8;
}

- (AVCaptionTextAlignment)textAlignment
{
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const void *InitialValue;
  const void *v7;
  AVCaptionTextAlignment v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v5
    && !v5(CMBaseObject, *MEMORY[0x1E0CA3378], *MEMORY[0x1E0C9AE00], &cf)
    && (InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue()) != 0
    && (v7 = InitialValue, !CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E0CA3670])))
  {
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0CA3658]))
    {
      v8 = AVCaptionTextAlignmentEnd;
    }
    else if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0CA3650]))
    {
      v8 = AVCaptionTextAlignmentCenter;
    }
    else if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0CA3660]))
    {
      v8 = AVCaptionTextAlignmentLeft;
    }
    else
    {
      if (!CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0CA3668]))
      {
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("textAlignment value is unrecognizable; it is a programming error."),
                          v10,
                          v11,
                          v12,
                          v13,
                          v14,
                          v16),
                        0);
        objc_exception_throw(v15);
      }
      v8 = AVCaptionTextAlignmentRight;
    }
  }
  else
  {
    v8 = AVCaptionTextAlignmentStart;
  }
  if (cf)
    CFRelease(cf);
  return v8;
}

@end
