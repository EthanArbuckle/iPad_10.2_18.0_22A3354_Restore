@implementation BuddyMultilingualDataModelProviderCollection

- (BuddyMultilingualDataModelProviderCollection)initWithKeyboardProvider:(id)a3 withDictationProvider:(id)a4
{
  id v5;
  BuddyMultilingualDataModelProviderCollection *v6;
  BuddyMultilingualDataModelProviderCollection *v7;
  objc_super v9;
  id obj;
  id location[2];
  id v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v12;
  v12 = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyMultilingualDataModelProviderCollection;
  v6 = -[BuddyMultilingualDataModelProviderCollection init](&v9, "init");
  v12 = v6;
  objc_storeStrong(&v12, v6);
  if (v6)
  {
    objc_storeStrong((id *)v12 + 2, location[0]);
    objc_storeStrong((id *)v12 + 3, obj);
    *((_BYTE *)v12 + 8) = 0;
  }
  v7 = (BuddyMultilingualDataModelProviderCollection *)v12;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v7;
}

- (BuddyMultilingualProvider)keyboardProvider
{
  return self->_keyboardProvider;
}

- (void)setKeyboardProvider:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardProvider, a3);
}

- (BuddyMultilingualProvider)dictationProvider
{
  return self->_dictationProvider;
}

- (void)setDictationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dictationProvider, a3);
}

- (BOOL)expressFlowDidCustomize
{
  return self->_expressFlowDidCustomize;
}

- (void)setExpressFlowDidCustomize:(BOOL)a3
{
  self->_expressFlowDidCustomize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationProvider, 0);
  objc_storeStrong((id *)&self->_keyboardProvider, 0);
}

@end
