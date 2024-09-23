@implementation MXRecognitionResult

- (BOOL)hasPreItn
{
  return self->_preItn != 0;
}

- (BOOL)hasPostItn
{
  return self->_postItn != 0;
}

- (void)clearPreItnNbestChoices
{
  -[NSMutableArray removeAllObjects](self->_preItnNbestChoices, "removeAllObjects");
}

- (void)addPreItnNbestChoices:(id)a3
{
  id v4;
  NSMutableArray *preItnNbestChoices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preItnNbestChoices = self->_preItnNbestChoices;
  v8 = v4;
  if (!preItnNbestChoices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preItnNbestChoices;
    self->_preItnNbestChoices = v6;

    v4 = v8;
    preItnNbestChoices = self->_preItnNbestChoices;
  }
  -[NSMutableArray addObject:](preItnNbestChoices, "addObject:", v4);

}

- (unint64_t)preItnNbestChoicesCount
{
  return -[NSMutableArray count](self->_preItnNbestChoices, "count");
}

- (id)preItnNbestChoicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preItnNbestChoices, "objectAtIndex:", a3);
}

+ (Class)preItnNbestChoicesType
{
  return (Class)objc_opt_class();
}

- (void)clearPostItnNbestChoices
{
  -[NSMutableArray removeAllObjects](self->_postItnNbestChoices, "removeAllObjects");
}

- (void)addPostItnNbestChoices:(id)a3
{
  id v4;
  NSMutableArray *postItnNbestChoices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  postItnNbestChoices = self->_postItnNbestChoices;
  v8 = v4;
  if (!postItnNbestChoices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_postItnNbestChoices;
    self->_postItnNbestChoices = v6;

    v4 = v8;
    postItnNbestChoices = self->_postItnNbestChoices;
  }
  -[NSMutableArray addObject:](postItnNbestChoices, "addObject:", v4);

}

- (unint64_t)postItnNbestChoicesCount
{
  return -[NSMutableArray count](self->_postItnNbestChoices, "count");
}

- (id)postItnNbestChoicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_postItnNbestChoices, "objectAtIndex:", a3);
}

+ (Class)postItnNbestChoicesType
{
  return (Class)objc_opt_class();
}

- (void)clearPreItnTokenToPostItnCharAlignments
{
  -[NSMutableArray removeAllObjects](self->_preItnTokenToPostItnCharAlignments, "removeAllObjects");
}

- (void)addPreItnTokenToPostItnCharAlignment:(id)a3
{
  id v4;
  NSMutableArray *preItnTokenToPostItnCharAlignments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
  v8 = v4;
  if (!preItnTokenToPostItnCharAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preItnTokenToPostItnCharAlignments;
    self->_preItnTokenToPostItnCharAlignments = v6;

    v4 = v8;
    preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
  }
  -[NSMutableArray addObject:](preItnTokenToPostItnCharAlignments, "addObject:", v4);

}

- (unint64_t)preItnTokenToPostItnCharAlignmentsCount
{
  return -[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count");
}

- (id)preItnTokenToPostItnCharAlignmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preItnTokenToPostItnCharAlignments, "objectAtIndex:", a3);
}

+ (Class)preItnTokenToPostItnCharAlignmentType
{
  return (Class)objc_opt_class();
}

- (void)clearChoiceAlignments
{
  -[NSMutableArray removeAllObjects](self->_choiceAlignments, "removeAllObjects");
}

- (void)addChoiceAlignments:(id)a3
{
  id v4;
  NSMutableArray *choiceAlignments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  choiceAlignments = self->_choiceAlignments;
  v8 = v4;
  if (!choiceAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_choiceAlignments;
    self->_choiceAlignments = v6;

    v4 = v8;
    choiceAlignments = self->_choiceAlignments;
  }
  -[NSMutableArray addObject:](choiceAlignments, "addObject:", v4);

}

- (unint64_t)choiceAlignmentsCount
{
  return -[NSMutableArray count](self->_choiceAlignments, "count");
}

- (id)choiceAlignmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_choiceAlignments, "objectAtIndex:", a3);
}

+ (Class)choiceAlignmentsType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionResult;
  -[MXRecognitionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXRecognitionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MXRecognitionSausage *preItn;
  void *v5;
  MXRecognitionSausage *postItn;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  preItn = self->_preItn;
  if (preItn)
  {
    -[MXRecognitionSausage dictionaryRepresentation](preItn, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pre_itn"));

  }
  postItn = self->_postItn;
  if (postItn)
  {
    -[MXRecognitionSausage dictionaryRepresentation](postItn, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("post_itn"));

  }
  if (-[NSMutableArray count](self->_preItnNbestChoices, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_preItnNbestChoices, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v9 = self->_preItnNbestChoices;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("pre_itn_nbest_choices"));
  }
  if (-[NSMutableArray count](self->_postItnNbestChoices, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_postItnNbestChoices, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = self->_postItnNbestChoices;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("post_itn_nbest_choices"));
  }
  if (-[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = self->_preItnTokenToPostItnCharAlignments;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("pre_itn_token_to_post_itn_char_alignment"));
  }
  if (-[NSMutableArray count](self->_choiceAlignments, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_choiceAlignments, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = self->_choiceAlignments;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v37);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("choice_alignments"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionResultReadFrom((char *)self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_preItn)
    PBDataWriterWriteSubmessage();
  if (self->_postItn)
    PBDataWriterWriteSubmessage();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_preItnNbestChoices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_postItnNbestChoices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_preItnTokenToPostItnCharAlignments;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_choiceAlignments;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v20 = a3;
  if (self->_preItn)
    objc_msgSend(v20, "setPreItn:");
  if (self->_postItn)
    objc_msgSend(v20, "setPostItn:");
  if (-[MXRecognitionResult preItnNbestChoicesCount](self, "preItnNbestChoicesCount"))
  {
    objc_msgSend(v20, "clearPreItnNbestChoices");
    v4 = -[MXRecognitionResult preItnNbestChoicesCount](self, "preItnNbestChoicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MXRecognitionResult preItnNbestChoicesAtIndex:](self, "preItnNbestChoicesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPreItnNbestChoices:", v7);

      }
    }
  }
  if (-[MXRecognitionResult postItnNbestChoicesCount](self, "postItnNbestChoicesCount"))
  {
    objc_msgSend(v20, "clearPostItnNbestChoices");
    v8 = -[MXRecognitionResult postItnNbestChoicesCount](self, "postItnNbestChoicesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[MXRecognitionResult postItnNbestChoicesAtIndex:](self, "postItnNbestChoicesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPostItnNbestChoices:", v11);

      }
    }
  }
  if (-[MXRecognitionResult preItnTokenToPostItnCharAlignmentsCount](self, "preItnTokenToPostItnCharAlignmentsCount"))
  {
    objc_msgSend(v20, "clearPreItnTokenToPostItnCharAlignments");
    v12 = -[MXRecognitionResult preItnTokenToPostItnCharAlignmentsCount](self, "preItnTokenToPostItnCharAlignmentsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[MXRecognitionResult preItnTokenToPostItnCharAlignmentAtIndex:](self, "preItnTokenToPostItnCharAlignmentAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPreItnTokenToPostItnCharAlignment:", v15);

      }
    }
  }
  if (-[MXRecognitionResult choiceAlignmentsCount](self, "choiceAlignmentsCount"))
  {
    objc_msgSend(v20, "clearChoiceAlignments");
    v16 = -[MXRecognitionResult choiceAlignmentsCount](self, "choiceAlignmentsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[MXRecognitionResult choiceAlignmentsAtIndex:](self, "choiceAlignmentsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addChoiceAlignments:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MXRecognitionSausage copyWithZone:](self->_preItn, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[MXRecognitionSausage copyWithZone:](self->_postItn, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_preItnNbestChoices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreItnNbestChoices:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_postItnNbestChoices;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addPostItnNbestChoices:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_preItnTokenToPostItnCharAlignments;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreItnTokenToPostItnCharAlignment:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_choiceAlignments;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend(v5, "addChoiceAlignments:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MXRecognitionSausage *preItn;
  MXRecognitionSausage *postItn;
  NSMutableArray *preItnNbestChoices;
  NSMutableArray *postItnNbestChoices;
  NSMutableArray *preItnTokenToPostItnCharAlignments;
  NSMutableArray *choiceAlignments;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((preItn = self->_preItn, !((unint64_t)preItn | v4[4]))
     || -[MXRecognitionSausage isEqual:](preItn, "isEqual:"))
    && ((postItn = self->_postItn, !((unint64_t)postItn | v4[2]))
     || -[MXRecognitionSausage isEqual:](postItn, "isEqual:"))
    && ((preItnNbestChoices = self->_preItnNbestChoices, !((unint64_t)preItnNbestChoices | v4[5]))
     || -[NSMutableArray isEqual:](preItnNbestChoices, "isEqual:"))
    && ((postItnNbestChoices = self->_postItnNbestChoices, !((unint64_t)postItnNbestChoices | v4[3]))
     || -[NSMutableArray isEqual:](postItnNbestChoices, "isEqual:"))
    && ((preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments,
         !((unint64_t)preItnTokenToPostItnCharAlignments | v4[6]))
     || -[NSMutableArray isEqual:](preItnTokenToPostItnCharAlignments, "isEqual:")))
  {
    choiceAlignments = self->_choiceAlignments;
    if ((unint64_t)choiceAlignments | v4[1])
      v11 = -[NSMutableArray isEqual:](choiceAlignments, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[MXRecognitionSausage hash](self->_preItn, "hash");
  v4 = -[MXRecognitionSausage hash](self->_postItn, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_preItnNbestChoices, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_postItnNbestChoices, "hash");
  v7 = -[NSMutableArray hash](self->_preItnTokenToPostItnCharAlignments, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_choiceAlignments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MXRecognitionSausage *preItn;
  uint64_t v6;
  MXRecognitionSausage *postItn;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  __int128 v29;
  __int128 v30;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  preItn = self->_preItn;
  v6 = *((_QWORD *)v4 + 4);
  if (preItn)
  {
    if (v6)
      -[MXRecognitionSausage mergeFrom:](preItn, "mergeFrom:");
  }
  else if (v6)
  {
    -[MXRecognitionResult setPreItn:](self, "setPreItn:");
  }
  postItn = self->_postItn;
  v8 = *((_QWORD *)v4 + 2);
  if (postItn)
  {
    if (v8)
      -[MXRecognitionSausage mergeFrom:](postItn, "mergeFrom:");
  }
  else if (v8)
  {
    -[MXRecognitionResult setPostItn:](self, "setPostItn:");
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = *((id *)v4 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        -[MXRecognitionResult addPreItnNbestChoices:](self, "addPreItnNbestChoices:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v11);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = *((id *)v4 + 3);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        -[MXRecognitionResult addPostItnNbestChoices:](self, "addPostItnNbestChoices:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v16);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = *((id *)v4 + 6);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        -[MXRecognitionResult addPreItnTokenToPostItnCharAlignment:](self, "addPreItnTokenToPostItnCharAlignment:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v21);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = *((id *)v4 + 1);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[MXRecognitionResult addChoiceAlignments:](self, "addChoiceAlignments:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v26);
  }

}

- (MXRecognitionSausage)preItn
{
  return self->_preItn;
}

- (void)setPreItn:(id)a3
{
  objc_storeStrong((id *)&self->_preItn, a3);
}

- (MXRecognitionSausage)postItn
{
  return self->_postItn;
}

- (void)setPostItn:(id)a3
{
  objc_storeStrong((id *)&self->_postItn, a3);
}

- (NSMutableArray)preItnNbestChoices
{
  return self->_preItnNbestChoices;
}

- (void)setPreItnNbestChoices:(id)a3
{
  objc_storeStrong((id *)&self->_preItnNbestChoices, a3);
}

- (NSMutableArray)postItnNbestChoices
{
  return self->_postItnNbestChoices;
}

- (void)setPostItnNbestChoices:(id)a3
{
  objc_storeStrong((id *)&self->_postItnNbestChoices, a3);
}

- (NSMutableArray)preItnTokenToPostItnCharAlignments
{
  return self->_preItnTokenToPostItnCharAlignments;
}

- (void)setPreItnTokenToPostItnCharAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_preItnTokenToPostItnCharAlignments, a3);
}

- (NSMutableArray)choiceAlignments
{
  return self->_choiceAlignments;
}

- (void)setChoiceAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_choiceAlignments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preItnTokenToPostItnCharAlignments, 0);
  objc_storeStrong((id *)&self->_preItnNbestChoices, 0);
  objc_storeStrong((id *)&self->_preItn, 0);
  objc_storeStrong((id *)&self->_postItnNbestChoices, 0);
  objc_storeStrong((id *)&self->_postItn, 0);
  objc_storeStrong((id *)&self->_choiceAlignments, 0);
}

@end
