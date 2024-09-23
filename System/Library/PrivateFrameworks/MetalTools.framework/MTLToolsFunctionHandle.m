@implementation MTLToolsFunctionHandle

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsObjectCache removeKey:](self->super._device->functionHandleObjectCache, "removeKey:", self->super._baseObject);

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsFunctionHandle;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (MTLToolsFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5
{
  MTLToolsFunctionHandle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLToolsFunctionHandle;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
    v6->_function = (MTLToolsFunction *)a5;
  return v6;
}

- (unint64_t)functionType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionType");
}

- (NSString)name
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "name");
}

- (MTLToolsFunction)function
{
  return self->_function;
}

@end
