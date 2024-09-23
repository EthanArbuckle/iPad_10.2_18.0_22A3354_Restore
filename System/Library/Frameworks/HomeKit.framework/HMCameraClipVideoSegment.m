@implementation HMCameraClipVideoSegment

- (HMCameraClipVideoSegment)initWithByteLength:(unint64_t)a3 byteOffset:(unint64_t)a4
{
  HMCameraClipVideoSegment *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipVideoSegment;
  result = -[HMCameraClipVideoSegment init](&v7, sel_init);
  if (result)
  {
    result->_byteLength = a3;
    result->_byteOffset = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6 && (v7 = -[HMCameraClipVideoSegment byteLength](self, "byteLength"), v7 == objc_msgSend(v6, "byteLength")))
  {
    v8 = -[HMCameraClipVideoSegment byteOffset](self, "byteOffset");
    v9 = v8 == objc_msgSend(v6, "byteOffset");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HMCameraClipVideoSegment byteLength](self, "byteLength");
  return -[HMCameraClipVideoSegment byteOffset](self, "byteOffset") ^ v3;
}

- (HMCameraClipVideoSegment)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMCCVS.bl"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMCCVS.bo"));

  return -[HMCameraClipVideoSegment initWithByteLength:byteOffset:](self, "initWithByteLength:byteOffset:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClipVideoSegment byteLength](self, "byteLength"), CFSTR("HMCCVS.bl"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClipVideoSegment byteOffset](self, "byteOffset"), CFSTR("HMCCVS.bo"));

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMCameraClipVideoSegment byteLength](self, "byteLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Byte Length"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMCameraClipVideoSegment byteOffset](self, "byteOffset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Byte Offset"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (unint64_t)byteLength
{
  return self->_byteLength;
}

- (unint64_t)byteOffset
{
  return self->_byteOffset;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
