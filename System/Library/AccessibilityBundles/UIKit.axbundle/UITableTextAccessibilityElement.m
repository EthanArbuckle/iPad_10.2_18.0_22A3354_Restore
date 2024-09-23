@implementation UITableTextAccessibilityElement

- (id)_tableViewCellTextDelegate
{
  id v2;
  id v3;
  char isKindOfClass;
  id v6;

  if (!a1)
    return 0;
  v3 = -[UITableTextAccessibilityElement textDelegate](a1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return -[UITableTextAccessibilityElement textDelegate](a1);
  v2 = -[UITableTextAccessibilityElement textDelegate](a1);
  v6 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("tableViewCell"));

  return v6;
}

- (id)textDelegate
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 64));
  else
    return 0;
}

- (BOOL)_accessibilityElementServesAsHeadingLandmark
{
  id v3;
  char v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityElementServesAsHeadingLandmark");

  return v4 & 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2;

  v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityElementDidBecomeFocused");

}

- (id)_accessibilityCustomActionGroupIdentifier
{
  id v3;
  id v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "_accessibilityCustomActionGroupIdentifier");

  return v4;
}

- (id)_accessibilityScrollStatus
{
  id v3;
  id v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "_accessibilityScrollStatus");

  return v4;
}

- (void)accessibilityElementDidLoseFocus
{
  id v2;

  v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityElementDidLoseFocus");

}

- (id)_tableViewCellAttributeDelegate
{
  id v2;
  id v3;
  char isKindOfClass;
  id v6;

  if (!a1)
    return 0;
  v3 = -[UITableTextAccessibilityElement attributeDelegate](a1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return -[UITableTextAccessibilityElement attributeDelegate](a1);
  v2 = -[UITableTextAccessibilityElement attributeDelegate](a1);
  v6 = (id)objc_msgSend(v2, "tableViewCell");

  return v6;
}

- (id)attributeDelegate
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 72));
  else
    return 0;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  id v3;
  id v4[2];
  UITableTextAccessibilityElement *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (!v4[0])
  {
    v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v5);

  }
  v3 = (id)objc_msgSend(v4[0], "_accessibilityTextViewTextOperationResponder");
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)accessibilityLabel
{
  objc_super v3;
  id location[2];
  UITableTextAccessibilityElement *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    v6 = (id)objc_msgSend(location[0], "tableTextAccessibleLabel:", v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v6 = -[UITableTextAccessibilityElement accessibilityLabel](&v3, sel_accessibilityLabel);
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
    v4 = objc_msgSend(location[0], "_accessibilityUseElementAtPositionAfterActivation") & 1;
  else
    v4 = 1;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)accessibilityValue
{
  objc_super v3;
  int v4;
  id location[2];
  UITableTextAccessibilityElement *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "accessibilityValue");
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement accessibilityValue](&v3, sel_accessibilityValue);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)accessibilityHint
{
  objc_super v3;
  int v4;
  id location[2];
  UITableTextAccessibilityElement *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "accessibilityHint");
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement accessibilityHint](&v3, sel_accessibilityHint);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)accessibilityIdentifier
{
  objc_super v3;
  int v4;
  id location[2];
  UITableTextAccessibilityElement *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "accessibilityIdentifier");
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement accessibilityIdentifier](&v3, sel_accessibilityIdentifier);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  int v15;
  objc_super v16;
  id location[2];
  UITableTextAccessibilityElement *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v18 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(location[0], "tableTextAccessibleFrame:", v18);
    }
    else
    {
      v14.receiver = v18;
      v14.super_class = (Class)UITableTextAccessibilityElement;
      -[UITableTextAccessibilityElement accessibilityFrame](&v14, sel_accessibilityFrame);
    }
    v19 = v6;
    v20 = v7;
    v21 = v8;
    v22 = v9;
    v15 = 1;
  }
  else
  {
    v16.receiver = v18;
    v16.super_class = (Class)UITableTextAccessibilityElement;
    -[UITableTextAccessibilityElement accessibilityFrame](&v16, sel_accessibilityFrame);
    v19 = v2;
    v20 = v3;
    v21 = v4;
    v22 = v5;
    v15 = 1;
  }
  objc_storeStrong(location, 0);
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)accessibilityLocalizedStringKey
{
  objc_super v3;
  id location[2];
  UITableTextAccessibilityElement *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    v6 = (id)objc_msgSend(location[0], "tableTextAccessibleStringKey:", v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v6 = -[UITableTextAccessibilityElement accessibilityLocalizedStringKey](&v3, sel_accessibilityLocalizedStringKey);
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)accessibilityLocalizationBundleID
{
  objc_super v3;
  id location[2];
  UITableTextAccessibilityElement *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    v6 = (id)objc_msgSend(location[0], "tableTextAccessibleLocalizationBundleID:", v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v6 = -[UITableTextAccessibilityElement accessibilityLocalizationBundleID](&v3, sel_accessibilityLocalizationBundleID);
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)accessibilityLocalizationBundlePath
{
  objc_super v3;
  id location[2];
  UITableTextAccessibilityElement *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    v6 = (id)objc_msgSend(location[0], "tableTextAccessibleLocalizationBundlePath:", v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v6 = -[UITableTextAccessibilityElement accessibilityLocalizationBundlePath](&v3, sel_accessibilityLocalizationBundlePath);
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)accessibilityLocalizedStringTableName
{
  objc_super v3;
  id location[2];
  UITableTextAccessibilityElement *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location[0])
  {
    v6 = (id)objc_msgSend(location[0], "tableTextAccessibleLocalizedTableName:", v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v6 = -[UITableTextAccessibilityElement accessibilityLocalizedStringTableName](&v3, sel_accessibilityLocalizedStringTableName);
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)accessibilityLanguage
{
  objc_super v3;
  int v4;
  id location[2];
  UITableTextAccessibilityElement *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "accessibilityLanguage");
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement accessibilityLanguage](&v3, sel_accessibilityLanguage);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  int v7;
  id location[2];
  UITableTextAccessibilityElement *v9;
  double v10;
  double v11;
  CGPoint result;

  v9 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    objc_msgSend(location[0], "accessibilityActivationPoint");
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)UITableTextAccessibilityElement;
    -[UITableTextAccessibilityElement accessibilityActivationPoint](&v6, sel_accessibilityActivationPoint);
  }
  v10 = v2;
  v11 = v3;
  v7 = 1;
  objc_storeStrong(location, 0);
  v4 = v10;
  v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
}

- (unint64_t)accessibilityTraits
{
  id location;
  objc_super v4;
  uint64_t v5;
  SEL v6;
  UITableTextAccessibilityElement *v7;
  unint64_t v8;
  CGRect v9;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UITableTextAccessibilityElement;
  v5 = -[UITableTextAccessibilityElement accessibilityTraits](&v4, sel_accessibilityTraits);
  location = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)v7);
  if (location)
  {
    v5 = objc_msgSend(location, "accessibilityTraits");
    v5 |= *MEMORY[0x24BDF7410];
    v8 = v5;
  }
  else
  {
    -[UITableTextAccessibilityElement accessibilityFrame](v7, "accessibilityFrame");
    if (CGRectGetHeight(v9) == 0.0)
      v5 |= *MEMORY[0x24BEBB178];
    v8 = v5;
  }
  objc_storeStrong(&location, 0);
  return v8;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  unint64_t v2;

  v2 = -[UITableTextAccessibilityElement accessibilityTraits](self, "accessibilityTraits");
  return (v2 & *MEMORY[0x24BEBB178]) != *MEMORY[0x24BEBB178];
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  id v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v6 = objc_msgSend(v5, "accessibilityRowRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  id v3;
  char v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityImplementsDefaultRowRange");

  return v4 & 1;
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  id v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v6 = objc_msgSend(v5, "_accessibilityIndexPathAsRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v3 = objc_msgSend(v4[0], "_accessibilityRetainsCustomRotorActionSetting");
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v3 = objc_msgSend(v4[0], "_accessibilitySupportsActivateAction");
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)accessibilityActivate
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v3 = objc_msgSend(v4[0], "accessibilityActivate");
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  double v2;
  id v4;
  double v5;

  v4 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v4, "_accessibilityDelayBeforeUpdatingOnActivation");
  v5 = v2;

  return v5;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);

}

- (BOOL)_accessibilityIsAwayAlertElement
{
  id v3;
  char v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityIsAwayAlertElement");

  return v4 & 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  id v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v6 = objc_msgSend(v5, "_accessibilitySelectedTextRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)_accessibilityEquivalenceTag
{
  id v3;
  id v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "_accessibilityEquivalenceTag");

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  id v3;
  char v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityIsSpeakThisElement");

  return v4 & 1;
}

- (void)_accessibilityGetBlockForAttribute:(int64_t)a3
{
  id v4;
  objc_super v5;
  int64_t v6;
  SEL v7;
  UITableTextAccessibilityElement *v8;
  void *v9;

  v8 = self;
  v7 = a2;
  v6 = a3;
  if (a3 == 5)
  {
    v4 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v8);
    v9 = (void *)objc_msgSend(v4, "_accessibilityGetBlockForAttribute:", 5);

  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)UITableTextAccessibilityElement;
    return -[UITableTextAccessibilityElement _accessibilityGetBlockForAttribute:](&v5, sel__accessibilityGetBlockForAttribute_, v6);
  }
  return v9;
}

- (id)_accessibilitySpeakThisString
{
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  objc_super v11;
  Method InstanceMethod;
  id location;
  id v14[2];
  UITableTextAccessibilityElement *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  if (!_accessibilitySpeakThisString_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilitySpeakThisString_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, (SEL)0x1F4063819);
    v3 = (objc_class *)objc_opt_class();
    _accessibilitySpeakThisString_BaseUIResponderMethod = (uint64_t)class_getInstanceMethod(v3, (SEL)0x1F4063819);
  }
  location = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)v15);
  if (location)
  {
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel__accessibilitySpeakThisString);
    if (InstanceMethod != (Method)_accessibilitySpeakThisString_BaseNSObjectMethod
      && InstanceMethod != (Method)_accessibilitySpeakThisString_BaseUIResponderMethod)
    {
      v5 = (id)objc_msgSend(location, "_accessibilitySpeakThisString");
      v6 = v14[0];
      v14[0] = v5;

    }
  }
  if (!v14[0])
  {
    v11.receiver = v15;
    v11.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement _accessibilitySpeakThisString](&v11, sel__accessibilitySpeakThisString);
    v8 = v14[0];
    v14[0] = v7;

  }
  v10 = v14[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
  return v10;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  id v3;
  int64_t v4;

  v3 = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityScannerActivateBehavior");

  return v4;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 8;
}

- (id)accessibilityUserInputLabels
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  objc_super v11;
  id location;
  id v13[2];
  UITableTextAccessibilityElement *v14;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  location = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  if (location)
  {
    v4 = (id)objc_msgSend(location, "accessibilityUserInputLabels");
    v5 = v13[0];
    v13[0] = v4;

    if (!objc_msgSend(v13[0], "count"))
    {
      v10 = (id)objc_msgSend(location, "tableTextAccessibleLabel:", v14);
      v6 = (id)MEMORY[0x2348C3560]();
      v7 = v13[0];
      v13[0] = v6;

    }
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)UITableTextAccessibilityElement;
    v2 = -[UITableTextAccessibilityElement accessibilityUserInputLabels](&v11, sel_accessibilityUserInputLabels);
    v3 = v13[0];
    v13[0] = v2;

  }
  v9 = v13[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v9;
}

- (void)accessibilityDecrement
{
  id v2;

  v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  v2 = -[UITableTextAccessibilityElement _tableViewCellTextDelegate]((uint64_t)self);
  objc_msgSend(v2, "accessibilityIncrement");

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  UITableTextAccessibilityElement *v9;

  v9 = self;
  v8 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)UITableTextAccessibilityElement;
  v5 = -[UITableTextAccessibilityElement description](&v7, sel_description);
  v4 = (id)-[UITableTextAccessibilityElement accessibilityContainer](v9, "accessibilityContainer");
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ < %@"), v5, v4);

  return v6;
}

- (id)_accessibilityAllDragSourceDescriptors
{
  id v3;
  id v4;

  v3 = -[UITableTextAccessibilityElement textDelegate]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "accessibilityDragSourceDescriptors");

  return v4;
}

- (id)_accessibilityAllDropPointDescriptors
{
  id v3;
  id v4;

  v3 = -[UITableTextAccessibilityElement textDelegate]((uint64_t)self);
  v4 = (id)objc_msgSend(v3, "accessibilityDropPointDescriptors");

  return v4;
}

- (id)_accessibilityCapturedImages
{
  objc_super v3;
  int v4;
  id location[2];
  UITableTextAccessibilityElement *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableTextAccessibilityElement _tableViewCellAttributeDelegate]((uint64_t)self);
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "_accessibilityCapturedImages");
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableTextAccessibilityElement;
    v7 = -[UITableTextAccessibilityElement _accessibilityCapturedImages](&v3, sel__accessibilityCapturedImages);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)setTextDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 8, a2);
  return result;
}

- (id)setAttributeDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 9, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->attributeDelegate);
  objc_destroyWeak(&self->textDelegate);
}

@end
