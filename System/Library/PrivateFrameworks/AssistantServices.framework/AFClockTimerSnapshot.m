@implementation AFClockTimerSnapshot

- (AFClockTimerSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFClockTimerSnapshotMutation *);
  AFClockTimerSnapshot *v5;
  AFClockTimerSnapshot *v6;
  _AFClockTimerSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *date;
  void *v11;
  uint64_t v12;
  NSDictionary *timersByID;
  void *v14;
  uint64_t v15;
  NSOrderedSet *notifiedFiringTimerIDs;
  objc_super v18;

  v4 = (void (**)(id, _AFClockTimerSnapshotMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFClockTimerSnapshot;
  v5 = -[AFClockTimerSnapshot init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFClockTimerSnapshotMutation initWithBase:]([_AFClockTimerSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFClockTimerSnapshotMutation isDirty](v7, "isDirty"))
    {
      v6->_generation = -[_AFClockTimerSnapshotMutation getGeneration](v7, "getGeneration");
      -[_AFClockTimerSnapshotMutation getDate](v7, "getDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      -[_AFClockTimerSnapshotMutation getTimersByID](v7, "getTimersByID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v12;

      -[_AFClockTimerSnapshotMutation getNotifiedFiringTimerIDs](v7, "getNotifiedFiringTimerIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      notifiedFiringTimerIDs = v6->_notifiedFiringTimerIDs;
      v6->_notifiedFiringTimerIDs = (NSOrderedSet *)v15;

    }
  }

  return v6;
}

- (AFClockTimerSnapshot)init
{
  return -[AFClockTimerSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFClockTimerSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 timersByID:(id)a5 notifiedFiringTimerIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  AFClockTimerSnapshot *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__AFClockTimerSnapshot_initWithGeneration_date_timersByID_notifiedFiringTimerIDs___block_invoke;
  v18[3] = &unk_1E3A32670;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a3;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = -[AFClockTimerSnapshot initWithBuilder:](self, "initWithBuilder:", v18);

  return v16;
}

- (NSString)description
{
  return (NSString *)-[AFClockTimerSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFClockTimerSnapshot;
  -[AFClockTimerSnapshot description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {generation = %llu, date = %@, timersByID = %@, notifiedFiringTimerIDs = %@}"), v5, self->_generation, self->_date, self->_timersByID, self->_notifiedFiringTimerIDs);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_generation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDate hash](self->_date, "hash");
  v6 = v5 ^ -[NSDictionary hash](self->_timersByID, "hash");
  v7 = v6 ^ -[NSOrderedSet hash](self->_notifiedFiringTimerIDs, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AFClockTimerSnapshot *v4;
  AFClockTimerSnapshot *v5;
  unint64_t generation;
  NSDate *v7;
  NSDate *date;
  NSDictionary *v9;
  NSDictionary *timersByID;
  NSOrderedSet *v11;
  NSOrderedSet *notifiedFiringTimerIDs;
  BOOL v13;

  v4 = (AFClockTimerSnapshot *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      generation = self->_generation;
      if (generation == -[AFClockTimerSnapshot generation](v5, "generation"))
      {
        -[AFClockTimerSnapshot date](v5, "date");
        v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
        date = self->_date;
        if (date == v7 || -[NSDate isEqual:](date, "isEqual:", v7))
        {
          -[AFClockTimerSnapshot timersByID](v5, "timersByID");
          v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          timersByID = self->_timersByID;
          if (timersByID == v9 || -[NSDictionary isEqual:](timersByID, "isEqual:", v9))
          {
            -[AFClockTimerSnapshot notifiedFiringTimerIDs](v5, "notifiedFiringTimerIDs");
            v11 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
            notifiedFiringTimerIDs = self->_notifiedFiringTimerIDs;
            v13 = notifiedFiringTimerIDs == v11
               || -[NSOrderedSet isEqual:](notifiedFiringTimerIDs, "isEqual:", v11);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AFClockTimerSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AFClockTimerSnapshot *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimerSnapshot::generation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClockTimerSnapshot::date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("AFClockTimerSnapshot::timersByID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("AFClockTimerSnapshot::notifiedFiringTimerIDs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AFClockTimerSnapshot initWithGeneration:date:timersByID:notifiedFiringTimerIDs:](self, "initWithGeneration:date:timersByID:notifiedFiringTimerIDs:", v6, v7, v12, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t generation;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  generation = self->_generation;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", generation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFClockTimerSnapshot::generation"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_date, CFSTR("AFClockTimerSnapshot::date"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_timersByID, CFSTR("AFClockTimerSnapshot::timersByID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_notifiedFiringTimerIDs, CFSTR("AFClockTimerSnapshot::notifiedFiringTimerIDs"));

}

- (AFClockTimerSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFClockTimerSnapshot *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  AFClockTimer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  id v30;
  void *v31;
  void *v33;
  id v34;
  uint64_t v35;
  AFClockTimerSnapshot *v36;
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
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("generation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v35 = objc_msgSend(v7, "unsignedLongLongValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v9;
    else
      v34 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("timersByID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v33 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = -[AFClockTimer initWithDictionaryRepresentation:]([AFClockTimer alloc], "initWithDictionaryRepresentation:", v18);
                if (v19)
                  objc_msgSend(v11, "setObject:forKey:", v19, v17);
              }
              else
              {
                v19 = 0;
              }

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v14);
      }

      v20 = (void *)objc_msgSend(v11, "copy");
      v10 = v33;
      self = v36;
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("notifiedFiringTimerIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v5;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = v21;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v24);
            v29 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = v29;

              if (v30)
                objc_msgSend(v23, "addObject:", v30);
            }
            else
            {

              v30 = 0;
            }

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v26);
      }

      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v23);
      v5 = v22;
      self = v36;
    }
    else
    {
      v31 = 0;
    }

    self = -[AFClockTimerSnapshot initWithGeneration:date:timersByID:notifiedFiringTimerIDs:](self, "initWithGeneration:date:timersByID:notifiedFiringTimerIDs:", v35, v34, v20, v31);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *date;
  void *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSOrderedSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
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
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_generation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("generation"));

  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKey:", date, CFSTR("date"));
  if (self->_timersByID)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_timersByID, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = self->_timersByID;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_timersByID, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "buildDictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v12);

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

    v15 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timersByID"));

  }
  if (self->_notifiedFiringTimerIDs)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSOrderedSet count](self->_notifiedFiringTimerIDs, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = self->_notifiedFiringTimerIDs;
    v18 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
        }
        v19 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    v22 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("notifiedFiringTimerIDs"));

  }
  v23 = (void *)objc_msgSend(v3, "copy", (_QWORD)v25);

  return v23;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)timersByID
{
  return self->_timersByID;
}

- (NSOrderedSet)notifiedFiringTimerIDs
{
  return self->_notifiedFiringTimerIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringTimerIDs, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __82__AFClockTimerSnapshot_initWithGeneration_date_timersByID_notifiedFiringTimerIDs___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[7];
  v4 = a2;
  objc_msgSend(v4, "setGeneration:", v3);
  objc_msgSend(v4, "setDate:", a1[4]);
  objc_msgSend(v4, "setTimersByID:", a1[5]);
  objc_msgSend(v4, "setNotifiedFiringTimerIDs:", a1[6]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFClockTimerSnapshotMutation *);
  _AFClockTimerSnapshotMutation *v5;
  AFClockTimerSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSDate *date;
  void *v10;
  uint64_t v11;
  NSDictionary *timersByID;
  void *v13;
  uint64_t v14;
  NSOrderedSet *notifiedFiringTimerIDs;

  v4 = (void (**)(id, _AFClockTimerSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFClockTimerSnapshotMutation initWithBase:]([_AFClockTimerSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFClockTimerSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFClockTimerSnapshot);
      v6->_generation = -[_AFClockTimerSnapshotMutation getGeneration](v5, "getGeneration");
      -[_AFClockTimerSnapshotMutation getDate](v5, "getDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      -[_AFClockTimerSnapshotMutation getTimersByID](v5, "getTimersByID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v11;

      -[_AFClockTimerSnapshotMutation getNotifiedFiringTimerIDs](v5, "getNotifiedFiringTimerIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      notifiedFiringTimerIDs = v6->_notifiedFiringTimerIDs;
      v6->_notifiedFiringTimerIDs = (NSOrderedSet *)v14;

    }
    else
    {
      v6 = (AFClockTimerSnapshot *)-[AFClockTimerSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFClockTimerSnapshot *)-[AFClockTimerSnapshot copy](self, "copy");
  }

  return v6;
}

- (id)ad_shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AFClockTimerSnapshot generation](self, "generation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFClockTimerSnapshot date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFClockTimerSnapshot notifiedFiringTimerIDs](self, "notifiedFiringTimerIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFClockTimerSnapshot hasFiringTimers](self, "hasFiringTimers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(gen: %@, date: %@, notifiedFiringTimerIDs: %@, isFiring: %@)"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)serializedBackingStore
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (AFClockTimerSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  AFClockTimerSnapshot *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "generation");
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timersByID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifiedFiringTimerIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[AFClockTimerSnapshot initWithGeneration:date:timersByID:notifiedFiringTimerIDs:](self, "initWithGeneration:date:timersByID:notifiedFiringTimerIDs:", v6, v7, v8, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasFiringTimers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AFClockTimerSnapshot timersByID](self, "timersByID", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isFiring") && AFClockIsFiringTimerValid(v7))
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)mostRecentFiringTimer
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AFClockTimerSnapshot timersByID](self, "timersByID", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isFiring") && AFClockIsFiringTimerValid(v9))
        {
          if (v6)
          {
            objc_msgSend(v6, "firedDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "firedDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "compare:", v11) == -1)
              v12 = v9;
            else
              v12 = v6;
            v13 = v12;

            v6 = v13;
          }
          else
          {
            v6 = v9;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firingTimers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[AFClockTimerSnapshot notifiedFiringTimerIDs](self, "notifiedFiringTimerIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFClockTimerSnapshot timersByID](self, "timersByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__AFClockTimerSnapshot_Utility__firingTimers__block_invoke;
  v13 = &unk_1E3A34D40;
  v14 = v4;
  v15 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

void __45__AFClockTimerSnapshot_Utility__firingTimers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isFiring") && AFClockIsFiringTimerValid(v6))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) != 0)
      goto LABEL_8;
    v7 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)&v9[4] = "-[AFClockTimerSnapshot(Utility) firingTimers]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(_QWORD *)&v9[14] = v6;
    v8 = "%s Timer %@ is not in notifiedFiringTimerIDs, but isFiring is YES.";
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    v7 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
      goto LABEL_9;
    }
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)&v9[4] = "-[AFClockTimerSnapshot(Utility) firingTimers]_block_invoke";
    *(_WORD *)&v9[12] = 2112;
    *(_QWORD *)&v9[14] = v6;
    v8 = "%s Timer %@ is in notifiedFiringTimerIDs, but isFiring is NO.";
LABEL_11:
    _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, v8, v9, 0x16u);
    goto LABEL_8;
  }
LABEL_9:

}

@end
