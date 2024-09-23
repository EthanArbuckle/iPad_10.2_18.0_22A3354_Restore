@implementation AVTimeFormatter

- (void)setFormatTemplate:(double)a3
{
  self->_internal->formatTemplate = a3;
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if ((unint64_t)a3 > 3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVTimeFormatter setStyle:]: unsupported style"), v3, v4, v5, v6, v7, v9), 0);
    objc_exception_throw(v8);
  }
  self->_internal->style = a3;
}

- (AVTimeFormatter)init
{
  AVTimeFormatter *v2;
  AVTimeFormatterInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTimeFormatter;
  v2 = -[AVTimeFormatter init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVTimeFormatterInternal);
    v2->_internal = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_internal->style = 0;
      v2->_internal->isFullWidth = 0;
      v2->_internal->formatTemplate = 0.0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)stringFromTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  const void *v7;
  __int128 v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  unsigned int v20;
  char v21;
  double v22;
  char v23;
  unsigned int v24;
  char v25;
  char v26;
  char v27;
  char v28;
  int64_t v29;
  char v30;
  char v31;
  _BOOL4 v32;
  char v33;
  char v34;
  __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  NSString *cachedDateFormatterFormat;
  double v41;
  int64_t v42;
  int64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  const __CFString *v50;
  const __CFString *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSString *v56;
  uint64_t v57;
  NSString *v58;
  char v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  int8x16_t v64;
  double v65;

  v64 = *(int8x16_t *)&a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  if ((-[NSLocale isEqual:](self->_internal->locale, "isEqual:", v5) & 1) == 0)
  {
    -[AVTimeFormatter setLocale:](self, "setLocale:", v5);
    -[AVTimeFormatter setCachedDateFormatterFormat:](self, "setCachedDateFormatterFormat:", 0);
    -[AVTimeFormatter setCachedDateFormatterTemplate:](self, "setCachedDateFormatterTemplate:", 0);
    -[AVTimeFormatter setNumberFormatterWithOneMinimumIntegerDigits:](self, "setNumberFormatterWithOneMinimumIntegerDigits:", objc_alloc_init(MEMORY[0x1E0CB37F0]));
    -[NSNumberFormatter setLocale:](self->_internal->numberFormatterWithOneMinimumIntegerDigits, "setLocale:", self->_internal->locale);
    -[NSNumberFormatter setMinimumIntegerDigits:](self->_internal->numberFormatterWithOneMinimumIntegerDigits, "setMinimumIntegerDigits:", 1);
    -[NSNumberFormatter setNumberStyle:](self->_internal->numberFormatterWithOneMinimumIntegerDigits, "setNumberStyle:", 0);
    -[AVTimeFormatter setNumberFormatterWithTwoMinimumIntegerDigits:](self, "setNumberFormatterWithTwoMinimumIntegerDigits:", objc_alloc_init(MEMORY[0x1E0CB37F0]));
    -[NSNumberFormatter setLocale:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "setLocale:", self->_internal->locale);
    -[NSNumberFormatter setMinimumIntegerDigits:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "setMinimumIntegerDigits:", 2);
    -[NSNumberFormatter setNumberStyle:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "setNumberStyle:", 0);
    self->_internal->isRightToLeft = 0;
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)_CFLocaleCopyNumberingSystemForLocaleIdentifier();
    if (v6)
    {
      v7 = v6;
      self->_internal->isRightToLeft = objc_msgSend(v6, "isEqualToString:", CFSTR("arab"));
      CFRelease(v7);
    }
  }
  -[AVTimeFormatter formatTemplate](self, "formatTemplate");
  v63 = v8;
  v9 = -[AVTimeFormatter style](self, "style");
  v15.i64[1] = *((_QWORD *)&v63 + 1);
  v16 = *(double *)v64.i64;
  v17 = ceil(fabs(*(double *)&v63) + -0.5);
  switch(v9)
  {
    case 0:
    case 1:
      *(double *)v15.i64 = ceil(fabs(*(double *)v64.i64) + -0.5);
      goto LABEL_7;
    case 2:
      *(double *)v15.i64 = floor(fabs(*(double *)v64.i64) + 0.5);
LABEL_7:
      v18.f64[0] = NAN;
      v18.f64[1] = NAN;
      *(_QWORD *)&v16 = vbslq_s8((int8x16_t)vnegq_f64(v18), v15, v64).u64[0];
      break;
    case 3:
      break;
    default:
      v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVTimeFormatter stringFromTimeInterval:]: unsupported style"), v10, v11, v12, v13, v14, v62), 0);
      objc_exception_throw(v61);
  }
  v19 = fabs(v16);
  if (v19 <= 4294967300.0 && (v20 = v19, v19 >> 5 <= 0x464))
  {
    if (v20 <= 0xE0F)
    {
      if (v20 <= 0x257)
      {
        v60 = 3;
        if (v20 <= 9)
          v60 = 1;
        if (v20 <= 0x3B)
          v21 = v60;
        else
          v21 = 7;
      }
      else
      {
        v21 = 15;
      }
    }
    else
    {
      v21 = 31;
    }
  }
  else
  {
    v21 = 63;
  }
  v65 = v16;
  v22 = fabs(v17);
  if (v22 <= 4294967300.0)
  {
    v24 = v22;
    v25 = 15;
    v26 = 7;
    v27 = 3;
    if (v22 <= 9)
      v27 = 1;
    if (v24 <= 0x3B)
      v26 = v27;
    if (v24 <= 0x257)
      v25 = v26;
    if (v24 <= 0xE0F)
      v23 = v25;
    else
      v23 = 31;
    if (v22 >> 5 > 0x464)
      v23 = 63;
  }
  else
  {
    v23 = 63;
  }
  v28 = v23 | v21;
  v29 = -[AVTimeFormatter style](self, "style");
  v30 = 7;
  if (v29 == 3)
    v30 = 71;
  v31 = v30 | v28;
  v32 = -[AVTimeFormatter isFullWidth](self, "isFullWidth");
  v33 = (2 * v31) & 0x28;
  if (!v32)
    v33 = 0;
  v34 = v33 | v31;
  v35 = &stru_1E303A378;
  if ((v28 & 0x10) != 0)
  {
    v36 = CFSTR("H");
    if ((v34 & 0x20) == 0)
      v36 = &stru_1E303A378;
    v35 = (__CFString *)objc_msgSend(&stru_1E303A378, "stringByAppendingFormat:", CFSTR("%@H"), v36);
  }
  v37 = CFSTR("m");
  if ((v34 & 8) == 0)
    v37 = &stru_1E303A378;
  v38 = (void *)objc_msgSend((id)-[__CFString stringByAppendingFormat:](v35, "stringByAppendingFormat:", CFSTR("%@m"), v37), "stringByAppendingFormat:", CFSTR("%@s"), CFSTR("s"));
  v39 = (uint64_t)v38;
  if (v29 == 3)
    v39 = objc_msgSend(v38, "stringByAppendingString:", CFSTR("SS"));
  if ((-[NSString isEqual:](self->_internal->cachedDateFormatterTemplate, "isEqual:", v39) & 1) == 0)
  {
    -[AVTimeFormatter setCachedDateFormatterFormat:](self, "setCachedDateFormatterFormat:", objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v39, 0, self->_internal->locale));
    -[AVTimeFormatter setCachedDateFormatterTemplate:](self, "setCachedDateFormatterTemplate:", v39);
  }
  cachedDateFormatterFormat = self->_internal->cachedDateFormatterFormat;
  v41 = v65;
  if ((v65 >= 0.0 || (v42 = -[AVTimeFormatter style](self, "style", v65), v41 = v65, v42 == 2))
    && (v41 < 0.0 || (v43 = -[AVTimeFormatter style](self, "style"), v41 = v65, v43 != 2)))
  {
    if (v41 >= 0.0 || -[AVTimeFormatter style](self, "style") != 2)
      goto LABEL_50;
    v44 = CFSTR("%@+%@");
  }
  else
  {
    v44 = CFSTR("%@−%@");
  }
  if (self->_internal->isRightToLeft)
    v45 = CFSTR("\u200F");
  else
    v45 = CFSTR("\u200E");
  cachedDateFormatterFormat = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v44, v41, v45, cachedDateFormatterFormat);
LABEL_50:
  v46 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](cachedDateFormatterFormat, "stringByReplacingOccurrencesOfString:withString:", CFSTR("a"), &stru_1E303A378), "stringByReplacingOccurrencesOfString:withString:", CFSTR("b"), &stru_1E303A378), "stringByReplacingOccurrencesOfString:withString:", CFSTR("B"), &stru_1E303A378);
  v47 = -[NSString stringByTrimmingCharactersInSet:](v46, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
  v48 = v47;
  if (v19 > 4294967300.0)
  {
    v49 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR("j"), CFSTR("−")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("J"), CFSTR("−")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("C"), CFSTR("−")), "stringByReplacingOccurrencesOfString:withString:",
                      CFSTR("k"),
                      CFSTR("−")),
                    "stringByReplacingOccurrencesOfString:withString:",
                    CFSTR("K"),
                    CFSTR("−")),
                  "stringByReplacingOccurrencesOfString:withString:",
                  CFSTR("h"),
                  CFSTR("−")),
                "stringByReplacingOccurrencesOfString:withString:",
                CFSTR("H"),
                CFSTR("−")),
              "stringByReplacingOccurrencesOfString:withString:",
              CFSTR("m"),
              CFSTR("−")),
            "stringByReplacingOccurrencesOfString:withString:",
            CFSTR("s"),
            CFSTR("−"));
    v50 = CFSTR("S");
    v51 = CFSTR("−");
    return -[NSString stringByReplacingOccurrencesOfString:withString:](v49, "stringByReplacingOccurrencesOfString:withString:", v50, v51);
  }
  v52 = v65;
  if ((v28 & 0x10) != 0)
  {
    v53 = 72;
    if ((v34 & 0x20) == 0)
      v53 = 64;
    v54 = objc_msgSend(*(id *)((char *)&self->_internal->super.isa + v53), "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v65));
    if (v54)
      v48 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("j"), CFSTR("H")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("J"), CFSTR("H")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("C"), CFSTR("H")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("k"),
                      CFSTR("H")),
                    "stringByReplacingOccurrencesOfString:withString:",
                    CFSTR("K"),
                    CFSTR("H")),
                  "stringByReplacingOccurrencesOfString:withString:",
                  CFSTR("h"),
                  CFSTR("H")),
                "stringByReplacingOccurrencesOfString:withString:",
                CFSTR("HH"),
                v54),
              "stringByReplacingOccurrencesOfString:withString:",
              CFSTR("H"),
              v54);
  }
  v55 = objc_msgSend(*(id *)((char *)&self->_internal->super.isa + (v34 & 8 | 0x40)), "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19 % 0xE10 / 0x3C, v52));
  if (v55)
    v48 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mm"), v55), "stringByReplacingOccurrencesOfString:withString:", CFSTR("m"), v55);
  v56 = -[NSNumberFormatter stringFromNumber:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19 % 0x3C));
  if (v56)
    v48 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ss"), v56), "stringByReplacingOccurrencesOfString:withString:", CFSTR("s"), v56);
  if (v29 == 3)
  {
    LODWORD(v57) = vcvtmd_u64_f64((v19 - floor(v19)) * 100.0);
    v58 = -[NSNumberFormatter stringFromNumber:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57));
    if (v58)
    {
      v51 = (const __CFString *)v58;
      v50 = CFSTR("SS");
      v49 = v48;
      return -[NSString stringByReplacingOccurrencesOfString:withString:](v49, "stringByReplacingOccurrencesOfString:withString:", v50, v51);
    }
  }
  return v48;
}

- (int64_t)style
{
  return self->_internal->style;
}

- (void)setCachedDateFormatterTemplate:(id)a3
{
  NSString *cachedDateFormatterTemplate;

  cachedDateFormatterTemplate = self->_internal->cachedDateFormatterTemplate;
  if (cachedDateFormatterTemplate != a3)
  {

    self->_internal->cachedDateFormatterTemplate = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setCachedDateFormatterFormat:(id)a3
{
  NSString *cachedDateFormatterFormat;

  cachedDateFormatterFormat = self->_internal->cachedDateFormatterFormat;
  if (cachedDateFormatterFormat != a3)
  {

    self->_internal->cachedDateFormatterFormat = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setNumberFormatterWithTwoMinimumIntegerDigits:(id)a3
{
  NSNumberFormatter *numberFormatterWithTwoMinimumIntegerDigits;

  numberFormatterWithTwoMinimumIntegerDigits = self->_internal->numberFormatterWithTwoMinimumIntegerDigits;
  if (numberFormatterWithTwoMinimumIntegerDigits != a3)
  {

    self->_internal->numberFormatterWithTwoMinimumIntegerDigits = (NSNumberFormatter *)objc_msgSend(a3, "copy");
  }
}

- (void)setNumberFormatterWithOneMinimumIntegerDigits:(id)a3
{
  NSNumberFormatter *numberFormatterWithOneMinimumIntegerDigits;

  numberFormatterWithOneMinimumIntegerDigits = self->_internal->numberFormatterWithOneMinimumIntegerDigits;
  if (numberFormatterWithOneMinimumIntegerDigits != a3)
  {

    self->_internal->numberFormatterWithOneMinimumIntegerDigits = (NSNumberFormatter *)objc_msgSend(a3, "copy");
  }
}

- (void)setLocale:(id)a3
{
  NSLocale *locale;

  locale = self->_internal->locale;
  if (locale != a3)
  {

    self->_internal->locale = (NSLocale *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)isFullWidth
{
  return self->_internal->isFullWidth;
}

- (double)formatTemplate
{
  return self->_internal->formatTemplate;
}

- (AVTimeFormatter)initWithCoder:(id)a3
{
  AVTimeFormatter *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTimeFormatter;
  v4 = -[AVTimeFormatter initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_internal->style = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("MediaUIStyle"));
    v4->_internal->isFullWidth = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("MediaUIFullWidth"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("MediaUIFormatTemplate"));
    v4->_internal->formatTemplate = v5;
  }
  return v4;
}

- (void)dealloc
{
  AVTimeFormatterInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVTimeFormatter;
  -[AVTimeFormatter dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTimeFormatter;
  -[AVTimeFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_internal->style, CFSTR("MediaUIStyle"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_internal->isFullWidth, CFSTR("MediaUIFullWidth"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("MediaUIFormatTemplate"), self->_internal->formatTemplate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTimeFormatter *v4;

  v4 = objc_alloc_init(AVTimeFormatter);
  -[AVTimeFormatter setStyle:](v4, "setStyle:", self->_internal->style);
  -[AVTimeFormatter setFullWidth:](v4, "setFullWidth:", self->_internal->isFullWidth);
  -[AVTimeFormatter setFormatTemplate:](v4, "setFormatTemplate:", self->_internal->formatTemplate);
  return v4;
}

- (id)stringFromCMTime:(id *)a3
{
  CMTime v4;

  v4 = *(CMTime *)a3;
  return -[AVTimeFormatter stringFromSeconds:](self, "stringFromSeconds:", CMTimeGetSeconds(&v4));
}

- (id)stringForObjectValue:(id)a3
{
  double v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "doubleValue");
  else
    v5 = NAN;
  return -[AVTimeFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:", v5);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (void)setFullWidth:(BOOL)a3
{
  self->_internal->isFullWidth = a3;
}

- (id)locale
{
  return self->_internal->locale;
}

- (BOOL)isRightToLeft
{
  return self->_internal->isRightToLeft;
}

- (void)setIsRightToLeft:(BOOL)a3
{
  self->_internal->isRightToLeft = a3;
}

- (id)cachedDateFormatterFormat
{
  return self->_internal->cachedDateFormatterFormat;
}

- (id)cachedDateFormatterTemplate
{
  return self->_internal->cachedDateFormatterTemplate;
}

- (id)numberFormatterWithOneMinimumIntegerDigits
{
  return self->_internal->numberFormatterWithOneMinimumIntegerDigits;
}

- (id)numberFormatterWithTwoMinimumIntegerDigits
{
  return self->_internal->numberFormatterWithTwoMinimumIntegerDigits;
}

- (void)stringFromTimeInterval:.cold.1()
{
  __assert_rtn("AVCrackTime", "AVTimeFormatter.m", 124, "time >= 0.0");
}

@end
