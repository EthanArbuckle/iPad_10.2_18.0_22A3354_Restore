@implementation PHASESharedListenerDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASESharedListenerDebugInfo;
  if (-[PHASESharedEntityDebugInfo isEqual:](&v10, sel_isEqual_, v4))
  {
    -[PHASESharedListenerDebugInfo gain](self, "gain");
    v6 = v5;
    objc_msgSend(v4, "gain");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHASESharedListenerDebugInfo;
  -[PHASESharedEntityDebugInfo encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_gain;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("gain"), v5);

}

- (PHASESharedListenerDebugInfo)initWithCoder:(id)a3
{
  id v4;
  PHASESharedListenerDebugInfo *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHASESharedListenerDebugInfo;
  v5 = -[PHASESharedEntityDebugInfo initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gain"));
    v5->_gain = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PHASESharedEntityDebugInfo transform](self, "transform");
  v5 = v4;
  -[PHASESharedEntityDebugInfo transform](self, "transform");
  v7 = v6;
  -[PHASESharedEntityDebugInfo transform](self, "transform");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<PHASESharedListenerDebugInfo:%p position=[%0.1f, %0.1f, %0.1f], referenceCount=%d, gain=%0.1f>"), self, *(_QWORD *)&v5, *(_QWORD *)&v7, v8, -[PHASESharedEntityDebugInfo referenceCount](self, "referenceCount"), self->_gain);
}

- (void)setGain:(float)a3
{
  self->_gain = a3;
}

- (float)gain
{
  return self->_gain;
}

@end
