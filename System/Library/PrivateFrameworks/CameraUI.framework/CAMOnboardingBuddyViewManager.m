@implementation CAMOnboardingBuddyViewManager

- (int64_t)modelLoadingStatus
{
  CAMOnboardingBuddyViewManager *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1DB95128C();

  return v3;
}

- (void)createViewModel:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  CAMOnboardingBuddyViewManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1DB9535EC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1DB951320((uint64_t (*)(uint64_t))v7, v6);
  sub_1DB9535B8((uint64_t)v7);

}

- (id)createViewControllerWithDelegate:(id)a3
{
  CAMOnboardingBuddyViewManager *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1DB951534();
  swift_unknownObjectRelease();

  return v5;
}

- (CAMOnboardingBuddyViewManager)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[CAMOnboardingBuddyViewManager init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
