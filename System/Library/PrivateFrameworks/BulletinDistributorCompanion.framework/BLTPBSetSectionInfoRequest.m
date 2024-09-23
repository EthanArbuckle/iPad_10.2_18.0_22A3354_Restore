@implementation BLTPBSetSectionInfoRequest

- (BOOL)hasSectionInfo
{
  return self->_sectionInfo != 0;
}

- (void)clearKeypaths
{
  -[NSMutableArray removeAllObjects](self->_keypaths, "removeAllObjects");
}

- (void)addKeypaths:(id)a3
{
  id v4;
  NSMutableArray *keypaths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keypaths = self->_keypaths;
  v8 = v4;
  if (!keypaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keypaths;
    self->_keypaths = v6;

    v4 = v8;
    keypaths = self->_keypaths;
  }
  -[NSMutableArray addObject:](keypaths, "addObject:", v4);

}

- (unint64_t)keypathsCount
{
  return -[NSMutableArray count](self->_keypaths, "count");
}

- (id)keypathsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keypaths, "objectAtIndex:", a3);
}

+ (Class)keypathsType
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
  v8.super_class = (Class)BLTPBSetSectionInfoRequest;
  -[BLTPBSetSectionInfoRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetSectionInfoRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BLTPBSectionInfo *sectionInfo;
  void *v5;
  NSMutableArray *keypaths;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sectionInfo = self->_sectionInfo;
  if (sectionInfo)
  {
    -[BLTPBSectionInfo dictionaryRepresentation](sectionInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sectionInfo"));

  }
  keypaths = self->_keypaths;
  if (keypaths)
    objc_msgSend(v3, "setObject:forKey:", keypaths, CFSTR("keypaths"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetSectionInfoRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_sectionInfo)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_keypaths;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_sectionInfo)
    objc_msgSend(v8, "setSectionInfo:");
  if (-[BLTPBSetSectionInfoRequest keypathsCount](self, "keypathsCount"))
  {
    objc_msgSend(v8, "clearKeypaths");
    v4 = -[BLTPBSetSectionInfoRequest keypathsCount](self, "keypathsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BLTPBSetSectionInfoRequest keypathsAtIndex:](self, "keypathsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addKeypaths:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BLTPBSectionInfo copyWithZone:](self->_sectionInfo, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_keypaths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addKeypaths:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BLTPBSectionInfo *sectionInfo;
  NSMutableArray *keypaths;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sectionInfo = self->_sectionInfo, !((unint64_t)sectionInfo | v4[2]))
     || -[BLTPBSectionInfo isEqual:](sectionInfo, "isEqual:")))
  {
    keypaths = self->_keypaths;
    if ((unint64_t)keypaths | v4[1])
      v7 = -[NSMutableArray isEqual:](keypaths, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BLTPBSectionInfo hash](self->_sectionInfo, "hash");
  return -[NSMutableArray hash](self->_keypaths, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BLTPBSectionInfo *sectionInfo;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sectionInfo = self->_sectionInfo;
  v6 = *((_QWORD *)v4 + 2);
  if (sectionInfo)
  {
    if (v6)
      -[BLTPBSectionInfo mergeFrom:](sectionInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[BLTPBSetSectionInfoRequest setSectionInfo:](self, "setSectionInfo:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[BLTPBSetSectionInfoRequest addKeypaths:](self, "addKeypaths:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BLTPBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfo, a3);
}

- (NSMutableArray)keypaths
{
  return self->_keypaths;
}

- (void)setKeypaths:(id)a3
{
  objc_storeStrong((id *)&self->_keypaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_keypaths, 0);
}

@end
