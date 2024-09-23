@implementation CNUICoreWhitelistedContactsControllerOptions

+ (CNUICoreWhitelistedContactsControllerOptions)macOptions
{
  return (CNUICoreWhitelistedContactsControllerOptions *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithShouldPrepopulateEmptyWhitelist:shouldRequireConfirmationOfChanges:", 1, 1);
}

+ (CNUICoreWhitelistedContactsControllerOptions)macOptionsLocal
{
  return (CNUICoreWhitelistedContactsControllerOptions *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithShouldPrepopulateEmptyWhitelist:shouldRequireConfirmationOfChanges:", 0, 1);
}

+ (CNUICoreWhitelistedContactsControllerOptions)iosOptions
{
  return (CNUICoreWhitelistedContactsControllerOptions *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithShouldPrepopulateEmptyWhitelist:shouldRequireConfirmationOfChanges:", 0, 0);
}

- (CNUICoreWhitelistedContactsControllerOptions)init
{
  CNUICoreWhitelistedContactsControllerOptions *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreWhitelistedContactsControllerOptions)initWithShouldPrepopulateEmptyWhitelist:(BOOL)a3 shouldRequireConfirmationOfChanges:(BOOL)a4
{
  CNUICoreWhitelistedContactsControllerOptions *v6;
  CNUICoreWhitelistedContactsControllerOptions *v7;
  CNUICoreWhitelistedContactsControllerOptions *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNUICoreWhitelistedContactsControllerOptions;
  v6 = -[CNUICoreWhitelistedContactsControllerOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_shouldPrepopulateEmptyWhitelist = a3;
    v6->_shouldRequireConfirmationOfChanges = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)shouldPrepopulateEmptyWhitelist
{
  return self->_shouldPrepopulateEmptyWhitelist;
}

- (BOOL)shouldRequireConfirmationOfChanges
{
  return self->_shouldRequireConfirmationOfChanges;
}

@end
