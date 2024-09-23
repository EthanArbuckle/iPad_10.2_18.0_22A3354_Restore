@implementation AVCaptionLength

- (AVCaptionLength)init
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
  v6 = NSStringFromSelector(sel_initWithCellCount_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCaptionLength)initWithCellCount:(int64_t)a3
{
  AVCaptionLength *v4;
  AVCaptionLengthInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptionLength;
  v4 = -[AVCaptionLength init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptionLengthInternal);
    v4->_internal = v5;
    if (v5)
    {
      v5->cellCount = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVCaptionLength)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("AVCaptionLengthArchiveKeyCellCount")) & 1) != 0)
    return -[AVCaptionLength initWithCellCount:](self, "initWithCellCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("AVCaptionLengthArchiveKeyCellCount")));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", 1, CFSTR("AVCaptionLengthArchiveKeyVersion"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionLength numberOfCells](self, "numberOfCells"), CFSTR("AVCaptionLengthArchiveKeyCellCount"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionLength;
  -[AVCaptionLength dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVCaptionLength numberOfCells](self, "numberOfCells");
  return v5 == objc_msgSend(a3, "numberOfCells");
}

- (int64_t)unitType
{
  return 0;
}

- (int64_t)numberOfCells
{
  return self->_internal->cellCount;
}

@end
