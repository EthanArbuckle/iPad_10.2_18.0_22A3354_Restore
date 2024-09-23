@implementation MTRUnitTestingClusterNullablesAndOptionalsStruct

- (MTRUnitTestingClusterNullablesAndOptionalsStruct)init
{
  MTRUnitTestingClusterNullablesAndOptionalsStruct *v2;
  MTRUnitTestingClusterNullablesAndOptionalsStruct *v3;
  NSNumber *nullableInt;
  NSNumber *optionalInt;
  NSNumber *nullableOptionalInt;
  NSString *nullableString;
  NSString *optionalString;
  NSString *nullableOptionalString;
  MTRUnitTestingClusterSimpleStruct *nullableStruct;
  MTRUnitTestingClusterSimpleStruct *optionalStruct;
  MTRUnitTestingClusterSimpleStruct *nullableOptionalStruct;
  NSArray *nullableList;
  NSArray *optionalList;
  NSArray *nullableOptionalList;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRUnitTestingClusterNullablesAndOptionalsStruct;
  v2 = -[MTRUnitTestingClusterNullablesAndOptionalsStruct init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    nullableInt = v2->_nullableInt;
    v2->_nullableInt = 0;

    optionalInt = v3->_optionalInt;
    v3->_optionalInt = 0;

    nullableOptionalInt = v3->_nullableOptionalInt;
    v3->_nullableOptionalInt = 0;

    nullableString = v3->_nullableString;
    v3->_nullableString = 0;

    optionalString = v3->_optionalString;
    v3->_optionalString = 0;

    nullableOptionalString = v3->_nullableOptionalString;
    v3->_nullableOptionalString = 0;

    nullableStruct = v3->_nullableStruct;
    v3->_nullableStruct = 0;

    optionalStruct = v3->_optionalStruct;
    v3->_optionalStruct = 0;

    nullableOptionalStruct = v3->_nullableOptionalStruct;
    v3->_nullableOptionalStruct = 0;

    nullableList = v3->_nullableList;
    v3->_nullableList = 0;

    optionalList = v3->_optionalList;
    v3->_optionalList = 0;

    nullableOptionalList = v3->_nullableOptionalList;
    v3->_nullableOptionalList = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterNullablesAndOptionalsStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
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
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;

  v4 = objc_alloc_init(MTRUnitTestingClusterNullablesAndOptionalsStruct);
  objc_msgSend_nullableInt(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableInt_(v4, v8, (uint64_t)v7);

  objc_msgSend_optionalInt(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionalInt_(v4, v12, (uint64_t)v11);

  objc_msgSend_nullableOptionalInt(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableOptionalInt_(v4, v16, (uint64_t)v15);

  objc_msgSend_nullableString(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableString_(v4, v20, (uint64_t)v19);

  objc_msgSend_optionalString(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionalString_(v4, v24, (uint64_t)v23);

  objc_msgSend_nullableOptionalString(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableOptionalString_(v4, v28, (uint64_t)v27);

  objc_msgSend_nullableStruct(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableStruct_(v4, v32, (uint64_t)v31);

  objc_msgSend_optionalStruct(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionalStruct_(v4, v36, (uint64_t)v35);

  objc_msgSend_nullableOptionalStruct(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableOptionalStruct_(v4, v40, (uint64_t)v39);

  objc_msgSend_nullableList(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableList_(v4, v44, (uint64_t)v43);

  objc_msgSend_optionalList(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionalList_(v4, v48, (uint64_t)v47);

  objc_msgSend_nullableOptionalList(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableOptionalList_(v4, v52, (uint64_t)v51);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: nullableInt:%@; optionalInt:%@; nullableOptionalInt:%@; nullableString:%@; optionalString:%@; nullableOptionalString:%@; nullableStruct:%@; optionalStruct:%@; nullableOptionalStruct:%@; nullableList:%@; optionalList:%@; nullableOptionalList:%@; >"),
    v5,
    self->_nullableInt,
    self->_optionalInt,
    self->_nullableOptionalInt,
    self->_nullableString,
    self->_optionalString,
    self->_nullableOptionalString,
    self->_nullableStruct,
    self->_optionalStruct,
    self->_nullableOptionalStruct,
    self->_nullableList,
    self->_optionalList,
    self->_nullableOptionalList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)nullableInt
{
  return self->_nullableInt;
}

- (void)setNullableInt:(NSNumber *)nullableInt
{
  objc_setProperty_nonatomic_copy(self, a2, nullableInt, 8);
}

- (NSNumber)optionalInt
{
  return self->_optionalInt;
}

- (void)setOptionalInt:(NSNumber *)optionalInt
{
  objc_setProperty_nonatomic_copy(self, a2, optionalInt, 16);
}

- (NSNumber)nullableOptionalInt
{
  return self->_nullableOptionalInt;
}

- (void)setNullableOptionalInt:(NSNumber *)nullableOptionalInt
{
  objc_setProperty_nonatomic_copy(self, a2, nullableOptionalInt, 24);
}

- (NSString)nullableString
{
  return self->_nullableString;
}

- (void)setNullableString:(NSString *)nullableString
{
  objc_setProperty_nonatomic_copy(self, a2, nullableString, 32);
}

- (NSString)optionalString
{
  return self->_optionalString;
}

- (void)setOptionalString:(NSString *)optionalString
{
  objc_setProperty_nonatomic_copy(self, a2, optionalString, 40);
}

- (NSString)nullableOptionalString
{
  return self->_nullableOptionalString;
}

- (void)setNullableOptionalString:(NSString *)nullableOptionalString
{
  objc_setProperty_nonatomic_copy(self, a2, nullableOptionalString, 48);
}

- (MTRUnitTestingClusterSimpleStruct)nullableStruct
{
  return self->_nullableStruct;
}

- (void)setNullableStruct:(MTRUnitTestingClusterSimpleStruct *)nullableStruct
{
  objc_setProperty_nonatomic_copy(self, a2, nullableStruct, 56);
}

- (MTRUnitTestingClusterSimpleStruct)optionalStruct
{
  return self->_optionalStruct;
}

- (void)setOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)optionalStruct
{
  objc_setProperty_nonatomic_copy(self, a2, optionalStruct, 64);
}

- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStruct
{
  return self->_nullableOptionalStruct;
}

- (void)setNullableOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStruct
{
  objc_setProperty_nonatomic_copy(self, a2, nullableOptionalStruct, 72);
}

- (NSArray)nullableList
{
  return self->_nullableList;
}

- (void)setNullableList:(NSArray *)nullableList
{
  objc_setProperty_nonatomic_copy(self, a2, nullableList, 80);
}

- (NSArray)optionalList
{
  return self->_optionalList;
}

- (void)setOptionalList:(NSArray *)optionalList
{
  objc_setProperty_nonatomic_copy(self, a2, optionalList, 88);
}

- (NSArray)nullableOptionalList
{
  return self->_nullableOptionalList;
}

- (void)setNullableOptionalList:(NSArray *)nullableOptionalList
{
  objc_setProperty_nonatomic_copy(self, a2, nullableOptionalList, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nullableOptionalList, 0);
  objc_storeStrong((id *)&self->_optionalList, 0);
  objc_storeStrong((id *)&self->_nullableList, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStruct, 0);
  objc_storeStrong((id *)&self->_optionalStruct, 0);
  objc_storeStrong((id *)&self->_nullableStruct, 0);
  objc_storeStrong((id *)&self->_nullableOptionalString, 0);
  objc_storeStrong((id *)&self->_optionalString, 0);
  objc_storeStrong((id *)&self->_nullableString, 0);
  objc_storeStrong((id *)&self->_nullableOptionalInt, 0);
  objc_storeStrong((id *)&self->_optionalInt, 0);
  objc_storeStrong((id *)&self->_nullableInt, 0);
}

@end
