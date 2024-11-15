@implementation UIDocumentBrowserActionDescriptor

- (UIDocumentBrowserActionDescriptor)initWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  UIDocumentBrowserActionDescriptor *v18;
  UIDocumentBrowserActionDescriptor *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UIDocumentBrowserActionDescriptor;
  v18 = -[UIDocumentBrowserActionDescriptor init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_displayName, a6);
    objc_storeStrong((id *)&v19->_predicate, a7);
    objc_storeStrong((id *)&v19->_uiActionProviderIdentifier, a4);
    objc_storeStrong((id *)&v19->_fileProviderIdentifier, a5);
    v19->_displayInline = a8;
  }

  return v19;
}

- (NSString)uiActionProviderIdentifier
{
  return self->_uiActionProviderIdentifier;
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)displayInline
{
  return self->_displayInline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_uiActionProviderIdentifier, 0);
}

@end
