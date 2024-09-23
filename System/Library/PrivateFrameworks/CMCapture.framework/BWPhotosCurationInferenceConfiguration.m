@implementation BWPhotosCurationInferenceConfiguration

- (BWPhotosCurationInferenceConfiguration)initWithInferenceType:(int)a3
{
  BWPhotosCurationInferenceConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWPhotosCurationInferenceConfiguration;
  result = -[BWInferenceConfiguration initWithInferenceType:](&v4, sel_initWithInferenceType_, *(_QWORD *)&a3);
  if (result)
    *(_DWORD *)(&result->super._suppressTimeOutFailure + 3) = 0;
  return result;
}

+ (id)configuration
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInferenceType:", 803);
}

- (int)semanticDevelopmentVersion
{
  return *(_DWORD *)(&self->super._suppressTimeOutFailure + 3);
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  *(_DWORD *)(&self->super._suppressTimeOutFailure + 3) = a3;
}

@end
