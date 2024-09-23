@implementation _BlastDoorASCodableActivityDataPreview

- (BOOL)hasActivitySnapshot
{
  return self->_activitySnapshot != 0;
}

- (void)clearWorkouts
{
  -[NSMutableArray removeAllObjects](self->_workouts, "removeAllObjects");
}

- (void)addWorkouts:(id)a3
{
  id v4;
  NSMutableArray *workouts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  workouts = self->_workouts;
  v8 = v4;
  if (!workouts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_workouts;
    self->_workouts = v6;

    v4 = v8;
    workouts = self->_workouts;
  }
  -[NSMutableArray addObject:](workouts, "addObject:", v4);

}

- (unint64_t)workoutsCount
{
  return -[NSMutableArray count](self->_workouts, "count");
}

- (id)workoutsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_workouts, "objectAtIndex:", a3);
}

+ (Class)workoutsType
{
  return (Class)objc_opt_class();
}

- (void)clearAchievements
{
  -[NSMutableArray removeAllObjects](self->_achievements, "removeAllObjects");
}

- (void)addAchievements:(id)a3
{
  id v4;
  NSMutableArray *achievements;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  achievements = self->_achievements;
  v8 = v4;
  if (!achievements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_achievements;
    self->_achievements = v6;

    v4 = v8;
    achievements = self->_achievements;
  }
  -[NSMutableArray addObject:](achievements, "addObject:", v4);

}

- (unint64_t)achievementsCount
{
  return -[NSMutableArray count](self->_achievements, "count");
}

- (id)achievementsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_achievements, "objectAtIndex:", a3);
}

+ (Class)achievementsType
{
  return (Class)objc_opt_class();
}

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorASCodableActivityDataPreview;
  -[_BlastDoorASCodableActivityDataPreview description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorASCodableActivityDataPreview dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _BlastDoorASCodableActivitySnapshot *activitySnapshot;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activitySnapshot = self->_activitySnapshot;
  if (activitySnapshot)
  {
    -[_BlastDoorASCodableActivitySnapshot dictionaryRepresentation](activitySnapshot, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activitySnapshot"));

  }
  if (-[NSMutableArray count](self->_workouts, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_workouts, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_workouts;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("workouts"));
  }
  if (-[NSMutableArray count](self->_achievements, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_achievements, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = self->_achievements;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("achievements"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("date"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _BlastDoorASCodableActivityDataPreviewReadFrom((uint64_t)self, (uint64_t)a3);
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
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_activitySnapshot)
    PBDataWriterWriteSubmessage();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_workouts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_achievements;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

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
  id v12;

  v12 = a3;
  if (self->_activitySnapshot)
    objc_msgSend(v12, "setActivitySnapshot:");
  if (-[_BlastDoorASCodableActivityDataPreview workoutsCount](self, "workoutsCount"))
  {
    objc_msgSend(v12, "clearWorkouts");
    v4 = -[_BlastDoorASCodableActivityDataPreview workoutsCount](self, "workoutsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_BlastDoorASCodableActivityDataPreview workoutsAtIndex:](self, "workoutsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addWorkouts:", v7);

      }
    }
  }
  if (-[_BlastDoorASCodableActivityDataPreview achievementsCount](self, "achievementsCount"))
  {
    objc_msgSend(v12, "clearAchievements");
    v8 = -[_BlastDoorASCodableActivityDataPreview achievementsCount](self, "achievementsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[_BlastDoorASCodableActivityDataPreview achievementsAtIndex:](self, "achievementsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAchievements:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v12 + 1) = *(_QWORD *)&self->_date;
    *((_BYTE *)v12 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_BlastDoorASCodableActivitySnapshot copyWithZone:](self->_activitySnapshot, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_workouts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWorkouts:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_achievements;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAchievements:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BlastDoorASCodableActivitySnapshot *activitySnapshot;
  NSMutableArray *workouts;
  NSMutableArray *achievements;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  activitySnapshot = self->_activitySnapshot;
  if ((unint64_t)activitySnapshot | *((_QWORD *)v4 + 3))
  {
    if (!-[_BlastDoorASCodableActivitySnapshot isEqual:](activitySnapshot, "isEqual:"))
      goto LABEL_12;
  }
  workouts = self->_workouts;
  if ((unint64_t)workouts | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](workouts, "isEqual:"))
      goto LABEL_12;
  }
  achievements = self->_achievements;
  if ((unint64_t)achievements | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](achievements, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_date == *((double *)v4 + 1))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double date;
  double v8;
  long double v9;
  double v10;

  v3 = -[_BlastDoorASCodableActivitySnapshot hash](self->_activitySnapshot, "hash");
  v4 = -[NSMutableArray hash](self->_workouts, "hash");
  v5 = -[NSMutableArray hash](self->_achievements, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    date = self->_date;
    v8 = -date;
    if (date >= 0.0)
      v8 = self->_date;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _BlastDoorASCodableActivitySnapshot *activitySnapshot;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  activitySnapshot = self->_activitySnapshot;
  v6 = *((_QWORD *)v4 + 3);
  if (activitySnapshot)
  {
    if (v6)
      -[_BlastDoorASCodableActivitySnapshot mergeFrom:](activitySnapshot, "mergeFrom:");
  }
  else if (v6)
  {
    -[_BlastDoorASCodableActivityDataPreview setActivitySnapshot:](self, "setActivitySnapshot:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[_BlastDoorASCodableActivityDataPreview addWorkouts:](self, "addWorkouts:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[_BlastDoorASCodableActivityDataPreview addAchievements:](self, "addAchievements:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (_BlastDoorASCodableActivitySnapshot)activitySnapshot
{
  return self->_activitySnapshot;
}

- (void)setActivitySnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_activitySnapshot, a3);
}

- (NSMutableArray)workouts
{
  return self->_workouts;
}

- (void)setWorkouts:(id)a3
{
  objc_storeStrong((id *)&self->_workouts, a3);
}

- (NSMutableArray)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_achievements, a3);
}

- (double)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_activitySnapshot, 0);
  objc_storeStrong((id *)&self->_achievements, 0);
}

@end
