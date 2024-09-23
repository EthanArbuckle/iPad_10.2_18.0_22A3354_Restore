@implementation LKClass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClass)initWithCoder:(id)a3
{
  id v4;
  LKClass *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *students;
  uint64_t v14;
  NSArray *instructors;
  uint64_t v16;
  NSString *classDescription;
  uint64_t v18;
  NSString *className;
  uint64_t v20;
  NSNumber *classID;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *avatarNameSimilarityDictionary;
  uint64_t v25;
  NSMutableDictionary *givenNameSimilarityDictionary;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LKClass;
  v5 = -[LKClass init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("students"));
    v12 = objc_claimAutoreleasedReturnValue();
    students = v5->_students;
    v5->_students = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("instructors"));
    v14 = objc_claimAutoreleasedReturnValue();
    instructors = v5->_instructors;
    v5->_instructors = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("classDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    classDescription = v5->_classDescription;
    v5->_classDescription = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("className"));
    v18 = objc_claimAutoreleasedReturnValue();
    className = v5->_className;
    v5->_className = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("classID"));
    v20 = objc_claimAutoreleasedReturnValue();
    classID = v5->_classID;
    v5->_classID = (NSNumber *)v20;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v7, v6, v10, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_avatarNameSimilarityDictionary"));
    v23 = objc_claimAutoreleasedReturnValue();
    avatarNameSimilarityDictionary = v5->_avatarNameSimilarityDictionary;
    v5->_avatarNameSimilarityDictionary = (NSMutableDictionary *)v23;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_givenNameSimilarityDictionary"));
    v25 = objc_claimAutoreleasedReturnValue();
    givenNameSimilarityDictionary = v5->_givenNameSimilarityDictionary;
    v5->_givenNameSimilarityDictionary = (NSMutableDictionary *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *students;
  id v5;

  students = self->_students;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", students, CFSTR("students"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instructors, CFSTR("instructors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classDescription, CFSTR("classDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_className, CFSTR("className"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classID, CFSTR("classID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avatarNameSimilarityDictionary, CFSTR("_avatarNameSimilarityDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenNameSimilarityDictionary, CFSTR("_givenNameSimilarityDictionary"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LKClass classID](self, "classID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LKClass *v4;
  LKClass *v5;
  BOOL v6;

  v4 = (LKClass *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[LKClass isEqualToLKClass:](self, "isEqualToLKClass:", v5);

  return v6;
}

- (BOOL)isEqualToLKClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  char v26;

  v4 = a3;
  -[LKClass classID](self, "classID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if (v7)
  {
    -[LKClass className](self, "className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "className");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      -[LKClass classDescription](self, "classDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "classDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        -[LKClass students](self, "students");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v4, "students");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
LABEL_8:
            -[LKClass instructors](self, "instructors");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20 || (objc_msgSend(v4, "instructors"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[LKClass instructors](self, "instructors");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[LKClass sortUsers:](self, "sortUsers:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "instructors");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[LKClass sortUsers:](self, "sortUsers:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v22, "isEqualToArray:", v24) ^ 1;

              if (v20)
              {
LABEL_17:

                v26 = v25 ^ 1;
                goto LABEL_14;
              }
            }
            else
            {
              LOBYTE(v25) = 0;
            }

            goto LABEL_17;
          }
        }
        -[LKClass students](self, "students");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[LKClass sortUsers:](self, "sortUsers:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "students");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LKClass sortUsers:](self, "sortUsers:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "isEqualToArray:", v18);

        if (v14)
        {

          if (v19)
            goto LABEL_8;
        }
        else
        {

          if ((v19 & 1) != 0)
            goto LABEL_8;
        }
      }
    }
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)sortUsers:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD17C0];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithKey:ascending:", CFSTR("identifier"), 1);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (LKClass)initWithStudents:(id)a3 instructors:(id)a4 className:(id)a5 classID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LKClass *v15;
  LKClass *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *givenNameSimilarityDictionary;
  NSMutableDictionary *v19;
  NSMutableDictionary *avatarNameSimilarityDictionary;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LKClass;
  v15 = -[LKClass init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_students, a3);
    objc_storeStrong((id *)&v16->_instructors, a4);
    objc_storeStrong((id *)&v16->_className, a5);
    objc_storeStrong((id *)&v16->_classID, a6);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    givenNameSimilarityDictionary = v16->_givenNameSimilarityDictionary;
    v16->_givenNameSimilarityDictionary = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    avatarNameSimilarityDictionary = v16->_avatarNameSimilarityDictionary;
    v16->_avatarNameSimilarityDictionary = v19;

  }
  return v16;
}

- (LKClass)initWithClassDictionary:(id)a3 usersByUserIdentifier:(id)a4
{
  id v6;
  id v7;
  LKClass *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *givenNameSimilarityDictionary;
  NSMutableDictionary *v11;
  NSMutableDictionary *avatarNameSimilarityDictionary;
  uint64_t v13;
  NSString *classDescription;
  uint64_t v15;
  NSString *className;
  uint64_t v17;
  NSNumber *classID;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSArray *students;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)LKClass;
  v8 = -[LKClass init](&v45, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    givenNameSimilarityDictionary = v8->_givenNameSimilarityDictionary;
    v8->_givenNameSimilarityDictionary = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    avatarNameSimilarityDictionary = v8->_avatarNameSimilarityDictionary;
    v8->_avatarNameSimilarityDictionary = v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Description"));
    v13 = objc_claimAutoreleasedReturnValue();
    classDescription = v8->_classDescription;
    v8->_classDescription = (NSString *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Name"));
    v15 = objc_claimAutoreleasedReturnValue();
    className = v8->_className;
    v8->_className = (NSString *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BeaconID"));
    v17 = objc_claimAutoreleasedReturnValue();
    classID = v8->_classID;
    v8->_classID = (NSNumber *)v17;

    v19 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LeaderIdentifiers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v22);
    }

    objc_storeStrong((id *)&v8->_instructors, v19);
    v26 = (NSArray *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MemberIdentifiers"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v38;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v31));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "username");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            -[NSArray addObject:](v26, "addObject:", v32);
            -[LKClass _updateNamingSimilarityInfoForUser:](v8, "_updateNamingSimilarityInfoForUser:", v32);
          }

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v29);
    }

    students = v8->_students;
    v8->_students = v26;

    v6 = v36;
  }

  return v8;
}

- (void)_updateNamingSimilarityInfoForUser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *givenNameSimilarityDictionary;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *avatarNameSimilarityDictionary;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v39, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  objc_msgSend(v39, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  objc_msgSend(v4, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    givenNameSimilarityDictionary = self->_givenNameSimilarityDictionary;
    objc_msgSend(v4, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](givenNameSimilarityDictionary, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v39, "namingSimilarityInfoByClassID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, self->_classID);

      v13 = self->_givenNameSimilarityDictionary;
      objc_msgSend(v4, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "namingSimilarityInfoByClassID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", self->_classID);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "similarity");
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "similarity");

      if (v18 == v20)
        goto LABEL_7;
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_givenNameSimilarityDictionary;
      objc_msgSend(v4, "givenName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "namingSimilarityInfoByClassID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, self->_classID);

    }
    else
    {
      v26 = self->_givenNameSimilarityDictionary;
      objc_msgSend(v4, "givenName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v39, v27);

      objc_msgSend(v39, "namingSimilarityInfoByClassID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v23, self->_classID);
    }

  }
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1738], "_localizedShortNameForComponents:withStyle:options:", v4, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_avatarNameSimilarityDictionary, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v39, "namingSimilarityInfoByClassID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v31, self->_classID);

      avatarNameSimilarityDictionary = self->_avatarNameSimilarityDictionary;
      objc_msgSend(v4, "givenName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](avatarNameSimilarityDictionary, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "namingSimilarityInfoByClassID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v36, self->_classID);

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_avatarNameSimilarityDictionary, "setObject:forKeyedSubscript:", v39, v28);
      objc_msgSend(v39, "namingSimilarityInfoByClassID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", self->_classID);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
        goto LABEL_12;
      objc_msgSend(v39, "namingSimilarityInfoByClassID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[LKNamingSimilarity namingSimilarityWithSimilarity:](LKNamingSimilarity, "namingSimilarityWithSimilarity:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, self->_classID);
    }

  }
LABEL_12:

}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)classDescription
{
  return self->_classDescription;
}

- (void)setClassDescription:(id)a3
{
  objc_storeStrong((id *)&self->_classDescription, a3);
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_storeStrong((id *)&self->_className, a3);
}

- (NSString)classImageURL
{
  return self->_classImageURL;
}

- (void)setClassImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_classImageURL, a3);
}

- (NSNumber)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_storeStrong((id *)&self->_classID, a3);
}

- (NSArray)instructors
{
  return self->_instructors;
}

- (void)setInstructors:(id)a3
{
  objc_storeStrong((id *)&self->_instructors, a3);
}

- (NSMutableDictionary)avatarNameSimilarityDictionary
{
  return self->_avatarNameSimilarityDictionary;
}

- (void)setAvatarNameSimilarityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_avatarNameSimilarityDictionary, a3);
}

- (NSMutableDictionary)givenNameSimilarityDictionary
{
  return self->_givenNameSimilarityDictionary;
}

- (void)setGivenNameSimilarityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameSimilarityDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenNameSimilarityDictionary, 0);
  objc_storeStrong((id *)&self->_avatarNameSimilarityDictionary, 0);
  objc_storeStrong((id *)&self->_instructors, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_classImageURL, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_classDescription, 0);
  objc_storeStrong((id *)&self->_students, 0);
}

@end
