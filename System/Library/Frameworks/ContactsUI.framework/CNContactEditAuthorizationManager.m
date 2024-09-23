@implementation CNContactEditAuthorizationManager

- (CNContactEditAuthorizationManager)initWithContact:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNContactEditAuthorizationManager *v9;
  CNContactEditAuthorizationManager *v10;
  CNContactEditAuthorizationManager *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactEditAuthorizationManager;
  v9 = -[CNContactEditAuthorizationManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v10->_authorizationResult = 1;
    v11 = v10;
  }

  return v10;
}

- (void)updateWithContact:(id)a3
{
  void *v5;
  void *v6;
  CNContact *v7;

  v7 = (CNContact *)a3;
  if (self->_contact != v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNContactEditAuthorizationManager contactViewCache](self, "contactViewCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerForContact:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactEditAuthorizationManager setParentContainer:](self, "setParentContainer:", v6);

  }
}

- (BOOL)shouldPromptForPasscodeAuthorization
{
  void *v2;
  char v3;

  -[CNContactEditAuthorizationManager authorizationCheck](self, "authorizationCheck");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPromptForPasscodeAuthorization");

  return v3;
}

- (BOOL)saveWasAuthorized
{
  CNContactEditAuthorizationManager *v2;
  void *v3;

  v2 = self;
  -[CNContactEditAuthorizationManager authorizationCheck](self, "authorizationCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldBypassRestrictionsGivenAuthorizationResult:", -[CNContactEditAuthorizationManager authorizationResult](v2, "authorizationResult"));

  return (char)v2;
}

- (id)authorizationCheck
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D13CB8]);
  -[CNContactEditAuthorizationManager contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactEditAuthorizationManager parentContainer](self, "parentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactEditAuthorizationManager ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  -[CNContactEditAuthorizationManager contactViewCache](self, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithContact:parentContainer:ignoresParentalRestrictions:linkedParentContainerProvider:", v4, v5, v6, v7);

  return v8;
}

- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, int64_t);
  void *v12;
  CNUIEditAuthorizationController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a5;
  v19 = a3;
  v10 = a4;
  v11 = (void (**)(id, int64_t))a6;
  if (-[CNContactEditAuthorizationManager authorizationResult](self, "authorizationResult") == 2)
    v11[2](v11, -[CNContactEditAuthorizationManager authorizationResult](self, "authorizationResult"));
  -[CNContactEditAuthorizationManager setAuthorizationResultBlock:](self, "setAuthorizationResultBlock:", v11);
  -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(CNUIEditAuthorizationController);
    -[CNContactEditAuthorizationManager setAuthorizationController:](self, "setAuthorizationController:", v13);

    -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSender:", v10);

    -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnimated:", v7);

    -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setGuardedViewController:", v19);

  }
  -[CNContactEditAuthorizationManager authorizationController](self, "authorizationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentAuthorizationUI");

}

- (void)resetAuthorization
{
  -[CNContactEditAuthorizationManager setAuthorizationResult:](self, "setAuthorizationResult:", 1);
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  -[CNContactEditAuthorizationManager setAuthorizationController:](self, "setAuthorizationController:", 0);
  -[CNContactEditAuthorizationManager setAuthorizationResult:](self, "setAuthorizationResult:", a4);
  -[CNContactEditAuthorizationManager authorizationResultBlock](self, "authorizationResultBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactEditAuthorizationManager authorizationResultBlock](self, "authorizationResultBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, a4);

    -[CNContactEditAuthorizationManager setAuthorizationResultBlock:](self, "setAuthorizationResultBlock:", 0);
  }
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewCache, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainer, a3);
}

- (CNUIEditAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationController, a3);
}

- (int64_t)authorizationResult
{
  return self->_authorizationResult;
}

- (void)setAuthorizationResult:(int64_t)a3
{
  self->_authorizationResult = a3;
}

- (id)authorizationResultBlock
{
  return self->_authorizationResultBlock;
}

- (void)setAuthorizationResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationResultBlock, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
}

@end
