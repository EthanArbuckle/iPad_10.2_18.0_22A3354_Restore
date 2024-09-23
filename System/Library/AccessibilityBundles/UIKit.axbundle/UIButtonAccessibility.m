@implementation UIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIButton");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_imageView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_backgroundView"), v5, 0);
  v3 = CFSTR("_UIButtonConfiguration");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("attributedTitle"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_currentConfiguration"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)automationElements
{
  objc_super v3;
  SEL v4;
  UIButtonAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if ((-[UIButtonAccessibility _accessibilityHasOrderedChildren](self, "_accessibilityHasOrderedChildren") & 1) != 0)
  {
    v3.receiver = v5;
    v3.super_class = (Class)UIButtonAccessibility;
    v6 = -[UIButtonAccessibility automationElements](&v3, sel_automationElements);
  }
  else
  {
    v6 = (id)-[UIButtonAccessibility _accessibilityFindSubviewDescendantsPassingTest:](v5, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_12);
  }
  return v6;
}

uint64_t __43__UIButtonAccessibility_automationElements__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_contentForState:(unint64_t)a3
{
  id v3;
  id v4;
  id v6;
  objc_super v7;
  objc_super v8;
  id v9;
  unint64_t v10;
  SEL v11;
  UIButtonAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility;
  v9 = -[UIButtonAccessibility _contentForState:](&v8, sel__contentForState_, a3);
  if (!v9
    && (-[UIButtonAccessibility _accessibilityIsFKARunningForFocusItem](v12, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    if ((v10 & 8) != 0 && ((v10 & 1) != 0 || (v10 & 2) != 0 || (v10 & 4) != 0))
      v10 &= ~8uLL;
    v7.receiver = v12;
    v7.super_class = (Class)UIButtonAccessibility;
    v3 = -[UIButtonAccessibility _contentForState:](&v7, sel__contentForState_, v10);
    v4 = v9;
    v9 = v3;

  }
  v6 = v9;
  objc_storeStrong(&v9, 0);
  return v6;
}

- (id)_accessibilityImagePath
{
  id *location;
  id v4;
  id v5[2];
  UIButtonAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UIButtonAccessibility imageForState:](self, "imageForState:", 0);
  if (!v5[0])
  {
    v5[0] = (id)-[UIButtonAccessibility backgroundImageForState:](v6, "backgroundImageForState:", 0);

  }
  v4 = (id)objc_msgSend(v5[0], "accessibilityIdentifier", v5);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  char v26;
  id v27;
  BOOL v28;
  id v29;
  BOOL v30;
  id v31;
  char v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  int v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  id v55;
  id location;
  id v58[2];
  UIButtonAccessibility *v59;
  id v60;

  v59 = self;
  v58[1] = (id)a2;
  v2 = (id)-[UIButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v40 = v2 == 0;

  if (v40)
  {
    v58[0] = 0;
    if (!objc_msgSend(0, "length"))
    {
      location = (id)-[UIButtonAccessibility currentAttributedTitle](v59, "currentAttributedTitle");
      v38 = (id)objc_msgSend(location, "string");
      v39 = objc_msgSend(v38, "length") != 0;

      if (v39)
      {
        if (objc_msgSend(location, "length"))
        {
          v5 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
          v6 = v58[0];
          v58[0] = v5;

          if (!v58[0])
          {
            v58[0] = (id)objc_msgSend(location, "string");

          }
        }
      }
      else
      {
        v3 = (id)-[UIButtonAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("currentTitle"));
        v4 = v58[0];
        v58[0] = v3;

      }
      objc_storeStrong(&location, 0);
    }
    if (!objc_msgSend(v58[0], "length"))
    {
      v54 = 0;
      objc_opt_class();
      v37 = (id)-[UIButtonAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("_currentConfiguration"));
      v53 = (id)__UIAccessibilityCastAsClass();

      v52 = v53;
      objc_storeStrong(&v53, 0);
      v55 = v52;
      if (v52)
      {
        v7 = (id)objc_msgSend(v55, "title");
        v8 = v58[0];
        v58[0] = v7;

      }
      objc_storeStrong(&v55, 0);
    }
    v35 = (id)-[UIButtonAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("isSelected"));
    v36 = objc_msgSend(v35, "BOOLValue");

    if ((v36 & 1) != 0)
    {
      v34 = (id)-[UIButtonAccessibility attributedTitleForState:](v59, "attributedTitleForState:", 4);
      v51 = (id)objc_msgSend(v34, "string");

      if (!v51)
      {
        v51 = (id)-[UIButtonAccessibility titleForState:](v59, "titleForState:", 4);

      }
      if (!objc_msgSend(v58[0], "length") || v51)
        objc_storeStrong(v58, v51);
      objc_storeStrong(&v51, 0);
    }
    if (!objc_msgSend(v58[0], "length"))
    {
      v33 = (id)-[UIButtonAccessibility attributedTitleForState:](v59, "attributedTitleForState:", 0);
      v9 = (id)objc_msgSend(v33, "string");
      v10 = v58[0];
      v58[0] = v9;

      if (!objc_msgSend(v58[0], "length"))
      {
        v11 = (id)-[UIButtonAccessibility titleForState:](v59, "titleForState:", 0);
        v12 = v58[0];
        v58[0] = v11;

      }
    }
    v50 = (id)-[UIButtonAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("currentImage"));
    if (objc_msgSend(v58[0], "length"))
      goto LABEL_73;
    v49 = (id)objc_msgSend(v50, "accessibilityIdentifier");
    v31 = (id)UIImageGetTableNextButton();
    v32 = 1;
    if ((objc_msgSend(v50, "isEqual:") & 1) == 0)
      v32 = objc_msgSend(v49, "hasPrefix:", CFSTR("UIAccessoryButtonInfo"));

    if ((v32 & 1) != 0)
    {
      v60 = accessibilityLocalizedString(CFSTR("more.info.button"));
      v48 = 1;
    }
    else if ((objc_msgSend(v49, "hasPrefix:", CFSTR("UINavigationBarBackIndicatorDefault")) & 1) != 0)
    {
      v60 = accessibilityLocalizedString(CFSTR("uibutton.navbar.back.button.title"));
      v48 = 1;
    }
    else if ((objc_msgSend(v49, "hasPrefix:", CFSTR("UIButtonBarAction")) & 1) != 0)
    {
      v60 = accessibilityLocalizedString(CFSTR("action.button"));
      v48 = 1;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("UITextFieldClearButton")) & 1) != 0)
    {
      v60 = accessibilityLocalizedString(CFSTR("clear.button.text"));
      v48 = 1;
    }
    else
    {
      v48 = 0;
    }
    objc_storeStrong(&v49, 0);
    if (!v48)
    {
LABEL_73:
      if (!objc_msgSend(v58[0], "length"))
      {
        v47 = (id)-[UIButtonAccessibility imageView](v59, "imageView");
        v29 = (id)objc_msgSend(v47, "accessibilityLabel");
        v30 = objc_msgSend(v29, "length") == 0;

        if (!v30)
        {
          v13 = (id)objc_msgSend(v47, "accessibilityLabel");
          v14 = v58[0];
          v58[0] = v13;

        }
        objc_storeStrong(&v47, 0);
      }
      if (objc_msgSend(v58[0], "length")
        || ((v46 = (id)-[UIButtonAccessibility accessibilityIdentification](v59, "accessibilityIdentification"), (objc_msgSend(v46, "isEqualToString:", CFSTR("UITableCellViewDisclosure")) & 1) == 0)&& -[UIButtonAccessibility buttonType](v59, "buttonType") != 4&& -[UIButtonAccessibility buttonType](v59, "buttonType") != 3&& -[UIButtonAccessibility buttonType](v59, "buttonType") != 2? ((objc_msgSend(v46, "isEqualToString:", CFSTR("UIClearButton")) & 1) == 0? (-[UIButtonAccessibility buttonType](v59, "buttonType") != 122&& -[UIButtonAccessibility buttonType](v59, "buttonType") != 7? (v48 = 0): (v60 = accessibilityLocalizedString(CFSTR("close.button")), v48 = 1)): (v60 = accessibilityLocalizedString(CFSTR("clear.button.text")), v48 = 1)): (v60 = accessibilityLocalizedString(CFSTR("more.info.button")), v48 = 1), objc_storeStrong(&v46, 0), !v48))
      {
        if (!objc_msgSend(v58[0], "length"))
        {
          v15 = (id)objc_msgSend(v50, "_accessibilityAXAttributedLabel");
          v16 = v58[0];
          v58[0] = v15;

        }
        if (!objc_msgSend(v58[0], "length"))
        {
          v45 = -[UIButtonAccessibility _accessibilityImagePath](v59, "_accessibilityImagePath");
          if (!objc_msgSend(v45, "length")
            || (v43 = objc_msgSend(v45, "rangeOfString:", CFSTR("ForgotPasswordButton")),
                v44 = v17,
                v43 == 0x7FFFFFFFFFFFFFFFLL))
          {
            v20 = (id)-[UIButtonAccessibility _accessibilityRetrieveImagePathLabel:](v59, "_accessibilityRetrieveImagePathLabel:", v45);
            v21 = v58[0];
            v58[0] = v20;

            if (objc_msgSend(v58[0], "length"))
            {
              v42 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1001, v59, 0, 0, 0, 0, 0, 0);
              -[UIButtonAccessibility _accessibilitySetAuditIssueDict:](v59, "_accessibilitySetAuditIssueDict:", v42);
              objc_storeStrong(&v42, 0);
            }
          }
          else
          {
            v18 = accessibilityLocalizedString(CFSTR("help.button"));
            v19 = v58[0];
            v58[0] = v18;

          }
          objc_storeStrong(&v45, 0);
        }
        if (objc_msgSend(v58[0], "length")
          || (v27 = (id)objc_msgSend(v50, "accessibilityLabel"),
              v28 = objc_msgSend(v27, "length") == 0,
              v27,
              v28))
        {
          v22 = (id)objc_msgSend(v58[0], "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
          v23 = v58[0];
          v58[0] = v22;

          v25 = (id)objc_msgSend(v58[0], "uppercaseString");
          v26 = objc_msgSend(v25, "isEqualToString:", v58[0]);

          if ((v26 & 1) != 0)
          {
            v41 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v58[0]);
            objc_msgSend(v41, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB08]);
            objc_storeStrong(v58, v41);
            objc_storeStrong(&v41, 0);
          }
          v60 = v58[0];
          v48 = 1;
        }
        else
        {
          v60 = (id)objc_msgSend(v50, "accessibilityLabel");
          v48 = 1;
        }
      }
    }
    objc_storeStrong(&v50, 0);
    objc_storeStrong(v58, 0);
  }
  else
  {
    v60 = (id)-[UIButtonAccessibility accessibilityUserDefinedLabel](v59, "accessibilityUserDefinedLabel");
  }
  return v60;
}

- (BOOL)_accessibilityElementHasImage
{
  id v2;
  id v3;
  BOOL v5;
  BOOL v6;

  v2 = (id)-[UIButtonAccessibility imageForState:](self, "imageForState:", 0);
  v6 = v2 == 0;

  if (!v6)
    return 1;
  v3 = (id)-[UIButtonAccessibility backgroundImageForState:](self, "backgroundImageForState:", 0);
  v5 = v3 == 0;

  return !v5;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;
  id v12[2];
  UIButtonAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)UIButtonAccessibility;
  v12[0] = -[UIButtonAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  if (!objc_msgSend(v12[0], "length"))
  {
    v9 = 0;
    objc_opt_class();
    v6 = (id)-[UIButtonAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("_currentConfiguration"));
    v8 = (id)__UIAccessibilityCastAsClass();

    v7 = v8;
    objc_storeStrong(&v8, 0);
    v10 = v7;
    if (v7)
    {
      v2 = (id)objc_msgSend(v10, "subtitle");
      v3 = v12[0];
      v12[0] = v2;

    }
    objc_storeStrong(&v10, 0);
  }
  v5 = v12[0];
  objc_storeStrong(v12, 0);
  return v5;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;
  id v12;
  id location[2];
  UIButtonAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11.receiver = v14;
  v11.super_class = (Class)UIButtonAccessibility;
  v12 = -[UIButtonAccessibility _accessibilityAuditIssuesWithOptions:](&v11, sel__accessibilityAuditIssuesWithOptions_, location[0]);
  v10 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE868], location[0]);
  v9 = 0;
  v9 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *MEMORY[0x24BDFE8B0], v10) & 1;
  if (v9)
  {
    v3 = -[UIButtonAccessibility accessibilityLabel](v14, "accessibilityLabel");
    v8 = (id)-[UIButtonAccessibility _accessibilityValueForKey:](v14, "_accessibilityValueForKey:", *MEMORY[0x24BEBB228]);
    v6 = v12;
    v7 = (id)objc_msgSend(v8, "allObjects");
    objc_msgSend(v6, "addObjectsFromArray:");

    objc_storeStrong(&v8, 0);
  }
  v5 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v9;
  id v10;
  char v11;
  id v12;
  BOOL v13;
  BOOL v15;

  v2 = (id)-[UIButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v13 = v2 == 0;

  if (v13)
  {
    v10 = (id)-[UIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("UITableCellViewDisclosure"));

    if ((v11 & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[UIButtonAccessibility accessibilityFrame](self, "accessibilityFrame");
      if (__CGSizeEqualToSize(v3, v4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8))
        && (-[UIButtonAccessibility frame](self, "frame"),
            __CGSizeEqualToSize(*MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), v5, v6)))
      {
        return 0;
      }
      else
      {
        v9 = 0;
        if ((-[UIButtonAccessibility isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0)
        {
          -[UIButtonAccessibility alpha](self, "alpha");
          return v7 > 0.0;
        }
        return v9;
      }
    }
  }
  else
  {
    v12 = (id)-[UIButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v15 = objc_msgSend(v12, "BOOLValue") & 1;

  }
  return v15;
}

- (BOOL)_accessibilityIsEmptyShellOfAButton
{
  double v2;
  double v3;
  id v4;
  BOOL v7;

  -[UIButtonAccessibility bounds](self, "bounds");
  if (!__CGSizeEqualToSize(*MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), v2, v3))
    return 0;
  v4 = (id)-[UIButtonAccessibility configuration](self, "configuration");
  v7 = v4 != 0;

  return v7;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return -[UIButtonAccessibility _accessibilityIsEmptyShellOfAButton](self, "_accessibilityIsEmptyShellOfAButton", a2, self);
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return -[UIButtonAccessibility _accessibilityIsEmptyShellOfAButton](self, "_accessibilityIsEmptyShellOfAButton", a2, self);
}

- (CGRect)_accessibilityButtonChildrenCombinedFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id location;
  id v17[2];
  UIButtonAccessibility *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v18 = self;
  v17[1] = (id)a2;
  v17[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ButtonFrameKey-%p"), self);
  location = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v17[0]);
  if (location)
  {
    objc_msgSend(location, "rectValue");
    *(_QWORD *)&v19 = v2;
    *((_QWORD *)&v19 + 1) = v3;
    *(_QWORD *)&v20 = v4;
    *((_QWORD *)&v20 + 1) = v5;
  }
  else
  {
    v14 = (id)-[UIButtonAccessibility subviews](v18, "subviews");
    UIAXFrameForElements();
    *(_QWORD *)&v19 = v6;
    *((_QWORD *)&v19 + 1) = v7;
    *(_QWORD *)&v20 = v8;
    *((_QWORD *)&v20 + 1) = v9;

    v15 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v19, v20);
    objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:");

  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v17, 0);
  v11 = *((double *)&v19 + 1);
  v10 = *(double *)&v19;
  v13 = *((double *)&v20 + 1);
  v12 = *(double *)&v20;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  SEL v7;
  UIButtonAccessibility *v8;
  CGRect result;

  v8 = self;
  v7 = a2;
  if (-[UIButtonAccessibility _accessibilityIsEmptyShellOfAButton](self, "_accessibilityIsEmptyShellOfAButton"))
  {
    -[UIButtonAccessibility _accessibilityButtonChildrenCombinedFrame](v8, "_accessibilityButtonChildrenCombinedFrame");
  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIButtonAccessibility;
    -[UIButtonAccessibility accessibilityFrame](&v6, sel_accessibilityFrame);
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[UIButtonAccessibility _accessibilityButtonChildrenCombinedFrame](self, "_accessibilityButtonChildrenCombinedFrame");
  AX_CGRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  unint64_t v2;
  objc_super v4;
  SEL v5;
  UIButtonAccessibility *v6;

  v6 = self;
  v5 = a2;
  v2 = -[UIButtonAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB100]) != 0
    && (-[UIButtonAccessibility _accessibilityViewIsVisible](v6, "_accessibilityViewIsVisible") & 1) != 0)
  {
    return -[UIButtonAccessibility accessibilityActivate](v6, "accessibilityActivate") & 1;
  }
  v4.receiver = v6;
  v4.super_class = (Class)UIButtonAccessibility;
  return -[UIButtonAccessibility accessibilityPerformEscape](&v4, sel_accessibilityPerformEscape);
}

- (unint64_t)_accessibilityNativeTraits
{
  id v2;
  unint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  CGAffineTransform __dst;
  char v11;
  id v12;
  CGAffineTransform __b;
  id location;
  objc_super v15;
  unint64_t v16;
  SEL v17;
  UIButtonAccessibility *v18;

  v18 = self;
  v17 = a2;
  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)UIButtonAccessibility;
  v16 = -[UIButtonAccessibility accessibilityTraits](&v15, sel_accessibilityTraits);
  location = (id)-[UIButtonAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("currentImage"));
  v7 = (id)objc_msgSend(location, "accessibilityIdentifier");
  v11 = 0;
  v8 = 0;
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("UINavigationBarBackIndicatorDefault")) & 1) != 0)
  {
    v6 = (id)-[UIButtonAccessibility imageView](v18, "imageView");
    v12 = v6;
    v11 = 1;
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(&__b, 0, sizeof(__b));
    memcpy(&__dst, MEMORY[0x24BDBD8B8], sizeof(__dst));
    v8 = CGAffineTransformEqualToTransform(&__b, &__dst);
  }
  if ((v11 & 1) != 0)

  if (v8)
    v16 |= *MEMORY[0x24BEBB100];
  v2 = -[UIButtonAccessibility _accessibilityButtonMacCatalystPopupButtonCell](v18, "_accessibilityButtonMacCatalystPopupButtonCell");
  v5 = v2 == 0;

  if (v5)
  {
    v9 = -[UIButtonAccessibility buttonType](v18, "buttonType");
    if (v9 == 125 || v9 == 124)
      v16 |= *MEMORY[0x24BEBB150];
  }
  else
  {
    v16 |= *MEMORY[0x24BEBB150];
  }
  v4 = v16 | *MEMORY[0x24BDF73B0];
  objc_storeStrong(&location, 0);
  return v4;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v4;
  BOOL v5;
  unint64_t v7;

  v2 = (id)-[UIButtonAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v5 = v2 == 0;

  if (v5)
    return -[UIButtonAccessibility _accessibilityNativeTraits](self, "_accessibilityNativeTraits");
  v4 = (id)-[UIButtonAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v7 = objc_msgSend(v4, "unsignedLongLongValue");

  return v7;
}

- (id)accessibilityPath
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  id v16;
  objc_super v17;
  int v18;
  double v19;
  double v20;
  id v21;
  CGRect rect;
  char v23;
  id v24;
  id v25;
  BOOL v26;
  id v27[2];
  id v29;
  id v30;
  char v31;
  id v32;
  id v33[2];
  UIButtonAccessibility *v34;
  id v35;
  CGRect v36;

  v34 = self;
  v33[1] = (id)a2;
  v33[0] = 0;
  v31 = 0;
  objc_opt_class();
  v16 = (id)-[UIButtonAccessibility currentAttributedTitle](v34, "currentAttributedTitle");
  v30 = (id)__UIAccessibilityCastAsClass();

  v29 = v30;
  objc_storeStrong(&v30, 0);
  v32 = v29;
  v14 = (id)objc_msgSend(v29, "string");
  v15 = objc_msgSend(v14, "length") != 0;

  if (v15)
  {
    if (objc_msgSend(v32, "length"))
    {
      v4 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      v5 = v33[0];
      v33[0] = v4;

      if (!v33[0])
      {
        v6 = (id)objc_msgSend(v32, "string");
        v7 = v33[0];
        v33[0] = v6;

      }
    }
  }
  else
  {
    v2 = (id)-[UIButtonAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("currentTitle"));
    v3 = v33[0];
    v33[0] = v2;

  }
  v27[1] = COERCE_ID(3.0);
  if (!-[UIButtonAccessibility _axButtonTypeIsModernCircle](v34, "_axButtonTypeIsModernCircle")
    || objc_msgSend(v33[0], "length"))
  {
    goto LABEL_19;
  }
  v27[0] = (id)-[UIButtonAccessibility safeUIViewForKey:](v34, "safeUIViewForKey:", CFSTR("_imageView"));
  v26 = 0;
  v13 = 1;
  if (-[UIButtonAccessibility buttonType](v34, "buttonType") != 7)
    v13 = v27[0] == 0;
  v26 = v13;
  v23 = 0;
  if (v13)
  {
    v24 = (id)-[UIButtonAccessibility safeUIViewForKey:](v34, "safeUIViewForKey:", CFSTR("_backgroundView"));
    v23 = 1;
    v8 = v24;
  }
  else
  {
    v8 = v27[0];
  }
  v25 = v8;
  if ((v23 & 1) != 0)

  objc_msgSend(v25, "accessibilityFrame");
  rect = v36;
  if (CGRectIsEmpty(v36))
  {
    v18 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDF6870];
    AX_CGRectGetCenter();
    v19 = v9;
    v20 = v10;
    v21 = (id)objc_msgSend(v12, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v10, rect.size.width / 2.0 + 3.0, 0.0, 6.28318531);
    v35 = v21;
    v18 = 1;
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v27, 0);
  if (!v18)
  {
LABEL_19:
    v17.receiver = v34;
    v17.super_class = (Class)UIButtonAccessibility;
    v35 = -[UIButtonAccessibility accessibilityPath](&v17, sel_accessibilityPath);
    v18 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
  return v35;
}

- (BOOL)_axButtonTypeIsModernCircle
{
  BOOL v3;
  uint64_t v4;

  v4 = -[UIButtonAccessibility buttonType](self, "buttonType");
  v3 = 1;
  if (v4 != 3)
  {
    v3 = 1;
    if (v4 != 4)
    {
      v3 = 1;
      if (v4 != 5)
      {
        v3 = 1;
        if (v4 != 2)
        {
          v3 = 1;
          if (v4 != 7)
          {
            v3 = 1;
            if (v4 != 118)
            {
              v3 = 1;
              if (v4 != 119)
              {
                v3 = 1;
                if (v4 != 120)
                {
                  v3 = 1;
                  if (v4 != 121)
                  {
                    v3 = 1;
                    if (v4 != 122)
                      return v4 == 123;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (id)_accessibilityButtonMacCatalystPopupButtonCell
{
  return 0;
}

@end
