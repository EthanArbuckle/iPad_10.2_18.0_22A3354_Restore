@implementation _MPCPlaybackContextPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "tracklistToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v7, 0);

}

@end
