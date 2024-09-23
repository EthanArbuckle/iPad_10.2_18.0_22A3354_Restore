@implementation RichCarouselItem

- (id)copyWithZone:(void *)a3
{
  _TtC7ChatKit16RichCarouselItem *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_18E573C20((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_18E7693EC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (_TtC7ChatKit16RichCarouselItem)init
{
  _TtC7ChatKit16RichCarouselItem *result;

  result = (_TtC7ChatKit16RichCarouselItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit16RichCarouselItem_actionButtonDelegate);
}

@end
