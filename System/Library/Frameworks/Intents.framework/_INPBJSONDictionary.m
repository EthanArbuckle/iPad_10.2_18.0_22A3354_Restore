@implementation _INPBJSONDictionary

- (void)setJsonString:(id)a3
{
  NSString *v4;
  NSString *jsonString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  jsonString = self->_jsonString;
  self->_jsonString = v4;

}

- (BOOL)hasJsonString
{
  return self->_jsonString != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBJSONDictionaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_INPBJSONDictionary jsonString](self, "jsonString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();

}

- (_INPBJSONDictionary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBJSONDictionary *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBJSONDictionary *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBJSONDictionary *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBJSONDictionary initWithData:](self, "initWithData:", v6);

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
  -[_INPBJSONDictionary data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBJSONDictionary *v5;
  void *v6;

  v5 = -[_INPBJSONDictionary init](+[_INPBJSONDictionary allocWithZone:](_INPBJSONDictionary, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_jsonString, "copyWithZone:", a3);
  -[_INPBJSONDictionary setJsonString:](v5, "setJsonString:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_INPBJSONDictionary jsonString](self, "jsonString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBJSONDictionary jsonString](self, "jsonString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBJSONDictionary jsonString](self, "jsonString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "jsonString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_jsonString, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_jsonString)
  {
    -[_INPBJSONDictionary jsonString](self, "jsonString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("jsonString"));

  }
  return v3;
}

- (NSString)jsonString
{
  return self->_jsonString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
