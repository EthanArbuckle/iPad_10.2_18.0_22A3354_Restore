@implementation MADVideoRemoveBackgroundRequest

- (MADVideoRemoveBackgroundRequest)init
{
  char *v2;
  MADVideoRemoveBackgroundRequest *v3;
  uint64_t v4;
  uint64_t v5;
  UTType *outputType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MADVideoRemoveBackgroundRequest;
  v2 = -[MADVideoRemoveBackgroundRequest init](&v8, sel_init);
  v3 = (MADVideoRemoveBackgroundRequest *)v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v2 + 11) = *(_QWORD *)(v4 + 16);
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.heics"));
    v5 = objc_claimAutoreleasedReturnValue();
    outputType = v3->_outputType;
    v3->_outputType = (UTType *)v5;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundRequest)initWithCoder:(id)a3
{
  id v4;
  MADVideoRemoveBackgroundRequest *v5;
  uint64_t v6;
  NSNumber *maxDimension;
  uint64_t v8;
  NSNumber *minDimension;
  uint64_t v10;
  NSNumber *maxFileSize;
  uint64_t v12;
  NSValue *instancePoint;
  uint64_t v14;
  UTType *outputType;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *stickerIdentifiers;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MADVideoRemoveBackgroundRequest;
  v5 = -[MADVideoRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxDimension"));
    v6 = objc_claimAutoreleasedReturnValue();
    maxDimension = v5->_maxDimension;
    v5->_maxDimension = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MinDimension"));
    v8 = objc_claimAutoreleasedReturnValue();
    minDimension = v5->_minDimension;
    v5->_minDimension = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxFileSize"));
    v10 = objc_claimAutoreleasedReturnValue();
    maxFileSize = v5->_maxFileSize;
    v5->_maxFileSize = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstancePoint"));
    v12 = objc_claimAutoreleasedReturnValue();
    instancePoint = v5->_instancePoint;
    v5->_instancePoint = (NSValue *)v12;

    v5->_maskTime.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MaskTimeValue"));
    v5->_maskTime.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MaskTimeScale"));
    v5->_maskTime.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MaskTimeFlags"));
    v5->_maskTime.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MaskTimeEpoch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OutputType"));
    v14 = objc_claimAutoreleasedReturnValue();
    outputType = v5->_outputType;
    v5->_outputType = (UTType *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("StickerIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    stickerIdentifiers = v5->_stickerIdentifiers;
    v5->_stickerIdentifiers = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundRequest;
  v4 = a3;
  -[MADVideoRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxDimension, CFSTR("MaxDimension"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_minDimension, CFSTR("MinDimension"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxFileSize, CFSTR("MaxFileSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_instancePoint, CFSTR("InstancePoint"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_maskTime.value, CFSTR("MaskTimeValue"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_maskTime.timescale, CFSTR("MaskTimeScale"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_maskTime.flags, CFSTR("MaskTimeFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_maskTime.epoch, CFSTR("MaskTimeEpoch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outputType, CFSTR("OutputType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stickerIdentifiers, CFSTR("StickerIdentifiers"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *maxDimension;
  NSNumber *minDimension;
  NSNumber *maxFileSize;
  NSValue *instancePoint;
  uint64_t v10;
  uint64_t v11;
  uint64_t timescale;
  void *v13;
  void *v14;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  maxDimension = self->_maxDimension;
  if (maxDimension)
    objc_msgSend(v3, "appendFormat:", CFSTR(", maxDimension: %d"), -[NSNumber unsignedIntegerValue](maxDimension, "unsignedIntegerValue"));
  minDimension = self->_minDimension;
  if (minDimension)
    objc_msgSend(v3, "appendFormat:", CFSTR(", minDimension: %d"), -[NSNumber unsignedIntegerValue](minDimension, "unsignedIntegerValue"));
  maxFileSize = self->_maxFileSize;
  if (maxFileSize)
    objc_msgSend(v3, "appendFormat:", CFSTR(", maxFileSize: %d"), -[NSNumber unsignedIntegerValue](maxFileSize, "unsignedIntegerValue"));
  instancePoint = self->_instancePoint;
  if (instancePoint)
  {
    -[NSValue pointValue](instancePoint, "pointValue");
    objc_msgSend(v3, "appendFormat:", CFSTR(", instancePoint: (%0.3f, %0.3f)"), v10, v11);
  }
  if ((self->_maskTime.flags & 1) != 0)
  {
    timescale = self->_maskTime.timescale;
    time = (CMTime)self->_maskTime;
    objc_msgSend(v3, "appendFormat:", CFSTR(", maskTime: %lld/%d (%0.3fs)"), time.value, timescale, CMTimeGetSeconds(&time));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", outputType: %@"), self->_outputType);
  if (-[NSArray count](self->_stickerIdentifiers, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", stickerIdentifiers: %@"), self->_stickerIdentifiers);
  -[MADVideoRequest results](self, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", results: %@"), v13);

  -[MADVideoRequest error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", error: %@>"), v14);

  return v3;
}

- (MADVideoRemoveBackgroundResult)result
{
  void *v2;
  void *v3;

  -[MADVideoRequest results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MADVideoRemoveBackgroundResult *)v3;
}

- (NSNumber)maxDimension
{
  return self->_maxDimension;
}

- (void)setMaxDimension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)minDimension
{
  return self->_minDimension;
}

- (void)setMinDimension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSValue)instancePoint
{
  return self->_instancePoint;
}

- (void)setInstancePoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMaskTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_maskTime.value = *(_OWORD *)&a3->var0;
  self->_maskTime.epoch = var3;
}

- (UTType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)stickerIdentifiers
{
  return self->_stickerIdentifiers;
}

- (void)setStickerIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerIdentifiers, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_instancePoint, 0);
  objc_storeStrong((id *)&self->_maxFileSize, 0);
  objc_storeStrong((id *)&self->_minDimension, 0);
  objc_storeStrong((id *)&self->_maxDimension, 0);
}

@end
