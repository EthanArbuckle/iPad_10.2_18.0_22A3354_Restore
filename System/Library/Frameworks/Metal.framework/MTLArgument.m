@implementation MTLArgument

+ (MTLArgument)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLArgument *)+[MTLArgument allocWithZone:](MTLBindingInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLArgument;
  return (MTLArgument *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLArgument)bufferIndirectArgumentType
{
  return self->_bufferIndirectArgumentType;
}

- (unint64_t)indirectConstantAlignment
{
  return self->_indirectConstantAlignment;
}

- (unint64_t)indirectConstantDataSize
{
  return self->_indirectConstantDataSize;
}

- (unint64_t)indirectConstantDataType
{
  return self->_indirectConstantDataType;
}

@end
