@implementation HealthImageActivityItemProvider

- (id)item
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_image));
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI31HealthImageActivityItemProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A998D1C4();

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  id v7;
  id v8;
  _TtC18HealthExperienceUI31HealthImageActivityItemProvider *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1A998D2A8();

  return v10;
}

- (_TtC18HealthExperienceUI31HealthImageActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC18HealthExperienceUI31HealthImageActivityItemProvider *result;

  swift_unknownObjectRetain();
  sub_1A9A96670();
  swift_unknownObjectRelease();
  result = (_TtC18HealthExperienceUI31HealthImageActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_thumbnailImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
