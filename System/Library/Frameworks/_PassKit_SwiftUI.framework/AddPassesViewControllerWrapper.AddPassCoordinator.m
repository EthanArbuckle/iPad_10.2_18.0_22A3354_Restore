@implementation AddPassesViewControllerWrapper.AddPassCoordinator

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  _TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *v5;
  objc_super v6;

  __swift_instantiateConcreteTypeFromMangledName(qword_255DA08C0);
  v3 = swift_allocObject();
  v4 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v3 + 16) = xmmword_22D8E8890;
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 32) = 0x74696E696564;
  *(_QWORD *)(v3 + 40) = 0xE600000000000000;
  v5 = self;
  sub_22D8E71C0();
  swift_bridgeObjectRelease();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
  -[AddPassesViewControllerWrapper.AddPassCoordinator dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_22D8CC6BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion));
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  uint64_t *v4;
  void (*v5)(id);
  void *v6;
  id v7;
  _TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *v8;
  uint64_t v9;
  id v10;
  _TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *v11;

  v4 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion);
  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion);
  if (v5)
  {
    v6 = (void *)objc_opt_self();
    v7 = a3;
    v8 = self;
    sub_22D8DCE80((uint64_t)v5);
    v5(objc_msgSend(v6, sel_didAddPasses_, v7));
    sub_22D8CC6BC((uint64_t)v5);
    v9 = *v4;
  }
  else
  {
    v10 = a3;
    v11 = self;
    v9 = 0;
  }
  *v4 = 0;
  v4[1] = 0;
  sub_22D8CC6BC(v9);

}

- (_TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator)init
{
  _TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *result;

  result = (_TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
