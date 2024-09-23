@implementation HDSmoothingTask

- (id)_initWithWorkout:(void *)a3 routes:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  objc_super v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)HDSmoothingTask;
    a1 = objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v9;

      *((_QWORD *)a1 + 7) = 0;
      *((_BYTE *)a1 + 8) = 0;
      objc_msgSend(v5, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7390]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "BOOLValue");
      v14 = 360.0;
      if (!v13)
        v14 = 30.0;
      *((double *)a1 + 8) = v14;

    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[HKWorkout UUID](self->_workout, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[2];
  else
    v6 = 0;
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKWorkout UUID](self->_workout, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSmoothingTask totalLocations]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)HDSmoothingTask;
  -[HDSmoothingTask description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ totalLocations=%tu %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)totalLocations
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 24);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "count", (_QWORD)v8);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTransaction:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end
