@implementation DropInManager

- (void)dealloc
{
  _TtC10DropInCore13DropInManager *v2;

  v2 = self;
  sub_23A7940A0();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v3 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_357(v3);
  v4 = sub_23A7F1DE8();
  OUTLINED_FUNCTION_357(v4);

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_371();
  OUTLINED_FUNCTION_371();
  OUTLINED_FUNCTION_371();
  OUTLINED_FUNCTION_371();
  sub_23A77EF5C((uint64_t)self + OBJC_IVAR____TtC10DropInCore13DropInManager_xpcClientDataSource);
  OUTLINED_FUNCTION_371();
  sub_23A7A79C8((uint64_t)self + OBJC_IVAR____TtC10DropInCore13DropInManager_dropInSessionAnalyticEvent, (uint64_t (*)(_QWORD))type metadata accessor for DropInSessionAnalyticEvent);
}

- (_TtC10DropInCore13DropInManager)init
{
  sub_23A797BFC();
}

- (void)didAddHome:(id)a3
{
  id v4;
  _TtC10DropInCore13DropInManager *v5;

  v4 = a3;
  v5 = self;
  sub_23A79C7CC();

}

- (void)didRemoveHome:(id)a3
{
  id v4;
  _TtC10DropInCore13DropInManager *v5;

  v4 = a3;
  v5 = self;
  sub_23A79CB4C();

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore13DropInManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A79D184();

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore13DropInManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A79D184();

}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4;
  _TtC10DropInCore13DropInManager *v5;

  v4 = a3;
  v5 = self;
  sub_23A79D5D8();

}

- (void)accessoryDidUpdateSupportedCapabilities:(id)a3
{
  id v4;
  _TtC10DropInCore13DropInManager *v5;

  v4 = a3;
  v5 = self;
  sub_23A79D5D8();

}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore13DropInManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A79D928();

}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore13DropInManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A79DC18(v6, v7);

}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore13DropInManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A79DE0C();

}

@end
