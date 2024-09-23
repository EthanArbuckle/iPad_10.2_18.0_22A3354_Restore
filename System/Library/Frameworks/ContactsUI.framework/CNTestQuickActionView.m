@implementation CNTestQuickActionView

- (CNTestQuickActionView)init
{
  CNTestQuickActionView *v2;
  uint64_t v3;
  NSMutableArray *titlesAssigned;
  uint64_t v5;
  NSMutableArray *statesAssigned;
  CNTestQuickActionView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNTestQuickActionView;
  v2 = -[CNTestQuickActionView init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    titlesAssigned = v2->_titlesAssigned;
    v2->_titlesAssigned = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    statesAssigned = v2->_statesAssigned;
    v2->_statesAssigned = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *title;
  NSString *v7;
  void *v8;
  id v9;

  v5 = (NSString *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionControllerTestUtilities.m"), 31, CFSTR("-[CNTestQuickActionView setTitle:] should only be called on the main thread"));

  }
  title = self->_title;
  self->_title = v5;
  v7 = v5;

  -[CNTestQuickActionView titlesAssigned](self, "titlesAssigned");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionControllerTestUtilities.m"), 39, CFSTR("-[CNTestQuickActionView setEnabled:] should only be called on the main thread"));

  }
  self->_enabled = v3;
  -[CNTestQuickActionView statesAssigned](self, "statesAssigned");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v6);

}

- (NSString)title
{
  return self->_title;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSMutableArray)titlesAssigned
{
  return self->_titlesAssigned;
}

- (NSMutableArray)statesAssigned
{
  return self->_statesAssigned;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statesAssigned, 0);
  objc_storeStrong((id *)&self->_titlesAssigned, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
