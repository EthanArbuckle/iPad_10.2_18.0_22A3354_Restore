@implementation DNDSUntilExitRegionStore

- (DNDSUntilExitRegionStore)init
{
  return (DNDSUntilExitRegionStore *)-[DNDSUntilExitRegionStore _initWithStore:](self, "_initWithStore:", 0);
}

- (id)_initWithStore:(id)a3
{
  id v4;
  DNDSUntilExitRegionStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *hasActiveLifetimes;
  void *v15;
  uint64_t v16;
  CLRegion *currentRegion;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSUntilExitRegionStore;
  v5 = -[DNDSUntilExitRegionStore init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "activeLifetimeAssertionUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_activeLifetimeAssertionUUIDs, v9);

    objc_msgSend(v4, "hasActiveLifetimes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSArray count](v5->_activeLifetimeAssertionUUIDs, "count") != 0);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    hasActiveLifetimes = v5->_hasActiveLifetimes;
    v5->_hasActiveLifetimes = v13;

    objc_msgSend(v4, "currentRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    currentRegion = v5->_currentRegion;
    v5->_currentRegion = (CLRegion *)v16;

    objc_msgSend(v4, "regionEntered");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = (void *)MEMORY[0x1E0C9AAA0];
    objc_storeStrong((id *)&v5->_regionEntered, v21);

  }
  return v5;
}

- (id)_initWithActiveLifetimeAssertionUUIDs:(id)a3 currentRegion:(id)a4 regionEntered:(id)a5
{
  id v9;
  id v10;
  id v11;
  DNDSUntilExitRegionStore *v12;
  DNDSUntilExitRegionStore *v13;
  uint64_t v14;
  NSNumber *hasActiveLifetimes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DNDSUntilExitRegionStore;
  v12 = -[DNDSUntilExitRegionStore init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeLifetimeAssertionUUIDs, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "count") != 0);
    v14 = objc_claimAutoreleasedReturnValue();
    hasActiveLifetimes = v13->_hasActiveLifetimes;
    v13->_hasActiveLifetimes = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_currentRegion, a4);
    objc_storeStrong((id *)&v13->_regionEntered, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](self, "activeLifetimeAssertionUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSUntilExitRegionStore currentRegion](self, "currentRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSUntilExitRegionStore hasActiveLifetimes](self, "hasActiveLifetimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSUntilExitRegionStore regionEntered](self, "regionEntered");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DNDSUntilExitRegionStore *v4;
  DNDSUntilExitRegionStore *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = (DNDSUntilExitRegionStore *)a3;
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
      -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](self, "activeLifetimeAssertionUUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](v5, "activeLifetimeAssertionUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](self, "activeLifetimeAssertionUUIDs");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_50;
        }
        v9 = (void *)v8;
        -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](v5, "activeLifetimeAssertionUUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](self, "activeLifetimeAssertionUUIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](v5, "activeLifetimeAssertionUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      -[DNDSUntilExitRegionStore currentRegion](self, "currentRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSUntilExitRegionStore currentRegion](v5, "currentRegion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSUntilExitRegionStore currentRegion](self, "currentRegion");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSUntilExitRegionStore currentRegion](v5, "currentRegion");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            v48 = v14;
            -[DNDSUntilExitRegionStore currentRegion](self, "currentRegion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSUntilExitRegionStore currentRegion](v5, "currentRegion");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            v14 = v21;
            goto LABEL_17;
          }

        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      -[DNDSUntilExitRegionStore hasActiveLifetimes](self, "hasActiveLifetimes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSUntilExitRegionStore hasActiveLifetimes](v5, "hasActiveLifetimes");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      -[DNDSUntilExitRegionStore hasActiveLifetimes](self, "hasActiveLifetimes");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        -[DNDSUntilExitRegionStore hasActiveLifetimes](v5, "hasActiveLifetimes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          -[DNDSUntilExitRegionStore hasActiveLifetimes](self, "hasActiveLifetimes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSUntilExitRegionStore hasActiveLifetimes](v5, "hasActiveLifetimes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0)
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            v14 = v40;
LABEL_25:
            -[DNDSUntilExitRegionStore regionEntered](self, "regionEntered");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSUntilExitRegionStore regionEntered](v5, "regionEntered");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v28 == (void *)v29)
            {

              v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              -[DNDSUntilExitRegionStore regionEntered](self, "regionEntered");
              v31 = objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v41 = (void *)v31;
                -[DNDSUntilExitRegionStore regionEntered](v5, "regionEntered");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v36 = v32;
                  -[DNDSUntilExitRegionStore regionEntered](self, "regionEntered");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDSUntilExitRegionStore regionEntered](v5, "regionEntered");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = objc_msgSend(v35, "isEqual:", v33);

                  v32 = v36;
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
            if (v46 != v47)
            {

            }
            if (v48 != v15)
            {

            }
LABEL_47:
            v10 = v51;
            v9 = v52;
            v11 = v50;
            v12 = v49;
            if (v6 != v7)
              goto LABEL_48;
LABEL_50:

            goto LABEL_51;
          }

          v14 = v40;
          v25 = v42;
        }

      }
      if (v48 != v15)
      {

      }
LABEL_38:
      v13 = 0;
      goto LABEL_47;
    }
    v13 = 0;
  }
LABEL_51:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSUntilExitRegionStore activeLifetimeAssertionUUIDs](self, "activeLifetimeAssertionUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSUntilExitRegionStore hasActiveLifetimes](self, "hasActiveLifetimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSUntilExitRegionStore currentRegion](self, "currentRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSUntilExitRegionStore regionEntered](self, "regionEntered");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; activeAssertionUUIDs: %@; hasActiveLifetimes: %@; currentRegion: %@; regionEntered: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSUntilExitRegionStore _initWithStore:]([DNDSMutableUntilExitRegionStore alloc], "_initWithStore:", self);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CLLocationDegrees v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("activeLifetimeAssertionUUIDs"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_281);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("currentRegion"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("regionIdentifier"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("regionCenterLatitude"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("regionCenterLongitude"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v16 = CLLocationCoordinate2DMake(v12, v15);
    objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("regionRadius"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v9, v16.latitude, v16.longitude, v19);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("regionEntered"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithActiveLifetimeAssertionUUIDs:currentRegion:regionEntered:", v7, v20, v21);

  return v22;
}

id __68__DNDSUntilExitRegionStore_newWithDictionaryRepresentation_context___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  CLRegion *currentRegion;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray bs_mapNoNulls:](self->_activeLifetimeAssertionUUIDs, "bs_mapNoNulls:", &__block_literal_global_297);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentRegion = self->_currentRegion;
  if (currentRegion)
  {
    -[CLRegion identifier](currentRegion, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLRegion center](self->_currentRegion, "center");
    v9 = v8;
    v11 = v10;
    -[CLRegion radius](self->_currentRegion, "radius");
    v18[0] = v7;
    v17[0] = CFSTR("regionIdentifier");
    v17[1] = CFSTR("regionRadius");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    v17[2] = CFSTR("regionCenterLatitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v13;
    v17[3] = CFSTR("regionCenterLongitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("activeLifetimeAssertionUUIDs"));
    if (v15)
    {
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("currentRegion"));

    }
  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("activeLifetimeAssertionUUIDs"));
  }
  objc_msgSend(v4, "setObject:forKey:", self->_regionEntered, CFSTR("regionEntered"));

  return v4;
}

uint64_t __64__DNDSUntilExitRegionStore_dictionaryRepresentationWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (CLRegion)currentRegion
{
  return self->_currentRegion;
}

- (NSNumber)hasActiveLifetimes
{
  return self->_hasActiveLifetimes;
}

- (NSNumber)regionEntered
{
  return self->_regionEntered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionEntered, 0);
  objc_storeStrong((id *)&self->_hasActiveLifetimes, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
}

@end
