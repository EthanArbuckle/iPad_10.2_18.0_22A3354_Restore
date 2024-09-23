@implementation _INPBConfigureHomeIntentResponse

- (BOOL)readFrom:(id)a3
{
  return _INPBConfigureHomeIntentResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (_INPBConfigureHomeIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBConfigureHomeIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBConfigureHomeIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBConfigureHomeIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBConfigureHomeIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBConfigureHomeIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_INPBConfigureHomeIntentResponse init](+[_INPBConfigureHomeIntentResponse allocWithZone:](_INPBConfigureHomeIntentResponse, "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
