@implementation _INPBLocalizedProject

- (void)setAppNames:(id)a3
{
  objc_storeStrong((id *)&self->_appNames, a3);
}

- (BOOL)hasAppNames
{
  return self->_appNames != 0;
}

- (void)setIntentVocabulary:(id)a3
{
  objc_storeStrong((id *)&self->_intentVocabulary, a3);
}

- (BOOL)hasIntentVocabulary
{
  return self->_intentVocabulary != 0;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocalizedProjectReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBLocalizedProject appNames](self, "appNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBLocalizedProject appNames](self, "appNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBLocalizedProject language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBLocalizedProject language](self, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBLocalizedProject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBLocalizedProject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBLocalizedProject *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBLocalizedProject *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBLocalizedProject initWithData:](self, "initWithData:", v6);

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
  -[_INPBLocalizedProject data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBLocalizedProject *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBLocalizedProject init](+[_INPBLocalizedProject allocWithZone:](_INPBLocalizedProject, "allocWithZone:"), "init");
  v6 = -[_INPBAppNames copyWithZone:](self->_appNames, "copyWithZone:", a3);
  -[_INPBLocalizedProject setAppNames:](v5, "setAppNames:", v6);

  v7 = -[_INPBIntentVocabulary copyWithZone:](self->_intentVocabulary, "copyWithZone:", a3);
  -[_INPBLocalizedProject setIntentVocabulary:](v5, "setIntentVocabulary:", v7);

  v8 = -[_INPBLanguageTag copyWithZone:](self->_language, "copyWithZone:", a3);
  -[_INPBLocalizedProject setLanguage:](v5, "setLanguage:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBLocalizedProject appNames](self, "appNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBLocalizedProject appNames](self, "appNames");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBLocalizedProject appNames](self, "appNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentVocabulary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentVocabulary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBLocalizedProject language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBLocalizedProject language](self, "language");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBLocalizedProject language](self, "language");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "language");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBAppNames hash](self->_appNames, "hash");
  v4 = -[_INPBIntentVocabulary hash](self->_intentVocabulary, "hash") ^ v3;
  return v4 ^ -[_INPBLanguageTag hash](self->_language, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBLocalizedProject appNames](self, "appNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("app_names"));

  -[_INPBLocalizedProject intentVocabulary](self, "intentVocabulary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intent_vocabulary"));

  -[_INPBLocalizedProject language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("language"));

  return v3;
}

- (_INPBAppNames)appNames
{
  return self->_appNames;
}

- (_INPBIntentVocabulary)intentVocabulary
{
  return self->_intentVocabulary;
}

- (_INPBLanguageTag)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_intentVocabulary, 0);
  objc_storeStrong((id *)&self->_appNames, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
