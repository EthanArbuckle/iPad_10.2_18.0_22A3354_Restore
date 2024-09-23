@implementation AVAudioSession(AVPlaybackRouteSelecting_Private)

- (void)prepareRouteSelectionForPlaybackFromBundleID:()AVPlaybackRouteSelecting_Private withCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_externalPlaybackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __119__AVAudioSession_AVPlaybackRouteSelecting_Private__prepareRouteSelectionForPlaybackFromBundleID_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E5BB3940;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "willBeginPlaybackFromAppWithBundleID:completionHandler:", v7, v10);

}

- (AVExternalPlaybackController)_externalPlaybackController
{
  AVExternalPlaybackController *v2;

  objc_getAssociatedObject(a1, CFSTR("externalPlaybackController"));
  v2 = (AVExternalPlaybackController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVExternalPlaybackController);
    objc_setAssociatedObject(a1, CFSTR("externalPlaybackController"), v2, (void *)0x301);
  }
  return v2;
}

@end
