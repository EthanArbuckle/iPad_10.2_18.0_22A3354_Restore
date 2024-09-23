@implementation KCellularMmCommonInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasImsi
{
  return self->_imsi != 0;
}

- (void)clearEplmnLists
{
  -[NSMutableArray removeAllObjects](self->_eplmnLists, "removeAllObjects");
}

- (void)addEplmnList:(id)a3
{
  id v4;
  NSMutableArray *eplmnLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eplmnLists = self->_eplmnLists;
  v8 = v4;
  if (!eplmnLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_eplmnLists;
    self->_eplmnLists = v6;

    v4 = v8;
    eplmnLists = self->_eplmnLists;
  }
  -[NSMutableArray addObject:](eplmnLists, "addObject:", v4);

}

- (unint64_t)eplmnListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_eplmnLists, "count");
}

- (id)eplmnListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_eplmnLists, "objectAtIndex:", a3);
}

+ (Class)eplmnListType
{
  return (Class)objc_opt_class(Plmn, a2);
}

- (void)clearRoamingFlaiLists
{
  -[NSMutableArray removeAllObjects](self->_roamingFlaiLists, "removeAllObjects");
}

- (void)addRoamingFlaiList:(id)a3
{
  id v4;
  NSMutableArray *roamingFlaiLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  roamingFlaiLists = self->_roamingFlaiLists;
  v8 = v4;
  if (!roamingFlaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roamingFlaiLists;
    self->_roamingFlaiLists = v6;

    v4 = v8;
    roamingFlaiLists = self->_roamingFlaiLists;
  }
  -[NSMutableArray addObject:](roamingFlaiLists, "addObject:", v4);

}

- (unint64_t)roamingFlaiListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_roamingFlaiLists, "count");
}

- (id)roamingFlaiListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_roamingFlaiLists, "objectAtIndex:", a3);
}

+ (Class)roamingFlaiListType
{
  return (Class)objc_opt_class(KCellularLocationAreaId, a2);
}

- (void)clearRegProvFlaiLists
{
  -[NSMutableArray removeAllObjects](self->_regProvFlaiLists, "removeAllObjects");
}

- (void)addRegProvFlaiList:(id)a3
{
  id v4;
  NSMutableArray *regProvFlaiLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  regProvFlaiLists = self->_regProvFlaiLists;
  v8 = v4;
  if (!regProvFlaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_regProvFlaiLists;
    self->_regProvFlaiLists = v6;

    v4 = v8;
    regProvFlaiLists = self->_regProvFlaiLists;
  }
  -[NSMutableArray addObject:](regProvFlaiLists, "addObject:", v4);

}

- (unint64_t)regProvFlaiListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_regProvFlaiLists, "count");
}

- (id)regProvFlaiListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_regProvFlaiLists, "objectAtIndex:", a3);
}

+ (Class)regProvFlaiListType
{
  return (Class)objc_opt_class(KCellularLocationAreaId, a2);
}

- (void)clearRoamingFtaiLists
{
  -[NSMutableArray removeAllObjects](self->_roamingFtaiLists, "removeAllObjects");
}

- (void)addRoamingFtaiList:(id)a3
{
  id v4;
  NSMutableArray *roamingFtaiLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  roamingFtaiLists = self->_roamingFtaiLists;
  v8 = v4;
  if (!roamingFtaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roamingFtaiLists;
    self->_roamingFtaiLists = v6;

    v4 = v8;
    roamingFtaiLists = self->_roamingFtaiLists;
  }
  -[NSMutableArray addObject:](roamingFtaiLists, "addObject:", v4);

}

- (unint64_t)roamingFtaiListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_roamingFtaiLists, "count");
}

- (id)roamingFtaiListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_roamingFtaiLists, "objectAtIndex:", a3);
}

+ (Class)roamingFtaiListType
{
  return (Class)objc_opt_class(KCellularTrackingAreaId, a2);
}

- (void)clearRegProvFtaiLists
{
  -[NSMutableArray removeAllObjects](self->_regProvFtaiLists, "removeAllObjects");
}

- (void)addRegProvFtaiList:(id)a3
{
  id v4;
  NSMutableArray *regProvFtaiLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  regProvFtaiLists = self->_regProvFtaiLists;
  v8 = v4;
  if (!regProvFtaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_regProvFtaiLists;
    self->_regProvFtaiLists = v6;

    v4 = v8;
    regProvFtaiLists = self->_regProvFtaiLists;
  }
  -[NSMutableArray addObject:](regProvFtaiLists, "addObject:", v4);

}

- (unint64_t)regProvFtaiListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_regProvFtaiLists, "count");
}

- (id)regProvFtaiListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_regProvFtaiLists, "objectAtIndex:", a3);
}

+ (Class)regProvFtaiListType
{
  return (Class)objc_opt_class(KCellularTrackingAreaId, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularMmCommonInfo;
  v3 = -[KCellularMmCommonInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *imsi;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *m;
  void *v33;
  id v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *n;
  void *v40;
  void *v41;
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
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  imsi = self->_imsi;
  if (imsi)
    objc_msgSend(v3, "setObject:forKey:", imsi, CFSTR("imsi"));
  if (-[NSMutableArray count](self->_eplmnLists, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_eplmnLists, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v7 = self->_eplmnLists;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("eplmn_list"));
  }
  if (-[NSMutableArray count](self->_roamingFlaiLists, "count"))
  {
    v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_roamingFlaiLists, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v14 = self->_roamingFlaiLists;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("roaming_flai_list"));
  }
  if (-[NSMutableArray count](self->_regProvFlaiLists, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_regProvFlaiLists, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v21 = self->_regProvFlaiLists;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("reg_prov_flai_list"));
  }
  if (-[NSMutableArray count](self->_roamingFtaiLists, "count"))
  {
    v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_roamingFtaiLists, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v28 = self->_roamingFtaiLists;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v48;
      do
      {
        for (m = 0; m != v30; m = (char *)m + 1)
        {
          if (*(_QWORD *)v48 != v31)
            objc_enumerationMutation(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("roaming_ftai_list"));
  }
  if (-[NSMutableArray count](self->_regProvFtaiLists, "count"))
  {
    v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_regProvFtaiLists, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = self->_regProvFtaiLists;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v44;
      do
      {
        for (n = 0; n != v37; n = (char *)n + 1)
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation", (_QWORD)v43));
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("reg_prov_ftai_list"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007936C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSData *imsi;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  imsi = self->_imsi;
  if (imsi)
    PBDataWriterWriteDataField(v5, imsi, 2);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_eplmnLists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v11), 3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_roamingFlaiLists;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v16), 4);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_regProvFlaiLists;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v21), 5);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_roamingFtaiLists;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v26), 6);
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self->_regProvFtaiLists;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v31), 7);
        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  id v25;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  v25 = v4;
  if (self->_imsi)
    objc_msgSend(v4, "setImsi:");
  if (-[KCellularMmCommonInfo eplmnListsCount](self, "eplmnListsCount"))
  {
    objc_msgSend(v25, "clearEplmnLists");
    v5 = -[KCellularMmCommonInfo eplmnListsCount](self, "eplmnListsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo eplmnListAtIndex:](self, "eplmnListAtIndex:", i));
        objc_msgSend(v25, "addEplmnList:", v8);

      }
    }
  }
  if (-[KCellularMmCommonInfo roamingFlaiListsCount](self, "roamingFlaiListsCount"))
  {
    objc_msgSend(v25, "clearRoamingFlaiLists");
    v9 = -[KCellularMmCommonInfo roamingFlaiListsCount](self, "roamingFlaiListsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo roamingFlaiListAtIndex:](self, "roamingFlaiListAtIndex:", j));
        objc_msgSend(v25, "addRoamingFlaiList:", v12);

      }
    }
  }
  if (-[KCellularMmCommonInfo regProvFlaiListsCount](self, "regProvFlaiListsCount"))
  {
    objc_msgSend(v25, "clearRegProvFlaiLists");
    v13 = -[KCellularMmCommonInfo regProvFlaiListsCount](self, "regProvFlaiListsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo regProvFlaiListAtIndex:](self, "regProvFlaiListAtIndex:", k));
        objc_msgSend(v25, "addRegProvFlaiList:", v16);

      }
    }
  }
  if (-[KCellularMmCommonInfo roamingFtaiListsCount](self, "roamingFtaiListsCount"))
  {
    objc_msgSend(v25, "clearRoamingFtaiLists");
    v17 = -[KCellularMmCommonInfo roamingFtaiListsCount](self, "roamingFtaiListsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo roamingFtaiListAtIndex:](self, "roamingFtaiListAtIndex:", m));
        objc_msgSend(v25, "addRoamingFtaiList:", v20);

      }
    }
  }
  if (-[KCellularMmCommonInfo regProvFtaiListsCount](self, "regProvFtaiListsCount"))
  {
    objc_msgSend(v25, "clearRegProvFtaiLists");
    v21 = -[KCellularMmCommonInfo regProvFtaiListsCount](self, "regProvFtaiListsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmCommonInfo regProvFtaiListAtIndex:](self, "regProvFtaiListAtIndex:", n));
        objc_msgSend(v25, "addRegProvFtaiList:", v24);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v25 + 16) = self->_subsId;
    *((_BYTE *)v25 + 68) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
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
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 68) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_imsi, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v9 = self->_eplmnLists;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v57;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v13), "copyWithZone:", a3);
        objc_msgSend(v6, "addEplmnList:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v11);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = self->_roamingFlaiLists;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v19), "copyWithZone:", a3);
        objc_msgSend(v6, "addRoamingFlaiList:", v20);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v17);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = self->_regProvFlaiLists;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v25), "copyWithZone:", a3);
        objc_msgSend(v6, "addRegProvFlaiList:", v26);

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v23);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = self->_roamingFtaiLists;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v45;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v31), "copyWithZone:", a3);
        objc_msgSend(v6, "addRoamingFtaiList:", v32);

        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v29);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = self->_regProvFtaiLists;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v41;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v33);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v37), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend(v6, "addRegProvFtaiList:", v38);

        v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v35);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_subsId;
    *((_BYTE *)v6 + 68) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *imsi;
  NSMutableArray *eplmnLists;
  NSMutableArray *roamingFlaiLists;
  NSMutableArray *regProvFlaiLists;
  NSMutableArray *roamingFtaiLists;
  NSMutableArray *regProvFtaiLists;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  imsi = self->_imsi;
  if ((unint64_t)imsi | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](imsi, "isEqual:"))
    goto LABEL_23;
  eplmnLists = self->_eplmnLists;
  if ((unint64_t)eplmnLists | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](eplmnLists, "isEqual:"))
      goto LABEL_23;
  }
  roamingFlaiLists = self->_roamingFlaiLists;
  if ((unint64_t)roamingFlaiLists | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](roamingFlaiLists, "isEqual:"))
      goto LABEL_23;
  }
  regProvFlaiLists = self->_regProvFlaiLists;
  if ((unint64_t)regProvFlaiLists | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](regProvFlaiLists, "isEqual:"))
      goto LABEL_23;
  }
  roamingFtaiLists = self->_roamingFtaiLists;
  if ((unint64_t)roamingFtaiLists | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](roamingFtaiLists, "isEqual:"))
      goto LABEL_23;
  }
  regProvFtaiLists = self->_regProvFtaiLists;
  if ((unint64_t)regProvFtaiLists | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](regProvFtaiLists, "isEqual:"))
      goto LABEL_23;
  }
  v12 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 16))
      goto LABEL_23;
    v12 = 1;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_imsi, "hash");
  v5 = (unint64_t)-[NSMutableArray hash](self->_eplmnLists, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_roamingFlaiLists, "hash");
  v7 = (unint64_t)-[NSMutableArray hash](self->_regProvFlaiLists, "hash");
  v8 = (unint64_t)-[NSMutableArray hash](self->_roamingFtaiLists, "hash");
  v9 = (unint64_t)-[NSMutableArray hash](self->_regProvFtaiLists, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_subsId;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *m;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *n;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
    -[KCellularMmCommonInfo setImsi:](self, "setImsi:");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = *((id *)v5 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        -[KCellularMmCommonInfo addEplmnList:](self, "addEplmnList:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v8);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = *((id *)v5 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        -[KCellularMmCommonInfo addRoamingFlaiList:](self, "addRoamingFlaiList:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v13);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = *((id *)v5 + 4);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        -[KCellularMmCommonInfo addRegProvFlaiList:](self, "addRegProvFlaiList:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v18);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = *((id *)v5 + 7);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v23; m = (char *)m + 1)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        -[KCellularMmCommonInfo addRoamingFtaiList:](self, "addRoamingFtaiList:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v23);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = *((id *)v5 + 5);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; n = (char *)n + 1)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        -[KCellularMmCommonInfo addRegProvFtaiList:](self, "addRegProvFtaiList:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)n), (_QWORD)v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }

  if ((*((_BYTE *)v5 + 68) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
  objc_storeStrong((id *)&self->_imsi, a3);
}

- (NSMutableArray)eplmnLists
{
  return self->_eplmnLists;
}

- (void)setEplmnLists:(id)a3
{
  objc_storeStrong((id *)&self->_eplmnLists, a3);
}

- (NSMutableArray)roamingFlaiLists
{
  return self->_roamingFlaiLists;
}

- (void)setRoamingFlaiLists:(id)a3
{
  objc_storeStrong((id *)&self->_roamingFlaiLists, a3);
}

- (NSMutableArray)regProvFlaiLists
{
  return self->_regProvFlaiLists;
}

- (void)setRegProvFlaiLists:(id)a3
{
  objc_storeStrong((id *)&self->_regProvFlaiLists, a3);
}

- (NSMutableArray)roamingFtaiLists
{
  return self->_roamingFtaiLists;
}

- (void)setRoamingFtaiLists:(id)a3
{
  objc_storeStrong((id *)&self->_roamingFtaiLists, a3);
}

- (NSMutableArray)regProvFtaiLists
{
  return self->_regProvFtaiLists;
}

- (void)setRegProvFtaiLists:(id)a3
{
  objc_storeStrong((id *)&self->_regProvFtaiLists, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roamingFtaiLists, 0);
  objc_storeStrong((id *)&self->_roamingFlaiLists, 0);
  objc_storeStrong((id *)&self->_regProvFtaiLists, 0);
  objc_storeStrong((id *)&self->_regProvFlaiLists, 0);
  objc_storeStrong((id *)&self->_imsi, 0);
  objc_storeStrong((id *)&self->_eplmnLists, 0);
}

@end
