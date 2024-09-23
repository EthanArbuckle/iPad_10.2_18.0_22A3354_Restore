@implementation MTLGPUDebugIntersectionFunctionTable

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5
{
  MTLGPUDebugIntersectionFunctionTable *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  v6 = -[MTLToolsResource initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
  {
    v6->_functionCount = objc_msgSend(a5, "functionCount");
    v6->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v6->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    -[MTLGPUDebugIntersectionFunctionTable _setupIdentifier](v6, "_setupIdentifier");
    -[MTLGPUDebugIntersectionFunctionTable _initHandleBuffer](v6, "_initHandleBuffer");
  }
  return v6;
}

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 computePipelineState:(id)a6
{
  MTLGPUDebugIntersectionFunctionTable *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  v8 = -[MTLToolsResource initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3, a4);
  if (v8)
  {
    v8->_functionCount = objc_msgSend(a5, "functionCount");
    v8->_computePipelineState = (MTLGPUDebugComputePipelineState *)a6;
    v8->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v8->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    -[MTLGPUDebugIntersectionFunctionTable _setupIdentifier](v8, "_setupIdentifier");
    -[MTLGPUDebugIntersectionFunctionTable _initHandleBuffer](v8, "_initHandleBuffer");
  }
  return v8;
}

- (MTLGPUDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 device:(id)a4 descriptor:(id)a5 renderPipelineState:(id)a6 stage:(unint64_t)a7
{
  MTLGPUDebugIntersectionFunctionTable *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  v10 = -[MTLToolsResource initWithBaseObject:parent:](&v12, sel_initWithBaseObject_parent_, a3, a4);
  if (v10)
  {
    v10->_functionCount = objc_msgSend(a5, "functionCount");
    v10->_renderPipelineState = (MTLGPUDebugRenderPipelineState *)a6;
    v10->_handleBuffer = (MTLBuffer *)objc_msgSend(-[MTLToolsObject baseObject](v10->super.super.super._device, "baseObject"), "newBufferWithLength:options:", 248, 0);
    v10->_stage = a7;
    -[MTLGPUDebugIntersectionFunctionTable _setupIdentifier](v10, "_setupIdentifier");
    -[MTLGPUDebugIntersectionFunctionTable _initHandleBuffer](v10, "_initHandleBuffer");
  }
  return v10;
}

- (void)_initHandleBuffer
{
  uint64_t v3;
  uint64_t i;

  v3 = 0;
  for (i = 0; i != 31; ++i)
  {
    *(_QWORD *)(-[MTLBuffer contents](self->_handleBuffer, "contents") + 8 * i) = 0;
    -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", self->_handleBuffer, v3, i);
    v3 += 8;
  }
}

- (void)_setupIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDataType:", 116);
  objc_msgSend(v3, "setIndex:", 0);
  v4 = -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  v7[0] = v3;
  v5 = (void *)objc_msgSend(v4, "newArgumentEncoderWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1));

  v6 = (void *)objc_msgSend(-[MTLToolsObject originalObject](self->super.super.super._device, "originalObject"), "newBufferWithLength:options:", 8, 0);
  objc_msgSend(v5, "setArgumentBuffer:offset:", v6, 0);
  objc_msgSend(v5, "setIntersectionFunctionTable:atIndex:", -[MTLToolsObject originalObject](self, "originalObject"), 0);

  self->_gpuIdentifier = *(_QWORD *)objc_msgSend(v6, "contents");
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject);
  objc_msgSend(a3, "useResourceInternal:usage:", self->_handleBuffer, a4);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5;
  unint64_t var1;

  v5 = *(_QWORD *)&a5.var1;
  var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject);
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_handleBuffer, a4, var1, v5);
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
    -[MTLToolsObject setFunction:atIndex:](self->super.super.super._baseObject, "setFunction:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLGPUDebugIntersectionFunctionTable setFunction:atIndex:](self, "setFunction:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return *(_QWORD *)(-[MTLBuffer contents](self->_handleBuffer, "contents") + 8 * a3);
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
  uint64_t i;

  if (a5.length)
  {
    length = a5.length;
    for (i = 0; i != length; ++i)
      -[MTLGPUDebugIntersectionFunctionTable setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", a3[i], a4[i], i);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a3, "gpuResourceID");
  *(_QWORD *)(-[MTLBuffer contents](self->_handleBuffer, "contents") + 8 * a4) = v6;
  -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super.super._baseObject, "setBuffer:offset:atIndex:", self->_handleBuffer, 8 * a4, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLGPUDebugIntersectionFunctionTable setVisibleFunctionTable:atBufferIndex:](self, "setVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
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
  v3.super_class = (Class)MTLGPUDebugIntersectionFunctionTable;
  -[MTLToolsIntersectionFunctionTable dealloc](&v3, sel_dealloc);
}

@end
