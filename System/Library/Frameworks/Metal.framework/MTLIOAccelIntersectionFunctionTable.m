@implementation MTLIOAccelIntersectionFunctionTable

- (MTLVisibleFunctionTableSPI)visibleFunctionTable
{
  return self->_visibleFunctionTable;
}

- (MTLBuffer)globalBuffer
{
  return (MTLBuffer *)-[MTLVisibleFunctionTableSPI globalBuffer](self->_visibleFunctionTable, "globalBuffer");
}

- (void)setGlobalBuffer:(id)a3
{
  -[MTLVisibleFunctionTableSPI setGlobalBuffer:](self->_visibleFunctionTable, "setGlobalBuffer:", a3);
}

- (unint64_t)globalBufferOffset
{
  return -[MTLVisibleFunctionTableSPI globalBufferOffset](self->_visibleFunctionTable, "globalBufferOffset");
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
  -[MTLVisibleFunctionTableSPI setGlobalBufferOffset:](self->_visibleFunctionTable, "setGlobalBufferOffset:", a3);
}

- (unint64_t)uniqueIdentifier
{
  return -[MTLVisibleFunctionTableSPI uniqueIdentifier](self->_visibleFunctionTable, "uniqueIdentifier");
}

- (unint64_t)resourceIndex
{
  return -[MTLVisibleFunctionTableSPI resourceIndex](self->_visibleFunctionTable, "resourceIndex");
}

- (unint64_t)gpuHandle
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[MTLIOAccelResource device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)return -[MTLIOAccelIntersectionFunctionTable uniqueIdentifier](self, "uniqueIdentifier");
  else
    return -[MTLIOAccelIntersectionFunctionTable resourceIndex](self, "resourceIndex");
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLVisibleFunctionTableSPI setBuffer:offset:atIndex:](self->_visibleFunctionTable, "setBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLVisibleFunctionTableSPI setBuffers:offsets:withRange:](self->_visibleFunctionTable, "setBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (MTLIOAccelIntersectionFunctionTable)initWithVisibleFunctionTable:(id)a3
{
  MTLIOAccelIntersectionFunctionTable *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelIntersectionFunctionTable;
  v4 = -[MTLIOAccelResource initWithResource:](&v6, sel_initWithResource_);
  if (v4)
    v4->_visibleFunctionTable = (MTLVisibleFunctionTableSPI *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelIntersectionFunctionTable;
  -[MTLIOAccelResource dealloc](&v3, sel_dealloc);
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLVisibleFunctionTableSPI setFunction:atIndex:](self->_visibleFunctionTable, "setFunction:atIndex:", a3, a4);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLVisibleFunctionTableSPI setFunctions:withRange:](self->_visibleFunctionTable, "setFunctions:withRange:", a3, a4.location, a4.length);
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLVisibleFunctionTableSPI setValue:atIndex:](self->_visibleFunctionTable, "setValue:atIndex:", 1, a4);
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  -[MTLVisibleFunctionTableSPI setValue:withRange:](self->_visibleFunctionTable, "setValue:withRange:", 1, a4.location, a4.length);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLVisibleFunctionTableSPI setValue:atIndex:](self->_visibleFunctionTable, "setValue:atIndex:", 1, a4);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  -[MTLVisibleFunctionTableSPI setValue:withRange:](self->_visibleFunctionTable, "setValue:withRange:", 1, a4.location, a4.length);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLVisibleFunctionTableSPI setVisibleFunctionTable:atBufferIndex:](self->_visibleFunctionTable, "setVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLVisibleFunctionTableSPI setVisibleFunctionTables:withBufferRange:](self->_visibleFunctionTable, "setVisibleFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return -[MTLVisibleFunctionTableSPI bufferAddressAtIndex:](self->_visibleFunctionTable, "bufferAddressAtIndex:", a3);
}

@end
