@implementation PKTextInputWindowFirstResponder

- (PKTextInputWindowFirstResponder)initWithIsVisible:(BOOL)a3 isEditableTextInput:(BOOL)a4 textInputSource:(int64_t)a5 inputAssistantItem:(id)a6
{
  id v11;
  PKTextInputWindowFirstResponder *v12;
  PKTextInputWindowFirstResponder *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PKTextInputWindowFirstResponder;
  v12 = -[PKTextInputWindowFirstResponder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_isVisible = a3;
    v12->_editableTextInput = a4;
    v12->_textInputSource = a5;
    objc_storeStrong((id *)&v12->_inputAssistantItem, a6);
  }

  return v13;
}

- (BOOL)isPencilTextInputSource
{
  return self->_textInputSource == 3;
}

- (BOOL)isEditableTextInputWithPencilTextInputSource
{
  _BOOL4 v3;

  v3 = -[PKTextInputWindowFirstResponder isPencilTextInputSource](self, "isPencilTextInputSource");
  if (v3)
    LOBYTE(v3) = -[PKTextInputWindowFirstResponder isEditableTextInput](self, "isEditableTextInput");
  return v3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (int64_t)textInputSource
{
  return self->_textInputSource;
}

- (BOOL)isEditableTextInput
{
  return self->_editableTextInput;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

- (BOOL)disableInputAssistant
{
  return self->_disableInputAssistant;
}

- (void)setDisableInputAssistant:(BOOL)a3
{
  self->_disableInputAssistant = a3;
}

- (BOOL)isNotesHandwritingResponder
{
  return self->_notesHandwritingResponder;
}

- (void)setNotesHandwritingResponder:(BOOL)a3
{
  self->_notesHandwritingResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
}

@end
