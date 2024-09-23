@implementation DOCNeedsAuthenticationNode

- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)initWithCoder:(id)a3
{
  type metadata accessor for DOCNeedsAuthenticationNode();
  swift_deallocPartialClassInstance();
  return 0;
}

- (NSError)enumeratorError
{
  id v3;
  _TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode *v4;
  void *v5;
  id v6;
  void *v7;

  sub_21EB02B88();
  v3 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v4 = self;
  v5 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithDomain_code_userInfo_, v5, -1000, 0);

  v7 = (void *)sub_21EB02228();
  return (NSError *)v7;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  id v4;
  _TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode *v5;
  void *v6;
  id v7;

  v4 = objc_allocWithZone(MEMORY[0x24BE2BE98]);
  sub_21EA579D4(0, (unint64_t *)&unk_2540A6EA0);
  v5 = self;
  v6 = (void *)sub_21EB02CE4();
  v7 = objc_msgSend(v4, sel_initWithChildren_fullyPopulated_options_, v6, 1, 0);

  return v7;
}

- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)init
{
  _TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode *result;

  result = (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode_domain));
}

@end
