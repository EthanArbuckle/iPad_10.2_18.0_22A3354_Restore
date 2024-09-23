@implementation NEPolicy

- (NEPolicy)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicy is not valid", v5, 2u);
  }

  return 0;
}

- (NEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5
{
  id v9;
  id v10;
  NEPolicy *v11;
  NEPolicy *v12;
  NEPolicy *v13;
  NSObject *v14;
  uint8_t v16[16];
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEPolicy;
  v11 = -[NEPolicy init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_order = a3;
    objc_storeStrong((id *)&v11->_result, a4);
    objc_storeStrong((id *)&v12->_conditions, a5);
    v13 = v12;
  }
  else
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "Failed to init NEPolicy", v16, 2u);
    }

  }
  return v12;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", (int)self->_order, CFSTR("order"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_result, CFSTR("result"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_conditions, CFSTR("conditions"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEPolicy descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
