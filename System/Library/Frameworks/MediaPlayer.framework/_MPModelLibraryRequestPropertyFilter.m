@implementation _MPModelLibraryRequestPropertyFilter

- (_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8;
  id v9;
  _MPModelLibraryRequestPropertyFilter *v10;
  uint64_t v11;
  NSArray *keys;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  v10 = -[_MPModelLibraryRequestPropertyFilter init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    keys = v10->_keys;
    v10->_keys = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    value = v10->_value;
    v10->_value = (NSString *)v13;

    v10->_comparisonType = a5;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t comparisonType;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  -[_MPModelLibraryRequestPropertyFilter description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if (-[NSArray count](self->_keys, "count"))
  {
    -[NSArray msv_compactDescription](self->_keys, "msv_compactDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" keyPath=[%@]"), v5);

  }
  if (-[NSString length](self->_value, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" value=\"%@\"), self->_value);
  comparisonType = self->_comparisonType;
  if (!comparisonType)
  {
    v7 = CFSTR(" comparisonType=equalTo >");
    goto LABEL_9;
  }
  if (comparisonType == 1)
  {
    v7 = CFSTR(" comparisonType=contains >");
LABEL_9:
    objc_msgSend(v4, "appendString:", v7);
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (_MPModelLibraryRequestPropertyFilter)initWithCoder:(id)a3
{
  id v4;
  _MPModelLibraryRequestPropertyFilter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *keys;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  v5 = -[_MPModelLibraryRequestPropertyFilter init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v11;

    v5->_comparisonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyComparisonType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *keys;
  id v5;

  keys = self->_keys;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keys, CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyKeys"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_comparisonType, CFSTR("MPModelLibraryRequestPropertyFilterCodingKeyComparisonType"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  int64_t v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[_MPModelLibraryRequestPropertyFilter keys](self, "keys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
      goto LABEL_8;
  }
  -[_MPModelLibraryRequestPropertyFilter value](self, "value");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {

    goto LABEL_10;
  }
  v11 = v10;
  v12 = objc_msgSend(v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_10:
    v14 = -[_MPModelLibraryRequestPropertyFilter comparisonType](self, "comparisonType");
    v13 = v14 == objc_msgSend(v4, "comparisonType");
    goto LABEL_11;
  }
LABEL_8:
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
