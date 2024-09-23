@implementation BETextSuggestion

- (BETextSuggestion)initWithInputText:(id)a3
{
  void *v4;
  BETextSuggestion *v5;

  objc_msgSend(MEMORY[0x24BEBDA80], "textSuggestionWithInputText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BETextSuggestion _initWithUIKitTextSuggestion:](self, "_initWithUIKitTextSuggestion:", v4);

  return v5;
}

- (id)_initWithUIKitTextSuggestion:(id)a3
{
  id v5;
  BETextSuggestion *v6;
  BETextSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextSuggestion;
  v6 = -[BETextSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiSuggestion, a3);

  return v7;
}

- (NSString)inputText
{
  return (NSString *)-[UITextSuggestion inputText](self->_uiSuggestion, "inputText");
}

- (id)_uikitTextSuggestion
{
  return self->_uiSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiSuggestion, 0);
}

@end
