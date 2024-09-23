@implementation AISChildSetupPresenter

- (AISChildSetupPresenterDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___AISChildSetupPresenter_delegate;
  swift_beginAccess();
  return (AISChildSetupPresenterDelegate *)(id)MEMORY[0x23B7F8D8C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (AISViewControllerPresentationHandlerProtocol)presentationHandler
{
  return (AISViewControllerPresentationHandlerProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR___AISChildSetupPresenter_presentationHandler));
}

- (void)setPresentationHandler:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISChildSetupPresenter_presentationHandler);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISChildSetupPresenter_presentationHandler) = (Class)a3;
  v3 = a3;

}

- (AISChildSetupStoreProtocol)childSetupStore
{
  return (AISChildSetupStoreProtocol *)(id)swift_unknownObjectRetain();
}

- (AISChildSetupPresenter)init
{
  objc_class *ObjectType;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AISChildSetupPresenter *v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone((Class)sub_2367364F0()), sel_init);
  sub_236735F80();
  v4 = sub_236735F74();
  sub_2367366F4();
  v5 = sub_2367366E8();
  sub_2367364E4();
  swift_allocObject();
  v6 = sub_2367364D8();
  sub_23673667C();
  swift_allocObject();
  v7 = sub_236736670();
  v8 = (AISChildSetupPresenter *)sub_23671F858(v3, v4, v5, v6, v7, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)startFlowWithViewControllerPresentationHandler:(id)a3
{
  id v5;
  AISChildSetupPresenter *v6;

  swift_getObjectType();
  v5 = a3;
  v6 = self;
  sub_23671F654(v5, (uint64_t)v6);

}

- (void)dealloc
{
  AISChildSetupPresenter *v2;

  v2 = self;
  AISChildSetupPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_2366BDBF0((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_delegate);

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_analytics);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_biome);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AISChildSetupPresenter_familyCircleProvider);
}

@end
