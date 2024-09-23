@implementation ParallaxNavigationTitleView

- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC11MediaCoreUI27ParallaxNavigationTitleView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate) = 1;
  v5 = OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_customBackButton;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_buttonWithType_, 0);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_didSetupBackButtonsAlphas) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_isNavigationBarOverParallaxHeader) = 1;

  result = (_TtC11MediaCoreUI27ParallaxNavigationTitleView *)sub_2414B5674();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11MediaCoreUI27ParallaxNavigationTitleView *v2;

  v2 = self;
  sub_241471CFC();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ParallaxNavigationTitleView tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_241472AA4(1);

}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC11MediaCoreUI27ParallaxNavigationTitleView *v6;

  v5 = a3;
  v6 = self;
  sub_241472D08((uint64_t)a3);

}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[ParallaxNavigationTitleView didMoveToWindow](&v4, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3)
    sub_241472AA4(1);

}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL8 v4;
  _BYTE *v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[_UINavigationBarTitleView transitionWillBegin:willBeDisplayed:](&v7, sel_transitionWillBegin_willBeDisplayed_, a3, v4);
  v6[OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate] = v4;

}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL8 v4;
  _BYTE *v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[_UINavigationBarTitleView transitionCompleted:willBeDisplayed:](&v7, sel_transitionCompleted_willBeDisplayed_, a3, v4);
  v6[OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate] = v4;
  sub_241472AA4(v4);

}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[_UINavigationBarTitleView performTransition:willBeDisplayed:](&v7, sel_performTransition_willBeDisplayed_, a3, v4);
  sub_241472AA4(v4);

}

- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithFrame:(CGRect)a3
{
  _TtC11MediaCoreUI27ParallaxNavigationTitleView *result;

  result = (_TtC11MediaCoreUI27ParallaxNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_customBackButton));
}

@end
