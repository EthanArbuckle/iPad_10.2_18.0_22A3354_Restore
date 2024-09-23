@implementation MSTrackListCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSTrackListCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("track.list.listen.hint"));
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  v3 = objc_msgSend((id)-[MSTrackListCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer")), "bytes");
  v4 = *(void **)(v3 + 24);
  v5 = *(void **)(v3 + 32);
  v6 = *(void **)v3;
  v7 = *(void **)(v3 + 8);
  v8 = *(void **)(v3 + 16);
  v9 = (void *)-[MSTrackListCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityVideoIconString"));
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v10, "appendFormat:", accessibilityLocalizedString(CFSTR("track.index")), v5);
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v4);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v8);
  if (objc_msgSend(v7, "length"))
  {
    v11 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("("), &stru_2502A5620, 0, 0, objc_msgSend(v11, "length"));
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR(")"), &stru_2502A5620, 0, 0, objc_msgSend(v11, "length"));
    v12 = objc_msgSend(v10, "length");
    objc_msgSend(v10, "appendFormat:", CFSTR(" %@ "), v11);
    v13 = objc_msgSend(v10, "length") - v12;

  }
  else
  {
    v13 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v6);
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v9);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v10);
  v15 = v14;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v12, v13);
  return v15;
}

@end
