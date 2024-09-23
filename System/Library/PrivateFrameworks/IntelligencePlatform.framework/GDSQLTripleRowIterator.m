@implementation GDSQLTripleRowIterator

- (GDSQLTripleRowIterator)initWithColumns:(unint64_t)a3 statement:(id)a4 subjectOverride:(id)a5
{
  int v6;
  id v8;
  id v9;
  _BYTE *v10;
  id *v11;
  GDSQLTripleRowIterator *v12;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = sub_1AE90EEA4([GDLazyGraphTripleRowCursor alloc], v6, v9);

  v11 = sub_1AE90EE0C((id *)[GDLazyGraphTripleRow alloc], v10, v8);
  v12 = (GDSQLTripleRowIterator *)sub_1AE90EF5C(self, v11);

  return v12;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  GDLazyGraphTripleRow **p_lazyTripleRow;
  GDLazyGraphTripleRow *lazyTripleRow;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  GDLazyGraphTripleRow *v17;
  GDLazyGraphTripleRowCursor *cursor;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int isEqualToString;
  const char *v30;
  uint64_t v31;
  GDLazyGraphTripleRow *v32;
  GDLazyGraphTripleRowCursor *v33;
  NSString *iterateSubjectValue;
  void *v36;
  const char *v37;
  unsigned int v38;

  p_lazyTripleRow = &self->_lazyTripleRow;
  if (!a3->var0)
  {
    a3->var1 = (id *)p_lazyTripleRow;
    a3->var2 = (unint64_t *)self;
    a3->var0 = 1;
    if (self->_iterateSubjectValue)
      goto LABEL_17;
    lazyTripleRow = *p_lazyTripleRow;
LABEL_13:
    sub_1AE90E770((uint64_t)lazyTripleRow, a2, (uint64_t)a3);
    goto LABEL_17;
  }
  lazyTripleRow = self->_lazyTripleRow;
  if (!self->_internalIteratorStarted)
    goto LABEL_13;
  objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicate(*p_lazyTripleRow, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relationshipId(*p_lazyTripleRow, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AE90E8B0((uint64_t)*p_lazyTripleRow);
  while (1)
  {
    v17 = *p_lazyTripleRow;
    if (*p_lazyTripleRow)
    {
      cursor = v17->_cursor;
      if (cursor)
      {
        if (cursor->_done)
          break;
      }
    }
    objc_msgSend_subject(v17, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v19, v20, (uint64_t)v8))
      goto LABEL_15;
    objc_msgSend_predicate(*p_lazyTripleRow, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v11) & 1) == 0)
    {

LABEL_15:
      break;
    }
    objc_msgSend_relationshipId(*p_lazyTripleRow, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v14);

    if (!isEqualToString)
      break;
    sub_1AE90E770((uint64_t)*p_lazyTripleRow, v30, v31);
  }
  self->_internalIteratorStarted = 0;

LABEL_17:
  v32 = *p_lazyTripleRow;
  if (*p_lazyTripleRow)
  {
    v33 = v32->_cursor;
    if (v33)
    {
      if (v33->_done)
        return 0;
    }
  }
  iterateSubjectValue = self->_iterateSubjectValue;
  if (!iterateSubjectValue)
    return 1;
  objc_msgSend_subject(v32, a2, (uint64_t)a3, a4, a5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_isEqualToString_(iterateSubjectValue, v37, (uint64_t)v36);

  return v38;
}

- (id)relationshipIdIterator
{
  GDLazyGraphTripleRow *lazyTripleRow;
  NSString *subject;
  NSString *v5;
  NSString *v6;
  GDEntityIdentifier *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *predicate;
  NSString *v15;
  NSString *v16;
  NSString *relationshipId;
  NSString *v18;
  NSString *v19;
  NSString *relationshipPredicate;
  NSString *v21;
  NSString *v22;
  NSString *object;
  NSString *v24;
  NSString *v25;
  NSString *sources;
  NSString *v27;
  NSString *v28;
  NSNumber *confidence;
  NSNumber *v30;
  NSNumber *v31;
  NSString *sourceDuplicates;
  NSString *v33;
  NSString *v34;
  NSNumber *timestamp;
  NSNumber *v36;
  NSNumber *v37;
  GDLazyGraphTripleRow *v38;
  GDLazyGraphTripleRow *v39;
  GDLazyGraphTripleRowCursor *cursor;
  NSString *subjectOverride;
  GDLazyGraphTripleRowCursor *v42;
  id *v43;
  GDSQLRelationshipIdTripleRowIterator *v44;
  const char *v45;
  void *v46;

  lazyTripleRow = self->_lazyTripleRow;
  if (lazyTripleRow)
  {
    subject = lazyTripleRow->_subject;
    if (subject || (subject = lazyTripleRow->_subjectOverride) != 0)
    {
      v5 = subject;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, 0);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v6 = lazyTripleRow->_subject;
    lazyTripleRow->_subject = v5;

    v7 = [GDEntityIdentifier alloc];
    v9 = (void *)objc_msgSend_initWithString_(v7, v8, (uint64_t)lazyTripleRow->_subject);
    objc_msgSend_stringValue(v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = lazyTripleRow->_subject;
    lazyTripleRow->_subject = (NSString *)v12;

    predicate = lazyTripleRow->_predicate;
    if (predicate)
    {
      v15 = predicate;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)1);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v16 = lazyTripleRow->_predicate;
    lazyTripleRow->_predicate = v15;

    relationshipId = lazyTripleRow->_relationshipId;
    if (relationshipId)
    {
      v18 = relationshipId;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)2);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v19 = lazyTripleRow->_relationshipId;
    lazyTripleRow->_relationshipId = v18;

    relationshipPredicate = lazyTripleRow->_relationshipPredicate;
    if (relationshipPredicate)
    {
      v21 = relationshipPredicate;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)3);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v22 = lazyTripleRow->_relationshipPredicate;
    lazyTripleRow->_relationshipPredicate = v21;

    object = lazyTripleRow->_object;
    if (object)
    {
      v24 = object;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)4);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v25 = lazyTripleRow->_object;
    lazyTripleRow->_object = v24;

    sources = lazyTripleRow->_sources;
    if (sources)
    {
      v27 = sources;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)5);
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v28 = lazyTripleRow->_sources;
    lazyTripleRow->_sources = v27;

    confidence = lazyTripleRow->_confidence;
    if (confidence)
    {
      v30 = confidence;
    }
    else
    {
      sub_1AE90E4D4((uint64_t)lazyTripleRow->_cursor, (const char *)6);
      v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v31 = lazyTripleRow->_confidence;
    lazyTripleRow->_confidence = v30;

    sourceDuplicates = lazyTripleRow->_sourceDuplicates;
    if (sourceDuplicates)
    {
      v33 = sourceDuplicates;
    }
    else
    {
      sub_1AE90E538((uint64_t)lazyTripleRow->_cursor, (const char *)7);
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v34 = lazyTripleRow->_sourceDuplicates;
    lazyTripleRow->_sourceDuplicates = v33;

    timestamp = lazyTripleRow->_timestamp;
    if (timestamp)
    {
      v36 = timestamp;
    }
    else
    {
      sub_1AE90E4D4((uint64_t)lazyTripleRow->_cursor, (const char *)8);
      v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v37 = lazyTripleRow->_timestamp;
    lazyTripleRow->_timestamp = v36;

  }
  v38 = [GDLazyGraphTripleRow alloc];
  v39 = self->_lazyTripleRow;
  if (v39)
  {
    cursor = v39->_cursor;
    subjectOverride = v39->_subjectOverride;
  }
  else
  {
    cursor = 0;
    subjectOverride = 0;
  }
  v42 = cursor;
  v43 = sub_1AE90EE0C((id *)&v38->super.isa, v42, subjectOverride);

  self->_internalIteratorStarted = 1;
  v44 = [GDSQLRelationshipIdTripleRowIterator alloc];
  v46 = (void *)objc_msgSend_initWithLazyTripleRow_(v44, v45, (uint64_t)v43);

  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterateSubjectValue, 0);
  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

@end
