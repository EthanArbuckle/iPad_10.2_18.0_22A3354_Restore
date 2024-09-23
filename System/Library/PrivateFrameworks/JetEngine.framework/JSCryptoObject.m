@implementation JSCryptoObject

- (_TtC9JetEngine14JSCryptoObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSCryptoObject init](&v3, sel_init);
}

- (BOOL)supports:(id)a3
{
  id v4;
  _TtC9JetEngine14JSCryptoObject *v5;
  int v6;
  unsigned __int8 v8;

  v4 = a3;
  v5 = self;
  sub_19CE7D128(v4, (char *)&v8);
  v6 = v8;

  return v6 != 2;
}

- (id)hash:(id)a3 :(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine14JSCryptoObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id result;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    v13 = v8;
    v14 = v9;
    v15 = (void *)sub_19CE03DA0((uint64_t)v12, (uint64_t)v13, (uint64_t)v14);

    return v15;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

@end
