@implementation CDMRegexEntry

- (CDMRegexEntry)initWithRegex:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  CDMRegexEntry *v9;
  CDMRegexEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMRegexEntry;
  v9 = -[CDMRegexEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_regularExpression, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

@end
