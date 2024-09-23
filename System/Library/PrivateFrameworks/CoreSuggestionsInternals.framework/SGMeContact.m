@implementation SGMeContact

- (BOOL)isSameAsOrUnifiedWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  CNContact *meContact;
  void *v9;

  v4 = a3;
  -[CNContact identifier](self->_meContact, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    meContact = self->_meContact;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContact isUnifiedWithContactWithIdentifier:](meContact, "isUnifiedWithContactWithIdentifier:", v9);

  }
  return v7;
}

- (SGMeContact)initWithContact:(id)a3
{
  id v5;
  SGMeContact *v6;
  uint64_t v7;
  NSString *givenName;
  uint64_t v9;
  NSString *familyName;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *formattedName;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  SGSocialProfileDetails *v44;
  void *v45;
  SGSocialProfileDetails *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  NSSet *emailAddresses;
  NSSet *v53;
  NSSet *phoneNumbers;
  NSSet *v55;
  NSSet *postalAddresses;
  NSSet *v57;
  NSSet *socialProfileIdentifiers;
  NSSet *v59;
  id v61;
  SGMeContact *v62;
  id v63;
  NSSet *v64;
  id obj;
  NSSet *v66;
  NSSet *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  objc_super v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v88.receiver = self;
  v88.super_class = (Class)SGMeContact;
  v6 = -[SGMeContact init](&v88, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "givenName");
    v7 = objc_claimAutoreleasedReturnValue();
    givenName = v6->_givenName;
    v6->_givenName = (NSString *)v7;

    objc_msgSend(v5, "familyName");
    v9 = objc_claimAutoreleasedReturnValue();
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v61 = a3;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v5, "givenName");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    formattedName = v6->_formattedName;
    v6->_formattedName = v13;

    v66 = (NSSet *)objc_opt_new();
    v67 = (NSSet *)objc_opt_new();
    v15 = objc_opt_new();
    v16 = (NSSet *)objc_opt_new();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v5, "emailAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v85 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeEmailAddress();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v66, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      }
      while (v19);
    }
    v64 = (NSSet *)v15;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v5, "phoneNumbers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v81 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizePhoneNumber();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v67, "addObject:", v31);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
      }
      while (v26);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v5, "postalAddresses");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v77 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * k), "value");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeCNAddress(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v64, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
      }
      while (v34);
    }
    v62 = v6;

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v63 = v5;
    objc_msgSend(v5, "socialProfiles");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v73;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v73 != v41)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
          v44 = [SGSocialProfileDetails alloc];
          objc_msgSend(v43, "value");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[SGSocialProfileDetails initWithCNSocialProfile:](v44, "initWithCNSocialProfile:", v45);

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          -[SGSocialProfileDetails uniqueIdentifiers](v46, "uniqueIdentifiers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v69;
            do
            {
              for (n = 0; n != v49; ++n)
              {
                if (*(_QWORD *)v69 != v50)
                  objc_enumerationMutation(v47);
                -[NSSet addObject:](v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * n));
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
            }
            while (v49);
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
      }
      while (v40);
    }

    v6 = v62;
    emailAddresses = v62->_emailAddresses;
    v62->_emailAddresses = v66;
    v53 = v66;

    phoneNumbers = v62->_phoneNumbers;
    v62->_phoneNumbers = v67;
    v55 = v67;

    postalAddresses = v62->_postalAddresses;
    v62->_postalAddresses = v64;
    v57 = v64;

    socialProfileIdentifiers = v62->_socialProfileIdentifiers;
    v62->_socialProfileIdentifiers = v16;
    v59 = v16;

    objc_storeStrong((id *)&v62->_meContact, v61);
    v5 = v63;
  }

  return v6;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSSet)postalAddresses
{
  return self->_postalAddresses;
}

- (NSSet)socialProfileIdentifiers
{
  return self->_socialProfileIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

+ (id)keysToFetch
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966D0];
  v8[0] = v2;
  v8[1] = v3;
  v4 = *MEMORY[0x1E0C966A8];
  v8[2] = *MEMORY[0x1E0C966C0];
  v8[3] = v4;
  v5 = *MEMORY[0x1E0C967F0];
  v8[4] = *MEMORY[0x1E0C967C0];
  v8[5] = v5;
  v8[6] = *MEMORY[0x1E0C96868];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
