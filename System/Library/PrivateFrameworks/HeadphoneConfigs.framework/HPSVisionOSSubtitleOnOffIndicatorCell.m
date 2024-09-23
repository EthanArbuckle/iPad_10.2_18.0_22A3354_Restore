@implementation HPSVisionOSSubtitleOnOffIndicatorCell

+ (NSString)onOffKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

+ (NSString)cellDisabledKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_1DB3BC340();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *)sub_1DB39CD18(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *v7;
  _TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *v8;
  objc_super v10;

  if (a4)
  {
    sub_1DB3BC340();
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  v7 = -[HPSVisionOSSubtitleOnOffIndicatorCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, v6);

  v8 = v7;
  -[HPSVisionOSSubtitleOnOffIndicatorCell setAccessoryType:](v8, sel_setAccessoryType_, 0);
  -[HPSVisionOSSubtitleOnOffIndicatorCell setHoverStyle:](v8, sel_setHoverStyle_, 0);

  return v8;
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithCoder:(id)a3
{
  _TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *result;

  result = (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5;
  _TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *v6;

  v5 = a3;
  v6 = self;
  sub_1DB39D078(a3);

}

@end
