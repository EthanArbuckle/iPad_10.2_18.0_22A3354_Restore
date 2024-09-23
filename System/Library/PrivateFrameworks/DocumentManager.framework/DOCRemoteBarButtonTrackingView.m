@implementation DOCRemoteBarButtonTrackingView

- (DOCRemoteBarButtonTrackingView)initWithUUID:(id)a3
{
  id v5;
  DOCRemoteBarButtonTrackingView *v6;
  DOCRemoteBarButtonTrackingView *v7;
  DOCRemoteBarButtonTrackingView *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DOCRemoteBarButtonTrackingView;
  v6 = -[DOCRemoteBarButtonTrackingView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    -[DOCRemoteBarButtonTrackingView setBackgroundColor:](v7, "setBackgroundColor:", 0);
    -[DOCRemoteBarButtonTrackingView setOpaque:](v7, "setOpaque:", 0);
    v8 = v7;
  }

  return v7;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
