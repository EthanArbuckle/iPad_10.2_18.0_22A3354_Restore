@implementation SharingInviteActivityViewController

- (void)_prepareActivity:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI35SharingInviteActivityViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A98D5B5C(v4);

}

- (_TtC18HealthExperienceUI35SharingInviteActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  void *v6;
  void *v7;
  _TtC18HealthExperienceUI35SharingInviteActivityViewController *v8;
  objc_super v10;

  sub_1A9A95A70();
  if (a4)
  {
    sub_1A9627620(0, &qword_1EEB1D2A0);
    a4 = (id)sub_1A9A95A70();
  }
  v6 = (void *)sub_1A9A95A58();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_1A9627620(0, &qword_1EEB1D2A0);
    v7 = (void *)sub_1A9A95A58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SharingInviteActivityViewController();
  v8 = -[SharingInviteActivityViewController initWithActivityItems:applicationActivities:](&v10, sel_initWithActivityItems_applicationActivities_, v6, v7);

  return v8;
}

@end
