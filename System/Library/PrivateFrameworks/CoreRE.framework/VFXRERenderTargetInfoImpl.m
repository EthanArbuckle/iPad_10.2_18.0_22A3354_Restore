@implementation VFXRERenderTargetInfoImpl

- (BOOL)vrrEnabled
{
  return (char)-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo")[44];
}

- (int64_t)sampleCount
{
  return *(unsigned int *)-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo");
}

- (unint64_t)depthStencilPixelFormat
{
  return (int)-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo")[36];
}

- (unint64_t)depthPixelFormat
{
  return (int)-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo")[36];
}

- (unint64_t)stencilPixelFormat
{
  return (int)-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo")[40];
}

- (unint64_t)colorPixelFormatAtIndex:(int64_t)a3
{
  return (int)(-[VFXRERenderTargetInfoImpl _renderTargetInfo](self, "_renderTargetInfo") + 4 * a3)[4];
}

- (const)_renderTargetInfo
{
  return self->__renderTargetInfo;
}

- (void)set_renderTargetInfo:(const RenderTargetInfo *)a3
{
  self->__renderTargetInfo = a3;
}

@end
