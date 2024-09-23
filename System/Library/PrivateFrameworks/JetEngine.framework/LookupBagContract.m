@implementation LookupBagContract

- (id)unpersonalizedLookupURL
{
  void *v2;
  _TtC9JetEngine17LookupBagContract *v3;
  void *v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine17LookupBagContract_backing);
  v3 = self;
  v4 = (void *)sub_19CFDF554();
  v5 = objc_msgSend(v2, sel_URLForKey_, v4);

  return v5;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
