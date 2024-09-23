@implementation BMPBContextualActionEvent

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasActionName
{
  return self->_actionName != 0;
}

- (void)clearContents
{
  -[NSMutableArray removeAllObjects](self->_contents, "removeAllObjects");
}

- (void)addContent:(id)a3
{
  id v4;
  NSMutableArray *contents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contents = self->_contents;
  v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contents;
    self->_contents = v6;

    v4 = v8;
    contents = self->_contents;
  }
  -[NSMutableArray addObject:](contents, "addObject:", v4);

}

- (unint64_t)contentsCount
{
  return -[NSMutableArray count](self->_contents, "count");
}

- (id)contentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contents, "objectAtIndex:", a3);
}

+ (Class)contentType
{
  return (Class)objc_opt_class();
}

- (void)clearParameters
{
  -[NSMutableArray removeAllObjects](self->_parameters, "removeAllObjects");
}

- (void)addParameter:(id)a3
{
  id v4;
  NSMutableArray *parameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameters = self->_parameters;
  v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parameters;
    self->_parameters = v6;

    v4 = v8;
    parameters = self->_parameters;
  }
  -[NSMutableArray addObject:](parameters, "addObject:", v4);

}

- (unint64_t)parametersCount
{
  return -[NSMutableArray count](self->_parameters, "count");
}

- (id)parameterAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parameters, "objectAtIndex:", a3);
}

+ (Class)parameterType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBContextualActionEvent;
  -[BMPBContextualActionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBContextualActionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *appName;
  NSString *actionName;
  NSMutableArray *contents;
  NSMutableArray *parameters;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  appName = self->_appName;
  if (appName)
    objc_msgSend(v4, "setObject:forKey:", appName, CFSTR("appName"));
  actionName = self->_actionName;
  if (actionName)
    objc_msgSend(v4, "setObject:forKey:", actionName, CFSTR("actionName"));
  contents = self->_contents;
  if (contents)
    objc_msgSend(v4, "setObject:forKey:", contents, CFSTR("content"));
  parameters = self->_parameters;
  if (parameters)
    objc_msgSend(v4, "setObject:forKey:", parameters, CFSTR("parameter"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBContextualActionEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_appName)
    PBDataWriterWriteStringField();
  if (self->_actionName)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_contents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_parameters;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_identifier)
    objc_msgSend(v12, "setIdentifier:");
  if (self->_appName)
    objc_msgSend(v12, "setAppName:");
  if (self->_actionName)
    objc_msgSend(v12, "setActionName:");
  if (-[BMPBContextualActionEvent contentsCount](self, "contentsCount"))
  {
    objc_msgSend(v12, "clearContents");
    v4 = -[BMPBContextualActionEvent contentsCount](self, "contentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBContextualActionEvent contentAtIndex:](self, "contentAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addContent:", v7);

      }
    }
  }
  if (-[BMPBContextualActionEvent parametersCount](self, "parametersCount"))
  {
    objc_msgSend(v12, "clearParameters");
    v8 = -[BMPBContextualActionEvent parametersCount](self, "parametersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[BMPBContextualActionEvent parameterAtIndex:](self, "parameterAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addParameter:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_actionName, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_contents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addContent:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_parameters;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addParameter:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *appName;
  NSString *actionName;
  NSMutableArray *contents;
  NSMutableArray *parameters;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[4]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((appName = self->_appName, !((unint64_t)appName | v4[2]))
     || -[NSString isEqual:](appName, "isEqual:"))
    && ((actionName = self->_actionName, !((unint64_t)actionName | v4[1]))
     || -[NSString isEqual:](actionName, "isEqual:"))
    && ((contents = self->_contents, !((unint64_t)contents | v4[3]))
     || -[NSMutableArray isEqual:](contents, "isEqual:")))
  {
    parameters = self->_parameters;
    if ((unint64_t)parameters | v4[5])
      v10 = -[NSMutableArray isEqual:](parameters, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_appName, "hash") ^ v3;
  v5 = -[NSString hash](self->_actionName, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_contents, "hash");
  return v6 ^ -[NSMutableArray hash](self->_parameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[BMPBContextualActionEvent setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[BMPBContextualActionEvent setAppName:](self, "setAppName:");
  if (*((_QWORD *)v4 + 1))
    -[BMPBContextualActionEvent setActionName:](self, "setActionName:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[BMPBContextualActionEvent addContent:](self, "addContent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[BMPBContextualActionEvent addParameter:](self, "addParameter:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_storeStrong((id *)&self->_actionName, a3);
}

- (NSMutableArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

@end
