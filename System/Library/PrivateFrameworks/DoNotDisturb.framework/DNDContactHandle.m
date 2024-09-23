@implementation DNDContactHandle

- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  DNDContactHandle *v10;
  uint64_t v11;
  NSString *contactIdentifier;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DNDContactHandle;
  v10 = -[DNDContactHandle init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    v10->_type = a4;
    v13 = objc_msgSend(v9, "copy");
    value = v10->_value;
    v10->_value = (NSString *)v13;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DNDContactHandle type](self, "type") ^ v4;
  -[DNDContactHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDContactHandle *v7;
  DNDContactHandle *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = (DNDContactHandle *)a3;
  if (self == v7)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDContactHandle contactIdentifier](v8, "contactIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v3 = (void *)v11;
        -[DNDContactHandle contactIdentifier](v8, "contactIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
          v13 = 0;
LABEL_27:

          goto LABEL_28;
        }
        -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDContactHandle contactIdentifier](v8, "contactIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v5))
        {
          v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v12;
      }
      v14 = -[DNDContactHandle type](self, "type");
      if (v14 == -[DNDContactHandle type](v8, "type"))
      {
        -[DNDContactHandle value](self, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDContactHandle value](v8, "value");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 != (void *)v16)
        {
          v17 = (void *)v16;
          v25 = v5;
          -[DNDContactHandle value](self, "value");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDContactHandle value](v8, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v24 = v20;
              -[DNDContactHandle value](self, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDContactHandle value](v8, "value");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v23, "isEqual:", v22);

              v20 = v24;
            }
            else
            {
              v13 = 0;
            }

          }
          else
          {

            v13 = 0;
          }
          v5 = v25;
          v12 = v26;
          if (v9 == v10)
            goto LABEL_28;
          goto LABEL_26;
        }

        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      v12 = v26;
      if (v9 == v10)
        goto LABEL_28;
      goto LABEL_26;
    }
    v13 = 0;
  }
LABEL_29:

  return v13;
}

- (BOOL)matchesContactHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v12 = 1;
    }
    else
    {
      -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[DNDContactHandle contactIdentifier](self, "contactIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contactIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  -[DNDContactHandle value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (v14 = -[DNDContactHandle type](self, "type"), v14 == objc_msgSend(v4, "type")))
  {
    -[DNDContactHandle value](self, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {
      v21 = 1;
    }
    else
    {
      -[DNDContactHandle value](self, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v4, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[DNDContactHandle value](self, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
  }
  else
  {
    v21 = 0;
  }

  return v12 | v21;
}

- (id)description
{
  return -[DNDContactHandle _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDContactHandle _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  unint64_t type;
  NSString *contactIdentifier;
  const __CFString *v9;
  __CFString *v10;
  NSString *value;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  contactIdentifier = self->_contactIdentifier;
  type = self->_type;
  v9 = CFSTR("unknown");
  if (type == 2)
    v9 = CFSTR("phone");
  if (type == 1)
    v10 = CFSTR("email");
  else
    v10 = (__CFString *)v9;
  value = self->_value;
  v12 = v10;
  v13 = v12;
  if (a3)
  {
    -[NSString dnd_privacyObfuscatedString](value, "dnd_privacyObfuscatedString");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; contactIdentifier: %@; type: %@; value: %@;>"),
      v6,
      self,
      contactIdentifier,
      v13,
      v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; contactIdentifier: %@; type: %@; value: %@;>"),
      v6,
      self,
      contactIdentifier,
      v12,
      value);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)normalizedValue
{
  NSString *normalizedValue;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  normalizedValue = self->_normalizedValue;
  if (!normalizedValue)
  {
    -[DNDContactHandle value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DNDContactHandle type](self, "type");
    v6 = v4;
    v7 = v6;
    if (v5 == 2)
    {
      +[DNDContact normalizePhoneNumber:](DNDContact, "normalizePhoneNumber:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = (NSString *)objc_msgSend(v7, "copy");
    v9 = self->_normalizedValue;
    self->_normalizedValue = v8;

    normalizedValue = self->_normalizedValue;
  }
  return normalizedValue;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDContactHandle _initWithContactIdentifier:type:value:]([DNDMutableContactHandle alloc], "_initWithContactIdentifier:type:value:", self->_contactIdentifier, self->_type, self->_value);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDContactHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  DNDContactHandle *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DNDContactHandle _initWithContactIdentifier:type:value:](self, "_initWithContactIdentifier:type:value:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
