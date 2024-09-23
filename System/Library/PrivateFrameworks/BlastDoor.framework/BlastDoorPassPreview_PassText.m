@implementation BlastDoorPassPreview_PassText

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)text
{
  return (NSString *)sub_1AD4D24E8();
}

- (BlastDoorColor)color
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  char *v6;
  __int128 v8;
  objc_super v9;

  v8 = *(_OWORD *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 8];
  v2 = *(_QWORD *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 24];
  v3 = *(_QWORD *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 32];
  v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v8;
  *((_QWORD *)v6 + 2) = v2;
  *((_QWORD *)v6 + 3) = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  return (BlastDoorColor *)-[BlastDoorPassPreview_PassText init](&v9, sel_init);
}

- (BlastDoorPassPreview_PassText)init
{
  BlastDoorPassPreview_PassText *result;

  result = (BlastDoorPassPreview_PassText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
