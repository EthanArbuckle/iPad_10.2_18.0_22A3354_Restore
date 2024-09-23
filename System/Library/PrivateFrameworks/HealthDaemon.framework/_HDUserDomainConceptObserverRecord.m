@implementation _HDUserDomainConceptObserverRecord

- (_HDUserDomainConceptObserverRecord)init
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

- (_HDUserDomainConceptObserverRecord)initWithUserDomainConcept:(id)a3 modificationType:(int64_t)a4
{
  id v7;
  _HDUserDomainConceptObserverRecord *v8;
  _HDUserDomainConceptObserverRecord *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUserDomainConceptObserverRecord;
  v8 = -[_HDUserDomainConceptObserverRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDomainConcept, a3);
    v9->_changeType = a4;
  }

  return v9;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (HKUserDomainConcept)userDomainConcept
{
  return self->_userDomainConcept;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDomainConcept, 0);
}

@end
