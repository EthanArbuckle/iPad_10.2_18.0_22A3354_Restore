@implementation BEKeyEntryContext

- (BEKeyEntryContext)initWithKeyEntry:(id)a3
{
  id v4;
  BEKeyEntryContext *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIKeyEventContext *backingKeyEventContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BEKeyEntryContext;
  v5 = -[BEKeyEntryContext init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEBD6C0]);
    objc_msgSend(v4, "_uikitKeyEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithKeyEvent:", v7);
    backingKeyEventContext = v5->_backingKeyEventContext;
    v5->_backingKeyEventContext = (UIKeyEventContext *)v8;

  }
  return v5;
}

- (id)_uikitKeyEventContext
{
  return self->_backingKeyEventContext;
}

- (void)setDocumentEditable:(BOOL)a3
{
  -[UIKeyEventContext setDocumentIsEditable:](self->_backingKeyEventContext, "setDocumentIsEditable:", a3);
}

- (void)setShouldInsertCharacter:(BOOL)a3
{
  -[UIKeyEventContext setShouldInsertChar:](self->_backingKeyEventContext, "setShouldInsertChar:", a3);
}

- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3
{
  -[UIKeyEventContext setShouldEvaluateForInputSystemHandling:](self->_backingKeyEventContext, "setShouldEvaluateForInputSystemHandling:", a3);
}

- (BEKeyEntry)keyEntry
{
  return self->_keyEntry;
}

- (BOOL)isDocumentEditable
{
  return self->_documentEditable;
}

- (BOOL)shouldInsertCharacter
{
  return self->_shouldInsertCharacter;
}

- (BOOL)shouldEvaluateForInputSystemHandling
{
  return self->_shouldEvaluateForInputSystemHandling;
}

- (UIKeyEventContext)backingKeyEventContext
{
  return self->_backingKeyEventContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingKeyEventContext, 0);
  objc_storeStrong((id *)&self->_keyEntry, 0);
}

@end
