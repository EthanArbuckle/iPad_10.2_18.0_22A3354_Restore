@implementation DUClientObjC

- (DUClientObjC)initWithIdentifier:(id)a3
{
  id v4;
  DUClientObjC *v5;
  _TtC21DocumentUnderstanding8DUClient *v6;
  _TtC21DocumentUnderstanding8DUClient *underlyingObject;
  DUClientObjC *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DUClientObjC;
  v5 = -[DUClientObjC init](&v10, sel_init);
  if (v5)
  {
    v6 = -[DUClient initWithIdentifier:]([_TtC21DocumentUnderstanding8DUClient alloc], "initWithIdentifier:", v4);
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return -[DUClient identifier](self->_underlyingObject, "identifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
