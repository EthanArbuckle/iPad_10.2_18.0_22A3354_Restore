@implementation MTLIOAccelAccelerationStructure

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (unint64_t)size
{
  return -[MTLBuffer length](self->_buffer, "length");
}

- (void)copyPropertiesFromBuffer:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;

  v4 = (char *)a3 + 32;
  v5 = *((id *)a3 + 30);
  v6 = *((_QWORD *)v4 + 27);
  *(_QWORD *)&self->super._anon_50[160] = v5;
  *(_QWORD *)&self->super._anon_50[168] = v6;
  *(_OWORD *)&self->super._anon_50[176] = *((_OWORD *)v4 + 14);
  self->super._anon_50[192] = v4[240];
  *(_QWORD *)&self->super._anon_50[24] = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->super._anon_50[88] = *((_QWORD *)v4 + 17);
}

- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4
{
  MTLIOAccelAccelerationStructure *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelAccelerationStructure;
  v6 = -[MTLIOAccelResource initWithResource:](&v8, sel_initWithResource_);
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a3;
    v6->_bufferOffset = a4;
    -[MTLIOAccelAccelerationStructure copyPropertiesFromBuffer:](v6, "copyPropertiesFromBuffer:", a3);
  }
  return v6;
}

- (MTLIOAccelAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  MTLIOAccelAccelerationStructure *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLIOAccelAccelerationStructure;
  v8 = -[MTLIOAccelResource initWithResource:](&v10, sel_initWithResource_);
  if (v8)
  {
    v8->_buffer = (MTLBuffer *)a3;
    v8->_bufferOffset = a4;
    v8->_resourceIndex = a5;
    -[MTLIOAccelAccelerationStructure copyPropertiesFromBuffer:](v8, "copyPropertiesFromBuffer:", a3);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  *(_QWORD *)&self->super._anon_50[160] = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelAccelerationStructure;
  -[MTLIOAccelResource dealloc](&v3, sel_dealloc);
}

- (unint64_t)gpuHandle
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[MTLIOAccelResource device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)return -[MTLBuffer gpuAddress](-[MTLIOAccelAccelerationStructure buffer](self, "buffer"), "gpuAddress");
  else
    return -[MTLIOAccelAccelerationStructure resourceIndex](self, "resourceIndex");
}

- (MTLAccelerationStructureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

@end
