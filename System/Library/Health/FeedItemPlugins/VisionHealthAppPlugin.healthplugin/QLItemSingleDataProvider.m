@implementation QLItemSingleDataProvider

- (id)provideDataForItem:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data);
  v4 = *(_QWORD *)&self->data[OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data];
  sub_2322611D0(v3, v4);
  v5 = (void *)sub_2322B8018();
  sub_232261214(v3, v4);
  return v5;
}

- (_TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider)init
{
  _TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider *result;

  result = (_TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_232261214(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data]);
}

@end
