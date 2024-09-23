@implementation CalMockCalendarDataContainerProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalMockCalendarDataContainerProvider)initWithCalendarDataContainerURL:(id)a3
{
  id v5;
  CalMockCalendarDataContainerProvider *v6;
  CalMockCalendarDataContainerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalMockCalendarDataContainerProvider;
  v6 = -[CalMockCalendarDataContainerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_calendarDataContainerURL, a3);

  return v7;
}

- (CalMockCalendarDataContainerProvider)initWithAccountDataContainerMap:(id)a3 defaultDataContainer:(id)a4
{
  id v7;
  id v8;
  CalMockCalendarDataContainerProvider *v9;
  CalMockCalendarDataContainerProvider *v10;
  NSDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSDictionary *personaIDsByContainer;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CalMockCalendarDataContainerProvider;
  v9 = -[CalMockCalendarDataContainerProvider init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    v22 = v8;
    objc_storeStrong((id *)&v9->_calendarDataContainerURL, a4);
    objc_storeStrong((id *)&v10->_accountsWithSpecificContainers, a3);
    v11 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("persona-for-"), "stringByAppendingString:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    personaIDsByContainer = v10->_personaIDsByContainer;
    v10->_personaIDsByContainer = v11;

    v8 = v22;
  }

  return v10;
}

- (CalMockCalendarDataContainerProvider)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CalMockCalendarDataContainerProvider *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("accountsWithSpecificContainers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarDataContainerURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CalMockCalendarDataContainerProvider initWithAccountDataContainerMap:defaultDataContainer:](self, "initWithAccountDataContainerMap:defaultDataContainer:", v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *accountsWithSpecificContainers;
  id v5;

  accountsWithSpecificContainers = self->_accountsWithSpecificContainers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountsWithSpecificContainers, CFSTR("accountsWithSpecificContainers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_calendarDataContainerURL, CFSTR("calendarDataContainerURL"));

}

- (id)containerForAccountIdentifier:(id)a3
{
  NSURL *v4;
  NSURL *calendarDataContainerURL;
  NSURL *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_accountsWithSpecificContainers, "objectForKeyedSubscript:", a3);
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  calendarDataContainerURL = v4;
  if (!v4)
    calendarDataContainerURL = self->_calendarDataContainerURL;
  v6 = calendarDataContainerURL;

  return v6;
}

- (id)personaForAccountIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_accountsWithSpecificContainers, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_personaIDsByContainer, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accountUsesDataSeparatedContainer:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKeyedSubscript:](self->_accountsWithSpecificContainers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)containerInfoForAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMockCalendarDataContainerProvider containerInfoForAccountIdentifier:](self, "containerInfoForAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)containerInfoForAccountIdentifier:(id)a3
{
  id v4;
  CalMockCalendarDataContainerInfo *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a3;
  v5 = objc_alloc_init(CalMockCalendarDataContainerInfo);
  -[CalMockCalendarDataContainerInfo setAccountID:](v5, "setAccountID:", v4);
  -[CalMockCalendarDataContainerProvider personaForAccountIdentifier:](self, "personaForAccountIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMockCalendarDataContainerInfo setPersonaID:](v5, "setPersonaID:", v6);

  -[CalMockCalendarDataContainerProvider containerForAccountIdentifier:](self, "containerForAccountIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMockCalendarDataContainerInfo setContainerURL:](v5, "setContainerURL:", v7);

  v8 = -[CalMockCalendarDataContainerProvider accountUsesDataSeparatedContainer:](self, "accountUsesDataSeparatedContainer:", v4);
  -[CalMockCalendarDataContainerInfo setUsesDataSeparatedContainer:](v5, "setUsesDataSeparatedContainer:", v8);
  return v5;
}

- (id)containerInfoForPersonaIdentifier:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  CalMockCalendarDataContainerInfo *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_accountsWithSpecificContainers;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CalMockCalendarDataContainerProvider personaForAccountIdentifier:](self, "personaForAccountIdentifier:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToString:", v11) & 1) != 0)
        {
          -[CalMockCalendarDataContainerProvider containerInfoForAccountIdentifier:](self, "containerInfoForAccountIdentifier:", v10);
          v12 = (CalMockCalendarDataContainerInfo *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = objc_alloc_init(CalMockCalendarDataContainerInfo);
  -[CalMockCalendarDataContainerInfo setPersonaID:](v12, "setPersonaID:", v4);
  -[CalMockCalendarDataContainerInfo setContainerURL:](v12, "setContainerURL:", self->_calendarDataContainerURL);
  -[CalMockCalendarDataContainerInfo setUsesDataSeparatedContainer:](v12, "setUsesDataSeparatedContainer:", 0);
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSURL hash](self->_calendarDataContainerURL, "hash");
  v4 = -[NSDictionary hash](self->_accountsWithSpecificContainers, "hash") + v3;
  return v4 + -[NSDictionary hash](self->_personaIDsByContainer, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSURL isEqual:](self->_calendarDataContainerURL, "isEqual:", v5[1])
      && -[NSDictionary isEqual:](self->_accountsWithSpecificContainers, "isEqual:", v5[2]))
    {
      v6 = -[NSDictionary isEqual:](self->_personaIDsByContainer, "isEqual:", v5[3]);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIDsByContainer, 0);
  objc_storeStrong((id *)&self->_accountsWithSpecificContainers, 0);
  objc_storeStrong((id *)&self->_calendarDataContainerURL, 0);
}

@end
