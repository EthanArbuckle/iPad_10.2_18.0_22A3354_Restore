@implementation GTReplayProfileTimeline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayProfileTimeline)initWithCoder:(id)a3
{
  id v4;
  GTReplayProfileTimeline *v5;
  GTReplayProfileTimeline *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayProfileTimeline;
  v5 = -[GTReplayProfileRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shaderProfiling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shaderProfiling"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayProfileTimeline;
  v4 = a3;
  -[GTReplayProfileRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shaderProfiling, CFSTR("shaderProfiling"), v5.receiver, v5.super_class);

}

- (BOOL)shaderProfiling
{
  return self->_shaderProfiling;
}

- (void)setShaderProfiling:(BOOL)a3
{
  self->_shaderProfiling = a3;
}

@end
