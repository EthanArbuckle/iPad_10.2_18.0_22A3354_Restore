@implementation CKAggregateAcknowledgmentChatItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAggregateAcknowledgmentChatItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAggregateAcknowledgmentChatItem"), CFSTR("acknowledgments"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAggregateAcknowledgmentChatItem"), CFSTR("includesMultiple"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAggregateAcknowledgmentChatItem"), CFSTR("includesFromMe"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  objc_opt_class();
  -[CKAggregateAcknowledgmentChatItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("acknowledgments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
    v13 = 0;
    goto LABEL_26;
  }
  if (!-[CKAggregateAcknowledgmentChatItemAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("includesMultiple")))
  {
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isFromMe")) & 1) != 0)
    {
      v12 = 0;
      v7 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v8, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("multiple.reactions.description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isFromMe")) & 1) != 0)
    goto LABEL_9;
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("acknowledgment.latest.format"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (-[CKAggregateAcknowledgmentChatItemAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("includesFromMe")))
  {
    if (-[CKAggregateAcknowledgmentChatItemAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("includesMultiple")))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "reverseObjectEnumerator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v19, "safeBoolForKey:", CFSTR("isFromMe")))
            {
              v20 = v19;
              goto LABEL_24;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v16)
            continue;
          break;
        }
      }
      v20 = 0;
LABEL_24:

    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v20, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  return v13;
}

@end
