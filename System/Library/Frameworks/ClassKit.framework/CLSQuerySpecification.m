@implementation CLSQuerySpecification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CLSQuerySpecification)querySpecificationWithObjectType:(Class)a3 predicate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend_initWithObjectType_predicate_(v7, v8, (uint64_t)a3, v6);

  return (CLSQuerySpecification *)v9;
}

+ (CLSQuerySpecification)querySpecificationWithObjectName:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v10 = (void *)objc_msgSend_initWithObjectName_predicate_(v8, v9, (uint64_t)v7, v6);

  return (CLSQuerySpecification *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *entityName;
  id v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  id v17;

  entityName = self->_entityName;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)entityName, CFSTR("entityName"));
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)self->_predicate, CFSTR("predicate"));
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_sortDescriptors, CFSTR("sortDescriptors"));
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, self->_offset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("offset"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v12, self->_limit);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v13, CFSTR("limit"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, self->_observerOptions);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)v17, CFSTR("observerOptions"));

}

- (CLSQuerySpecification)initWithCoder:(id)a3
{
  id v4;
  CLSQuerySpecification *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSString *entityName;
  const char *v16;
  uint64_t v17;
  NSPredicate *predicate;
  const char *v19;
  uint64_t v20;
  NSArray *sortDescriptors;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CLSQuerySpecification;
  v5 = -[CLSQuerySpecification init](&v38, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v10, v7, v8, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("entityName"));
    v14 = objc_claimAutoreleasedReturnValue();
    entityName = v5->_entityName;
    v5->_entityName = (NSString *)v14;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v11, CFSTR("predicate"));
    v17 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v17;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v11, CFSTR("sortDescriptors"));
    v20 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("offset"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_offset = objc_msgSend_unsignedIntegerValue(v24, v25, v26);

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("limit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_limit = objc_msgSend_unsignedIntegerValue(v29, v30, v31);

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, CFSTR("observerOptions"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_observerOptions = objc_msgSend_unsignedIntegerValue(v34, v35, v36);

  }
  return v5;
}

- (CLSQuerySpecification)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSQuerySpecification)initWithObjectType:(Class)a3 predicate:(id)a4
{
  id v7;
  CLSQuerySpecification *v8;
  uint64_t v9;
  NSString *entityName;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSQuerySpecification;
  v8 = -[CLSQuerySpecification init](&v12, sel_init);
  if (v8)
  {
    NSStringFromClass(a3);
    v9 = objc_claimAutoreleasedReturnValue();
    entityName = v8->_entityName;
    v8->_entityName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_predicate, a4);
    v8->_limit = 0;
    v8->_offset = 0;
  }

  return v8;
}

- (CLSQuerySpecification)initWithObjectName:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  CLSQuerySpecification *v9;
  CLSQuerySpecification *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSQuerySpecification;
  v9 = -[CLSQuerySpecification init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityName, a3);
    objc_storeStrong((id *)&v10->_predicate, a4);
    v10->_limit = 0;
    v10->_offset = 0;
  }

  return v10;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)observerOptions
{
  return self->_observerOptions;
}

- (void)setObserverOptions:(unint64_t)a3
{
  self->_observerOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

@end
