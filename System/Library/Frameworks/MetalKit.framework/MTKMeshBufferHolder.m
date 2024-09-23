@implementation MTKMeshBufferHolder

- (MTKMeshBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  self->_buffer = (MTKMeshBuffer *)a3;
}

@end
