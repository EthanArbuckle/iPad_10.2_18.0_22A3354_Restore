@implementation _EXQueryController

+ (id)executeQuery:(id)a3
{
  uint64_t inited;
  id v5;
  void *v6;
  unint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD98DC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_190CADDD0;
  *(_QWORD *)(inited + 32) = a3;
  v8 = inited;
  sub_190CA86D4();
  v5 = a3;
  sub_190C73A44(v8);
  swift_bridgeObjectRelease();

  sub_190C7F614();
  v6 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return v6;
}

+ (void)executeQuery:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD98DC0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_190CADDD0;
  *(_QWORD *)(v7 + 32) = a3;
  v9 = v7;
  sub_190CA86D4();
  v8 = a3;
  sub_190C73B98(v9, (uint64_t)sub_190C7F6A0, v6);

  swift_release();
  swift_bridgeObjectRelease();
}

+ (id)executeQueries:(id)a3
{
  unint64_t v3;
  void *v4;

  type metadata accessor for _EXQuery();
  v3 = sub_190CA86BC();
  sub_190C73A44(v3);
  swift_bridgeObjectRelease();
  sub_190C7F614();
  v4 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return v4;
}

+ (void)executeQueries:(id)a3 completionHandler:(id)a4
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  type metadata accessor for _EXQuery();
  v5 = sub_190CA86BC();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  sub_190C73B98(v5, (uint64_t)sub_190C7F674, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

- (_EXQueryControllerDelegate)delegate
{
  return (_EXQueryControllerDelegate *)(id)MEMORY[0x194018968]((char *)self+ OBJC_IVAR____EXQueryController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSArray)extensionIdentities
{
  _EXQueryController *v2;
  void *v3;

  v2 = self;
  sub_190C7ECD4();

  sub_190C7F614();
  v3 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSArray)queries
{
  void *v2;

  type metadata accessor for _EXQuery();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_EXQueryController)initWithQueries:(id)a3 delegate:(id)a4
{
  unint64_t v4;
  char *v5;

  type metadata accessor for _EXQuery();
  v4 = sub_190CA86BC();
  swift_unknownObjectRetain();
  v5 = sub_190C7F4E0(v4);
  swift_unknownObjectRelease();
  return (_EXQueryController *)v5;
}

- (_EXQueryController)initWithQueries:(id)a3
{
  unint64_t v3;

  type metadata accessor for _EXQuery();
  v3 = sub_190CA86BC();
  return (_EXQueryController *)sub_190C7EE3C(v3);
}

- (void)resume
{
  _EXQueryController *v2;

  v2 = self;
  sub_190C70D7C();

}

- (void)suspend
{
  _EXQueryController *v2;

  v2 = self;
  sub_190C714D8();

}

- (NSString)description
{
  void *v2;
  _EXQueryController *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryController_innerController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_description);
  sub_190CA85F0();

  v5 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSArray)extensions
{
  _EXQueryController *v2;
  void *v3;

  v2 = self;
  sub_190C7F298();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE20BCB8);
  v3 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_EXQueryController)init
{
  _EXQueryController *result;

  result = (_EXQueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_190C7F67C((uint64_t)self + OBJC_IVAR____EXQueryController_delegate);
}

@end
