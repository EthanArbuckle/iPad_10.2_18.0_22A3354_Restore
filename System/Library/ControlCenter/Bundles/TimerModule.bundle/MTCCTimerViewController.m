@implementation MTCCTimerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTCCTimerViewController)init
{
  MTCCTimerViewController *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  MTCCTimerViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)MTCCTimerViewController;
  v2 = -[MTCCTimerViewController init](&v5, sel_init);
  if (v2)
  {
    MTLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  MTCCTimerViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocating", buf, 0xCu);
  }

  objc_msgSend_displayLink(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v6, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerViewController;
  -[MTCCTimerViewController dealloc](&v9, sel_dealloc);
}

- (MTCCTimer)timer
{
  return self->_internalTimer;
}

- (void)setTimer:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setTimer_animated_, a3);
}

- (void)setTimer:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  const char *v7;
  uint64_t v8;
  MTCCTimer *v9;
  MTCCTimer *internalTimer;
  const char *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if ((objc_msgSend_isEqual_(self->_internalTimer, v6, (uint64_t)v12) & 1) == 0)
  {
    v9 = (MTCCTimer *)objc_msgSend_copy(v12, v7, v8);
    internalTimer = self->_internalTimer;
    self->_internalTimer = v9;

    objc_msgSend__reloadForCurrentStateAnimated_(self, v11, v4);
  }

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)MTCCTimerViewController;
  -[CCUISliderButtonModuleViewController viewDidLoad](&v35, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)CFSTR("TIMER"), &stru_24FFE6638, CFSTR("TimerModule"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(self, v9, (uint64_t)v8);

  objc_msgSend_setValueText_(self, v10, 0);
  objc_msgSend_setSelectedValueText_(self, v11, 0);
  objc_msgSend__updateGlyphPackageDescription(self, v12, v13);
  v36[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, (uint64_t)v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend_registerForTraitChanges_withAction_(self, v16, (uint64_t)v15, sel__updateGlyphPackageDescription);

  objc_msgSend_sliderView(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberOfSteps_(v20, v21, 12);

  objc_msgSend_sliderView(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v24, v25, (uint64_t)self, sel_sliderDidBeginEditing_, 0x10000);

  objc_msgSend_sliderView(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v28, v29, (uint64_t)self, sel_sliderValueChanged_, 4096);

  objc_msgSend_sliderView(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v32, v33, (uint64_t)self, sel_sliderEditingEnded_, 0x40000);

  objc_msgSend__reloadForCurrentStateAnimated_(self, v34, 0);
}

- (id)sliderView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTCCTimerViewController;
  -[CCUISliderButtonModuleViewController sliderView](&v3, sel_sliderView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createSliderView
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BE19B80]);
  objc_msgSend_view(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v6, v7, v8);
  v11 = (void *)objc_msgSend_initWithFrame_(v3, v9, v10);

  return v11;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  const char *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTCCTimerViewController;
  if (-[CCUIButtonModuleViewController contentRenderingMode](&v7, sel_contentRenderingMode) != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCCTimerViewController;
    -[CCUIButtonModuleViewController setContentRenderingMode:](&v6, sel_setContentRenderingMode_, a3);
    objc_msgSend__reloadForCurrentStateAnimated_(self, v5, 0);
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  MTCCTimerViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  MTLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_23102D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ button tapped, relaying to delegate", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend_delegate(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerViewControllerButtonTapped_withEvent_(v9, v10, (uint64_t)self, v5);

}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerViewController;
  -[CCUISliderButtonModuleViewController willTransitionToExpandedContentMode:](&v9, sel_willTransitionToExpandedContentMode_);
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerViewController_didExpand_(v7, v8, (uint64_t)self, v3);

}

- (void)sliderDidBeginEditing:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  MTCCTimer *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  int v33;
  MTCCTimerViewController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138543362;
    v34 = self;
    _os_log_impl(&dword_23102D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ slider began editing", (uint8_t *)&v33, 0xCu);
  }

  objc_msgSend_stopDisplayLinkUpdates(self, v5, v6);
  objc_msgSend_timer(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [MTCCTimer alloc];
    objc_msgSend_timer(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remainingTime(v16, v17, v18);
    v20 = (void *)objc_msgSend_initWithState_duration_(v13, v19, 1);

    objc_msgSend_timer(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timerLabel(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimerLabel_(v20, v27, (uint64_t)v26);

    objc_msgSend_timer(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEditingTimer_(v20, v31, (uint64_t)v30);

    objc_msgSend_setTimer_(self, v32, (uint64_t)v20);
  }
}

- (void)sliderEditingEnded:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  objc_msgSend_timer(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_editingTimer(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_timer(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setState_(v10, v11, 3);

    objc_msgSend_delegate(self, v12, v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timer(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timerViewController_timerDidChange_(v18, v17, (uint64_t)self, v16);

  }
}

- (void)sliderValueChanged:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint8_t buf[4];
  MTCCTimerViewController *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_step(a3, a2, (uint64_t)a3);
  v5 = v4;
  if (v4 >= 0xD)
    NSLog(CFSTR("Unexpected step value: %lu"), v4);
  if (v5 >= 0xC)
    v6 = 12;
  else
    v6 = v5;
  MTLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2050;
    v29 = v6;
    _os_log_impl(&dword_23102D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ slider value changed to step: %{public}lu", buf, 0x16u);
  }

  v8 = (double)qword_231035B98[v6] * 60.0;
  objc_msgSend_timer(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v11, v12, v13, v8);

  objc_msgSend_timer(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemainingTime_(v16, v17, v18, v8);

  objc_msgSend_delegate(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timer(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerViewController_timerDidChange_(v21, v25, (uint64_t)self, v24);

}

- (void)_updateGlyphPackageDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;

  objc_msgSend_traitCollection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_accessibilityContrast(v4, v5, v6);
  v8 = CFSTR("Timer");
  if (v7 == 1)
    v8 = CFSTR("Timer_IC");
  v9 = v8;

  v10 = (void *)MEMORY[0x24BE19B00];
  v11 = (void *)MEMORY[0x24BDD1488];
  v12 = objc_opt_class();
  objc_msgSend_bundleForClass_(v11, v13, v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v10, v14, (uint64_t)v9, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setGlyphPackageDescription_(self, v16, (uint64_t)v15);
}

- (void)_reloadForCurrentStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  _QWORD v35[6];
  BOOL v36;
  char v37;

  v3 = a3;
  objc_msgSend_timer(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_state(v5, v6, v7);

  switch(v8)
  {
    case 3:
      objc_msgSend_timer(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fireDate(v11, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v17, v18, v19);
      v21 = v20;

      v22 = 1;
LABEL_8:

      goto LABEL_10;
    case 2:
      objc_msgSend_timer(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remainingTime(v11, v23, v24);
      goto LABEL_7;
    case 1:
      objc_msgSend_timer(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_duration(v11, v12, v13);
LABEL_7:
      v21 = v14;
      v22 = 0;
      goto LABEL_8;
  }
  v22 = 0;
  v21 = 0;
LABEL_10:
  objc_msgSend_setSelected_(self, v9, v22);
  v27 = objc_msgSend_appearsSelected(self, v25, v26);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_231034DCC;
  v35[3] = &unk_24FFE64F8;
  v35[4] = self;
  v35[5] = v21;
  v36 = v3;
  v37 = v27;
  v28 = MEMORY[0x2348CE784](v35);
  v30 = (void *)v28;
  if (v3)
    objc_msgSend_animateWithDuration_animations_(MEMORY[0x24BDF6F90], v29, v28, 0.25);
  else
    (*(void (**)(uint64_t))(v28 + 16))(v28);
  objc_msgSend_stopDisplayLinkUpdates(self, v31, v32);
  if (v27)
    objc_msgSend_startDisplayLinkUpdates(self, v33, v34);

}

- (void)startDisplayLinkUpdates
{
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  objc_msgSend_displayLinkWithTarget_selector_(MEMORY[0x24BDE5670], a2, (uint64_t)self, sel_displayLinkTick_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayLink_(self, v4, (uint64_t)v3);

  objc_msgSend_displayLink(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredFramesPerSecond_(v7, v8, 4);

  objc_msgSend_displayLink(self, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addToRunLoop_forMode_(v15, v14, (uint64_t)v13, *MEMORY[0x24BDBCB80]);

}

- (void)stopDisplayLinkUpdates
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_displayLink(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v4, v5, v6);

  objc_msgSend_setDisplayLink_(self, v7, 0);
}

- (void)displayLinkTick:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  id v18;

  objc_msgSend_timer(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fireDate(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v7, v8, v9);
  v11 = v10;

  objc_msgSend_sliderView(self, v12, v13);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderValueFromRemainingTime_(self, v14, v15, v11);
  *(float *)&v16 = v16;
  objc_msgSend_setValue_animated_(v18, v17, 0, v16);

}

- (double)sliderValueFromRemainingTime:(double)a3
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  float64x2_t v6;

  v3 = 0;
  v4 = round(a3);
  while ((double)qword_231035B98[v3] * 60.0 < v4)
  {
    if (++v3 == 13)
      goto LABEL_6;
  }
  if (!v3)
    return 0.0;
LABEL_6:
  if (v3 >= 0xC)
    v3 = 12;
  v5 = v3 - 1;
  v6 = vmulq_f64(vcvtq_f64_u64(*(uint64x2_t *)&qword_231035B98[v5]), (float64x2_t)vdupq_n_s64(0x404E000000000000uLL));
  return ((v4 - v6.f64[0]) / vsubq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1), v6).f64[0] + (double)v5) / 12.0;
}

- (MTCCTimerViewControllerDelegate)delegate
{
  return (MTCCTimerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTCCTimer)internalTimer
{
  return self->_internalTimer;
}

- (void)setInternalTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_internalTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
