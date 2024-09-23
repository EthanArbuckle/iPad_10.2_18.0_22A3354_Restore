@implementation AVOutputDeviceInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->communicationChannelDelegate);
}

@end
