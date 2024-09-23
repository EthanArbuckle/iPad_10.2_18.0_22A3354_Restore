@implementation EspressoDataFrameStorageExecutorMatchingBufferSet

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- ($FD4688982923A924290ECB669CAF1EC2)reference_buffer
{
  $FD4688982923A924290ECB669CAF1EC2 *result;

  objc_copyStruct(retstr, &self->_reference_buffer, 168, 1, 0);
  return result;
}

- (void)setReference_buffer:(id *)a3
{
  objc_copyStruct(&self->_reference_buffer, a3, 168, 1, 0);
}

- ($FD4688982923A924290ECB669CAF1EC2)computed_buffer
{
  $FD4688982923A924290ECB669CAF1EC2 *result;

  objc_copyStruct(retstr, &self->_computed_buffer, 168, 1, 0);
  return result;
}

- (void)setComputed_buffer:(id *)a3
{
  objc_copyStruct(&self->_computed_buffer, a3, 168, 1, 0);
}

- (__CVBuffer)computed_pb
{
  return self->_computed_pb;
}

- (void)setComputed_pb:(__CVBuffer *)a3
{
  self->_computed_pb = a3;
}

- ($FD4688982923A924290ECB669CAF1EC2)groundtruth_buffer
{
  $FD4688982923A924290ECB669CAF1EC2 *result;

  objc_copyStruct(retstr, &self->_groundtruth_buffer, 168, 1, 0);
  return result;
}

- (void)setGroundtruth_buffer:(id *)a3
{
  objc_copyStruct(&self->_groundtruth_buffer, a3, 168, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
