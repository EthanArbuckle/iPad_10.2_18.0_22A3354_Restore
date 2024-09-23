@implementation CKTextEffectExplodeConfiguration

+ (id)defaultConfiguration
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CKTextEffectExplodeConfiguration()), sel_init);
}

- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)initWithSourceColor:(id)a3 targetColor:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CKTextEffectExplodeConfiguration();
  v6 = a3;
  v7 = a4;
  return -[CKTextEffectExplodeConfiguration init](&v9, sel_init);
}

- (_TtC7ChatKit32CKTextEffectExplodeConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKTextEffectExplodeConfiguration();
  return -[CKTextEffectExplodeConfiguration init](&v3, sel_init);
}

- (UIColor)sourceColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_sourceColor));
}

- (UIColor)targetColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7ChatKit32CKTextEffectExplodeConfiguration_targetColor));
}

- (void).cxx_destruct
{

}

@end
