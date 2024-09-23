@implementation HRProfileManager

- (HRProfile)primaryProfile
{
  HRProfileManager *v3;
  id v5;

  sub_1BC62AA6C();
  sub_1BC4A7A04();
  sub_1BC3A9E00();
  v3 = self;
  swift_retain();
  sub_1BC62B888();

  swift_release();
  return (HRProfile *)v5;
}

- (HRProfile)currentProfile
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HRProfileManager_currentProfile);
  swift_beginAccess();
  return (HRProfile *)*v2;
}

- (void)setCurrentProfile:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HRProfileManager_currentProfile);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

+ (HRProfileManager)sharedInstance
{
  if (qword_1ED6A4878 != -1)
    swift_once();
  return (HRProfileManager *)(id)qword_1ED6A54F0;
}

- (HRProfileManager)init
{
  return (HRProfileManager *)ProfileManager.init()();
}

- (void)switchCurrentProfileWithIdentifier:(id)a3
{
  id v5;
  HRProfileManager *v6;

  sub_1BC62AA6C();
  sub_1BC3A9E00();
  v5 = a3;
  v6 = self;
  swift_retain();
  sub_1BC62B894();

  swift_release();
}

- (id)profileWithHealthStore:(id)a3
{
  id v5;
  HRProfileManager *v6;
  id v8;

  sub_1BC62AA6C();
  sub_1BC4A7A04();
  sub_1BC3A9E00();
  v5 = a3;
  v6 = self;
  swift_retain();
  sub_1BC62B888();

  swift_release();
  return v8;
}

- (id)profileWithProfileIdentifier:(id)a3
{
  id v5;
  HRProfileManager *v6;
  id v8;

  sub_1BC62AA6C();
  sub_1BC4A7A04();
  sub_1BC3A9E00();
  v5 = a3;
  v6 = self;
  swift_retain();
  sub_1BC62B888();

  swift_release();
  return v8;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
