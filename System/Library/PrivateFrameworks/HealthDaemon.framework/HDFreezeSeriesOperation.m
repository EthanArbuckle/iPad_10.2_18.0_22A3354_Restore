@implementation HDFreezeSeriesOperation

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  NSUUID *v6;
  NSUUID *frozenIdentifier;

  -[objc_class freezeSeriesWithIdentifier:metadata:profile:error:](self->_entityClass, "freezeSeriesWithIdentifier:metadata:profile:error:", self->_identifier, self->_metadata, a3, a5);
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  frozenIdentifier = self->_frozenIdentifier;
  self->_frozenIdentifier = v6;

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFreezeSeriesOperation)initWithCoder:(id)a3
{
  id v4;
  HDFreezeSeriesOperation *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  NSDictionary *metadata;
  NSString *v11;
  NSString *v12;
  uint64_t v13;
  Class entityClass;
  HDFreezeSeriesOperation *v15;
  NSObject *v17;
  uint8_t v18[16];
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDFreezeSeriesOperation;
  v5 = -[HDFreezeSeriesOperation init](&v19, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("metadata"));
  v9 = objc_claimAutoreleasedReturnValue();
  metadata = v5->_metadata;
  v5->_metadata = (NSDictionary *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity_class"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || (NSClassFromString(v11),
        v13 = objc_claimAutoreleasedReturnValue(),
        entityClass = v5->_entityClass,
        v5->_entityClass = (Class)v13,
        entityClass,
        v5->_entityClass))
  {

LABEL_5:
    v15 = v5;
    goto LABEL_6;
  }
  v17 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_fault_impl(&dword_1B7802000, v17, OS_LOG_TYPE_FAULT, "_entityClass != Nil", v18, 2u);
  }

  v15 = 0;
LABEL_6:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  NSStringFromClass(self->_entityClass);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("entity_class"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenIdentifier, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
