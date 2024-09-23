@implementation CKAutoloopMovieBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAutoloopMovieBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAutoloopMovieBalloonView"), CFSTR("_isMuted"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAutoloopMovieBalloonView"), CFSTR("setIsMuted:"), "v", "B", 0);

}

- (id)accessibilityValue
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;

  if (-[CKAutoloopMovieBalloonViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isMuted")))v3 = CFSTR("autoloop.movie.muted");
  else
    v3 = CFSTR("autoloop.movie.unmuted");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonViewAccessibility;
  -[CKAutoloopMovieBalloonViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axBalloonViewCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  __CFString *v8;
  char **v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v13.receiver = self;
  v13.super_class = (Class)CKAutoloopMovieBalloonViewAccessibility;
  -[CKAutoloopMovieBalloonViewAccessibility _axBalloonViewCustomActions](&v13, sel__axBalloonViewCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CKAutoloopMovieBalloonViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isMuted"));
  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  if (v6)
    v8 = CFSTR("autoloop.movie.action.unmute");
  else
    v8 = CFSTR("autoloop.movie.action.mute");
  if (v6)
    v9 = &selRef__axUnmuteAutoloopMovie;
  else
    v9 = &selRef__axMuteAutoloopMovie;
  accessibilityLocalizedString(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v10, self, *v9);

  objc_msgSend(v5, "axSafelyAddObject:", v11);
  return v5;
}

- (void)_axMuteAutoloopMovie
{
  AXPerformSafeBlock();
}

uint64_t __63__CKAutoloopMovieBalloonViewAccessibility__axMuteAutoloopMovie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMuted:", 1);
}

- (void)_axUnmuteAutoloopMovie
{
  AXPerformSafeBlock();
}

uint64_t __65__CKAutoloopMovieBalloonViewAccessibility__axUnmuteAutoloopMovie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMuted:", 0);
}

@end
