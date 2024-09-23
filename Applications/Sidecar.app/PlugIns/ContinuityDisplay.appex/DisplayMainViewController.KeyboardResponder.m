@implementation DisplayMainViewController.KeyboardResponder

- (BOOL)disableInputBars
{
  return 1;
}

- (UIEdgeInsets)floatingKeyboardEdgeInsets
{
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_100034A24();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)forceFloatingKeyboard
{
  return 1;
}

- (BOOL)acceptsFloatingKeyboard
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)cut:(id)a3
{
  sub_1000308FC(self, (__n128)xmmword_1000593A0, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100034AF4);
}

- (void)copy:(id)a3
{
  sub_1000308FC(self, (__n128)vdupq_n_s64(8uLL), (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100034AF4);
}

- (void)paste:(id)a3
{
  sub_1000308FC(self, (__n128)xmmword_1000593B0, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100034AF4);
}

- (void)loadView
{
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *v2;

  v2 = self;
  sub_100034B5C();

}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100034BE4(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)deleteBackward
{
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *v2;

  v2 = self;
  sub_100034DA0();

}

- (int64_t)keyboardType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)smartQuotesType
{
  return 1;
}

- (int64_t)smartDashesType
{
  return 1;
}

- (int64_t)smartInsertDeleteType
{
  return 1;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (int64_t)returnKeyType
{
  return 0;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithNibName:(id)a3 bundle:(id)a4
{
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *result;

  sub_100034FF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, sub_100034F70);
  return result;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithCoder:(id)a3
{
  id v3;
  _TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *result;

  v3 = a3;
  sub_100035054();
  return result;
}

- (void).cxx_destruct
{
  sub_100037154((uint64_t)self, (uint64_t)a2, OBJC_IVAR____TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder_delegate);
}

@end
