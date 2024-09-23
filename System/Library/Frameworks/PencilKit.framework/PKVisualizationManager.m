@implementation PKVisualizationManager

- (PKVisualizationManager)initWithRecognitionSession:(id)a3
{
  id v3;
  PKVisualizationManager *v4;
  id v5;
  uint64_t v6;
  CHVisualizationManager *chVisualizationManager;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKVisualizationManager;
  v3 = a3;
  v4 = -[PKVisualizationManager init](&v10, sel_init);
  v5 = objc_alloc(MEMORY[0x1E0D168B8]);
  v6 = objc_msgSend(v5, "initWithRecognitionSession:", v3, v10.receiver, v10.super_class);

  chVisualizationManager = v4->_chVisualizationManager;
  v4->_chVisualizationManager = (CHVisualizationManager *)v6;

  -[PKVisualizationManager chVisualizationManager](v4, "chVisualizationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v4);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKVisualizationManager chVisualizationManager](self, "chVisualizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[PKVisualizationManager setDelegate:](self, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKVisualizationManager;
  -[PKVisualizationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)recognitionStatusReportingEnabled
{
  void *v2;
  char v3;

  -[PKVisualizationManager chVisualizationManager](self, "chVisualizationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusReportingEnabled");

  return v3;
}

- (void)setRecognitionStatusReportingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKVisualizationManager chVisualizationManager](self, "chVisualizationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusReportingEnabled:", v3);

}

+ (id)availableRecognitionStatusKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0D168B8], "availableRecognitionSessionStatusKeys");
}

+ (id)localizedNameForRecognitionStatusKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D168B8], "localizedNameForRecognitionSessionStatusKey:", a3);
}

- (id)valueForRecognitionStatusKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKVisualizationManager chVisualizationManager](self, "chVisualizationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForRecognitionStatusKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)visualizationManagerDidUpdateSessionStatus:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[PKVisualizationManager delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "visualizationManagerDidUpdateRecognitionStatus:", self);
      v5 = v7;
    }
  }

}

- (PKVisualizationManager)delegate
{
  return (PKVisualizationManager *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHVisualizationManager)chVisualizationManager
{
  return self->_chVisualizationManager;
}

- (void)setChVisualizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_chVisualizationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chVisualizationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
