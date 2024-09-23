@implementation GEOAppleMediaServicesResult(MUAppLockupViewModel)

- (id)actionButtonText
{
  __CFString *v1;

  if (objc_msgSend(a1, "isInstalled"))
    v1 = CFSTR("OPEN [Placecard]");
  else
    v1 = CFSTR("GET [Placecard]");
  _MULocalizedStringFromThisBundle(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadAppArtworkWithCompletion:()MUAppLockupViewModel
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "artworkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__GEOAppleMediaServicesResult_MUAppLockupViewModel__loadAppArtworkWithCompletion___block_invoke;
  v8[3] = &unk_1E2E02070;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "loadAppImageAtURL:completionHandler:", v6, v8);

}

@end
