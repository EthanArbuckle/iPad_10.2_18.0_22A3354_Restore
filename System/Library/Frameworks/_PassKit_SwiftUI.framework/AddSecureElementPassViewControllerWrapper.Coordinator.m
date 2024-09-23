@implementation AddSecureElementPassViewControllerWrapper.Coordinator

- (void)addSecureElementPassViewController:(id)a3 didFinishAddingSecureElementPasses:(id)a4 error:(id)a5
{
  void *v6;
  id v9;
  id v10;
  _TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator *v11;

  v6 = a4;
  if (a4)
  {
    sub_22D8CC91C();
    v6 = (void *)sub_22D8E7070();
  }
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_22D8CC828(v6, a5);

  swift_bridgeObjectRelease();
}

- (_TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator)init
{
  _TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator *result;

  result = (_TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D8CC6BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion));
}

@end
