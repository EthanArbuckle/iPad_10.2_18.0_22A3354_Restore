@implementation AVTAvatarAttributeEditorSectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAvatarAttributeEditorSectionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSection"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSectionItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionController"), CFSTR("section"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSection"), CFSTR("sectionItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionItem"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSection"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionController"), CFSTR("viewForIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSectionCoordinator"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionCoordinator"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorDataSource"), CFSTR("categories"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorDataSource"), CFSTR("currentCategoryIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorCategory"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorCategory"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarAttributeEditorSection"), CFSTR("localizedName"));

}

- (id)viewForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AVTAvatarAttributeEditorSectionControllerAccessibility;
  -[AVTAvatarAttributeEditorSectionControllerAccessibility viewForIndex:](&v30, sel_viewForIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[AVTAvatarAttributeEditorSectionControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("section.sectionItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490761C](CFSTR("AVTAvatarAttributeEditorSectionItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "safeStringForKey:", CFSTR("localizedName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v9);
    -[AVTAvatarAttributeEditorSectionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeStringForKey:", CFSTR("localizedName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[AVTAvatarAttributeEditorSectionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x23490761C](CFSTR("AVTAvatarAttributeEditorSectionCoordinator"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "safeValueForKey:", CFSTR("delegate"));
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      objc_msgSend(v12, "safeValueForKey:", CFSTR("dataSource"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeArrayForKey:", CFSTR("categories"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v14;
      objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v14, "safeUnsignedIntegerForKey:", CFSTR("currentCategoryIndex")));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "safeArrayForKey:", CFSTR("sections"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v10;
      v18 = objc_msgSend(v17, "indexOfObject:", v10);
      if (v18 >= objc_msgSend(v17, "count"))
        goto LABEL_10;
      v27 = v9;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safeValueForKey:", CFSTR("localizedName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        --v18;
      }
      while (v18 < objc_msgSend(v17, "count") && !v11);
      v9 = v27;
      if (!v11)
      {
LABEL_10:
        objc_msgSend(v16, "safeValueForKey:", CFSTR("localizedName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v10 = v29;
    }
    v20 = objc_msgSend(v11, "length");
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = a3 + 1;
    if (v20)
    {
      accessibilityLocalizedString(CFSTR("starfish.number.of.in"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v23, v22, objc_msgSend(v7, "count"), v11);
    }
    else
    {
      accessibilityLocalizedString(CFSTR("starfish.number.of"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v23, v22, objc_msgSend(v7, "count"), v26);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityValue:", v24);

  }
  return v5;
}

@end
