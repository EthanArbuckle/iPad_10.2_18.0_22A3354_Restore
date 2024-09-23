@implementation GDRelationshipIdentifier

- (GDRelationshipIdentifier)initWithString:(id)a3
{
  id v4;
  const char *v5;
  GDRelationshipIdentifier *v6;
  uint64_t v7;
  NSString *stringValue;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GDRelationshipIdentifier;
  v6 = -[GDRelationshipIdentifier init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend_prefixedIdentifierStringForIdentifierString_(GDRelationshipIdentifier, v5, (uint64_t)v4);
    v7 = objc_claimAutoreleasedReturnValue();
    stringValue = v6->_stringValue;
    v6->_stringValue = (NSString *)v7;

    objc_msgSend_unprefixedIdentifierStringForIdentifierString_(GDRelationshipIdentifier, v9, (uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_intValue = objc_msgSend_longLongValue(v10, v11, v12);

  }
  return v6;
}

- (GDRelationshipIdentifier)initWithValue:(unint64_t)a3
{
  GDRelationshipIdentifier *v4;
  const char *v5;
  GDRelationshipIdentifier *v6;
  uint64_t v7;
  NSString *stringValue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GDRelationshipIdentifier;
  v4 = -[GDRelationshipIdentifier init](&v10, sel_init);
  v6 = v4;
  if (v4)
  {
    v4->_intValue = a3;
    objc_msgSend_prefixedIdentifierStringForIdentifierValue_(GDRelationshipIdentifier, v5, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    stringValue = v6->_stringValue;
    v6->_stringValue = (NSString *)v7;

  }
  return v6;
}

- (int64_t)entityClass
{
  uint64_t v2;
  unint64_t intValue;

  intValue = self->_intValue;
  return intValue >> objc_msgSend_entityClassOffset(GDRelationshipIdentifier, a2, v2);
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_stringValue(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithFormat_(v3, v7, (uint64_t)CFSTR("<GDRelationshipIdentifier: %@>"), v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithString_(v7, v8, (uint64_t)self->_stringValue);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_stringValue, CFSTR("stringValue"));
}

- (GDRelationshipIdentifier)initWithCoder:(id)a3
{
  id v5;
  GDRelationshipIdentifier *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  NSString *stringValue;
  NSString *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v19;
  const char *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GDRelationshipIdentifier;
  v6 = -[GDRelationshipIdentifier init](&v21, sel_init);
  if (v6)
  {
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v7, CFSTR("stringValue"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v6, CFSTR("GDEntityIdentifier.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringValue"));

    }
    stringValue = v6->_stringValue;
    v6->_stringValue = v11;
    v13 = v11;

    objc_msgSend_unprefixedIdentifierStringForIdentifierString_(GDEntityIdentifier, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v6->_intValue = objc_msgSend_longLongValue(v15, v16, v17);
  }

  return v6;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (unint64_t)intValue
{
  return self->_intValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (id)prefixedIdentifierStringForIdentifierString:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1AF45451C]();
  if (objc_msgSend_hasPrefix_(v3, v5, (uint64_t)CFSTR("ri:")))
  {
    v7 = v3;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(CFSTR("ri:"), v6, (uint64_t)v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_autoreleasePoolPop(v4);

  return v8;
}

+ (id)prefixedIdentifierStringForIdentifierValue:(unint64_t)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1AF45451C](a1, a2);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = (void *)objc_msgSend_initWithFormat_(v5, v6, (uint64_t)CFSTR("%@%llu"), CFSTR("ri:"), a3);
  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)unprefixedIdentifierStringForIdentifierString:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1AF45451C]();
  if (objc_msgSend_hasPrefix_(v3, v5, (uint64_t)CFSTR("ri:")))
  {
    v8 = objc_msgSend_length(CFSTR("ri:"), v6, v7);
    objc_msgSend_substringFromIndex_(v3, v9, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v3;
  }
  v11 = v10;
  objc_autoreleasePoolPop(v4);

  return v11;
}

+ (int64_t)entityClassOffset
{
  uint64_t v2;

  return objc_msgSend_entityClassOffset(_TtC20IntelligencePlatform21GDIdentifierConstants, a2, v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
