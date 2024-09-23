@implementation CDMShortcutPhrase

- (CDMShortcutPhrase)initWithSemanticValue:(id)a3
{
  return -[CDMShortcutPhrase initWithSemanticValue:baseTemplateString:](self, "initWithSemanticValue:baseTemplateString:", a3, 0);
}

- (CDMShortcutPhrase)initWithSemanticValue:(id)a3 baseTemplateString:(id)a4
{
  id v7;
  id v8;
  CDMShortcutPhrase *v9;
  CDMShortcutPhrase *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMShortcutPhrase;
  v9 = -[CDMShortcutPhrase init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_semanticValue, a3);
    objc_storeStrong((id *)&v10->_baseTemplateString, a4);
  }

  return v10;
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (NSString)baseTemplateString
{
  return self->_baseTemplateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTemplateString, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
}

@end
