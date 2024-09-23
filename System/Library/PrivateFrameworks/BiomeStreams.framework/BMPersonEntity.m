@implementation BMPersonEntity

- (BMPersonEntity)initWithNames:(id)a3 customId:(id)a4 contactId:(id)a5 emailAddresses:(id)a6 addresses:(id)a7 phoneNumbers:(id)a8 socialMediaHandles:(id)a9 attributes:(id)a10
{
  id v17;
  BMPersonEntity *v18;
  BMPersonEntity *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMPersonEntity;
  v18 = -[BMPersonEntity init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_names, a3);
    objc_storeStrong((id *)&v19->_customId, a4);
    objc_storeStrong((id *)&v19->_contactId, a5);
    objc_storeStrong((id *)&v19->_emailAddresses, a6);
    objc_storeStrong((id *)&v19->_addresses, a7);
    objc_storeStrong((id *)&v19->_phoneNumbers, a8);
    objc_storeStrong((id *)&v19->_socialMediaHandles, a9);
    objc_storeStrong((id *)&v19->_attributes, a10);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *customId;
  void *v7;
  NSString *contactId;
  void *v9;
  NSArray *names;
  void *v11;
  NSArray *emailAddresses;
  void *v13;
  NSArray *phoneNumbers;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  NSArray *socialMediaHandles;
  NSArray *addresses;
  void *v20;
  _BOOL4 v21;
  NSDictionary *attributes;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    customId = self->_customId;
    objc_msgSend(v5, "customId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", customId, v7))
    {
      contactId = self->_contactId;
      objc_msgSend(v5, "contactId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", contactId, v9))
      {
        names = self->_names;
        objc_msgSend(v5, "names");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", names, v11))
        {
          emailAddresses = self->_emailAddresses;
          objc_msgSend(v5, "emailAddresses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", emailAddresses, v13))
          {
            phoneNumbers = self->_phoneNumbers;
            objc_msgSend(v5, "phoneNumbers");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = phoneNumbers;
            v17 = (void *)v15;
            if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", v16, v15))
            {
              v27 = v17;
              socialMediaHandles = self->_socialMediaHandles;
              objc_msgSend(v5, "socialMediaHandles");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", socialMediaHandles))
              {
                addresses = self->_addresses;
                objc_msgSend(v5, "addresses");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = +[BMEntityRelationshipEventUtilities checkNullableArrayEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableArrayEqualityForSource:target:", addresses);
                v17 = v27;
                if (v21)
                {
                  attributes = self->_attributes;
                  objc_msgSend(v5, "attributes");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableDictionaryEqualityForSource:target:", attributes, v23);

                }
                else
                {
                  v24 = 0;
                }

              }
              else
              {
                v24 = 0;
              }

            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }

        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMPersonEntity proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPersonEntity)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  BMPersonName *v14;
  BMPersonEntity *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  BMSocialMediaHandle *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  BMPersonEntity *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v46 = self;
    v47 = v4;
    v5 = v4;
    if (objc_msgSend(v5, "namesCount"))
    {
      v6 = (void *)objc_opt_new();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      objc_msgSend(v5, "names");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v58 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x193FECFB4]();
            v14 = -[BMPersonName initWithProto:]([BMPersonName alloc], "initWithProto:", v12);
            if (v14)
              objc_msgSend(v6, "addObject:", v14);

            objc_autoreleasePoolPop(v13);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v9);
      }

    }
    else
    {
      v6 = 0;
    }
    if (objc_msgSend(v5, "socialMediaHandlesCount"))
    {
      v16 = (void *)objc_opt_new();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v5, "socialMediaHandles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v54 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
            v23 = (void *)MEMORY[0x193FECFB4]();
            v24 = -[BMSocialMediaHandle initWithProto:]([BMSocialMediaHandle alloc], "initWithProto:", v22);
            if (v24)
              objc_msgSend(v16, "addObject:", v24);

            objc_autoreleasePoolPop(v23);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        }
        while (v19);
      }

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v25 = (void *)objc_opt_new();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v26 = v5;
      objc_msgSend(v5, "attributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v50;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v50 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
            objc_msgSend(v32, "value");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "key");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setValue:forKey:", v33, v34);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        }
        while (v29);
      }

      v5 = v26;
    }
    v48 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "customId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactId");
    v35 = v5;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "emailAddresses");
    v45 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addresses");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "phoneNumbers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v16, "copy");
    v41 = (void *)objc_msgSend(v25, "copy");
    v42 = (void *)v38;
    self = -[BMPersonEntity initWithNames:customId:contactId:emailAddresses:addresses:phoneNumbers:socialMediaHandles:attributes:](v46, "initWithNames:customId:contactId:emailAddresses:addresses:phoneNumbers:socialMediaHandles:attributes:", v48, v44, v36, v37, v38, v39, v40, v41);

    v15 = self;
    v4 = v47;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BMPersonEntity)initWithProtoData:(id)a3
{
  id v4;
  BMPBPersonEntity *v5;
  BMPersonEntity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPersonEntity initWithData:]([BMPBPersonEntity alloc], "initWithData:", v4);

    self = -[BMPersonEntity initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BMPersonEntity *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BMPersonEntity names](self, "names");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[BMPersonEntity names](self, "names");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v55;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v55 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v10), "proto");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setNames:", v12);

  }
  -[BMPersonEntity socialMediaHandles](self, "socialMediaHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[BMPersonEntity socialMediaHandles](self, "socialMediaHandles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v19), "proto");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setSocialMediaHandles:", v21);

  }
  -[BMPersonEntity attributes](self, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v44 = v3;
    v23 = (void *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[BMPersonEntity attributes](self, "attributes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v47;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x193FECFB4]();
          v30 = (void *)objc_opt_new();
          objc_msgSend(v30, "setKey:", v28);
          -[BMPersonEntity attributes](self, "attributes");
          v31 = self;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setValue:", v33);

          self = v31;
          objc_msgSend(v23, "addObject:", v30);

          objc_autoreleasePoolPop(v29);
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v25);
    }

    v34 = (void *)objc_msgSend(v23, "copy");
    v3 = v44;
    objc_msgSend(v44, "setAttributes:", v34);

  }
  -[BMPersonEntity customId](self, "customId", v44);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomId:", v35);

  -[BMPersonEntity contactId](self, "contactId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactId:", v36);

  -[BMPersonEntity emailAddresses](self, "emailAddresses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");
  objc_msgSend(v3, "setEmailAddresses:", v38);

  -[BMPersonEntity addresses](self, "addresses");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");
  objc_msgSend(v3, "setAddresses:", v40);

  -[BMPersonEntity phoneNumbers](self, "phoneNumbers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");
  objc_msgSend(v3, "setPhoneNumbers:", v42);

  return v3;
}

- (NSArray)names
{
  return self->_names;
}

- (NSString)customId
{
  return self->_customId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)socialMediaHandles
{
  return self->_socialMediaHandles;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_socialMediaHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_customId, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end
