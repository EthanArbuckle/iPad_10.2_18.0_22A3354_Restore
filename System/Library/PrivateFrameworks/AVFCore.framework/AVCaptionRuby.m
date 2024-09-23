@implementation AVCaptionRuby

- (AVCaptionRuby)init
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
  v6 = NSStringFromSelector(sel_initWithText_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCaptionRuby)initWithText:(NSString *)text
{
  AVCaptionRuby *v4;
  AVCaptionRubyInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptionRuby;
  v4 = -[AVCaptionRuby init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptionRubyInternal);
    v4->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_internal->text = (NSString *)-[NSString copy](text, "copy");
      v4->_internal->position = 0;
      v4->_internal->alignment = 2;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVCaptionRuby)initWithText:(NSString *)text position:(AVCaptionRubyPosition)position alignment:(AVCaptionRubyAlignment)alignment
{
  AVCaptionRuby *result;

  result = -[AVCaptionRuby initWithText:](self, "initWithText:", text);
  if (result)
  {
    result->_internal->position = position;
    result->_internal->alignment = alignment;
  }
  return result;
}

- (AVCaptionRuby)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVCaptionRubyArchiveKeyText"));
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionRubyArchiveKeyPosition")))
      v7 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionRubyArchiveKeyPosition"));
    else
      v7 = 0;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionRubyArchiveKeyAlignment")))
      v9 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionRubyArchiveKeyAlignment"));
    else
      v9 = 2;
    return -[AVCaptionRuby initWithText:position:alignment:](self, "initWithText:position:alignment:", v6, v7, v9);
  }
  else
  {

    return 0;
  }
}

- (AVCaptionRuby)initWithFigCaptionData:(OpaqueFigCaptionData *)a3
{
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v9;
  unsigned int (*v10)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  AVCaptionRuby *v11;
  _BOOL8 v12;
  uint64_t v13;
  CFTypeRef cf;
  CFTypeRef v16;
  CFTypeRef v17;

  v16 = 0;
  v17 = 0;
  cf = 0;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v5
    || (v6 = *MEMORY[0x1E0C9AE00], v5(CMBaseObject, *MEMORY[0x1E0CA3370], *MEMORY[0x1E0C9AE00], &v17))
    || (v7 = FigCaptionDataGetCMBaseObject(),
        (v8 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48)) == 0)
    || v8(v7, *MEMORY[0x1E0CA3350], v6, &v16)
    || (v9 = FigCaptionDataGetCMBaseObject(),
        (v10 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48)) == 0)
    || v10(v9, *MEMORY[0x1E0CA3348], v6, &cf))
  {

    v11 = 0;
  }
  else
  {
    if (v16)
      FigCaptionDynamicStyleGetInitialValue();
    if (cf)
      FigCaptionDynamicStyleGetInitialValue();
    if (FigCFEqual())
      v12 = 0;
    else
      v12 = FigCFEqual() != 0;
    if (FigCFEqual())
    {
      v13 = 0;
    }
    else if (FigCFEqual())
    {
      v13 = 1;
    }
    else if (FigCFEqual())
    {
      v13 = 2;
    }
    else if (FigCFEqual())
    {
      v13 = 3;
    }
    else
    {
      v13 = 2;
    }
    v11 = -[AVCaptionRuby initWithText:position:alignment:](self, "initWithText:position:alignment:", v17, v12, v13);
  }
  if (cf)
    CFRelease(cf);
  if (v16)
    CFRelease(v16);
  if (v17)
    CFRelease(v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", 2, CFSTR("AVCaptionRubyArchiveKeyVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaptionRuby text](self, "text"), CFSTR("AVCaptionRubyArchiveKeyText"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionRuby position](self, "position"), CFSTR("AVCaptionRubyArchiveKeyPosition"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionRuby alignment](self, "alignment"), CFSTR("AVCaptionRubyArchiveKeyAlignment"));
}

- (void)dealloc
{
  AVCaptionRubyInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionRuby;
  -[AVCaptionRuby dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  AVCaptionRubyPosition v5;
  AVCaptionRubyAlignment v6;
  BOOL result;

  if (self == a3)
    return 1;
  objc_opt_class();
  result = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NSString isEqual:](-[AVCaptionRuby text](self, "text"), "isEqual:", objc_msgSend(a3, "text")))
    {
      v5 = -[AVCaptionRuby position](self, "position");
      if (v5 == objc_msgSend(a3, "position"))
      {
        v6 = -[AVCaptionRuby alignment](self, "alignment");
        if (v6 == objc_msgSend(a3, "alignment"))
          return 1;
      }
    }
  }
  return result;
}

- (OpaqueFigCaptionData)copyFigCaptionData
{
  NSString *text;
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, NSString *);
  AVCaptionRubyInternal *internal;
  int64_t position;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, _QWORD, _QWORD);
  uint64_t v14;
  uint64_t (*v15)(uint64_t, _QWORD, _QWORD);

  if (FigCaptionDataCreateMutable())
    return 0;
  text = self->_internal->text;
  CMBaseObject = FigCaptionDataGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x1E0CA3370], text))
    return 0;
  internal = self->_internal;
  position = internal->position;
  if (position == 1)
  {
    v8 = (uint64_t *)MEMORY[0x1E0CA3528];
    goto LABEL_8;
  }
  if (!position)
  {
    v8 = (uint64_t *)MEMORY[0x1E0CA3530];
LABEL_8:
    v9 = *v8;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:
  switch(internal->alignment)
  {
    case 0:
      v10 = (uint64_t *)MEMORY[0x1E0CA3520];
      goto LABEL_17;
    case 1:
      v10 = (uint64_t *)MEMORY[0x1E0CA34F8];
      goto LABEL_17;
    case 2:
      v10 = (uint64_t *)MEMORY[0x1E0CA3508];
      goto LABEL_17;
    case 3:
      v10 = (uint64_t *)MEMORY[0x1E0CA3500];
LABEL_17:
      v11 = *v10;
      if (v9)
        goto LABEL_18;
      goto LABEL_21;
    default:
      v11 = 0;
      if (!v9)
        goto LABEL_21;
LABEL_18:
      if (!FigCaptionDynamicStyleCreate())
      {
        v12 = FigCaptionDataGetCMBaseObject();
        v13 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v13)
        {
          if (!v13(v12, *MEMORY[0x1E0CA3350], 0))
          {
LABEL_21:
            if (v11)
            {
              if (!FigCaptionDynamicStyleCreate())
              {
                v14 = FigCaptionDataGetCMBaseObject();
                v15 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
                if (v15)
                  v15(v14, *MEMORY[0x1E0CA3348], 0);
              }
            }
          }
        }
      }
      break;
  }
  return 0;
}

- (NSString)text
{
  return self->_internal->text;
}

- (AVCaptionRubyPosition)position
{
  return self->_internal->position;
}

- (AVCaptionRubyAlignment)alignment
{
  return self->_internal->alignment;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;

  if (-[AVCaptionRuby position](self, "position"))
  {
    if (-[AVCaptionRuby position](self, "position") == AVCaptionRubyPositionAfter)
      v3 = CFSTR("after");
    else
      v3 = 0;
  }
  else
  {
    v3 = CFSTR("before");
  }
  if (-[AVCaptionRuby alignment](self, "alignment"))
  {
    if (-[AVCaptionRuby alignment](self, "alignment") == AVCaptionRubyAlignmentCenter)
    {
      v4 = CFSTR("center");
    }
    else if (-[AVCaptionRuby alignment](self, "alignment") == AVCaptionRubyAlignmentDistributeSpaceBetween)
    {
      v4 = CFSTR("spaceBetween");
    }
    else if (-[AVCaptionRuby alignment](self, "alignment") == AVCaptionRubyAlignmentDistributeSpaceAround)
    {
      v4 = CFSTR("spaceAround");
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = CFSTR("start");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, text=%@ position=%@ alignment=%@>"), NSStringFromClass(v6), self, -[AVCaptionRuby text](self, "text"), v3, v4);
}

@end
