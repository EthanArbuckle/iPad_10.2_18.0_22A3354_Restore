@implementation _LTTranslationRange

- (_LTTranslationRange)initWithIdentifier:(id)a3 text:(id)a4 shouldTranslate:(BOOL)a5
{
  id v9;
  id v10;
  _LTTranslationRange *v11;
  _LTTranslationRange *v12;
  _LTTranslationRange *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_LTTranslationRange;
  v11 = -[_LTTranslationRange init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_text, a4);
    v12->_shouldTranslate = a5;
    v13 = v12;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)shouldTranslate
{
  return self->_shouldTranslate;
}

- (NSDictionary)metaInfo
{
  return self->_metaInfo;
}

- (void)setMetaInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
