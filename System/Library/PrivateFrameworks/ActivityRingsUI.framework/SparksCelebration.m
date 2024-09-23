@implementation SparksCelebration

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                      + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene));
}

- (double)duration
{
  return 5.0;
}

- (unint64_t)type
{
  return 0;
}

- (_TtC15ActivityRingsUI17SparksCelebration)init
{
  _TtC15ActivityRingsUI17SparksCelebration *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_duration) = (Class)0x4014000000000000;
  type metadata accessor for Sparks();
  v3 = self;
  *(Class *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene) = (Class)sub_212E03950();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SparksCelebration();
  return -[SparksCelebration init](&v5, sel_init);
}

- (void)apply:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _TtC15ActivityRingsUI17SparksCelebration *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_212E01658(v6, v7);

}

- (void)updateDeltaTime:(double)a3
{
  _TtC15ActivityRingsUI17SparksCelebration *v3;

  v3 = self;
  sub_212E07134();

}

- (void).cxx_destruct
{

}

@end
