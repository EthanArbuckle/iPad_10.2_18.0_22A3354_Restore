@implementation ARPoseContext

- (id)imageData
{
  return 0;
}

- (id)resultDataOfClass:(Class)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (id)cameraTransformCallback
{
  return self->_cameraTransformCallback;
}

- (void)setCameraTransformCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cameraTransformCallback, 0);
}

@end
