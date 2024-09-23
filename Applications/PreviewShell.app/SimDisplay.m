@implementation SimDisplay

- (NSString)name
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_name];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (unsigned)displayID
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID);
}

- (UISDeviceContext)deviceContext
{
  return (UISDeviceContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities));
}

- (UISDisplayContext)displayContext
{
  return (UISDisplayContext *)*(id *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities];
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return (FBSDisplayConfiguration *)objc_msgSend(*(id *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities], "displayConfiguration");
}

- (_TtC12PreviewShell10SimDisplay)initWithName:(id)a3 displayID:(unsigned int)a4 displayConfiguration:(id)a5 capabilitiesPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC12PreviewShell10SimDisplay *v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a6)
  {
    a6 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  v15 = (_TtC12PreviewShell10SimDisplay *)sub_10000EB5C(v9, v11, a4, v14, (uint64_t)a6, v13);

  return v15;
}

- (_TtC12PreviewShell10SimDisplay)init
{
  _TtC12PreviewShell10SimDisplay *result;

  result = (_TtC12PreviewShell10SimDisplay *)_swift_stdlib_reportUnimplementedInitializer("PreviewShell.SimDisplay", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_name]);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities);

}

@end
