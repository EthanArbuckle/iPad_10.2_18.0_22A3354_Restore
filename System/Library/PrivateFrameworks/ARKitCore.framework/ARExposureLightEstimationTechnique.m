@implementation ARExposureLightEstimationTechnique

- (ARExposureLightEstimationTechnique)init
{
  ARExposureLightEstimationTechnique *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *resultSemaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARExposureLightEstimationTechnique;
  v2 = -[ARTechnique init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (BOOL)isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  return v3 != 0;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  arkit *v6;
  float v7;
  float v8;
  float v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v5 = v4;
    v6 = (arkit *)objc_msgSend(v5, "temperature");
    self->_temperature = arkit::mapColorTemperature(v6, v7);
    objc_msgSend(v5, "exposureTargetOffset");
    v10 = ARMapExposureOffset(v8);
    self->_lightIntensity = arkit::ExponentialSmoother<float>::step((uint64_t)&self->_smoother, &v10, 1.0 / (float)objc_msgSend(v5, "captureFramesPerSecond"), 0.016667, 0.2);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);

  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  ARLightEstimate *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (void *)objc_opt_new();
  v8 = -[ARLightEstimate initWithAmbientIntensity:temperature:]([ARLightEstimate alloc], "initWithAmbientIntensity:temperature:", self->_lightIntensity * 1000.0, self->_temperature);
  objc_msgSend(v7, "setLightEstimate:", v8);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  objc_msgSend(v7, "lightEstimate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ambientIntensity");
  kdebug_trace();

  -[ARTechnique delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "technique:didOutputResultData:timestamp:context:", self, v13, v6, a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSemaphore, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 76) = 0;
  return self;
}

@end
