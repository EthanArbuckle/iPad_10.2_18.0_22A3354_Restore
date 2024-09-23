@implementation CalDatabaseInitializationConfiguration

- (void)setOptions:(int)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataContainerProvider, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

- (CDBPreferences)preferences
{
  return self->_preferences;
}

- (int)options
{
  return self->_options;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (CalCalendarDataContainerProvider)dataContainerProvider
{
  return self->_dataContainerProvider;
}

- (CalDatabaseInitializationConfiguration)initWithDirectoryURL:(id)a3
{
  id v5;
  CalDatabaseInitializationConfiguration *v6;
  CalDatabaseInitializationConfiguration *v7;
  void *v8;
  CalCalendarDataContainerProvider *v9;
  CalCalendarDataContainerProvider *dataContainerProvider;
  CalCalendarDataContainerProvider *v11;
  void *v12;
  uint64_t v13;
  CDBPreferences *preferences;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CalDatabaseInitializationConfiguration;
  v6 = -[CalDatabaseInitializationConfiguration init](&v16, sel_init);
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x1E0D0C4A0], 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CalCalendarDataContainerProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C348]), "initWithCalendarDataContainerURL:", v8);
    dataContainerProvider = v7->_dataContainerProvider;
    v7->_dataContainerProvider = v9;
    v11 = v9;

    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDBPreferences preferencesForDirectory:](CDBPreferences, "preferencesForDirectory:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    preferences = v7->_preferences;
    v7->_preferences = (CDBPreferences *)v13;

  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<CalDatabaseInitializationConfiguration:%p> options=%i, directoryURL=%@, dataContainerProvider=%@ preferences=%@]"), self, self->_options, self->_directoryURL, self->_dataContainerProvider, self->_preferences);
}

- (id)redactedDescription
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("(not null)");
  if (self->_directoryURL)
    v3 = CFSTR("(not null)");
  else
    v3 = CFSTR("(null)");
  if (self->_dataContainerProvider)
    v4 = CFSTR("(not null)");
  else
    v4 = CFSTR("(null)");
  if (!self->_preferences)
    v2 = CFSTR("(null)");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[<CalDatabaseInitializationConfiguration:%p> options=%i, directoryURL=%@, dataContainerProvider=%@ preferences=%@]"), self, self->_options, v3, v4, v2);
}

- (void)setDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURL, a3);
}

- (void)setDataContainerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainerProvider, a3);
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

@end
