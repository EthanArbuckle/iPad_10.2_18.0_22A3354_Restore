@implementation SFReaderTextSizeStepperController

- (SFReaderTextSizeStepperController)initWithReaderContext:(id)a3
{
  id v5;
  SFReaderTextSizeStepperController *v6;
  SFReaderTextSizeStepperController *v7;
  SFReaderTextSizeStepperController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFReaderTextSizeStepperController;
  v6 = -[SFReaderTextSizeStepperController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readerContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)prepareStepper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v7 = a3;
  objc_msgSend(v4, "systemImageNamed:", CFSTR("textformat.size.smaller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forButton:", v5, 1);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.size.larger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forButton:", v6, 0);

  -[SFReaderTextSizeStepperController _updateStepperControls:](self, "_updateStepperControls:", v7);
}

- (void)incrementValue:(id)a3
{
  SFReaderContext *readerContext;
  id v5;

  readerContext = self->_readerContext;
  v5 = a3;
  -[SFReaderContext increaseReaderTextSize](readerContext, "increaseReaderTextSize");
  -[SFReaderTextSizeStepperController _updateStepperControls:](self, "_updateStepperControls:", v5);

}

- (void)decrementValue:(id)a3
{
  SFReaderContext *readerContext;
  id v5;

  readerContext = self->_readerContext;
  v5 = a3;
  -[SFReaderContext decreaseReaderTextSize](readerContext, "decreaseReaderTextSize");
  -[SFReaderTextSizeStepperController _updateStepperControls:](self, "_updateStepperControls:", v5);

}

- (void)_updateStepperControls:(id)a3
{
  SFReaderContext *readerContext;
  id v5;

  readerContext = self->_readerContext;
  v5 = a3;
  objc_msgSend(v5, "setEnabled:forButton:", -[SFReaderContext canDecreaseReaderTextSize](readerContext, "canDecreaseReaderTextSize"), 1);
  objc_msgSend(v5, "setEnabled:forButton:", -[SFReaderContext canIncreaseReaderTextSize](self->_readerContext, "canIncreaseReaderTextSize"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerContext, 0);
}

@end
