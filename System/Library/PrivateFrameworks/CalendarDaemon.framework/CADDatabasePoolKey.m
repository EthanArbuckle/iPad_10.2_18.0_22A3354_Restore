@implementation CADDatabasePoolKey

- (CADDatabasePoolKey)initWithInitializationOptions:(id)a3
{
  id v4;
  CADDatabasePoolKey *v5;
  uint64_t v6;
  NSURL *databaseDirectory;
  uint64_t v8;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADDatabasePoolKey;
  v5 = -[CADDatabasePoolKey init](&v11, sel_init);
  if (v5)
  {
    v5->_initOptions = objc_msgSend(v4, "databaseInitOptions") & 0xFFFFFFF9;
    objc_msgSend(v4, "databaseDirectory");
    v6 = objc_claimAutoreleasedReturnValue();
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSURL *)v6;

    objc_msgSend(v4, "calendarDataContainerProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    calendarDataContainerProvider = v5->_calendarDataContainerProvider;
    v5->_calendarDataContainerProvider = (CalCalendarDataContainerProvider *)v8;

    v5->_unitTesting = objc_msgSend(v4, "unitTesting");
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = (37 * self->_initOptions);
  return -[NSURL hash](self->_databaseDirectory, "hash") + v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  NSURL *databaseDirectory;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v8 = self->_initOptions == v5[2]
      && ((databaseDirectory = self->_databaseDirectory, !((unint64_t)databaseDirectory | *((_QWORD *)v5 + 2)))
       || -[NSURL isEqual:](databaseDirectory, "isEqual:"))
      && ((calendarDataContainerProvider = self->_calendarDataContainerProvider,
           !((unint64_t)calendarDataContainerProvider | *((_QWORD *)v5 + 3)))
       || -[CalCalendarDataContainerProvider isEqual:](calendarDataContainerProvider, "isEqual:"))
      && self->_unitTesting == *((unsigned __int8 *)v5 + 32);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CADDatabaseInitializationOptions)options
{
  CADDatabaseInitializationOptions *v3;

  v3 = objc_alloc_init(CADDatabaseInitializationOptions);
  -[CADDatabaseInitializationOptions setDatabaseInitOptions:](v3, "setDatabaseInitOptions:", self->_initOptions);
  -[CADDatabaseInitializationOptions setDatabaseDirectory:](v3, "setDatabaseDirectory:", self->_databaseDirectory);
  -[CADDatabaseInitializationOptions setCalendarDataContainerProvider:](v3, "setCalendarDataContainerProvider:", self->_calendarDataContainerProvider);
  -[CADDatabaseInitializationOptions setUnitTesting:](v3, "setUnitTesting:", self->_unitTesting);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  int initOptions;
  NSURL *databaseDirectory;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("[CADDatabasePoolKey <%p>:"), self);
  v4 = v3;
  initOptions = self->_initOptions;
  if (initOptions)
    objc_msgSend(v3, "appendFormat:", CFSTR(" options = %x"), self->_initOptions);
  databaseDirectory = self->_databaseDirectory;
  if (databaseDirectory)
  {
    -[NSURL path](databaseDirectory, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)CalDatabaseCopyDirectoryPath();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      if (initOptions)
        objc_msgSend(v4, "appendString:", CFSTR("; "));
      -[NSURL path](self->_databaseDirectory, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" path = %@"), v10);

    }
  }
  calendarDataContainerProvider = self->_calendarDataContainerProvider;
  if (calendarDataContainerProvider)
  {
    if (initOptions)
    {
      objc_msgSend(v4, "appendString:", CFSTR("; "));
      calendarDataContainerProvider = self->_calendarDataContainerProvider;
    }
    objc_msgSend(v4, "appendFormat:", CFSTR(" containerProvider = %@"), calendarDataContainerProvider);
  }
  if (self->_unitTesting)
  {
    if (initOptions)
      objc_msgSend(v4, "appendString:", CFSTR("; "));
    objc_msgSend(v4, "appendString:", CFSTR(" unitTesting = YES"));
  }
  if (initOptions)
    objc_msgSend(v4, "appendFormat:", CFSTR("]"));
  else
    objc_msgSend(v4, "appendString:", CFSTR("default]"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDataContainerProvider, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

@end
