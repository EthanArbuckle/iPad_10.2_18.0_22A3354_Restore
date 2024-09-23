@implementation CKChatController

void __90__CKChatController_ClickyOrb_QSExtras__menuForChatItem_withParentChatItem_menuAppearance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonViewForChatItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__CKChatController_ClickyOrb_QSExtras__axActionForSpeakSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelectable:", 1);
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isSpeaking");

  if ((_DWORD)v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "_accessibilityPauseSpeaking:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_accessibilitySpeak:", 0);
  }

}

@end
