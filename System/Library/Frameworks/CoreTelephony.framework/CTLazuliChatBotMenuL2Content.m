@implementation CTLazuliChatBotMenuL2Content

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotMenuL2Content chip](self, "chip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chip = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL2Content:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotMenuL2Content chip](self, "chip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToCTLazuliChatBotSuggestedChip:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMenuL2Content *v4;
  CTLazuliChatBotMenuL2Content *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMenuL2Content *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMenuL2Content isEqualToCTLazuliChatBotMenuL2Content:](self, "isEqualToCTLazuliChatBotMenuL2Content:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMenuL2Content *v4;

  v4 = +[CTLazuliChatBotMenuL2Content allocWithZone:](CTLazuliChatBotMenuL2Content, "allocWithZone:", a3);
  -[CTLazuliChatBotMenuL2Content setChip:](v4, "setChip:", self->_chip);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_chip, CFSTR("kChipKey"));
}

- (CTLazuliChatBotMenuL2Content)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMenuL2Content *v5;
  uint64_t v6;
  CTLazuliChatBotSuggestedChip *chip;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMenuL2Content;
  v5 = -[CTLazuliChatBotMenuL2Content init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chip = v5->_chip;
    v5->_chip = (CTLazuliChatBotSuggestedChip *)v6;

  }
  return v5;
}

- (CTLazuliChatBotMenuL2Content)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMenuL2Content *v4;
  CTLazuliChatBotSuggestedChip *v5;
  CTLazuliChatBotSuggestedChip *chip;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMenuL2Content;
  v4 = -[CTLazuliChatBotMenuL2Content init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliChatBotSuggestedChip initWithReflection:]([CTLazuliChatBotSuggestedChip alloc], "initWithReflection:", a3);
    chip = v4->_chip;
    v4->_chip = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotSuggestedChip)chip
{
  return self->_chip;
}

- (void)setChip:(id)a3
{
  objc_storeStrong((id *)&self->_chip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chip, 0);
}

@end
