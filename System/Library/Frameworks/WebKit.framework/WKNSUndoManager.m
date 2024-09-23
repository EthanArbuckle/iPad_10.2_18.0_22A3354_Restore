@implementation WKNSUndoManager

- (WKNSUndoManager)initWithContentView:(id)a3
{
  WKNSUndoManager *v4;
  WKNSUndoManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKNSUndoManager;
  v4 = -[WKNSUndoManager init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isRegisteringUndoCommand = 0;
    objc_storeWeak((id *)&v4->_contentView, a3);
  }
  return v5;
}

- (void)beginUndoGrouping
{
  objc_super v3;

  if (!self->_isRegisteringUndoCommand)
    objc_msgSend(objc_loadWeak((id *)&self->_contentView), "_closeCurrentTypingCommand");
  v3.receiver = self;
  v3.super_class = (Class)WKNSUndoManager;
  -[WKNSUndoManager beginUndoGrouping](&v3, sel_beginUndoGrouping);
}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  BOOL isRegisteringUndoCommand;
  objc_super v7;

  isRegisteringUndoCommand = self->_isRegisteringUndoCommand;
  self->_isRegisteringUndoCommand = 1;
  v7.receiver = self;
  v7.super_class = (Class)WKNSUndoManager;
  -[WKNSUndoManager registerUndoWithTarget:selector:object:](&v7, sel_registerUndoWithTarget_selector_object_, a3, a4, a5);
  self->_isRegisteringUndoCommand = isRegisteringUndoCommand;
}

- (void)registerUndoWithTarget:(id)a3 handler:(id)a4
{
  BOOL isRegisteringUndoCommand;
  objc_super v6;

  isRegisteringUndoCommand = self->_isRegisteringUndoCommand;
  self->_isRegisteringUndoCommand = 1;
  v6.receiver = self;
  v6.super_class = (Class)WKNSUndoManager;
  -[WKNSUndoManager registerUndoWithTarget:handler:](&v6, sel_registerUndoWithTarget_handler_, a3, a4);
  self->_isRegisteringUndoCommand = isRegisteringUndoCommand;
}

- (WKContentView)contentView
{
  return (WKContentView *)objc_loadWeak((id *)&self->_contentView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
}

@end
