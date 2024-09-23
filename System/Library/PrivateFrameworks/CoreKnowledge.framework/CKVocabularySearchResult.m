@implementation CKVocabularySearchResult

- (CKVocabularySearchResult)initWithVocabularyItem:(id)a3 originAppId:(id)a4
{
  id v6;
  id v7;
  CKVocabularySearchResult *v8;
  uint64_t v9;
  CKVocabularyItem *vocabularyItem;
  uint64_t v11;
  NSString *originAppId;
  CKVocabularySearchResult *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKVocabularySearchResult;
  v8 = -[CKVocabularySearchResult init](&v15, sel_init);
  if (!v8)
    goto LABEL_4;
  v9 = objc_msgSend(v6, "copy");
  vocabularyItem = v8->_vocabularyItem;
  v8->_vocabularyItem = (CKVocabularyItem *)v9;

  if (!v8->_vocabularyItem)
    goto LABEL_5;
  v11 = objc_msgSend(v7, "copy");
  originAppId = v8->_originAppId;
  v8->_originAppId = (NSString *)v11;

  if (v8->_originAppId)
LABEL_4:
    v13 = v8;
  else
LABEL_5:
    v13 = 0;

  return v13;
}

- (CKVocabularySearchResult)initWithCoder:(id)a3
{
  id v4;
  CKVocabularySearchResult *v5;
  uint64_t v6;
  CKVocabularyItem *vocabularyItem;
  uint64_t v8;
  NSString *originAppId;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKVocabularySearchResult;
  v5 = -[CKVocabularySearchResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("item"));
    v6 = objc_claimAutoreleasedReturnValue();
    vocabularyItem = v5->_vocabularyItem;
    v5->_vocabularyItem = (CKVocabularyItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appId"));
    v8 = objc_claimAutoreleasedReturnValue();
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v8;

  }
  return v5;
}

- (CKVocabularySearchResult)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use -initWithItem:appId:"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVocabularySearchResult;
  -[CKVocabularySearchResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" appId: %@, vocabularyItem: %@"), self->_originAppId, self->_vocabularyItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CKVocabularyItem *vocabularyItem;
  id v5;

  vocabularyItem = self->_vocabularyItem;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", vocabularyItem, CFSTR("item"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originAppId, CFSTR("appId"));

}

- (BOOL)isEqual:(id)a3
{
  CKVocabularySearchResult *v4;
  CKVocabularySearchResult *v5;
  BOOL v6;

  v4 = (CKVocabularySearchResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVocabularySearchResult isEqualToSearchResult:](self, "isEqualToSearchResult:", v5);

  return v6;
}

- (BOOL)isEqualToSearchResult:(id)a3
{
  id v4;
  void *v5;
  CKVocabularyItem *vocabularyItem;
  void *v7;
  NSString *originAppId;
  void *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (vocabularyItem = self->_vocabularyItem,
        objc_msgSend(v4, "vocabularyItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(vocabularyItem) = -[CKVocabularyItem isEqual:](vocabularyItem, "isEqual:", v7),
        v7,
        (_DWORD)vocabularyItem))
  {
    originAppId = self->_originAppId;
    objc_msgSend(v5, "originAppId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqual:](originAppId, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[CKVocabularyItem hash](self->_vocabularyItem, "hash");
  return -[NSString hash](self->_originAppId, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[CKVocabularyItem copyWithZone:](self->_vocabularyItem, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_originAppId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (CKVocabularyItem)vocabularyItem
{
  return self->_vocabularyItem;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_vocabularyItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
