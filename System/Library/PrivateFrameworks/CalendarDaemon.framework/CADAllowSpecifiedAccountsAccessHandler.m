@implementation CADAllowSpecifiedAccountsAccessHandler

- (CADAllowSpecifiedAccountsAccessHandler)initWithAllowedSourceIdentifiers:(id)a3 databaseDataProvider:(id)a4
{
  id v6;
  CADAllowSpecifiedAccountsAccessHandler *v7;
  uint64_t v8;
  NSSet *allowedSourceIdentifiers;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADAllowSpecifiedAccountsAccessHandler;
  v7 = -[CADAccountAccessHandler initWithDatabaseDataProvider:](&v11, sel_initWithDatabaseDataProvider_, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    allowedSourceIdentifiers = v7->_allowedSourceIdentifiers;
    v7->_allowedSourceIdentifiers = (NSSet *)v8;

  }
  return v7;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  CADAllowSpecifiedAccountsAccessHandler *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = self;
  -[CADAccountAccessHandler dataProvider](self, "dataProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeIDForStore:inDatabase:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CADAllowSpecifiedAccountsAccessHandler allowedSourceIdentifiers](v7, "allowedSourceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v10, "containsObject:", v9);

  return (char)v7;
}

- (NSSet)allowedSourceIdentifiers
{
  return self->_allowedSourceIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_restrictedCalendarRowIDs, 0);
}

@end
