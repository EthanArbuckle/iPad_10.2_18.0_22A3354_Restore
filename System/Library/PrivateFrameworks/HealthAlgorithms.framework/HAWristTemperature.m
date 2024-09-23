@implementation HAWristTemperature

- (HAWristTemperature)initWithComputedTemperatureErrorEstimate:(id)a3 computedTemperature:(id)a4 sensor1Temperature:(id)a5 sensor2Temperature:(id)a6 dataValidity:(unint64_t)a7 timestamp:(id)a8
{
  id v15;
  id v16;
  id v17;
  HAWristTemperature *v18;
  HAWristTemperature *v19;
  HAWristTemperature *v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HAWristTemperature;
  v18 = -[HAWristTemperature init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_computedTemperatureErrorEstimate, a3);
    objc_storeStrong((id *)&v19->_computedTemperature, a4);
    objc_storeStrong((id *)&v19->_sensor1Temperature, a5);
    objc_storeStrong((id *)&v19->_sensor2Temperature, a6);
    v19->_dataValidity = a7;
    objc_storeStrong((id *)&v19->_timestamp, a8);
    v20 = v19;
  }

  return v19;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSMeasurement)computedTemperature
{
  return self->_computedTemperature;
}

- (NSMeasurement)sensor1Temperature
{
  return self->_sensor1Temperature;
}

- (NSMeasurement)sensor2Temperature
{
  return self->_sensor2Temperature;
}

- (unint64_t)dataValidity
{
  return self->_dataValidity;
}

- (NSMeasurement)computedTemperatureErrorEstimate
{
  return self->_computedTemperatureErrorEstimate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedTemperatureErrorEstimate, 0);
  objc_storeStrong((id *)&self->_sensor2Temperature, 0);
  objc_storeStrong((id *)&self->_sensor1Temperature, 0);
  objc_storeStrong((id *)&self->_computedTemperature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
