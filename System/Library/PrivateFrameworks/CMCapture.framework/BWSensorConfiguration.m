@implementation BWSensorConfiguration

- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6 moduleCalibration:(id)a7
{
  BWSensorConfiguration *v12;
  objc_super v14;

  if (a3 && a4 && a5 && a6)
  {
    v14.receiver = self;
    v14.super_class = (Class)BWSensorConfiguration;
    v12 = -[BWSensorConfiguration init](&v14, sel_init);
    if (v12)
    {
      v12->_portType = (NSString *)a3;
      v12->_sensorIDString = (NSString *)a4;
      v12->_sensorIDDictionary = (NSDictionary *)a5;
      v12->_cameraInfo = (NSDictionary *)a6;
      v12->_moduleCalibration = (CMIModuleCalibration *)a7;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)sensorIDString
{
  return self->_sensorIDString;
}

- (NSDictionary)sensorIDDictionary
{
  return self->_sensorIDDictionary;
}

- (CMIModuleCalibration)moduleCalibration
{
  return self->_moduleCalibration;
}

- (NSDictionary)cameraInfo
{
  return self->_cameraInfo;
}

- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6
{
  return -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:](self, "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:", a3, a4, a5, a6, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSensorConfiguration;
  -[BWSensorConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: port type: %@, sensor ID: %@, sensorIDDictionary: %p, cameraInfo: %@, moduleCalibration: %@"), objc_opt_class(), self, self->_portType, self->_sensorIDString, self->_sensorIDDictionary, self->_cameraInfo, self->_moduleCalibration);
}

@end
