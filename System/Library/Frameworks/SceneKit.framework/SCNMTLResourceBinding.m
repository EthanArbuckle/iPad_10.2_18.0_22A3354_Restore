@implementation SCNMTLResourceBinding

- (void)setArgument:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (SCNMTLResourceBinding)init
{
  SCNMTLResourceBinding *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLResourceBinding;
  result = -[SCNMTLResourceBinding init](&v3, sel_init);
  *(_DWORD *)&result->_indices.vertexIndex = -1;
  result->_usedResources = 0;
  return result;
}

- (void)setNeedsRenderResource:(BOOL)a3
{
  self->_needsRenderResource = a3;
}

- (void)setBindBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)bindBlock
{
  return self->_bindBlock;
}

- (unint64_t)type
{
  return -[MTLArgument type](self->_argument, "type");
}

- (BOOL)needsRenderResource
{
  return self->_needsRenderResource;
}

- (NSString)name
{
  return -[MTLArgument name](self->_argument, "name");
}

- (MTLArgumentEncoder)argumentEncoder
{
  return self->_argumentEncoder;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLResourceBinding;
  -[SCNMTLResourceBinding dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> \"%@\"), NSStringFromClass(v4), self, -[MTLArgument name](self->_argument, "name"));
  return v3;
}

- (NSMutableArray)usedResources
{
  NSMutableArray *result;

  result = self->_usedResources;
  if (!result)
  {
    result = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    self->_usedResources = result;
  }
  return result;
}

- (MTLArgument)argument
{
  return self->_argument;
}

- (void)setArgumentEncoder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
