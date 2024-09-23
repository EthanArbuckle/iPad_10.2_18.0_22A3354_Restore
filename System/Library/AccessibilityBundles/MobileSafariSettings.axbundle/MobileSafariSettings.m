id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileSafariSettings.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25029E1F0, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id profileSymbolAccessibilityLabel(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("person.lanyardcard.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.person.lanyardcard.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("emoji.face.grinning.inverse")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.emoji.face.grinning.inverse");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("rocket.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.rocket.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("book.closed.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.book.closed.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("graduationcap.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.graduationcap.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("figure.stand")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.figure.stand");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("wrench.and.screwdriver.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.wrench.and.screwdriver.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("paintpalette.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.paintpalette.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("globe.americas.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.globe.americas.fill");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("airplane.departure")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.airplane.departure");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("person.fill")) & 1) != 0)
  {
    v2 = CFSTR("profile.icon.person.fill");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("ellipsis")))
    {
LABEL_26:
      accessibilityUIKitSymbolNamesLocalizedString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    v2 = CFSTR("profile.icon.ellipsis");
  }
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_26;
LABEL_27:

  return v3;
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t accessibilityUIKitSymbolNamesLocalizedString()
{
  return MEMORY[0x24BEBB2E8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

