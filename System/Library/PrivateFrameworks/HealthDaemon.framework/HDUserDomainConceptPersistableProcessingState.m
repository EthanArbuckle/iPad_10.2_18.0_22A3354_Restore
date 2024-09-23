@implementation HDUserDomainConceptPersistableProcessingState

- (HDUserDomainConceptPersistableProcessingState)init
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

- (HDUserDomainConceptPersistableProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(int64_t)a4 maximumPropertyType:(int64_t)a5
{
  HDUserDomainConceptPersistableProcessingState *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDUserDomainConceptPersistableProcessingState;
  result = -[HDUserDomainConceptPersistableProcessingState init](&v9, sel_init);
  if (result)
  {
    result->_anchor = a3;
    result->_ontologyVersion = a4;
    result->_maximumPropertyType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDUserDomainConceptPersistableProcessingState)initWithCoder:(id)a3
{
  id v4;
  HDUserDomainConceptPersistableProcessingState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDUserDomainConceptPersistableProcessingState;
  v5 = -[HDUserDomainConceptPersistableProcessingState init](&v7, sel_init);
  if (v5)
  {
    v5->_anchor = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Anchor"));
    v5->_ontologyVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OntologyVersion"));
    v5->_maximumPropertyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumPropertyType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t anchor;
  id v5;

  anchor = self->_anchor;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", anchor, CFSTR("Anchor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ontologyVersion, CFSTR("OntologyVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumPropertyType, CFSTR("MaximumPropertyType"));

}

+ (BOOL)fetchFromKeyValueDomain:(id)a3 stateOut:(id *)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v12;

  v12 = 0;
  objc_msgSend(a3, "dataForKey:error:", CFSTR("LastProcessedUserDomainConceptStateKey"), &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v8;
  if (v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  if (a5)
  {
    v10 = 0;
    *a5 = objc_retainAutorelease(v8);
  }
  else
  {
    _HKLogDroppedError();
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend(v6, "setData:forKey:error:", v7, CFSTR("LastProcessedUserDomainConceptStateKey"), a4);
  else
    v8 = 0;

  return v8;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (int64_t)ontologyVersion
{
  return self->_ontologyVersion;
}

- (int64_t)maximumPropertyType
{
  return self->_maximumPropertyType;
}

@end
