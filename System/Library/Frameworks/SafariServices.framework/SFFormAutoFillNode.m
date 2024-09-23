@implementation SFFormAutoFillNode

+ (id)autoFillNodeWithNodeHandle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNodeHandle:", v4);

  return v5;
}

- (SFFormAutoFillNode)initWithNodeHandle:(id)a3
{
  id v5;
  SFFormAutoFillNode *v6;
  SFFormAutoFillNode *v7;
  SFFormAutoFillNode *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormAutoFillNode;
  v6 = -[SFFormAutoFillNode init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nodeHandle, a3);
    v8 = v7;
  }

  return v7;
}

- (SFFormAutoFillNode)initWithJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  OpaqueJSValue *v4;
  SFFormAutoFillNode *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WKWebProcessPlugInNodeHandle *nodeHandle;
  objc_super v13;

  v4 = a3;
  v5 = self;
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)SFFormAutoFillNode;
    v5 = -[SFFormAutoFillNode init](&v13, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", JSContextGetGlobalContext(a4));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CEF620];
      objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", v4, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nodeHandleWithJSValue:inContext:", v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      nodeHandle = v5->_nodeHandle;
      v5->_nodeHandle = (WKWebProcessPlugInNodeHandle *)v10;

      if (v5->_nodeHandle)
        v4 = v5;
      else
        v4 = 0;

    }
    else
    {
      v4 = 0;
    }
  }

  return (SFFormAutoFillNode *)v4;
}

- (CGRect)elementBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WKWebProcessPlugInNodeHandle elementBounds](self->_nodeHandle, "elementBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHTMLInputElementAutofilled:(BOOL)a3
{
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementIsAutoFilled:](self->_nodeHandle, "setHTMLInputElementIsAutoFilled:", a3);
}

- (void)setHTMLInputElementAutoFilledAndViewable:(BOOL)a3
{
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementIsAutoFilledAndViewable:](self->_nodeHandle, "setHTMLInputElementIsAutoFilledAndViewable:", a3);
}

- (void)setHTMLInputElementAutoFilledAndObscured:(BOOL)a3
{
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementIsAutoFilledAndObscured:](self->_nodeHandle, "setHTMLInputElementIsAutoFilledAndObscured:", a3);
}

- (BOOL)isHTMLInputElementUserEdited
{
  return -[WKWebProcessPlugInNodeHandle HTMLInputElementIsUserEdited](self->_nodeHandle, "HTMLInputElementIsUserEdited");
}

- (BOOL)isHTMLTextAreaElementUserEdited
{
  return -[WKWebProcessPlugInNodeHandle HTMLTextAreaElementIsUserEdited](self->_nodeHandle, "HTMLTextAreaElementIsUserEdited");
}

- (void)setHTMLInputElementAutoFilledWithAutomaticStrongPassword:(BOOL)a3
{
  _BOOL8 v3;
  WKWebProcessPlugInNodeHandle *nodeHandle;
  uint64_t v6;

  v3 = a3;
  nodeHandle = self->_nodeHandle;
  if (a3)
    v6 = 3;
  else
    v6 = 0;
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementAutoFillButtonEnabledWithButtonType:](nodeHandle, "setHTMLInputElementAutoFillButtonEnabledWithButtonType:", v6);
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementIsAutoFilled:](self->_nodeHandle, "setHTMLInputElementIsAutoFilled:", v3);
}

- (int64_t)htmlInputElementAutoFillButtonType
{
  uint64_t v2;

  v2 = -[WKWebProcessPlugInNodeHandle htmlInputElementAutoFillButtonType](self->_nodeHandle, "htmlInputElementAutoFillButtonType");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_1A3CAFAE0[v2 - 1];
}

- (int64_t)htmlInputElementLastAutoFillButtonType
{
  uint64_t v2;

  v2 = -[WKWebProcessPlugInNodeHandle htmlInputElementLastAutoFillButtonType](self->_nodeHandle, "htmlInputElementLastAutoFillButtonType");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_1A3CAFAE0[v2 - 1];
}

- (void)setSpinnerVisibilityOnHTMLInputElement:(BOOL)a3
{
  WKWebProcessPlugInNodeHandle *nodeHandle;
  uint64_t v4;

  nodeHandle = self->_nodeHandle;
  if (a3)
    v4 = 5;
  else
    v4 = 0;
  -[WKWebProcessPlugInNodeHandle setHTMLInputElementAutoFillButtonEnabledWithButtonType:](nodeHandle, "setHTMLInputElementAutoFillButtonEnabledWithButtonType:", v4);
}

- (WKWebProcessPlugInNodeHandle)nodeHandle
{
  return self->_nodeHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeHandle, 0);
}

@end
