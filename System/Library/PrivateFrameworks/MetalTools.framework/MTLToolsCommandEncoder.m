@implementation MTLToolsCommandEncoder

- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsCommandEncoder *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLToolsCommandEncoder;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result)
    result->_commandBuffer = (MTLToolsRetainingContainer *)a4;
  return result;
}

- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parallelRenderCommandEncoder:(id)a4
{
  MTLToolsCommandEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLToolsCommandEncoder;
  v5 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3);
  if (v5)
    v5->_commandBuffer = (MTLToolsRetainingContainer *)objc_msgSend(a4, "commandBuffer");
  return v5;
}

- (void)addRetainedObject:(id)a3
{
  -[MTLToolsRetainingContainer addRetainedObject:](self->_commandBuffer, "addRetainedObject:", a3);
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

- (void)endEncoding
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (void)insertDebugSignpost:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugSignpost:", a3);
}

- (void)pushDebugGroup:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
}

- (void)popDebugGroup
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "filterCounterRangeWithFirstBatch:lastBatch:filterIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (MTLToolsRetainingContainer)commandBuffer
{
  return self->_commandBuffer;
}

@end
