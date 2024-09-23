@implementation CNSuggestedContactIdentifierPredicate

- (CNSuggestedContactIdentifierPredicate)initWithSuggestionIdentifier:(unint64_t)a3
{
  CNSuggestedContactIdentifierPredicate *v4;
  CNSuggestedContactIdentifierPredicate *v5;
  CNSuggestedContactIdentifierPredicate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  v4 = -[CNPredicate init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_suggestionIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSuggestedContactIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNSuggestedContactIdentifierPredicate *v5;
  CNSuggestedContactIdentifierPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_suggestionIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_suggestionIdentifier"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNSuggestedContactIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_suggestionIdentifier, CFSTR("_suggestionIdentifier"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForSuggestionIdentifier:]"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CNSuggestedContactIdentifierPredicate suggestionIdentifier](self, "suggestionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D19920];
  v9 = a5;
  objc_msgSend(v8, "recordIdWithInternalEntityId:", -[CNSuggestedContactIdentifierPredicate suggestionIdentifier](self, "suggestionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactFromRecordID:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D197B8]);
    v13 = (void *)objc_msgSend(v12, "initWithContact:matchTokens:matchInfo:", v11, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

@end
