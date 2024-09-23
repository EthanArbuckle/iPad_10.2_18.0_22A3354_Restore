@implementation CKCatchUpButtonManager

- (UIViewController)catchUpButtonHost
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost));
}

- (_TtC7ChatKit22CKCatchUpButtonManager)initWithDidTapButton:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  return (_TtC7ChatKit22CKCatchUpButtonManager *)CKCatchUpButtonManager.init(didTapButton:)((uint64_t)sub_18E727A98, v4);
}

- (void)animateInResumingFromBackground:(BOOL)a3
{
  _TtC7ChatKit22CKCatchUpButtonManager *v4;

  v4 = self;
  sub_18E726654(a3);

}

- (void)animateOutWithCompletion:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  _TtC7ChatKit22CKCatchUpButtonManager *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_18E7279D0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18E7269E4((uint64_t)v5);
  sub_18E011A40((uint64_t)v5);

}

- (_TtC7ChatKit22CKCatchUpButtonManager)init
{
  _TtC7ChatKit22CKCatchUpButtonManager *result;

  result = (_TtC7ChatKit22CKCatchUpButtonManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
