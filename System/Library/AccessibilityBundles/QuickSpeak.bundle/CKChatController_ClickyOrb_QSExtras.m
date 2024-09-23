@implementation CKChatController_ClickyOrb_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("_menuForChatItem:withParentChatItem:menuAppearance: @encode(id)"), "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKCoreChatController"), CFSTR("collectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("balloonViewForChatItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonChatItem"), CFSTR("balloonViewClass"), "#", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessagePartChatItem"), CFSTR("CKBalloonChatItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKTextBalloonView"));

}

- (id)_menuForChatItem:(id)a3 withParentChatItem:(id)a4 menuAppearance:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  LOBYTE(v23) = 0;
  objc_opt_class();
  v29.receiver = self;
  v29.super_class = (Class)CKChatController_ClickyOrb_QSExtras;
  -[CKChatController_ClickyOrb_QSExtras _menuForChatItem:withParentChatItem:menuAppearance:](&v29, sel__menuForChatItem_withParentChatItem_menuAppearance_, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (_AXSQuickSpeakEnabled())
    {
      objc_msgSend(v11, "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 >= 2)
      {
        objc_msgSend(v8, "safeValueForKey:", CFSTR("balloonViewClass"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isSubclassOfClass:", NSClassFromString(CFSTR("CKTextBalloonView")));

        if (v15)
        {
          v23 = 0;
          v24 = &v23;
          v25 = 0x3032000000;
          v26 = __Block_byref_object_copy_;
          v27 = __Block_byref_object_dispose_;
          v28 = 0;
          v22 = v8;
          AXPerformSafeBlock();
          v16 = (id)v24[5];

          _Block_object_dispose(&v23, 8);
          -[CKChatController_ClickyOrb_QSExtras _axActionForSpeakSelection:](self, "_axActionForSpeakSelection:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "children");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "insertObject:atIndex:", v17, v13 - 1);
          objc_msgSend(v11, "menuByReplacingChildren:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v20;
        }
      }
    }
  }

  return v11;
}

- (id)_axActionForSpeakSelection:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSpeaking"))
    v5 = CFSTR("quickspeak.pause");
  else
    v5 = CFSTR("quickspeak.speak");
  accessibilityQuickSpeakLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rectangle.3.group.bubble.left"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDF67B8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__CKChatController_ClickyOrb_QSExtras__axActionForSpeakSelection___block_invoke;
  v12[3] = &unk_24FF24810;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
