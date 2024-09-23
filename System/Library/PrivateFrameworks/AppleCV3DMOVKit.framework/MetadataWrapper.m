@implementation MetadataWrapper

+ (id)decodeAccel:(id)a3
{
  return +[CVAMetadataWrapper decodeAccel:](CVAMetadataWrapper, "decodeAccel:", a3);
}

+ (id)decodeGyro:(id)a3
{
  return +[CVAMetadataWrapper decodeGyro:](CVAMetadataWrapper, "decodeGyro:", a3);
}

+ (id)decodeCompass:(id)a3
{
  return +[CVAMetadataWrapper decodeCompass:](CVAMetadataWrapper, "decodeCompass:", a3);
}

+ (id)decodeCLLocation:(id)a3
{
  return +[CVAMetadataWrapper decodeCLLocation:](CVAMetadataWrapper, "decodeCLLocation:", a3);
}

+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4
{
  return +[CVAMetadataWrapper decodeCLLocation:timestamp:](CVAMetadataWrapper, "decodeCLLocation:timestamp:", a3, a4);
}

+ (id)decodeCMDeviceMotion:(id)a3
{
  return +[CVAMetadataWrapper decodeCMDeviceMotion:](CVAMetadataWrapper, "decodeCMDeviceMotion:", a3);
}

+ (id)encodeAccelerometerData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeAccelerometerData:andAdditionalData:](CVAMetadataWrapper, "encodeAccelerometerData:andAdditionalData:", a3, a4);
}

+ (id)encodeGyroscopeData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeGyroscopeData:andAdditionalData:](CVAMetadataWrapper, "encodeGyroscopeData:andAdditionalData:", a3, a4);
}

+ (id)encodeCompassData:(id)a3
{
  return +[CVAMetadataWrapper encodeCompassData:](CVAMetadataWrapper, "encodeCompassData:", a3);
}

+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
  return +[CVAMetadataWrapper encodeCoreLocationData:timestamp:andAdditionalData:](CVAMetadataWrapper, "encodeCoreLocationData:timestamp:andAdditionalData:", a3, a5, a4);
}

+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeDeviceMotionData:andAdditionalData:](CVAMetadataWrapper, "encodeDeviceMotionData:andAdditionalData:", a3, a4);
}

@end
