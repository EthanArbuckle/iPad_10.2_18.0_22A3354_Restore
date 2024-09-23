@implementation _VNVisionCoreInferenceNetworkResourceDescriptor

- (_VNVisionCoreInferenceNetworkResourceDescriptor)initWithDescriptor:(id)a3
{
  id v5;
  id *v6;
  _VNVisionCoreInferenceNetworkResourceDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNVisionCoreInferenceNetworkResourceDescriptor;
  v6 = -[VNResourceDescriptor _init](&v9, sel__init);
  v7 = (_VNVisionCoreInferenceNetworkResourceDescriptor *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)modelURL
{
  return (id)-[VisionCoreInferenceNetworkDescriptor URL](self->_inferenceNetworkDescriptor, "URL");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

@end
