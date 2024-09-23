@implementation CNChangeHistoryFetchRequest

- (CNChangeHistoryFetchRequest)init
{
  CNChangeHistoryFetchRequest *v2;
  CNChangeHistoryFetchRequest *v3;
  CNChangeHistoryFetchRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNChangeHistoryFetchRequest;
  v2 = -[CNChangeHistoryFetchRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resultType = 2;
    v2->_shouldUnifyResults = 1;
    v4 = v2;
  }

  return v3;
}

- (CNChangeHistoryFetchRequest)initWithClientIdentifier:(id)a3
{
  id v4;
  CNChangeHistoryFetchRequest *v5;
  CNChangeHistoryFetchRequest *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  CNChangeHistoryFetchRequest *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNChangeHistoryFetchRequest;
  v5 = -[CNChangeHistoryFetchRequest init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_resultType = 2;
    v7 = objc_msgSend(v4, "copy");
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v7;

    v6->_includeGroupChanges = 0;
    v6->_includeChangeAnchors = 0;
    v6->_includeChangeIDs = 0;
    v6->_includeExternalIDs = 0;
    v6->_includeImagesChanged = 0;
    v6->_includeLabeledValueChanges = 0;
    v6->_includeLinkingChanges = 0;
    v6->_includeMeCardChanges = 0;
    v6->_shouldUnifyResults = 1;
    v6->_mutableObjects = 0;
    v6->_enforceClientIdentifier = 1;
    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryFetchRequest)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryFetchRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  void *v9;
  uint64_t v10;
  NSString *containerIdentifier;
  void *v12;
  uint64_t v13;
  NSData *startingToken;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *excludedTransactionAuthors;
  CNChangeHistoryFetchRequest *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNChangeHistoryFetchRequest;
  v5 = -[CNChangeHistoryFetchRequest init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    v5->_shouldUnifyResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldUnifyResults"));
    v5->_includeGroupChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeGroupChanges"));
    v5->_includeChangeAnchors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeChangeAnchors"));
    v5->_includeChangeIDs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeChangeIDs"));
    v5->_includeExternalIDs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeExternalIDs"));
    v5->_includeImagesChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeImagesChanged"));
    v5->_includeLabeledValueChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeLabeledValueChanges"));
    v5->_includeLinkingChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeLinkingChanges"));
    v5->_includeMeCardChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeMeCardChanges"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    v5->_enforceClientIdentifier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enforceClientIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startingToken"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    startingToken = v5->_startingToken;
    v5->_startingToken = (NSData *)v13;

    v5->_resultType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_resultType"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_excludedTransactionAuthors"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    excludedTransactionAuthors = v5->_excludedTransactionAuthors;
    v5->_excludedTransactionAuthors = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientIdentifier;
  id v5;

  clientIdentifier = self->_clientIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientIdentifier, CFSTR("_clientIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUnifyResults, CFSTR("_shouldUnifyResults"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeGroupChanges, CFSTR("_includeGroupChanges"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeChangeAnchors, CFSTR("_includeChangeAnchors"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeChangeIDs, CFSTR("_includeChangeIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeExternalIDs, CFSTR("_includeExternalIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeImagesChanged, CFSTR("_includeImagesChanged"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeLabeledValueChanges, CFSTR("_includeLabeledValueChanges"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeLinkingChanges, CFSTR("_includeLinkingChanges"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeMeCardChanges, CFSTR("_includeMeCardChanges"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enforceClientIdentifier, CFSTR("_enforceClientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startingToken, CFSTR("_startingToken"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultType, CFSTR("_resultType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedTransactionAuthors, CFSTR("_excludedTransactionAuthors"));

}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("resultType"), -[CNChangeHistoryFetchRequest resultType](self, "resultType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest shouldUnifyResults](self, "shouldUnifyResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("shouldUnifyResults"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeGroupChanges](self, "includeGroupChanges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeGroupChanges"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeExternalIDs](self, "includeExternalIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeExternalIDs"), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeLabeledValueChanges](self, "includeLabeledValueChanges"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeLabeledValueChanges"), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeLinkingChanges](self, "includeLinkingChanges"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeLinkingChanges"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeMeCardChanges](self, "includeMeCardChanges"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeMeCardChanges"), v15);

  -[CNChangeHistoryFetchRequest containerIdentifier](self, "containerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifier"), v17);

  -[CNChangeHistoryFetchRequest startingAnchor](self, "startingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CNChangeHistoryFetchRequest startingAnchor](self, "startingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("startingAnchor"), v20);

  }
  v22 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("shouldEnforceClientIdentifier"), -[CNChangeHistoryFetchRequest shouldEnforceClientIdentifer](self, "shouldEnforceClientIdentifer"));
  -[CNChangeHistoryFetchRequest excludedTransactionAuthors](self, "excludedTransactionAuthors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("excludedTransactionAuthors"), v23);

  -[CNChangeHistoryFetchRequest clientIdentifier](self, "clientIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("clientIdentifier"), v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeChangeAnchors](self, "includeChangeAnchors"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeChangeAnchors"), v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeChangeIDs](self, "includeChangeIDs"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeChangeIDs"), v29);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryFetchRequest includeImagesChanged](self, "includeImagesChanged"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includeImagesChanged"), v31);

  objc_msgSend(v3, "build");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (CNChangeHistoryAnchor)startingAnchor
{
  CNChangeHistoryAnchor *v3;
  void *v4;
  CNChangeHistoryAnchor *v5;

  v3 = [CNChangeHistoryAnchor alloc];
  -[CNChangeHistoryFetchRequest startingToken](self, "startingToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNChangeHistoryAnchor initWithHistoryToken:error:](v3, "initWithHistoryToken:error:", v4, 0);

  return v5;
}

- (void)setStartingAnchor:(id)a3
{
  id v4;

  objc_msgSend(a3, "historyToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryFetchRequest setStartingToken:](self, "setStartingToken:", v4);

}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitChangeHistoryFetchRequest:", self);
}

- (void)setUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
}

- (BOOL)unifyResults
{
  return self->_shouldUnifyResults;
}

- (NSData)startingToken
{
  return self->_startingToken;
}

- (void)setStartingToken:(NSData *)startingToken
{
  objc_setProperty_nonatomic_copy(self, a2, startingToken, 24);
}

- (NSArray)additionalContactKeyDescriptors
{
  return self->_additionalContactKeyDescriptors;
}

- (void)setAdditionalContactKeyDescriptors:(NSArray *)additionalContactKeyDescriptors
{
  objc_setProperty_nonatomic_copy(self, a2, additionalContactKeyDescriptors, 32);
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)shouldUnifyResults
{
  self->_shouldUnifyResults = shouldUnifyResults;
}

- (BOOL)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(BOOL)mutableObjects
{
  self->_mutableObjects = mutableObjects;
}

- (BOOL)includeGroupChanges
{
  return self->_includeGroupChanges;
}

- (void)setIncludeGroupChanges:(BOOL)includeGroupChanges
{
  self->_includeGroupChanges = includeGroupChanges;
}

- (NSArray)excludedTransactionAuthors
{
  return self->_excludedTransactionAuthors;
}

- (void)setExcludedTransactionAuthors:(NSArray *)excludedTransactionAuthors
{
  objc_setProperty_nonatomic_copy(self, a2, excludedTransactionAuthors, 40);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (BOOL)shouldEnforceClientIdentifer
{
  return self->_enforceClientIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)includeChangeAnchors
{
  return self->_includeChangeAnchors;
}

- (void)setIncludeChangeAnchors:(BOOL)a3
{
  self->_includeChangeAnchors = a3;
}

- (BOOL)includeChangeIDs
{
  return self->_includeChangeIDs;
}

- (void)setIncludeChangeIDs:(BOOL)a3
{
  self->_includeChangeIDs = a3;
}

- (BOOL)includeExternalIDs
{
  return self->_includeExternalIDs;
}

- (void)setIncludeExternalIDs:(BOOL)a3
{
  self->_includeExternalIDs = a3;
}

- (BOOL)includeImagesChanged
{
  return self->_includeImagesChanged;
}

- (void)setIncludeImagesChanged:(BOOL)a3
{
  self->_includeImagesChanged = a3;
}

- (BOOL)includeLabeledValueChanges
{
  return self->_includeLabeledValueChanges;
}

- (void)setIncludeLabeledValueChanges:(BOOL)a3
{
  self->_includeLabeledValueChanges = a3;
}

- (BOOL)includeLinkingChanges
{
  return self->_includeLinkingChanges;
}

- (void)setIncludeLinkingChanges:(BOOL)a3
{
  self->_includeLinkingChanges = a3;
}

- (BOOL)includeMeCardChanges
{
  return self->_includeMeCardChanges;
}

- (void)setIncludeMeCardChanges:(BOOL)a3
{
  self->_includeMeCardChanges = a3;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_excludedTransactionAuthors, 0);
  objc_storeStrong((id *)&self->_additionalContactKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_startingToken, 0);
}

@end
