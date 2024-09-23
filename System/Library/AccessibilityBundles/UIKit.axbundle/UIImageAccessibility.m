@implementation UIImageAccessibility

- (CGImage)CGImage
{
  id location;
  objc_super v4;
  CGImage *v5;
  SEL v6;
  UIImageAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIImageAccessibility;
  v5 = -[UIImageAccessibility CGImage](&v4, sel_CGImage);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    location = -[UIImageAccessibility accessibilityLabel](v7, "accessibilityLabel");
    if (location)
      -[CGImage setAccessibilityLabel:](v5, "setAccessibilityLabel:", location);
    objc_storeStrong(&location, 0);
  }
  return v5;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  objc_super v14;
  id v15;
  id v16;
  id v18;
  _QWORD __b[8];
  id v20;
  id v21;
  id v22;
  int v23;
  id v24[2];
  UIImageAccessibility *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  v24[1] = (id)a2;
  v24[0] = (id)-[UIImageAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (objc_msgSend(v24[0], "length"))
  {
    v26 = v24[0];
    v23 = 1;
  }
  else
  {
    v22 = (id)-[UIImageAccessibility _accessibilityContextDrawingAnnotations](v25, "_accessibilityContextDrawingAnnotations");
    if (objc_msgSend(v22, "count"))
    {
      v21 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      memset(__b, 0, sizeof(__b));
      obj = v22;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
      if (v13)
      {
        v9 = *(_QWORD *)__b[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(obj);
          v20 = *(id *)(__b[1] + 8 * v10);
          v6 = v21;
          v7 = (id)objc_msgSend(v20, "label");
          objc_msgSend(v6, "addObject:");

          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
            if (!v11)
              break;
          }
        }
      }

      v26 = (id)MEMORY[0x2348C3584](v21);
      v23 = 1;
      objc_storeStrong(&v21, 0);
    }
    else
    {
      v5 = (id)-[UIImageAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_imageAsset"));
      v18 = (id)objc_msgSend(v5, "safeStringForKey:", CFSTR("assetName"));

      if (!(MEMORY[0x2348C3A10](v25) & 1))
        goto LABEL_32;
      v16 = (id)accessibilityUIKitSymbolNamesLocalizedString();
      if (!objc_msgSend(v16, "length") || (objc_msgSend(v16, "isEqualToString:", v18) & 1) != 0)
      {
        v2 = (id)accessibilityUIKitLocalizedString();
        v3 = v16;
        v16 = v2;

      }
      if (objc_msgSend(v16, "length"))
      {
        v15 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16);
        if ((objc_msgSend(v16, "isEqualToString:", v18) & 1) != 0)
          objc_msgSend(v15, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB80]);
        objc_msgSend(v15, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB88]);
        v26 = v15;
        v23 = 1;
        objc_storeStrong(&v15, 0);
      }
      else
      {
        v23 = 0;
      }
      objc_storeStrong(&v16, 0);
      if (!v23)
      {
LABEL_32:
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("magnifyingglass")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("SearchIcon")) & 1) != 0
          || (objc_msgSend(v18, "containsString:", CFSTR("ellipsis.circle")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("plus.circle.fill")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("square.and.arrow.up")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("trash")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("xmark")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("UIButtonBarKeyboardCutGroup")) & 1) != 0
          || (objc_msgSend(v18, "isEqualToString:", CFSTR("UIButtonBarKeyboardUndoGroup")) & 1) != 0)
        {
          v26 = (id)accessibilityUIKitLocalizedString();
          v23 = 1;
        }
        else
        {
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("mic_badge_xmark")) & 1) != 0)
          {
            v26 = (id)accessibilityUIKitLocalizedString();
          }
          else
          {
            v14.receiver = v25;
            v14.super_class = (Class)UIImageAccessibility;
            v26 = -[UIImageAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
          }
          v23 = 1;
        }
      }
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  return v26;
}

void __47__UIImageAccessibility_imageWithRenderingMode___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  v1 = a1[4];
  v2 = (id)objc_msgSend(a1[5], "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v3 = a1[4];
  v4 = (id)objc_msgSend(a1[5], "accessibilityIdentifier");
  objc_msgSend(v3, "setAccessibilityIdentifier:");

  location[0] = (id)objc_msgSend(a1[5], "accessibilityUserDefinedLabel");
  if (location[0])
    objc_msgSend(a1[4], "setAccessibilityLabel:", location[0]);
  objc_storeStrong(location, 0);
}

void __53__UIImageAccessibility_imageWithAlignmentRectInsets___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

uint64_t __74__UIImageAccessibility_imageNamed_inBundle_compatibleWithTraitCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (id)accessibilityIdentifier
{
  id v3;
  id v4;
  id v5[2];
  UIImageAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UIImageAccessibility accessibilityUserDefinedIdentifier](self, "accessibilityUserDefinedIdentifier");
  if (!v5[0])
  {
    v5[0] = (id)-[UIImageAccessibility accessibilityIdentification](v6, "accessibilityIdentification");

  }
  if (!v5[0])
  {
    v4 = (id)-[UIImageAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_imageAsset"));
    v5[0] = (id)objc_msgSend(v4, "safeStringForKey:", CFSTR("assetName"));

  }
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  objc_super v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  id v21;

  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v16.receiver = v21;
  v16.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v17 = objc_msgSendSuper2(&v16, sel_imageNamed_inBundle_compatibleWithTraitCollection_, location[0], v19, v18);
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __74__UIImageAccessibility_imageNamed_inBundle_compatibleWithTraitCollection___block_invoke;
  v13 = &unk_24FF3E050;
  v14 = v17;
  v15 = location[0];
  AXPerformBlockOnMainThread();
  v8 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UIImageAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UIImageAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v2.receiver = v4;
  v2.super_class = (Class)UIImageAccessibility;
  -[UIImageAccessibility dealloc](&v2, sel_dealloc);
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  id v6;
  id v7;
  CGContextRef CurrentContext;
  objc_super v9;
  id v10[6];

  v10[5] = a1;
  v10[4] = (id)a2;
  v10[3] = a3;
  v10[2] = *(id *)&a4;
  v10[1] = (id)a5;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v10[0] = objc_msgSendSuper2(&v9, sel_imageWithCGImage_scale_orientation_, a3, a5, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = (id)objc_msgSend(MEMORY[0x24BDFFA90], "annotationsForContext:", CurrentContext);
  objc_msgSend(v10[0], "_accessibilitySetContextDrawingAnnotations:", v7);
  v6 = v10[0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v10, 0);
  return v6;
}

- (id)imageWithRenderingMode:(int64_t)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  id v10;
  UIImageAccessibility *v11;
  objc_super v12;
  id v13[3];
  UIImageAccessibility *v14;

  v14 = self;
  v13[2] = (id)a2;
  v13[1] = (id)a3;
  v12.receiver = self;
  v12.super_class = (Class)UIImageAccessibility;
  v13[0] = -[UIImageAccessibility imageWithRenderingMode:](&v12, sel_imageWithRenderingMode_, a3);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __47__UIImageAccessibility_imageWithRenderingMode___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13[0];
  v11 = v14;
  AXPerformBlockOnMainThread();
  v4 = v13[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v13, 0);
  return v4;
}

- (id)imageWithAlignmentRectInsets:(UIEdgeInsets)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  UIImageAccessibility *v11;
  objc_super v12;
  id v13[2];
  UIImageAccessibility *v14;
  UIEdgeInsets v15;

  v15 = a3;
  v14 = self;
  v13[1] = (id)a2;
  v12.receiver = self;
  v12.super_class = (Class)UIImageAccessibility;
  v13[0] = -[UIImageAccessibility imageWithAlignmentRectInsets:](&v12, sel_imageWithAlignmentRectInsets_, a3.top, a3.left, a3.bottom, a3.right);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __53__UIImageAccessibility_imageWithAlignmentRectInsets___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13[0];
  v11 = v14;
  AXPerformBlockOnMainThread();
  v4 = v13[0];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v13, 0);
  return v4;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "{UIEdgeInsets=dddd}";
  v5 = "q";
  v6 = CFSTR("UIImage");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{UIEdgeInsets=dddd}", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_flatImageWithColor:"), v7, 0);
  v4 = "^{CGImage=}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("CGImage"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("imageWithAlignmentRectInsets:"), v7, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("imageWithRenderingMode:"), v7, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v6, CFSTR("imageWithCGImage:scale:orientation:"), v7, v4, "d", v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v6, CFSTR("imageNamed:inBundle:compatibleWithTraitCollection:"), v7, v7, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("imageFlippedForRightToLeftLayoutDirection"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_imageTintedWithColor:renderingMode:withUpdatedCGImage:"), v7, v5, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("encodeWithCoder:"), "v", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("initWithCoder:"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  id location[2];
  UIImageAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)UIImageAccessibility;
  -[UIImageAccessibility encodeWithCoder:](&v8, sel_encodeWithCoder_, location[0]);
  v7 = (id)-[UIImageAccessibility _accessibilityEncodedHierarchyData](v10, "_accessibilityEncodedHierarchyData");
  if (v7)
    objc_msgSend(location[0], "encodeObject:forKey:", v7, CFSTR("_accessibilityEncodedHierarchyData"));
  v3 = location[0];
  v4 = (id)-[UIImageAccessibility accessibilityHint](v10, "accessibilityHint");
  objc_msgSend(v3, "encodeObject:forKey:");

  v5 = location[0];
  v6 = (id)-[UIImageAccessibility accessibilityValue](v10, "accessibilityValue");
  objc_msgSend(v5, "encodeObject:forKey:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (UIImageAccessibility)initWithCoder:(id)a3
{
  UIImageAccessibility *v3;
  id v5;
  id v6;
  UIImageAccessibility *v7;
  id v8;
  objc_super v9;
  UIImageAccessibility *v10;
  id location[2];
  UIImageAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)UIImageAccessibility;
  v12 = -[UIImageAccessibility initWithCoder:](&v9, sel_initWithCoder_, location[0]);
  v10 = v12;
  v8 = (id)objc_msgSend(location[0], "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessibilityEncodedHierarchyData"));
  if (v8)
    -[UIImageAccessibility _setAccessibilityEncodedHierarchyData:](v10, "_setAccessibilityEncodedHierarchyData:", v8);
  v5 = (id)objc_msgSend(location[0], "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityHint"));
  -[UIImageAccessibility setAccessibilityHint:](v12, "setAccessibilityHint:");

  v6 = (id)objc_msgSend(location[0], "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityValue"));
  -[UIImageAccessibility setAccessibilityValue:](v12, "setAccessibilityValue:");

  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

- (id)_accessibilityPhotoDescription
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17[3];
  id v18;

  v17[2] = self;
  v17[1] = (id)a2;
  v17[0] = (id)-[UIImageAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  if (v17[0])
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v17[0]);
    v14 = 0;
    if (v15)
    {
      v13 = (id)UIAccessibilityPhotoCreationDate();
      v12 = (id)UIAccessibilityEmojiDescription();
      if (objc_msgSend(v12, "length"))
      {
        v11 = (id)accessibilityUIKitLocalizedString();
        v2 = (id)__UIAXStringForVariables();
        v3 = v14;
        v14 = v2;

        objc_storeStrong(&v11, 0);
      }
      else
      {
        v10 = (id)UIAccessibilityMetadataDescriptionForImage();
        v9 = 0;
        if ((UIAccessibilityIsImageScreenshot() & 1) != 0)
        {
          v4 = (id)accessibilityUIKitLocalizedString();
          v5 = v9;
          v9 = v4;

        }
        v6 = (id)__UIAXStringForVariables();
        v7 = v14;
        v14 = v6;

        objc_storeStrong(&v9, 0);
        objc_storeStrong(&v10, 0);
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    v18 = v14;
    v16 = 1;
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v18 = 0;
    v16 = 1;
  }
  objc_storeStrong(v17, 0);
  return v18;
}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  UIImageAccessibility *v12;
  objc_super v13;
  id v14[3];
  UIImageAccessibility *v15;
  UIEdgeInsets v16;

  v16 = a3;
  v15 = self;
  v14[2] = (id)a2;
  v14[1] = (id)a4;
  v13.receiver = self;
  v13.super_class = (Class)UIImageAccessibility;
  v14[0] = -[UIImageAccessibility resizableImageWithCapInsets:resizingMode:](&v13, sel_resizableImageWithCapInsets_resizingMode_, a4, a3.top, a3.left, a3.bottom, a3.right);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __65__UIImageAccessibility_resizableImageWithCapInsets_resizingMode___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = v14[0];
  v12 = v15;
  AXPerformBlockOnMainThread();
  v5 = v14[0];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v14, 0);
  return v5;
}

void __65__UIImageAccessibility_resizableImageWithCapInsets_resizingMode___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (UIImageAccessibility)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  UIImageAccessibility *v4;
  UIImageAccessibility *v7;
  UIImageAccessibility *v8;
  id v9;
  objc_super v10;
  BOOL v11;
  id location[2];
  UIImageAccessibility *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)UIImageAccessibility;
  v13 = -[UIImageAccessibility initWithContentsOfFile:cache:](&v10, sel_initWithContentsOfFile_cache_, location[0], a4);
  objc_storeStrong((id *)&v13, v13);
  v8 = v13;
  v9 = location[0];
  AXPerformBlockOnMainThread();
  v7 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v7;
}

uint64_t __53__UIImageAccessibility_initWithContentsOfFile_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

+ (id)imageAtPath:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v13 = objc_msgSendSuper2(&v12, sel_imageAtPath_, location[0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __36__UIImageAccessibility_imageAtPath___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13;
  v11 = location[0];
  AXPerformBlockOnMainThread();
  v4 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __36__UIImageAccessibility_imageAtPath___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  objc_msgSend(v1, "accessibilitySetIdentification:");

}

- (UIImageAccessibility)initWithContentsOfFile:(id)a3
{
  UIImageAccessibility *v3;
  UIImageAccessibility *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  UIImageAccessibility *v11;
  id v12;
  objc_super v13;
  id location[2];
  UIImageAccessibility *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v15;
  v15 = 0;
  v13.receiver = v3;
  v13.super_class = (Class)UIImageAccessibility;
  v15 = -[UIImageAccessibility initWithContentsOfFile:](&v13, sel_initWithContentsOfFile_, location[0]);
  objc_storeStrong((id *)&v15, v15);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __47__UIImageAccessibility_initWithContentsOfFile___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = v15;
  v12 = location[0];
  AXPerformBlockOnMainThread();
  v5 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v5;
}

uint64_t __47__UIImageAccessibility_initWithContentsOfFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

+ (id)imageWithContentsOfFile:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v13 = objc_msgSendSuper2(&v12, sel_imageWithContentsOfFile_, location[0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __48__UIImageAccessibility_imageWithContentsOfFile___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13;
  v11 = location[0];
  AXPerformBlockOnMainThread();
  v4 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __48__UIImageAccessibility_imageWithContentsOfFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

+ (id)kitImageNamed:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility;
  v13 = objc_msgSendSuper2(&v12, sel_kitImageNamed_, location[0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __38__UIImageAccessibility_kitImageNamed___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13;
  v11 = location[0];
  AXPerformBlockOnMainThread();
  v4 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __38__UIImageAccessibility_kitImageNamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  UIImageAccessibility *v12;
  objc_super v13;
  id v14;
  int v15;
  double v16;
  SEL v17;
  UIImageAccessibility *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIImageAccessibility;
  v14 = -[UIImageAccessibility _imageScaledToProportion:interpolationQuality:](&v13, sel__imageScaledToProportion_interpolationQuality_, a4, a3);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __70__UIImageAccessibility__imageScaledToProportion_interpolationQuality___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = v14;
  v12 = v18;
  AXPerformBlockOnMainThread();
  v5 = v14;
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  return v5;
}

uint64_t __70__UIImageAccessibility__imageScaledToProportion_interpolationQuality___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v2, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

  return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityLabel:", 0);
}

- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  UIImageAccessibility *v12;
  objc_super v13;
  id v14[4];
  UIImageAccessibility *v15;

  v15 = self;
  v14[3] = (id)a2;
  v14[2] = *(id *)&a3;
  v14[1] = *(id *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)UIImageAccessibility;
  v14[0] = -[UIImageAccessibility _flatImageWithWhite:alpha:](&v13, sel__flatImageWithWhite_alpha_, a3, a4);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __50__UIImageAccessibility__flatImageWithWhite_alpha___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = v14[0];
  v12 = v15;
  AXPerformBlockOnMainThread();
  v5 = v14[0];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v14, 0);
  return v5;
}

void __50__UIImageAccessibility__flatImageWithWhite_alpha___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (id)_flatImageWithColor:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  UIImageAccessibility *v11;
  objc_super v12;
  id v13;
  id location[2];
  UIImageAccessibility *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)UIImageAccessibility;
  v13 = -[UIImageAccessibility _flatImageWithColor:](&v12, sel__flatImageWithColor_, location[0]);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __44__UIImageAccessibility__flatImageWithColor___block_invoke;
  v9 = &unk_24FF3E050;
  v10 = v13;
  v11 = v15;
  AXPerformBlockOnMainThread();
  v4 = v13;
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __44__UIImageAccessibility__flatImageWithColor___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  UIImageAccessibility *v19;
  objc_super v20;
  id v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  SEL v31;
  UIImageAccessibility *v32;

  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v23 = a10;
  v22 = a11;
  v20.receiver = self;
  v20.super_class = (Class)UIImageAccessibility;
  v21 = -[UIImageAccessibility _bezeledImageWithShadowRed:green:blue:alpha:fillRed:green:blue:alpha:drawShadow:](&v20, sel__bezeledImageWithShadowRed_green_blue_alpha_fillRed_green_blue_alpha_drawShadow_, a11, a3, a4, a5, a6, a7, a8, a9, a10);
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __104__UIImageAccessibility__bezeledImageWithShadowRed_green_blue_alpha_fillRed_green_blue_alpha_drawShadow___block_invoke;
  v17 = &unk_24FF3E050;
  v18 = v21;
  v19 = v32;
  AXPerformBlockOnMainThread();
  v12 = v21;
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  return v12;
}

void __104__UIImageAccessibility__bezeledImageWithShadowRed_green_blue_alpha_fillRed_green_blue_alpha_drawShadow___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  id v14;
  id v15;
  UIImageAccessibility *v16;
  uint64_t *v18;
  id *location;
  id *v20;
  id *v21;
  id obj;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  UIImageAccessibility *v30;
  objc_super v31;
  id v32[14];
  UIImageAccessibility *v33;

  v33 = self;
  v32[13] = (id)a2;
  v32[12] = *(id *)&a3;
  v32[11] = *(id *)&a4;
  v32[10] = *(id *)&a5;
  v32[9] = *(id *)&a6;
  v32[8] = *(id *)&a7;
  v32[7] = *(id *)&a8;
  v32[6] = *(id *)&a9;
  v32[5] = *(id *)&a10;
  v32[4] = *(id *)&a11;
  v32[3] = *(id *)&a12;
  v32[2] = *(id *)&a13;
  v32[1] = *(id *)&a14;
  v31.receiver = self;
  v31.super_class = (Class)UIImageAccessibility;
  v14 = -[UIImageAccessibility _doubleBezeledImageWithExteriorShadowRed:green:blue:alpha:interiorShadowRed:green:blue:alpha:fillRed:green:blue:alpha:](&v31, sel__doubleBezeledImageWithExteriorShadowRed_green_blue_alpha_interiorShadowRed_green_blue_alpha_fillRed_green_blue_alpha_, a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14);
  v21 = v32;
  v32[0] = v14;
  v18 = &v24;
  v24 = MEMORY[0x24BDAC760];
  v25 = -1073741824;
  v26 = 0;
  v27 = __142__UIImageAccessibility__doubleBezeledImageWithExteriorShadowRed_green_blue_alpha_interiorShadowRed_green_blue_alpha_fillRed_green_blue_alpha___block_invoke;
  v28 = &unk_24FF3E050;
  v15 = v14;
  v20 = (id *)(v18 + 4);
  v29 = v15;
  v16 = v33;
  location = (id *)(v18 + 5);
  v30 = v16;
  AXPerformBlockOnMainThread();
  v23 = v32[0];
  obj = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(v20, obj);
  objc_storeStrong(v21, obj);
  return v23;
}

void __142__UIImageAccessibility__doubleBezeledImageWithExteriorShadowRed_green_blue_alpha_interiorShadowRed_green_blue_alpha_fillRed_green_blue_alpha___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (id)imageFlippedForRightToLeftLayoutDirection
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  UIImageAccessibility *v10;
  objc_super v11;
  id v12[2];
  UIImageAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)UIImageAccessibility;
  v12[0] = -[UIImageAccessibility imageFlippedForRightToLeftLayoutDirection](&v11, sel_imageFlippedForRightToLeftLayoutDirection);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __65__UIImageAccessibility_imageFlippedForRightToLeftLayoutDirection__block_invoke;
  v8 = &unk_24FF3E050;
  v9 = v12[0];
  v10 = v13;
  AXPerformBlockOnMainThread();
  v3 = v12[0];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v12, 0);
  return v3;
}

void __65__UIImageAccessibility_imageFlippedForRightToLeftLayoutDirection__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5
{
  id v8;
  id v9;
  UIImageAccessibility *v10;
  objc_super v11;
  id v12;
  BOOL v13;
  int64_t v14;
  id location[2];
  UIImageAccessibility *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = a5;
  v11.receiver = v16;
  v11.super_class = (Class)UIImageAccessibility;
  v12 = -[UIImageAccessibility _imageTintedWithColor:renderingMode:withUpdatedCGImage:](&v11, sel__imageTintedWithColor_renderingMode_withUpdatedCGImage_, location[0], a4, a5);
  v9 = v12;
  v10 = v16;
  AXPerformBlockOnMainThread();
  v8 = v12;
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v8;
}

void __79__UIImageAccessibility__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentification");
  objc_msgSend(v1, "accessibilitySetIdentification:");

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "accessibilityIdentifier");
  objc_msgSend(v4, "setAccessibilityIdentifier:");

}

@end
