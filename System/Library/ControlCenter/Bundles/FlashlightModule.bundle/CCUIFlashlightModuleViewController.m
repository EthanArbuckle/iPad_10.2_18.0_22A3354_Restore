@implementation CCUIFlashlightModuleViewController

- (CCUIFlashlightModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIFlashlightModuleViewController *v4;
  uint64_t v5;
  SBUIFlashlightController *flashlight;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIFlashlightModuleViewController;
  v4 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB0EE0], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    flashlight = v4->_flashlight;
    v4->_flashlight = (SBUIFlashlightController *)v5;

    -[SBUIFlashlightController addObserver:](v4->_flashlight, "addObserver:", v4);
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  -[CCUIFlashlightModuleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIFlashlightModuleViewController _updateControls](self, "_updateControls");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  -[CCUIFlashlightModuleViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (!-[SBUIFlashlightController level](self->_flashlight, "level"))
    -[SBUIFlashlightController coolDown](self->_flashlight, "coolDown");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleViewController;
  -[CCUISliderButtonModuleViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CCUIFlashlightModuleViewController sliderView](self, "sliderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSteps:", 5);
  objc_msgSend(v3, "setFirstStepIsOff:", 1);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__sliderValueDidChange_, 4096);
  -[CCUIFlashlightModuleViewController _updateControls](self, "_updateControls");

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIFlashlightModuleViewController;
  -[CCUISliderButtonModuleViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CCUIFlashlightModuleViewController _updateSliderValue](self, "_updateSliderValue");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sliderView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIFlashlightModuleViewController;
  -[CCUISliderButtonModuleViewController sliderView](&v3, sel_sliderView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createSliderView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE19B80]);
  -[CCUIFlashlightModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  return v5;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  _BOOL4 v5;
  SBUIFlashlightController *flashlight;

  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", -[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable", a3, a4) & ~-[CCUIButtonModuleViewController isSelected](self, "isSelected"));
  v5 = -[CCUIButtonModuleViewController isSelected](self, "isSelected");
  flashlight = self->_flashlight;
  if (v5)
    MEMORY[0x24BEDD108](flashlight, sel_turnFlashlightOnForReason_);
  else
    MEMORY[0x24BEDD108](flashlight, sel_turnFlashlightOffForReason_);
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  int v3;

  v3 = -[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable");
  if (v3)
    LOBYTE(v3) = -[SBUIFlashlightController deviceSupportsDynamicFlashlightInterface](self->_flashlight, "deviceSupportsDynamicFlashlightInterface") ^ 1;
  return v3;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  return -[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable");
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[CCUIFlashlightModuleViewController _updateControls](self, "_updateControls");
}

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[CCUIFlashlightModuleViewController _updateControls](self, "_updateControls");
  if ((-[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable") & 1) == 0)
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTouchTracking");

    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
      MEMORY[0x24BEDD108](self, sel_dismissViewControllerAnimated_completion_);
  }
}

- (void)_sliderValueDidChange:(id)a3
{
  SBUIFlashlightController *flashlight;

  flashlight = self->_flashlight;
  objc_msgSend(a3, "step");
  MEMORY[0x24BEDD108](flashlight, sel_setLevel_);
}

- (void)_updateSliderValue
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIFlashlightModuleViewController sliderView](self, "sliderView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (-[CCUIButtonModuleViewController isSelected](self, "isSelected")
      && -[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable"))
    {
      v3 = -[SBUIFlashlightController level](self->_flashlight, "level");
      if ((unint64_t)(v3 - 1) < 4)
        v4 = v3 + 1;
      else
        v4 = 1;
    }
    else
    {
      v4 = 1;
    }
    objc_msgSend(v5, "setStep:", v4);

  }
}

- (void)_updateControls
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[SBUIFlashlightController isAvailable](self->_flashlight, "isAvailable");
  if (-[SBUIFlashlightController level](self->_flashlight, "level"))
    v4 = v3;
  else
    v4 = 0;
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[CCUIFlashlightModuleViewController sliderView](self, "sliderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v4);
  -[CCUIFlashlightModuleViewController _updateSliderValue](self, "_updateSliderValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlight, 0);
}

@end
