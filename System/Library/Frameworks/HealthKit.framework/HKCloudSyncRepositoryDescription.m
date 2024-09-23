@implementation HKCloudSyncRepositoryDescription

- (HKCloudSyncRepositoryDescription)initWithIdentifier:(id)a3 primaryContainerDescription:(id)a4 secondaryContainerDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKCloudSyncRepositoryDescription *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  HKCloudSyncContainerDescription *primaryContainerDescription;
  uint64_t v16;
  NSArray *secondaryContainerDescriptions;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCloudSyncRepositoryDescription;
  v11 = -[HKCloudSyncRepositoryDescription init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    primaryContainerDescription = v11->_primaryContainerDescription;
    v11->_primaryContainerDescription = (HKCloudSyncContainerDescription *)v14;

    v16 = objc_msgSend(v10, "copy");
    secondaryContainerDescriptions = v11->_secondaryContainerDescriptions;
    v11->_secondaryContainerDescriptions = (NSArray *)v16;

  }
  return v11;
}

- (NSString)fullDescription
{
  __CFString *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_primaryContainerDescription)
  {
    -[HKCloudSyncRepositoryDescription _descriptionForContainer:](self, "_descriptionForContainer:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E37FD4C0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_secondaryContainerDescriptions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[HKCloudSyncRepositoryDescription _descriptionForContainer:](self, "_descriptionForContainer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v9, v10, (_QWORD)v12);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (id)_descriptionForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Container ID: %@, Device ID: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v4;
  objc_msgSend(v4, "databaseDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[HKCloudSyncRepositoryDescription _descriptionForDatabase:indentCount:](self, "_descriptionForDatabase:indentCount:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v14, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_descriptionForDatabase:(id)a3 indentCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Scope: %@ "), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v6;
  objc_msgSend(v6, "zoneDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v20 = a4;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = a4 + 1;
    do
    {
      v15 = 0;
      v16 = v9;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        -[HKCloudSyncRepositoryDescription _descriptionForZone:indentCount:](self, "_descriptionForZone:indentCount:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v16, v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v9;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "hk_stringIndentedBy:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_descriptionForZone:(id)a3 indentCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "zoneIDDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerParticipantDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherParticipantsDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, Type: %@ \nOwner Participant: %@ \nOther Participants: %@ \n"), v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = v6;
  objc_msgSend(v6, "recordDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v25 = a4;
  if (v15)
  {
    v16 = v15;
    v17 = a4;
    v18 = *(_QWORD *)v28;
    v19 = v17 + 1;
    do
    {
      v20 = 0;
      v21 = v13;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v14);
        -[HKCloudSyncRepositoryDescription _descriptionForRecord:indentCount:](self, "_descriptionForRecord:indentCount:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20), v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v21, v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v20;
        v21 = v13;
      }
      while (v16 != v20);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "hk_stringIndentedBy:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_descriptionForRecord:(id)a3 indentCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "recordIDDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schemaVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_stringIndentedBy:", a4 + 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, Schema: %@, Mod Date: %@ \n%@"), v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = v6;
  objc_msgSend(v6, "childRecordDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v25 = a4;
  if (v15)
  {
    v16 = v15;
    v17 = a4;
    v18 = *(_QWORD *)v28;
    v19 = v17 + 1;
    do
    {
      v20 = 0;
      v21 = v13;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v14);
        -[HKCloudSyncRepositoryDescription _descriptionForRecord:indentCount:](self, "_descriptionForRecord:indentCount:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20), v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v21, v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v20;
        v21 = v13;
      }
      while (v16 != v20);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "hk_stringIndentedBy:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryContainerDescription, CFSTR("PrimaryContainerDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryContainerDescriptions, CFSTR("SecondaryContainerDescriptions"));

}

- (HKCloudSyncRepositoryDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKCloudSyncRepositoryDescription *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryContainerDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SecondaryContainerDescriptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKCloudSyncRepositoryDescription initWithIdentifier:primaryContainerDescription:secondaryContainerDescriptions:](self, "initWithIdentifier:primaryContainerDescription:secondaryContainerDescriptions:", v5, v6, v10);
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HKCloudSyncContainerDescription)primaryContainerDescription
{
  return self->_primaryContainerDescription;
}

- (NSArray)secondaryContainerDescriptions
{
  return self->_secondaryContainerDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryContainerDescriptions, 0);
  objc_storeStrong((id *)&self->_primaryContainerDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
