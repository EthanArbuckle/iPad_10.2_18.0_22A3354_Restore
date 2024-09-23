id AXCKLocalizedFromStringWithContact(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    AXCKFullNameForContact(a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("search.item.from.contact"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringWithFormat:", v3, v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id AXCKFullNameForContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    goto LABEL_6;
  if ((objc_msgSend(v1, "areKeysAvailable:", v3) & 1) == 0)
  {
    objc_msgSend(v1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      accessibilityContactStore();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v3, 0);
      v7 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v7;
      if (!v7)
        goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_6:
    objc_msgSend(v1, "phoneNumbers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!objc_msgSend(v10, "count"))
      {
        v8 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
  }

  return v8;
}

id accessibilityCameraKitLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  v2 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  if (accessibilityCameraKitLocalizedString_axBundle)
    goto LABEL_4;
  v3 = (void *)MEMORY[0x24BDD1488];
  AXAccessibilityBundlesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CameraKit.axbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  accessibilityCameraKitLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  if (accessibilityCameraKitLocalizedString_axBundle
    || (_AXAssert(), (v2 = (void *)accessibilityCameraKitLocalizedString_axBundle) != 0))
  {
LABEL_4:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2501B2580, CFSTR("CameraKitStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_2324F0D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id _AXCKStringForMediaType(int a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  __CFString *v5;

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("filetype.audio");
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("filetype.video");
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("filetype.image");
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("filetype.contact.card");
      goto LABEL_9;
    case 5:
      v5 = CFSTR("map.attachment");
      goto LABEL_11;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("filetype.calendar.event");
LABEL_9:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_2501B2580, CFSTR("Accessibility"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 7:
      v5 = CFSTR("passkit.attachment");
LABEL_11:
      accessibilityLocalizedString(v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

uint64_t _AXCKIsActionWindowShowing()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x24BDFE3F0]);

  if ((_DWORD)v1)
  {
    objc_opt_class();
    -[objc_class sharedInstance](NSClassFromString(CFSTR("CKActionMenuWindow")), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v1 = objc_msgSend(v3, "isHidden") ^ 1;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

id _AXCKFullScreenEffectString(void *a1, int a2)
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.balloons");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKConfettiEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.confetti");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHeartEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.love");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKLasersEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.lasers");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKFireworksEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.fireworks");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKShootingStarEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.shootingstar");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSparklesEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.celebration");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKEchoEffect")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.full.echo");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSpotlightEffect")))
    {
      v5 = 0;
      v4 = 0;
      goto LABEL_22;
    }
    v4 = CFSTR("impact.effect.full.spotlight");
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.description"), v4);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v5;
}

id accessibilityContactStore()
{
  if (accessibilityContactStore_onceToken != -1)
    dispatch_once(&accessibilityContactStore_onceToken, &__block_literal_global_835);
  return (id)accessibilityContactStore_store;
}

void __accessibilityContactStore_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v1 = (void *)accessibilityContactStore_store;
  accessibilityContactStore_store = (uint64_t)v0;

}

id _AXCKConfirmedMentions(void *a1, void *a2)
{
  return _AXCKMentions(a1, a2, 0);
}

id _AXCKMentions(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  AXCKMentionSubelement *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v23;
  id v24;
  __CFString *v25;
  unint64_t v26;
  uint64_t v27;

  v24 = a1;
  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = 0;
    v7 = objc_msgSend(v5, "length");
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = CFSTR("__kIMMentionConfirmedMention");
      if (a3)
        v10 = CFSTR("__kIMMentionAttributeName");
      v25 = (__CFString *)v10;
      v23 = a3 ^ 1;
      while (1)
      {
        objc_msgSend(v5, "attributesAtIndex:effectiveRange:", v9, &v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v13 = v25;
        objc_msgSend(v12, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("__kIMMentionAttributeName"))
          || (objc_msgSend(v12, "objectForKey:", CFSTR("__kIMMentionConfirmedMention")),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          if (v14)
          {
            v16 = -[AXCKMentionSubelement initWithTextView:]([AXCKMentionSubelement alloc], "initWithTextView:", v24);
            -[AXCKMentionSubelement setRange:](v16, "setRange:", v26, v27);
            -[AXCKMentionSubelement setType:](v16, "setType:", v23);
            if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("__kIMMentionAttributeName")))v17 = CFSTR("possible.mention.button.text");
            else
              v17 = CFSTR("confirmed.mention.button.text");
            accessibilityLocalizedString(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXCKMentionSubelement setAccessibilityValue:](v16, "setAccessibilityValue:", v18);

            objc_msgSend(v5, "string");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "substringWithRange:", v26, v27);
            v20 = v6;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXCKMentionSubelement setAccessibilityLabel:](v16, "setAccessibilityLabel:", v21);

            v6 = v20;
            objc_msgSend(v20, "axSafelyAddObject:", v16);

          }
        }
        v26 += v27;
        v27 = 0;

        v9 = v26;
        if (v26 >= v8)
          goto LABEL_18;
      }

    }
  }
  else
  {
    v6 = 0;
  }
LABEL_18:

  return v6;
}

id _AXCKPossibleMentions(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXCKMentions(v1, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _AXCKTextEffectMentions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v1 = a1;
  objc_msgSend(v1, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "length");
    v5 = *MEMORY[0x24BE510A8];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___AXCKTextEffectMentions_block_invoke;
    v15[3] = &unk_2501B1B98;
    v6 = v1;
    v16 = v6;
    v17 = v2;
    v18 = v3;
    v7 = v3;
    objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v15);
    _AXTextStyleMention(v6, (void *)*MEMORY[0x24BE510A0], CFSTR("texteffects.bold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObject:", v8);
    _AXTextStyleMention(v6, (void *)*MEMORY[0x24BE510B0], CFSTR("texteffects.italic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObject:", v9);
    _AXTextStyleMention(v6, (void *)*MEMORY[0x24BE510C0], CFSTR("texteffects.underline"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObject:", v10);
    _AXTextStyleMention(v6, (void *)*MEMORY[0x24BE510B8], CFSTR("texteffects.strikethrough"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObject:", v11);
    if (objc_msgSend(v7, "count"))
      v12 = v7;
    else
      v12 = 0;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id _AXTextStyleMention(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  objc_msgSend(v5, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = ___AXTextStyleMention_block_invoke;
  v15[3] = &unk_2501B1BE8;
  v19 = &v20;
  v10 = v5;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v9, 0, v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void sub_2324F18D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AXCustomActionsForActions(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  id obj;
  void *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("unpin.action.label"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pin.action.label"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v1;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    v5 = CFSTR("\n");
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v7, "image");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessibilityLabel");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = v5;
          objc_msgSend(v7, "safeValueForKey:", CFSTR("state"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "integerValue");

          if (v12 == 1)
          {
            accessibilityLocalizedString(CFSTR("switch.on"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v13 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v13;
          }
          v5 = v10;
        }
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v5, CFSTR(" "), v18, v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length")
          && (objc_msgSend(v14, "containsString:", v23) & 1) == 0
          && (objc_msgSend(v14, "containsString:", v21) & 1) == 0)
        {
          v15 = objc_alloc(MEMORY[0x24BDF6788]);
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = ___AXCustomActionsForActions_block_invoke;
          v24[3] = &unk_2501B1BC0;
          v24[4] = v7;
          v16 = (void *)objc_msgSend(v15, "initWithName:actionHandler:", v14, v24);
          objc_msgSend(v20, "addObject:", v16);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v3);
  }

  return v20;
}

void sub_2324F2508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F2E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F4010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2324F4418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F4A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2324F4D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F65C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F6980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2324F80A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_2324F9540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324F976C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2324F99B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324FA6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_2324FA970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2324FAA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2324FAEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2324FB0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2324FC8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2324FDD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232501A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2325023EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_232503020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_2325031A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _axLocalizedStringForLayoutIntent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 0;
  accessibilityLocalizedString(off_2501B2140[a1 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_2325033D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232503FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2325059D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232505A6C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232506810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2325072F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void voiceOverDidEnableHandwriting()
{
  void *v0;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_axSetIsHandwritingEnabled:", 1);

}

void voiceOverDidDisableHandwriting()
{
  void *v0;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_axSetIsHandwritingEnabled:", 0);

}

void sub_232508EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_23250937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_23250AF80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_23250D134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_23250E61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23250E940(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23250FDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_23250FEA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232510D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_23251149C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_232512C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232514064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23251494C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_2325154E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

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
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2501B2580, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id addFirstResponderRotorsToRotorArray(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMainWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityCustomRotors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v1, "addObjectsFromArray:", v4);

  return v1;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFDF58]();
}

uint64_t AXApplicationGetMainBundleIdentifier()
{
  return MEMORY[0x24BDFDF70]();
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x24BEBAD48]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFDF80]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x24BDFE010]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXDurationForDurationString()
{
  return MEMORY[0x24BE00050]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x24BE00058]();
}

uint64_t AXForceTouchAvailableAndEnabled()
{
  return MEMORY[0x24BE00088]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
}

uint64_t AXLocalizeDurationTime()
{
  return MEMORY[0x24BE001D0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXProcessGetName()
{
  return MEMORY[0x24BDFE290]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t UIAXApplyPhoneContextTokenToString()
{
  return MEMORY[0x24BEBAE18]();
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x24BEBAE20]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAccessibilityConvertAttachmentsInAttributedStringToAX()
{
  return MEMORY[0x24BEBAEF8]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDF7218](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t UIAccessibilityEmojiDescription()
{
  return MEMORY[0x24BDFE828]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x24BDF7240](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x24BDFE830]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x24BDFE838]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x24BDFE840]();
}

uint64_t UIAccessibilityPhotoCreationDate()
{
  return MEMORY[0x24BDFE848]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilityRelateElements()
{
  return MEMORY[0x24BEBB060]();
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x24BEBB0B8]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x24BEBB0C8]();
}

uint64_t UIAccessibilityUnrelateAllElements()
{
  return MEMORY[0x24BEBB1C0]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BDF7DD0]();
}

uint64_t VOTLogHandwriting()
{
  return MEMORY[0x24BDFE510]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x24BEBB298]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BDFE560]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BDFE570]();
}

uint64_t __UIAccessibilityGetAssociatedInteger()
{
  return MEMORY[0x24BDFE590]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

uint64_t __UIAccessibilitySetAssociatedInteger()
{
  return MEMORY[0x24BDFE5F0]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x24BEBB2E0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

