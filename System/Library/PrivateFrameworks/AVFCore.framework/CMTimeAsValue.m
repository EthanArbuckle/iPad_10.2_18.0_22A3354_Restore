@implementation CMTimeAsValue

+ (id)valueWithCMTime:(id *)a3
{
  uint64_t v4;
  int64_t var3;

  v4 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  var3 = a3->var3;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0;
  *(_QWORD *)(v4 + 24) = var3;
  return (id)v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeValue
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)getValue:(void *)a3
{
  int64_t epoch;

  epoch = self->_time.epoch;
  *(_OWORD *)a3 = *(_OWORD *)&self->_time.value;
  *((_QWORD *)a3 + 2) = epoch;
}

- (const)objCType
{
  return "{?=qiIq}";
}

- (float)floatValue
{
  $95D729B680665BEAEFA1D6FCA8238556 time;

  time = self->_time;
  return CMTimeGetSeconds((CMTime *)&time);
}

- (double)doubleValue
{
  $95D729B680665BEAEFA1D6FCA8238556 time;

  time = self->_time;
  return CMTimeGetSeconds((CMTime *)&time);
}

- (char)charValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "charValue");
}

- (unsigned)unsignedCharValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedCharValue");
}

- (signed)shortValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "shortValue");
}

- (unsigned)unsignedShortValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedShortValue");
}

- (int)intValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "intValue");
}

- (unsigned)unsignedIntValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedIntValue");
}

- (int64_t)longValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "longValue");
}

- (unint64_t)unsignedLongValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedLongValue");
}

- (int64_t)longLongValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "longLongValue");
}

- (unint64_t)unsignedLongLongValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedLongLongValue");
}

- (BOOL)BOOLValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "BOOLValue");
}

- (int64_t)integerValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "integerValue");
}

- (unint64_t)unsignedIntegerValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CMTimeAsValue doubleValue](self, "doubleValue");
  return objc_msgSend((id)objc_msgSend(v2, "numberWithDouble:"), "unsignedIntegerValue");
}

- (id)description
{
  void *v2;
  const __CFAllocator *v3;
  CMTime time;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[CMTimeAsValue CMTimeValue](self, "CMTimeValue");
  else
    memset(&time, 0, sizeof(time));
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("CMTime: %@"), (id)CMTimeCopyDescription(v3, &time));
}

- (BOOL)isEqualToValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  $95D729B680665BEAEFA1D6FCA8238556 *p_time;
  $95D729B680665BEAEFA1D6FCA8238556 v9;
  CMTime time2;
  uint64_t v11;
  uint64_t v12;

  if (self == a3)
    return 1;
  v11 = v3;
  v12 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  p_time = &self->_time;
  if (a3)
    objc_msgSend(a3, "CMTimeValue");
  else
    memset(&time2, 0, sizeof(time2));
  v9 = *p_time;
  return CMTimeCompare((CMTime *)&v9, &time2) == 0;
}

- (unint64_t)hash
{
  $95D729B680665BEAEFA1D6FCA8238556 time;

  time = self->_time;
  return CMTimeHash((CMTime *)&time);
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v5;
  int64_t epoch;

  if (NSShouldRetainWithZone(self, a3))
    return self;
  v5 = *(_OWORD *)&self->_time.value;
  epoch = self->_time.epoch;
  return +[CMTimeAsValue valueWithCMTime:](CMTimeAsValue, "valueWithCMTime:", &v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeAsValue)initWithCoder:(id)a3
{
  char *v6;
  CMTimeAsValue *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v14);
  }
  v17.receiver = self;
  v17.super_class = (Class)CMTimeAsValue;
  v6 = -[CMTimeAsValue init](&v17, sel_init);
  if (v6)
  {
    if (a3)
    {
      objc_msgSend(a3, "decodeCMTimeForKey:", CFSTR("CMTime"));
    }
    else
    {
      v15 = 0uLL;
      v16 = 0;
    }
    *((_QWORD *)v6 + 3) = v16;
    *(_OWORD *)(v6 + 8) = v15;
  }
  return (CMTimeAsValue *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  int64_t epoch;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v11);
  }
  v12 = *(_OWORD *)&self->_time.value;
  epoch = self->_time.epoch;
  objc_msgSend(a3, "encodeCMTime:forKey:", &v12, CFSTR("CMTime"));
}

@end
