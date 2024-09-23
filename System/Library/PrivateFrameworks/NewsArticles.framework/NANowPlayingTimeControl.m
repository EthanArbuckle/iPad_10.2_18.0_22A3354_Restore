@implementation NANowPlayingTimeControl

- (NANowPlayingTimeControl)initWithFrame:(CGRect)a3
{
  return (NANowPlayingTimeControl *)sub_1B9E44374(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NANowPlayingTimeControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9E4710C();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  NANowPlayingTimeControl *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_displayLink);
  v5 = self;
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[NANowPlayingTimeControl dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_remainingTimeLabel));
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___NANowPlayingTimeControl_scrubbingDidChangeHandler));
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_remainingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_trackingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTrackingTextColor));
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl_accessibilityTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl____lazy_storage___elapsedTimeLabelBaselineConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NANowPlayingTimeControl____lazy_storage___remainingTimeLabelBaselineConstraint));
}

- (id)timeDidChangeHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler))
    return 0;
  v2 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1B9E45B50;
  v5[3] = &block_descriptor_1;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setTimeDidChangeHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char);
  uint64_t (**v7)(char);
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1B9E47D20;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_timeDidChangeHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)(char))v4;
  sub_1B9E47D78(v8);
}

- (UIColor)elapsedTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_elapsedTrackColor));
}

- (void)setElapsedTrackColor:(id)a3
{
  NANowPlayingTimeControl *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1B9E473C8(v5);

}

- (UIColor)remainingTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_remainingTrackColor));
}

- (void)setRemainingTrackColor:(id)a3
{
  NANowPlayingTimeControl *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1B9E474A4(v5);

}

- (UIColor)trackingTrackColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_trackingTrackColor));
}

- (void)setTrackingTrackColor:(id)a3
{
  NANowPlayingTimeControl *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1B9E4757C(v5);

}

- (UIColor)timeLabelTextColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTextColor));
}

- (void)setTimeLabelTextColor:(id)a3
{
  sub_1B9E45DCC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___NANowPlayingTimeControl_timeLabelTextColor);
}

- (UIColor)timeLabelTrackingTextColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___NANowPlayingTimeControl_timeLabelTrackingTextColor));
}

- (void)setTimeLabelTrackingTextColor:(id)a3
{
  sub_1B9E45DCC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___NANowPlayingTimeControl_timeLabelTrackingTextColor);
}

- (BOOL)isHidden
{
  return sub_1B9E46448(self, (uint64_t)a2, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  NANowPlayingTimeControl *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  v7 = -[NANowPlayingTimeControl isHidden](&v9, sel_isHidden);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[NANowPlayingTimeControl setHidden:](&v8, sel_setHidden_, v3);
  sub_1B9E45EB4(v7);

}

- (double)alpha
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[NANowPlayingTimeControl alpha](&v3, sel_alpha);
  return result;
}

- (void)setAlpha:(double)a3
{
  objc_class *ObjectType;
  NANowPlayingTimeControl *v6;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  -[NANowPlayingTimeControl alpha](&v10, sel_alpha);
  v8 = v7;
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[NANowPlayingTimeControl setAlpha:](&v9, sel_setAlpha_, a3);
  sub_1B9E46100(v8);

}

- (void)didMoveToWindow
{
  NANowPlayingTimeControl *v2;

  v2 = self;
  sub_1B9E46290();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[NANowPlayingTimeControl tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1B9E45D20();

}

- (BOOL)isEnabled
{
  return sub_1B9E46448(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  NANowPlayingTimeControl *v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  id v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = self;
  -[NANowPlayingTimeControl setEnabled:](&v12, sel_setEnabled_, v3);
  v7 = *(uint64_t *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_slider);
  v11.receiver = v6;
  v11.super_class = ObjectType;
  v8 = -[NANowPlayingTimeControl isEnabled](&v11, sel_isEnabled);
  v9 = OBJC_IVAR____TtC12NewsArticles10SliderView_isEnabled;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC12NewsArticles10SliderView_isEnabled) = v8;
  v10 = sub_1BA0B5744();
  objc_msgSend(v10, sel_setEnabled_, *(unsigned __int8 *)(v7 + v9));

}

- (NSString)accessibilityValue
{
  NANowPlayingTimeControl *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B9E46598();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BA0BE81C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (CGPoint)accessibilityActivationPoint
{
  char *v2;
  void *v3;
  NANowPlayingTimeControl *v4;
  CGFloat MaxX;
  CGFloat MidY;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  v2 = *(char **)((char *)&self->super.super.super.super.isa + OBJC_IVAR___NANowPlayingTimeControl_slider);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack];
  v4 = self;
  objc_msgSend(v3, sel_accessibilityFrame);
  MaxX = CGRectGetMaxX(v10);
  objc_msgSend(v2, sel_accessibilityFrame);
  MidY = CGRectGetMidY(v11);

  v7 = MaxX;
  v8 = MidY;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)accessibilityIncrement
{
  NANowPlayingTimeControl *v2;

  v2 = self;
  sub_1B9E46810();

}

- (void)accessibilityDecrement
{
  NANowPlayingTimeControl *v2;

  v2 = self;
  sub_1B9E46964();

}

- (void)displayLinkFired:(id)a3
{
  id v4;
  NANowPlayingTimeControl *v5;

  v4 = a3;
  v5 = self;
  sub_1B9E47658();

}

- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  NANowPlayingTimeControl *v11;

  v7 = a6;
  v11 = self;
  sub_1B9E47778(v7, a3, a4, a5);

}

- (void)updateFonts
{
  NANowPlayingTimeControl *v2;

  v2 = self;
  sub_1B9E456D4();

}

@end
