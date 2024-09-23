@implementation AVCaptionPosition

- (AVCaptionPosition)init
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
  v6 = NSStringFromSelector(sel_initWithCellPositionX_andY_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCaptionPosition)initWithCellPositionX:(int64_t)a3 andY:(int64_t)a4
{
  AVCaptionPosition *v6;
  AVCaptionPositionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCaptionPosition;
  v6 = -[AVCaptionPosition init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptionPositionInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->x.cell = a3;
      v6->_internal->y.cell = a4;
      v6->_internal->unitType = 0;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaptionPosition)initWithRelativeToEnclosingRegionX:(float)a3 andY:(float)a4
{
  AVCaptionPosition *v6;
  AVCaptionPositionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCaptionPosition;
  v6 = -[AVCaptionPosition init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptionPositionInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->x.relativeToEnclosingRegion = a3;
      v6->_internal->y.relativeToEnclosingRegion = a4;
      v6->_internal->unitType = 1;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaptionPosition)initWithCoder:(id)a3
{
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;

  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionPositionArchiveKeyCellX"))
    && objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionPositionArchiveKeyCellY")))
  {
    return -[AVCaptionPosition initWithCellPositionX:andY:](self, "initWithCellPositionX:andY:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionPositionArchiveKeyCellX")), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionPositionArchiveKeyCellY")));
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX"))&& objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY")))
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX"));
    v7 = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY"));
    LODWORD(v9) = v8;
    LODWORD(v10) = v7;
    return -[AVCaptionPosition initWithRelativeToEnclosingRegionX:andY:](self, "initWithRelativeToEnclosingRegionX:andY:", v10, v9);
  }
  else
  {

    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t unitType;

  objc_msgSend(a3, "encodeInteger:forKey:", 2, CFSTR("AVCaptionPositionArchiveKeyVersion"));
  unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    -[AVCaptionPosition relativeToEnclosingRegionX](self, "relativeToEnclosingRegionX");
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX"));
    -[AVCaptionPosition relativeToEnclosingRegionY](self, "relativeToEnclosingRegionY");
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY"));
  }
  else if (!unitType)
  {
    objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionPosition cellX](self, "cellX"), CFSTR("AVCaptionPositionArchiveKeyCellX"));
    objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionPosition cellY](self, "cellY"), CFSTR("AVCaptionPositionArchiveKeyCellY"));
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionPosition;
  -[AVCaptionPosition dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int64_t unitType;
  int64_t v6;
  int64_t v7;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    -[AVCaptionPosition relativeToEnclosingRegionX](self, "relativeToEnclosingRegionX");
    v10 = (uint64_t)(float)(v9 * 1000.0);
    objc_msgSend(a3, "relativeToEnclosingRegionX");
    v12 = (uint64_t)(float)(v11 * 1000.0);
    -[AVCaptionPosition relativeToEnclosingRegionY](self, "relativeToEnclosingRegionY");
    v14 = v13;
    objc_msgSend(a3, "relativeToEnclosingRegionY");
    return v10 == v12 && (uint64_t)(float)(v14 * 1000.0) == (uint64_t)(float)(v15 * 1000.0);
  }
  if (unitType)
    return 1;
  v6 = -[AVCaptionPosition cellX](self, "cellX");
  if (v6 == objc_msgSend(a3, "cellX"))
  {
    v7 = -[AVCaptionPosition cellY](self, "cellY");
    if (v7 == objc_msgSend(a3, "cellY"))
      return 1;
  }
  return 0;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[AVCaptionPosition cellX](self, "cellX");
  return -[AVCaptionPosition cellY](self, "cellY") ^ v3;
}

- (int64_t)cellX
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  if (-[AVCaptionPosition unitType](self, "unitType"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeCell"), 0);
    objc_exception_throw(v10);
  }
  return self->_internal->x.cell;
}

- (int64_t)cellY
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  if (-[AVCaptionPosition unitType](self, "unitType"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeCell"), 0);
    objc_exception_throw(v10);
  }
  return self->_internal->y.cell;
}

- (float)relativeToEnclosingRegionX
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  if (-[AVCaptionPosition unitType](self, "unitType") != 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeRelativeToEnclosingRegion"), 0);
    objc_exception_throw(v10);
  }
  return self->_internal->x.relativeToEnclosingRegion;
}

- (float)relativeToEnclosingRegionY
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  if (-[AVCaptionPosition unitType](self, "unitType") != 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeRelativeToEnclosingRegion"), 0);
    objc_exception_throw(v10);
  }
  return self->_internal->y.relativeToEnclosingRegion;
}

- (int64_t)unitType
{
  return self->_internal->unitType;
}

- (id)description
{
  int64_t unitType;
  void *v4;
  const __CFString *v5;
  float v6;
  int64_t v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  int64_t v14;
  double v15;

  unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[AVCaptionPosition relativeToEnclosingRegionX](self, "relativeToEnclosingRegionX");
    *(double *)&v7 = v6;
    -[AVCaptionPosition relativeToEnclosingRegionY](self, "relativeToEnclosingRegionY");
    v14 = v7;
    v15 = v8;
    v5 = CFSTR("relativeToEnclosingRegion=(%4.2f,%4.2f)");
  }
  else
  {
    if (unitType)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v5 = CFSTR("unsupported unit");
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    v14 = -[AVCaptionPosition cellX](self, "cellX");
    v15 = COERCE_DOUBLE(-[AVCaptionPosition cellY](self, "cellY"));
    v5 = CFSTR("cell=(%ld,%ld)");
  }
  v9 = v4;
LABEL_7:
  v10 = objc_msgSend(v9, "stringWithFormat:", v5, v14, *(_QWORD *)&v15);
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v12), self, v10);
}

@end
