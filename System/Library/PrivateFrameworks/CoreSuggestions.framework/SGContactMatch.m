@implementation SGContactMatch

- (SGContactMatch)initWithContact:(id)a3 matchTokens:(id)a4 matchInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactMatch *v12;
  uint64_t v13;
  SGContact *contact;
  uint64_t v15;
  NSArray *matchTokens;
  uint64_t v17;
  SGMatchedDetails *matchedDetails;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokens"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchinfoData"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SGContactMatch;
  v12 = -[SGContactMatch init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    contact = v12->_contact;
    v12->_contact = (SGContact *)v13;

    +[SGFn simpleDedupe:](SGFn, "simpleDedupe:", v10);
    v15 = objc_claimAutoreleasedReturnValue();
    matchTokens = v12->_matchTokens;
    v12->_matchTokens = (NSArray *)v15;

    +[SGMatchedDetails matchedDetailsWithContact:matchinfoData:tokens:](SGMatchedDetails, "matchedDetailsWithContact:matchinfoData:tokens:", v9, v11, v10);
    v17 = objc_claimAutoreleasedReturnValue();
    matchedDetails = v12->_matchedDetails;
    v12->_matchedDetails = (SGMatchedDetails *)v17;

  }
  return v12;
}

- (SGContactMatch)initWithContact:(id)a3 matchingFieldRecordId:(id)a4 matchTokens:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactMatch *v12;
  uint64_t v13;
  SGContact *contact;
  uint64_t v15;
  SGRecordId *matchingFieldRecordId;
  uint64_t v17;
  NSArray *matchTokens;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingFieldRecordId"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)SGContactMatch;
  v12 = -[SGContactMatch init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    contact = v12->_contact;
    v12->_contact = (SGContact *)v13;

    v15 = objc_msgSend(v10, "copy");
    matchingFieldRecordId = v12->_matchingFieldRecordId;
    v12->_matchingFieldRecordId = (SGRecordId *)v15;

    v17 = objc_msgSend(v11, "copy");
    matchTokens = v12->_matchTokens;
    v12->_matchTokens = (NSArray *)v17;

  }
  return v12;
}

- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4
{
  return -[SGContactMatch initWithContact:matchingEmailAddressRecordId:matchTokens:](self, "initWithContact:matchingEmailAddressRecordId:matchTokens:", a3, a4, 0);
}

- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4
{
  return -[SGContactMatch initWithContact:matchingNameRecordId:matchTokens:](self, "initWithContact:matchingNameRecordId:matchTokens:", a3, a4, 0);
}

- (SGContactMatch)initWithContact:(id)a3 matchingNameRecordId:(id)a4 matchTokens:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactMatch *v12;
  SGContactMatch *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingNameRecordId"));

LABEL_3:
  v12 = -[SGContactMatch initWithContact:matchingFieldRecordId:matchTokens:](self, "initWithContact:matchingFieldRecordId:matchTokens:", v9, v10, v11);
  v13 = v12;
  if (v12)
    v12->_matchingFieldType = 1;

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingEmailAddressRecordId:(id)a4 matchTokens:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactMatch *v12;
  SGContactMatch *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingEmailAddressRecordId"));

LABEL_3:
  v12 = -[SGContactMatch initWithContact:matchingFieldRecordId:matchTokens:](self, "initWithContact:matchingFieldRecordId:matchTokens:", v9, v10, v11);
  v13 = v12;
  if (v12)
    v12->_matchingFieldType = 3;

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingPhoneRecordId:(id)a4 matchTokens:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactMatch *v12;
  SGContactMatch *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingPhoneRecordId"));

LABEL_3:
  v12 = -[SGContactMatch initWithContact:matchingFieldRecordId:matchTokens:](self, "initWithContact:matchingFieldRecordId:matchTokens:", v9, v10, v11);
  v13 = v12;
  if (v12)
    v12->_matchingFieldType = 2;

  return v13;
}

- (SGContactMatch)initWithContact:(id)a3 matchingRecordId:(id)a4 matchType:(int64_t)a5 matchTokens:(id)a6
{
  id v11;
  id v12;
  id v13;
  SGContactMatch *v14;
  SGContactMatch *v15;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactMatch.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingRecordId"));

LABEL_3:
  v14 = -[SGContactMatch initWithContact:matchingFieldRecordId:matchTokens:](self, "initWithContact:matchingFieldRecordId:matchTokens:", v11, v12, v13);
  v15 = v14;
  if (v14)
    v14->_matchingFieldType = a5;

  return v15;
}

- (SGContactMatch)initWithCoder:(id)a3
{
  id v5;
  SGContactMatch *v6;
  void *v7;
  void *v8;
  SGContact *v9;
  void *contact;
  void *v11;
  uint64_t v12;
  SGRecordId *matchingFieldRecordId;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *matchTokens;
  void *v19;
  uint64_t v20;
  SGMatchedDetails *matchedDetails;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGContactMatch;
  v6 = -[SGContactMatch init](&v23, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("contact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      contact = v6->_contact;
      v6->_contact = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      contact = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contact, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGContactMatch.m"), 119, CFSTR("nonnull property %s *%s was null when decoded"), "SGContact", "contact");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("matchingFieldRecordId"));
    v12 = objc_claimAutoreleasedReturnValue();
    matchingFieldRecordId = v6->_matchingFieldRecordId;
    v6->_matchingFieldRecordId = (SGRecordId *)v12;

    v6->_matchingFieldType = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("matchingFieldType"));
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("matchTokens"));
    v17 = objc_claimAutoreleasedReturnValue();
    matchTokens = v6->_matchTokens;
    v6->_matchTokens = (NSArray *)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("matchedDetails"));
    v20 = objc_claimAutoreleasedReturnValue();
    matchedDetails = v6->_matchedDetails;
    v6->_matchedDetails = (SGMatchedDetails *)v20;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  SGContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingFieldRecordId, CFSTR("matchingFieldRecordId"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_matchingFieldType, CFSTR("matchingFieldType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchTokens, CFSTR("matchTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchedDetails, CFSTR("matchedDetails"));

}

- (BOOL)isEqualToContactMatch:(id)a3
{
  id *v4;
  id *v5;
  SGRecordId *matchingFieldRecordId;
  SGRecordId *v7;
  SGRecordId *v8;
  SGRecordId *v9;
  BOOL v10;
  SGContact *contact;
  SGContact *v12;
  SGContact *v13;
  SGContact *v14;
  BOOL v15;
  NSArray *matchTokens;
  SGMatchedDetails *matchedDetails;
  SGMatchedDetails *v18;
  SGMatchedDetails *v19;
  void *v20;
  char v21;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  matchingFieldRecordId = self->_matchingFieldRecordId;
  v7 = (SGRecordId *)v4[1];
  if (matchingFieldRecordId == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = matchingFieldRecordId;
    v10 = -[SGRecordId isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_15:
      v21 = 0;
      goto LABEL_16;
    }
  }
  contact = self->_contact;
  v12 = (SGContact *)v5[3];
  if (contact == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = contact;
    v15 = -[SGContact isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_15;
  }
  if ((id)self->_matchingFieldType != v5[2])
    goto LABEL_15;
  matchTokens = self->_matchTokens;
  if (matchTokens != v5[4] && !-[NSArray isEqual:](matchTokens, "isEqual:"))
    goto LABEL_15;
  matchedDetails = self->_matchedDetails;
  objc_msgSend(v5, "matchedDetails");
  v18 = (SGMatchedDetails *)objc_claimAutoreleasedReturnValue();
  if (matchedDetails == v18)
  {
    v21 = 1;
  }
  else
  {
    v19 = self->_matchedDetails;
    objc_msgSend(v5, "matchedDetails");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SGMatchedDetails isEqual:](v19, "isEqual:", v20);

  }
LABEL_16:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  SGContactMatch *v4;
  SGContactMatch *v5;
  BOOL v6;

  v4 = (SGContactMatch *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGContactMatch isEqualToContactMatch:](self, "isEqualToContactMatch:", v5);

  return v6;
}

- (SGObject)matchingField
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  switch(self->_matchingFieldType)
  {
    case 1:
      -[SGContact name](self->_contact, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recordId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToRecordId:", self->_matchingFieldRecordId);

      if (!v5)
        goto LABEL_4;
      -[SGContact name](self->_contact, "name");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_19;
    case 2:
      -[SGContact phones](self->_contact, "phones");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[SGContact emailAddresses](self->_contact, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[SGContact postalAddresses](self->_contact, "postalAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[SGContact socialProfiles](self->_contact, "socialProfiles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
LABEL_4:
      v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_9:
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v8;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v9)
        goto LABEL_17;
      v10 = v9;
      v11 = *(_QWORD *)v18;
      break;
  }
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v13, "recordId", (_QWORD)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToRecordId:", self->_matchingFieldRecordId);

      if ((v15 & 1) != 0)
      {
        v6 = v13;

        goto LABEL_19;
      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
      continue;
    break;
  }
LABEL_17:

  v6 = 0;
LABEL_19:

  return (SGObject *)v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SGContact hash](self->_contact, "hash");
  return -[SGRecordId hash](self->_matchingFieldRecordId, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGContactMatch contact=%@ matchingFieldRecordId=%@ tokens=%@ type=%lld matchesDetails=%@>"), self->_contact, self->_matchingFieldRecordId, self->_matchTokens, self->_matchingFieldType, self->_matchedDetails);
}

- (SGContact)contact
{
  return self->_contact;
}

- (int64_t)matchingFieldType
{
  return self->_matchingFieldType;
}

- (NSArray)matchTokens
{
  return self->_matchTokens;
}

- (SGMatchedDetails)matchedDetails
{
  return self->_matchedDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedDetails, 0);
  objc_storeStrong((id *)&self->_matchTokens, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_matchingFieldRecordId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
