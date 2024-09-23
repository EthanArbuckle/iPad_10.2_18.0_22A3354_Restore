@implementation PosterBoardTestingUtilities

+ (id)knownPPTTests
{
  return &off_10000CEB0;
}

+ (id)posterSwitcherWindowScene
{
  Class v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v2 = NSClassFromString(CFSTR("PBFPosterSwitcherSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedScenes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000042F4;
  v8[3] = &unk_10000C5A0;
  v8[4] = v2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)posterRackViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "posterSwitcherWindowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "posterRackViewController"));

  return v4;
}

@end
