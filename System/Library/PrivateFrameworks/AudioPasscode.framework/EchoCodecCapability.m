@implementation EchoCodecCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EchoCodecCapability)init
{
  void *v3;
  EchoCodecCapability *v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSArray *algorithmVersionNumbers;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "echo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)EchoCodecCapability;
  v4 = -[AUPasscodeCodecCapability initWithAlgorithmName:](&v13, sel_initWithAlgorithmName_, v3);

  if (v4)
  {
    v4->_frameSizeRange = (_NSRange)xmmword_22959DD30;
    v4->_numFrameRepeatRange = (_NSRange)xmmword_22959DD40;
    v4->_hpfCutOffFreqRange = (_NSRange)xmmword_22959DD50;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", kSupportedAlgorithmVersions[v6]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      v7 = 0;
      v6 = 1;
    }
    while ((v8 & 1) != 0);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    algorithmVersionNumbers = v4->_algorithmVersionNumbers;
    v4->_algorithmVersionNumbers = (NSArray *)v10;

  }
  return v4;
}

- (EchoCodecCapability)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  EchoCodecCapability *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *algorithmVersionNumbers;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "echo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)EchoCodecCapability;
  v6 = -[AUPasscodeCodecCapability initWithAlgorithmName:](&v19, sel_initWithAlgorithmName_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frmSizeRangeLoc"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frmSizeRangeLen"));
    v6->_frameSizeRange.location = v7;
    v6->_frameSizeRange.length = v8;
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numFrmRepeatRangeLoc"));
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numFrmRepeatRangeLen"));
    v6->_numFrameRepeatRange.location = v9;
    v6->_numFrameRepeatRange.length = v10;
    v11 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("algorithmVersions"));
    v14 = objc_claimAutoreleasedReturnValue();
    algorithmVersionNumbers = v6->_algorithmVersionNumbers;
    v6->_algorithmVersionNumbers = (NSArray *)v14;

    v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hpfCutOffRangeLoc"));
    v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hpfCutOffRangeLen"));
    v6->_hpfCutOffFreqRange.location = v16;
    v6->_hpfCutOffFreqRange.length = v17;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability frameSizeRange](self, "frameSizeRange"), CFSTR("frmSizeRangeLoc"));
  -[EchoCodecCapability frameSizeRange](self, "frameSizeRange");
  objc_msgSend(v8, "encodeInteger:forKey:", v4, CFSTR("frmSizeRangeLen"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability numFrameRepeatRange](self, "numFrameRepeatRange"), CFSTR("numFrmRepeatRangeLoc"));
  -[EchoCodecCapability numFrameRepeatRange](self, "numFrameRepeatRange");
  objc_msgSend(v8, "encodeInteger:forKey:", v5, CFSTR("numFrmRepeatRangeLen"));
  -[EchoCodecCapability algorithmVersionNumbers](self, "algorithmVersionNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("algorithmVersions"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[EchoCodecCapability hpfCutOffFreqRange](self, "hpfCutOffFreqRange"), CFSTR("hpfCutOffRangeLoc"));
  -[EchoCodecCapability hpfCutOffFreqRange](self, "hpfCutOffFreqRange");
  objc_msgSend(v8, "encodeInteger:forKey:", v7, CFSTR("hpfCutOffRangeLen"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[EchoCodecCapability isEqualToEchoCodecCapability:](self, "isEqualToEchoCodecCapability:", v4);

  return v5;
}

- (BOOL)isEqualToEchoCodecCapability:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EchoCodecCapability;
  if (-[AUPasscodeCodecCapability isEqual:](&v22, sel_isEqual_, v4))
  {
    v5 = -[EchoCodecCapability frameSizeRange](self, "frameSizeRange");
    v7 = v6;
    v9 = 0;
    if (v5 == objc_msgSend(v4, "frameSizeRange") && v7 == v8)
    {
      v10 = -[EchoCodecCapability numFrameRepeatRange](self, "numFrameRepeatRange");
      v12 = v11;
      v9 = 0;
      if (v10 == objc_msgSend(v4, "numFrameRepeatRange") && v12 == v13)
      {
        -[EchoCodecCapability algorithmVersionNumbers](self, "algorithmVersionNumbers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "algorithmVersionNumbers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v15))
        {
          v16 = -[EchoCodecCapability hpfCutOffFreqRange](self, "hpfCutOffFreqRange");
          v18 = v17;
          v9 = v16 == objc_msgSend(v4, "hpfCutOffFreqRange") && v18 == v19;
        }
        else
        {
          v9 = 0;
        }

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_NSRange)frameSizeRange
{
  _NSRange *p_frameSizeRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_frameSizeRange = &self->_frameSizeRange;
  location = self->_frameSizeRange.location;
  length = p_frameSizeRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)numFrameRepeatRange
{
  _NSRange *p_numFrameRepeatRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_numFrameRepeatRange = &self->_numFrameRepeatRange;
  location = self->_numFrameRepeatRange.location;
  length = p_numFrameRepeatRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)algorithmVersionNumbers
{
  return self->_algorithmVersionNumbers;
}

- (_NSRange)hpfCutOffFreqRange
{
  _NSRange *p_hpfCutOffFreqRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_hpfCutOffFreqRange = &self->_hpfCutOffFreqRange;
  location = self->_hpfCutOffFreqRange.location;
  length = p_hpfCutOffFreqRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmVersionNumbers, 0);
}

@end
