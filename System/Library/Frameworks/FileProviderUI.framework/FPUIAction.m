@implementation FPUIAction

- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9
{
  FPUIAction *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FPUIAction;
  result = -[UIDocumentBrowserActionDescriptor initWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:](&v10, sel_initWithIdentifier_uiActionProviderIdentifier_fileProviderIdentifier_displayName_predicate_displayInline_, a3, a4, a5, a6, a7, a6 != 0);
  if (result)
    result->_isNonUIAction = a9;
  return result;
}

- (FPUIAction)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10
{
  _BOOL8 v10;
  id v17;
  FPUIAction *v18;
  FPUIAction *v19;
  objc_super v21;

  v10 = a8;
  v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)FPUIAction;
  v18 = -[UIDocumentBrowserActionDescriptor initWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:](&v21, sel_initWithIdentifier_uiActionProviderIdentifier_fileProviderIdentifier_displayName_predicate_displayInline_, a3, a4, a5, a6, a7, v10);
  v19 = v18;
  if (v18)
  {
    v18->_isNonUIAction = a9;
    objc_storeStrong((id *)&v18->_fpProviderDomain, a10);
  }

  return v19;
}

- (FPProviderDomain)fpProviderDomain
{
  return self->_fpProviderDomain;
}

- (BOOL)isNonUIAction
{
  return self->_isNonUIAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpProviderDomain, 0);
}

@end
