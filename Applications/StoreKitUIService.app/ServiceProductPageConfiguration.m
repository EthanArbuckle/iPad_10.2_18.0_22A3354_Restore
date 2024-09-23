@implementation ServiceProductPageConfiguration

- (id)copyITMLOptionsDictionary
{
  id v3;
  id v4;
  void *v5;
  NSString *parentalRequestPromptString;
  NSString *hostApplicationIdentifier;
  NSDictionary *productPageDictionary;
  id v9;
  void *v10;
  NSURL *productURL;
  void *v12;
  uint64_t v13;
  int64_t productPageStyle;
  const __CFString *v15;
  id v16;
  id v17;
  void *v18;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_parentalRequest)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = v4;
    parentalRequestPromptString = self->_parentalRequestPromptString;
    if (parentalRequestPromptString)
      objc_msgSend(v4, "setObject:forKey:", parentalRequestPromptString, CFSTR("prompt"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("parentalRequestData"));

  }
  hostApplicationIdentifier = self->_hostApplicationIdentifier;
  if (hostApplicationIdentifier)
  {
    objc_msgSend(v3, "setObject:forKey:", hostApplicationIdentifier, CFSTR("hostApp"));
    objc_msgSend(v3, "setObject:forKey:", self->_hostApplicationIdentifier, kOptionKeyReferrerApp);
  }
  productPageDictionary = self->_productPageDictionary;
  if (productPageDictionary)
    objc_msgSend(v3, "setObject:forKey:", productPageDictionary, CFSTR("sidePackData"));
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = v9;
  if (self->_productParameters)
    objc_msgSend(v9, "addEntriesFromDictionary:");
  productURL = self->_productURL;
  if (productURL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](productURL, "absoluteString"));
    v13 = kOptionKeyURL;
    objc_msgSend(v10, "setObject:forKey:", v12, kOptionKeyURL);
    objc_msgSend(v3, "setObject:forKey:", v12, v13);

  }
  productPageStyle = self->_productPageStyle;
  if (productPageStyle == 3)
  {
    v15 = CFSTR("ipad");
  }
  else
  {
    if (productPageStyle != 2)
      goto LABEL_18;
    v15 = CFSTR("iphone");
  }
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("style"));
LABEL_18:
  if (self->_cancelButtonTitle)
  {
    v16 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", self->_cancelButtonTitle, CFSTR("title"), CFSTR("cancel"), CFSTR("type"), 0);
    objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("cancelButton"));

  }
  if (self->_rightButtonTitle && self->_showsRightButton)
  {
    v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", self->_rightButtonTitle, CFSTR("title"), CFSTR("right"), CFSTR("type"), 0);
    objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("okButton"));

  }
  if (self->_showsStoreButton)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("showsStoreButton"));

  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("storeSheet"));

  return v3;
}

- (BOOL)isLoadable
{
  return self->_productPageDictionary || self->_productParameters || self->_productURL != 0;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isParentalRequest
{
  return self->_parentalRequest;
}

- (void)setParentalRequest:(BOOL)a3
{
  self->_parentalRequest = a3;
}

- (NSString)parentalRequestPromptString
{
  return self->_parentalRequestPromptString;
}

- (void)setParentalRequestPromptString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)productPageDictionary
{
  return self->_productPageDictionary;
}

- (void)setProductPageDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)productPageStyle
{
  return self->_productPageStyle;
}

- (void)setProductPageStyle:(int64_t)a3
{
  self->_productPageStyle = a3;
}

- (NSDictionary)productParameters
{
  return self->_productParameters;
}

- (void)setProductParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)rightButtonTitle
{
  return self->_rightButtonTitle;
}

- (void)setRightButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (void)setScriptContextDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)showsRightButton
{
  return self->_showsRightButton;
}

- (void)setShowsRightButton:(BOOL)a3
{
  self->_showsRightButton = a3;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (void)setLoadable:(BOOL)a3
{
  self->_loadable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_rightButtonTitle, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
  objc_storeStrong((id *)&self->_productPageDictionary, 0);
  objc_storeStrong((id *)&self->_parentalRequestPromptString, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

@end
