@implementation CAMLibrarySelectionIdentity

+ (id)identityWithPerson:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contactID");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "librarySelectionMockAutomationModeEnabled");

  if (v7)
  {
    v8 = CFSTR("mockContactID");
    if (v5)
      v8 = v5;
    v9 = v8;

    v5 = v9;
LABEL_6:
    v10 = 0;
    if (-[__CFString length](v5, "length"))
      goto LABEL_12;
    goto LABEL_9;
  }
  if (v5)
    goto LABEL_6;
  v10 = 1;
LABEL_9:
  v11 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = v4;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Person has unresolved contactID: %{private}@", buf, 0xCu);
  }

LABEL_12:
  v12 = objc_alloc((Class)a1);
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v15 = (void *)objc_msgSend(v12, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v13, v14, 0);
  }
  else
  {
    v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v13, v14, v16);

  }
  return v15;
}

+ (id)identityWithPhotosIdentity:(id)a3
{
  id v3;
  CAMLibrarySelectionIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  CAMLibrarySelectionIdentity *v8;

  v3 = a3;
  v4 = [CAMLibrarySelectionIdentity alloc];
  objc_msgSend(v3, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CAMLibrarySelectionIdentity initWithPhoneNumber:emailAddress:contactIdentifiers:](v4, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v5, v6, v7);
  return v8;
}

- (CAMLibrarySelectionIdentity)initWithPhoneNumber:(id)a3 emailAddress:(id)a4 contactIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  CAMLibrarySelectionIdentity *v11;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSString *emailAddress;
  uint64_t v16;
  NSArray *contactIdentifiers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CAMLibrarySelectionIdentity;
  v11 = -[CAMLibrarySelectionIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    phoneNumber = v11->_phoneNumber;
    v11->_phoneNumber = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    emailAddress = v11->_emailAddress;
    v11->_emailAddress = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    contactIdentifiers = v11->_contactIdentifiers;
    v11->_contactIdentifiers = (NSArray *)v16;

  }
  return v11;
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
  CAMLibrarySelectionIdentityDescription(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CAMLibrarySelectionIdentity *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (CAMLibrarySelectionIdentity *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CAMLibrarySelectionIdentity phoneNumber](self, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[CAMLibrarySelectionIdentity phoneNumber](v5, "phoneNumber"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[CAMLibrarySelectionIdentity phoneNumber](self, "phoneNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMLibrarySelectionIdentity phoneNumber](v5, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if (v6)
        {

          if (!v9)
            goto LABEL_19;
        }
        else
        {

          if ((v9 & 1) == 0)
            goto LABEL_19;
        }
      }
      -[CAMLibrarySelectionIdentity emailAddress](self, "emailAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[CAMLibrarySelectionIdentity emailAddress](v5, "emailAddress");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_14:
          -[CAMLibrarySelectionIdentity contactIdentifiers](self, "contactIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[CAMLibrarySelectionIdentity contactIdentifiers](v5, "contactIdentifiers"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[CAMLibrarySelectionIdentity contactIdentifiers](self, "contactIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAMLibrarySelectionIdentity contactIdentifiers](v5, "contactIdentifiers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v16, "isEqualToArray:", v17);

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            v10 = 1;
          }

          goto LABEL_23;
        }
      }
      -[CAMLibrarySelectionIdentity emailAddress](self, "emailAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMLibrarySelectionIdentity emailAddress](v5, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v11)
      {

        if (v14)
          goto LABEL_14;
      }
      else
      {

        if ((v14 & 1) != 0)
          goto LABEL_14;
      }
    }
LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CAMLibrarySelectionIdentity phoneNumber](self, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[CAMLibrarySelectionIdentity phoneNumber](self, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash") + 31;

  }
  else
  {
    v6 = 1;
  }
  -[CAMLibrarySelectionIdentity emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[CAMLibrarySelectionIdentity emailAddress](self, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "hash") - v6 + 32 * v6;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CAMLibrarySelectionIdentity contactIdentifiers](self, "contactIdentifiers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "hash") - v6 + 32 * v6;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAMLibrarySelectionIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  CAMLibrarySelectionIdentity *v8;

  v4 = [CAMLibrarySelectionIdentity alloc];
  -[CAMLibrarySelectionIdentity phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionIdentity emailAddress](self, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionIdentity contactIdentifiers](self, "contactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMLibrarySelectionIdentity initWithPhoneNumber:emailAddress:contactIdentifiers:](v4, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v5, v6, v7);

  return v8;
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

+ (id)identityWithDevice:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "librarySelectionMockAutomationModeEnabled");

  if (v7)
  {
    v8 = CFSTR("mockContactID");
    if (v5)
      v8 = v5;
    v9 = v8;

    v5 = v9;
LABEL_6:
    v10 = 0;
    if (-[__CFString length](v5, "length"))
      goto LABEL_12;
    goto LABEL_9;
  }
  if (v5)
    goto LABEL_6;
  v10 = 1;
LABEL_9:
  v11 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = v4;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Device has unresolved contactID: %{private}@", buf, 0xCu);
  }

LABEL_12:
  v12 = objc_alloc((Class)a1);
  objc_msgSend(v4, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v15 = (void *)objc_msgSend(v12, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v13, v14, 0);
  }
  else
  {
    v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v13, v14, v16);

  }
  return v15;
}

@end
