@implementation _INPBWorkoutCustomization

- (void)setEnvironment:(id)a3
{
  NSString *v4;
  NSString *environment;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  environment = self->_environment;
  self->_environment = v4;

}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (void)setFocus:(id)a3
{
  NSString *v4;
  NSString *focus;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  focus = self->_focus;
  self->_focus = v4;

}

- (BOOL)hasFocus
{
  return self->_focus != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWorkoutCustomizationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBWorkoutCustomization environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBWorkoutCustomization focus](self, "focus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBWorkoutCustomization)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWorkoutCustomization *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWorkoutCustomization *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWorkoutCustomization *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWorkoutCustomization initWithData:](self, "initWithData:", v6);

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
  -[_INPBWorkoutCustomization data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWorkoutCustomization *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBWorkoutCustomization init](+[_INPBWorkoutCustomization allocWithZone:](_INPBWorkoutCustomization, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  -[_INPBWorkoutCustomization setEnvironment:](v5, "setEnvironment:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_focus, "copyWithZone:", a3);
  -[_INPBWorkoutCustomization setFocus:](v5, "setFocus:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBWorkoutCustomization environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBWorkoutCustomization environment](self, "environment");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBWorkoutCustomization environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBWorkoutCustomization focus](self, "focus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBWorkoutCustomization focus](self, "focus");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBWorkoutCustomization focus](self, "focus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_environment, "hash");
  return -[NSString hash](self->_focus, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_environment)
  {
    -[_INPBWorkoutCustomization environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("environment"));

  }
  if (self->_focus)
  {
    -[_INPBWorkoutCustomization focus](self, "focus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("focus"));

  }
  return v3;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)focus
{
  return self->_focus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
