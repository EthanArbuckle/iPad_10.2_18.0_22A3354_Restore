@implementation MPPPersistentIDsPredicate

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)MPPPersistentIDsPredicate;
  -[MPPPersistentIDsPredicate dealloc](&v3, sel_dealloc);
}

- (void)setShouldContain:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldContain = a3;
}

- (void)setHasShouldContain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldContain
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)persistentIDsCount
{
  return self->_persistentIDs.count;
}

- (int64_t)persistentIDs
{
  return self->_persistentIDs.list;
}

- (void)clearPersistentIDs
{
  PBRepeatedInt64Clear();
}

- (void)addPersistentIDs:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)persistentIDsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_persistentIDs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_persistentIDs = &self->_persistentIDs;
  count = self->_persistentIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%ld) is out of range (%ld)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_persistentIDs->list[a3];
}

- (void)setPersistentIDs:(int64_t *)a3 count:(unint64_t)a4
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
  v8.super_class = (Class)MPPPersistentIDsPredicate;
  -[MPPPersistentIDsPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPPersistentIDsPredicate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldContain);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("shouldContain"));

  }
  PBRepeatedInt64NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("persistentIDs"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MPPPersistentIDsPredicateReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $A58966F474337DCABE012981F76706F5 *p_persistentIDs;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(v4, "writeBOOL:forTag:", self->_shouldContain, 1);
    v4 = v7;
  }
  p_persistentIDs = &self->_persistentIDs;
  if (p_persistentIDs->count)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v7, "writeInt64:forTag:", p_persistentIDs->list[v6], 2);
      v4 = v7;
      ++v6;
    }
    while (v6 < p_persistentIDs->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[MPPPersistentIDsPredicate hasShouldContain](self, "hasShouldContain"))
    objc_msgSend(v7, "setShouldContain:", -[MPPPersistentIDsPredicate shouldContain](self, "shouldContain"));
  if (-[MPPPersistentIDsPredicate persistentIDsCount](self, "persistentIDsCount"))
  {
    objc_msgSend(v7, "clearPersistentIDs");
    v4 = -[MPPPersistentIDsPredicate persistentIDsCount](self, "persistentIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPersistentIDs:", -[MPPPersistentIDsPredicate persistentIDsAtIndex:](self, "persistentIDsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v4 + 32) = self->_shouldContain;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  char IsEqual;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[36] & 1) == 0 || self->_shouldContain != v4[32])
      goto LABEL_8;
  }
  else if ((v4[36] & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedInt64IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_shouldContain;
  else
    v2 = 0;
  return PBRepeatedInt64Hash() ^ v2;
}

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

@end
