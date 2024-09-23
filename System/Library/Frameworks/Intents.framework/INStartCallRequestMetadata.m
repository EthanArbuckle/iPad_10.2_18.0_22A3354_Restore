@implementation INStartCallRequestMetadata

- (INStartCallRequestMetadata)initWithAppInferred:(BOOL)a3
{
  INStartCallRequestMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartCallRequestMetadata;
  result = -[INStartCallRequestMetadata init](&v5, sel_init);
  if (result)
    result->_appInferred = a3;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appInferred);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  INStartCallRequestMetadata *v4;
  BOOL v5;

  v4 = (INStartCallRequestMetadata *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_appInferred == v4->_appInferred;
  }

  return v5;
}

- (INStartCallRequestMetadata)initWithCoder:(id)a3
{
  return -[INStartCallRequestMetadata initWithAppInferred:](self, "initWithAppInferred:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("appInferred")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_appInferred, CFSTR("appInferred"));
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appInferred);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v6, CFSTR("appInferred"));

  return v5;
}

- (NSString)description
{
  return (NSString *)-[INStartCallRequestMetadata descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INStartCallRequestMetadata;
  -[INStartCallRequestMetadata description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INStartCallRequestMetadata _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("appInferred");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appInferred);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)appInferred
{
  return self->_appInferred;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appInferred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAppInferred:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
