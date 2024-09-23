@implementation MPVoicemailTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPVoicemailTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVoicemailTableViewController"), CFSTR("voicemailMessageViewModelForVoicemail:isExpanded:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVoicemailTableViewController"), CFSTR("voicemailController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVoicemailController"), CFSTR("callProviderManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobilePhone.FTMessage"), CFSTR("receiverDestinationID"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobilePhone.FTMessage"), CFSTR("receiverISOCountryCode"), "@", 0);

}

- (id)voicemailMessageViewModelForVoicemail:(id)a3 isExpanded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  objc_super v29;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  v29.receiver = self;
  v29.super_class = (Class)MPVoicemailTableViewControllerAccessibility;
  -[MPVoicemailTableViewControllerAccessibility voicemailMessageViewModelForVoicemail:isExpanded:](&v29, sel_voicemailMessageViewModelForVoicemail_isExpanded_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v23) = 0;
  objc_opt_class();
  -[MPVoicemailTableViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("voicemailController.callProviderManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "telephonyProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prioritizedSenderIdentities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v14 = v6;
    AXPerformSafeBlock();
    v15 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
    if (v13 >= 2 && objc_msgSend(v15, "length"))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49E8]), "initWithType:value:", 2, v15);
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy_;
      v27 = __Block_byref_object_dispose_;
      v28 = 0;
      v22 = v14;
      AXPerformSafeBlock();
      v17 = (id)v24[5];

      _Block_object_dispose(&v23, 8);
      objc_msgSend(v16, "canonicalHandleForISOCountryCode:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "senderIdentityForHandle:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_axSetLocalizedSenderIdentityFullName:", v20);
    }

  }
  return v8;
}

void __96__MPVoicemailTableViewControllerAccessibility_voicemailMessageViewModelForVoicemail_isExpanded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "receiverDestinationID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __96__MPVoicemailTableViewControllerAccessibility_voicemailMessageViewModelForVoicemail_isExpanded___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "receiverISOCountryCode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
