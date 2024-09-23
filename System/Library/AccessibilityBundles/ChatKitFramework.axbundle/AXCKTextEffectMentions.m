@implementation AXCKTextEffectMentions

void ___AXCKTextEffectMentions_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  AXCKMentionSubelement *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  if (v7)
  {
    v15 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v15, "integerValue");
      v10 = -[AXCKMentionSubelement initWithTextView:]([AXCKMentionSubelement alloc], "initWithTextView:", *(_QWORD *)(a1 + 32));
      -[AXCKMentionSubelement setRange:](v10, "setRange:", a3, a4);
      -[AXCKMentionSubelement setType:](v10, "setType:", 2);
      if ((unint64_t)(v9 - 1) > 0xB)
        v11 = &stru_2501B2580;
      else
        v11 = off_2501B1C08[v9 - 1];
      accessibilityLocalizedString(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXCKMentionSubelement setAccessibilityValue:](v10, "setAccessibilityValue:", v12);

      objc_msgSend(*(id *)(a1 + 40), "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringWithRange:", a3, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXCKMentionSubelement setAccessibilityLabel:](v10, "setAccessibilityLabel:", v14);

      objc_msgSend(*(id *)(a1 + 48), "axSafelyAddObject:", v10);
      v7 = v15;
    }
  }

}

@end
