@implementation SSHBHIDAmbientLightSensorSampleBuffer

- (void)ambientLightSensorReceivedSample:(id)a3
{
  -[SSHBHIDSampleBuffer addSample:](self, "addSample:", a3);
}

@end
