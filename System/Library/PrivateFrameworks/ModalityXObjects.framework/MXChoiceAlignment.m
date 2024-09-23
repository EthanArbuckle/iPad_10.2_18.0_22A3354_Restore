@implementation MXChoiceAlignment

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)MXChoiceAlignment;
  -[MXChoiceAlignment dealloc](&v3, sel_dealloc);
}

- (unint64_t)postItnChoiceIndicesCount
{
  return self->_postItnChoiceIndices.count;
}

- (int)postItnChoiceIndices
{
  return self->_postItnChoiceIndices.list;
}

- (void)clearPostItnChoiceIndices
{
  PBRepeatedInt32Clear();
}

- (void)addPostItnChoiceIndices:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)postItnChoiceIndicesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_postItnChoiceIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_postItnChoiceIndices = &self->_postItnChoiceIndices;
  count = self->_postItnChoiceIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_postItnChoiceIndices->list[a3];
}

- (void)setPostItnChoiceIndices:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)clearPreItnTokenToPostItnCharAlignments
{
  -[NSMutableArray removeAllObjects](self->_preItnTokenToPostItnCharAlignments, "removeAllObjects");
}

- (void)addPreItnTokenToPostItnCharAlignments:(id)a3
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

- (id)preItnTokenToPostItnCharAlignmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preItnTokenToPostItnCharAlignments, "objectAtIndex:", a3);
}

+ (Class)preItnTokenToPostItnCharAlignmentsType
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
  v8.super_class = (Class)MXChoiceAlignment;
  -[MXChoiceAlignment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXChoiceAlignment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("post_itn_choice_indices"));

  if (-[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_preItnTokenToPostItnCharAlignments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pre_itn_token_to_post_itn_char_alignments"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXChoiceAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_postItnChoiceIndices.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_postItnChoiceIndices.count);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_preItnTokenToPostItnCharAlignments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id v11;

  v11 = a3;
  if (-[MXChoiceAlignment postItnChoiceIndicesCount](self, "postItnChoiceIndicesCount"))
  {
    objc_msgSend(v11, "clearPostItnChoiceIndices");
    v4 = -[MXChoiceAlignment postItnChoiceIndicesCount](self, "postItnChoiceIndicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPostItnChoiceIndices:", -[MXChoiceAlignment postItnChoiceIndicesAtIndex:](self, "postItnChoiceIndicesAtIndex:", i));
    }
  }
  if (-[MXChoiceAlignment preItnTokenToPostItnCharAlignmentsCount](self, "preItnTokenToPostItnCharAlignmentsCount"))
  {
    objc_msgSend(v11, "clearPreItnTokenToPostItnCharAlignments");
    v7 = -[MXChoiceAlignment preItnTokenToPostItnCharAlignmentsCount](self, "preItnTokenToPostItnCharAlignmentsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[MXChoiceAlignment preItnTokenToPostItnCharAlignmentsAtIndex:](self, "preItnTokenToPostItnCharAlignmentsAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addPreItnTokenToPostItnCharAlignments:", v10);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_preItnTokenToPostItnCharAlignments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addPreItnTokenToPostItnCharAlignments:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *preItnTokenToPostItnCharAlignments;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && PBRepeatedInt32IsEqual())
  {
    preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
    if ((unint64_t)preItnTokenToPostItnCharAlignments | v4[4])
      v6 = -[NSMutableArray isEqual:](preItnTokenToPostItnCharAlignments, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = PBRepeatedInt32Hash();
  return -[NSMutableArray hash](self->_preItnTokenToPostItnCharAlignments, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v5 = objc_msgSend(v4, "postItnChoiceIndicesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[MXChoiceAlignment addPostItnChoiceIndices:](self, "addPostItnChoiceIndices:", objc_msgSend(v4, "postItnChoiceIndicesAtIndex:", i));
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4[4];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[MXChoiceAlignment addPreItnTokenToPostItnCharAlignments:](self, "addPreItnTokenToPostItnCharAlignments:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSMutableArray)preItnTokenToPostItnCharAlignments
{
  return self->_preItnTokenToPostItnCharAlignments;
}

- (void)setPreItnTokenToPostItnCharAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_preItnTokenToPostItnCharAlignments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preItnTokenToPostItnCharAlignments, 0);
}

@end
