@implementation BWInferenceCloneVideoRequirement

- (BWInferenceVideoRequirement)sourceVideoRequirement
{
  return self->_sourceVideoRequirement;
}

- (id)videoFormat
{
  return -[BWInferenceVideoRequirement videoFormat](self->_sourceVideoRequirement, "videoFormat");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCloneVideoRequirement;
  -[BWInferenceVideoRequirement dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCloneVideoRequirement:", self);
}

- (BWInferenceCloneVideoRequirement)initWithCloneVideoRequirement:(id)a3
{
  BWInferenceCloneVideoRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceCloneVideoRequirement;
  v4 = -[BWInferenceVideoRequirement initWithVideoRequirement:](&v6, sel_initWithVideoRequirement_);
  if (v4)
    v4->_sourceVideoRequirement = (BWInferenceVideoRequirement *)(id)objc_msgSend(a3, "sourceVideoRequirement");
  return v4;
}

- (BWInferenceCloneVideoRequirement)initWithAttachedMediaKey:(id)a3 sourceVideoRequirement:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceCloneVideoRequirement;
  v5 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](&v7, sel_initWithAttachedMediaKey_videoFormat_, a3, objc_msgSend(a4, "videoFormat"));
  if (v5)
    v5->_sourceVideoRequirement = (BWInferenceVideoRequirement *)a4;
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p; attachedMediaKey = %@; sourceVideoRequirement = %@>"),
               objc_opt_class(),
               -[BWInferenceDataRequirement identifier](self, "identifier"),
               self,
               -[BWInferenceMediaRequirement attachedMediaKey](self, "attachedMediaKey"),
               -[BWInferenceCloneVideoRequirement sourceVideoRequirement](self, "sourceVideoRequirement"));
}

@end
