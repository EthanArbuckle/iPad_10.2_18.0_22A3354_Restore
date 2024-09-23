@implementation _MPRemoteLaunchCommandCenter

- (void)dealloc
{
  objc_super v3;

  -[MPRemoteCommandCenter invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_MPRemoteLaunchCommandCenter;
  -[MPRemoteCommandCenter dealloc](&v3, sel_dealloc);
}

@end
