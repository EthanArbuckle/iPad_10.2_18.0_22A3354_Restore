@implementation CSUserAction

+ (id)actionFromUserActivity:(id)a3 searchableItem:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserActivity:searchableItem:", v6, v5);

  return v7;
}

- (CSUserAction)initWithUserActivity:(id)a3 searchableItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSUserAction *v9;
  CSUserAction *v10;
  uint64_t v11;
  NSString *itemIdentifier;
  uint64_t v13;
  NSSet *keywords;
  uint64_t v15;
  NSDictionary *userInfo;
  void *v17;
  void *v18;
  NSUUID *v19;
  NSUUID *uaIdentifier;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *madeInitiallyCurrentDates;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *madeCurrentDates;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *madeCurrentEndDates;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *sentToIndexerDates;
  double v37;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v39.receiver = self;
    v39.super_class = (Class)CSUserAction;
    v10 = -[CSUserAction init](&v39, sel_init);
    if (!v10)
    {
LABEL_26:
      self = v10;
      v9 = self;
      goto LABEL_27;
    }
    objc_msgSend(v8, "uniqueIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v10->_itemIdentifier;
    v10->_itemIdentifier = (NSString *)v11;

    objc_msgSend(v6, "keywords");
    v13 = objc_claimAutoreleasedReturnValue();
    keywords = v10->_keywords;
    v10->_keywords = (NSSet *)v13;

    if (objc_msgSend(v6, "isEligibleForHandoff"))
      v10->_eligibility |= 2uLL;
    if (objc_msgSend(v6, "isEligibleForPublicIndexing"))
      v10->_eligibility |= 4uLL;
    if (objc_msgSend(v6, "isEligibleForSearch"))
      v10->_eligibility |= 1uLL;
    if (objc_msgSend(v6, "isEligibleForPrediction"))
      v10->_eligibility |= 8uLL;
    objc_msgSend(v6, "userInfo");
    v15 = objc_claimAutoreleasedReturnValue();
    userInfo = v10->_userInfo;
    v10->_userInfo = (NSDictionary *)v15;

    objc_msgSend(v6, "_originalUniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v6, "_uniqueIdentifier");
      v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    uaIdentifier = v10->_uaIdentifier;
    v10->_uaIdentifier = v19;

    objc_msgSend(v6, "_madeInitiallyCurrentDate");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      v43[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      madeInitiallyCurrentDates = v10->_madeInitiallyCurrentDates;
      v10->_madeInitiallyCurrentDates = (NSArray *)v23;

    }
    objc_msgSend(v6, "_madeCurrentDate");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
    {
      v42 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      madeCurrentDates = v10->_madeCurrentDates;
      v10->_madeCurrentDates = (NSArray *)v27;

    }
    else if (!v22)
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v6, "_madeCurrentEndDate");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
    {
      v41 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v31 = objc_claimAutoreleasedReturnValue();
      madeCurrentEndDates = v10->_madeCurrentEndDates;
      v10->_madeCurrentEndDates = (NSArray *)v31;

    }
    objc_msgSend(v6, "_sentToIndexerDate");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
    {
      v40 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v35 = objc_claimAutoreleasedReturnValue();
      sentToIndexerDates = v10->_sentToIndexerDates;
      v10->_sentToIndexerDates = (NSArray *)v35;

    }
    objc_msgSend(v6, "_madeCurrentInterval");
    v10->_madeCurrentInterval = v37;

    goto LABEL_25;
  }
LABEL_27:

  return v9;
}

- (void)updateWithUserAction:(id)a3
{
  id *v4;
  id *v5;
  NSUInteger v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSArray *v14;
  NSArray *madeInitiallyCurrentDates;
  NSUInteger v16;
  id v17;
  NSArray *v18;
  NSArray *madeCurrentDates;
  NSUInteger v20;
  id v21;
  NSArray *v22;
  NSArray *madeCurrentEndDates;
  NSUInteger v24;
  id v25;
  NSArray *v26;
  NSArray *sentToIndexerDates;
  id *v28;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_24;
  v28 = v4;
  if (objc_msgSend(v4[7], "count"))
  {
    v6 = -[NSArray count](self->_madeInitiallyCurrentDates, "count");
    v7 = v28[7];
    if (!v6)
    {
      v14 = (NSArray *)v7;
      goto LABEL_7;
    }
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    -[NSArray lastObject](self->_madeInitiallyCurrentDates, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    if (v10 > v13)
    {
      objc_msgSend(v28[7], "arrayByAddingObjectsFromArray:", self->_madeInitiallyCurrentDates);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      madeInitiallyCurrentDates = self->_madeInitiallyCurrentDates;
      self->_madeInitiallyCurrentDates = v14;

    }
  }
  if (objc_msgSend(v28[8], "count"))
  {
    v16 = -[NSArray count](self->_madeCurrentDates, "count");
    v17 = v28[8];
    if (v16)
    {
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", self->_madeCurrentDates);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (NSArray *)v17;
    }
    madeCurrentDates = self->_madeCurrentDates;
    self->_madeCurrentDates = v18;

  }
  if (objc_msgSend(v28[9], "count"))
  {
    v20 = -[NSArray count](self->_madeCurrentEndDates, "count");
    v21 = v28[9];
    if (v20)
    {
      objc_msgSend(v21, "arrayByAddingObjectsFromArray:", self->_madeCurrentEndDates);
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (NSArray *)v21;
    }
    madeCurrentEndDates = self->_madeCurrentEndDates;
    self->_madeCurrentEndDates = v22;

  }
  if (objc_msgSend(v28[10], "count"))
  {
    v24 = -[NSArray count](self->_sentToIndexerDates, "count");
    v25 = v28[10];
    if (v24)
    {
      objc_msgSend(v25, "arrayByAddingObjectsFromArray:", self->_sentToIndexerDates);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = (NSArray *)v25;
    }
    sentToIndexerDates = self->_sentToIndexerDates;
    self->_sentToIndexerDates = v26;

  }
  v5 = v28;
  *(_QWORD *)&self->_madeCurrentInterval = v28[11];
LABEL_24:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentToIndexerDates, 0);
  objc_storeStrong((id *)&self->_madeCurrentEndDates, 0);
  objc_storeStrong((id *)&self->_madeCurrentDates, 0);
  objc_storeStrong((id *)&self->_madeInitiallyCurrentDates, 0);
  objc_storeStrong((id *)&self->_uaIdentifier, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_contentAction, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)encodeWithCSCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "beginType:", "CSUserAction");
  -[CSUserAction itemIdentifier](self, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "encodeNSString:", v4);

  -[CSUserAction contentAction](self, "contentAction");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E2406B38;
  objc_msgSend(v30, "encodeNSString:", v7);

  objc_msgSend(v30, "encodeInt32:", -[CSUserAction eligibility](self, "eligibility"));
  -[CSUserAction userInfo](self, "userInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v30, "encodeObject:", v10);

  -[CSUserAction keywords](self, "keywords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v15 = v12;
  else
    v15 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v30, "encodeObject:", v15);

  -[CSUserAction uaIdentifier](self, "uaIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E2406B38;
  objc_msgSend(v30, "encodeNSString:", v19);

  -[CSUserAction madeInitiallyCurrentDates](self, "madeInitiallyCurrentDates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUserAction madeCurrentDates](self, "madeCurrentDates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count") || v21)
  {
    if (v20)
      v22 = v20;
    else
      v22 = v14;
    objc_msgSend(v30, "encodeObject:", v22);
    if (v21)
      v23 = v21;
    else
      v23 = v14;
    objc_msgSend(v30, "encodeObject:", v23);
    -[CSUserAction madeCurrentEndDates](self, "madeCurrentEndDates");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = v24;
    else
      v26 = (uint64_t)v14;
    objc_msgSend(v30, "encodeObject:", v26);

    -[CSUserAction sentToIndexerDates](self, "sentToIndexerDates");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = v27;
    else
      v29 = (uint64_t)v14;
    objc_msgSend(v30, "encodeObject:", v29);

    -[CSUserAction madeCurrentInterval](self, "madeCurrentInterval");
    objc_msgSend(v30, "encodeDouble:");
  }
  objc_msgSend(v30, "endType");

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentAction, CFSTR("act"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("ui"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keywords, CFSTR("kw"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eligibility, CFSTR("elig"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uaIdentifier, CFSTR("uaid"));
  if (-[NSArray count](self->_madeInitiallyCurrentDates, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_madeInitiallyCurrentDates, CFSTR("micd"));
  if (-[NSArray count](self->_madeCurrentDates, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_madeCurrentDates, CFSTR("mcd"));
  if (-[NSArray count](self->_madeCurrentEndDates, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_madeCurrentEndDates, CFSTR("mced"));
  if (-[NSArray count](self->_sentToIndexerDates, "count"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_sentToIndexerDates, CFSTR("sid"));
  v4 = v5;
  if (self->_madeCurrentInterval != 0.0)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("mci"));
    v4 = v5;
  }

}

- (CSUserAction)initWithCoder:(id)a3
{
  id v4;
  CSUserAction *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSString *contentAction;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *userInfo;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSSet *keywords;
  uint64_t v26;
  NSUUID *uaIdentifier;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *madeInitiallyCurrentDates;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *madeCurrentDates;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSArray *madeCurrentEndDates;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *sentToIndexerDates;
  double v48;
  uint64_t v50;
  void *v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CSUserAction;
  v5 = -[CSUserAction init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("act"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentAction = v5->_contentAction;
    v5->_contentAction = (NSString *)v8;

    v51 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v50, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("ui"));
    v19 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("kw"));
    v24 = objc_claimAutoreleasedReturnValue();
    keywords = v5->_keywords;
    v5->_keywords = (NSSet *)v24;

    v5->_eligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("elig"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uaid"));
    v26 = objc_claimAutoreleasedReturnValue();
    uaIdentifier = v5->_uaIdentifier;
    v5->_uaIdentifier = (NSUUID *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("micd"));
    v31 = objc_claimAutoreleasedReturnValue();
    madeInitiallyCurrentDates = v5->_madeInitiallyCurrentDates;
    v5->_madeInitiallyCurrentDates = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("mcd"));
    v36 = objc_claimAutoreleasedReturnValue();
    madeCurrentDates = v5->_madeCurrentDates;
    v5->_madeCurrentDates = (NSArray *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("mced"));
    v41 = objc_claimAutoreleasedReturnValue();
    madeCurrentEndDates = v5->_madeCurrentEndDates;
    v5->_madeCurrentEndDates = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("sid"));
    v46 = objc_claimAutoreleasedReturnValue();
    sentToIndexerDates = v5->_sentToIndexerDates;
    v5->_sentToIndexerDates = (NSArray *)v46;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mci"));
    v5->_madeCurrentInterval = v48;
  }

  return v5;
}

- (OS_xpc_object)xpc_dictionary
{
  xpc_object_t v3;
  void *v4;
  id v5;
  id v6;
  double madeCurrentInterval;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "id", -[NSString UTF8String](self->_itemIdentifier, "UTF8String"));
  xpc_dictionary_set_string(v3, "act", -[NSString UTF8String](self->_contentAction, "UTF8String"));
  xpc_dictionary_set_uint64(v3, "elig", self->_eligibility);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userInfo, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v4, "encodedData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_data(v3, "ui", (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  -[NSUUID UUIDString](self->_uaIdentifier, "UUIDString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v3, "uaid", (const char *)objc_msgSend(v6, "UTF8String"));

  addXPCDateArrayToXPCDict(v3, self->_madeInitiallyCurrentDates, CFSTR("micd"));
  addXPCDateArrayToXPCDict(v3, self->_madeCurrentDates, "mcd");
  addXPCDateArrayToXPCDict(v3, self->_madeCurrentEndDates, "mced");
  addXPCDateArrayToXPCDict(v3, self->_sentToIndexerDates, "sid");
  madeCurrentInterval = self->_madeCurrentInterval;
  if (madeCurrentInterval != 0.0)
    xpc_dictionary_set_double(v3, "mci", madeCurrentInterval);

  return (OS_xpc_object *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setItemIdentifier:", self->_itemIdentifier);
  objc_msgSend(v4, "setContentAction:", self->_contentAction);
  v5 = (void *)-[NSDictionary copy](self->_userInfo, "copy");
  objc_msgSend(v4, "setUserInfo:", v5);

  v6 = (void *)-[NSSet copy](self->_keywords, "copy");
  objc_msgSend(v4, "setKeywords:", v6);

  objc_msgSend(v4, "setEligibility:", self->_eligibility);
  objc_msgSend(v4, "setUaIdentifier:", self->_uaIdentifier);
  objc_msgSend(v4, "setMadeInitiallyCurrentDates:", self->_madeInitiallyCurrentDates);
  objc_msgSend(v4, "setMadeCurrentDates:", self->_madeCurrentDates);
  objc_msgSend(v4, "setMadeCurrentEndDates:", self->_madeCurrentEndDates);
  objc_msgSend(v4, "setSentToIndexerDates:", self->_sentToIndexerDates);
  objc_msgSend(v4, "setMadeCurrentInterval:", self->_madeCurrentInterval);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *itemIdentifier;
  NSString *contentAction;
  NSDictionary *userInfo;
  NSSet *keywords;
  NSUUID *uaIdentifier;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    itemIdentifier = self->_itemIdentifier;
    if ((itemIdentifier == (NSString *)v5[1] || -[NSString isEqualToString:](itemIdentifier, "isEqualToString:"))
      && ((contentAction = self->_contentAction, contentAction == (NSString *)v5[2])
       || -[NSString isEqualToString:](contentAction, "isEqualToString:"))
      && ((userInfo = self->_userInfo, userInfo == (NSDictionary *)v5[3])
       || -[NSDictionary isEqual:](userInfo, "isEqual:"))
      && ((keywords = self->_keywords, keywords == (NSSet *)v5[4])
       || -[NSSet isEqual:](keywords, "isEqual:"))
      && self->_eligibility == v5[5])
    {
      uaIdentifier = self->_uaIdentifier;
      if (uaIdentifier == (NSUUID *)v5[6])
        v11 = 1;
      else
        v11 = -[NSUUID isEqual:](uaIdentifier, "isEqual:");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_itemIdentifier, "hash");
}

- (id)_propertiesDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t eligibility;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSUUID UUIDString](self->_uaIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("uuid=%@"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("id=%@"), self->_itemIdentifier);
  objc_msgSend(v3, "addObject:", v7);

  if (-[NSArray count](self->_madeInitiallyCurrentDates, "count"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_madeInitiallyCurrentDates, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("inital=[%@]"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  if (-[NSArray count](self->_madeCurrentDates, "count"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_madeCurrentDates, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("start=[%@]"), v12);
    objc_msgSend(v3, "addObject:", v13);

  }
  if (-[NSArray count](self->_madeCurrentEndDates, "count"))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_madeCurrentEndDates, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("end=[%@]"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  if (-[NSArray count](self->_sentToIndexerDates, "count"))
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_sentToIndexerDates, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("sent=[%@]"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  if (self->_madeCurrentInterval != 0.0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("currentInterval=%g"), *(_QWORD *)&self->_madeCurrentInterval);
    objc_msgSend(v3, "addObject:", v20);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v22 = v21;
  eligibility = self->_eligibility;
  if ((eligibility & 1) != 0)
  {
    objc_msgSend(v21, "addObject:", CFSTR("eligible-for-search"));
    if ((eligibility & 2) == 0)
    {
LABEL_13:
      if ((eligibility & 4) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((eligibility & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v22, "addObject:", CFSTR("eligible-for-handoff"));
  if ((eligibility & 4) == 0)
  {
LABEL_14:
    if ((eligibility & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_21:
  objc_msgSend(v22, "addObject:", CFSTR("eligible-for-public-indexing"));
  if ((eligibility & 8) != 0)
LABEL_15:
    objc_msgSend(v22, "addObject:", CFSTR("eligible-for-prediction"));
LABEL_16:
  if (objc_msgSend(v22, "count"))
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("|"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("flags=%@"), v25);
    objc_msgSend(v3, "addObject:", v26);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CSUserAction _propertiesDescription](self, "_propertiesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@>"), v4, self, v5);

  return v6;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CSUserAction _propertiesDescription](self, "_propertiesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@, keywords:%@, userInfo:%@>"),
                 v4,
                 self,
                 v5,
                 self->_keywords,
                 self->_userInfo);

  return v6;
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)contentAction
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentAction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)keywords
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_eligibility = a3;
}

- (NSUUID)uaIdentifier
{
  return self->_uaIdentifier;
}

- (void)setUaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uaIdentifier, a3);
}

- (NSArray)madeInitiallyCurrentDates
{
  return self->_madeInitiallyCurrentDates;
}

- (void)setMadeInitiallyCurrentDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)madeCurrentDates
{
  return self->_madeCurrentDates;
}

- (void)setMadeCurrentDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)madeCurrentEndDates
{
  return self->_madeCurrentEndDates;
}

- (void)setMadeCurrentEndDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)sentToIndexerDates
{
  return self->_sentToIndexerDates;
}

- (void)setSentToIndexerDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)madeCurrentInterval
{
  return self->_madeCurrentInterval;
}

- (void)setMadeCurrentInterval:(double)a3
{
  self->_madeCurrentInterval = a3;
}

- (CSUserAction)initWithXPCDict:(id)a3
{
  id v4;
  CSUserAction *v5;
  NSString *v6;
  NSString *itemIdentifier;
  NSString *v8;
  NSString *contentAction;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *userInfo;
  void *v17;
  id v18;
  uint64_t v19;
  NSSet *keywords;
  const char *string;
  id v22;
  void *v23;
  uint64_t v24;
  NSUUID *uaIdentifier;
  uint64_t v26;
  NSArray *madeInitiallyCurrentDates;
  uint64_t v28;
  NSArray *madeCurrentDates;
  uint64_t v30;
  NSArray *madeCurrentEndDates;
  uint64_t v32;
  NSArray *sentToIndexerDates;
  objc_super v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSUserAction;
  v5 = -[CSUserAction init](&v35, sel_init);
  if (v5)
  {
    v6 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "id", v4);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = v6;

    v8 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "act", v4);
    contentAction = v5->_contentAction;
    v5->_contentAction = v8;

    +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:", "ui", 0, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3710]);
      objc_msgSend(v10, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initForReadingFromData:error:", v12, 0);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v14, *MEMORY[0x1E0CB2CD0]);
      v15 = objc_claimAutoreleasedReturnValue();
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v15;

    }
    xpc_dictionary_get_value(v4, "kw");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v17);

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      keywords = v5->_keywords;
      v5->_keywords = (NSSet *)v19;

    }
    v5->_eligibility = xpc_dictionary_get_uint64(v4, "elig");
    string = xpc_dictionary_get_string(v4, "uaid");
    if (string)
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "initWithUUIDString:", v23);
      uaIdentifier = v5->_uaIdentifier;
      v5->_uaIdentifier = (NSUUID *)v24;

    }
    copyXPCDateArrayFromXPCDict(v4, CFSTR("micd"));
    v26 = objc_claimAutoreleasedReturnValue();
    madeInitiallyCurrentDates = v5->_madeInitiallyCurrentDates;
    v5->_madeInitiallyCurrentDates = (NSArray *)v26;

    copyXPCDateArrayFromXPCDict(v4, "mcd");
    v28 = objc_claimAutoreleasedReturnValue();
    madeCurrentDates = v5->_madeCurrentDates;
    v5->_madeCurrentDates = (NSArray *)v28;

    copyXPCDateArrayFromXPCDict(v4, "mced");
    v30 = objc_claimAutoreleasedReturnValue();
    madeCurrentEndDates = v5->_madeCurrentEndDates;
    v5->_madeCurrentEndDates = (NSArray *)v30;

    copyXPCDateArrayFromXPCDict(v4, "sid");
    v32 = objc_claimAutoreleasedReturnValue();
    sentToIndexerDates = v5->_sentToIndexerDates;
    v5->_sentToIndexerDates = (NSArray *)v32;

    v5->_madeCurrentInterval = xpc_dictionary_get_double(v4, "mci");
  }

  return v5;
}

@end
