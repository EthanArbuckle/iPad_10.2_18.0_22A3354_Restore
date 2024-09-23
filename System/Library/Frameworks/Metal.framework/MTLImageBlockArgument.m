@implementation MTLImageBlockArgument

- (void)setStructType:(id)a3
{
  self->super._typeInfo = (MTLType *)a3;
}

- (MTLImageBlockArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 index:(unint64_t)a7 kind:(unint64_t)a8 dataSize:(unsigned int)a9 masterStructMembers:(id)a10 aliasImplicitImageBlock:(BOOL)a11 aliasImplicitImageBlockRenderTarget:(unsigned int)a12
{
  MTLImageBlockArgument *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLImageBlockArgument;
  v13 = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v15, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  v13->_kind = a8;
  v13->_dataSize = a9;
  v13->_masterStructMembers = (MTLStructTypeInternal *)a10;
  v13->_aliasImplicitImageBlock = a11;
  v13->_aliasImplicitImageBlockRenderTarget = a12;
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  self->_masterStructMembers = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLImageBlockArgument;
  -[MTLBindingInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)imageBlockKind
{
  return self->_kind;
}

- (unint64_t)imageBlockDataSize
{
  return self->_dataSize;
}

- (id)imageBlockMasterStructMembers
{
  return self->_masterStructMembers;
}

- (BOOL)aliasImplicitImageBlock
{
  return self->_aliasImplicitImageBlock;
}

- (unint64_t)aliasImplicitImageBlockRenderTarget
{
  return self->_aliasImplicitImageBlockRenderTarget;
}

- (BOOL)isEqual:(id)a3
{
  MTLStructTypeInternal *masterStructMembers;
  _BOOL4 v6;
  objc_super v8;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_kind == *((_QWORD *)a3 + 21)
      && self->_dataSize == *((_DWORD *)a3 + 44)
      && self->_aliasImplicitImageBlock == *((unsigned __int8 *)a3 + 192)
      && self->_aliasImplicitImageBlockRenderTarget == *((_DWORD *)a3 + 49))
    {
      masterStructMembers = self->_masterStructMembers;
      if (!((unint64_t)masterStructMembers | *((_QWORD *)a3 + 23))
        || (v6 = -[MTLStructTypeInternal isEqual:](masterStructMembers, "isEqual:")))
      {
        v8.receiver = self;
        v8.super_class = (Class)MTLImageBlockArgument;
        LOBYTE(v6) = -[MTLBindingInternal isEqual:](&v8, sel_isEqual_, a3);
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end
