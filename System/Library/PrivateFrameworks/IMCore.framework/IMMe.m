@implementation IMMe

- (void)setCNContact:(id)a3
{
  CNContact *v5;
  CNContact **p_cnContact;
  CNContact *cnContact;
  void *v8;
  CNContact *v9;

  v5 = (CNContact *)a3;
  cnContact = self->_cnContact;
  p_cnContact = &self->_cnContact;
  if (cnContact != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_cnContact, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMeChangedNotification"), 0);

    v5 = v9;
  }

}

- (void)rebuildIMHandles
{
  NSMutableArray *v3;
  NSMutableArray *cnIMHandles;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cnIMHandles = self->_cnIMHandles;
  self->_cnIMHandles = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccountsForService:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "login");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imHandleWithID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          -[NSMutableArray addObject:](self->_cnIMHandles, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (IMMe)init
{
  IMMe *v2;
  NSMutableArray *v3;
  NSMutableArray *cnIMHandles;
  NSMutableArray *v5;
  NSMutableArray *loginIMHandles;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMMe;
  v2 = -[IMMe init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cnIMHandles = v2->_cnIMHandles;
    v2->_cnIMHandles = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    loginIMHandles = v2->_loginIMHandles;
    v2->_loginIMHandles = v5;

  }
  return v2;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (BOOL)addLoginIMHandle:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_loginIMHandles, "containsObjectIdenticalTo:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_loginIMHandles, "addObject:", v4);

  return 1;
}

+ (id)me
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)qword_1ECF12490;
  if (!qword_1ECF12490)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1ECF12490;
    qword_1ECF12490 = (uint64_t)v4;

    if (qword_1ECF12490)
    {
      objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchMeContactWithKeys:", MEMORY[0x1E0C9AA60]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)qword_1ECF12490, "setCNContact:", v7);
      v3 = (void *)qword_1ECF12490;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (id)fallbackUserName
{
  return 0;
}

+ (id)firstNameFromFallbackUserName
{
  void *v2;
  void *v3;
  void *v4;

  +[IMMe fallbackUserName](IMMe, "fallbackUserName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imFirstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lastNameFromFallbackUserName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[IMMe fallbackUserName](IMMe, "fallbackUserName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeFirstObject");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)guid
{
  return (NSString *)CFSTR("me");
}

- (id)_imHandlesWithIDs:(id)a3 onAccount:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imHandleWithID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v7, "addObject:", v10);

      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }

  return v7;
}

- (void)resetABPerson
{
  NSString *cnFirstName;
  NSString *cnLastName;
  NSString *cnFullName;
  NSArray *cnEmails;
  NSString *cnNickname;
  id v8;

  cnFirstName = self->_cnFirstName;
  self->_cnFirstName = 0;

  cnLastName = self->_cnLastName;
  self->_cnLastName = 0;

  cnFullName = self->_cnFullName;
  self->_cnFullName = 0;

  cnEmails = self->_cnEmails;
  self->_cnEmails = 0;

  cnNickname = self->_cnNickname;
  self->_cnNickname = 0;

  -[IMMe rebuildIMHandles](self, "rebuildIMHandles");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMeChangedNotification"), 0);

}

- (BOOL)removeLoginIMHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[NSMutableArray containsObjectIdenticalTo:](self->_loginIMHandles, "containsObjectIdenticalTo:", v4))
  {
    -[NSMutableArray removeObject:](self->_loginIMHandles, "removeObject:", v4);
    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterIMHandle:", v4);

    +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeHandleFromCNIDMap:withCNID:", v4, v8);

  }
  return 1;
}

- (NSMutableArray)loginIMHandles
{
  return self->_loginIMHandles;
}

- (BOOL)addIMHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_cnIMHandles, "containsObjectIdenticalTo:", v4) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_cnIMHandles, "addObject:", v4);
    if ((objc_msgSend(v4, "hasLocation") & 1) == 0)
    {
      objc_msgSend(v4, "dependentIMHandles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      if (v6 >= 1)
      {
        v7 = v6 + 1;
        do
        {
          objc_msgSend(v5, "objectAtIndex:", (v7 - 2));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMMe addIMHandle:](self, "addIMHandle:", v8);

          --v7;
        }
        while (v7 > 1);
      }

    }
  }

  return 0;
}

- (BOOL)isIMHandleLoginIMHandle:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_loginIMHandles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v7 = 0;
  if (v6)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v7 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);

        objc_msgSend(v7, "service", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          objc_msgSend(v4, "ID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "equalID:andID:", v13, v14);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
    v11 = v7;
    v7 = 0;
LABEL_12:

  }
  return v6;
}

- (BOOL)removeIMHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if (-[NSMutableArray containsObjectIdenticalTo:](self->_cnIMHandles, "containsObjectIdenticalTo:", v4))
  {
    -[NSMutableArray removeObject:](self->_cnIMHandles, "removeObject:", v4);
    if ((objc_msgSend(v4, "hasLocation") & 1) == 0)
    {
      objc_msgSend(v4, "dependentIMHandles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      if (v6 >= 1)
      {
        v7 = v6 + 1;
        do
        {
          objc_msgSend(v5, "objectAtIndex:", (v7 - 2));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMMe removeIMHandle:](self, "removeIMHandle:", v8);

          --v7;
        }
        while (v7 > 1);
      }

    }
  }

  return 0;
}

- (NSString)nickname
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *cnNickname;
  NSString *v8;
  NSString *v9;

  -[IMMe cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D397A8];
    -[IMMe cnContact](self, "cnContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickNameForCNContact:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnNickname = self->_cnNickname;
    self->_cnNickname = v6;

  }
  if (!-[NSString length](self->_cnNickname, "length"))
  {
    -[IMMe firstName](self, "firstName");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cnNickname;
    self->_cnNickname = v8;

  }
  return self->_cnNickname;
}

- (NSString)firstName
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *cnFirstName;
  NSString *v8;
  NSString *v9;

  -[IMMe cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D397A8];
    -[IMMe cnContact](self, "cnContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstNameForCNContact:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnFirstName = self->_cnFirstName;
    self->_cnFirstName = v6;

  }
  v8 = self->_cnFirstName;
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    +[IMMe firstNameFromFallbackUserName](IMMe, "firstNameFromFallbackUserName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (NSArray)emails
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *cnEmails;

  if (!self->_cnEmails)
  {
    -[IMMe cnContact](self, "cnContact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0D397A8];
      -[IMMe cnContact](self, "cnContact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "emailsForCNContact:", v5);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      cnEmails = self->_cnEmails;
      self->_cnEmails = v6;

    }
  }
  return self->_cnEmails;
}

- (NSString)email
{
  void *v2;
  void *v3;

  -[IMMe emails](self, "emails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "__imFirstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)lastName
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *cnLastName;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  -[IMMe cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D397A8];
    -[IMMe cnContact](self, "cnContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastNameForCNContact:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnLastName = self->_cnLastName;
    self->_cnLastName = v6;

  }
  v8 = self->_cnLastName;
  if (!v8)
  {
    +[IMMe lastNameFromFallbackUserName](IMMe, "lastNameFromFallbackUserName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cnLastName;
    self->_cnLastName = v9;

    v8 = self->_cnLastName;
  }
  return v8;
}

- (NSString)fullName
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *cnFullName;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  -[IMMe cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D397A8];
    -[IMMe cnContact](self, "cnContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullNameForCNContact:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnFullName = self->_cnFullName;
    self->_cnFullName = v6;

  }
  v8 = self->_cnFullName;
  if (!v8)
  {
    +[IMMe fallbackUserName](IMMe, "fallbackUserName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cnFullName;
    self->_cnFullName = v9;

    v8 = self->_cnFullName;
  }
  if (-[NSString length](v8, "length"))
  {
    v11 = self->_cnFullName;
  }
  else
  {
    +[IMMe fallbackUserName](IMMe, "fallbackUserName");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (id)imHandleForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[IMMe me](IMMe, "me", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "service");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v3)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (IMHandle)bestIMHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestConnectedAccountForService:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bestActiveAccountForService:", 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    objc_msgSend(v4, "login");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imHandleWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMMe imHandles](self, "imHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMHandle bestIMHandleInArray:](IMHandle, "bestIMHandleInArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (IMHandle *)v7;
}

- (NSArray)imHandles
{
  return (NSArray *)-[NSMutableArray arrayByAddingObjectsFromArray:](self->_cnIMHandles, "arrayByAddingObjectsFromArray:", self->_loginIMHandles);
}

- (void)myPictureChanged
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMHandlePictureChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMePictureChangedNotification"), self);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMe cnContact](self, "cnContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> (CNContact: %@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCnContact:(id)a3
{
  objc_storeStrong((id *)&self->_cnContact, a3);
}

- (NSString)cnNickname
{
  return self->_cnNickname;
}

- (void)setCnNickname:(id)a3
{
  objc_storeStrong((id *)&self->_cnNickname, a3);
}

- (NSString)cnFirstName
{
  return self->_cnFirstName;
}

- (void)setCnFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_cnFirstName, a3);
}

- (NSString)cnFullName
{
  return self->_cnFullName;
}

- (void)setCnFullName:(id)a3
{
  objc_storeStrong((id *)&self->_cnFullName, a3);
}

- (NSString)cnLastName
{
  return self->_cnLastName;
}

- (void)setCnLastName:(id)a3
{
  objc_storeStrong((id *)&self->_cnLastName, a3);
}

- (NSArray)cnEmails
{
  return self->_cnEmails;
}

- (void)setCnEmails:(id)a3
{
  objc_storeStrong((id *)&self->_cnEmails, a3);
}

- (NSMutableArray)cnIMHandles
{
  return self->_cnIMHandles;
}

- (void)setCnIMHandles:(id)a3
{
  objc_storeStrong((id *)&self->_cnIMHandles, a3);
}

- (void)setLoginIMHandles:(id)a3
{
  objc_storeStrong((id *)&self->_loginIMHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginIMHandles, 0);
  objc_storeStrong((id *)&self->_cnIMHandles, 0);
  objc_storeStrong((id *)&self->_cnEmails, 0);
  objc_storeStrong((id *)&self->_cnLastName, 0);
  objc_storeStrong((id *)&self->_cnFullName, 0);
  objc_storeStrong((id *)&self->_cnFirstName, 0);
  objc_storeStrong((id *)&self->_cnNickname, 0);
  objc_storeStrong((id *)&self->_cnContact, 0);
}

@end
