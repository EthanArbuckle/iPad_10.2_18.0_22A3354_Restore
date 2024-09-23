@implementation ActionSelectorItem

- (UIColor)color
{
  id v2;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured) == 1)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, *(double *)((char *)&self->super.isa+ OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor), *(double *)&self->sectionIdentifier[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor], *(double *)&self->title[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor], *(double *)&self->title[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor + 8]);
  else
    v2 = 0;
  return (UIColor *)v2;
}

- (UIImage)image
{
  _TtC27ActionButtonConfigurationUI18ActionSelectorItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_235E3CACC();
  v4 = v3;

  return (UIImage *)v4;
}

- (NSString)identifier
{
  void *v2;

  sub_235E6104C();
  v2 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)canBeHighlighted
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured);
}

- (_TtC27ActionButtonConfigurationUI18ActionSelectorItem)init
{
  _TtC27ActionButtonConfigurationUI18ActionSelectorItem *result;

  result = (_TtC27ActionButtonConfigurationUI18ActionSelectorItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
