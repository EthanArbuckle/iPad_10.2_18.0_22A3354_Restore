@implementation NTKEditOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (int64_t)swatchStyle
{
  return -1;
}

+ (CGSize)sizeForSwatchStyle:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  switch(a3)
  {
    case 0:
      if (_smallCircleSwatchSize_onceToken != -1)
        dispatch_once(&_smallCircleSwatchSize_onceToken, &__block_literal_global_118);
      v3 = *(double *)&_smallCircleSwatchSize_size_0;
      v4 = *(double *)&_smallCircleSwatchSize_size_1;
      break;
    case 1:
      if (_largeCircleSwatchSize_onceToken != -1)
        dispatch_once(&_largeCircleSwatchSize_onceToken, &__block_literal_global_10_2);
      v3 = *(double *)&_largeCircleSwatchSize_size_0;
      v4 = *(double *)&_largeCircleSwatchSize_size_1;
      break;
    case 2:
      v3 = _smallRectSwatchSize();
      break;
    case 3:
      v3 = _largeRectSwatchSize();
      break;
    case 4:
      if (_shortLargeRectSwatchSize_onceToken != -1)
        dispatch_once(&_shortLargeRectSwatchSize_onceToken, &__block_literal_global_13_0);
      v3 = *(double *)&_shortLargeRectSwatchSize_size_0;
      v4 = *(double *)&_shortLargeRectSwatchSize_size_1;
      break;
    default:
      v4 = 0.0;
      v3 = 0.0;
      break;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)optionsDescription
{
  return 0;
}

- (NTKEditOption)initWithDevice:(id)a3
{
  id v5;
  NTKEditOption *v6;
  NTKEditOption *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKEditOption;
  v6 = -[NTKEditOption init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (NSString)localizedNameForAction
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  CLKDevice *device;
  id v4;
  id v5;

  device = self->_device;
  v4 = a3;
  -[CLKDevice nrDeviceUUID](device, "nrDeviceUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DeviceUUIDKey"));

}

- (NTKEditOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKEditOption *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944B0], "deviceForNRDeviceUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKEditOption initWithDevice:](self, "initWithDevice:", v6);

  return v7;
}

- (BOOL)isPrideOption
{
  return 0;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  return 1;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)dailySnapshotKey
{
  NSString *result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (NSString)localizedName
{
  NSString *result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)JSONObjectRepresentation
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (NTKEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  void *v4;
  NTKEditOption *result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();

  OUTLINED_FUNCTION_2_0();
  return result;
}

- (BOOL)isValidOption
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end
