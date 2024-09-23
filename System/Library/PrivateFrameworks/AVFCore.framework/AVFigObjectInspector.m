@implementation AVFigObjectInspector

+ (void)initialize
{
  objc_opt_class();
}

- (unsigned)_BOOLeanForProperty:(__CFString *)a3
{
  void *v3;
  const void *v4;
  Boolean Value;

  v3 = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (v3)
  {
    v4 = v3;
    Value = CFBooleanGetValue((CFBooleanRef)v3);
    CFRelease(v4);
    LOBYTE(v3) = Value;
  }
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3
{
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    v4 = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:defaultValue:](self, "_timeForProperty:defaultValue:", a4, &v4);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3 defaultValue:(__CFString *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  CMTime v8;

  *retstr = *a5;
  result = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a4);
  if (result)
  {
    v7 = result;
    CMTimeMakeFromDictionary(&v8, (CFDictionaryRef)result);
    *(CMTime *)retstr = v8;
    CFRelease(v7);
  }
  return result;
}

- (id)_nonNilArrayForProperty:(__CFString *)a3
{
  id result;

  result = -[AVFigObjectInspector _arrayForProperty:](self, "_arrayForProperty:", a3);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (id)_tollFreeBridgedObjectForProperty:(__CFString *)a3
{
  return -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
}

- (id)_nonNilDictionaryForProperty:(__CFString *)a3
{
  id result;

  result = -[AVFigObjectInspector _dictionaryForProperty:](self, "_dictionaryForProperty:", a3);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  return result;
}

- (int)_SInt32ForProperty:(__CFString *)a3 defaultValue:(int)a4
{
  int v4;
  void *v5;
  const void *v6;
  int valuePtr;

  v4 = a4;
  valuePtr = a4;
  v5 = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (v5)
  {
    v6 = v5;
    CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v6);
    return valuePtr;
  }
  return v4;
}

- (float)_floatForProperty:(__CFString *)a3 defaultValue:(float)a4
{
  float v4;
  void *v5;
  const void *v6;
  float valuePtr;

  v4 = a4;
  valuePtr = a4;
  v5 = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (v5)
  {
    v6 = v5;
    CFNumberGetValue((CFNumberRef)v5, kCFNumberFloat32Type, &valuePtr);
    CFRelease(v6);
    return valuePtr;
  }
  return v4;
}

- (int)_SInt32ForProperty:(__CFString *)a3
{
  return -[AVFigObjectInspector _SInt32ForProperty:defaultValue:](self, "_SInt32ForProperty:defaultValue:", a3, 0);
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)_timeRangeForProperty:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  $1CE2C3FC342086196D07C2B4E8C70800 *result;
  $1CE2C3FC342086196D07C2B4E8C70800 *v8;
  __int128 v9;
  CMTimeRange v10;

  v5 = MEMORY[0x1E0CA2E40];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  result = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a4);
  if (result)
  {
    v8 = result;
    CMTimeRangeMakeFromDictionary(&v10, (CFDictionaryRef)result);
    v9 = *(_OWORD *)&v10.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v10.start.value;
    *(_OWORD *)&retstr->var0.var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v10.duration.timescale;
    CFRelease(v8);
  }
  return result;
}

- (float)_floatForProperty:(__CFString *)a3
{
  double v3;
  float result;

  LODWORD(v3) = 0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", a3, v3);
  return result;
}

- (signed)_SInt16ForProperty:(__CFString *)a3
{
  void *v3;
  const void *v4;
  signed __int16 valuePtr;

  valuePtr = 0;
  v3 = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (!v3)
    return 0;
  v4 = v3;
  CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt16Type, &valuePtr);
  CFRelease(v4);
  return valuePtr;
}

- (int64_t)_longLongForProperty:(__CFString *)a3
{
  int64_t result;
  const void *v4;
  int64_t v5;

  result = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (result)
  {
    v4 = (const void *)result;
    v5 = objc_msgSend((id)result, "longLongValue");
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (CGSize)_sizeForProperty:(__CFString *)a3 defaultValue:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v6;
  const void *v7;
  double v8;
  double v9;
  CGSize v10;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v10 = a4;
  v6 = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a3);
  if (v6)
  {
    v7 = v6;
    CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v6, &v10);
    CFRelease(v7);
    width = v10.width;
    height = v10.height;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_sizeForProperty:(__CFString *)a3
{
  double v3;
  double v4;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:defaultValue:](self, "_sizeForProperty:defaultValue:", a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGAffineTransform)_affineTransformForProperty:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  CGAffineTransform *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  result = -[AVFigObjectInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", a4);
  if (result)
  {
    v8 = result;
    FigGetCGAffineTransformFrom3x3MatrixArray();
    *(_OWORD *)&retstr->a = v9;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = v11;
    CFRelease(v8);
  }
  return result;
}

@end
