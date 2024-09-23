@implementation PrivacyProxyTokenInfo

- (id)description
{
  void *v3;

  if (self)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyTokenInfo cachedTokens](self, "cachedTokens"), (uint64_t)CFSTR("Cached token Count"), 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyTokenInfo agentTokens](self, "agentTokens"), (uint64_t)CFSTR("Agent token Count"), 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyTokenInfo cacheLowWaterMark](self, "cacheLowWaterMark"), (uint64_t)CFSTR("Cache low water mark"), 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyTokenInfo agentLowWaterMark](self, "agentLowWaterMark"), (uint64_t)CFSTR("Agent low water mark"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyTokenInfo *v4;

  v4 = -[PrivacyProxyTokenInfo init](+[PrivacyProxyTokenInfo allocWithZone:](PrivacyProxyTokenInfo, "allocWithZone:", a3), "init");
  -[PrivacyProxyTokenInfo setCachedTokens:](v4, "setCachedTokens:", -[PrivacyProxyTokenInfo cachedTokens](self, "cachedTokens"));
  -[PrivacyProxyTokenInfo setAgentTokens:](v4, "setAgentTokens:", -[PrivacyProxyTokenInfo agentTokens](self, "agentTokens"));
  -[PrivacyProxyTokenInfo setCacheLowWaterMark:](v4, "setCacheLowWaterMark:", -[PrivacyProxyTokenInfo cacheLowWaterMark](self, "cacheLowWaterMark"));
  -[PrivacyProxyTokenInfo setAgentLowWaterMark:](v4, "setAgentLowWaterMark:", -[PrivacyProxyTokenInfo agentLowWaterMark](self, "agentLowWaterMark"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyTokenInfo)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyTokenInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PrivacyProxyTokenInfo;
  v5 = -[PrivacyProxyTokenInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_cachedTokens = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoCachedTokenCount"));
    v5->_agentTokens = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoAgentTokenCount"));
    v5->_cacheLowWaterMark = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoCacheLowWaterMark"));
    v5->_agentLowWaterMark = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoAgentLowWaterMark"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo cachedTokens](self, "cachedTokens"), CFSTR("PrivacyProxyInfoCachedTokenCount"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo agentTokens](self, "agentTokens"), CFSTR("PrivacyProxyInfoAgentTokenCount"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo cacheLowWaterMark](self, "cacheLowWaterMark"), CFSTR("PrivacyProxyInfoCacheLowWaterMark"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo agentLowWaterMark](self, "agentLowWaterMark"), CFSTR("PrivacyProxyInfoAgentLowWaterMark"));

}

- (unint64_t)cachedTokens
{
  return self->_cachedTokens;
}

- (void)setCachedTokens:(unint64_t)a3
{
  self->_cachedTokens = a3;
}

- (unint64_t)agentTokens
{
  return self->_agentTokens;
}

- (void)setAgentTokens:(unint64_t)a3
{
  self->_agentTokens = a3;
}

- (unint64_t)agentLowWaterMark
{
  return self->_agentLowWaterMark;
}

- (void)setAgentLowWaterMark:(unint64_t)a3
{
  self->_agentLowWaterMark = a3;
}

- (unint64_t)cacheLowWaterMark
{
  return self->_cacheLowWaterMark;
}

- (void)setCacheLowWaterMark:(unint64_t)a3
{
  self->_cacheLowWaterMark = a3;
}

@end
