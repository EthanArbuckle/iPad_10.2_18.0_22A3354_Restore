@implementation CNSharingProfileAvatarItemProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNSharingProfileAvatarItemProvider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CNSharingProfileAvatarItemProvider"), CFSTR("silhouetteImageItemWithRenderer:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CNSharingProfileAvatarItemProvider"), CFSTR("contactImageItemWithContact:renderer:logger:type:"), "@", "@", "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CNSharingProfileAvatarItemProvider"), CFSTR("monogramImageItemWithContact:monogramColor:renderer:RTL:"), "@", "@", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CNSharingProfileAvatarItemProvider"), CFSTR("animojiItemWithRecord:stickerConfiguration:backgroundColor:"), "@", "@", "@", "@", 0);

}

+ (id)silhouetteImageItemWithRenderer:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  objc_msgSendSuper2(&v6, sel_silhouetteImageItemWithRenderer_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("contact.image.type.silhouette"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityValue:", v4);

  return v3;
}

+ (id)contactImageItemWithContact:(id)a3 renderer:(id)a4 logger:(id)a5 type:(int64_t)a6
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  objc_msgSendSuper2(&v9, sel_contactImageItemWithContact_renderer_logger_type_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("contact.image.type.photo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityValue:", v7);

  return v6;
}

+ (id)monogramImageItemWithContact:(id)a3 monogramColor:(id)a4 renderer:(id)a5 RTL:(BOOL)a6
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  objc_msgSendSuper2(&v9, sel_monogramImageItemWithContact_monogramColor_renderer_RTL_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("contact.image.type.monogram"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityValue:", v7);

  return v6;
}

+ (id)animojiItemWithRecord:(id)a3 stickerConfiguration:(id)a4 backgroundColor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CNSharingProfileAvatarItemProviderAccessibility;
  v7 = a4;
  v8 = a3;
  objc_msgSendSuper2(&v14, sel_animojiItemWithRecord_stickerConfiguration_backgroundColor_, v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("localizedName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityValue:", v12, v11, CFSTR("__AXStringForVariablesSentinel"), v14.receiver, v14.super_class);

  return v9;
}

@end
