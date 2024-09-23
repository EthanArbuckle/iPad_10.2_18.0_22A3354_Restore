@implementation CKMediaObjectBackedAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMediaObjectBackedAsset");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObjectBackedAsset"), CFSTR("acknowledgmentChatItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObjectBackedAsset"), CFSTR("mediaType"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  __CFString *v7;
  void *v8;
  void *v10;

  -[CKMediaObjectBackedAssetAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = -[CKMediaObjectBackedAssetAccessibility _accessibilityMediaType](self, "_accessibilityMediaType");
    if (v6 == 1)
    {
      v7 = CFSTR("photo.attachment");
    }
    else
    {
      if (v6 != 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = CFSTR("video.attachment");
    }
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    -[CKMediaObjectBackedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("acknowledgmentChatItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v5 = v3;
LABEL_10:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73C8];
}

- (int64_t)_accessibilityMediaType
{
  return -[CKMediaObjectBackedAssetAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("mediaType"));
}

@end
