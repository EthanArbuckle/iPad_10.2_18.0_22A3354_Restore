@implementation AFUIPanelState

- (id)initNotDisplayed
{
  return -[AFUIPanelState initDisplayed:documentTraits:documentState:textOperationsHandler:](self, "initDisplayed:documentTraits:documentState:textOperationsHandler:", 0, 0, 0, 0);
}

- (id)initDisplayed:(BOOL)a3 documentTraits:(id)a4 documentState:(id)a5 textOperationsHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  AFUIPanelState *v13;
  AFUIPanelState *v14;
  uint64_t v15;
  RTIDocumentTraits *documentTraits;
  uint64_t v17;
  RTIDocumentState *documentState;
  uint64_t v19;
  id textOperationsHandler;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AFUIPanelState;
  v13 = -[AFUIPanelState init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_displayed = a3;
    v15 = objc_msgSend(v10, "copy");
    documentTraits = v14->_documentTraits;
    v14->_documentTraits = (RTIDocumentTraits *)v15;

    v17 = objc_msgSend(v11, "copy");
    documentState = v14->_documentState;
    v14->_documentState = (RTIDocumentState *)v17;

    v19 = objc_msgSend(v12, "copy");
    textOperationsHandler = v14->_textOperationsHandler;
    v14->_textOperationsHandler = (id)v19;

  }
  return v14;
}

- (BOOL)isDisplayed
{
  return self->_displayed;
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (id)textOperationsHandler
{
  return self->_textOperationsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textOperationsHandler, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end
