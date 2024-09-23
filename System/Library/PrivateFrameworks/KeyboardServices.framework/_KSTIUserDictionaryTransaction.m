@implementation _KSTIUserDictionaryTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSTIUserDictionaryTransaction)initWithCoder:(id)a3
{
  id v4;
  _KSTIUserDictionaryTransaction *v5;
  uint64_t v6;
  _KSTIUserDictionaryEntryValue *valueToDelete;
  uint64_t v8;
  _KSTIUserDictionaryEntryValue *valueToInsert;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSTIUserDictionaryTransaction;
  v5 = -[_KSTIUserDictionaryTransaction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueToDelete"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueToDelete = v5->_valueToDelete;
    v5->_valueToDelete = (_KSTIUserDictionaryEntryValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueToInsert"));
    v8 = objc_claimAutoreleasedReturnValue();
    valueToInsert = v5->_valueToInsert;
    v5->_valueToInsert = (_KSTIUserDictionaryEntryValue *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _KSTIUserDictionaryEntryValue *valueToDelete;
  _KSTIUserDictionaryEntryValue *valueToInsert;
  id v7;

  v4 = a3;
  valueToDelete = self->_valueToDelete;
  v7 = v4;
  if (valueToDelete)
  {
    objc_msgSend(v4, "encodeObject:forKey:", valueToDelete, CFSTR("valueToDelete"));
    v4 = v7;
  }
  valueToInsert = self->_valueToInsert;
  if (valueToInsert)
  {
    objc_msgSend(v7, "encodeObject:forKey:", valueToInsert, CFSTR("valueToInsert"));
    v4 = v7;
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_KSTIUserDictionaryTransaction valueToDelete](self, "valueToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTIUserDictionaryTransaction valueToInsert](self, "valueToInsert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: valueToDelete = %@, valueToInsert = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_KSTIUserDictionaryEntryValue)valueToDelete
{
  return self->_valueToDelete;
}

- (void)setValueToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_valueToDelete, a3);
}

- (_KSTIUserDictionaryEntryValue)valueToInsert
{
  return self->_valueToInsert;
}

- (void)setValueToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_valueToInsert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToInsert, 0);
  objc_storeStrong((id *)&self->_valueToDelete, 0);
}

@end
