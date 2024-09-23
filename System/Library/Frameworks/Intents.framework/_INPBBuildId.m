@implementation _INPBBuildId

- (void)setBuildNumber:(id)a3
{
  NSString *v4;
  NSString *buildNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  buildNumber = self->_buildNumber;
  self->_buildNumber = v4;

}

- (BOOL)hasBuildNumber
{
  return self->_buildNumber != 0;
}

- (void)setVersionNumber:(id)a3
{
  NSString *v4;
  NSString *versionNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  versionNumber = self->_versionNumber;
  self->_versionNumber = v4;

}

- (BOOL)hasVersionNumber
{
  return self->_versionNumber != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBuildIdReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBBuildId buildNumber](self, "buildNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBBuildId versionNumber](self, "versionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBBuildId)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBuildId *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBuildId *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBuildId *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBuildId initWithData:](self, "initWithData:", v6);

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
  -[_INPBBuildId data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBuildId *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBBuildId init](+[_INPBBuildId allocWithZone:](_INPBBuildId, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_buildNumber, "copyWithZone:", a3);
  -[_INPBBuildId setBuildNumber:](v5, "setBuildNumber:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_versionNumber, "copyWithZone:", a3);
  -[_INPBBuildId setVersionNumber:](v5, "setVersionNumber:", v7);

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
  -[_INPBBuildId buildNumber](self, "buildNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBBuildId buildNumber](self, "buildNumber");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBuildId buildNumber](self, "buildNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBBuildId versionNumber](self, "versionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "versionNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBuildId versionNumber](self, "versionNumber");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBBuildId versionNumber](self, "versionNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "versionNumber");
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

  v3 = -[NSString hash](self->_buildNumber, "hash");
  return -[NSString hash](self->_versionNumber, "hash") ^ v3;
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
  if (self->_buildNumber)
  {
    -[_INPBBuildId buildNumber](self, "buildNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("build_number"));

  }
  if (self->_versionNumber)
  {
    -[_INPBBuildId versionNumber](self, "versionNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("version_number"));

  }
  return v3;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
