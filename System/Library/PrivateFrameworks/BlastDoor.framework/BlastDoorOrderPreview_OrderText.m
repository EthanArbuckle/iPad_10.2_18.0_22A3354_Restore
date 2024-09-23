@implementation BlastDoorOrderPreview_OrderText

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

- (BlastDoorColor)overrideColor
{
  char *v2;
  BlastDoorOrderPreview_OrderText *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v10;
  objc_super v11;

  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText;
  if ((self->orderPreview_OrderText[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText + 40] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = *((_QWORD *)v2 + 4);
    v4 = *((_QWORD *)v2 + 5);
    v10 = *((_OWORD *)v2 + 1);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((_QWORD *)v8 + 2) = v5;
    *((_QWORD *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    v3 = -[BlastDoorOrderPreview_OrderText init](&v11, sel_init);
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorOrderPreview_OrderText)init
{
  BlastDoorOrderPreview_OrderText *result;

  result = (BlastDoorOrderPreview_OrderText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
