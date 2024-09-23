@implementation CKXArrayProxyBase

- (void)associateWithListInstance:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_listInstance.structToken = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_listInstance.page = v3;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKXArrayProxyBase;
  -[CKXProxyBase reset](&v3, sel_reset);
  self->_listInstance.structToken = -1;
}

- ($3CC19D079FD0B010EE84973AA846B91B)listInstance
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

@end
