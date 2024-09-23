@implementation CCUIAppearanceModule

- (CCUIAppearanceModule)init
{
  CCUIAppearanceModule *v2;
  const char *v3;
  uint64_t v4;
  CCUIAppearanceModule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIAppearanceModule;
  v2 = -[CCUIAppearanceModule init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend__observeArbiterStyleChangeNotifications(v2, v3, v4);
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__unobserveArbiterStyleChangeNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CCUIAppearanceModule;
  -[CCUIAppearanceModule dealloc](&v4, sel_dealloc);
}

- (id)glyphPackageDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BE19B00];
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v2, v7, (uint64_t)CFSTR("StyleMode"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)glyphState
{
  uint64_t v2;

  if (objc_msgSend_appearsSelected(self, a2, v2))
    return CFSTR("light");
  else
    return CFSTR("dark");
}

- (BOOL)isSelected
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_currentStyle(v3, v4, v5);

  return v6 == 2;
}

- (void)setSelected:(BOOL)a3
{
  uint64_t v4;

  if (objc_msgSend_isSelected(self, a2, a3) != a3)
    MEMORY[0x24BEDD108](self, sel__toggleStyleMode, v4);
}

- (void)_observeArbiterStyleChangeNotifications
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__styleModeDidChange, *MEMORY[0x24BDF7FA8], 0);

}

- (void)_unobserveArbiterStyleChangeNotifications
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v4, (uint64_t)self);

}

- (void)_updateState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F9FEC8;
  block[3] = &unk_24FFC9CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_styleModeDidChange
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  id v26;

  objc_msgSend__updateState(self, a2, v2);
  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_currentStyle(v6, v7, v8);

  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextTransition(v12, v13, v14);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__subtitleForUserInterfaceStyle_nextTransition_(self, v15, v9, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isSelected(self, v17, v18))
    v21 = 1;
  else
    v21 = 2;
  objc_msgSend_contentModuleContext(self, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x24BE19B78], v23, (uint64_t)v16, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enqueueStatusUpdate_(v22, v25, (uint64_t)v24);

}

- (void)_toggleStyleMode
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_sharedInstance(MEMORY[0x24BDF6F80], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toggleCurrentStyle(v4, v5, v6);

  objc_msgSend__updateState(self, v7, v8);
}

- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;

  v6 = a4;
  v9 = v6;
  if (v6 && (v10 = objc_msgSend_type(v6, v7, v8), v10 <= 2))
    v11 = *(&off_24FFC9CD0 + v10);
  else
    v11 = CFSTR("_MANUAL");
  if (a3 == 2)
    objc_msgSend_stringByAppendingString_(CFSTR("CONTROL_CENTER_STATUS_STYLE_MODE"), v7, (uint64_t)CFSTR("_DARK"));
  else
    objc_msgSend_stringByAppendingString_(CFSTR("CONTROL_CENTER_STATUS_STYLE_MODE"), v7, (uint64_t)CFSTR("_LIGHT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v12, v13, (uint64_t)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD1488];
  v16 = objc_opt_class();
  objc_msgSend_bundleForClass_(v15, v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v18, v19, (uint64_t)v14, &stru_24FFC9E28, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_type(v9, v21, v22))
  {
    v25 = v20;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = objc_msgSend_hour(v9, v23, v24);
    v29 = objc_msgSend__formattedHourForHour_(self, v28, v27);
    v32 = objc_msgSend_hour(v9, v30, v31);
    v35 = objc_msgSend_minute(v9, v33, v34);
    objc_msgSend__timeStringForHour_minute_(self, v36, v32, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v38, (uint64_t)v20, v29, v37);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;

  v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend_setHour_(v7, v8, a3);
  objc_msgSend_setMinute_(v7, v9, a4);
  objc_msgSend_currentCalendar(MEMORY[0x24BDBCE48], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCalendar_(v7, v13, (uint64_t)v12);

  objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x24BDBCF38], v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v7, v16, (uint64_t)v15);

  objc_msgSend__timeFormatter(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(v7, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v19, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)_formattedHourForHour:(unint64_t)a3
{
  int v4;
  int v5;

  v4 = objc_msgSend__uses24HourTime(self, a2, a3);
  if (a3 < 0xD)
    v5 = 1;
  else
    v5 = v4;
  if (v5)
    return a3;
  else
    return a3 - 12;
}

- (BOOL)_uses24HourTime
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  BOOL v9;

  objc_msgSend__timeFormatter(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateFormat(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_rangeOfString_(v6, v7, (uint64_t)CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend_rangeOfString_(v6, v8, (uint64_t)CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)_timeFormatter
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_setDateStyle_(v2, v3, 0);
  objc_msgSend_setTimeStyle_(v2, v4, 1);
  objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_(v2, v8, (uint64_t)v7);

  objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x24BDBCF38], v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v2, v11, (uint64_t)v10);

  objc_msgSend_currentCalendar(MEMORY[0x24BDBCE48], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCalendar_(v2, v15, (uint64_t)v14);

  return v2;
}

@end
