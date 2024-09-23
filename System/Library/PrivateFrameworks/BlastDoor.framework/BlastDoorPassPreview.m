@implementation BlastDoorPassPreview

- (NSString)description
{
  void *v2;
  char __dst[1496];

  sub_1AD4190B4((char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview, __dst);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorPassPreview_PassImage)headerImage
{
  BlastDoorPassPreview *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BF0B8();

  return (BlastDoorPassPreview_PassImage *)v3;
}

- (BlastDoorPassPreview_PassImage)icon
{
  BlastDoorPassPreview *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BF220();

  return (BlastDoorPassPreview_PassImage *)v3;
}

- (BlastDoorPassPreview_PassBackground)background
{
  objc_class *v3;
  char *v4;
  BlastDoorPassPreview *v5;
  BlastDoorPassPreview *v6;
  objc_super v8;
  _QWORD __dst[59];

  sub_1AD41808C((char *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 872], (char *)__dst);
  v3 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassBackgroundWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  sub_1AD41808C((char *)__dst, &v4[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground]);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = -[BlastDoorPassPreview init](&v8, sel_init);
  sub_1AD4180C0(__dst);

  return (BlastDoorPassPreview_PassBackground *)v6;
}

- (BlastDoorPassPreview_PassText)primaryText
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  BlastDoorPassPreview *v10;
  __int128 v12;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  v3 = *(_QWORD *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1352];
  if (v3)
  {
    v4 = *((_QWORD *)v2 + 174);
    v5 = *((_QWORD *)v2 + 173);
    v12 = *(_OWORD *)(v2 + 1368);
    v6 = *((_QWORD *)v2 + 169);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(_QWORD *)v9 = v6;
    *((_QWORD *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((_QWORD *)v9 + 4) = v5;
    *((_QWORD *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = -[BlastDoorPassPreview init](&v13, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorPassPreview_PassText)secondaryText
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  BlastDoorPassPreview *v10;
  __int128 v12;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  v3 = *(_QWORD *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1400];
  if (v3)
  {
    v4 = *((_QWORD *)v2 + 180);
    v5 = *((_QWORD *)v2 + 179);
    v12 = *(_OWORD *)(v2 + 1416);
    v6 = *((_QWORD *)v2 + 175);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(_QWORD *)v9 = v6;
    *((_QWORD *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((_QWORD *)v9 + 4) = v5;
    *((_QWORD *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = -[BlastDoorPassPreview init](&v13, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorPassPreview_PassText)tertiaryText
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  BlastDoorPassPreview *v10;
  __int128 v12;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  v3 = *(_QWORD *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1448];
  if (v3)
  {
    v4 = *((_QWORD *)v2 + 186);
    v5 = *((_QWORD *)v2 + 185);
    v12 = *(_OWORD *)(v2 + 1464);
    v6 = *((_QWORD *)v2 + 181);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(_QWORD *)v9 = v6;
    *((_QWORD *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((_QWORD *)v9 + 4) = v5;
    *((_QWORD *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = -[BlastDoorPassPreview init](&v13, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorColor)backgroundColor
{
  uint64_t v3;
  uint64_t v4;
  BlastDoorPassPreview *v5;
  objc_class *v6;
  char *v7;
  char *v8;
  BlastDoorPassPreview *v9;
  __int128 v11;
  objc_super v12;
  _QWORD __dst[165];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  sub_1AD4190B4((char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview, (char *)__dst);
  v11 = v14;
  v3 = v15;
  v4 = v16;
  v5 = self;
  sub_1AD4190E8(__dst);
  v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v8 = v11;
  *((_QWORD *)v8 + 2) = v3;
  *((_QWORD *)v8 + 3) = v4;
  v12.receiver = v7;
  v12.super_class = v6;
  v9 = -[BlastDoorPassPreview init](&v12, sel_init);

  return (BlastDoorColor *)v9;
}

- (BlastDoorPassPreview)init
{
  BlastDoorPassPreview *result;

  result = (BlastDoorPassPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4190E8((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorPassPreview_passPreview));
}

@end
