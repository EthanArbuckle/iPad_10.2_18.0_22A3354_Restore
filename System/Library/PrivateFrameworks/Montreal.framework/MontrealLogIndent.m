@implementation MontrealLogIndent

+ (id)indentWithLevel:(id)a3
{
  id v3;
  MontrealLogIndent *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [MontrealLogIndent alloc];
  v6 = (void *)objc_msgSend_initWithLevel_step_factor_(v4, v5, (uint64_t)v3, (uint64_t)v3, 0);

  return v6;
}

+ (id)indentWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5
{
  id v7;
  id v8;
  MontrealLogIndent *v9;
  const char *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = [MontrealLogIndent alloc];
  v11 = (void *)objc_msgSend_initWithLevel_step_factor_(v9, v10, (uint64_t)v8, (uint64_t)v7, a5);

  return v11;
}

- (MontrealLogIndent)initWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  MontrealLogIndent *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *level;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *step;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MontrealLogIndent;
  v13 = -[MontrealLogIndent init](&v28, sel_init);
  if (v13)
  {
    if (objc_msgSend_length(v8, v10, v11, v12))
      v17 = objc_msgSend_copy(v8, v14, v15, v16);
    else
      v17 = objc_msgSend_copy(CFSTR("    "), v14, v15, v16);
    level = v13->_level;
    v13->_level = (NSString *)v17;

    if (objc_msgSend_length(v9, v19, v20, v21))
      v25 = objc_msgSend_copy(v9, v22, v23, v24);
    else
      v25 = objc_msgSend_copy(CFSTR("    "), v22, v23, v24);
    step = v13->_step;
    v13->_step = (NSString *)v25;

    v13->_factor = a5;
  }

  return v13;
}

- (id)description
{
  return self->_level;
}

- (id)indentByFactor:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;

  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = self->_factor + a3;
  v10 = objc_msgSend_length(self->_step, v7, v8, v9);
  v13 = (void *)objc_msgSend_initWithCapacity_(v5, v11, v10 * v6, v12);
  objc_msgSend_appendString_(v13, v14, (uint64_t)self->_level, v15);
  if (a3)
  {
    v18 = a3;
    do
    {
      objc_msgSend_appendString_(v13, v16, (uint64_t)self->_step, v17);
      --v18;
    }
    while (v18);
  }
  objc_msgSend_indentWithLevel_step_factor_(MontrealLogIndent, v16, (uint64_t)v13, (uint64_t)self->_step, self->_factor + a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)step
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)factor
{
  return self->_factor;
}

- (NSString)level
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end
