@implementation DAMailboxSearchQuery

+ (id)mailboxSearchQueryWithSearchString:(id)a3 consumer:(id)a4
{
  id v5;
  id v6;
  DAMailboxSearchQuery *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DAMailboxSearchQuery initWithSearchString:consumer:]([DAMailboxSearchQuery alloc], "initWithSearchString:consumer:", v6, v5);

  return v7;
}

+ (id)mailboxSearchQueryWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  id v7;
  id v8;
  id v9;
  DAMailboxSearchQuery *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[DAMailboxSearchQuery initWithSearchString:predicate:consumer:]([DAMailboxSearchQuery alloc], "initWithSearchString:predicate:consumer:", v9, v8, v7);

  return v10;
}

- (DAMailboxSearchQuery)initWithSearchString:(id)a3 consumer:(id)a4
{
  DAMailboxSearchQuery *v4;
  DAMailboxSearchQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAMailboxSearchQuery;
  v4 = -[DASearchQuery initWithSearchString:consumer:](&v7, sel_initWithSearchString_consumer_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[DAMailboxSearchQuery setBodyType:](v4, "setBodyType:", 4);
    -[DAMailboxSearchQuery setTruncationSize:](v5, "setTruncationSize:", 0x10000);
    -[DAMailboxSearchQuery setAllOrNone:](v5, "setAllOrNone:", 0);
    -[DAMailboxSearchQuery setMIMESupport:](v5, "setMIMESupport:", 2);
    -[DAMailboxSearchQuery setDeepTraversal:](v5, "setDeepTraversal:", 0);
    -[DAMailboxSearchQuery setRebuildResults:](v5, "setRebuildResults:", 1);
  }
  return v5;
}

- (DAMailboxSearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  DAMailboxSearchQuery *v5;
  DAMailboxSearchQuery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DAMailboxSearchQuery;
  v5 = -[DASearchQuery initWithSearchString:predicate:consumer:](&v8, sel_initWithSearchString_predicate_consumer_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[DAMailboxSearchQuery setBodyType:](v5, "setBodyType:", 4);
    -[DAMailboxSearchQuery setTruncationSize:](v6, "setTruncationSize:", 0x10000);
    -[DAMailboxSearchQuery setAllOrNone:](v6, "setAllOrNone:", 0);
    -[DAMailboxSearchQuery setMIMESupport:](v6, "setMIMESupport:", 2);
    -[DAMailboxSearchQuery setDeepTraversal:](v6, "setDeepTraversal:", 0);
    -[DAMailboxSearchQuery setRebuildResults:](v6, "setRebuildResults:", 1);
  }
  return v6;
}

- (DAMailboxSearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4
{
  id v6;
  DAMailboxSearchQuery *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DAMailboxSearchQuery;
  v7 = -[DASearchQuery initWithDictionaryRepresentation:consumer:](&v17, sel_initWithDictionaryRepresentation_consumer_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchCollectionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setCollectionID:](v7, "setCollectionID:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchBodyType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setBodyType:](v7, "setBodyType:", objc_msgSend(v9, "intValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchTruncationSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setTruncationSize:](v7, "setTruncationSize:", objc_msgSend(v10, "longLongValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchAllOrNone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setAllOrNone:](v7, "setAllOrNone:", objc_msgSend(v11, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchPriorToDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setPriorToDate:](v7, "setPriorToDate:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchMIMESupport"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setMIMESupport:](v7, "setMIMESupport:", objc_msgSend(v13, "intValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchDeepTraversal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setDeepTraversal:](v7, "setDeepTraversal:", objc_msgSend(v14, "BOOLValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageSearchRebuildResults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAMailboxSearchQuery setRebuildResults:](v7, "setRebuildResults:", objc_msgSend(v15, "BOOLValue"));

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DAMailboxSearchQuery;
  -[DASearchQuery dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailboxSearchQuery collectionID](self, "collectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("MessageSearchCollectionID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DAMailboxSearchQuery bodyType](self, "bodyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MessageSearchBodyType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[DAMailboxSearchQuery truncationSize](self, "truncationSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("MessageSearchTruncationSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DAMailboxSearchQuery allOrNone](self, "allOrNone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MessageSearchAllOrNone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DAMailboxSearchQuery MIMESupport](self, "MIMESupport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("MessageSearchMIMESupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DAMailboxSearchQuery deepTraversal](self, "deepTraversal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MessageSearchDeepTraversal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DAMailboxSearchQuery rebuildResults](self, "rebuildResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("MessageSearchRebuildResults"));

  -[DAMailboxSearchQuery priorToDate](self, "priorToDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DAMailboxSearchQuery priorToDate](self, "priorToDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("MessageSearchPriorToDate"));

  }
  return v3;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (int)bodyType
{
  return self->_bodyType;
}

- (void)setBodyType:(int)a3
{
  self->_bodyType = a3;
}

- (int64_t)truncationSize
{
  return self->_truncationSize;
}

- (void)setTruncationSize:(int64_t)a3
{
  self->_truncationSize = a3;
}

- (BOOL)allOrNone
{
  return self->_allOrNone;
}

- (void)setAllOrNone:(BOOL)a3
{
  self->_allOrNone = a3;
}

- (NSDate)priorToDate
{
  return self->_priorToDate;
}

- (void)setPriorToDate:(id)a3
{
  objc_storeStrong((id *)&self->_priorToDate, a3);
}

- (int)MIMESupport
{
  return self->_MIMESupport;
}

- (void)setMIMESupport:(int)a3
{
  self->_MIMESupport = a3;
}

- (BOOL)deepTraversal
{
  return self->_deepTraversal;
}

- (void)setDeepTraversal:(BOOL)a3
{
  self->_deepTraversal = a3;
}

- (BOOL)rebuildResults
{
  return self->_rebuildResults;
}

- (void)setRebuildResults:(BOOL)a3
{
  self->_rebuildResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorToDate, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end
