@implementation MPPMediaPredicate

- (void)dealloc
{
  objc_super v3;

  -[MPPMediaPredicate setPropertyPredicate:](self, "setPropertyPredicate:", 0);
  -[MPPMediaPredicate setCompoundPredicate:](self, "setCompoundPredicate:", 0);
  -[MPPMediaPredicate setConditionalPredicate:](self, "setConditionalPredicate:", 0);
  -[MPPMediaPredicate setPersistentIDsPredicate:](self, "setPersistentIDsPredicate:", 0);
  -[MPPMediaPredicate setSearchStringPredicate:](self, "setSearchStringPredicate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPPMediaPredicate;
  -[MPPMediaPredicate dealloc](&v3, sel_dealloc);
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPropertyPredicate
{
  return self->_propertyPredicate != 0;
}

- (BOOL)hasCompoundPredicate
{
  return self->_compoundPredicate != 0;
}

- (BOOL)hasConditionalPredicate
{
  return self->_conditionalPredicate != 0;
}

- (BOOL)hasPersistentIDsPredicate
{
  return self->_persistentIDsPredicate != 0;
}

- (BOOL)hasSearchStringPredicate
{
  return self->_searchStringPredicate != 0;
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
  v8.super_class = (Class)MPPMediaPredicate;
  -[MPPMediaPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPMediaPredicate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  MPPPropertyPredicate *propertyPredicate;
  void *v6;
  MPPCompoundPredicate *compoundPredicate;
  void *v8;
  MPPConditionalPredicate *conditionalPredicate;
  void *v10;
  MPPPersistentIDsPredicate *persistentIDsPredicate;
  void *v12;
  MPPSearchStringPredicate *searchStringPredicate;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  propertyPredicate = self->_propertyPredicate;
  if (propertyPredicate)
  {
    -[MPPPropertyPredicate dictionaryRepresentation](propertyPredicate, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("propertyPredicate"));

  }
  compoundPredicate = self->_compoundPredicate;
  if (compoundPredicate)
  {
    -[MPPCompoundPredicate dictionaryRepresentation](compoundPredicate, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("compoundPredicate"));

  }
  conditionalPredicate = self->_conditionalPredicate;
  if (conditionalPredicate)
  {
    -[MPPConditionalPredicate dictionaryRepresentation](conditionalPredicate, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("conditionalPredicate"));

  }
  persistentIDsPredicate = self->_persistentIDsPredicate;
  if (persistentIDsPredicate)
  {
    -[MPPPersistentIDsPredicate dictionaryRepresentation](persistentIDsPredicate, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("persistentIDsPredicate"));

  }
  searchStringPredicate = self->_searchStringPredicate;
  if (searchStringPredicate)
  {
    -[MPPSearchStringPredicate dictionaryRepresentation](searchStringPredicate, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("searchStringPredicate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MPPMediaPredicateReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v15, "writeInt32:forTag:", self->_type, 1);
  if (self->_propertyPredicate)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPPropertyPredicate writeTo:](self->_propertyPredicate, "writeTo:", v4);
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:forTag:", v5, 2);

  }
  if (self->_compoundPredicate)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPCompoundPredicate writeTo:](self->_compoundPredicate, "writeTo:", v6);
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:forTag:", v7, 3);

  }
  if (self->_conditionalPredicate)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPConditionalPredicate writeTo:](self->_conditionalPredicate, "writeTo:", v8);
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:forTag:", v9, 4);

  }
  if (self->_persistentIDsPredicate)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPPersistentIDsPredicate writeTo:](self->_persistentIDsPredicate, "writeTo:", v10);
    objc_msgSend(v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:forTag:", v11, 5);

  }
  v12 = v15;
  if (self->_searchStringPredicate)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPSearchStringPredicate writeTo:](self->_searchStringPredicate, "writeTo:", v13);
    objc_msgSend(v13, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:forTag:", v14, 6);

    v12 = v15;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[MPPMediaPredicate hasType](self, "hasType"))
    objc_msgSend(v9, "setType:", -[MPPMediaPredicate type](self, "type"));
  if (-[MPPMediaPredicate hasPropertyPredicate](self, "hasPropertyPredicate"))
  {
    -[MPPMediaPredicate propertyPredicate](self, "propertyPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPropertyPredicate:", v4);

  }
  if (-[MPPMediaPredicate hasCompoundPredicate](self, "hasCompoundPredicate"))
  {
    -[MPPMediaPredicate compoundPredicate](self, "compoundPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompoundPredicate:", v5);

  }
  if (-[MPPMediaPredicate hasConditionalPredicate](self, "hasConditionalPredicate"))
  {
    -[MPPMediaPredicate conditionalPredicate](self, "conditionalPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConditionalPredicate:", v6);

  }
  if (-[MPPMediaPredicate hasPersistentIDsPredicate](self, "hasPersistentIDsPredicate"))
  {
    -[MPPMediaPredicate persistentIDsPredicate](self, "persistentIDsPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPersistentIDsPredicate:", v7);

  }
  if (-[MPPMediaPredicate hasSearchStringPredicate](self, "hasSearchStringPredicate"))
  {
    -[MPPMediaPredicate searchStringPredicate](self, "searchStringPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSearchStringPredicate:", v8);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[MPPPropertyPredicate copyWithZone:](self->_propertyPredicate, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[MPPCompoundPredicate copyWithZone:](self->_compoundPredicate, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[MPPConditionalPredicate copyWithZone:](self->_conditionalPredicate, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[MPPPersistentIDsPredicate copyWithZone:](self->_persistentIDsPredicate, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  v15 = -[MPPSearchStringPredicate copyWithZone:](self->_searchStringPredicate, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MPPPropertyPredicate *propertyPredicate;
  MPPCompoundPredicate *compoundPredicate;
  MPPConditionalPredicate *conditionalPredicate;
  MPPPersistentIDsPredicate *persistentIDsPredicate;
  MPPSearchStringPredicate *searchStringPredicate;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  propertyPredicate = self->_propertyPredicate;
  if ((unint64_t)propertyPredicate | *((_QWORD *)v4 + 4)
    && !-[MPPPropertyPredicate isEqual:](propertyPredicate, "isEqual:"))
  {
    goto LABEL_17;
  }
  compoundPredicate = self->_compoundPredicate;
  if ((unint64_t)compoundPredicate | *((_QWORD *)v4 + 1))
  {
    if (!-[MPPCompoundPredicate isEqual:](compoundPredicate, "isEqual:"))
      goto LABEL_17;
  }
  conditionalPredicate = self->_conditionalPredicate;
  if ((unint64_t)conditionalPredicate | *((_QWORD *)v4 + 2))
  {
    if (!-[MPPConditionalPredicate isEqual:](conditionalPredicate, "isEqual:"))
      goto LABEL_17;
  }
  persistentIDsPredicate = self->_persistentIDsPredicate;
  if ((unint64_t)persistentIDsPredicate | *((_QWORD *)v4 + 3))
  {
    if (!-[MPPPersistentIDsPredicate isEqual:](persistentIDsPredicate, "isEqual:"))
      goto LABEL_17;
  }
  searchStringPredicate = self->_searchStringPredicate;
  if ((unint64_t)searchStringPredicate | *((_QWORD *)v4 + 5))
    v10 = -[MPPSearchStringPredicate isEqual:](searchStringPredicate, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[MPPPropertyPredicate hash](self->_propertyPredicate, "hash") ^ v3;
  v5 = -[MPPCompoundPredicate hash](self->_compoundPredicate, "hash");
  v6 = v4 ^ v5 ^ -[MPPConditionalPredicate hash](self->_conditionalPredicate, "hash");
  v7 = -[MPPPersistentIDsPredicate hash](self->_persistentIDsPredicate, "hash");
  return v6 ^ v7 ^ -[MPPSearchStringPredicate hash](self->_searchStringPredicate, "hash");
}

- (int)type
{
  return self->_type;
}

- (MPPPropertyPredicate)propertyPredicate
{
  return self->_propertyPredicate;
}

- (void)setPropertyPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_propertyPredicate, a3);
}

- (MPPCompoundPredicate)compoundPredicate
{
  return self->_compoundPredicate;
}

- (void)setCompoundPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_compoundPredicate, a3);
}

- (MPPConditionalPredicate)conditionalPredicate
{
  return self->_conditionalPredicate;
}

- (void)setConditionalPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalPredicate, a3);
}

- (MPPPersistentIDsPredicate)persistentIDsPredicate
{
  return self->_persistentIDsPredicate;
}

- (void)setPersistentIDsPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_persistentIDsPredicate, a3);
}

- (MPPSearchStringPredicate)searchStringPredicate
{
  return self->_searchStringPredicate;
}

- (void)setSearchStringPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_searchStringPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchStringPredicate, 0);
  objc_storeStrong((id *)&self->_propertyPredicate, 0);
  objc_storeStrong((id *)&self->_persistentIDsPredicate, 0);
  objc_storeStrong((id *)&self->_conditionalPredicate, 0);
  objc_storeStrong((id *)&self->_compoundPredicate, 0);
}

@end
