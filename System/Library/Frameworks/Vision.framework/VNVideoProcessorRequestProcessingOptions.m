@implementation VNVideoProcessorRequestProcessingOptions

- (id)_createVCPVideoProcessorRequestConfiguration
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VNVideoProcessorRequestProcessingOptions cadence](self, "cadence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "populateVCPVideoProcessorRequestConfiguration:", v3);

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VNVideoProcessorRequestProcessingOptions cadence](self, "cadence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VNVideoProcessorRequestProcessingOptions *v4;
  VNVideoProcessorRequestProcessingOptions *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNVideoProcessorRequestProcessingOptions *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNVideoProcessorRequestProcessingOptions cadence](self, "cadence");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNVideoProcessorRequestProcessingOptions cadence](v5, "cadence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    -[VNVideoProcessorRequestProcessingOptions cadence](self, "cadence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCadence:", v5);

  }
  return v4;
}

- (VNVideoProcessorCadence)cadence
{
  return (VNVideoProcessorCadence *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCadence:(VNVideoProcessorCadence *)cadence
{
  objc_setProperty_atomic_copy(self, a2, cadence, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cadence, 0);
}

@end
