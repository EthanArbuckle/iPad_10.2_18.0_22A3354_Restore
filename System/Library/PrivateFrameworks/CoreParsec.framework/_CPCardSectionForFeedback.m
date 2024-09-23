@implementation _CPCardSectionForFeedback

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

- (void)setButtons:(id)a3
{
  NSArray *v4;
  NSArray *buttons;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  buttons = self->_buttons;
  self->_buttons = v4;

}

- (void)clearButtons
{
  -[NSArray removeAllObjects](self->_buttons, "removeAllObjects");
}

- (void)addButtons:(id)a3
{
  id v4;
  NSArray *buttons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  buttons = self->_buttons;
  v8 = v4;
  if (!buttons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_buttons;
    self->_buttons = v6;

    v4 = v8;
    buttons = self->_buttons;
  }
  -[NSArray addObject:](buttons, "addObject:", v4);

}

- (unint64_t)buttonsCount
{
  return -[NSArray count](self->_buttons, "count");
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", a3);
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *leadingSwipeButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  self->_leadingSwipeButtonItems = v4;

}

- (void)clearLeadingSwipeButtonItems
{
  -[NSArray removeAllObjects](self->_leadingSwipeButtonItems, "removeAllObjects");
}

- (void)addLeadingSwipeButtonItems:(id)a3
{
  id v4;
  NSArray *leadingSwipeButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  v8 = v4;
  if (!leadingSwipeButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_leadingSwipeButtonItems;
    self->_leadingSwipeButtonItems = v6;

    v4 = v8;
    leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  }
  -[NSArray addObject:](leadingSwipeButtonItems, "addObject:", v4);

}

- (unint64_t)leadingSwipeButtonItemsCount
{
  return -[NSArray count](self->_leadingSwipeButtonItems, "count");
}

- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_leadingSwipeButtonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *trailingSwipeButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  self->_trailingSwipeButtonItems = v4;

}

- (void)clearTrailingSwipeButtonItems
{
  -[NSArray removeAllObjects](self->_trailingSwipeButtonItems, "removeAllObjects");
}

- (void)addTrailingSwipeButtonItems:(id)a3
{
  id v4;
  NSArray *trailingSwipeButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  v8 = v4;
  if (!trailingSwipeButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trailingSwipeButtonItems;
    self->_trailingSwipeButtonItems = v6;

    v4 = v8;
    trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  }
  -[NSArray addObject:](trailingSwipeButtonItems, "addObject:", v4);

}

- (unint64_t)trailingSwipeButtonItemsCount
{
  return -[NSArray count](self->_trailingSwipeButtonItems, "count");
}

- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_trailingSwipeButtonItems, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CPCardSectionForFeedback cardSectionId](self, "cardSectionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPCardSectionForFeedback actionTarget](self, "actionTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPCardSectionForFeedback actionDestination](self, "actionDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_CPCardSectionForFeedback resultId](self, "resultId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if (-[_CPCardSectionForFeedback commandType](self, "commandType"))
    PBDataWriterWriteInt32Field();
  -[_CPCardSectionForFeedback commandDetail](self, "commandDetail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = self->_cardSections;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v12);
  }

  if (-[_CPCardSectionForFeedback cardSectionType](self, "cardSectionType"))
    PBDataWriterWriteInt32Field();
  -[_CPCardSectionForFeedback cardSectionDetail](self, "cardSectionDetail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = self->_buttons;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v18);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = self->_leadingSwipeButtonItems;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v23);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = self->_trailingSwipeButtonItems;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v28);
  }

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int commandType;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int cardSectionType;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  BOOL v59;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  -[_CPCardSectionForFeedback cardSectionId](self, "cardSectionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback cardSectionId](self, "cardSectionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPCardSectionForFeedback cardSectionId](self, "cardSectionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback actionTarget](self, "actionTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback actionTarget](self, "actionTarget");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPCardSectionForFeedback actionTarget](self, "actionTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback actionDestination](self, "actionDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback actionDestination](self, "actionDestination");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPCardSectionForFeedback actionDestination](self, "actionDestination");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionDestination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback resultId](self, "resultId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback resultId](self, "resultId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_CPCardSectionForFeedback resultId](self, "resultId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_54;
  }
  else
  {

  }
  commandType = self->_commandType;
  if (commandType != objc_msgSend(v4, "commandType"))
    goto LABEL_54;
  -[_CPCardSectionForFeedback commandDetail](self, "commandDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback commandDetail](self, "commandDetail");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_CPCardSectionForFeedback commandDetail](self, "commandDetail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandDetail");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback cardSections](self, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback cardSections](self, "cardSections");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_CPCardSectionForFeedback cardSections](self, "cardSections");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSections");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_54;
  }
  else
  {

  }
  cardSectionType = self->_cardSectionType;
  if (cardSectionType != objc_msgSend(v4, "cardSectionType"))
    goto LABEL_54;
  -[_CPCardSectionForFeedback cardSectionDetail](self, "cardSectionDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback cardSectionDetail](self, "cardSectionDetail");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_CPCardSectionForFeedback cardSectionDetail](self, "cardSectionDetail");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionDetail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback buttons](self, "buttons");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_CPCardSectionForFeedback buttons](self, "buttons");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttons");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingSwipeButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_53;
  -[_CPCardSectionForFeedback leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_CPCardSectionForFeedback leadingSwipeButtonItems](self, "leadingSwipeButtonItems");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingSwipeButtonItems");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_54;
  }
  else
  {

  }
  -[_CPCardSectionForFeedback trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSwipeButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_53:

    goto LABEL_54;
  }
  -[_CPCardSectionForFeedback trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
  {

LABEL_57:
    v59 = 1;
    goto LABEL_55;
  }
  v55 = (void *)v54;
  -[_CPCardSectionForFeedback trailingSwipeButtonItems](self, "trailingSwipeButtonItems");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSwipeButtonItems");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v56, "isEqual:", v57);

  if ((v58 & 1) != 0)
    goto LABEL_57;
LABEL_54:
  v59 = 0;
LABEL_55:

  return v59;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_cardSectionId, "hash");
  v4 = -[NSString hash](self->_actionTarget, "hash") ^ v3;
  v5 = -[NSString hash](self->_actionDestination, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_resultId, "hash");
  v7 = 2654435761 * self->_commandType;
  v8 = v6 ^ -[NSString hash](self->_commandDetail, "hash");
  v9 = v8 ^ -[NSArray hash](self->_cardSections, "hash") ^ v7;
  v10 = 2654435761 * self->_cardSectionType;
  v11 = v9 ^ v10 ^ -[NSString hash](self->_cardSectionDetail, "hash");
  v12 = -[NSArray hash](self->_buttons, "hash");
  v13 = v12 ^ -[NSArray hash](self->_leadingSwipeButtonItems, "hash");
  return v11 ^ v13 ^ -[NSArray hash](self->_trailingSwipeButtonItems, "hash");
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionDestination
{
  return self->_actionDestination;
}

- (void)setActionDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (int)cardSectionType
{
  return self->_cardSectionType;
}

- (void)setCardSectionType:(int)a3
{
  self->_cardSectionType = a3;
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (void)setCardSectionDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_actionDestination, 0);
  objc_storeStrong((id *)&self->_actionTarget, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
}

- (_CPCardSectionForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardSectionForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  _CPButtonForFeedback *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  _CPCardSectionForFeedback *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  objc_class *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _CPCardSectionForFeedback *v62;
  id v64;
  id v65;
  id v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPCardSectionForFeedback init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "cardSectionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPCardSectionForFeedback setCardSectionId:](v5, "setCardSectionId:", v6);

    objc_msgSend(v4, "resultIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPCardSectionForFeedback setResultId:](v5, "setResultId:", v7);

    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredOpenableURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPCardSectionForFeedback setActionDestination:](v5, "setActionDestination:", v11);

    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
      || objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      goto LABEL_4;
    }
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v4, "buttons");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v4, "buttonItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v4, "buttonItem");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
        v57 = objc_claimAutoreleasedReturnValue();
LABEL_149:
        v13 = (void *)v57;

LABEL_6:
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v15 = v14;
        if (v13)
        {
          objc_msgSend(v14, "addObjectsFromArray:", v13);

        }
LABEL_8:
        objc_msgSend(v4, "leadingSwipeButtonItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v4, "leadingSwipeButtonItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v17);

        }
        objc_msgSend(v4, "trailingSwipeButtonItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v4, "trailingSwipeButtonItems");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v19);

        }
        v66 = v15;
        if (objc_msgSend(v15, "count"))
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v21 = v15;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v84 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v27 = -[_CPButtonForFeedback initWithFacade:]([_CPButtonForFeedback alloc], "initWithFacade:", v26);
                  objc_msgSend(v20, "addObject:", v27);

                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
            }
            while (v23);
          }

          -[_CPCardSectionForFeedback setButtons:](v5, "setButtons:", v20);
          v15 = v66;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "buttonCardSections");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
LABEL_24:
            objc_msgSend(v4, "cardSections");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
          v28 = 0;
        }
LABEL_27:
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v80 != v32)
                objc_enumerationMutation(v29);
              v34 = -[_CPCardSectionForFeedback initWithFacade:]([_CPCardSectionForFeedback alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
              -[_CPCardSectionForFeedback addCardSections:](v5, "addCardSections:", v34);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
          }
          while (v31);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v64 = v29;
          v65 = v4;
          v35 = v4;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          objc_msgSend(v35, "infoTuples");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
          if (v69)
          {
            v68 = *(_QWORD *)v76;
            do
            {
              v36 = 0;
              do
              {
                if (*(_QWORD *)v76 != v68)
                  objc_enumerationMutation(obj);
                v70 = v36;
                v37 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v36);
                v71 = 0u;
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                objc_msgSend(v37, "values");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
                if (v39)
                {
                  v40 = v39;
                  v41 = *(_QWORD *)v72;
                  do
                  {
                    for (k = 0; k != v40; ++k)
                    {
                      if (*(_QWORD *)v72 != v41)
                        objc_enumerationMutation(v38);
                      v43 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
                      v44 = (void *)objc_opt_new();
                      objc_msgSend(v35, "cardSectionId");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "setCardSectionId:", v45);

                      objc_msgSend(v43, "command");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "setCommandType:", objc_msgSend(v46, "_cpCommandType"));

                      objc_msgSend(v43, "command");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "commandDetail");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "setCommandDetail:", v48);

                      -[_CPCardSectionForFeedback addCardSections:](v5, "addCardSections:", v44);
                    }
                    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
                  }
                  while (v40);
                }

                v36 = v70 + 1;
              }
              while (v70 + 1 != v69);
              v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
            }
            while (v69);
          }

          v4 = v65;
          v15 = v66;
          v29 = v64;
        }
        objc_msgSend(v4, "command");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CPCardSectionForFeedback setCommandType:](v5, "setCommandType:", objc_msgSend(v49, "_cpCommandType"));

        objc_msgSend(v4, "commandDetail");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CPCardSectionForFeedback setCommandDetail:](v5, "setCommandDetail:", v50);

        objc_msgSend(v4, "type");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v4, "type");
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "compare:options:", CFSTR("none"), 3))
          {
            if (objc_msgSend(v52, "compare:options:", CFSTR("app_link"), 3))
            {
              if (objc_msgSend(v52, "compare:options:", CFSTR("description"), 3))
              {
                v53 = 3;
                if (objc_msgSend(v52, "compare:options:", CFSTR("key_value_data"), 3))
                {
                  if (objc_msgSend(v52, "compare:options:", CFSTR("map"), 3))
                  {
                    if (objc_msgSend(v52, "compare:options:", CFSTR("media_info"), 3))
                    {
                      if (objc_msgSend(v52, "compare:options:", CFSTR("media_player"), 3))
                      {
                        if (objc_msgSend(v52, "compare:options:", CFSTR("now_playing"), 3))
                        {
                          if (objc_msgSend(v52, "compare:options:", CFSTR("rich_title"), 3))
                          {
                            if (objc_msgSend(v52, "compare:options:", CFSTR("row"), 3))
                            {
                              if (objc_msgSend(v52, "compare:options:", CFSTR("scoreboard"), 3))
                              {
                                if (objc_msgSend(v52, "compare:options:", CFSTR("social_media_post"), 3))
                                {
                                  if (objc_msgSend(v52, "compare:options:", CFSTR("stock_chart"), 3))
                                  {
                                    if (objc_msgSend(v52, "compare:options:", CFSTR("table_header_row"), 3))
                                    {
                                      if (objc_msgSend(v52, "compare:options:", CFSTR("table_row"), 3))
                                      {
                                        if (objc_msgSend(v52, "compare:options:", CFSTR("text_columns"), 3))
                                        {
                                          if (objc_msgSend(v52, "compare:options:", CFSTR("title"), 3))
                                          {
                                            if (objc_msgSend(v52, "compare:options:", CFSTR("track_list"), 3))
                                            {
                                              if (objc_msgSend(v52, "compare:options:", CFSTR("audio_playback"), 3))
                                              {
                                                if (objc_msgSend(v52, "compare:options:", CFSTR("flight"), 3))
                                                {
                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("activity_indicator"), 3))
                                                  {
                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("web"), 3))
                                                    {
                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("message"), 3))
                                                      {
                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("detailed_row"), 3))
                                                        {
                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("images"), 3))
                                                          {
                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("suggestion"), 3))
                                                            {
                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("selectable_grid"), 3))
                                                              {
                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("section_header"), 3))
                                                                {
                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("meta_info"), 3))
                                                                  {
                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("watch_list"), 3))
                                                                    {
                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("maps_detailed_row"), 3))
                                                                      {
                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("button"), 3))
                                                                        {
                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("horizontal_button"), 3))
                                                                          {
                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("vertical_layout"), 3))
                                                                            {
                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("product"), 3))
                                                                              {
                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("horizontal_scroll"), 3))
                                                                                {
                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("media_remote_control"), 3))
                                                                                  {
                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("map_place"), 3))
                                                                                    {
                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("compact_row"), 3))
                                                                                      {
                                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("world_map"), 3))
                                                                                        {
                                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("attribution_footer"), 3))
                                                                                          {
                                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("grid"), 3))
                                                                                            {
                                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("person_header"), 3))
                                                                                              {
                                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("color_bar"), 3))
                                                                                                {
                                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("split"), 3))
                                                                                                  {
                                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("link_presentation"), 3))
                                                                                                    {
                                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("find_my"), 3))
                                                                                                      {
                                                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("hero"), 3))
                                                                                                        {
                                                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("news"), 3))
                                                                                                          {
                                                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("mini"), 3))
                                                                                                            {
                                                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("info"), 3))
                                                                                                              {
                                                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("collection"), 3))
                                                                                                                {
                                                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("combined"), 3))
                                                                                                                  {
                                                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("response_wrapper"), 3))
                                                                                                                    {
                                                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("listen_to"), 3))
                                                                                                                      {
                                                                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("watch_now"), 3))
                                                                                                                        {
                                                                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("stroke_animation"), 3))
                                                                                                                          {
                                                                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("button_list"), 3))
                                                                                                                            {
                                                                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("command_row"), 3))
                                                                                                                              {
                                                                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("leading_trailing"), 3))
                                                                                                                                {
                                                                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("hero_title"), 3))
                                                                                                                                  {
                                                                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("archive_view"), 3))
                                                                                                                                    {
                                                                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("app_icon"), 3))
                                                                                                                                      {
                                                                                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("large_title_detailed_row"), 3))
                                                                                                                                        {
                                                                                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("rf_summary_item_short_number"), 3))
                                                                                                                                          {
                                                                                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("rf_summary_item_text"), 3))
                                                                                                                                            {
                                                                                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("rf_summary_item_standard"), 3))
                                                                                                                                              {
                                                                                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("rf_fact_item_short_number"), 3))
                                                                                                                                                {
                                                                                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("rf_fact_item_standard"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("rf_long_item_standard"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("rf_primary_header_rich"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (objc_msgSend(v52, "compare:options:", CFSTR("rf_primary_header_standard"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (objc_msgSend(v52, "compare:options:", CFSTR("rf_reference_footnote"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (objc_msgSend(v52, "compare:options:", CFSTR("rf_reference_rich"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (objc_msgSend(v52, "compare:options:", CFSTR("rf_simple_item_rich"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (objc_msgSend(v52, "compare:options:", CFSTR("rf_simple_item_standard"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (objc_msgSend(v52, "compare:options:", CFSTR("rf_summary_item_aligned_text"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (objc_msgSend(v52, "compare:options:", CFSTR("rf_expandable_standard"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v52, "compare:options:", CFSTR("rf_fact_item_button"), 3))
                                                                                                                                                                        v53 = 0;
                                                                                                                                                                      else
                                                                                                                                                                        v53 = 214;
                                                                                                                                                                      goto LABEL_306;
                                                                                                                                                                    }
                                                                                                                                                                    goto LABEL_302;
                                                                                                                                                                  }
LABEL_300:
                                                                                                                                                                  v53 = 212;
                                                                                                                                                                  goto LABEL_306;
                                                                                                                                                                }
LABEL_298:
                                                                                                                                                                v53 = 211;
                                                                                                                                                                goto LABEL_306;
                                                                                                                                                              }
LABEL_296:
                                                                                                                                                              v53 = 210;
                                                                                                                                                              goto LABEL_306;
                                                                                                                                                            }
LABEL_294:
                                                                                                                                                            v53 = 209;
                                                                                                                                                            goto LABEL_306;
                                                                                                                                                          }
LABEL_292:
                                                                                                                                                          v53 = 208;
                                                                                                                                                          goto LABEL_306;
                                                                                                                                                        }
LABEL_290:
                                                                                                                                                        v53 = 207;
                                                                                                                                                        goto LABEL_306;
                                                                                                                                                      }
LABEL_288:
                                                                                                                                                      v53 = 206;
                                                                                                                                                      goto LABEL_306;
                                                                                                                                                    }
LABEL_286:
                                                                                                                                                    v53 = 205;
                                                                                                                                                    goto LABEL_306;
                                                                                                                                                  }
LABEL_284:
                                                                                                                                                  v53 = 204;
                                                                                                                                                  goto LABEL_306;
                                                                                                                                                }
LABEL_282:
                                                                                                                                                v53 = 203;
                                                                                                                                                goto LABEL_306;
                                                                                                                                              }
LABEL_280:
                                                                                                                                              v53 = 202;
                                                                                                                                              goto LABEL_306;
                                                                                                                                            }
LABEL_278:
                                                                                                                                            v53 = 201;
                                                                                                                                            goto LABEL_306;
                                                                                                                                          }
LABEL_276:
                                                                                                                                          v53 = 200;
                                                                                                                                          goto LABEL_306;
                                                                                                                                        }
LABEL_274:
                                                                                                                                        v53 = 64;
                                                                                                                                        goto LABEL_306;
                                                                                                                                      }
LABEL_272:
                                                                                                                                      v53 = 63;
                                                                                                                                      goto LABEL_306;
                                                                                                                                    }
LABEL_270:
                                                                                                                                    v53 = 61;
                                                                                                                                    goto LABEL_306;
                                                                                                                                  }
LABEL_268:
                                                                                                                                  v53 = 60;
                                                                                                                                  goto LABEL_306;
                                                                                                                                }
LABEL_266:
                                                                                                                                v53 = 59;
                                                                                                                                goto LABEL_306;
                                                                                                                              }
LABEL_264:
                                                                                                                              v53 = 58;
                                                                                                                              goto LABEL_306;
                                                                                                                            }
LABEL_262:
                                                                                                                            v53 = 57;
                                                                                                                            goto LABEL_306;
                                                                                                                          }
LABEL_260:
                                                                                                                          v53 = 56;
                                                                                                                          goto LABEL_306;
                                                                                                                        }
LABEL_258:
                                                                                                                        v53 = 55;
                                                                                                                        goto LABEL_306;
                                                                                                                      }
LABEL_256:
                                                                                                                      v53 = 54;
                                                                                                                      goto LABEL_306;
                                                                                                                    }
LABEL_254:
                                                                                                                    v53 = 53;
                                                                                                                    goto LABEL_306;
                                                                                                                  }
LABEL_252:
                                                                                                                  v53 = 52;
                                                                                                                  goto LABEL_306;
                                                                                                                }
LABEL_250:
                                                                                                                v53 = 51;
                                                                                                                goto LABEL_306;
                                                                                                              }
LABEL_248:
                                                                                                              v53 = 50;
                                                                                                              goto LABEL_306;
                                                                                                            }
LABEL_246:
                                                                                                            v53 = 49;
                                                                                                            goto LABEL_306;
                                                                                                          }
LABEL_244:
                                                                                                          v53 = 48;
                                                                                                          goto LABEL_306;
                                                                                                        }
LABEL_242:
                                                                                                        v53 = 47;
                                                                                                        goto LABEL_306;
                                                                                                      }
LABEL_240:
                                                                                                      v53 = 46;
                                                                                                      goto LABEL_306;
                                                                                                    }
LABEL_238:
                                                                                                    v53 = 45;
                                                                                                    goto LABEL_306;
                                                                                                  }
LABEL_236:
                                                                                                  v53 = 44;
                                                                                                  goto LABEL_306;
                                                                                                }
LABEL_234:
                                                                                                v53 = 43;
                                                                                                goto LABEL_306;
                                                                                              }
LABEL_232:
                                                                                              v53 = 42;
                                                                                              goto LABEL_306;
                                                                                            }
LABEL_230:
                                                                                            v53 = 41;
                                                                                            goto LABEL_306;
                                                                                          }
LABEL_228:
                                                                                          v53 = 40;
                                                                                          goto LABEL_306;
                                                                                        }
LABEL_226:
                                                                                        v53 = 39;
                                                                                        goto LABEL_306;
                                                                                      }
LABEL_224:
                                                                                      v53 = 38;
                                                                                      goto LABEL_306;
                                                                                    }
LABEL_222:
                                                                                    v53 = 37;
                                                                                    goto LABEL_306;
                                                                                  }
LABEL_220:
                                                                                  v53 = 36;
                                                                                  goto LABEL_306;
                                                                                }
LABEL_218:
                                                                                v53 = 35;
                                                                                goto LABEL_306;
                                                                              }
LABEL_216:
                                                                              v53 = 34;
                                                                              goto LABEL_306;
                                                                            }
LABEL_214:
                                                                            v53 = 33;
                                                                            goto LABEL_306;
                                                                          }
LABEL_212:
                                                                          v53 = 32;
                                                                          goto LABEL_306;
                                                                        }
LABEL_210:
                                                                        v53 = 31;
                                                                        goto LABEL_306;
                                                                      }
LABEL_208:
                                                                      v53 = 30;
                                                                      goto LABEL_306;
                                                                    }
LABEL_206:
                                                                    v53 = 29;
                                                                    goto LABEL_306;
                                                                  }
LABEL_204:
                                                                  v53 = 28;
                                                                  goto LABEL_306;
                                                                }
LABEL_202:
                                                                v53 = 27;
                                                                goto LABEL_306;
                                                              }
LABEL_200:
                                                              v53 = 26;
                                                              goto LABEL_306;
                                                            }
LABEL_198:
                                                            v53 = 25;
                                                            goto LABEL_306;
                                                          }
LABEL_196:
                                                          v53 = 24;
                                                          goto LABEL_306;
                                                        }
LABEL_194:
                                                        v53 = 23;
                                                        goto LABEL_306;
                                                      }
LABEL_192:
                                                      v53 = 22;
                                                      goto LABEL_306;
                                                    }
LABEL_190:
                                                    v53 = 21;
                                                    goto LABEL_306;
                                                  }
LABEL_188:
                                                  v53 = 20;
                                                  goto LABEL_306;
                                                }
LABEL_186:
                                                v53 = 19;
                                                goto LABEL_306;
                                              }
LABEL_184:
                                              v53 = 18;
                                              goto LABEL_306;
                                            }
LABEL_182:
                                            v53 = 17;
                                            goto LABEL_306;
                                          }
LABEL_180:
                                          v53 = 16;
                                          goto LABEL_306;
                                        }
LABEL_178:
                                        v53 = 15;
                                        goto LABEL_306;
                                      }
LABEL_176:
                                      v53 = 14;
                                      goto LABEL_306;
                                    }
LABEL_174:
                                    v53 = 13;
                                    goto LABEL_306;
                                  }
LABEL_172:
                                  v53 = 12;
                                  goto LABEL_306;
                                }
LABEL_170:
                                v53 = 11;
                                goto LABEL_306;
                              }
LABEL_168:
                              v53 = 10;
                              goto LABEL_306;
                            }
LABEL_166:
                            v53 = 9;
                            goto LABEL_306;
                          }
LABEL_164:
                          v53 = 8;
                          goto LABEL_306;
                        }
LABEL_162:
                        v53 = 7;
                        goto LABEL_306;
                      }
LABEL_160:
                      v53 = 6;
                      goto LABEL_306;
                    }
LABEL_158:
                    v53 = 5;
                    goto LABEL_306;
                  }
LABEL_156:
                  v53 = 4;
                  goto LABEL_306;
                }
                goto LABEL_306;
              }
              goto LABEL_145;
            }
            goto LABEL_140;
          }
        }
        else
        {
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFNoneCardSection")) & 1) == 0)
          {
            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFAppLinkCardSection")) & 1) == 0)
            {
              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFDescriptionCardSection")) & 1) == 0)
              {
                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFKeyValueDataCardSection")) & 1) == 0)
                {
                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMapCardSection")) & 1) == 0)
                  {
                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMediaInfoCardSection")) & 1) == 0)
                    {
                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMediaPlayerCardSection")) & 1) == 0)
                      {
                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFNowPlayingCardSection")) & 1) == 0)
                        {
                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFRichTitleCardSection")) & 1) == 0)
                          {
                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFRowCardSection")) & 1) == 0)
                            {
                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFScoreboardCardSection")) & 1) == 0)
                              {
                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFSocialMediaPostCardSection")) & 1) == 0)
                                {
                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFStockChartCardSection")) & 1) == 0)
                                  {
                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFTableHeaderRowCardSection")) & 1) == 0)
                                    {
                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFTableRowCardSection")) & 1) == 0)
                                      {
                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFTextColumnsCardSection")) & 1) == 0)
                                        {
                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFTitleCardSection")) & 1) == 0)
                                          {
                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFTrackListCardSection")) & 1) == 0)
                                            {
                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFAudioPlaybackCardSection")) & 1) == 0)
                                              {
                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFFlightCardSection")) & 1) == 0)
                                                {
                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFActivityIndicatorCardSection")) & 1) == 0)
                                                  {
                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFWebCardSection")) & 1) == 0)
                                                    {
                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMessageCardSection")) & 1) == 0)
                                                      {
                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFDetailedRowCardSection")) & 1) == 0)
                                                        {
                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFImagesCardSection")) & 1) == 0)
                                                          {
                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFSuggestionCardSection")) & 1) == 0)
                                                            {
                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFSelectableGridCardSection")) & 1) == 0)
                                                              {
                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFSectionHeaderCardSection")) & 1) == 0)
                                                                {
                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMetaInfoCardSection")) & 1) == 0)
                                                                  {
                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFWatchListCardSection")) & 1) == 0)
                                                                    {
                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMapsDetailedRowCardSection")) & 1) == 0)
                                                                      {
                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFButtonCardSection")) & 1) == 0)
                                                                        {
                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFHorizontalButtonCardSection")) & 1) == 0)
                                                                          {
                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFVerticalLayoutCardSection")) & 1) == 0)
                                                                            {
                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFProductCardSection")) & 1) == 0)
                                                                              {
                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFHorizontalScrollCardSection")) & 1) == 0)
                                                                                {
                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMediaRemoteControlCardSection")) & 1) == 0)
                                                                                  {
                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMapPlaceCardSection")) & 1) == 0)
                                                                                    {
                                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFCompactRowCardSection")) & 1) == 0)
                                                                                      {
                                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFWorldMapCardSection")) & 1) == 0)
                                                                                        {
                                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFAttributionFooterCardSection")) & 1) == 0)
                                                                                          {
                                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFGridCardSection")) & 1) == 0)
                                                                                            {
                                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFPersonHeaderCardSection")) & 1) == 0)
                                                                                              {
                                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFColorBarCardSection")) & 1) == 0)
                                                                                                {
                                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFSplitCardSection")) & 1) == 0)
                                                                                                  {
                                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFLinkPresentationCardSection")) & 1) == 0)
                                                                                                    {
                                                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFFindMyCardSection")) & 1) == 0)
                                                                                                      {
                                                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFHeroCardSection")) & 1) == 0)
                                                                                                        {
                                                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFNewsCardSection")) & 1) == 0)
                                                                                                          {
                                                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFMiniCardSection")) & 1) == 0)
                                                                                                            {
                                                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFInfoCardSection")) & 1) == 0)
                                                                                                              {
                                                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFCollectionCardSection")) & 1) == 0)
                                                                                                                {
                                                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFCombinedCardSection")) & 1) == 0)
                                                                                                                  {
                                                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFResponseWrapperCardSection")) & 1) == 0)
                                                                                                                    {
                                                                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFListenToCardSection")) & 1) == 0)
                                                                                                                      {
                                                                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFWatchNowCardSection")) & 1) == 0)
                                                                                                                        {
                                                                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFStrokeAnimationCardSection")) & 1) == 0)
                                                                                                                          {
                                                                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFButtonListCardSection")) & 1) == 0)
                                                                                                                            {
                                                                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFCommandRowCardSection")) & 1) == 0)
                                                                                                                              {
                                                                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFLeadingTrailingCardSection")) & 1) == 0)
                                                                                                                                {
                                                                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFHeroTitleCardSection")) & 1) == 0)
                                                                                                                                  {
                                                                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFArchiveViewCardSection")) & 1) == 0)
                                                                                                                                    {
                                                                                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFAppIconCardSection")) & 1) == 0)
                                                                                                                                      {
                                                                                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("SFLargeTitleDetailedRowCardSection")) & 1) == 0)
                                                                                                                                        {
                                                                                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSummaryItemShortNumberCardSection")) & 1) == 0)
                                                                                                                                          {
                                                                                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSummaryItemTextCardSection")) & 1) == 0)
                                                                                                                                            {
                                                                                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSummaryItemStandardCardSection")) & 1) == 0)
                                                                                                                                              {
                                                                                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFFactItemShortNumberCardSection")) & 1) == 0)
                                                                                                                                                {
                                                                                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFFactItemStandardCardSection")) & 1) == 0)
                                                                                                                                                  {
                                                                                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFLongItemStandardCardSection")) & 1) == 0)
                                                                                                                                                    {
                                                                                                                                                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFPrimaryHeaderRichCardSection")) & 1) == 0)
                                                                                                                                                      {
                                                                                                                                                        if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFPrimaryHeaderStandardCardSection")) & 1) == 0)
                                                                                                                                                        {
                                                                                                                                                          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFReferenceFootnoteCardSection")) & 1) == 0)
                                                                                                                                                          {
                                                                                                                                                            if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFReferenceRichCardSection")) & 1) == 0)
                                                                                                                                                            {
                                                                                                                                                              if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSimpleItemRichCardSection")) & 1) == 0)
                                                                                                                                                              {
                                                                                                                                                                if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSimpleItemStandardCardSection")) & 1) == 0)
                                                                                                                                                                {
                                                                                                                                                                  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFSummaryItemAlignedTextCardSection")) & 1) == 0)
                                                                                                                                                                  {
                                                                                                                                                                    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("RFExpandableStandardCardSection")) & 1) == 0)
                                                                                                                                                                    {
                                                                                                                                                                      if (objc_msgSend(v52, "isEqualToString:", CFSTR("RFFactItemButtonCardSection")))
                                                                                                                                                                        v53 = 214;
                                                                                                                                                                      else
                                                                                                                                                                        v53 = 0;
                                                                                                                                                                      goto LABEL_306;
                                                                                                                                                                    }
LABEL_302:
                                                                                                                                                                    v53 = 213;
                                                                                                                                                                    goto LABEL_306;
                                                                                                                                                                  }
                                                                                                                                                                  goto LABEL_300;
                                                                                                                                                                }
                                                                                                                                                                goto LABEL_298;
                                                                                                                                                              }
                                                                                                                                                              goto LABEL_296;
                                                                                                                                                            }
                                                                                                                                                            goto LABEL_294;
                                                                                                                                                          }
                                                                                                                                                          goto LABEL_292;
                                                                                                                                                        }
                                                                                                                                                        goto LABEL_290;
                                                                                                                                                      }
                                                                                                                                                      goto LABEL_288;
                                                                                                                                                    }
                                                                                                                                                    goto LABEL_286;
                                                                                                                                                  }
                                                                                                                                                  goto LABEL_284;
                                                                                                                                                }
                                                                                                                                                goto LABEL_282;
                                                                                                                                              }
                                                                                                                                              goto LABEL_280;
                                                                                                                                            }
                                                                                                                                            goto LABEL_278;
                                                                                                                                          }
                                                                                                                                          goto LABEL_276;
                                                                                                                                        }
                                                                                                                                        goto LABEL_274;
                                                                                                                                      }
                                                                                                                                      goto LABEL_272;
                                                                                                                                    }
                                                                                                                                    goto LABEL_270;
                                                                                                                                  }
                                                                                                                                  goto LABEL_268;
                                                                                                                                }
                                                                                                                                goto LABEL_266;
                                                                                                                              }
                                                                                                                              goto LABEL_264;
                                                                                                                            }
                                                                                                                            goto LABEL_262;
                                                                                                                          }
                                                                                                                          goto LABEL_260;
                                                                                                                        }
                                                                                                                        goto LABEL_258;
                                                                                                                      }
                                                                                                                      goto LABEL_256;
                                                                                                                    }
                                                                                                                    goto LABEL_254;
                                                                                                                  }
                                                                                                                  goto LABEL_252;
                                                                                                                }
                                                                                                                goto LABEL_250;
                                                                                                              }
                                                                                                              goto LABEL_248;
                                                                                                            }
                                                                                                            goto LABEL_246;
                                                                                                          }
                                                                                                          goto LABEL_244;
                                                                                                        }
                                                                                                        goto LABEL_242;
                                                                                                      }
                                                                                                      goto LABEL_240;
                                                                                                    }
                                                                                                    goto LABEL_238;
                                                                                                  }
                                                                                                  goto LABEL_236;
                                                                                                }
                                                                                                goto LABEL_234;
                                                                                              }
                                                                                              goto LABEL_232;
                                                                                            }
                                                                                            goto LABEL_230;
                                                                                          }
                                                                                          goto LABEL_228;
                                                                                        }
                                                                                        goto LABEL_226;
                                                                                      }
                                                                                      goto LABEL_224;
                                                                                    }
                                                                                    goto LABEL_222;
                                                                                  }
                                                                                  goto LABEL_220;
                                                                                }
                                                                                goto LABEL_218;
                                                                              }
                                                                              goto LABEL_216;
                                                                            }
                                                                            goto LABEL_214;
                                                                          }
                                                                          goto LABEL_212;
                                                                        }
                                                                        goto LABEL_210;
                                                                      }
                                                                      goto LABEL_208;
                                                                    }
                                                                    goto LABEL_206;
                                                                  }
                                                                  goto LABEL_204;
                                                                }
                                                                goto LABEL_202;
                                                              }
                                                              goto LABEL_200;
                                                            }
                                                            goto LABEL_198;
                                                          }
                                                          goto LABEL_196;
                                                        }
                                                        goto LABEL_194;
                                                      }
                                                      goto LABEL_192;
                                                    }
                                                    goto LABEL_190;
                                                  }
                                                  goto LABEL_188;
                                                }
                                                goto LABEL_186;
                                              }
                                              goto LABEL_184;
                                            }
                                            goto LABEL_182;
                                          }
                                          goto LABEL_180;
                                        }
                                        goto LABEL_178;
                                      }
                                      goto LABEL_176;
                                    }
                                    goto LABEL_174;
                                  }
                                  goto LABEL_172;
                                }
                                goto LABEL_170;
                              }
                              goto LABEL_168;
                            }
                            goto LABEL_166;
                          }
                          goto LABEL_164;
                        }
                        goto LABEL_162;
                      }
                      goto LABEL_160;
                    }
                    goto LABEL_158;
                  }
                  goto LABEL_156;
                }
                v53 = 3;
LABEL_306:

                -[_CPCardSectionForFeedback setCardSectionType:](v5, "setCardSectionType:", v53);
                objc_msgSend(v4, "cardSectionDetail");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[_CPCardSectionForFeedback setCardSectionDetail:](v5, "setCardSectionDetail:", v61);

                v62 = v5;
                goto LABEL_307;
              }
LABEL_145:
              v53 = 2;
              goto LABEL_306;
            }
LABEL_140:
            v53 = 1;
            goto LABEL_306;
          }
        }
        v53 = 0;
        goto LABEL_306;
      }
    }
    else if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v4, "internalDetailedRowCardSection");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "buttonItems");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v4, "internalDetailedRowCardSection");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "buttonItems");
        v57 = objc_claimAutoreleasedReturnValue();
        goto LABEL_149;
      }
    }
    else if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v4, "buttonItems");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
LABEL_4:
        objc_msgSend(v4, "buttonItems");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
        v13 = (void *)v12;
        goto LABEL_6;
      }
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_8;
  }
LABEL_307:

  return v5;
}

@end
