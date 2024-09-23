@implementation MULabeledValueActionViewModel

+ (id)messageItemWithMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  MULabeledValueActionViewModel *v18;
  const __CFString *v19;
  void *v21;

  v3 = a3;
  _MULocalizedStringFromThisBundle(CFSTR("Messages [Placecard]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedResponseTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D271D0];
  objc_msgSend(v3, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_messageLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageBusinessHours");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_messageLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "_geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:", v8, v9, v12);

  if (v13 == 8 || v13 == 4)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Messages Closed [Placecard]"));
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_localizedNextOpeningStringShort:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;

    }
    else
    {
      v17 = v21;
    }

    v4 = (void *)v14;
  }
  else
  {
    v17 = v21;
  }
  v18 = objc_alloc_init(MULabeledValueActionViewModel);
  -[MULabeledValueActionViewModel setTitleString:](v18, "setTitleString:", v4);
  -[MULabeledValueActionViewModel setValueString:](v18, "setValueString:", v17);
  if (MapKitIdiomIsMacCatalyst())
    v19 = CFSTR("message");
  else
    v19 = CFSTR("message.fill");
  -[MULabeledValueActionViewModel setSymbolName:](v18, "setSymbolName:", v19);

  return v18;
}

- (int64_t)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(int64_t)a3
{
  self->_actionVariant = a3;
}

- (NSString)alternativeTitleString
{
  return self->_alternativeTitleString;
}

- (void)setAlternativeTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTitleString, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (int)analyticAction
{
  return self->_analyticAction;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)emphasizeValueString
{
  return self->_emphasizeValueString;
}

- (void)setEmphasizeValueString:(BOOL)a3
{
  self->_emphasizeValueString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_alternativeTitleString, 0);
}

- (id)accessibilityIdentifierForAction
{
  return CFSTR("LabeledValueAction");
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return 0;
}

@end
