@implementation HMRemoteLoginHandler(HUMediaAdditions)

- (id)hu_appleMusicInAppAuthenticationContext
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a1, "anisetteDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HMRemoteLoginHandler_HUMediaAdditions__hu_appleMusicInAppAuthenticationContext__block_invoke;
  v7[3] = &unk_1E6F4D600;
  v7[4] = a1;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
