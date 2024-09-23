@implementation CADFilterSuggestedCalendarsAccessHandler

- (CADFilterSuggestedCalendarsAccessHandler)initWithDatabaseDataProvider:(id)a3 permissionValidator:(id)a4
{
  id v7;
  CADFilterSuggestedCalendarsAccessHandler *v8;
  CADFilterSuggestedCalendarsAccessHandler *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CADFilterSuggestedCalendarsAccessHandler;
  v8 = -[CADAccountAccessHandler initWithDatabaseDataProvider:](&v11, sel_initWithDatabaseDataProvider_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_permissionValidator, a4);

  return v9;
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CADFilterSuggestedCalendarsAccessHandler permissionValidator](self, "permissionValidator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canModifySuggestedEventCalendar"))
  {
    v8 = +[CADFeatureSet isSuggestionsEnabled](CADFeatureSet, "isSuggestionsEnabled");

    if (v8)
      goto LABEL_10;
  }
  else
  {

  }
  -[CADAccountAccessHandler dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suggestionsCalendarRowIDInDatabase:", a5);
  if ((int)v10 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v11);

  }
  v12 = objc_msgSend(v9, "naturalLanguageSuggestionsCalendarRowIDInDatabase:", a5);
  if ((int)v12 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

  }
LABEL_10:

}

- (CADPermissionValidator)permissionValidator
{
  return self->_permissionValidator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionValidator, 0);
}

@end
