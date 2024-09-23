@implementation ADPipelineParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (ADPipelineParameters)init
{
  void *v3;
  ADPipelineParameters *v4;

  +[ADDeviceConfiguration getDeviceName](ADDeviceConfiguration, "getDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ADPipelineParameters initForDevice:](self, "initForDevice:", v3);

  return v4;
}

- (id)initForDevice:(id)a3
{
  id v5;
  ADPipelineParameters *v6;
  ADPipelineParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADPipelineParameters;
  v6 = -[ADPipelineParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceName, a3);

  return v7;
}

- (void)setOutputDepthUnits:(unint64_t)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "setting deprecated property. outputDepthUnits has no impact on pipeline's depth units", v3, 2u);
  }
}

- (unint64_t)outputDepthUnits
{
  return self->_outputDepthUnits;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

@end
