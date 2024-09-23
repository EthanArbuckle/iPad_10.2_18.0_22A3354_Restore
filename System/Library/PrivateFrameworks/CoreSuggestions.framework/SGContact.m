@implementation SGContact

- (SGContact)initWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SGContact *v23;
  uint64_t v24;
  SGRecordId *recordId;
  uint64_t v26;
  SGName *name;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SGDateComponents *birthday;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSString *photoPath;
  uint64_t v48;
  _PASCachedResult *cachedDetailForRecordIdMap;
  id v51;
  objc_super v52;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v51 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v52.receiver = self;
  v52.super_class = (Class)SGContact;
  v23 = -[SGContact init](&v52, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    recordId = v23->_recordId;
    v23->_recordId = (SGRecordId *)v24;

    v26 = objc_msgSend(v17, "copy");
    name = v23->_name;
    v23->_name = (SGName *)v26;

    v28 = objc_msgSend(v18, "copy");
    v29 = v18;
    v30 = v17;
    v31 = v16;
    v32 = (void *)v28;
    v33 = (void *)MEMORY[0x1E0C9AA60];
    if (v28)
      v34 = (void *)v28;
    else
      v34 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v23->_emailAddresses, v34);

    v35 = objc_msgSend(v51, "copy");
    v36 = (void *)v35;
    if (v35)
      v37 = (void *)v35;
    else
      v37 = v33;
    objc_storeStrong((id *)&v23->_phones, v37);

    v38 = objc_msgSend(v19, "copy");
    v39 = (void *)v38;
    if (v38)
      v40 = (void *)v38;
    else
      v40 = v33;
    objc_storeStrong((id *)&v23->_postalAddresses, v40);

    v41 = objc_msgSend(v21, "copy");
    birthday = v23->_birthday;
    v23->_birthday = (SGDateComponents *)v41;

    v43 = objc_msgSend(v20, "copy");
    v44 = (void *)v43;
    if (v43)
      v45 = (void *)v43;
    else
      v45 = v33;
    objc_storeStrong((id *)&v23->_socialProfiles, v45);

    v16 = v31;
    v17 = v30;
    v18 = v29;
    v23->_significance = 0;
    v46 = objc_msgSend(v22, "copy");
    photoPath = v23->_photoPath;
    v23->_photoPath = (NSString *)v46;

    v48 = objc_opt_new();
    cachedDetailForRecordIdMap = v23->_cachedDetailForRecordIdMap;
    v23->_cachedDetailForRecordIdMap = (_PASCachedResult *)v48;

  }
  return v23;
}

- (SGContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  SGContact *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A8583A40]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v30 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("emailAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1A8583A40]();
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v28 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("phones"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1A8583A40]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v27 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("postalAddresses"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1A8583A40]();
  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19 = objc_opt_class();
  v25 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("socialProfiles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("birthday"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoPath"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SGContact initWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:](self, "initWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v5, v29, v9, v13, v26, v20, v21, v22);

  if (v23)
    v23->_significance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("significance"));

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  SGRecordId *recordId;
  id v5;

  recordId = self->_recordId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordId, CFSTR("recordId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phones, CFSTR("phones"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddresses, CFSTR("postalAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfiles, CFSTR("socialProfiles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthday, CFSTR("birthday"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoPath, CFSTR("photoPath"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_significance, CFSTR("significance"));

}

- (BOOL)isEqual:(id)a3
{
  SGContact *v4;
  SGContact *v5;
  BOOL v6;

  v4 = (SGContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGContact isEqualToContact:](self, "isEqualToContact:", v5);

  return v6;
}

- (BOOL)isEqualToContact:(id)a3
{
  id *v4;
  id *v5;
  SGRecordId *recordId;
  SGRecordId *v7;
  SGRecordId *v8;
  SGRecordId *v9;
  BOOL v10;
  SGName *name;
  SGName *v12;
  SGName *v13;
  SGName *v14;
  BOOL v15;
  NSArray *emailAddresses;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  NSArray *phones;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  char v25;
  NSArray *postalAddresses;
  NSArray *v27;
  NSArray *v28;
  NSArray *v29;
  char v30;
  NSArray *socialProfiles;
  NSArray *v32;
  NSArray *v33;
  NSArray *v34;
  char v35;
  SGDateComponents *birthday;
  SGDateComponents *v37;
  SGDateComponents *v38;
  SGDateComponents *v39;
  BOOL v40;
  NSString *photoPath;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  char v45;
  BOOL v46;
  unint64_t significance;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_32;
  recordId = self->_recordId;
  v7 = (SGRecordId *)v4[3];
  if (recordId == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = recordId;
    v10 = -[SGRecordId isEqual:](v9, "isEqual:", v8);

    if (!v10)
      goto LABEL_32;
  }
  name = self->_name;
  v12 = (SGName *)v5[4];
  if (name == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = name;
    v15 = -[SGName isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_32;
  }
  emailAddresses = self->_emailAddresses;
  v17 = (NSArray *)v5[5];
  if (emailAddresses == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = emailAddresses;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_32;
  }
  phones = self->_phones;
  v22 = (NSArray *)v5[6];
  if (phones == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = phones;
    v25 = -[NSArray isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_32;
  }
  postalAddresses = self->_postalAddresses;
  v27 = (NSArray *)v5[7];
  if (postalAddresses == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = postalAddresses;
    v30 = -[NSArray isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_32;
  }
  socialProfiles = self->_socialProfiles;
  v32 = (NSArray *)v5[8];
  if (socialProfiles == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = socialProfiles;
    v35 = -[NSArray isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_32;
  }
  birthday = self->_birthday;
  v37 = (SGDateComponents *)v5[9];
  if (birthday == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = birthday;
    v40 = -[SGDateComponents isEqual:](v39, "isEqual:", v38);

    if (!v40)
      goto LABEL_32;
  }
  photoPath = self->_photoPath;
  v42 = (NSString *)v5[10];
  if (photoPath == v42)
  {

    goto LABEL_35;
  }
  v43 = v42;
  v44 = photoPath;
  v45 = -[NSString isEqual:](v44, "isEqual:", v43);

  if ((v45 & 1) != 0)
  {
LABEL_35:
    significance = self->_significance;
    v46 = significance == objc_msgSend(v5, "significance");
    goto LABEL_33;
  }
LABEL_32:
  v46 = 0;
LABEL_33:

  return v46;
}

- (unint64_t)hash
{
  return -[SGRecordId hash](self->_recordId, "hash");
}

- (id)addresses
{
  return self->_postalAddresses;
}

- (unint64_t)richness
{
  SGName *name;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  name = self->_name;
  v4 = -[NSArray count](self->_emailAddresses, "count");
  if (name)
    v5 = (v4 != 0) + 1;
  else
    v5 = v4 != 0;
  if (-[NSArray count](self->_phones, "count"))
    v6 = v5 + 1;
  else
    v6 = v5;
  if (self->_birthday)
    v7 = v6 + 1;
  else
    v7 = v6;
  if (-[NSArray count](self->_postalAddresses, "count"))
    return v7 + 1;
  else
    return v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGContact recordId:%@\n name='%@'\n  emails: %@\n  phones: %@\n  postal addresses: %@\n  social profiles: %@\n  birthday: %@\n  photo: %@\n significance: %lu\n>"), self->_recordId, self->_name, self->_emailAddresses, self->_phones, self->_postalAddresses, self->_socialProfiles, self->_birthday, self->_photoPath, self->_significance);
}

- (BOOL)containsSuggestions
{
  void *v3;
  BOOL v4;

  -[SGContact name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[SGContact containsDetailSuggestions](self, "containsDetailSuggestions");

  return v4;
}

- (BOOL)containsDetailSuggestions
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SGContact emailAddresses](self, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[SGContact phones](self, "phones");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[SGContact postalAddresses](self, "postalAddresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 1;
      }
      else
      {
        -[SGContact birthday](self, "birthday");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[SGContact photoPath](self, "photoPath");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 1;
          }
          else
          {
            -[SGContact socialProfiles](self, "socialProfiles");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v9, "count") != 0;

          }
        }

      }
    }

  }
  return v4;
}

- (id)detailForRecordId:(id)a3
{
  _PASCachedResult *cachedDetailForRecordIdMap;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  cachedDetailForRecordIdMap = self->_cachedDetailForRecordIdMap;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__SGContact_detailForRecordId___block_invoke;
  v8[3] = &unk_1E4762778;
  v8[4] = self;
  v4 = a3;
  -[_PASCachedResult resultNonnullWithBlock:](cachedDetailForRecordIdMap, "resultNonnullWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateDetailsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *socialProfiles;
  NSArray *phones;
  NSArray *emailAddresses;
  NSArray *postalAddresses;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *context;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[4];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  context = (void *)MEMORY[0x1A8583A40]();
  socialProfiles = (NSArray *)MEMORY[0x1E0C9AA60];
  emailAddresses = self->_emailAddresses;
  phones = self->_phones;
  if (!phones)
    phones = (NSArray *)MEMORY[0x1E0C9AA60];
  if (!emailAddresses)
    emailAddresses = (NSArray *)MEMORY[0x1E0C9AA60];
  v34[0] = phones;
  v34[1] = emailAddresses;
  postalAddresses = self->_postalAddresses;
  if (!postalAddresses)
    postalAddresses = (NSArray *)MEMORY[0x1E0C9AA60];
  if (self->_socialProfiles)
    socialProfiles = self->_socialProfiles;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v34[2] = postalAddresses;
  v34[3] = socialProfiles;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4, self);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v9)
  {
    v10 = v9;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A8583A40]();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              v20 = (void *)MEMORY[0x1A8583A40]();
              v4[2](v4, v19);
              objc_autoreleasePoolPop(v20);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v16);
        }

        objc_autoreleasePoolPop(v13);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v10);
  }

  if (*(_QWORD *)(v21 + 72))
    ((void (*)(void (**)(id, _QWORD)))v4[2])(v4);
  objc_autoreleasePoolPop(context);

}

- (BOOL)hasNonTrivialInfo
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[SGContact name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[SGContact phones](self, "phones");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 1;
    }
    else
    {
      -[SGContact postalAddresses](self, "postalAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "count") != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cnContact
{
  return 0;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (SGName)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setPhones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPostalAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setSocialProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SGDateComponents)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)photoPath
{
  return self->_photoPath;
}

- (unint64_t)significance
{
  return self->_significance;
}

- (void)setSignificance:(unint64_t)a3
{
  self->_significance = a3;
}

- (unint64_t)significanceOrigin
{
  return self->_significanceOrigin;
}

- (void)setSignificanceOrigin:(unint64_t)a3
{
  self->_significanceOrigin = a3;
}

- (int)updatedFields
{
  return self->_updatedFields;
}

- (void)setUpdatedFields:(int)a3
{
  self->_updatedFields = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_cachedDetailForRecordIdMap, 0);
}

id __31__SGContact_detailForRecordId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = (void *)MEMORY[0x1A8583A40]();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__SGContact_detailForRecordId___block_invoke_2;
  v8[3] = &unk_1E4762750;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateDetailsWithBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_autoreleasePoolPop(v2);
  return v6;
}

void __31__SGContact_detailForRecordId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "recordId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8
{
  return (SGContact *)objc_msgSend(a1, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", a3, a4, a5, a6, a7, a8, 0, 0);
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7 socialProfiles:(id)a8 birthday:(id)a9 photoPath:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SGContact *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[SGContact initWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:]([SGContact alloc], "initWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v23, v22, v21, v20, v19, v18, v17, v16);

  return v24;
}

+ (SGContact)contactWithId:(id)a3 name:(id)a4 emailAddresses:(id)a5 phones:(id)a6 postalAddresses:(id)a7
{
  return (SGContact *)objc_msgSend(a1, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:", a3, a4, a5, a6, a7, MEMORY[0x1E0C9AA60]);
}

@end
