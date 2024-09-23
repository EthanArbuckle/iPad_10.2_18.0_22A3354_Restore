@implementation STUIStatusBarAccessibility

void __130__STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "didPotentiallyDismissNonExclusiveSystemUI");

}

uint64_t __109__STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI__accessibilityMultitaskingButtonContainer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBTopAffordanceViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
