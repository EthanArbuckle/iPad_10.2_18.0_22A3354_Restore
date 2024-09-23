@implementation _CPDynamicButtonVisibilityFeedback

- (_CPDynamicButtonVisibilityFeedback)init
{
  _CPDynamicButtonVisibilityFeedback *v2;
  _CPDynamicButtonVisibilityFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPDynamicButtonVisibilityFeedback;
  v2 = -[_CPDynamicButtonVisibilityFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPDynamicButtonVisibilityFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setVisibleDynamicButton2s:(id)a3
{
  NSArray *v4;
  NSArray *visibleDynamicButton2s;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  visibleDynamicButton2s = self->_visibleDynamicButton2s;
  self->_visibleDynamicButton2s = v4;

}

- (void)clearVisibleDynamicButton2s
{
  -[NSArray removeAllObjects](self->_visibleDynamicButton2s, "removeAllObjects");
}

- (void)addVisibleDynamicButton2s:(id)a3
{
  id v4;
  NSArray *visibleDynamicButton2s;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  visibleDynamicButton2s = self->_visibleDynamicButton2s;
  v8 = v4;
  if (!visibleDynamicButton2s)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_visibleDynamicButton2s;
    self->_visibleDynamicButton2s = v6;

    v4 = v8;
    visibleDynamicButton2s = self->_visibleDynamicButton2s;
  }
  -[NSArray addObject:](visibleDynamicButton2s, "addObject:", v4);

}

- (unint64_t)visibleDynamicButton2sCount
{
  return -[NSArray count](self->_visibleDynamicButton2s, "count");
}

- (id)visibleDynamicButton2sAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_visibleDynamicButton2s, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPDynamicButtonVisibilityFeedbackReadFrom(self, (uint64_t)a3);
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
  if (-[_CPDynamicButtonVisibilityFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPDynamicButtonVisibilityFeedback cardSectionIdentifier](self, "cardSectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_visibleDynamicButton2s;
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_13;
  -[_CPDynamicButtonVisibilityFeedback cardSectionIdentifier](self, "cardSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[_CPDynamicButtonVisibilityFeedback cardSectionIdentifier](self, "cardSectionIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPDynamicButtonVisibilityFeedback cardSectionIdentifier](self, "cardSectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[_CPDynamicButtonVisibilityFeedback visibleDynamicButton2s](self, "visibleDynamicButton2s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleDynamicButton2s");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPDynamicButtonVisibilityFeedback visibleDynamicButton2s](self, "visibleDynamicButton2s");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[_CPDynamicButtonVisibilityFeedback visibleDynamicButton2s](self, "visibleDynamicButton2s");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleDynamicButton2s");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_cardSectionIdentifier, "hash");
  return v4 ^ -[NSArray hash](self->_visibleDynamicButton2s, "hash") ^ v3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (void)setCardSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)visibleDynamicButton2s
{
  return self->_visibleDynamicButton2s;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleDynamicButton2s, 0);
  objc_storeStrong((id *)&self->_cardSectionIdentifier, 0);
}

- (_CPDynamicButtonVisibilityFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPDynamicButtonVisibilityFeedback *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _CPButtonForFeedback *v14;
  void *v15;
  void *v16;
  void *v17;
  _CPDynamicButtonVisibilityFeedback *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPDynamicButtonVisibilityFeedback init](self, "init");
  if (v5)
  {
    -[_CPDynamicButtonVisibilityFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v4, "buttons", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = -[_CPButtonForFeedback initWithFacade:]([_CPButtonForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
            objc_msgSend(v8, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

      -[_CPDynamicButtonVisibilityFeedback setVisibleDynamicButton2s:](v5, "setVisibleDynamicButton2s:", v8);
    }
    objc_msgSend(v4, "cardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "cardSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cardSectionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPDynamicButtonVisibilityFeedback setCardSectionIdentifier:](v5, "setCardSectionIdentifier:", v17);

    }
    v18 = v5;
  }

  return v5;
}

@end
