@implementation UIVisualEffectView(HUAdditions)

- (void)hu_configureEffectForIdentifier:()HUAdditions
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HUSharedVisualEffectIdentifierTileOff")))
  {
    objc_msgSend(MEMORY[0x1E0CEABE0], "hu_gridCellBackgroundOffEffects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("HUSharedVisualEffectIdentifierTileOn")))
    {
      NSLog(CFSTR("Unexpected visual effect identifier %@"), v6);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CEABE0], "hu_gridCellBackgroundOnEffects");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(a1, "setBackgroundEffects:", v4);

LABEL_7:
}

@end
