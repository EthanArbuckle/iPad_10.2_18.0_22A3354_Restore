@implementation MessageListCellLayoutValuesHelper

- (void)updateTintColorFromView:(id)a3
{
  id v4;

  objc_msgSend(a3, "tintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageListCellLayoutValuesHelper setTintColor:](self, "setTintColor:", v4);

}

- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v7;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v7 = self->_systemLayoutMargins.top;
  if (self->_systemLayoutMargins.leading != a3.leading
    || v7 != top
    || self->_systemLayoutMargins.trailing != a3.trailing
    || self->_systemLayoutMargins.bottom != a3.bottom)
  {
    self->_systemLayoutMargins.top = top;
    self->_systemLayoutMargins.leading = a3.leading;
    self->_systemLayoutMargins.bottom = a3.bottom;
    self->_systemLayoutMargins.trailing = a3.trailing;
    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSystemLayoutMargins:", top, leading, bottom, trailing);

  }
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITraitCollection *v13;

  v13 = (UITraitCollection *)a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCellLayoutValues.m"), 179, CFSTR("Current thread must be main"));

  }
  v6 = v13;
  if (self->_traitCollection != v13)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTraitCollection:", v13);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTraitCollection:", v13);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTraitCollection:", v13);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTraitCollection:", v13);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTraitCollection:", v13);

    v6 = v13;
  }

}

- (MessageListCellLayoutValuesHelper)init
{
  MessageListCellLayoutValuesHelper *v2;
  MessageListCellLayoutValues *v3;
  MessageListCellLayoutValues *defaultLayoutValues;
  MessageListCellLayoutValues *v5;
  MessageListCellLayoutValues *expandedLayoutValues;
  MessageListCellLayoutValues *v7;
  MessageListCellLayoutValues *topHitsLayoutValues;
  MessageListCellLayoutValues *v9;
  MessageListCellLayoutValues *senderSpecificLayoutValues;
  MessageListCellLayoutValues *v11;
  MessageListCellLayoutValues *groupedSenderBundleLayoutValues;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MessageListCellLayoutValuesHelper;
  v2 = -[MessageListCellLayoutValuesHelper init](&v15, sel_init);
  if (v2)
  {
    v3 = -[MessageListCellLayoutValues _init]([_DefaultMessageListCellLayoutValues alloc], "_init");
    defaultLayoutValues = v2->_defaultLayoutValues;
    v2->_defaultLayoutValues = v3;

    v5 = -[MessageListCellLayoutValues _init]([_ExpandedMessageListCellLayoutValues alloc], "_init");
    expandedLayoutValues = v2->_expandedLayoutValues;
    v2->_expandedLayoutValues = v5;

    v7 = -[MessageListCellLayoutValues _init]([_TopHitsMessageListCellLayoutValues alloc], "_init");
    topHitsLayoutValues = v2->_topHitsLayoutValues;
    v2->_topHitsLayoutValues = v7;

    v9 = -[MessageListCellLayoutValues _init]([_SenderSpecificMessageListCellLayoutValues alloc], "_init");
    senderSpecificLayoutValues = v2->_senderSpecificLayoutValues;
    v2->_senderSpecificLayoutValues = v9;

    v11 = -[MessageListCellLayoutValues _init]([_GroupedSenderBundleMessageListCellLayoutValues alloc], "_init");
    groupedSenderBundleLayoutValues = v2->_groupedSenderBundleLayoutValues;
    v2->_groupedSenderBundleLayoutValues = v11;

    objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListCellLayoutValuesHelper setDefaultBackgroundConfiguration:](v2, "setDefaultBackgroundConfiguration:", v13);

  }
  return v2;
}

- (void)setTintColor:(id)a3
{
  UIColor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIColor *v13;

  v13 = (UIColor *)a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCellLayoutValues.m"), 181, CFSTR("Current thread must be main"));

  }
  v6 = v13;
  if (self->_tintColor != v13)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v13);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v13);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v13);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v13);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v13);

    v6 = v13;
  }

}

- (void)setDefaultBackgroundConfiguration:(id)a3
{
  UIBackgroundConfiguration *v4;
  UIBackgroundConfiguration *defaultBackgroundConfiguration;
  UIBackgroundConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_defaultBackgroundConfiguration != a3)
  {
    v4 = (UIBackgroundConfiguration *)objc_msgSend(a3, "copy");
    defaultBackgroundConfiguration = self->_defaultBackgroundConfiguration;
    self->_defaultBackgroundConfiguration = v4;
    v6 = v4;

    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultBackgroundConfiguration:", v6);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDefaultBackgroundConfiguration:", v6);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultBackgroundConfiguration:", v6);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDefaultBackgroundConfiguration:", v6);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDefaultBackgroundConfiguration:", v6);

  }
}

- (id)layoutValuesForStyle:(int64_t)a3
{
  void *v3;

  if (a3 == 3)
  {
    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 2)
      -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    else
      -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (MessageListCellLayoutValues)defaultLayoutValues
{
  return self->_defaultLayoutValues;
}

- (MessageListCellLayoutValues)topHitsLayoutValues
{
  return self->_topHitsLayoutValues;
}

- (MessageListCellLayoutValues)expandedLayoutValues
{
  return self->_expandedLayoutValues;
}

- (double)dynamicRowHeightWithSummary:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "actualLineCountForSummary:bounds:", v9, x, y, width, height);

  objc_msgSend(v10, "heightWithNumberOfSummaryLines:", v11);
  v13 = v12;

  return v13;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_invalidateAndNotify:", 1);

  -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_invalidateAndNotify:", 1);

  -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidateAndNotify:", 1);

  -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_invalidateAndNotify:", 1);

  -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_invalidateAndNotify:", 1);

}

- (void)setSupportsPopover:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCellLayoutValues.m"), 180, CFSTR("Current thread must be main"));

  }
  if (self->_supportsPopover != v3)
  {
    self->_supportsPopover = v3;
    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSupportsPopover:", v3);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSupportsPopover:", v3);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupportsPopover:", v3);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportsPopover:", v3);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSupportsPopover:", v3);

  }
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  return (UIBackgroundConfiguration *)(id)-[UIBackgroundConfiguration copy](self->_defaultBackgroundConfiguration, "copy");
}

- (void)setInMultiSelectionMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_inMultiSelectionMode != a3)
  {
    v3 = a3;
    self->_inMultiSelectionMode = a3;
    -[MessageListCellLayoutValuesHelper defaultLayoutValues](self, "defaultLayoutValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInMultiSelectionMode:", v3);

    -[MessageListCellLayoutValuesHelper expandedLayoutValues](self, "expandedLayoutValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInMultiSelectionMode:", v3);

    -[MessageListCellLayoutValuesHelper topHitsLayoutValues](self, "topHitsLayoutValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInMultiSelectionMode:", v3);

    -[MessageListCellLayoutValuesHelper senderSpecificLayoutValues](self, "senderSpecificLayoutValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInMultiSelectionMode:", v3);

    -[MessageListCellLayoutValuesHelper groupedSenderBundleLayoutValues](self, "groupedSenderBundleLayoutValues");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInMultiSelectionMode:", v3);

  }
}

- (void)setDefaultLayoutValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayoutValues, a3);
}

- (void)setExpandedLayoutValues:(id)a3
{
  objc_storeStrong((id *)&self->_expandedLayoutValues, a3);
}

- (void)setTopHitsLayoutValues:(id)a3
{
  objc_storeStrong((id *)&self->_topHitsLayoutValues, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)supportsPopover
{
  return self->_supportsPopover;
}

- (NSDirectionalEdgeInsets)systemLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_systemLayoutMargins.top;
  leading = self->_systemLayoutMargins.leading;
  bottom = self->_systemLayoutMargins.bottom;
  trailing = self->_systemLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)inMultiSelectionMode
{
  return self->_inMultiSelectionMode;
}

- (MessageListCellLayoutValues)senderSpecificLayoutValues
{
  return self->_senderSpecificLayoutValues;
}

- (void)setSenderSpecificLayoutValues:(id)a3
{
  objc_storeStrong((id *)&self->_senderSpecificLayoutValues, a3);
}

- (MessageListCellLayoutValues)groupedSenderBundleLayoutValues
{
  return self->_groupedSenderBundleLayoutValues;
}

- (void)setGroupedSenderBundleLayoutValues:(id)a3
{
  objc_storeStrong((id *)&self->_groupedSenderBundleLayoutValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedSenderBundleLayoutValues, 0);
  objc_storeStrong((id *)&self->_senderSpecificLayoutValues, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_topHitsLayoutValues, 0);
  objc_storeStrong((id *)&self->_expandedLayoutValues, 0);
  objc_storeStrong((id *)&self->_defaultLayoutValues, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
}

@end
