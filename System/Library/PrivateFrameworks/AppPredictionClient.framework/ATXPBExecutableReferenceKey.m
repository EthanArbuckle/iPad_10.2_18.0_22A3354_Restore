@implementation ATXPBExecutableReferenceKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_executableString, 0);
  objc_storeStrong((id *)&self->_executableLinkAction, 0);
  objc_storeStrong((id *)&self->_executableInfoSuggestion, 0);
  objc_storeStrong((id *)&self->_executableHeroApp, 0);
  objc_storeStrong((id *)&self->_executableAction, 0);
}

- (void)addReferences:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)references
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)executableType
{
  if (result)
    return *(unsigned int *)(result + 48);
  return result;
}

- (uint64_t)executableString
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)executableAction
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)executableInfoSuggestion
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (__CFString)executableTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 6)
      return off_1E4D5B2D0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (BOOL)hasExecutableString
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (BOOL)hasExecutableAction
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
}

- (BOOL)hasExecutableHeroApp
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)clearReferences
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "removeAllObjects");
  return result;
}

- (uint64_t)referencesCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "count");
  return result;
}

- (id)referencesAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)referencesType
{
  objc_opt_self();
  return objc_opt_class();
}

- (BOOL)hasExecutableInfoSuggestion
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasExecutableLinkAction
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
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
  v8.super_class = (Class)ATXPBExecutableReferenceKey;
  -[ATXPBExecutableReferenceKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBExecutableReferenceKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t executableType;
  __CFString *v5;
  NSString *executableString;
  ATXPBAction *executableAction;
  void *v8;
  ATXPBHeroAppPrediction *executableHeroApp;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  ATXPBInfoSuggestion *executableInfoSuggestion;
  void *v19;
  ATXPBLinkAction *executableLinkAction;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  executableType = self->_executableType;
  if (executableType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E4D5B2D0[executableType];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("executableType"));

  executableString = self->_executableString;
  if (executableString)
    objc_msgSend(v3, "setObject:forKey:", executableString, CFSTR("executableString"));
  executableAction = self->_executableAction;
  if (executableAction)
  {
    -[ATXPBAction dictionaryRepresentation](executableAction, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("executableAction"));

  }
  executableHeroApp = self->_executableHeroApp;
  if (executableHeroApp)
  {
    -[ATXPBHeroAppPrediction dictionaryRepresentation](executableHeroApp, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("executableHeroApp"));

  }
  if (-[NSMutableArray count](self->_references, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_references, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_references;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("references"));
  }
  executableInfoSuggestion = self->_executableInfoSuggestion;
  if (executableInfoSuggestion)
  {
    -[ATXPBInfoSuggestion dictionaryRepresentation](executableInfoSuggestion, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("executableInfoSuggestion"));

  }
  executableLinkAction = self->_executableLinkAction;
  if (executableLinkAction)
  {
    -[ATXPBLinkAction dictionaryRepresentation](executableLinkAction, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("executableLinkAction"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBExecutableReferenceKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_executableString)
    PBDataWriterWriteStringField();
  if (self->_executableAction)
    PBDataWriterWriteSubmessage();
  if (self->_executableHeroApp)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_references;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_executableInfoSuggestion)
    PBDataWriterWriteSubmessage();
  if (self->_executableLinkAction)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id *v13;

  v3 = a2;
  if (a1)
  {
    *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 40);
    v13 = v3;
    if (v4)
      -[ATXPBExecutableReferenceKey setExecutableString:]((uint64_t)v3, v4);
    v5 = *(void **)(a1 + 8);
    if (v5)
      -[ATXPBExecutableReferenceKey setExecutableAction:]((uint64_t)v13, v5);
    v6 = *(void **)(a1 + 16);
    if (v6)
      -[ATXPBExecutableReferenceKey setExecutableHeroApp:]((uint64_t)v13, v6);
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      objc_msgSend(v13[7], "removeAllObjects");
      v7 = objc_msgSend(*(id *)(a1 + 56), "count");
      if (v7)
      {
        v8 = v7;
        for (i = 0; i != v8; ++i)
        {
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBExecutableReferenceKey addReferences:]((uint64_t)v13, v10);

        }
      }
    }
    v11 = *(void **)(a1 + 24);
    if (v11)
      -[ATXPBExecutableReferenceKey setExecutableInfoSuggestion:]((uint64_t)v13, v11);
    v12 = *(void **)(a1 + 32);
    v3 = v13;
    if (v12)
    {
      -[ATXPBExecutableReferenceKey setExecutableLinkAction:]((uint64_t)v13, v12);
      v3 = v13;
    }
  }

}

- (void)setExecutableString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setExecutableAction:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setExecutableHeroApp:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setExecutableInfoSuggestion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setExecutableLinkAction:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_executableType;
  v6 = -[NSString copyWithZone:](self->_executableString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[ATXPBAction copyWithZone:](self->_executableAction, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[ATXPBHeroAppPrediction copyWithZone:](self->_executableHeroApp, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_references;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v23);
        -[ATXPBExecutableReferenceKey addReferences:](v5, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = -[ATXPBInfoSuggestion copyWithZone:](self->_executableInfoSuggestion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  v20 = -[ATXPBLinkAction copyWithZone:](self->_executableLinkAction, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *executableString;
  ATXPBAction *executableAction;
  ATXPBHeroAppPrediction *executableHeroApp;
  NSMutableArray *references;
  ATXPBInfoSuggestion *executableInfoSuggestion;
  ATXPBLinkAction *executableLinkAction;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_executableType == *((_DWORD *)v4 + 12)
    && ((executableString = self->_executableString, !((unint64_t)executableString | v4[5]))
     || -[NSString isEqual:](executableString, "isEqual:"))
    && ((executableAction = self->_executableAction, !((unint64_t)executableAction | v4[1]))
     || -[ATXPBAction isEqual:](executableAction, "isEqual:"))
    && ((executableHeroApp = self->_executableHeroApp, !((unint64_t)executableHeroApp | v4[2]))
     || -[ATXPBHeroAppPrediction isEqual:](executableHeroApp, "isEqual:"))
    && ((references = self->_references, !((unint64_t)references | v4[7]))
     || -[NSMutableArray isEqual:](references, "isEqual:"))
    && ((executableInfoSuggestion = self->_executableInfoSuggestion,
         !((unint64_t)executableInfoSuggestion | v4[3]))
     || -[ATXPBInfoSuggestion isEqual:](executableInfoSuggestion, "isEqual:")))
  {
    executableLinkAction = self->_executableLinkAction;
    if ((unint64_t)executableLinkAction | v4[4])
      v11 = -[ATXPBLinkAction isEqual:](executableLinkAction, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 2654435761 * self->_executableType;
  v4 = -[NSString hash](self->_executableString, "hash");
  v5 = v4 ^ -[ATXPBAction hash](self->_executableAction, "hash");
  v6 = v5 ^ -[ATXPBHeroAppPrediction hash](self->_executableHeroApp, "hash");
  v7 = v6 ^ -[NSMutableArray hash](self->_references, "hash");
  v8 = v7 ^ -[ATXPBInfoSuggestion hash](self->_executableInfoSuggestion, "hash") ^ v3;
  return v8 ^ -[ATXPBLinkAction hash](self->_executableLinkAction, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
    v5 = v3[5];
    if (v5)
      objc_storeStrong((id *)(a1 + 40), v5);
    v6 = v4[1];
    if (*(_QWORD *)(a1 + 8))
    {
      if (v6)
        objc_msgSend(*(id *)(a1 + 8), "mergeFrom:");
    }
    else if (v6)
    {
      objc_storeStrong((id *)(a1 + 8), v4[1]);
    }
    v7 = v4[2];
    if (*(_QWORD *)(a1 + 16))
    {
      if (v7)
        objc_msgSend(*(id *)(a1 + 16), "mergeFrom:");
    }
    else if (v7)
    {
      objc_storeStrong((id *)(a1 + 16), v4[2]);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v4[7];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[ATXPBExecutableReferenceKey addReferences:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = v4[3];
    if (*(_QWORD *)(a1 + 24))
    {
      if (v13)
        objc_msgSend(*(id *)(a1 + 24), "mergeFrom:", (_QWORD)v15);
    }
    else if (v13)
    {
      objc_storeStrong((id *)(a1 + 24), v4[3]);
    }
    v14 = v4[4];
    if (*(_QWORD *)(a1 + 32))
    {
      if (v14)
        objc_msgSend(*(id *)(a1 + 32), "mergeFrom:");
    }
    else if (v14)
    {
      objc_storeStrong((id *)(a1 + 32), v4[4]);
    }
  }

}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 48) = a2;
  return result;
}

- (uint64_t)executableHeroApp
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setReferences:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)executableLinkAction
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

@end
