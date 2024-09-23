@implementation ABLogDisplayInternalAlert

void __ABLogDisplayInternalAlert_block_invoke(uint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  const void *v7;
  CFOptionFlags v8;

  v8 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, CFSTR("AddressBook"), *(CFStringRef *)(a1 + 32), CFSTR("Radar"), CFSTR("Dismiss"), 0, &v8);
  if (!v8)
  {
    if (*(_QWORD *)(a1 + 32))
      v2 = *(__CFString **)(a1 + 32);
    else
      v2 = &stru_1E3CA4E68;
    v3 = -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("\n\nPlease mention what you were doing at the time of the error."));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v3));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), CFSTR("AddressBook error")));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug")));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("568785")));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("PEP Contacts")));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("1.0")));
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone")));
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v5, "setHost:", CFSTR("new"));
    objc_msgSend(v5, "setQueryItems:", v4);
    v6 = objc_msgSend(v5, "URL");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openURL:", v6);

  }
  v7 = *(const void **)(a1 + 32);
  if (v7)
    CFRelease(v7);
}

@end
