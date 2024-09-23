@implementation HDCodableMedicalUserDomainConcept

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableMedicalUserDomainConcept;
  -[HDCodableMedicalUserDomainConcept dealloc](&v3, sel_dealloc);
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (unint64_t)categoryTypesCount
{
  return self->_categoryTypes.count;
}

- (int64_t)categoryTypes
{
  return self->_categoryTypes.list;
}

- (void)clearCategoryTypes
{
  PBRepeatedInt64Clear();
}

- (void)addCategoryTypes:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)categoryTypesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_categoryTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_categoryTypes = &self->_categoryTypes;
  count = self->_categoryTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_categoryTypes->list[a3];
}

- (void)setCategoryTypes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
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
  v8.super_class = (Class)HDCodableMedicalUserDomainConcept;
  -[HDCodableMedicalUserDomainConcept description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalUserDomainConcept dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *countryCode;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v3, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  PBRepeatedInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("categoryTypes"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalUserDomainConceptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $A58966F474337DCABE012981F76706F5 *p_categoryTypes;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  p_categoryTypes = &self->_categoryTypes;
  if (p_categoryTypes->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_categoryTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (self->_countryCode)
    objc_msgSend(v7, "setCountryCode:");
  if (-[HDCodableMedicalUserDomainConcept categoryTypesCount](self, "categoryTypesCount"))
  {
    objc_msgSend(v7, "clearCategoryTypes");
    v4 = -[HDCodableMedicalUserDomainConcept categoryTypesCount](self, "categoryTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addCategoryTypes:", -[HDCodableMedicalUserDomainConcept categoryTypesAtIndex:](self, "categoryTypesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *countryCode;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[4]))
     || -[NSString isEqual:](countryCode, "isEqual:")))
  {
    IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v2;

  v2 = -[NSString hash](self->_countryCode, "hash");
  return PBRepeatedInt64Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;

  v4 = a3;
  v8 = v4;
  if (v4[4])
  {
    -[HDCodableMedicalUserDomainConcept setCountryCode:](self, "setCountryCode:");
    v4 = v8;
  }
  v5 = objc_msgSend(v4, "categoryTypesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[HDCodableMedicalUserDomainConcept addCategoryTypes:](self, "addCategoryTypes:", objc_msgSend(v8, "categoryTypesAtIndex:", i));
  }

}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
