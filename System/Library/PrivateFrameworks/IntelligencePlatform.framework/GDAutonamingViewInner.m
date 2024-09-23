@implementation GDAutonamingViewInner

- (id)objCPersonFor:(id)a3
{
  GDAutonamingViewInner *v4;
  void *v5;

  sub_1AE925E3C();
  v4 = self;
  v5 = (void *)sub_1AE5528C4();

  swift_bridgeObjectRelease();
  return v5;
}

- (void)didUpdateUserFeedback
{
  GDAutonamingViewInner *v2;

  v2 = self;
  sub_1AE552B98();

}

- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
  sub_1AE553C10(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, uint64_t, id))sub_1AE553860);
}

- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
  sub_1AE553C10(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, uint64_t, id))sub_1AE553B90);
}

- (GDAutonamingViewInner)init
{
  AutonamingView.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (GDAutonamingViewInner)initWithViewName:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1AE925E3C();
  return (GDAutonamingViewInner *)AutonamingView.init(viewName:)(v4, v5);
}

- (void)_reset
{
  GDAutonamingViewInner *v2;

  v2 = self;
  AutonamingView._reset()();

}

@end
