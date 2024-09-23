@implementation ITunesStoreAPIInit

void ___ITunesStoreAPIInit_block_invoke()
{
  void **v0;
  void *v1;
  void **v2;
  void *v3;

  if (!kITunesDaemonDidDismissDialog)
  {
    v0 = (void **)MEMORY[0x193FF3C24]("kITunesDaemonDidDismissDialog", CFSTR("iTunesStore"));
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&kITunesDaemonDidDismissDialog, v1);
  }
  if (!kITunesDaemonWillDisplayDialog)
  {
    v2 = (void **)MEMORY[0x193FF3C24]("kITunesDaemonWillDisplayDialog", CFSTR("iTunesStore"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&kITunesDaemonWillDisplayDialog, v3);
  }
}

@end
