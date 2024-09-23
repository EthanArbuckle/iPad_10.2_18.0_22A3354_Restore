@implementation PKPaletteTapToRadarCommand

- (PKPaletteTapToRadarCommand)initWithDelegate:(id)a3
{
  id v4;
  PKPaletteTapToRadarCommand *v5;
  PKPaletteTapToRadarCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteTapToRadarCommand;
  v5 = -[PKPaletteTapToRadarCommand init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)execute
{
  void *v3;
  void *v4;
  PKPaletteTapToRadarCommandExecution *v5;
  PKPaletteTapToRadarCommandExecution *execution;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (os_variant_has_internal_diagnostics())
  {
    -[PKPaletteTapToRadarCommand delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paletteTapToRadarCommandConfiguration:", self);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "debugSharpenerLog");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        +[PKPaletteTapToRadarCommandExecution commandExecutionWithConfiguration:](PKPaletteTapToRadarCommandExecution, "commandExecutionWithConfiguration:", v14);
        v5 = (PKPaletteTapToRadarCommandExecution *)objc_claimAutoreleasedReturnValue();
        execution = self->_execution;
        self->_execution = v5;

        -[PKPaletteTapToRadarCommandExecution run](self->_execution, "run");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scribble Problem Reporter"), CFSTR("No Scribble logs available."), 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0DC3448];
        _PencilKitBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v12);

        objc_msgSend(v14, "presentationViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "presentViewController:animated:completion:", v8, 1, 0);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("PKPaletteTapToRadarCommandTriggeredNotification"), self);

    }
  }
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  -[PKPaletteTapToRadarCommandExecution editingOverlayContainerDidChangeToSceneBounds:](self->_execution, "editingOverlayContainerDidChangeToSceneBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPaletteTapToRadarCommandDelegate)delegate
{
  return (PKPaletteTapToRadarCommandDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_execution, 0);
}

@end
