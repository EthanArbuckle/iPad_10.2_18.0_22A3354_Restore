@implementation CNSocialProfileContactPredicate

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;

  v7 = (void *)MEMORY[0x1E0D19820];
  v32 = a5;
  objc_msgSend(v7, "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithNumericValue:", -1);
  v8 = objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0D19948]);
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "username");
  v9 = objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "userIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bundleIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "teamIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v8;
  v25 = v8;
  v18 = (void *)v9;
  v19 = (void *)objc_msgSend(v26, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:label:extractionInfo:recordId:", v9, v10, v11, v13, v15, v17, 0, v34, v25);

  v20 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(v20, "completionHandlerAdapter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contactMatchesBySocialProfile:withCompletion:", v19, v21);

  objc_msgSend(v20, "future");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resultWithTimeout:error:", a6, *(double *)&CNSuggestionsServiceDefaultTimeout);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23 && objc_msgSend(MEMORY[0x1E0D13A50], "isTimeoutError:", *a6))
    CNSetError(a6, 1001, 0);

  return v23;
}

- (CNSocialProfileContactPredicate)initWithSocialProfile:(id)a3
{
  id v4;
  CNSocialProfileContactPredicate *v5;
  uint64_t v6;
  CNSocialProfile *socialProfile;
  CNSocialProfileContactPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSocialProfileContactPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (CNSocialProfile *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingSocialProfile:]"));
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("socialProfile"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSocialProfileContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNSocialProfileContactPredicate *v5;
  void *v6;
  uint64_t v7;
  CNSocialProfile *socialProfile;
  CNSocialProfileContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNSocialProfileContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_socialProfile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (CNSocialProfile *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNSocialProfileContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_socialProfile, CFSTR("_socialProfile"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CNSocialProfileContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __43__CNSocialProfileContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "socialProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "socialProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __39__CNSocialProfileContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNSocialProfileContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "socialProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (CNSocialProfile)socialProfile
{
  return self->_socialProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfile, 0);
}

@end
