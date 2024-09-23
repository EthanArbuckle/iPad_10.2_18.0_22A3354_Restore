@implementation CLKIsCLKCompanionWatchFaceLibraryServiceProcess

void __CLKIsCLKCompanionWatchFaceLibraryServiceProcess_block_invoke()
{
  void *v0;
  id v1;

  if (CLKInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "processName");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result = objc_msgSend(v1, "isEqualToString:", CFSTR("CLKCompanionWatchFaceLibraryService"));
  }
  else
  {
    CLKIsCLKCompanionWatchFaceLibraryServiceProcess___result = 0;
  }
}

@end
