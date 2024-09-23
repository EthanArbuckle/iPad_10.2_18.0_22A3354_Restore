@implementation EKParticipantToContactMatcher

- (EKParticipantToContactMatcher)initWithContacts:(id)a3
{
  id v5;
  EKParticipantToContactMatcher *v6;
  EKParticipantToContactMatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKParticipantToContactMatcher;
  v6 = -[EKParticipantToContactMatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contacts, a3);
    -[EKParticipantToContactMatcher _cacheContactData](v7, "_cacheContactData");
  }

  return v7;
}

- (void)_cacheContactData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  EKParticipantToContactMatcher *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = self;
  -[EKParticipantToContactMatcher contacts](self, "contacts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    v7 = *MEMORY[0x1E0C966A8];
    v8 = *MEMORY[0x1E0C966D0];
    v29 = *MEMORY[0x1E0C966C0];
    v9 = *MEMORY[0x1E0C967B8];
    v30 = *MEMORY[0x1E0C966D0];
    v31 = *MEMORY[0x1E0C966A8];
    v28 = *MEMORY[0x1E0C967B8];
    do
    {
      v10 = 0;
      v33 = v5;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isKeyAvailable:", v7))
        {
          v12 = v6;
          objc_msgSend(v11, "emailAddresses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "valueForKey:", CFSTR("value"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v36 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "lowercaseString");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v16);
          }

          v6 = v12;
          v8 = v30;
          v7 = v31;
          v5 = v33;
          v9 = v28;
        }
        if (objc_msgSend(v11, "isKeyAvailable:", v8)
          && objc_msgSend(v11, "isKeyAvailable:", v29))
        {
          objc_msgSend((id)objc_opt_class(), "_nameComponentsForContact:reverse:", v11, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v27, "addObject:", v20);
          objc_msgSend((id)objc_opt_class(), "_nameComponentsForContact:reverse:", v11, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v27, "addObject:", v21);

        }
        if (objc_msgSend(v11, "isKeyAvailable:", v9))
        {
          objc_msgSend(v11, "organizationName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            objc_msgSend(v11, "organizationName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lowercaseString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v25);

          }
        }
        ++v10;
      }
      while (v10 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  -[EKParticipantToContactMatcher setContactEmailAddresses:](v32, "setContactEmailAddresses:", v3);
  -[EKParticipantToContactMatcher setContactNameComponents:](v32, "setContactNameComponents:", v27);
  -[EKParticipantToContactMatcher setContactCompanyNames:](v32, "setContactCompanyNames:", v26);

}

+ (id)_nameComponentsForContact:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "givenName");
  }
  else
  {
    objc_msgSend(v6, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "familyName");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_nameComponentsWithGivenName:familyName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_nameComponentsWithGivenName:(id)a3 familyName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v5, "lowercaseString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_1E4789A58;
    objc_msgSend(v7, "setGivenName:", v10);

    objc_msgSend(v6, "lowercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1E4789A58;
    objc_msgSend(v7, "setFamilyName:", v13);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_allParticipantsOnItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "organizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  return v6;
}

- (BOOL)anyContactMatchesAnyParticipantFromItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_allParticipantsOnItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[EKParticipantToContactMatcher anyContactMatchesAnyParticipant:](self, "anyContactMatchesAnyParticipant:", v5);
  return (char)self;
}

- (BOOL)anyContactMatchesAnyParticipant:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[EKParticipantToContactMatcher anyContactMatchesParticipant:](self, "anyContactMatchesParticipant:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)matchingParticipantsFromItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_allParticipantsOnItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKParticipantToContactMatcher matchingParticipantsFromParticipants:](self, "matchingParticipantsFromParticipants:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)matchingParticipantsFromParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[EKParticipantToContactMatcher anyContactMatchesParticipant:](self, "anyContactMatchesParticipant:", v11, (_QWORD)v13))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)anyContactMatchesParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v4, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKParticipantToContactMatcher contactEmailAddresses](self, "contactEmailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (!v9)
  {
    objc_msgSend(v5, "nameComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_class();
    objc_msgSend(v10, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_nameComponentsWithGivenName:familyName:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKParticipantToContactMatcher contactNameComponents](self, "contactNameComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v14);

    if ((v17 & 1) != 0)
    {

      goto LABEL_5;
    }
    objc_msgSend(v5, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKParticipantToContactMatcher contactCompanyNames](self, "contactCompanyNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v21, "containsObject:", v20);

    if ((v19 & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
LABEL_5:

LABEL_6:
  v18 = 1;
LABEL_9:

  return v18;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSSet)contactEmailAddresses
{
  return self->_contactEmailAddresses;
}

- (void)setContactEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_contactEmailAddresses, a3);
}

- (NSSet)contactNameComponents
{
  return self->_contactNameComponents;
}

- (void)setContactNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_contactNameComponents, a3);
}

- (NSSet)contactCompanyNames
{
  return self->_contactCompanyNames;
}

- (void)setContactCompanyNames:(id)a3
{
  objc_storeStrong((id *)&self->_contactCompanyNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCompanyNames, 0);
  objc_storeStrong((id *)&self->_contactNameComponents, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
