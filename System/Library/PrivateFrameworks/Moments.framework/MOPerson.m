@implementation MOPerson

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6
{
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", a3, a4, a5, a6, 0.0, -1.0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7
{
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", a3, a4, a5, a6, a7, -1.0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7 significanceScore:(double)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", a3, a4, a5, a6, 0, 0, a7, a8, v9, 0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 isPHPersonTypeImportant:(BOOL)a7 isMePerson:(BOOL)a8 mePersonIdentified:(BOOL)a9 personRelationships:(id)a10 priorityScore:(double)a11 significanceScore:(double)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MOPerson *v25;
  uint64_t v26;
  NSString *localIdentifier;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSString *contactIdentifier;
  uint64_t v32;
  NSString *family;
  uint64_t v34;
  NSArray *personRelationships;
  objc_super v37;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a10;
  v37.receiver = self;
  v37.super_class = (Class)MOPerson;
  v25 = -[MOPerson init](&v37, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v20, "copy");
    localIdentifier = v25->_localIdentifier;
    v25->_localIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v28;

    v30 = objc_msgSend(v22, "copy");
    contactIdentifier = v25->_contactIdentifier;
    v25->_contactIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v23, "copy");
    family = v25->_family;
    v25->_family = (NSString *)v32;

    v25->_isPHPersonTypeImportant = a7;
    v25->_isMePerson = a8;
    v25->_mePersonIdentified = a9;
    v34 = objc_msgSend(v24, "copy");
    personRelationships = v25->_personRelationships;
    v25->_personRelationships = (NSArray *)v34;

    v25->_priorityScore = a11;
    v25->_significanceScore = a12;
  }

  return v25;
}

- (MOPerson)initWithPersonDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  MOPerson *v20;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("localIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contactIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("family"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("priorityScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "objectForKey:", CFSTR("significanceScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "objectForKey:", CFSTR("isPHPersonTypeImportant"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("isMePerson"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("mePersonIdentified"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v19, "BOOLValue");
  LOBYTE(v22) = (_BYTE)v4;
  v20 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v5, v6, v7, v8, v16, v18, v11, v14, v22, 0);

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[MOPerson localIdentifier](self, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerson name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerson contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOPerson isPHPersonTypeImportant](self, "isPHPersonTypeImportant");
  v8 = -[MOPerson isMePerson](self, "isMePerson");
  v9 = -[MOPerson mePersonIdentified](self, "mePersonIdentified");
  -[MOPerson personRelationships](self, "personRelationships");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerson family](self, "family");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerson significanceScore](self, "significanceScore");
  v13 = v12;
  -[MOPerson priorityScore](self, "priorityScore");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<MOPerson localIdentifier, %@, name, %@, contactIdentifier, %@, isPHPersonTypeImportant, %d, isMePerson, %d, mePersonIdentified, %d, peopleClassification, %@, family, %@, significanceScore, %.1f, priorityScore, %.1f>"), v3, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localIdentifier;
  id v5;

  localIdentifier = self->_localIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localIdentifier, CFSTR("localIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPHPersonTypeImportant, CFSTR("isPHPersonTypeImportant"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMePerson, CFSTR("isMePerson"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mePersonIdentified, CFSTR("mePersonIdentified"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personRelationships, CFSTR("personRelationships"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("priorityScore"), self->_priorityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("significanceScore"), self->_significanceScore);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (MOPerson)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  MOPerson *v18;
  void *v19;
  uint64_t v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("family"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isPHPersonTypeImportant"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isMePerson"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("mePersonIdentified"));
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("personRelationships"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("priorityScore"));
  v16 = v15;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("significanceScore"));
  LOBYTE(v21) = v10;
  v18 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v4, v5, v6, v7, v8, v9, v16, v17, v21, v14);
  if (v18)
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEventIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOPerson setSourceEventIdentifier:](v18, "setSourceEventIdentifier:", v19);

    -[MOPerson setSourceEventAccessType:](v18, "setSourceEventAccessType:", objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  MOPerson *v4;
  MOPerson *v5;
  MOPerson *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  char v27;

  v4 = (MOPerson *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v6 = v4;
    -[MOPerson localIdentifier](self, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[MOPerson localIdentifier](v6, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = v8 != 0;

    }
    else
    {
      LODWORD(v9) = 0;
    }

    -[MOPerson contactIdentifier](self, "contactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[MOPerson contactIdentifier](v6, "contactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 != 0;

    }
    else
    {
      v13 = 0;
    }

    if ((_DWORD)v9)
    {
      -[MOPerson localIdentifier](self, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOPerson localIdentifier](v6, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

    }
    else
    {
      v16 = 0;
    }
    -[MOPerson name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[MOPerson name](v6, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[MOPerson name](self, "name");
        v27 = v9;
        v9 = objc_claimAutoreleasedReturnValue();
        -[MOPerson name](v6, "name");
        v19 = v16;
        v20 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend((id)v9, "isEqualToString:", v21);

        v13 = v20;
        v16 = v19;

        LOBYTE(v9) = v27;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

    if (v13)
    {
      -[MOPerson contactIdentifier](self, "contactIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOPerson contactIdentifier](v6, "contactIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

    }
    else
    {
      v25 = 0;
    }
    if (((v16 | v25) & 1) != 0)
      v10 = 1;
    else
      v10 = v22 & ~(v9 | v13);

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[MOPerson localIdentifier](self, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MOPerson localIdentifier](self, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");

  }
  else
  {
    v5 = 0;
  }

  -[MOPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MOPerson name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = 0;
  }

  -[MOPerson contactIdentifier](self, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MOPerson contactIdentifier](self, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hash");

  }
  else
  {
    v11 = 0;
  }

  return v8 ^ v5 ^ v11;
}

- (int64_t)comparePersons:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[MOPerson isMePerson](self, "isMePerson"))
  {
LABEL_5:
    v5 = -1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isMePerson") & 1) == 0)
  {
    if (!-[MOPerson isPHPersonTypeImportant](self, "isPHPersonTypeImportant"))
    {
      v5 = objc_msgSend(v4, "isPHPersonTypeImportant");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  objc_storeStrong((id *)&self->_family, a3);
}

- (BOOL)isPHPersonTypeImportant
{
  return self->_isPHPersonTypeImportant;
}

- (void)setIsPHPersonTypeImportant:(BOOL)a3
{
  self->_isPHPersonTypeImportant = a3;
}

- (BOOL)isMePerson
{
  return self->_isMePerson;
}

- (void)setIsMePerson:(BOOL)a3
{
  self->_isMePerson = a3;
}

- (BOOL)mePersonIdentified
{
  return self->_mePersonIdentified;
}

- (void)setMePersonIdentified:(BOOL)a3
{
  self->_mePersonIdentified = a3;
}

- (NSArray)personRelationships
{
  return self->_personRelationships;
}

- (void)setPersonRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_personRelationships, a3);
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_personRelationships, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
