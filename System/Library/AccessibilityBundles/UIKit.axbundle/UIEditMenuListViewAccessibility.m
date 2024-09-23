@implementation UIEditMenuListViewAccessibility

void __56___UIEditMenuListViewAccessibility__reloadMenuAnimated___block_invoke(uint64_t a1)
{
  char v1;
  id v2;
  _BOOL4 v3;
  id argument;
  char v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v1 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive");
  v8 = 0;
  v6 = 0;
  if ((v1 & 1) != 0
    || (v9 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance"),
        v8 = 1,
        v7 = (id)objc_msgSend(v9, "inputDelegate"),
        v6 = 1,
        LOBYTE(v3) = 0,
        !v7))
  {
    v3 = !AXIsDictationListening();
  }
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if (v3)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("collectionView"));
    argument = (id)objc_msgSend(v2, "_accessibilityUnignoredDescendant");

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
    objc_storeStrong(&argument, 0);
  }
}

@end
