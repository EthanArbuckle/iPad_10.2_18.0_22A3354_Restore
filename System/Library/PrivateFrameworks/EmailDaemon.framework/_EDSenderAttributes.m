@implementation _EDSenderAttributes

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken != -1)
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_36);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  return v3;
}

- (_EDSenderAttributes)initWithisVIP:(BOOL)a3 isContact:(BOOL)a4 isCoreRecent:(BOOL)a5 isPrimarySender:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _EDSenderAttributes *v10;
  _EDSenderAttributes *v11;
  _EDSenderAttributes *v12;
  objc_super v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_EDSenderAttributes;
  v10 = -[_EDSenderAttributes init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[_EDSenderAttributes setIsVIP:](v10, "setIsVIP:", v9);
    -[_EDSenderAttributes setIsContact:](v11, "setIsContact:", v8);
    -[_EDSenderAttributes setIsCoreRecent:](v11, "setIsCoreRecent:", v7);
    -[_EDSenderAttributes setIsPrimarySender:](v11, "setIsPrimarySender:", v6);
  }
  -[_EDSenderAttributes cachedSelf](v11, "cachedSelf");
  v12 = (_EDSenderAttributes *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVIP);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCoreRecent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrimarySender);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SenderAttributes: isVIP=%@, isContact=%@ isRecent=%@ isPrimary=%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_EDSenderAttributes isVIP](self, "isVIP");
  v4 = -[_EDSenderAttributes isContact](self, "isContact");
  v5 = 1089;
  if (v3)
    v5 = 1122;
  v6 = 33 * (v5 + v4) + -[_EDSenderAttributes isCoreRecent](self, "isCoreRecent");
  return 33 * v6 + -[_EDSenderAttributes isPrimarySender](self, "isPrimarySender");
}

- (BOOL)isEqual:(id)a3
{
  _EDSenderAttributes *v4;
  _EDSenderAttributes *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v11;

  v4 = (_EDSenderAttributes *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_EDSenderAttributes isVIP](self, "isVIP");
      if (v6 == -[_EDSenderAttributes isVIP](v5, "isVIP")
        && (v7 = -[_EDSenderAttributes isContact](self, "isContact"),
            v7 == -[_EDSenderAttributes isContact](v5, "isContact"))
        && (v8 = -[_EDSenderAttributes isCoreRecent](self, "isCoreRecent"),
            v8 == -[_EDSenderAttributes isCoreRecent](v5, "isCoreRecent")))
      {
        v11 = -[_EDSenderAttributes isPrimarySender](self, "isPrimarySender");
        v9 = v11 ^ -[_EDSenderAttributes isPrimarySender](v5, "isPrimarySender") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

- (BOOL)isCoreRecent
{
  return self->_isCoreRecent;
}

- (void)setIsCoreRecent:(BOOL)a3
{
  self->_isCoreRecent = a3;
}

- (BOOL)isPrimarySender
{
  return self->_isPrimarySender;
}

- (void)setIsPrimarySender:(BOOL)a3
{
  self->_isPrimarySender = a3;
}

@end
