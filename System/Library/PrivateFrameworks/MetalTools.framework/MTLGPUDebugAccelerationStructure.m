@implementation MTLGPUDebugAccelerationStructure

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4
{
  MTLGPUDebugAccelerationStructure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugAccelerationStructure;
  v4 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4);
  v4->_accelerationStructureType = 0;
  -[MTLGPUDebugAccelerationStructure _setupIdentifier](v4, "_setupIdentifier");
  return v4;
}

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4
{
  MTLGPUDebugAccelerationStructure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugAccelerationStructure;
  v4 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:heap:](&v6, sel_initWithBaseObject_parent_heap_, a3, a4, a4);
  v4->_accelerationStructureType = 0;
  -[MTLGPUDebugAccelerationStructure _setupIdentifier](v4, "_setupIdentifier");
  return v4;
}

- (MTLGPUDebugAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5
{
  MTLGPUDebugAccelerationStructure *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugAccelerationStructure;
  v6 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  v6->_accelerationStructureType = a5;
  -[MTLGPUDebugAccelerationStructure _setupIdentifier](v6, "_setupIdentifier");
  return v6;
}

- (void)_setupIdentifier
{
  MTLBuffer *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t accelerationStructureType;

  v3 = (MTLBuffer *)-[MTLToolsDevice newInternalBufferWithLength:options:](self->super.super.super._device, "newInternalBufferWithLength:options:", 32, 0);
  self->_debugBuf = v3;
  v4 = (_QWORD *)-[MTLBuffer contents](v3, "contents");
  *v4 = -[MTLGPUDebugAccelerationStructure gpuAddress](self, "gpuAddress");
  v5 = -[MTLToolsObject gpuResourceID](self->super.super.super._baseObject, "gpuResourceID");
  accelerationStructureType = self->_accelerationStructureType;
  v4[1] = v5;
  v4[2] = accelerationStructureType;
  v4[3] = 0;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress", a3);
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)gpuAddress
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (unint64_t)underlyingGPUAddress
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (id)debugBuf
{
  return self->_debugBuf;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->_debugBuf, 1);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_debugBuf, 1, a5.var0.var1, *(_QWORD *)&a5.var1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugAccelerationStructure;
  -[MTLToolsAccelerationStructure dealloc](&v3, sel_dealloc);
}

- (MTLBuffer)childrenWrappersBuffer
{
  return self->_childrenWrappersBuffer;
}

- (void)setChildrenWrappersBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
