@implementation AXiTunesStoreGlue

+ (void)accessibilityInitializeBundle
{
  uint64_t v2;
  void *v3;
  id v4;

  if (!_Failover)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)AXiTunesStoreGlue), "init");
    v3 = (void *)_Failover;
    _Failover = v2;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", _Failover, sel__libraryWeakLoaded_, CFSTR("ISWeakLibraryLoaded"), 0);

}

- (void)_libraryWeakLoaded:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  v6 = CFSTR("com.apple.ContactsUI");
  switch(v5)
  {
    case 2:
      goto LABEL_9;
    case 3:
      v6 = CFSTR("com.apple.MediaPlayer");
      goto LABEL_9;
    case 4:
      v6 = CFSTR("com.apple.messageui");
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      goto LABEL_10;
    case 8:
      v6 = CFSTR("com.apple.PhotoLibrary");
      goto LABEL_9;
    default:
      if (v5 == 19)
      {
        v6 = CFSTR("com.apple.StoreKit");
      }
      else
      {
        if (v5 != 20)
          goto LABEL_10;
        v6 = CFSTR("com.apple.ios.StoreKitUI");
      }
LABEL_9:
      v7 = (__CFString *)v6;
      AXPerformBlockOnMainThreadAfterDelay();

LABEL_10:
      return;
  }
}

void __40__AXiTunesStoreGlue__libraryWeakLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    _AXAssert();
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBADF8], "loadAccessibilityBundleForBundle:didLoadCallback:", v2, 0, v3, v4);

}

@end
