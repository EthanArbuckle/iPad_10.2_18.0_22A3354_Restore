@implementation HMCameraClipVideoDataSegment

- (HMCameraClipVideoDataSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4 duration:(double)a5 timeOffset:(double)a6
{
  HMCameraClipVideoDataSegment *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMCameraClipVideoDataSegment;
  result = -[HMCameraClipVideoSegment initWithByteLength:byteOffset:](&v9, sel_initWithByteLength_byteOffset_, a3, a4);
  if (result)
  {
    result->_duration = a5;
    result->_timeOffset = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v15.receiver = self,
        v15.super_class = (Class)HMCameraClipVideoDataSegment,
        -[HMCameraClipVideoSegment isEqual:](&v15, sel_isEqual_, v6))
    && (-[HMCameraClipVideoDataSegment duration](self, "duration"), v8 = v7, objc_msgSend(v6, "duration"), v8 == v9))
  {
    -[HMCameraClipVideoDataSegment timeOffset](self, "timeOffset");
    v11 = v10;
    objc_msgSend(v6, "timeOffset");
    v13 = v11 == v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMCameraClipVideoDataSegment;
  v3 = -[HMCameraClipVideoSegment hash](&v8, sel_hash);
  -[HMCameraClipVideoDataSegment duration](self, "duration");
  v5 = v3 ^ (unint64_t)v4;
  -[HMCameraClipVideoDataSegment timeOffset](self, "timeOffset");
  return v5 ^ (unint64_t)v6;
}

- (HMCameraClipVideoDataSegment)initWithCoder:(id)a3
{
  id v4;
  HMCameraClipVideoSegment *v5;
  double v6;
  double v7;
  double v8;
  HMCameraClipVideoDataSegment *v9;

  v4 = a3;
  v5 = -[HMCameraClipVideoSegment initWithCoder:]([HMCameraClipVideoSegment alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMCCVDS.ck.d"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMCCVDS.ck.to"));
    self = -[HMCameraClipVideoDataSegment initWithByteLength:byteOffset:duration:timeOffset:](self, "initWithByteLength:byteOffset:duration:timeOffset:", -[HMCameraClipVideoSegment byteLength](v5, "byteLength"), -[HMCameraClipVideoSegment byteOffset](v5, "byteOffset"), v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMCameraClipVideoDataSegment;
  v4 = a3;
  -[HMCameraClipVideoSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[HMCameraClipVideoDataSegment duration](self, "duration", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMCCVDS.ck.d"));
  -[HMCameraClipVideoDataSegment timeOffset](self, "timeOffset");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMCCVDS.ck.to"));

}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HMCameraClipVideoDataSegment;
  -[HMCameraClipVideoSegment attributeDescriptions](&v17, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraClipVideoDataSegment duration](self, "duration");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%.3f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Duration"), v7);
  v18[0] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraClipVideoDataSegment timeOffset](self, "timeOffset");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%.3f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Time Offset"), v12);
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)duration
{
  return self->_duration;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
