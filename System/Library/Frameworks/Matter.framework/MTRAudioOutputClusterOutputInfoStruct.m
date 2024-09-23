@implementation MTRAudioOutputClusterOutputInfoStruct

- (MTRAudioOutputClusterOutputInfoStruct)init
{
  MTRAudioOutputClusterOutputInfoStruct *v2;
  MTRAudioOutputClusterOutputInfoStruct *v3;
  NSNumber *index;
  NSNumber *outputType;
  NSString *name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRAudioOutputClusterOutputInfoStruct;
  v2 = -[MTRAudioOutputClusterOutputInfoStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    index = v2->_index;
    v2->_index = (NSNumber *)&unk_250591B18;

    outputType = v3->_outputType;
    v3->_outputType = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAudioOutputClusterOutputInfoStruct *v4;
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

  v4 = objc_alloc_init(MTRAudioOutputClusterOutputInfoStruct);
  objc_msgSend_index(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_outputType(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputType_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: index:%@; outputType:%@; name:%@; >"),
    v5,
    self->_index,
    self->_outputType,
    self->_name);
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

- (NSNumber)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(NSNumber *)outputType
{
  objc_setProperty_nonatomic_copy(self, a2, outputType, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
