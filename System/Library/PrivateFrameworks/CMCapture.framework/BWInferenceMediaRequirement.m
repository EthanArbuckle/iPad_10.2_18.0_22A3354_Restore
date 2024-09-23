@implementation BWInferenceMediaRequirement

- (BWInferenceMediaRequirement)initWithMediaRequirement:(id)a3
{
  BWInferenceMediaRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceMediaRequirement;
  v4 = -[BWInferenceDataRequirement initWithDataRequirement:](&v6, sel_initWithDataRequirement_);
  if (v4)
  {
    v4->_attachedMediaKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "copy");
    v4->_count = objc_msgSend(a3, "count");
  }
  return v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)attachedMediaKey
{
  return self->_attachedMediaKey;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceMediaRequirement;
  -[BWInferenceMediaRequirement dealloc](&v3, sel_dealloc);
}

- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  BWInferenceMediaRequirement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceMediaRequirement;
  v6 = -[BWInferenceDataRequirement init](&v8, sel_init);
  if (v6)
  {
    v6->_attachedMediaKey = (NSString *)objc_msgSend(a3, "copy");
    v6->_count = a4;
  }
  return v6;
}

- (BWInferenceMediaRequirement)initWithAttachedMediaKey:(id)a3
{
  return -[BWInferenceMediaRequirement initWithAttachedMediaKey:count:](self, "initWithAttachedMediaKey:count:", a3, 1);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p; attachedMediaKey %@; count = %lu>"),
               objc_opt_class(),
               -[BWInferenceDataRequirement identifier](self, "identifier"),
               self,
               self->_attachedMediaKey,
               self->_count);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRequirement:", self);
}

@end
