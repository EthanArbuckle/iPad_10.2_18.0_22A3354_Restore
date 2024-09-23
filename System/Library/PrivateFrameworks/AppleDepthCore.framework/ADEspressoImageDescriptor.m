@implementation ADEspressoImageDescriptor

- (ADImageDescriptor)imageDescriptor
{
  return self->_imageDescriptor;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)descriptorWithName:(id)a3 imageDescriptor:(id)a4 isInput:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8)
  {
    if (v9)
    {
      v12 = objc_opt_new();
      v11 = v12;
      if (v12)
      {
        objc_storeStrong((id *)(v12 + 16), a3);
        *(_BYTE *)(v11 + 8) = a5;
        objc_storeStrong((id *)(v11 + 24), a4);
      }
    }
  }

  return (id)v11;
}

- (BOOL)isInput
{
  return self->_isInput;
}

+ (id)inputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[ADImageDescriptor descriptorForSupportedSizes:pixelFormat:](ADImageDescriptor, "descriptorForSupportedSizes:pixelFormat:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADEspressoImageDescriptor descriptorWithName:imageDescriptor:isInput:](ADEspressoImageDescriptor, "descriptorWithName:imageDescriptor:isInput:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)outputDescriptorWithName:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[ADImageDescriptor descriptorForSupportedSizes:pixelFormat:](ADImageDescriptor, "descriptorForSupportedSizes:pixelFormat:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADEspressoImageDescriptor descriptorWithName:imageDescriptor:isInput:](ADEspressoImageDescriptor, "descriptorWithName:imageDescriptor:isInput:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
