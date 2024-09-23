@implementation AXMActiveSoundOutputAction

- (AXMActiveSoundOutputAction)initWithURL:(id)a3
{
  id v4;
  AXMActiveSoundOutputActionHandle *v5;
  AXMActiveSoundOutputAction *v6;

  v4 = a3;
  v5 = objc_alloc_init(AXMActiveSoundOutputActionHandle);
  v6 = -[AXMSoundOutputAction _initWithURL:handle:](self, "_initWithURL:handle:", v4, v5);

  return v6;
}

- (AXMActiveSoundOutputAction)initWithSoundID:(id)a3
{
  id v4;
  AXMActiveSoundOutputActionHandle *v5;
  AXMActiveSoundOutputAction *v6;

  v4 = a3;
  v5 = objc_alloc_init(AXMActiveSoundOutputActionHandle);
  v6 = -[AXMSoundOutputAction _initWithSoundID:handle:](self, "_initWithSoundID:handle:", v4, v5);

  return v6;
}

@end
