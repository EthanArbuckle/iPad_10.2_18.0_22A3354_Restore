@implementation MTRDistinguishedNameInfo

- (MTRDistinguishedNameInfo)initWithDN:(const void *)a3
{
  MTRDistinguishedNameInfo *result;
  Span<const char> v5;
  Span<const char> v6;
  __int128 v7;
  Span<const char> v8;
  Span<const char> v9;
  __int128 v10;
  Span<const char> v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDistinguishedNameInfo;
  result = -[MTRDistinguishedNameInfo init](&v12, sel_init);
  if (result)
  {
    v5 = *(Span<const char> *)a3;
    *(_OWORD *)&result->_dn.rdn[0].mChipVal = *((_OWORD *)a3 + 1);
    result->_dn.rdn[0].mString = v5;
    v6 = (Span<const char>)*((_OWORD *)a3 + 2);
    v7 = *((_OWORD *)a3 + 3);
    v8 = (Span<const char>)*((_OWORD *)a3 + 4);
    *(_OWORD *)&result->_dn.rdn[2].mChipVal = *((_OWORD *)a3 + 5);
    result->_dn.rdn[2].mString = v8;
    *(_OWORD *)&result->_dn.rdn[1].mChipVal = v7;
    result->_dn.rdn[1].mString = v6;
    v9 = (Span<const char>)*((_OWORD *)a3 + 6);
    v10 = *((_OWORD *)a3 + 7);
    v11 = (Span<const char>)*((_OWORD *)a3 + 8);
    *(_OWORD *)&result->_dn.rdn[4].mChipVal = *((_OWORD *)a3 + 9);
    result->_dn.rdn[4].mString = v11;
    *(_OWORD *)&result->_dn.rdn[3].mChipVal = v10;
    result->_dn.rdn[3].mString = v9;
  }
  return result;
}

- (NSNumber)nodeID
{
  return (NSNumber *)sub_234033038((char *)self, (const char *)0x311);
}

- (NSNumber)fabricID
{
  return (NSNumber *)sub_234033038((char *)self, (const char *)0x315);
}

- (NSNumber)rootCACertificateID
{
  return (NSNumber *)sub_234033038((char *)self, (const char *)0x314);
}

- (NSNumber)intermediateCACertificateID
{
  return (NSNumber *)sub_234033038((char *)self, (const char *)0x313);
}

- (NSSet)caseAuthenticatedTags
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = 0;
  v5 = 0;
  do
  {
    if (self->_dn.rdn[v4].mAttrOID == 790)
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, self->_dn.rdn[v4].mChipVal);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend_addObject_(v5, v6, (uint64_t)v7);
      }
      else
      {
        objc_msgSend_setWithObject_(MEMORY[0x24BDBCEF0], v6, (uint64_t)v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (!self->_dn.rdn[v4].mAttrOID)
    {
      break;
    }
    ++v4;
  }
  while (v4 != 5);
  if (v5)
  {
    v8 = objc_msgSend_copy(v5, a2, v2);
  }
  else
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], a2, v2);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (NSSet *)v9;
}

- (BOOL)isEqual:(id)a3
{
  MTRDistinguishedNameInfo *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (MTRDistinguishedNameInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && sub_2341D6674((uint64_t)&self->_dn, (uint64_t)&v4->_dn);
  }

  return v6;
}

- (void).cxx_destruct
{
  nullsub_13(&self->_dn, a2);
}

- (id).cxx_construct
{
  sub_2341D67D0((uint64_t)&self->_dn);
  return self;
}

@end
