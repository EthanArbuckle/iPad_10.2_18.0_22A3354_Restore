@implementation MTRGenericCluster

- (MTRGenericCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  id v9;
  MTRGenericCluster *v10;
  MTRGenericCluster *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTRGenericCluster;
  v10 = -[MTRCluster initWithEndpointID:queue:](&v13, sel_initWithEndpointID_queue_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_device, a3);

  return v11;
}

- (MTRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
