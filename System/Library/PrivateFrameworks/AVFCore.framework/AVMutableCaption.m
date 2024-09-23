@implementation AVMutableCaption

- (id)copyWithZone:(_NSZone *)a3
{
  AVCaption *v4;
  OpaqueFigCaptionData *v5;
  _OWORD v7[3];

  v4 = [AVCaption alloc];
  v5 = -[AVCaption _figCaptionData](self, "_figCaptionData");
  if (self)
    -[AVMutableCaption timeRange](self, "timeRange");
  else
    memset(v7, 0, sizeof(v7));
  return -[AVCaption initWithFigCaptionData:timeRange:](v4, "initWithFigCaptionData:timeRange:", v5, v7);
}

- (NSString)text
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return -[AVCaption text](&v3, sel_text);
}

- (CMTimeRange)timeRange
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaption;
  return (CMTimeRange *)-[CMTimeRange timeRange](&v4, sel_timeRange);
}

- (void)setText:(NSString *)text
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!text)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"text != nil"), 0);
    objc_exception_throw(v8);
  }
  -[AVCaption _setText:](self, "_setText:");
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  _OWORD v13[3];

  if ((timeRange->start.flags & 0x1D) != 1)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "CMTIME_IS_NUMERIC(timeRange.start)";
    goto LABEL_6;
  }
  if ((timeRange->duration.flags & 0x1D) != 1)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "CMTIME_IS_NUMERIC(timeRange.duration)";
LABEL_6:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  v8 = *(_OWORD *)&timeRange->start.epoch;
  v13[0] = *(_OWORD *)&timeRange->start.value;
  v13[1] = v8;
  v13[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVCaption _setTimeRange:](self, "_setTimeRange:", v13);
}

- (void)setRegion:(AVCaptionRegion *)region
{
  AVCaptionPosition *v6;
  AVCaptionLength *v7;
  AVCaptionRegionScroll v8;
  AVCaptionRegionScroll v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;

  if (region)
  {
    v6 = -[AVCaptionRegion position](region, "position");
    v7 = -[AVCaptionRegion height](region, "height");
    v8 = -[AVCaptionRegion scroll](region, "scroll");
    if (v7)
    {
      v9 = v8;
      if (!-[AVCaptionLength numberOfCells](v7, "numberOfCells"))
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "[height numberOfCells] != 0";
        goto LABEL_19;
      }
      if (-[AVCaptionLength numberOfCells](v7, "numberOfCells") != 1 && v9 != AVCaptionRegionScrollRollUp)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "scroll == AVCaptionRegionScrollRollUp";
        goto LABEL_19;
      }
    }
    if (v6 && !-[AVCaptionPosition unitType](v6, "unitType"))
    {
      if (-[AVCaptionPosition cellX](v6, "cellX") <= 0)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "[position cellX] >= 1";
      }
      else if (-[AVCaptionPosition cellX](v6, "cellX") >= 33)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "[position cellX] <= 32";
      }
      else if (-[AVCaptionPosition cellY](v6, "cellY") <= 0)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "[position cellY] >= 1";
      }
      else
      {
        if (-[AVCaptionPosition cellY](v6, "cellY") < 16)
          goto LABEL_12;
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = "[position cellY] <= 15";
      }
LABEL_19:
      v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)v17), 0);
      objc_exception_throw(v18);
    }
  }
LABEL_12:
  -[AVCaption _setRegion:](self, "_setRegion:", region);
}

- (void)setTextColor:(CGColorRef)color inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!color)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"color != NULL"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setTextColor:inRange:](self, "_setTextColor:inRange:", color, range.location, range.length);
}

- (void)setBackgroundColor:(CGColorRef)color inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!color)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"color != NULL"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setBackgroundColor:inRange:](self, "_setBackgroundColor:inRange:", color, range.location, range.length);
}

- (void)setFontWeight:(AVCaptionFontWeight)fontWeight inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(fontWeight - 1) >= 2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"fontWeight == AVCaptionFontWeightNormal || fontWeight == AVCaptionFontWeightBold"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setFontWeight:inRange:](self, "_setFontWeight:inRange:");
}

- (void)setFontStyle:(AVCaptionFontStyle)fontStyle inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(fontStyle - 1) >= 2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"fontStyle == AVCaptionFontStyleNormal || fontStyle == AVCaptionFontStyleItalic"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setFontStyle:inRange:](self, "_setFontStyle:inRange:");
}

- (void)setDecoration:(AVCaptionDecoration)decoration inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (decoration >= 8)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"(decoration & ~( AVCaptionDecorationNone | AVCaptionDecorationUnderline | AVCaptionDecorationLineThrough | AVCaptionDecorationOverline)) == 0"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setDecoration:inRange:](self, "_setDecoration:inRange:");
}

- (void)setTextCombine:(AVCaptionTextCombine)textCombine inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(textCombine + 1) >= 6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"textCombine == AVCaptionTextCombineNone || textCombine == AVCaptionTextCombineAll || textCombine == AVCaptionTextCombineOneDigit || textCombine == AVCaptionTextCombineTwoDigits || textCombine == AVCaptionTextCombineThreeDigits|| textCombine == AVCaptionTextCombineFourDigits"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setTextCombine:inRange:](self, "_setTextCombine:inRange:");
}

- (void)setRuby:(AVCaptionRuby *)ruby inRange:(NSRange)range
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!ruby)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), range.location, range.length, v4, v5, v6, (uint64_t)"ruby != nil"), 0);
    objc_exception_throw(v7);
  }
  -[AVCaption _setRuby:inRange:](self, "_setRuby:inRange:", ruby, range.location, range.length);
}

- (void)removeTextColorInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setTextColor:inRange:](self, "_setTextColor:inRange:", 0, range.location, range.length);
}

- (void)removeBackgroundColorInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setBackgroundColor:inRange:](self, "_setBackgroundColor:inRange:", 0, range.location, range.length);
}

- (void)removeFontWeightInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setFontWeight:inRange:](self, "_setFontWeight:inRange:", 0, range.location, range.length);
}

- (void)removeFontStyleInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setFontStyle:inRange:](self, "_setFontStyle:inRange:", 0, range.location, range.length);
}

- (void)removeDecorationInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setDecoration:inRange:](self, "_setDecoration:inRange:", 0, range.location, range.length);
}

- (void)removeTextCombineInRange:(NSRange)range
{
  if (range.length)
    -[AVCaption _setTextCombine:inRange:](self, "_setTextCombine:inRange:", 0, range.location, range.length);
}

- (void)removeRuby:(_NSRange)a3
{
  if (a3.length)
    -[AVCaption _setRuby:inRange:](self, "_setRuby:inRange:", 0, a3.location, a3.length);
}

- (AVCaptionAnimation)animation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return -[AVCaption animation](&v3, sel_animation);
}

- (AVCaptionTextAlignment)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return -[AVCaption textAlignment](&v3, sel_textAlignment);
}

@end
