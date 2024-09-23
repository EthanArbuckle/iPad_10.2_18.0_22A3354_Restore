@implementation HKDisplayTypeContextItem

- (HKDisplayTypeContextItem)init
{
  HKDisplayTypeContextItem *v2;
  HKDisplayTypeContextItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeContextItem;
  v2 = -[HKDisplayTypeContextItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HKDisplayTypeContextItem setInfoHidden:](v2, "setInfoHidden:", 1);
    -[HKDisplayTypeContextItem setUserInteractive:](v3, "setUserInteractive:", 1);
    -[HKDisplayTypeContextItem setUnit:](v3, "setUnit:", 0);
    -[HKDisplayTypeContextItem setValue:](v3, "setValue:", 0);
    -[HKDisplayTypeContextItem setValueContext:](v3, "setValueContext:", 0);
    -[HKDisplayTypeContextItem setAttributedLabelTextOverride:](v3, "setAttributedLabelTextOverride:", 0);
  }
  return v3;
}

- (BOOL)hasTitleAccessory
{
  return self->_titleAccessory && self->_selectedTitleAccessory != 0;
}

- (BOOL)isEqual:(id)a3
{
  HKDisplayTypeContextItem *v4;
  BOOL v5;

  v4 = (HKDisplayTypeContextItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKDisplayTypeContextItem isEqualToContextItem:](self, "isEqualToContextItem:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL8 useTightSpacingBetweenValueAndUnit;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[HKDisplayTypeContextItemTitleAccessory hash](self->_titleAccessory, "hash") ^ v3;
  v5 = v4 ^ -[HKDisplayTypeContextItemTitleAccessory hash](self->_selectedTitleAccessory, "hash") ^ self->_infoHidden;
  useTightSpacingBetweenValueAndUnit = self->_useTightSpacingBetweenValueAndUnit;
  v7 = useTightSpacingBetweenValueAndUnit ^ -[NSString hash](self->_value, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_valueContext, "hash");
  v9 = -[HKDisplayTypeContextItemAttributedLabelOverride hash](self->_attributedLabelTextOverride, "hash");
  v10 = v9 ^ -[NSString hash](self->_unit, "hash");
  v11 = v10 ^ -[NSString hash](self->_dateString, "hash");
  return v8 ^ v11 ^ -[NSString hash](self->_analyticsIdentifier, "hash");
}

- (BOOL)isEqualToContextItem:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (v4
    && ((v6 = *((_QWORD *)v4 + 2), !(v6 | (unint64_t)self->_title))
     || objc_msgSend((id)v6, "isEqualToString:"))
    && (HKDisplayTypeContextItemTitleAccessory *)*((_QWORD *)v5 + 3) == self->_titleAccessory
    && (HKDisplayTypeContextItemTitleAccessory *)*((_QWORD *)v5 + 4) == self->_selectedTitleAccessory
    && v5[8] == self->_infoHidden
    && v5[9] == self->_useTightSpacingBetweenValueAndUnit
    && v5[10] == self->_isUnitIncludedInValue
    && v5[11] == self->_userInteractive
    && ((v7 = *((_QWORD *)v5 + 6), !(v7 | (unint64_t)self->_value))
     || objc_msgSend((id)v7, "isEqualToString:"))
    && ((v8 = *((_QWORD *)v5 + 7), !(v8 | (unint64_t)self->_valueContext))
     || objc_msgSend((id)v8, "isEqualToString:"))
    && objc_msgSend(*((id *)v5 + 8), "isEqual:", self->_attributedLabelTextOverride)
    && ((v9 = *((_QWORD *)v5 + 5), !(v9 | (unint64_t)self->_unit))
     || objc_msgSend((id)v9, "isEqualToString:"))
    && ((v10 = *((_QWORD *)v5 + 9), !(v10 | (unint64_t)self->_dateString))
     || objc_msgSend((id)v10, "isEqualToString:")))
  {
    v11 = *((_QWORD *)v5 + 10);
    if (v11 | (unint64_t)self->_analyticsIdentifier)
      v12 = objc_msgSend((id)v11, "isEqualToString:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKDisplayTypeContextItem;
  -[HKDisplayTypeContextItem debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ %@ %@ (%@) %@"), v4, self->_title, self->_value, self->_unit, self->_valueContext, self->_attributedLabelTextOverride);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKDisplayTypeContextItemTitleAccessory)titleAccessory
{
  return self->_titleAccessory;
}

- (void)setTitleAccessory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HKDisplayTypeContextItemTitleAccessory)selectedTitleAccessory
{
  return self->_selectedTitleAccessory;
}

- (void)setSelectedTitleAccessory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)infoHidden
{
  return self->_infoHidden;
}

- (void)setInfoHidden:(BOOL)a3
{
  self->_infoHidden = a3;
}

- (BOOL)useTightSpacingBetweenValueAndUnit
{
  return self->_useTightSpacingBetweenValueAndUnit;
}

- (void)setUseTightSpacingBetweenValueAndUnit:(BOOL)a3
{
  self->_useTightSpacingBetweenValueAndUnit = a3;
}

- (BOOL)isUnitIncludedInValue
{
  return self->_isUnitIncludedInValue;
}

- (void)setIsUnitIncludedInValue:(BOOL)a3
{
  self->_isUnitIncludedInValue = a3;
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)valueContext
{
  return self->_valueContext;
}

- (void)setValueContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelTextOverride
{
  return self->_attributedLabelTextOverride;
}

- (void)setAttributedLabelTextOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (void)setMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_metricColors, a3);
}

- (HKUIMetricColors)selectedMetricColors
{
  return self->_selectedMetricColors;
}

- (void)setSelectedMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMetricColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMetricColors, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_attributedLabelTextOverride, 0);
  objc_storeStrong((id *)&self->_valueContext, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_selectedTitleAccessory, 0);
  objc_storeStrong((id *)&self->_titleAccessory, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
