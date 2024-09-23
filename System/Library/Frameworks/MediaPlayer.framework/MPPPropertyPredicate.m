@implementation MPPPropertyPredicate

- (void)dealloc
{
  objc_super v3;

  -[MPPPropertyPredicate setProperty:](self, "setProperty:", 0);
  -[MPPPropertyPredicate setValue:](self, "setValue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPPPropertyPredicate;
  -[MPPPropertyPredicate dealloc](&v3, sel_dealloc);
}

- (BOOL)hasProperty
{
  return self->_property != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setComparisonType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comparisonType = a3;
}

- (void)setHasComparisonType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComparisonType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MPPPropertyPredicate;
  -[MPPPropertyPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPPropertyPredicate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *property;
  MPPMediaPredicateValue *value;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  property = self->_property;
  if (property)
    objc_msgSend(v3, "setObject:forKey:", property, CFSTR("property"));
  value = self->_value;
  if (value)
  {
    -[MPPMediaPredicateValue dictionaryRepresentation](value, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_comparisonType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("comparisonType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MPPPropertyPredicateReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *property;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  property = self->_property;
  v8 = v4;
  if (property)
    objc_msgSend(v4, "writeString:forTag:", property, 1);
  if (self->_value)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPMediaPredicateValue writeTo:](self->_value, "writeTo:", v6);
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:forTag:", v7, 2);

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v8, "writeInt32:forTag:", self->_comparisonType, 3);

}

- (void)copyTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[MPPPropertyPredicate hasProperty](self, "hasProperty"))
  {
    -[MPPPropertyPredicate property](self, "property");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:", v4);

  }
  if (-[MPPPropertyPredicate hasValue](self, "hasValue"))
  {
    -[MPPPropertyPredicate value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v5);

  }
  if (-[MPPPropertyPredicate hasComparisonType](self, "hasComparisonType"))
    objc_msgSend(v6, "setComparisonType:", -[MPPPropertyPredicate comparisonType](self, "comparisonType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_property, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[MPPMediaPredicateValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_comparisonType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *property;
  MPPMediaPredicateValue *value;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  property = self->_property;
  if ((unint64_t)property | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](property, "isEqual:"))
      goto LABEL_10;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 3))
  {
    if (!-[MPPMediaPredicateValue isEqual:](value, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_comparisonType == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_property, "hash");
  v4 = -[MPPMediaPredicateValue hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_comparisonType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (MPPMediaPredicateValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int)comparisonType
{
  return self->_comparisonType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
