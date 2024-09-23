@implementation MTLDebugFunctionHandle

- (MTLDebugFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5 stage:(unint64_t)a6
{
  MTLDebugFunctionHandle *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugFunctionHandle;
  result = -[MTLToolsFunctionHandle initWithBaseObject:parent:function:](&v8, sel_initWithBaseObject_parent_function_, a3, a4, a5);
  if (result)
    result->_stage = a6;
  return result;
}

- (unint64_t)stage
{
  return self->_stage;
}

@end
