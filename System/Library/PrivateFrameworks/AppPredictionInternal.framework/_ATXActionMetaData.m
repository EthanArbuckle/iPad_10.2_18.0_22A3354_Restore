@implementation _ATXActionMetaData

- (_ATXActionMetaData)initWithTitle:(id)a3 subtitle:(id)a4 shouldPredict:(BOOL)a5 shouldPredictLockScreen:(BOOL)a6 actionKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  _ATXActionMetaData *v16;
  _ATXActionMetaData *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_ATXActionMetaData;
  v16 = -[_ATXActionMetaData init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v17->_subtitle, a4);
    v17->_shouldPredict = a5;
    v17->_shouldPredictLockScreen = a6;
    objc_storeStrong((id *)&v17->_actionKey, a7);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXActionMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _ATXActionMetaData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPredict"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPredictLockScreen"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_ATXActionMetaData initWithTitle:subtitle:shouldPredict:shouldPredictLockScreen:actionKey:](self, "initWithTitle:subtitle:shouldPredict:shouldPredictLockScreen:actionKey:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPredict, CFSTR("shouldPredict"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPredictLockScreen, CFSTR("shouldPredictLockScreen"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionKey, CFSTR("actionKey"));

}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)shouldPredict
{
  return self->_shouldPredict;
}

- (BOOL)shouldPredictLockScreen
{
  return self->_shouldPredictLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

@end
