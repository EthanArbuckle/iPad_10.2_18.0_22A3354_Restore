@implementation CPLFaceAnalysis

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompleted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearFaceInstances
{
  -[NSMutableArray removeAllObjects](self->_faceInstances, "removeAllObjects");
}

- (void)addFaceInstances:(id)a3
{
  id v4;
  NSMutableArray *faceInstances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  faceInstances = self->_faceInstances;
  v8 = v4;
  if (!faceInstances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_faceInstances;
    self->_faceInstances = v6;

    v4 = v8;
    faceInstances = self->_faceInstances;
  }
  -[NSMutableArray addObject:](faceInstances, "addObject:", v4);

}

- (unint64_t)faceInstancesCount
{
  return -[NSMutableArray count](self->_faceInstances, "count");
}

- (id)faceInstancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_faceInstances, "objectAtIndex:", a3);
}

- (void)clearPetFaceInstances
{
  -[NSMutableArray removeAllObjects](self->_petFaceInstances, "removeAllObjects");
}

- (void)addPetFaceInstances:(id)a3
{
  id v4;
  NSMutableArray *petFaceInstances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  petFaceInstances = self->_petFaceInstances;
  v8 = v4;
  if (!petFaceInstances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_petFaceInstances;
    self->_petFaceInstances = v6;

    v4 = v8;
    petFaceInstances = self->_petFaceInstances;
  }
  -[NSMutableArray addObject:](petFaceInstances, "addObject:", v4);

}

- (unint64_t)petFaceInstancesCount
{
  return -[NSMutableArray count](self->_petFaceInstances, "count");
}

- (id)petFaceInstancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_petFaceInstances, "objectAtIndex:", a3);
}

- (void)clearTorsoFaceInstances
{
  -[NSMutableArray removeAllObjects](self->_torsoFaceInstances, "removeAllObjects");
}

- (void)addTorsoFaceInstances:(id)a3
{
  id v4;
  NSMutableArray *torsoFaceInstances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  torsoFaceInstances = self->_torsoFaceInstances;
  v8 = v4;
  if (!torsoFaceInstances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_torsoFaceInstances;
    self->_torsoFaceInstances = v6;

    v4 = v8;
    torsoFaceInstances = self->_torsoFaceInstances;
  }
  -[NSMutableArray addObject:](torsoFaceInstances, "addObject:", v4);

}

- (unint64_t)torsoFaceInstancesCount
{
  return -[NSMutableArray count](self->_torsoFaceInstances, "count");
}

- (id)torsoFaceInstancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_torsoFaceInstances, "objectAtIndex:", a3);
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
  v8.super_class = (Class)CPLFaceAnalysis;
  -[CPLFaceAnalysis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLFaceAnalysis dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("completed"));

  }
  if (-[NSMutableArray count](self->_faceInstances, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_faceInstances, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = self->_faceInstances;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("faceInstances"));
  }
  if (-[NSMutableArray count](self->_petFaceInstances, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_petFaceInstances, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = self->_petFaceInstances;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("petFaceInstances"));
  }
  if (-[NSMutableArray count](self->_torsoFaceInstances, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_torsoFaceInstances, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = self->_torsoFaceInstances;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "dictionaryRepresentation", (_QWORD)v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("torsoFaceInstances"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLFaceAnalysisReadFrom(self, (uint64_t)a3);
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_faceInstances;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_petFaceInstances;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_torsoFaceInstances;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
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
  id v17;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_completed;
    v4[36] |= 1u;
  }
  v17 = v4;
  if (-[CPLFaceAnalysis faceInstancesCount](self, "faceInstancesCount"))
  {
    objc_msgSend(v17, "clearFaceInstances");
    v5 = -[CPLFaceAnalysis faceInstancesCount](self, "faceInstancesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[CPLFaceAnalysis faceInstancesAtIndex:](self, "faceInstancesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addFaceInstances:", v8);

      }
    }
  }
  if (-[CPLFaceAnalysis petFaceInstancesCount](self, "petFaceInstancesCount"))
  {
    objc_msgSend(v17, "clearPetFaceInstances");
    v9 = -[CPLFaceAnalysis petFaceInstancesCount](self, "petFaceInstancesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[CPLFaceAnalysis petFaceInstancesAtIndex:](self, "petFaceInstancesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addPetFaceInstances:", v12);

      }
    }
  }
  if (-[CPLFaceAnalysis torsoFaceInstancesCount](self, "torsoFaceInstancesCount"))
  {
    objc_msgSend(v17, "clearTorsoFaceInstances");
    v13 = -[CPLFaceAnalysis torsoFaceInstancesCount](self, "torsoFaceInstancesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[CPLFaceAnalysis torsoFaceInstancesAtIndex:](self, "torsoFaceInstancesAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTorsoFaceInstances:", v16);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_completed;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = self->_faceInstances;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addFaceInstances:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = self->_petFaceInstances;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addPetFaceInstances:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_torsoFaceInstances;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v6, "addTorsoFaceInstances:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *faceInstances;
  NSMutableArray *petFaceInstances;
  NSMutableArray *torsoFaceInstances;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0)
    {
      if (self->_completed)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_16;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
    goto LABEL_16;
LABEL_10:
  faceInstances = self->_faceInstances;
  if ((unint64_t)faceInstances | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](faceInstances, "isEqual:"))
  {
    goto LABEL_16;
  }
  petFaceInstances = self->_petFaceInstances;
  if ((unint64_t)petFaceInstances | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](petFaceInstances, "isEqual:"))
      goto LABEL_16;
  }
  torsoFaceInstances = self->_torsoFaceInstances;
  if ((unint64_t)torsoFaceInstances | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](torsoFaceInstances, "isEqual:");
  else
    v8 = 1;
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_completed;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_faceInstances, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_petFaceInstances, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_torsoFaceInstances, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_completed = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[CPLFaceAnalysis addFaceInstances:](self, "addFaceInstances:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v5[2];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[CPLFaceAnalysis addPetFaceInstances:](self, "addPetFaceInstances:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v5[3];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[CPLFaceAnalysis addTorsoFaceInstances:](self, "addTorsoFaceInstances:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (BOOL)completed
{
  return self->_completed;
}

- (NSMutableArray)faceInstances
{
  return self->_faceInstances;
}

- (void)setFaceInstances:(id)a3
{
  objc_storeStrong((id *)&self->_faceInstances, a3);
}

- (NSMutableArray)petFaceInstances
{
  return self->_petFaceInstances;
}

- (void)setPetFaceInstances:(id)a3
{
  objc_storeStrong((id *)&self->_petFaceInstances, a3);
}

- (NSMutableArray)torsoFaceInstances
{
  return self->_torsoFaceInstances;
}

- (void)setTorsoFaceInstances:(id)a3
{
  objc_storeStrong((id *)&self->_torsoFaceInstances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoFaceInstances, 0);
  objc_storeStrong((id *)&self->_petFaceInstances, 0);
  objc_storeStrong((id *)&self->_faceInstances, 0);
}

+ (Class)faceInstancesType
{
  return (Class)objc_opt_class();
}

+ (Class)petFaceInstancesType
{
  return (Class)objc_opt_class();
}

+ (Class)torsoFaceInstancesType
{
  return (Class)objc_opt_class();
}

@end
