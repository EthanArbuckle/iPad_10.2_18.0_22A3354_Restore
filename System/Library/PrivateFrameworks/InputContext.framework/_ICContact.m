@implementation _ICContact

- (_ICContact)initWithFirstName:(id)a3 phoneticFirstName:(id)a4 middleName:(id)a5 phoneticMiddleName:(id)a6 lastName:(id)a7 phoneticLastName:(id)a8 organizationName:(id)a9 jobTitle:(id)a10 nickname:(id)a11 relations:(id)a12 streets:(id)a13 cities:(id)a14 score:(double)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  _ICContact *v25;
  _ICContact *v26;
  uint64_t v27;
  NSArray *relations;
  uint64_t v29;
  NSArray *streets;
  uint64_t v31;
  NSArray *cities;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v44 = a4;
  v35 = a5;
  v43 = a5;
  v42 = a6;
  v36 = a7;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v46.receiver = self;
  v46.super_class = (Class)_ICContact;
  v25 = -[_ICContact init](&v46, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_firstName, a3);
    objc_storeStrong((id *)&v26->_phoneticFirstName, a4);
    objc_storeStrong((id *)&v26->_middleName, v35);
    objc_storeStrong((id *)&v26->_phoneticMiddleName, a6);
    objc_storeStrong((id *)&v26->_lastName, v36);
    objc_storeStrong((id *)&v26->_phoneticLastName, a8);
    objc_storeStrong((id *)&v26->_organizationName, a9);
    objc_storeStrong((id *)&v26->_jobTitle, a10);
    objc_storeStrong((id *)&v26->_nickname, a11);
    v27 = objc_msgSend(v22, "copy");
    relations = v26->_relations;
    v26->_relations = (NSArray *)v27;

    v29 = objc_msgSend(v23, "copy");
    streets = v26->_streets;
    v26->_streets = (NSArray *)v29;

    v31 = objc_msgSend(v24, "copy");
    cities = v26->_cities;
    v26->_cities = (NSArray *)v31;

    v26->_score = a15;
  }

  return v26;
}

- (id)flatten
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" ,:;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __21___ICContact_flatten__block_invoke;
  v38[3] = &unk_24EF716C8;
  v5 = v3;
  v39 = v5;
  v6 = v4;
  v40 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2276AC454](v38);
  -[_ICContact lastName](self, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  -[_ICContact firstName](self, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  -[_ICContact middleName](self, "middleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v10);

  -[_ICContact organizationName](self, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v11);

  -[_ICContact jobTitle](self, "jobTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v12);

  -[_ICContact nickname](self, "nickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v13);

  -[_ICContact relations](self, "relations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[_ICContact relations](self, "relations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          v7[2](v7, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v18);
    }

  }
  -[_ICContact cities](self, "cities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[_ICContact cities](self, "cities", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          v7[2](v7, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v25);
    }

  }
  v28 = v6;

  return v28;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ICContact n:'%@ %@ %@' j:%@ o:%@ s:%f>"), self->_firstName, self->_middleName, self->_lastName, self->_jobTitle, self->_organizationName, *(_QWORD *)&self->_score);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_firstName, "hash");
  v4 = -[NSString hash](self->_phoneticFirstName, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_middleName, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_phoneticMiddleName, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_lastName, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_phoneticLastName, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_organizationName, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_jobTitle, "hash") - v9 + 32 * v9;
  v11 = -[NSString hash](self->_nickname, "hash") - v10 + 32 * v10;
  v12 = -[NSArray hash](self->_relations, "hash") - v11 + 32 * v11;
  v13 = -[NSArray hash](self->_streets, "hash") - v12 + 32 * v12;
  return (unint64_t)(self->_score
                          + (double)(unint64_t)(31 * (-[NSArray hash](self->_cities, "hash") - v13 + 32 * v13)));
}

- (BOOL)isEqualToContact:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = -[NSString isEqualToString:](self->_firstName, "isEqualToString:", *((_QWORD *)v4 + 1))
    && -[NSString isEqualToString:](self->_phoneticFirstName, "isEqualToString:", self->_phoneticFirstName)
    && -[NSString isEqualToString:](self->_middleName, "isEqualToString:", *((_QWORD *)v4 + 3))
    && -[NSString isEqualToString:](self->_phoneticMiddleName, "isEqualToString:", *((_QWORD *)v4 + 4))
    && -[NSString isEqualToString:](self->_lastName, "isEqualToString:", *((_QWORD *)v4 + 5))
    && -[NSString isEqualToString:](self->_phoneticLastName, "isEqualToString:", *((_QWORD *)v4 + 6))
    && -[NSString isEqualToString:](self->_organizationName, "isEqualToString:", *((_QWORD *)v4 + 7))
    && -[NSString isEqualToString:](self->_jobTitle, "isEqualToString:", *((_QWORD *)v4 + 8))
    && -[NSString isEqualToString:](self->_nickname, "isEqualToString:", *((_QWORD *)v4 + 9))
    && -[NSArray isEqualToArray:](self->_relations, "isEqualToArray:", *((_QWORD *)v4 + 10))
    && -[NSArray isEqualToArray:](self->_streets, "isEqualToArray:", *((_QWORD *)v4 + 11))
    && -[NSArray isEqualToArray:](self->_cities, "isEqualToArray:", *((_QWORD *)v4 + 12))
    && self->_score == v4[13];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _ICContact *v4;
  _ICContact *v5;
  BOOL v6;

  v4 = (_ICContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ICContact isEqualToContact:](self, "isEqualToContact:", v5);

  return v6;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSArray)relations
{
  return self->_relations;
}

- (NSArray)streets
{
  return self->_streets;
}

- (NSArray)cities
{
  return self->_cities;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_streets, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
