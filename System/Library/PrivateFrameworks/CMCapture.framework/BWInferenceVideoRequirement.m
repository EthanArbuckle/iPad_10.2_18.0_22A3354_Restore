@implementation BWInferenceVideoRequirement

- (BWInferenceVideoRequirement)initWithVideoRequirement:(id)a3
{
  BWInferenceVideoRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceVideoRequirement;
  v4 = -[BWInferenceMediaRequirement initWithMediaRequirement:](&v6, sel_initWithMediaRequirement_);
  if (v4)
  {
    v4->_videoFormat = (BWInferenceVideoFormat *)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "copy");
    v4->_videoStorageType = objc_msgSend(a3, "videoStorageType");
  }
  return v4;
}

- (int)videoStorageType
{
  return self->_videoStorageType;
}

- (BOOL)isSatisfiedByRequirement:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "satisfactionHash");
  return v4 == -[BWInferenceVideoRequirement satisfactionHash](self, "satisfactionHash");
}

- (unint64_t)satisfactionHash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[BWInferenceMediaRequirement attachedMediaKey](self, "attachedMediaKey"), "hash");
  return -[BWInferenceVideoFormat hash](-[BWInferenceVideoRequirement videoFormat](self, "videoFormat"), "hash") ^ v3;
}

- (BWInferenceVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoRequirement;
  -[BWInferenceMediaRequirement dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVideoRequirement:", self);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p; attachedMediaKey = %@; videoFormat = %@; count = %lu>"),
               objc_opt_class(),
               -[BWInferenceDataRequirement identifier](self, "identifier"),
               self,
               -[BWInferenceMediaRequirement attachedMediaKey](self, "attachedMediaKey"),
               -[BWInferenceVideoRequirement videoFormat](self, "videoFormat"),
               -[BWInferenceMediaRequirement count](self, "count"));
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4
{
  return -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:](self, "initWithAttachedMediaKey:videoFormat:count:", a3, a4, 1);
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5
{
  BWInferenceVideoRequirement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceVideoRequirement;
  v6 = -[BWInferenceMediaRequirement initWithAttachedMediaKey:count:](&v8, sel_initWithAttachedMediaKey_count_, a3, a5);
  if (v6)
    v6->_videoFormat = (BWInferenceVideoFormat *)a4;
  return v6;
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  -[BWInferenceVideoRequirement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BWInferenceVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 videoStorageType:(int)a5
{
  self->_videoStorageType = a5;
  return -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](self, "initWithAttachedMediaKey:videoFormat:", a3, a4);
}

@end
