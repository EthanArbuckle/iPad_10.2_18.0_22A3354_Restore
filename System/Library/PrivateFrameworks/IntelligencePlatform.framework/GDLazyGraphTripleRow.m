@implementation GDLazyGraphTripleRow

- (NSString)subject
{
  NSString *subject;
  NSString *subjectOverride;
  NSString *v6;
  NSString *v7;
  GDEntityIdentifier *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  void *v18;
  const char *v19;

  subject = self->_subject;
  if (!subject)
  {
    subjectOverride = self->_subjectOverride;
    if (subjectOverride)
    {
      v6 = subjectOverride;
    }
    else
    {
      sub_1AE90E538((uint64_t)self->_cursor, 0);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_subject;
    self->_subject = v6;

    v8 = [GDEntityIdentifier alloc];
    v10 = (void *)objc_msgSend_initWithString_(v8, v9, (uint64_t)self->_subject);
    objc_msgSend_stringValue(v10, v11, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_subject;
    self->_subject = v13;

    subject = self->_subject;
    if (!subject)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_subject"));

      subject = self->_subject;
    }
  }
  return subject;
}

- (NSString)predicate
{
  NSString *predicate;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  predicate = self->_predicate;
  if (!predicate)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)1);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_predicate;
    self->_predicate = v5;

    predicate = self->_predicate;
    if (!predicate)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_predicate"));

      predicate = self->_predicate;
    }
  }
  return predicate;
}

- (NSString)relationshipId
{
  NSString *relationshipId;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  relationshipId = self->_relationshipId;
  if (!relationshipId)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)2);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_relationshipId;
    self->_relationshipId = v5;

    relationshipId = self->_relationshipId;
    if (!relationshipId)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_relationshipId"));

      relationshipId = self->_relationshipId;
    }
  }
  return relationshipId;
}

- (NSString)relationshipPredicate
{
  NSString *relationshipPredicate;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  relationshipPredicate = self->_relationshipPredicate;
  if (!relationshipPredicate)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_relationshipPredicate;
    self->_relationshipPredicate = v5;

    relationshipPredicate = self->_relationshipPredicate;
    if (!relationshipPredicate)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_relationshipPredicate"));

      relationshipPredicate = self->_relationshipPredicate;
    }
  }
  return relationshipPredicate;
}

- (NSString)object
{
  NSString *object;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  object = self->_object;
  if (!object)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_object;
    self->_object = v5;

    object = self->_object;
    if (!object)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_object"));

      object = self->_object;
    }
  }
  return object;
}

- (NSString)sources
{
  NSString *sources;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  sources = self->_sources;
  if (!sources)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)5);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sources;
    self->_sources = v5;

    sources = self->_sources;
    if (!sources)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sources"));

      sources = self->_sources;
    }
  }
  return sources;
}

- (double)confidence
{
  uint64_t v2;
  NSNumber *confidence;
  NSNumber *v6;
  NSNumber *v7;
  double result;
  void *v9;
  const char *v10;

  confidence = self->_confidence;
  if (!confidence)
  {
    sub_1AE90E4D4((uint64_t)self->_cursor, (const char *)6);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_confidence;
    self->_confidence = v6;

    confidence = self->_confidence;
    if (!confidence)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_confidence != nil"));

      confidence = self->_confidence;
    }
  }
  objc_msgSend_doubleValue(confidence, a2, v2);
  return result;
}

- (NSString)sourceDuplicates
{
  NSString *sourceDuplicates;
  NSString *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;

  sourceDuplicates = self->_sourceDuplicates;
  if (!sourceDuplicates)
  {
    sub_1AE90E538((uint64_t)self->_cursor, (const char *)7);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sourceDuplicates;
    self->_sourceDuplicates = v5;

    sourceDuplicates = self->_sourceDuplicates;
    if (!sourceDuplicates)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sourceDuplicates"));

      sourceDuplicates = self->_sourceDuplicates;
    }
  }
  return sourceDuplicates;
}

- (double)timestamp
{
  uint64_t v2;
  NSNumber *timestamp;
  NSNumber *v6;
  NSNumber *v7;
  double result;
  void *v9;
  const char *v10;

  timestamp = self->_timestamp;
  if (!timestamp)
  {
    sub_1AE90E4D4((uint64_t)self->_cursor, (const char *)8);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timestamp;
    self->_timestamp = v6;

    timestamp = self->_timestamp;
    if (!timestamp)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, CFSTR("GDSQLTripleRowIterator.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_timestamp != nil"));

      timestamp = self->_timestamp;
    }
  }
  objc_msgSend_doubleValue(timestamp, a2, v2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceDuplicates, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_relationshipPredicate, 0);
  objc_storeStrong((id *)&self->_relationshipId, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_subjectOverride, 0);
}

@end
