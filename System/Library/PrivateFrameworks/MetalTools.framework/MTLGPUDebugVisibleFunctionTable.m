@implementation MTLGPUDebugVisibleFunctionTable

- (MTLGPUDebugVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 computePipeline:(id)a5
{
  MTLGPUDebugVisibleFunctionTable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugVisibleFunctionTable;
  v5 = -[MTLToolsResource initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  -[MTLGPUDebugVisibleFunctionTable _setupCommon](v5, "_setupCommon");
  return v5;
}

- (MTLGPUDebugVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 renderPipeline:(id)a5 stage:(unint64_t)a6
{
  MTLGPUDebugVisibleFunctionTable *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugVisibleFunctionTable;
  v7 = -[MTLToolsResource initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3, a5);
  -[MTLGPUDebugVisibleFunctionTable _setupCommon](v7, "_setupCommon");
  v7->_stage = a6;
  return v7;
}

- (MTLGPUDebugVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 descriptor:(id)a4 device:(id)a5
{
  MTLGPUDebugVisibleFunctionTable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugVisibleFunctionTable;
  v5 = -[MTLToolsResource initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  -[MTLGPUDebugVisibleFunctionTable _setupCommon](v5, "_setupCommon");
  return v5;
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return *(_QWORD *)(-[MTLBuffer contents](self->_handleBuffer, "contents") + 8 * a3);
}

- (void)_setupCommon
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDataType:", 115);
  objc_msgSend(v3, "setIndex:", 0);
  v4 = -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  v7[0] = v3;
  v5 = (void *)objc_msgSend(v4, "newArgumentEncoderWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1));

  v6 = (void *)objc_msgSend(-[MTLToolsObject originalObject](self->super.super.super._device, "originalObject"), "newBufferWithLength:options:", 8, 0);
  objc_msgSend(v5, "setArgumentBuffer:offset:", v6, 0);
  objc_msgSend(v5, "setVisibleFunctionTable:atIndex:", -[MTLToolsObject originalObject](self, "originalObject"), 0);

  self->_gpuIdentifier = *(_QWORD *)objc_msgSend(v6, "contents");
  self->_handleBuffer = (MTLBuffer *)-[MTLToolsDevice newInternalBufferWithLength:options:](self->super.super.super._device, "newInternalBufferWithLength:options:", 248, 0);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "handleForOffset:", a4);
  *(_QWORD *)(-[MTLBuffer contents](self->_handleBuffer, "contents") + 8 * a5) = v7;
  -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", self->_handleBuffer, 8 * a5, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unsigned int v11;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    v10 = 0;
    v11 = 1;
    do
    {
      -[MTLGPUDebugVisibleFunctionTable setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", a3[v10], a4[v10], v10 + location);
      v10 = v11;
    }
    while (length > v11++);
  }
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->_handleBuffer);
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject, a4);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5;
  unint64_t var1;

  v5 = *(_QWORD *)&a5.var1;
  var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_handleBuffer);
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject, a4, var1, v5);
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return self->_gpuIdentifier;
}

- (unint64_t)gpuAddress
{
  return self->_gpuIdentifier;
}

- (unint64_t)length
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugVisibleFunctionTable;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

@end
