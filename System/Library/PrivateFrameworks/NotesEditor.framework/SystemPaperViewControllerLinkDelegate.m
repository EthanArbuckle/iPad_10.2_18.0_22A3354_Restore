@implementation SystemPaperViewControllerLinkDelegate

- (void)linkingControllerLinksMightHaveChanged:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1DD993D1C(v3);

  swift_release();
}

- (BOOL)linkingController:(id)a3 shouldAddSynapseLinkItem:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  swift_retain();
  v7 = sub_1DD994AB0();

  swift_release();
  return v7 & 1;
}

- (id)linkingControllerLinksMenuExcludedUserActivities:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  swift_retain();
  sub_1DD993FA4(v3);

  swift_release();
  sub_1DD7C0C74(0, &qword_1F03F75E0);
  v4 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v4;
}

@end
