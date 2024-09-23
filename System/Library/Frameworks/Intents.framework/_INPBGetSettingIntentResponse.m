@implementation _INPBGetSettingIntentResponse

- (void)setErrorDetail:(id)a3
{
  NSString *v4;
  NSString *errorDetail;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  errorDetail = self->_errorDetail;
  self->_errorDetail = v4;

}

- (BOOL)hasErrorDetail
{
  return self->_errorDetail != 0;
}

- (void)setSettingResponseDatas:(id)a3
{
  NSArray *v4;
  NSArray *settingResponseDatas;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  settingResponseDatas = self->_settingResponseDatas;
  self->_settingResponseDatas = v4;

}

- (void)clearSettingResponseDatas
{
  -[NSArray removeAllObjects](self->_settingResponseDatas, "removeAllObjects");
}

- (void)addSettingResponseData:(id)a3
{
  id v4;
  NSArray *settingResponseDatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  settingResponseDatas = self->_settingResponseDatas;
  v8 = v4;
  if (!settingResponseDatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_settingResponseDatas;
    self->_settingResponseDatas = v6;

    v4 = v8;
    settingResponseDatas = self->_settingResponseDatas;
  }
  -[NSArray addObject:](settingResponseDatas, "addObject:", v4);

}

- (unint64_t)settingResponseDatasCount
{
  return -[NSArray count](self->_settingResponseDatas, "count");
}

- (id)settingResponseDataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_settingResponseDatas, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBGetSettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_settingResponseDatas;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (_INPBGetSettingIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetSettingIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetSettingIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetSettingIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetSettingIntentResponse *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBGetSettingIntentResponse init](+[_INPBGetSettingIntentResponse allocWithZone:](_INPBGetSettingIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_errorDetail, "copyWithZone:", a3);
  -[_INPBGetSettingIntentResponse setErrorDetail:](v5, "setErrorDetail:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_settingResponseDatas, "copyWithZone:", a3);
  -[_INPBGetSettingIntentResponse setSettingResponseDatas:](v5, "setSettingResponseDatas:", v7);

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
  -[_INPBGetSettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBGetSettingIntentResponse errorDetail](self, "errorDetail");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBGetSettingIntentResponse errorDetail](self, "errorDetail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBGetSettingIntentResponse settingResponseDatas](self, "settingResponseDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingResponseDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBGetSettingIntentResponse settingResponseDatas](self, "settingResponseDatas");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBGetSettingIntentResponse settingResponseDatas](self, "settingResponseDatas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingResponseDatas");
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

  v3 = -[NSString hash](self->_errorDetail, "hash");
  return -[NSArray hash](self->_settingResponseDatas, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_errorDetail)
  {
    -[_INPBGetSettingIntentResponse errorDetail](self, "errorDetail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDetail"));

  }
  if (-[NSArray count](self->_settingResponseDatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_settingResponseDatas;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("settingResponseData"));
  }
  return v3;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (NSArray)settingResponseDatas
{
  return self->_settingResponseDatas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingResponseDatas, 0);
  objc_storeStrong((id *)&self->_errorDetail, 0);
}

+ (Class)settingResponseDataType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
