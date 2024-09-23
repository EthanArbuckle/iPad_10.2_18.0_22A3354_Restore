@implementation JSRestrictionsController

- (JSValue)isExplicitContentRestricted
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDA30();

  return (JSValue *)v3;
}

- (JSValue)areMusicVideosRestricted
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDA74();

  return (JSValue *)v3;
}

- (void)setAreMusicVideosRestricted:(id)a3
{
  id v4;
  _TtC7MusicUI24JSRestrictionsController *v5;

  v4 = a3;
  v5 = self;

}

- (JSValue)isTVRestricted
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDB18();

  return (JSValue *)v3;
}

- (JSValue)areMoviesRestricted
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDB5C();

  return (JSValue *)v3;
}

- (JSValue)isSocialDisabled
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDBA0();

  return (JSValue *)v3;
}

- (JSValue)isSubscriptionContentRestricted
{
  _TtC7MusicUI24JSRestrictionsController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21CDEDBE4();

  return (JSValue *)v3;
}

- (_TtC7MusicUI24JSRestrictionsController)init
{
  sub_21CDEDC60();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI24JSRestrictionsController_restrictionsController));
  swift_release();
}

@end
