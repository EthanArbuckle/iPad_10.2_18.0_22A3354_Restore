@implementation HUForwardingTriggerActionBuilderDelegate

- (HUForwardingTriggerActionBuilderDelegate)initWithTriggerActionBuilderEditorDelegate:(id)a3
{
  id v4;
  HUForwardingTriggerActionBuilderDelegate *v5;
  HUForwardingTriggerActionBuilderDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUForwardingTriggerActionBuilderDelegate;
  v5 = -[HUForwardingTriggerActionBuilderDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUForwardingTriggerActionBuilderDelegate setTriggerActionBuilderEditorDelegate:](v5, "setTriggerActionBuilderEditorDelegate:", v4);

  return v6;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "triggerActionSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[HUForwardingTriggerActionBuilderDelegate triggerActionBuilderEditorDelegate](self, "triggerActionBuilderEditorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUForwardingTriggerActionBuilderDelegate triggerActionBuilderEditorDelegate](self, "triggerActionBuilderEditorDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionBuilderEditor:didFinishWithTriggerActionSetBuilder:", v11, v8);

  }
}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  return 1;
}

- (HUTriggerActionBuilderEditorDelegate)triggerActionBuilderEditorDelegate
{
  return (HUTriggerActionBuilderEditorDelegate *)objc_loadWeakRetained((id *)&self->_triggerActionBuilderEditorDelegate);
}

- (void)setTriggerActionBuilderEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_triggerActionBuilderEditorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_triggerActionBuilderEditorDelegate);
}

@end
