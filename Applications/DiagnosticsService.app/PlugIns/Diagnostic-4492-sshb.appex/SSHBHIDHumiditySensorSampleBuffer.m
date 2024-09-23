@implementation SSHBHIDHumiditySensorSampleBuffer

- (void)humiditySensorReceivedSample:(id)a3
{
  -[SSHBHIDSampleBuffer addSample:](self, "addSample:", a3);
}

@end
