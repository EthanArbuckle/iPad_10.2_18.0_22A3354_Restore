@implementation HDDataEntityInsertionContext

- (HDDataEntityInsertionContext)initWithProvenance:(id)a3 creationDate:(double)a4 skipInsertionFilter:(BOOL)a5 resolveAssociations:(BOOL)a6 profile:(id)a7
{
  id v13;
  id v14;
  HDDataEntityInsertionContext *v15;
  HDDataEntityInsertionContext *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDDataEntityInsertionContext;
  v15 = -[HDDataEntityInsertionContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_provenance, a3);
    v16->_creationDate = a4;
    v16->_skipInsertionFilter = a5;
    v16->_resolveAssociations = a6;
    objc_storeStrong((id *)&v16->_profile, a7);
    v16->_defaultCreationDate = CFAbsoluteTimeGetCurrent();
  }

  return v16;
}

- (void)prepareObjectForInsertion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double creationDate;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  -[HDDataOriginProvenance sourceID](self->_provenance, "sourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceRevision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSourceID:", v4);

  creationDate = self->_creationDate;
  if (creationDate != 2.22507386e-308)
    goto LABEL_4;
  objc_msgSend(v10, "_creationTimestamp");
  v8 = v10;
  if (v9 == 2.22507386e-308)
  {
    creationDate = self->_defaultCreationDate;
LABEL_4:
    objc_msgSend(v10, "_setCreationTimestamp:", creationDate);
    v8 = v10;
  }

}

- (HDDataOriginProvenance)provenance
{
  return self->_provenance;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (BOOL)skipInsertionFilter
{
  return self->_skipInsertionFilter;
}

- (BOOL)resolveAssociations
{
  return self->_resolveAssociations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
