@implementation CNiOSABUtilities

- (CNiOSABUtilities)initWithAddressBook:(void *)a3
{
  CNiOSABUtilities *v4;
  void *v5;
  CNiOSABUtilities *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNiOSABUtilities;
  v4 = -[CNiOSABUtilities init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (void *)CFRetain(a3);
    else
      v5 = 0;
    v4->_addressBook = v5;
    v6 = v4;
  }

  return v4;
}

- (id)allAccountIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_addressBook)
  {
    v2 = (void *)ABAddressBookCopyArrayOfAllAccounts();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (const void *)ABAccountCopyIdentifier();
          objc_msgSend(v3, "addObject:", v9, v11);
          if (v9)
            CFRelease(v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    if (v4)
      CFRelease(v4);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)filterPeople:(id)a3 matchingAccountIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const void *v14;
  ABRecordRef v15;
  const void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_addressBook)
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(const void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v15 = ABPersonCopySource(v14);
            v16 = (const void *)ABAddressBookCopyAccountIdentifierForSource();
            if (objc_msgSend(v7, "containsObject:", v16))
              objc_msgSend(v8, "addObject:", v14);
            if (v16)
              CFRelease(v16);
            if (v15)
              CFRelease(v15);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABUtilities;
  -[CNiOSABUtilities dealloc](&v4, sel_dealloc);
}

@end
