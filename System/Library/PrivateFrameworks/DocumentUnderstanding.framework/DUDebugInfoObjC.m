@implementation DUDebugInfoObjC

- (DUDebugInfoObjC)init
{
  DUDebugInfoObjC *v2;
  _TtC21DocumentUnderstanding11DUDebugInfo *v3;
  _TtC21DocumentUnderstanding11DUDebugInfo *underlying;
  DUDebugInfoObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUDebugInfoObjC;
  v2 = -[DUDebugInfoObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding11DUDebugInfo);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)debugString
{
  return -[DUDebugInfo debugString](self->_underlying, "debugString");
}

- (void)setDebugString:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDebugInfo setDebugString:](self->_underlying, "setDebugString:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
