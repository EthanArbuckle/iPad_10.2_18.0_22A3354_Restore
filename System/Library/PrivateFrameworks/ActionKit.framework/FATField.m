@implementation FATField

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "setIndex:", v8);
  objc_msgSend(v10, "setType:", v7);
  objc_msgSend(v10, "setOptional:", v6);
  objc_msgSend(v10, "setName:", v9);

  return v10;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 structClass:(Class)a7
{
  void *v8;

  objc_msgSend(a1, "fieldWithIndex:type:optional:name:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStructClass:", a7);
  return v8;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 valueField:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;

  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  objc_msgSend(a1, "fieldWithIndex:type:optional:name:", v10, v9, v8, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValueField:", v12);

  return v13;
}

+ (id)fieldWithIndex:(unsigned int)a3 type:(unsigned int)a4 optional:(BOOL)a5 name:(id)a6 keyField:(id)a7 valueField:(id)a8
{
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  void *v15;

  v10 = a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v14 = a7;
  objc_msgSend(a1, "fieldWithIndex:type:optional:name:valueField:", v12, v11, v10, a6, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyField:", v14);

  return v15;
}

+ (id)nameForFatFieldType:(unsigned int)a3
{
  if (a3 - 1 > 0xF)
    return CFSTR("unknown!");
  else
    return off_24F8B4718[a3 - 1];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p;"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR(" index = %i; "), -[FATField index](self, "index"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" type = %i; "), -[FATField type](self, "type"));
  v6 = -[FATField optional](self, "optional");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" optional = %@; "), v7);
  -[FATField name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" name = %@; "), v8);

  if (-[FATField type](self, "type") == 12)
  {
    NSStringFromClass(-[FATField structClass](self, "structClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" structClass = %@; "), v9);
LABEL_9:

    goto LABEL_10;
  }
  if (-[FATField type](self, "type") == 14
    || -[FATField type](self, "type") == 15
    || -[FATField type](self, "type") == 13)
  {
    -[FATField valueField](self, "valueField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" valueField = %@; "), v9);
    goto LABEL_9;
  }
LABEL_10:
  if (-[FATField type](self, "type") == 13)
  {
    -[FATField keyField](self, "keyField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" keyField = %@; "), v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (BOOL)optional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (Class)structClass
{
  return self->_structClass;
}

- (void)setStructClass:(Class)a3
{
  self->_structClass = a3;
}

- (FATField)valueField
{
  return self->_valueField;
}

- (void)setValueField:(id)a3
{
  objc_storeStrong((id *)&self->_valueField, a3);
}

- (FATField)keyField
{
  return self->_keyField;
}

- (void)setKeyField:(id)a3
{
  objc_storeStrong((id *)&self->_keyField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyField, 0);
  objc_storeStrong((id *)&self->_valueField, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
