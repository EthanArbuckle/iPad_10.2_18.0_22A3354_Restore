@implementation SBPIPControllerAccessibility

- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[SBPIPControllerAccessibility _axPegasusController](self, "_axPegasusController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("activePictureInPictureApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeIntForKey:", CFSTR("processIdentifier"));

  AXSetPipPid();
  v10.receiver = self;
  v10.super_class = (Class)SBPIPControllerAccessibility;
  LOBYTE(v4) = -[SBPIPControllerAccessibility shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:](&v10, sel_shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground_scenePersistenceIdentifier_, v4, v6);

  return v4;
}

- (id)_axPegasusController
{
  void *v2;
  void *v3;

  -[SBPIPControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_adapter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_pegasusController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPIPController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PGPictureInPictureController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PGPictureInPictureApplication"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureController"), CFSTR("activePictureInPictureApplication"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureApplication"), CFSTR("processIdentifier"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPPegasusAdapter"), CFSTR("_pegasusController"), "PGPictureInPictureController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPController"), CFSTR("_adapter"), "<SBPIPControllerAdapter>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPController"), CFSTR("setPictureInPictureWindowsHidden:forReason:"), "v", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPController"), CFSTR("shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:"), "B", "i", "@", 0);

}

- (void)_axDidDismissPIP
{
  id v2;

  AXSetPipPid();
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPotentiallyDismissNonExclusiveSystemUI");

}

- (void)setPictureInPictureWindowsHidden:(BOOL)a3 forReason:(id)a4
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBPIPControllerAccessibility;
  -[SBPIPControllerAccessibility setPictureInPictureWindowsHidden:forReason:](&v8, sel_setPictureInPictureWindowsHidden_forReason_, a3, a4);
  if (a3)
  {
    -[SBPIPControllerAccessibility _axDidDismissPIP](self, "_axDidDismissPIP");
  }
  else
  {
    -[SBPIPControllerAccessibility _axPegasusController](self, "_axPegasusController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("activePictureInPictureApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeIntForKey:", CFSTR("processIdentifier"));

    AXSetPipPid();
  }
}

- (void)_destroyWindowAndRootViewControllerIfPossible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPIPControllerAccessibility;
  -[SBPIPControllerAccessibility _destroyWindowAndRootViewControllerIfPossible](&v3, sel__destroyWindowAndRootViewControllerIfPossible);
  -[SBPIPControllerAccessibility _axDidDismissPIP](self, "_axDidDismissPIP");
}

@end
