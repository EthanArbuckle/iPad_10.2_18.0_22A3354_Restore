@implementation AXTextStyleMention

void ___AXTextStyleMention_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  AXCKMentionSubelement *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a2;
  if (v7)
  {
    v16 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v16;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v16, "unsignedIntegerValue");
      v7 = v16;
      if (v9 == 1)
      {
        v10 = -[AXCKMentionSubelement initWithTextView:]([AXCKMentionSubelement alloc], "initWithTextView:", *(_QWORD *)(a1 + 32));
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setRange:", a3, a4);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setType:", 2);
        accessibilityLocalizedString(*(void **)(a1 + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAccessibilityValue:", v13);

        objc_msgSend(*(id *)(a1 + 48), "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringWithRange:", a3, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAccessibilityLabel:", v15);

        v7 = v16;
      }
    }
  }

}

@end
