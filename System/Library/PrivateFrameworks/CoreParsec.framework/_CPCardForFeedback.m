@implementation _CPCardForFeedback

- (void)setCardSections:(id)a3
{
  NSArray *v4;
  NSArray *cardSections;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  cardSections = self->_cardSections;
  self->_cardSections = v4;

}

- (void)clearCardSections
{
  -[NSArray removeAllObjects](self->_cardSections, "removeAllObjects");
}

- (void)addCardSections:(id)a3
{
  id v4;
  NSArray *cardSections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  cardSections = self->_cardSections;
  v8 = v4;
  if (!cardSections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cardSections;
    self->_cardSections = v6;

    v4 = v8;
    cardSections = self->_cardSections;
  }
  -[NSArray addObject:](cardSections, "addObject:", v4);

}

- (unint64_t)cardSectionsCount
{
  return -[NSArray count](self->_cardSections, "count");
}

- (id)cardSectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cardSections, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_cardSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_CPCardForFeedback fbr](self, "fbr", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();

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
  -[_CPCardForFeedback cardSections](self, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_CPCardForFeedback cardSections](self, "cardSections");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPCardForFeedback cardSections](self, "cardSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_CPCardForFeedback fbr](self, "fbr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_CPCardForFeedback fbr](self, "fbr");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_CPCardForFeedback fbr](self, "fbr");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbr");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_cardSections, "hash");
  return -[NSString hash](self->_fbr, "hash") ^ v3;
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
}

- (_CPCardForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardForFeedback *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _CPCardSectionForFeedback *v13;
  void *v14;
  void *v15;
  _CPCardForFeedback *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_CPCardForFeedback;
  v5 = -[_CPCardForFeedback init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cardSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "cardSections", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_CPCardSectionForFeedback initWithFacade:]([_CPCardSectionForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    -[_CPCardForFeedback setCardSections:](v5, "setCardSections:", v7);
    objc_msgSend(v4, "fbr");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "fbr");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardForFeedback setFbr:](v5, "setFbr:", v15);

    }
    v16 = v5;

  }
  return v5;
}

@end
