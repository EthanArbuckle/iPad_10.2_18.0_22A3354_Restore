@implementation _INPBCallGroup

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBCallGroup groupId](self, "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBCallGroup groupId](self, "groupId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallGroup groupName](self, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBCallGroup groupName](self, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBCallGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallGroup *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallGroup *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallGroup *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallGroup initWithData:](self, "initWithData:", v6);

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
  -[_INPBCallGroup data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallGroup *v5;
  id v6;
  id v7;

  v5 = -[_INPBCallGroup init](+[_INPBCallGroup allocWithZone:](_INPBCallGroup, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  -[_INPBCallGroup setGroupId:](v5, "setGroupId:", v6);

  v7 = -[_INPBString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBCallGroup setGroupName:](v5, "setGroupName:", v7);

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
  -[_INPBCallGroup groupId](self, "groupId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBCallGroup groupId](self, "groupId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCallGroup groupId](self, "groupId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBCallGroup groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCallGroup groupName](self, "groupName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBCallGroup groupName](self, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
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
  unint64_t v3;

  v3 = -[_INPBString hash](self->_groupId, "hash");
  return -[_INPBString hash](self->_groupName, "hash") ^ v3;
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
  -[_INPBCallGroup groupId](self, "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groupId"));

  -[_INPBCallGroup groupName](self, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("groupName"));

  return v3;
}

- (_INPBString)groupId
{
  return self->_groupId;
}

- (_INPBString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
