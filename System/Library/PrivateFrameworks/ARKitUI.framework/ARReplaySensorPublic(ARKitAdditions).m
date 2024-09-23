@implementation ARReplaySensorPublic(ARKitAdditions)

- (void)_subscribeToBackgroundNotifications
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel_interrupt, *MEMORY[0x1E0CEB288], 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel_endInterruption, *MEMORY[0x1E0CEB350], 0);

}

@end
