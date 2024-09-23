@implementation NSPPrivacyProxyProxyPathWeight

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyProxyPathWeight;
  -[NSPPrivacyProxyProxyPathWeight dealloc](&v3, sel_dealloc);
}

- (unint64_t)proxiesCount
{
  return self->_proxies.count;
}

- (unsigned)proxies
{
  return self->_proxies.list;
}

- (void)clearProxies
{
  PBRepeatedUInt32Clear();
}

- (void)addProxies:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)proxiesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_proxies;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_proxies = &self->_proxies;
  count = self->_proxies.count;
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
  return p_proxies->list[a3];
}

- (void)setProxies:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)NSPPrivacyProxyProxyPathWeight;
  -[NSPPrivacyProxyProxyPathWeight description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyProxyPathWeight dictionaryRepresentation](self, "dictionaryRepresentation");
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_weight);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("weight"));

  PBRepeatedUInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("proxies"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxyPathWeightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_proxies;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteUint32Field();
  p_proxies = &self->_proxies;
  if (p_proxies->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_proxies->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _DWORD *v7;

  v7 = a3;
  v7[8] = self->_weight;
  if (-[NSPPrivacyProxyProxyPathWeight proxiesCount](self, "proxiesCount"))
  {
    objc_msgSend(v7, "clearProxies");
    v4 = -[NSPPrivacyProxyProxyPathWeight proxiesCount](self, "proxiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addProxies:", -[NSPPrivacyProxyProxyPathWeight proxiesAtIndex:](self, "proxiesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_weight;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_weight == v4[8])
    IsEqual = PBRepeatedUInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_weight;
  return v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  self->_weight = v4[8];
  v8 = v4;
  v5 = objc_msgSend(v4, "proxiesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NSPPrivacyProxyProxyPathWeight addProxies:](self, "addProxies:", objc_msgSend(v8, "proxiesAtIndex:", i));
  }

}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

@end
