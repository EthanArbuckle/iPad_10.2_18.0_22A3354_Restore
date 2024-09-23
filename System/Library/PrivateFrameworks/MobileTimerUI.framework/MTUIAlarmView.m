@implementation MTUIAlarmView

- (MTUIAlarmView)initWithFrame:(CGRect)a3
{
  MTUIAlarmView *v3;
  MTUIAlarmView *v4;
  MTUIDigitalClockLabel *v5;
  MTUIDigitalClockLabel *timeLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *detailLabel;
  uint64_t v13;
  UISwitch *v14;
  UISwitch *enabledSwitch;
  void *v16;
  double v17;
  MTUIAlarmView *v18;
  uint64_t v19;
  id contentSizeFontAdjustObserver;
  _QWORD v22[4];
  MTUIAlarmView *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTUIAlarmView;
  v3 = -[NUIContainerGridView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTUIAlarmView setEdgesPreservingSuperviewLayoutMargins:](v3, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    v5 = objc_alloc_init(MTUIDigitalClockLabel);
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = v5;

    -[MTUIDateLabel dateLabel](v4->_timeLabel, "dateLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(MEMORY[0x24BDF6A70], "mtui_thinTimeFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setFont:](v4->_timeLabel, "setFont:", v8);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDigitalClockLabel setBackgroundColor:](v4->_timeLabel, "setBackgroundColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:", 30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setTimeDesignatorFont:](v4->_timeLabel, "setTimeDesignatorFont:", v10);

    LODWORD(v10) = -[UIView mtui_isRTL](v4, "mtui_isRTL");
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v11;

    if ((_DWORD)v10)
      v13 = 8;
    else
      v13 = 7;
    -[UILabel setContentMode:](v4->_detailLabel, "setContentMode:", v13);
    v14 = (UISwitch *)objc_alloc_init(MEMORY[0x24BDF6E28]);
    enabledSwitch = v4->_enabledSwitch;
    v4->_enabledSwitch = v14;

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_switchTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setTintColor:](v4->_enabledSwitch, "setTintColor:", v16);

    LODWORD(v17) = 1148846080;
    -[UISwitch setLayoutSize:withContentPriority:](v4->_enabledSwitch, "setLayoutSize:withContentPriority:", *MEMORY[0x24BE047D8], *(double *)(MEMORY[0x24BE047D8] + 8), v17);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __31__MTUIAlarmView_initWithFrame___block_invoke;
    v22[3] = &unk_24F014800;
    v18 = v4;
    v23 = v18;
    -[MTUIAlarmView performBatchUpdates:](v18, "performBatchUpdates:", v22);
    -[MTUIAlarmView na_addNotificationBlockObserverForName:object:queue:usingBlock:](v18, "na_addNotificationBlockObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDF7670], 0, 0, &__block_literal_global_2);
    v19 = objc_claimAutoreleasedReturnValue();
    contentSizeFontAdjustObserver = v18->_contentSizeFontAdjustObserver;
    v18->_contentSizeFontAdjustObserver = (id)v19;

  }
  return v4;
}

uint64_t __31__MTUIAlarmView_initWithFrame___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setBaselineRelativeArrangement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setLayoutMargins:", 60.0, 0.0, 17.0, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setBaselineRelativeLayoutMarginsForArrangement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setRowSpacing:", 19.0);
  objc_msgSend(*(id *)(a1 + 32), "setColumnSpacing:", 8.0);
  v2 = *(_QWORD **)(a1 + 32);
  v10[0] = v2[98];
  v10[1] = v2[104];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "addRowWithArrangedSubviews:", v3);

  v5 = *(_QWORD **)(a1 + 32);
  v9[0] = v5[101];
  v9[1] = v5[104];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "addRowWithArrangedSubviews:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setAlignment:forView:inAxis:", 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_loadFontsWithTextStyles");
}

uint64_t __31__MTUIAlarmView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_loadFontsWithTextStyles");
}

- (void)setShouldAddLayoutConstraints:(BOOL)a3
{
  NSObject *v6;

  MTLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MTUIAlarmView setShouldAddLayoutConstraints:].cold.1(a2, v6);

  self->_shouldAddLayoutConstraints = a3;
}

- (void)setSwitchVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[NUIContainerGridView columnAtIndex:](self, "columnAtIndex:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isSwitchVisible
{
  void *v2;
  char v3;

  -[NUIContainerGridView columnAtIndex:](self, "columnAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);
  -[MTUIAlarmView tearDownContentSizeChangeObserver](self, "tearDownContentSizeChangeObserver");
}

- (void)setRepeatFont:(id)a3
{
  objc_storeStrong((id *)&self->_repeatFont, a3);
  -[MTUIAlarmView tearDownContentSizeChangeObserver](self, "tearDownContentSizeChangeObserver");
}

- (void)tearDownContentSizeChangeObserver
{
  id contentSizeFontAdjustObserver;

  if (self->_contentSizeFontAdjustObserver)
  {
    -[MTUIAlarmView na_removeNotificationBlockObserver:](self, "na_removeNotificationBlockObserver:");
    contentSizeFontAdjustObserver = self->_contentSizeFontAdjustObserver;
    self->_contentSizeFontAdjustObserver = 0;

  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MTUIAlarmView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setName:(id)a3 andRepeatText:(id)a4 textColor:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  UIFont *nameFont;
  uint64_t v17;
  void *v18;
  UIFont *repeatFont;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a3;
  -[MTUIAlarmView setName:](self, "setName:", v10);
  -[MTUIAlarmView setRepeatText:](self, "setRepeatText:", v9);
  if (v10)
    v11 = v10;
  else
    v11 = &stru_24F014C90;
  v12 = v11;

  if (v9)
    v13 = v9;
  else
    v13 = &stru_24F014C90;
  v14 = v13;

  nameFont = self->_nameFont;
  v17 = *MEMORY[0x24BDF6600];
  v31[0] = *MEMORY[0x24BDF65F8];
  v15 = v31[0];
  v31[1] = v17;
  v32[0] = nameFont;
  v32[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  repeatFont = self->_repeatFont;
  v29[0] = v15;
  v29[1] = v17;
  v30[0] = repeatFont;
  v30[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  if (-[__CFString length](v21, "length"))
  {
    v22 = v21;
    if (!-[__CFString length](v14, "length"))
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ALARM_DETAIL_FORMAT"), &stru_24F014C90, CFSTR("MobileTimerUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v24, v21, v14);
  }
  else
  {
    v22 = v14;
    v24 = v21;
  }

LABEL_12:
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v22, v18);
  if (-[__CFString length](v14, "length"))
  {
    if (-[UIView mtui_isRTL](self, "mtui_isRTL"))
      v26 = 2;
    else
      v26 = 6;
    v27 = -[__CFString rangeOfString:options:](v22, "rangeOfString:options:", v14, v26);
    if (v28)
      objc_msgSend(v25, "setAttributes:range:", v20, v27, v28);
  }
  -[UILabel setAttributedText:](self->_detailLabel, "setAttributedText:", v25);
  -[MTUIAlarmView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_loadFontsWithTextStyles
{
  UIFont *v3;
  UIFont *nameFont;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BDF7888]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_repeatFont, v3);
  nameFont = self->_nameFont;
  self->_nameFont = v3;

}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTUIAlarmView;
  -[MTUIAlarmView setLayoutMargins:](&v4, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[MTUIAlarmView setBaselineRelativeLayoutMarginsForArrangement:](self, "setBaselineRelativeLayoutMarginsForArrangement:", 0);
}

- (int64_t)style
{
  return self->_style;
}

- (MTUIDigitalClockLabel)timeLabel
{
  return self->_timeLabel;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (NSString)repeatText
{
  return self->_repeatText;
}

- (void)setRepeatText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (UIFont)repeatFont
{
  return self->_repeatFont;
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (NSDictionary)viewsByIdentifier
{
  return self->_viewsByIdentifier;
}

- (BOOL)shouldAddLayoutConstraints
{
  return self->_shouldAddLayoutConstraints;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_viewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_repeatFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_repeatText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong(&self->_contentSizeFontAdjustObserver, 0);
}

- (void)setShouldAddLayoutConstraints:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2279B4000, a2, OS_LOG_TYPE_DEBUG, "%@ is a no-op and should not be used.", (uint8_t *)&v4, 0xCu);

}

@end
