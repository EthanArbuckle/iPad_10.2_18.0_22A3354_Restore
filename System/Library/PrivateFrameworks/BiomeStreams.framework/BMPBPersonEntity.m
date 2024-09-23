@implementation BMPBPersonEntity

- (void)clearNames
{
  -[NSMutableArray removeAllObjects](self->_names, "removeAllObjects");
}

- (void)addNames:(id)a3
{
  id v4;
  NSMutableArray *names;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  names = self->_names;
  v8 = v4;
  if (!names)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_names;
    self->_names = v6;

    v4 = v8;
    names = self->_names;
  }
  -[NSMutableArray addObject:](names, "addObject:", v4);

}

- (unint64_t)namesCount
{
  return -[NSMutableArray count](self->_names, "count");
}

- (id)namesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_names, "objectAtIndex:", a3);
}

+ (Class)namesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCustomId
{
  return self->_customId != 0;
}

- (BOOL)hasContactId
{
  return self->_contactId != 0;
}

- (void)clearEmailAddresses
{
  -[NSMutableArray removeAllObjects](self->_emailAddresses, "removeAllObjects");
}

- (void)addEmailAddresses:(id)a3
{
  id v4;
  NSMutableArray *emailAddresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  emailAddresses = self->_emailAddresses;
  v8 = v4;
  if (!emailAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  -[NSMutableArray addObject:](emailAddresses, "addObject:", v4);

}

- (unint64_t)emailAddressesCount
{
  return -[NSMutableArray count](self->_emailAddresses, "count");
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_emailAddresses, "objectAtIndex:", a3);
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

- (void)clearAddresses
{
  -[NSMutableArray removeAllObjects](self->_addresses, "removeAllObjects");
}

- (void)addAddresses:(id)a3
{
  id v4;
  NSMutableArray *addresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  addresses = self->_addresses;
  v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_addresses;
    self->_addresses = v6;

    v4 = v8;
    addresses = self->_addresses;
  }
  -[NSMutableArray addObject:](addresses, "addObject:", v4);

}

- (unint64_t)addressesCount
{
  return -[NSMutableArray count](self->_addresses, "count");
}

- (id)addressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_addresses, "objectAtIndex:", a3);
}

+ (Class)addressesType
{
  return (Class)objc_opt_class();
}

- (void)clearPhoneNumbers
{
  -[NSMutableArray removeAllObjects](self->_phoneNumbers, "removeAllObjects");
}

- (void)addPhoneNumbers:(id)a3
{
  id v4;
  NSMutableArray *phoneNumbers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  v8 = v4;
  if (!phoneNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  -[NSMutableArray addObject:](phoneNumbers, "addObject:", v4);

}

- (unint64_t)phoneNumbersCount
{
  return -[NSMutableArray count](self->_phoneNumbers, "count");
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_phoneNumbers, "objectAtIndex:", a3);
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

- (void)clearSocialMediaHandles
{
  -[NSMutableArray removeAllObjects](self->_socialMediaHandles, "removeAllObjects");
}

- (void)addSocialMediaHandles:(id)a3
{
  id v4;
  NSMutableArray *socialMediaHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  socialMediaHandles = self->_socialMediaHandles;
  v8 = v4;
  if (!socialMediaHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_socialMediaHandles;
    self->_socialMediaHandles = v6;

    v4 = v8;
    socialMediaHandles = self->_socialMediaHandles;
  }
  -[NSMutableArray addObject:](socialMediaHandles, "addObject:", v4);

}

- (unint64_t)socialMediaHandlesCount
{
  return -[NSMutableArray count](self->_socialMediaHandles, "count");
}

- (id)socialMediaHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_socialMediaHandles, "objectAtIndex:", a3);
}

+ (Class)socialMediaHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearAttributes
{
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttributes:(id)a3
{
  id v4;
  NSMutableArray *attributes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attributes = self->_attributes;
  v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attributes;
    self->_attributes = v6;

    v4 = v8;
    attributes = self->_attributes;
  }
  -[NSMutableArray addObject:](attributes, "addObject:", v4);

}

- (unint64_t)attributesCount
{
  return -[NSMutableArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBPersonEntity;
  -[BMPBPersonEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBPersonEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *customId;
  NSString *contactId;
  NSMutableArray *emailAddresses;
  NSMutableArray *addresses;
  NSMutableArray *phoneNumbers;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
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
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_names, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_names, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = self->_names;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("names"));
  }
  customId = self->_customId;
  if (customId)
    objc_msgSend(v3, "setObject:forKey:", customId, CFSTR("customId"));
  contactId = self->_contactId;
  if (contactId)
    objc_msgSend(v3, "setObject:forKey:", contactId, CFSTR("contactId"));
  emailAddresses = self->_emailAddresses;
  if (emailAddresses)
    objc_msgSend(v3, "setObject:forKey:", emailAddresses, CFSTR("emailAddresses"));
  addresses = self->_addresses;
  if (addresses)
    objc_msgSend(v3, "setObject:forKey:", addresses, CFSTR("addresses"));
  phoneNumbers = self->_phoneNumbers;
  if (phoneNumbers)
    objc_msgSend(v3, "setObject:forKey:", phoneNumbers, CFSTR("phoneNumbers"));
  if (-[NSMutableArray count](self->_socialMediaHandles, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_socialMediaHandles, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = self->_socialMediaHandles;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("socialMediaHandles"));
  }
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = self->_attributes;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("attributes"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPersonEntityReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = self->_names;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }

  if (self->_customId)
    PBDataWriterWriteStringField();
  if (self->_contactId)
    PBDataWriterWriteStringField();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = self->_emailAddresses;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = self->_addresses;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = self->_phoneNumbers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = self->_socialMediaHandles;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self->_attributes;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  id v28;

  v28 = a3;
  if (-[BMPBPersonEntity namesCount](self, "namesCount"))
  {
    objc_msgSend(v28, "clearNames");
    v4 = -[BMPBPersonEntity namesCount](self, "namesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBPersonEntity namesAtIndex:](self, "namesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addNames:", v7);

      }
    }
  }
  if (self->_customId)
    objc_msgSend(v28, "setCustomId:");
  if (self->_contactId)
    objc_msgSend(v28, "setContactId:");
  if (-[BMPBPersonEntity emailAddressesCount](self, "emailAddressesCount"))
  {
    objc_msgSend(v28, "clearEmailAddresses");
    v8 = -[BMPBPersonEntity emailAddressesCount](self, "emailAddressesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[BMPBPersonEntity emailAddressesAtIndex:](self, "emailAddressesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addEmailAddresses:", v11);

      }
    }
  }
  if (-[BMPBPersonEntity addressesCount](self, "addressesCount"))
  {
    objc_msgSend(v28, "clearAddresses");
    v12 = -[BMPBPersonEntity addressesCount](self, "addressesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[BMPBPersonEntity addressesAtIndex:](self, "addressesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addAddresses:", v15);

      }
    }
  }
  if (-[BMPBPersonEntity phoneNumbersCount](self, "phoneNumbersCount"))
  {
    objc_msgSend(v28, "clearPhoneNumbers");
    v16 = -[BMPBPersonEntity phoneNumbersCount](self, "phoneNumbersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[BMPBPersonEntity phoneNumbersAtIndex:](self, "phoneNumbersAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addPhoneNumbers:", v19);

      }
    }
  }
  if (-[BMPBPersonEntity socialMediaHandlesCount](self, "socialMediaHandlesCount"))
  {
    objc_msgSend(v28, "clearSocialMediaHandles");
    v20 = -[BMPBPersonEntity socialMediaHandlesCount](self, "socialMediaHandlesCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[BMPBPersonEntity socialMediaHandlesAtIndex:](self, "socialMediaHandlesAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSocialMediaHandles:", v23);

      }
    }
  }
  if (-[BMPBPersonEntity attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v28, "clearAttributes");
    v24 = -[BMPBPersonEntity attributesCount](self, "attributesCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[BMPBPersonEntity attributesAtIndex:](self, "attributesAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addAttributes:", v27);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = self->_names;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addNames:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_customId, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_contactId, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v16 = self->_emailAddresses;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v64;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v64 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addEmailAddresses:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v18);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v22 = self->_addresses;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v60;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v60 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addAddresses:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v24);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v28 = self->_phoneNumbers;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v56;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v32), "copyWithZone:", a3);
        objc_msgSend(v5, "addPhoneNumbers:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v30);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v34 = self->_socialMediaHandles;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v52;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v38), "copyWithZone:", a3);
        objc_msgSend(v5, "addSocialMediaHandles:", v39);

        ++v38;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v36);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v40 = self->_attributes;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v48;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v48 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v44), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend(v5, "addAttributes:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v42);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *names;
  NSString *customId;
  NSString *contactId;
  NSMutableArray *emailAddresses;
  NSMutableArray *addresses;
  NSMutableArray *phoneNumbers;
  NSMutableArray *socialMediaHandles;
  NSMutableArray *attributes;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((names = self->_names, !((unint64_t)names | v4[6]))
     || -[NSMutableArray isEqual:](names, "isEqual:"))
    && ((customId = self->_customId, !((unint64_t)customId | v4[4]))
     || -[NSString isEqual:](customId, "isEqual:"))
    && ((contactId = self->_contactId, !((unint64_t)contactId | v4[3]))
     || -[NSString isEqual:](contactId, "isEqual:"))
    && ((emailAddresses = self->_emailAddresses, !((unint64_t)emailAddresses | v4[5]))
     || -[NSMutableArray isEqual:](emailAddresses, "isEqual:"))
    && ((addresses = self->_addresses, !((unint64_t)addresses | v4[1]))
     || -[NSMutableArray isEqual:](addresses, "isEqual:"))
    && ((phoneNumbers = self->_phoneNumbers, !((unint64_t)phoneNumbers | v4[7]))
     || -[NSMutableArray isEqual:](phoneNumbers, "isEqual:"))
    && ((socialMediaHandles = self->_socialMediaHandles, !((unint64_t)socialMediaHandles | v4[8]))
     || -[NSMutableArray isEqual:](socialMediaHandles, "isEqual:")))
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[2])
      v13 = -[NSMutableArray isEqual:](attributes, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSMutableArray hash](self->_names, "hash");
  v4 = -[NSString hash](self->_customId, "hash") ^ v3;
  v5 = -[NSString hash](self->_contactId, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_emailAddresses, "hash");
  v7 = -[NSMutableArray hash](self->_addresses, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_phoneNumbers, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_socialMediaHandles, "hash");
  return v9 ^ -[NSMutableArray hash](self->_attributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = v4[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        -[BMPBPersonEntity addNames:](self, "addNames:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }

  if (v4[4])
    -[BMPBPersonEntity setCustomId:](self, "setCustomId:");
  if (v4[3])
    -[BMPBPersonEntity setContactId:](self, "setContactId:");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = v4[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        -[BMPBPersonEntity addEmailAddresses:](self, "addEmailAddresses:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = v4[1];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        -[BMPBPersonEntity addAddresses:](self, "addAddresses:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = v4[7];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        -[BMPBPersonEntity addPhoneNumbers:](self, "addPhoneNumbers:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = v4[8];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        -[BMPBPersonEntity addSocialMediaHandles:](self, "addSocialMediaHandles:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = v4[2];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[BMPBPersonEntity addAttributes:](self, "addAttributes:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * ii), (_QWORD)v35);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
  }

}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (NSString)customId
{
  return self->_customId;
}

- (void)setCustomId:(id)a3
{
  objc_storeStrong((id *)&self->_customId, a3);
}

- (NSString)contactId
{
  return self->_contactId;
}

- (void)setContactId:(id)a3
{
  objc_storeStrong((id *)&self->_contactId, a3);
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (NSMutableArray)socialMediaHandles
{
  return self->_socialMediaHandles;
}

- (void)setSocialMediaHandles:(id)a3
{
  objc_storeStrong((id *)&self->_socialMediaHandles, a3);
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialMediaHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_customId, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
