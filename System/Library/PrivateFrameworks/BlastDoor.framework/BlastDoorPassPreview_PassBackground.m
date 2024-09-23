@implementation BlastDoorPassPreview_PassBackground

- (NSString)description
{
  void *v2;
  char __dst[472];

  sub_1AD41808C((char *)self + OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground, __dst);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorPassPreview_PassImage)image
{
  BlastDoorPassPreview_PassBackground *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4D2BF8();

  return (BlastDoorPassPreview_PassImage *)v3;
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

  v8 = *(_OWORD *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 432];
  v2 = *(_QWORD *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 448];
  v3 = *(_QWORD *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 456];
  v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v8;
  *((_QWORD *)v6 + 2) = v2;
  *((_QWORD *)v6 + 3) = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  return (BlastDoorColor *)-[BlastDoorPassPreview_PassBackground init](&v9, sel_init);
}

- (BlastDoorPassPreview_PassBackground)init
{
  BlastDoorPassPreview_PassBackground *result;

  result = (BlastDoorPassPreview_PassBackground *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4180C0((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground));
}

@end
