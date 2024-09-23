@implementation NTSection

- (NTSection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NTSection *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NTSection *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  NTSection *v41;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subidentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionTitle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
  v5 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rankingFeedback"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayDescriptor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referralBarName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("feedItemIDs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("allItemTypesByID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("allItemDataByID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __27__NTSection_initWithCoder___block_invoke;
  v39[3] = &unk_24DB5E8E0;
  v40 = v13;
  v18 = self;
  v41 = v18;
  v29 = v13;
  objc_msgSend(v28, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(v27, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nf_objectsForKeysWithoutMarker:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "orderedSetWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("btid"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:](v18, "initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:", v38, v37, v36, v34, v33, v23, v32, v31, v30, v24);

  return v26;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[NTSection identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTSection subidentifier](self, "subidentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NTSection items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[NTSection rankingFeedback](self, "rankingFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[NTSection displayDescriptor](self, "displayDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTSection identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = (void *)MEMORY[0x24BEDCDF0];
      -[NTSection subidentifier](self, "subidentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subidentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10))
      {
        -[NTSection items](self, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "items");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = (void *)MEMORY[0x24BEDCDF0];
          -[NTSection rankingFeedback](self, "rankingFeedback");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "rankingFeedback");
          v15 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v14;
          v16 = v14;
          v17 = (void *)v15;
          if (objc_msgSend(v13, "nf_object:isEqualToObject:", v16, v15))
          {
            -[NTSection displayDescriptor](self, "displayDescriptor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayDescriptor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v21, "isEqual:", v18);

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NTPBSectionDisplayDescriptor)displayDescriptor
{
  return self->_displayDescriptor;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)nameColorDark
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameColorDark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v29 = a3;
  -[NTSection identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[NTSection subidentifier](self, "subidentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTSection subidentifier](self, "subidentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "encodeObject:forKey:", v6, CFSTR("subidentifier"));

  }
  -[NTSection personalizationFeatureID](self, "personalizationFeatureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v7, CFSTR("p"));

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "encodeObject:forKey:", v8, CFSTR("displayDescriptor"));

  -[NTSection actionTitle](self, "actionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NTSection actionTitle](self, "actionTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "encodeObject:forKey:", v10, CFSTR("actionTitle"));

  }
  -[NTSection actionURL](self, "actionURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NTSection actionURL](self, "actionURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "encodeObject:forKey:", v13, CFSTR("actionURL"));

  }
  -[NTSection rankingFeedback](self, "rankingFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v29, "encodeObject:forKey:", v14, CFSTR("rankingFeedback"));
  -[NTSection referralBarName](self, "referralBarName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v29, "encodeObject:forKey:", v15, CFSTR("referralBarName"));
  -[NTSection backingTagID](self, "backingTagID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v29, "encodeObject:forKey:", v16, CFSTR("btid"));
  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  -[NTSection items](self, "items");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __29__NTSection_encodeWithCoder___block_invoke;
  v33[3] = &unk_24DB5E890;
  v34 = v17;
  v35 = v18;
  v22 = v18;
  v23 = v17;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v33);

  -[NTSection items](self, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v25);
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __29__NTSection_encodeWithCoder___block_invoke_2;
  v30[3] = &unk_24DB5E8B8;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v26;
  v27 = v26;
  v28 = v31;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v30);
  objc_msgSend(v29, "encodeObject:forKey:", v22, CFSTR("feedItemIDs"));
  objc_msgSend(v29, "encodeObject:forKey:", v19, CFSTR("videoPlaylistHeadlineIDs"));
  objc_msgSend(v29, "encodeObject:forKey:", v27, CFSTR("allItemTypesByID"));
  objc_msgSend(v29, "encodeObject:forKey:", v28, CFSTR("allItemDataByID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDescriptor, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)nameColorLight
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameColorLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (NTSection)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSection init]";
    v9 = 2080;
    v10 = "NTTodayResults.m";
    v11 = 1024;
    v12 = 34;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSection init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTSection)initWithIdentifier:(id)a3 subidentifier:(id)a4 actionTitle:(id)a5 actionURL:(id)a6 personalizationFeatureID:(id)a7 items:(id)a8 rankingFeedback:(id)a9 displayDescriptor:(id)a10 referralBarName:(id)a11 backingTagID:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NTSection *v28;
  uint64_t v29;
  NSString *identifier;
  uint64_t v31;
  NSString *subidentifier;
  uint64_t v33;
  NSString *actionTitle;
  uint64_t v35;
  NSURL *actionURL;
  uint64_t v37;
  NSString *personalizationFeatureID;
  uint64_t v39;
  NSOrderedSet *items;
  uint64_t v41;
  SFRankingFeedback *rankingFeedback;
  uint64_t v43;
  NTPBSectionDisplayDescriptor *displayDescriptor;
  uint64_t v45;
  NSString *referralBarName;
  uint64_t v47;
  NSString *backingTagID;
  id v51;
  void *v52;
  objc_super v53;

  v17 = a3;
  v51 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v52 = v17;
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:].cold.3();
  v26 = v25;
  if (!v21 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:].cold.2();
  v27 = v22;
  if (!v23 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:].cold.1();
  v53.receiver = self;
  v53.super_class = (Class)NTSection;
  v28 = -[NTSection init](&v53, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v52, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    v31 = objc_msgSend(v51, "copy");
    subidentifier = v28->_subidentifier;
    v28->_subidentifier = (NSString *)v31;

    v33 = objc_msgSend(v18, "copy");
    actionTitle = v28->_actionTitle;
    v28->_actionTitle = (NSString *)v33;

    v35 = objc_msgSend(v19, "copy");
    actionURL = v28->_actionURL;
    v28->_actionURL = (NSURL *)v35;

    v37 = objc_msgSend(v20, "copy");
    personalizationFeatureID = v28->_personalizationFeatureID;
    v28->_personalizationFeatureID = (NSString *)v37;

    v39 = objc_msgSend(v21, "copy");
    items = v28->_items;
    v28->_items = (NSOrderedSet *)v39;

    v41 = objc_msgSend(v27, "copy");
    rankingFeedback = v28->_rankingFeedback;
    v28->_rankingFeedback = (SFRankingFeedback *)v41;

    v43 = objc_msgSend(v23, "copy");
    displayDescriptor = v28->_displayDescriptor;
    v28->_displayDescriptor = (NTPBSectionDisplayDescriptor *)v43;

    v45 = objc_msgSend(v24, "copy");
    referralBarName = v28->_referralBarName;
    v28->_referralBarName = (NSString *)v45;

    v47 = objc_msgSend(v26, "copy");
    backingTagID = v28->_backingTagID;
    v28->_backingTagID = (NSString *)v47;

  }
  return v28;
}

+ (id)_itemClassesByType
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = &unk_24DB6EBF8;
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE6CB48], "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTSection identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("identifier"), v4);

  -[NTSection name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("name"), v5);

  -[NTSection actionTitle](self, "actionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("actionTitle"), v6);

  -[NTSection actionURL](self, "actionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("actionURL"), v8);

  -[NTSection items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("items"), v9);

  objc_msgSend(v3, "descriptionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __29__NTSection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __29__NTSection_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "itemType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

  }
}

id __27__NTSection_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_itemClassesByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", v6);

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v8, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)actionTitle
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)actionURL
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)nameActionURL
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameActionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)backgroundColorLight
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColorLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)backgroundColorDark
{
  void *v2;
  void *v3;

  -[NTSection displayDescriptor](self, "displayDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColorDark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (void)setSubidentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setActionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setRankingFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (void)setReferralBarName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setBackingTagID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDisplayDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"displayDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
