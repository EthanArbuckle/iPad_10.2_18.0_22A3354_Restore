@implementation TSNewsActivitySender

- (TSNewsActivitySender)initWithViewController:(id)a3 presentationTransitionFactory:(id)a4 dismissalTransitionFactory:(id)a5
{
  objc_class *ObjectType;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id (**v14)();
  id (**v15)(char);
  id v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivitySender_viewController) = (Class)a3;
  v14 = (id (**)())((char *)self + OBJC_IVAR___TSNewsActivitySender_presentationTransitionFactory);
  *v14 = sub_1D605CE34;
  v14[1] = (id (*)())v12;
  v15 = (id (**)(char))((char *)self + OBJC_IVAR___TSNewsActivitySender_dismissalTransitionFactory);
  *v15 = sub_1D605CE54;
  v15[1] = (id (*)(char))v13;
  v18.receiver = self;
  v18.super_class = ObjectType;
  v16 = a3;
  return -[TSNewsActivitySender init](&v18, sel_init);
}

- (TSNewsActivitySender)init
{
  TSNewsActivitySender *result;

  result = (TSNewsActivitySender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
}

@end
