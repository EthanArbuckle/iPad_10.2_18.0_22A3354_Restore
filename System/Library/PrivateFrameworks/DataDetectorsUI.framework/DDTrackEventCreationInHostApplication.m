@implementation DDTrackEventCreationInHostApplication

void __DDTrackEventCreationInHostApplication_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  char v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v1 = 1;
    v2 = v5;
  }
  else
  {
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilemail"));
    v2 = v5;
    if (!v3)
      goto LABEL_6;
    v1 = 2;
  }
  DDTrackEventCreationInHostApplication_host = v1;
LABEL_6:
  if (v2)
  {
    v4 = objc_msgSend(&unk_1E426B288, "containsObject:", v5);
    v2 = v5;
  }
  else
  {
    v4 = 0;
  }
  DDTrackEventCreationInHostApplication_track = v4;

}

@end
