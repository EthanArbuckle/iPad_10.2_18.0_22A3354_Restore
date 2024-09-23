@implementation CTLazuliSuggestedActionRequestLocationPush

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", sendPush = %d"), -[CTLazuliSuggestedActionRequestLocationPush sendPush](self, "sendPush"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionRequestLocationPush:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[CTLazuliSuggestedActionRequestLocationPush sendPush](self, "sendPush");
  LOBYTE(self) = self ^ objc_msgSend(v4, "sendPush") ^ 1;

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionRequestLocationPush *v4;
  CTLazuliSuggestedActionRequestLocationPush *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionRequestLocationPush *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionRequestLocationPush isEqualToCTLazuliSuggestedActionRequestLocationPush:](self, "isEqualToCTLazuliSuggestedActionRequestLocationPush:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionRequestLocationPush *v4;

  v4 = +[CTLazuliSuggestedActionRequestLocationPush allocWithZone:](CTLazuliSuggestedActionRequestLocationPush, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionRequestLocationPush setSendPush:](v4, "setSendPush:", self->_sendPush);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_sendPush, CFSTR("kSendPushKey"));
}

- (CTLazuliSuggestedActionRequestLocationPush)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionRequestLocationPush *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTLazuliSuggestedActionRequestLocationPush;
  v5 = -[CTLazuliSuggestedActionRequestLocationPush init](&v7, sel_init);
  if (v5)
    v5->_sendPush = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSendPushKey"));

  return v5;
}

- (CTLazuliSuggestedActionRequestLocationPush)initWithReflection:(const SuggestedActionRequestLocationPush *)a3
{
  CTLazuliSuggestedActionRequestLocationPush *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTLazuliSuggestedActionRequestLocationPush;
  result = -[CTLazuliSuggestedActionRequestLocationPush init](&v5, sel_init);
  if (result)
    result->_sendPush = a3->var0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sendPush
{
  return self->_sendPush;
}

- (void)setSendPush:(BOOL)a3
{
  self->_sendPush = a3;
}

@end
