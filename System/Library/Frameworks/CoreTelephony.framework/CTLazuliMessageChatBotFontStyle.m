@implementation CTLazuliMessageChatBotFontStyle

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bold = %d"), -[CTLazuliMessageChatBotFontStyle bold](self, "bold"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", italics = %d"), -[CTLazuliMessageChatBotFontStyle italics](self, "italics"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", underline = %d"), -[CTLazuliMessageChatBotFontStyle underline](self, "underline"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotFontStyle:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v4 = a3;
  v5 = -[CTLazuliMessageChatBotFontStyle bold](self, "bold");
  if (v5 == objc_msgSend(v4, "bold")
    && (v6 = -[CTLazuliMessageChatBotFontStyle italics](self, "italics"), v6 == objc_msgSend(v4, "italics")))
  {
    v8 = -[CTLazuliMessageChatBotFontStyle underline](self, "underline");
    v7 = v8 ^ objc_msgSend(v4, "underline") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotFontStyle *v4;
  CTLazuliMessageChatBotFontStyle *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotFontStyle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotFontStyle isEqualToCTLazuliMessageChatBotFontStyle:](self, "isEqualToCTLazuliMessageChatBotFontStyle:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotFontStyle *v4;

  v4 = +[CTLazuliMessageChatBotFontStyle allocWithZone:](CTLazuliMessageChatBotFontStyle, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotFontStyle setBold:](v4, "setBold:", self->_bold);
  -[CTLazuliMessageChatBotFontStyle setItalics:](v4, "setItalics:", self->_italics);
  -[CTLazuliMessageChatBotFontStyle setUnderline:](v4, "setUnderline:", self->_underline);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_bold, CFSTR("kBoldKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_italics, CFSTR("kItalicsKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_underline, CFSTR("kUnderlineKey"));

}

- (CTLazuliMessageChatBotFontStyle)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotFontStyle *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTLazuliMessageChatBotFontStyle;
  v5 = -[CTLazuliMessageChatBotFontStyle init](&v7, sel_init);
  if (v5)
  {
    v5->_bold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kBoldKey"));
    v5->_italics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kItalicsKey"));
    v5->_underline = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kUnderlineKey"));
  }

  return v5;
}

- (CTLazuliMessageChatBotFontStyle)initWithReflection:(const MessageChatBotFontStyle *)a3
{
  CTLazuliMessageChatBotFontStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTLazuliMessageChatBotFontStyle;
  result = -[CTLazuliMessageChatBotFontStyle init](&v5, sel_init);
  if (result)
  {
    result->_bold = a3->var0;
    result->_italics = a3->var1;
    result->_underline = a3->var2;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (BOOL)italics
{
  return self->_italics;
}

- (void)setItalics:(BOOL)a3
{
  self->_italics = a3;
}

- (BOOL)underline
{
  return self->_underline;
}

- (void)setUnderline:(BOOL)a3
{
  self->_underline = a3;
}

@end
