@implementation AVOutputDeviceAuthorizationSessionInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
