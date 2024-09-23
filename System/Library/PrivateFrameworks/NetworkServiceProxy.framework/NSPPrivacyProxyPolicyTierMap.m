@implementation NSPPrivacyProxyPolicyTierMap

- (id)tierAsString:(int)a3
{
  if (a3 < 3)
    return off_1E41386A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIBER")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)NSPPrivacyProxyPolicyTierMap;
  -[NSPPrivacyProxyPolicyTierMap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyPolicyTierMap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t tier;
  __CFString *v5;
  NSPPrivacyProxyPolicy *policy;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tier = self->_tier;
  if (tier >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tier);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E41386A8[tier];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tier"));

  policy = self->_policy;
  if (policy)
  {
    -[NSPPrivacyProxyPolicy dictionaryRepresentation](policy, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("policy"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyPolicyTierMapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_policy)
    __assert_rtn("-[NSPPrivacyProxyPolicyTierMap writeTo:]", "NSPPrivacyProxyPolicyTierMap.m", 118, "self->_policy != nil");
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_tier;
  objc_msgSend(a3, "setPolicy:", self->_policy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_tier;
  v6 = -[NSPPrivacyProxyPolicy copyWithZone:](self->_policy, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSPPrivacyProxyPolicy *policy;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_tier == *((_DWORD *)v4 + 4))
  {
    policy = self->_policy;
    if ((unint64_t)policy | v4[1])
      v6 = -[NSPPrivacyProxyPolicy isEqual:](policy, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_tier;
  return -[NSPPrivacyProxyPolicy hash](self->_policy, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  NSPPrivacyProxyPolicy *policy;
  uint64_t v6;
  _DWORD *v7;

  v4 = a3;
  self->_tier = v4[4];
  policy = self->_policy;
  v6 = *((_QWORD *)v4 + 1);
  if (policy)
  {
    if (v6)
    {
      v7 = v4;
      -[NSPPrivacyProxyPolicy mergeFrom:](policy, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[NSPPrivacyProxyPolicyTierMap setPolicy:](self, "setPolicy:");
    goto LABEL_6;
  }

}

- (int)tier
{
  return self->_tier;
}

- (void)setTier:(int)a3
{
  self->_tier = a3;
}

- (NSPPrivacyProxyPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
