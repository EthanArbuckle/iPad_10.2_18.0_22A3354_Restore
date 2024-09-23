@implementation GCRacingWheelInputState

- (GCSteeringWheelElement)wheel
{
  return (GCSteeringWheelElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Steering Wheel"));
}

- (id)acceleratorPedal
{
  return -[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Accelerator Pedal"));
}

- (id)brakePedal
{
  return -[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Brake Pedal"));
}

- (id)clutchPedal
{
  return -[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Clutch Pedal"));
}

- (GCGearShifterElement)shifter
{
  return (GCGearShifterElement *)-[_GCDevicePhysicalInputFacade objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Shifter"));
}

@end
