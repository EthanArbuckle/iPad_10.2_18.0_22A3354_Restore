@implementation MTRUnitTestingClusterTestFabricScoped

- (MTRUnitTestingClusterTestFabricScoped)init
{
  MTRUnitTestingClusterTestFabricScoped *v2;
  MTRUnitTestingClusterTestFabricScoped *v3;
  NSNumber *fabricSensitiveInt8u;
  NSNumber *optionalFabricSensitiveInt8u;
  NSNumber *nullableFabricSensitiveInt8u;
  NSNumber *nullableOptionalFabricSensitiveInt8u;
  NSString *fabricSensitiveCharString;
  uint64_t v9;
  MTRUnitTestingClusterSimpleStruct *fabricSensitiveStruct;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *fabricSensitiveInt8uList;
  NSNumber *fabricIndex;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRUnitTestingClusterTestFabricScoped;
  v2 = -[MTRUnitTestingClusterTestFabricScoped init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    fabricSensitiveInt8u = v2->_fabricSensitiveInt8u;
    v2->_fabricSensitiveInt8u = (NSNumber *)&unk_250591B18;

    optionalFabricSensitiveInt8u = v3->_optionalFabricSensitiveInt8u;
    v3->_optionalFabricSensitiveInt8u = 0;

    nullableFabricSensitiveInt8u = v3->_nullableFabricSensitiveInt8u;
    v3->_nullableFabricSensitiveInt8u = 0;

    nullableOptionalFabricSensitiveInt8u = v3->_nullableOptionalFabricSensitiveInt8u;
    v3->_nullableOptionalFabricSensitiveInt8u = 0;

    fabricSensitiveCharString = v3->_fabricSensitiveCharString;
    v3->_fabricSensitiveCharString = (NSString *)&stru_2505249E8;

    v9 = objc_opt_new();
    fabricSensitiveStruct = v3->_fabricSensitiveStruct;
    v3->_fabricSensitiveStruct = (MTRUnitTestingClusterSimpleStruct *)v9;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    fabricSensitiveInt8uList = v3->_fabricSensitiveInt8uList;
    v3->_fabricSensitiveInt8uList = (NSArray *)v13;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestFabricScoped *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestFabricScoped);
  objc_msgSend_fabricSensitiveInt8u(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricSensitiveInt8u_(v4, v8, (uint64_t)v7);

  objc_msgSend_optionalFabricSensitiveInt8u(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionalFabricSensitiveInt8u_(v4, v12, (uint64_t)v11);

  objc_msgSend_nullableFabricSensitiveInt8u(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableFabricSensitiveInt8u_(v4, v16, (uint64_t)v15);

  objc_msgSend_nullableOptionalFabricSensitiveInt8u(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNullableOptionalFabricSensitiveInt8u_(v4, v20, (uint64_t)v19);

  objc_msgSend_fabricSensitiveCharString(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricSensitiveCharString_(v4, v24, (uint64_t)v23);

  objc_msgSend_fabricSensitiveStruct(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricSensitiveStruct_(v4, v28, (uint64_t)v27);

  objc_msgSend_fabricSensitiveInt8uList(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricSensitiveInt8uList_(v4, v32, (uint64_t)v31);

  objc_msgSend_fabricIndex(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v36, (uint64_t)v35);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: fabricSensitiveInt8u:%@; optionalFabricSensitiveInt8u:%@; nullableFabricSensitiveInt8u:%@; nullableOptionalFabricSensitiveInt8u:%@; fabricSensitiveCharString:%@; fabricSensitiveStruct:%@; fabricSensitiveInt8uList:%@; fabricIndex:%@; >"),
    v5,
    self->_fabricSensitiveInt8u,
    self->_optionalFabricSensitiveInt8u,
    self->_nullableFabricSensitiveInt8u,
    self->_nullableOptionalFabricSensitiveInt8u,
    self->_fabricSensitiveCharString,
    self->_fabricSensitiveStruct,
    self->_fabricSensitiveInt8uList,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)fabricSensitiveInt8u
{
  return self->_fabricSensitiveInt8u;
}

- (void)setFabricSensitiveInt8u:(NSNumber *)fabricSensitiveInt8u
{
  objc_setProperty_nonatomic_copy(self, a2, fabricSensitiveInt8u, 8);
}

- (NSNumber)optionalFabricSensitiveInt8u
{
  return self->_optionalFabricSensitiveInt8u;
}

- (void)setOptionalFabricSensitiveInt8u:(NSNumber *)optionalFabricSensitiveInt8u
{
  objc_setProperty_nonatomic_copy(self, a2, optionalFabricSensitiveInt8u, 16);
}

- (NSNumber)nullableFabricSensitiveInt8u
{
  return self->_nullableFabricSensitiveInt8u;
}

- (void)setNullableFabricSensitiveInt8u:(NSNumber *)nullableFabricSensitiveInt8u
{
  objc_setProperty_nonatomic_copy(self, a2, nullableFabricSensitiveInt8u, 24);
}

- (NSNumber)nullableOptionalFabricSensitiveInt8u
{
  return self->_nullableOptionalFabricSensitiveInt8u;
}

- (void)setNullableOptionalFabricSensitiveInt8u:(NSNumber *)nullableOptionalFabricSensitiveInt8u
{
  objc_setProperty_nonatomic_copy(self, a2, nullableOptionalFabricSensitiveInt8u, 32);
}

- (NSString)fabricSensitiveCharString
{
  return self->_fabricSensitiveCharString;
}

- (void)setFabricSensitiveCharString:(NSString *)fabricSensitiveCharString
{
  objc_setProperty_nonatomic_copy(self, a2, fabricSensitiveCharString, 40);
}

- (MTRUnitTestingClusterSimpleStruct)fabricSensitiveStruct
{
  return self->_fabricSensitiveStruct;
}

- (void)setFabricSensitiveStruct:(MTRUnitTestingClusterSimpleStruct *)fabricSensitiveStruct
{
  objc_setProperty_nonatomic_copy(self, a2, fabricSensitiveStruct, 48);
}

- (NSArray)fabricSensitiveInt8uList
{
  return self->_fabricSensitiveInt8uList;
}

- (void)setFabricSensitiveInt8uList:(NSArray *)fabricSensitiveInt8uList
{
  objc_setProperty_nonatomic_copy(self, a2, fabricSensitiveInt8uList, 56);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveInt8uList, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveStruct, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveCharString, 0);
  objc_storeStrong((id *)&self->_nullableOptionalFabricSensitiveInt8u, 0);
  objc_storeStrong((id *)&self->_nullableFabricSensitiveInt8u, 0);
  objc_storeStrong((id *)&self->_optionalFabricSensitiveInt8u, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveInt8u, 0);
}

@end
