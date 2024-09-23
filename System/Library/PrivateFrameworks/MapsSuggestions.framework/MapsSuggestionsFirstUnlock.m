@implementation MapsSuggestionsFirstUnlock

- (MapsSuggestionsFirstUnlock)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsFirstUnlock;
  return -[MapsSuggestionsFirstUnlockBase initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsFirstUnLock"));
}

- (void)didAddFirstObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D27108], "sharedObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataDidBecomeAvailableAfterFirstUnlockObserver:", self);

}

- (BOOL)hasDeviceBeenUnlocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27108], "sharedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAccessFilesWithProtection:", 3);

  return v3;
}

@end
