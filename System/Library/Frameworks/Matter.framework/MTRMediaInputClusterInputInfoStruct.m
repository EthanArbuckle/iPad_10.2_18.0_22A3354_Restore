@implementation MTRMediaInputClusterInputInfoStruct

- (MTRMediaInputClusterInputInfoStruct)init
{
  MTRMediaInputClusterInputInfoStruct *v2;
  MTRMediaInputClusterInputInfoStruct *v3;
  NSNumber *index;
  NSNumber *inputType;
  NSString *name;
  NSString *descriptionString;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRMediaInputClusterInputInfoStruct;
  v2 = -[MTRMediaInputClusterInputInfoStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    index = v2->_index;
    v2->_index = (NSNumber *)&unk_250591B18;

    inputType = v3->_inputType;
    v3->_inputType = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = (NSString *)&stru_2505249E8;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMediaInputClusterInputInfoStruct *v4;
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

  v4 = objc_alloc_init(MTRMediaInputClusterInputInfoStruct);
  objc_msgSend_index(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_inputType(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputType_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  objc_msgSend_descriptionString(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDescriptionString_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: index:%@; inputType:%@; name:%@; descriptionString:%@; >"),
    v5,
    self->_index,
    self->_inputType,
    self->_name,
    self->_descriptionString);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(NSNumber *)index
{
  objc_setProperty_nonatomic_copy(self, a2, index, 8);
}

- (NSNumber)inputType
{
  return self->_inputType;
}

- (void)setInputType:(NSNumber *)inputType
{
  objc_setProperty_nonatomic_copy(self, a2, inputType, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(NSString *)descriptionString
{
  objc_setProperty_nonatomic_copy(self, a2, descriptionString, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inputType, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
