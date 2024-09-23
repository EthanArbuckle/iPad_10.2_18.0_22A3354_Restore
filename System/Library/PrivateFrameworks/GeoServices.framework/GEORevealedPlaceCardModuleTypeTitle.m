@implementation GEORevealedPlaceCardModuleTypeTitle

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORevealedPlaceCardModuleTypeTitle;
  -[GEORevealedPlaceCardModuleTypeTitle dealloc](&v3, sel_dealloc);
}

- (unint64_t)titleElementsCount
{
  return self->_titleElements.count;
}

- (int)titleElements
{
  return self->_titleElements.list;
}

- (void)clearTitleElements
{
  PBRepeatedInt32Clear();
}

- (void)addTitleElements:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)titleElementsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_titleElements;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_titleElements = &self->_titleElements;
  count = self->_titleElements.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_titleElements->list[a3];
}

- (void)setTitleElements:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)titleElementsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23810[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTitleElements:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_CUSTOM_COVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_CUSTOM_LOGO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_VERIFIED_BADGE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEORevealedPlaceCardModuleTypeTitle;
  -[GEORevealedPlaceCardModuleTypeTitle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORevealedPlaceCardModuleTypeTitle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModuleTypeTitle _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1 + 1;
      if (a1[2])
      {
        v7 = 0;
        do
        {
          v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E1C23810[v8];
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = a1 + 1;
        }
        while (v7 < a1[2]);
      }
      if (a2)
        v10 = CFSTR("titleElements");
      else
        v10 = CFSTR("title_elements");
      objc_msgSend(v4, "setObject:forKey:", v5, v10);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORevealedPlaceCardModuleTypeTitle _dictionaryRepresentation:](self, 1);
}

- (GEORevealedPlaceCardModuleTypeTitle)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeTitle *)-[GEORevealedPlaceCardModuleTypeTitle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("titleElements");
      else
        v6 = CFSTR("title_elements");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v7;
        v18 = v5;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (!v9)
          goto LABEL_28;
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_UNKNOWN")) & 1) != 0)
              {
                v15 = 0;
              }
              else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_CUSTOM_COVER")) & 1) != 0)
              {
                v15 = 1;
              }
              else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_CUSTOM_LOGO")) & 1) != 0)
              {
                v15 = 2;
              }
              else if (objc_msgSend(v14, "isEqualToString:", CFSTR("RevealedPlaceCardModuleTitleElement_VERIFIED_BADGE")))
              {
                v15 = 3;
              }
              else
              {
                v15 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_26;
              v15 = objc_msgSend(v13, "intValue");
            }
            objc_msgSend(a1, "addTitleElements:", v15, v17, v18, (_QWORD)v19);
LABEL_26:
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (!v10)
          {
LABEL_28:

            v7 = v17;
            v5 = v18;
            break;
          }
        }
      }

    }
  }

  return a1;
}

- (GEORevealedPlaceCardModuleTypeTitle)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeTitle *)-[GEORevealedPlaceCardModuleTypeTitle _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleTypeTitleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleTypeTitleReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_titleElements;
  unint64_t v4;

  p_titleElements = &self->_titleElements;
  if (self->_titleElements.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_titleElements->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEORevealedPlaceCardModuleTypeTitle readAll:](self, "readAll:", 0);
  if (-[GEORevealedPlaceCardModuleTypeTitle titleElementsCount](self, "titleElementsCount"))
  {
    objc_msgSend(v7, "clearTitleElements");
    v4 = -[GEORevealedPlaceCardModuleTypeTitle titleElementsCount](self, "titleElementsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addTitleElements:", -[GEORevealedPlaceCardModuleTypeTitle titleElementsAtIndex:](self, "titleElementsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GEORevealedPlaceCardModuleTypeTitle readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEORevealedPlaceCardModuleTypeTitle readAll:](self, "readAll:", 1);
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "titleElementsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORevealedPlaceCardModuleTypeTitle addTitleElements:](self, "addTitleElements:", objc_msgSend(v7, "titleElementsAtIndex:", i));
  }

}

@end
