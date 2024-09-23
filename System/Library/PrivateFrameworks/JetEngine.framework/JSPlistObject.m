@implementation JSPlistObject

- (_TtC9JetEngine13JSPlistObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSPlistObject init](&v3, sel_init);
}

- (id)parse:(id)a3
{
  void *v5;
  id v6;
  _TtC9JetEngine13JSPlistObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id result;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    v10 = v6;
    v11 = (void *)sub_19CE036EC(v9, v10);

    return v11;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (id)stringify:(id)a3 :(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine13JSPlistObject *v10;
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
    v15 = (void *)sub_19CE037C4((uint64_t)v12, (uint64_t)v14, (uint64_t)v13);

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
