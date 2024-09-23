@implementation BWInferenceLazyVideoRequirement

- (BWInferenceLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3
{
  BWInferenceLazyVideoRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceLazyVideoRequirement;
  v4 = -[BWInferenceVideoRequirement initWithVideoRequirement:](&v6, sel_initWithVideoRequirement_);
  if (v4)
  {
    v4->_preparedByAttachedMediaKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "preparedByAttachedMediaKey"), "copy");
    v4->_videoFormatProvider = (id)objc_msgSend(*((id *)a3 + 7), "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceLazyVideoRequirement;
  -[BWInferenceVideoRequirement dealloc](&v3, sel_dealloc);
}

- (int)prepareForInputInferenceVideoFormat:(id)a3
{
  uint64_t (**videoFormatProvider)(id, id);
  BWInferenceVideoFormat *v5;

  if (self->super._videoFormat)
    return 0;
  videoFormatProvider = (uint64_t (**)(id, id))self->_videoFormatProvider;
  if (videoFormatProvider
    && (v5 = (BWInferenceVideoFormat *)(id)videoFormatProvider[2](videoFormatProvider, a3),
        (self->super._videoFormat = v5) != 0))
  {
    return 0;
  }
  else
  {
    return -31711;
  }
}

- (NSString)preparedByAttachedMediaKey
{
  return self->_preparedByAttachedMediaKey;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLazyVideoRequirement:", self);
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 videoFormatProvider:(id)a5
{
  return -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:count:videoFormatProvider:](self, "initWithAttachedMediaKey:preparedByAttachedMediaKey:count:videoFormatProvider:", a3, a4, 1, a5);
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6
{
  BWInferenceLazyVideoRequirement *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWInferenceLazyVideoRequirement;
  v8 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:](&v10, sel_initWithAttachedMediaKey_videoFormat_count_, a3, 0, a5);
  if (v8)
  {
    v8->_preparedByAttachedMediaKey = (NSString *)objc_msgSend(a4, "copy");
    v8->_videoFormatProvider = (id)objc_msgSend(a6, "copy");
  }
  return v8;
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 count:(unint64_t)a4
{
  -[BWInferenceLazyVideoRequirement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BWInferenceLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 videoFormat:(id)a4 count:(unint64_t)a5
{
  -[BWInferenceLazyVideoRequirement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  BWInferenceVideoFormat *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<waiting for %@>"), -[BWInferenceLazyVideoRequirement preparedByAttachedMediaKey](self, "preparedByAttachedMediaKey"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[BWInferenceVideoRequirement videoFormat](self, "videoFormat");
  if (v5)
    v6 = (uint64_t)v5;
  else
    v6 = v3;
  v7 = objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v6);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p; attachedMediaKey %@; videoFormat = %@; count = %lu>"),
               objc_opt_class(),
               -[BWInferenceDataRequirement identifier](self, "identifier"),
               self,
               -[BWInferenceMediaRequirement attachedMediaKey](self, "attachedMediaKey"),
               v7,
               -[BWInferenceMediaRequirement count](self, "count"));
}

@end
