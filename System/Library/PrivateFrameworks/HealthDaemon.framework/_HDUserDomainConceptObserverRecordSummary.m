@implementation _HDUserDomainConceptObserverRecordSummary

- (_HDUserDomainConceptObserverRecordSummary)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (_HDUserDomainConceptObserverRecordSummary)initWithJournaledConcepts:(id)a3 addedConcepts:(id)a4 updatedConcepts:(id)a5 removedConcepts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _HDUserDomainConceptObserverRecordSummary *v14;
  uint64_t v15;
  NSArray *journaledConcepts;
  uint64_t v17;
  NSArray *addedConcepts;
  uint64_t v19;
  NSArray *updatedConcepts;
  uint64_t v21;
  NSArray *removedConcepts;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_HDUserDomainConceptObserverRecordSummary;
  v14 = -[_HDUserDomainConceptObserverRecordSummary init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    journaledConcepts = v14->_journaledConcepts;
    v14->_journaledConcepts = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    addedConcepts = v14->_addedConcepts;
    v14->_addedConcepts = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    updatedConcepts = v14->_updatedConcepts;
    v14->_updatedConcepts = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    removedConcepts = v14->_removedConcepts;
    v14->_removedConcepts = (NSArray *)v21;

  }
  return v14;
}

- (NSArray)journaledConcepts
{
  return self->_journaledConcepts;
}

- (NSArray)addedConcepts
{
  return self->_addedConcepts;
}

- (NSArray)updatedConcepts
{
  return self->_updatedConcepts;
}

- (NSArray)removedConcepts
{
  return self->_removedConcepts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedConcepts, 0);
  objc_storeStrong((id *)&self->_updatedConcepts, 0);
  objc_storeStrong((id *)&self->_addedConcepts, 0);
  objc_storeStrong((id *)&self->_journaledConcepts, 0);
}

@end
