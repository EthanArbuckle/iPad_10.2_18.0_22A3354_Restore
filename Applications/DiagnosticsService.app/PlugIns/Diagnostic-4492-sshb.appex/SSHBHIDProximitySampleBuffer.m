@implementation SSHBHIDProximitySampleBuffer

- (void)proximityReceivedSample:(id)a3
{
  -[SSHBHIDSampleBuffer addSample:](self, "addSample:", a3);
}

@end
