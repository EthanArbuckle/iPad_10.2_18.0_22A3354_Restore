@implementation GDSQLRelationshipIdTripleRowIterator

- (GDSQLRelationshipIdTripleRowIterator)initWithLazyTripleRow:(id)a3
{
  id v5;
  GDSQLRelationshipIdTripleRowIterator *v6;
  GDSQLRelationshipIdTripleRowIterator *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *iterateSubjectValue;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *iteratePredicateValue;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *iterateRelationshipIdValue;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GDSQLRelationshipIdTripleRowIterator;
  v6 = -[GDSQLRelationshipIdTripleRowIterator init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lazyTripleRow, a3);
    objc_msgSend_subject(v5, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    iterateSubjectValue = v7->_iterateSubjectValue;
    v7->_iterateSubjectValue = (NSString *)v10;

    objc_msgSend_predicate(v5, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    iteratePredicateValue = v7->_iteratePredicateValue;
    v7->_iteratePredicateValue = (NSString *)v14;

    objc_msgSend_relationshipId(v5, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    iterateRelationshipIdValue = v7->_iterateRelationshipIdValue;
    v7->_iterateRelationshipIdValue = (NSString *)v18;

  }
  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  GDLazyGraphTripleRow *lazyTripleRow;
  GDLazyGraphTripleRowCursor *cursor;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char isEqualToString;

  if (a3->var0)
  {
    sub_1AE90E770((uint64_t)self->_lazyTripleRow, a2, (uint64_t)a3);
  }
  else
  {
    a3->var0 = 1;
    a3->var1 = (id *)&self->_lazyTripleRow;
    a3->var2 = (unint64_t *)self;
  }
  lazyTripleRow = self->_lazyTripleRow;
  if (lazyTripleRow)
  {
    cursor = lazyTripleRow->_cursor;
    if (cursor)
    {
      if (cursor->_done)
        return 0;
    }
  }
  objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToString_(v8, v9, (uint64_t)self->_iterateSubjectValue))
    goto LABEL_12;
  objc_msgSend_predicate(self->_lazyTripleRow, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)self->_iteratePredicateValue) & 1) == 0)
  {

LABEL_12:
    return 0;
  }
  objc_msgSend_relationshipId(self->_lazyTripleRow, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)self->_iterateRelationshipIdValue);

  return (isEqualToString & 1) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterateRelationshipIdValue, 0);
  objc_storeStrong((id *)&self->_iteratePredicateValue, 0);
  objc_storeStrong((id *)&self->_iterateSubjectValue, 0);
  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

@end
