@implementation CTLazuliChatBotRenderInformationData

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotRenderInformationData renderInformation](self, "renderInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", renderInformation = %@"), v4);

  v5 = -[CTLazuliChatBotRenderInformationData cacheType](self, "cacheType");
  v7 = -[CTLazuliChatBotRenderInformationData cacheType](self, "cacheType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", cacheType = [%ld - %s]"), v5, print_CTLazuliChatBotRenderInformationCacheType(&v7));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotRenderInformationData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  int64_t v11;

  v7 = a3;
  -[CTLazuliChatBotRenderInformationData renderInformation](self, "renderInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "renderInformation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 0;
LABEL_7:
      v11 = -[CTLazuliChatBotRenderInformationData cacheType](self, "cacheType");
      v10 = v11 == objc_msgSend(v7, "cacheType");
      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  -[CTLazuliChatBotRenderInformationData renderInformation](self, "renderInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToCTLazuliChatBotRenderInformation:", v5))
  {
    v9 = 1;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotRenderInformationData *v4;
  CTLazuliChatBotRenderInformationData *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotRenderInformationData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotRenderInformationData isEqualToCTLazuliChatBotRenderInformationData:](self, "isEqualToCTLazuliChatBotRenderInformationData:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotRenderInformationData *v4;

  v4 = +[CTLazuliChatBotRenderInformationData allocWithZone:](CTLazuliChatBotRenderInformationData, "allocWithZone:", a3);
  -[CTLazuliChatBotRenderInformationData setRenderInformation:](v4, "setRenderInformation:", self->_renderInformation);
  -[CTLazuliChatBotRenderInformationData setCacheType:](v4, "setCacheType:", self->_cacheType);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_renderInformation, CFSTR("kRenderInformationKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_cacheType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kCacheTypeKey"));

}

- (CTLazuliChatBotRenderInformationData)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotRenderInformationData *v5;
  uint64_t v6;
  CTLazuliChatBotRenderInformation *renderInformation;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotRenderInformationData;
  v5 = -[CTLazuliChatBotRenderInformationData init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRenderInformationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    renderInformation = v5->_renderInformation;
    v5->_renderInformation = (CTLazuliChatBotRenderInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCacheTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cacheType = objc_msgSend(v8, "longValue");

  }
  return v5;
}

- (CTLazuliChatBotRenderInformationData)initWithReflection:(const void *)a3
{
  CTLazuliChatBotRenderInformationData *v4;
  CTLazuliChatBotRenderInformationData *v5;
  CTLazuliChatBotRenderInformation *v6;
  uint64_t v7;
  CTLazuliChatBotRenderInformation *renderInformation;
  CTLazuliChatBotRenderInformationData *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotRenderInformationData;
  v4 = -[CTLazuliChatBotRenderInformationData init](&v10, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (!*((_BYTE *)a3 + 688))
  {
    renderInformation = v4->_renderInformation;
    v4->_renderInformation = 0;
    goto LABEL_6;
  }
  v6 = [CTLazuliChatBotRenderInformation alloc];
  if (*((_BYTE *)a3 + 688))
  {
    v7 = -[CTLazuliChatBotRenderInformation initWithReflection:](v6, "initWithReflection:", a3);
    renderInformation = v5->_renderInformation;
    v5->_renderInformation = (CTLazuliChatBotRenderInformation *)v7;
LABEL_6:

    v5->_cacheType = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3 + 174);
    return v5;
  }
  result = (CTLazuliChatBotRenderInformationData *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotRenderInformation)renderInformation
{
  return self->_renderInformation;
}

- (void)setRenderInformation:(id)a3
{
  objc_storeStrong((id *)&self->_renderInformation, a3);
}

- (int64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(int64_t)a3
{
  self->_cacheType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderInformation, 0);
}

@end
