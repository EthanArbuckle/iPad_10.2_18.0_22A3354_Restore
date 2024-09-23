@implementation BlastDoorOrderPreview

- (NSString)description
{
  void *v2;
  char v4[656];

  sub_1AD2F8028((char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview, v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorOrderPreview_OrderImage)headerImage
{
  BlastDoorOrderPreview *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BE6B8();

  return (BlastDoorOrderPreview_OrderImage *)v3;
}

- (BlastDoorColor)backgroundColor
{
  char *v2;
  BlastDoorOrderPreview *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v10;
  objc_super v11;

  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  if ((self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 472] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = *((_QWORD *)v2 + 58);
    v4 = *((_QWORD *)v2 + 59);
    v10 = *((_OWORD *)v2 + 28);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((_QWORD *)v8 + 2) = v5;
    *((_QWORD *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    v3 = -[BlastDoorOrderPreview init](&v11, sel_init);
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorOrderPreview_OrderText)primaryText
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  objc_class *v7;
  char *v8;
  char *v9;
  __int128 v11;
  objc_super v12;

  v3 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 480];
  v2 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 488];
  v11 = *(_OWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 496];
  v4 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 512];
  v5 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 520];
  v6 = self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 528];
  v7 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
  *(_QWORD *)v9 = v3;
  *((_QWORD *)v9 + 1) = v2;
  *((_OWORD *)v9 + 1) = v11;
  *((_QWORD *)v9 + 4) = v4;
  *((_QWORD *)v9 + 5) = v5;
  v9[48] = v6;
  v12.receiver = v8;
  v12.super_class = v7;
  swift_bridgeObjectRetain();
  return (BlastDoorOrderPreview_OrderText *)-[BlastDoorOrderPreview init](&v12, sel_init);
}

- (BlastDoorOrderPreview_OrderText)secondaryText
{
  char *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  char *v10;
  BlastDoorOrderPreview *v11;
  __int128 v13;
  objc_super v14;

  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  v3 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 544];
  if (v3)
  {
    v4 = v2[592];
    v5 = *((_QWORD *)v2 + 73);
    v6 = *((_QWORD *)v2 + 72);
    v13 = *((_OWORD *)v2 + 35);
    v7 = *((_QWORD *)v2 + 68);
    v8 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    v10 = &v9[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
    *(_QWORD *)v10 = v7;
    *((_QWORD *)v10 + 1) = v3;
    *((_OWORD *)v10 + 1) = v13;
    *((_QWORD *)v10 + 4) = v6;
    *((_QWORD *)v10 + 5) = v5;
    v10[48] = v4 & 1;
    v14.receiver = v9;
    v14.super_class = v8;
    swift_bridgeObjectRetain();
    v11 = -[BlastDoorOrderPreview init](&v14, sel_init);
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorOrderPreview_OrderText *)v11;
}

- (BlastDoorOrderPreview_OrderText)tertiaryText
{
  char *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  char *v10;
  BlastDoorOrderPreview *v11;
  __int128 v13;
  objc_super v14;

  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  v3 = *(_QWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 600];
  if (v3)
  {
    v4 = v2[648];
    v5 = *((_QWORD *)v2 + 80);
    v6 = *((_QWORD *)v2 + 79);
    v13 = *(_OWORD *)(v2 + 616);
    v7 = *((_QWORD *)v2 + 75);
    v8 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    v10 = &v9[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
    *(_QWORD *)v10 = v7;
    *((_QWORD *)v10 + 1) = v3;
    *((_OWORD *)v10 + 1) = v13;
    *((_QWORD *)v10 + 4) = v6;
    *((_QWORD *)v10 + 5) = v5;
    v10[48] = v4 & 1;
    v14.receiver = v9;
    v14.super_class = v8;
    swift_bridgeObjectRetain();
    v11 = -[BlastDoorOrderPreview init](&v14, sel_init);
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorOrderPreview_OrderText *)v11;
}

- (BlastDoorOrderPreview)init
{
  BlastDoorOrderPreview *result;

  result = (BlastDoorOrderPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD2F805C((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorOrderPreview_orderPreview));
}

@end
