@implementation HKWorkoutBuilderStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *workoutStatistics;
  id v5;

  workoutStatistics = self->_workoutStatistics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workoutStatistics, CFSTR("workout_stats"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activitiesStatistics, CFSTR("activities_stats"));

}

- (HKWorkoutBuilderStatistics)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutBuilderStatistics *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *workoutStatistics;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *activitiesStatistics;
  objc_super v17;
  _QWORD v18[4];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutBuilderStatistics;
  v5 = -[HKWorkoutBuilderStatistics init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("workout_stats"));
    v9 = objc_claimAutoreleasedReturnValue();
    workoutStatistics = v5->_workoutStatistics;
    v5->_workoutStatistics = (NSMutableDictionary *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("activities_stats"));
    v14 = objc_claimAutoreleasedReturnValue();
    activitiesStatistics = v5->_activitiesStatistics;
    v5->_activitiesStatistics = (NSMutableDictionary *)v14;

  }
  return v5;
}

- (NSDictionary)workoutStatistics
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_workoutStatistics, "copy");
}

- (NSDictionary)activitiesStatistics
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_activitiesStatistics, "copy");
}

- (BOOL)isEmpty
{
  BOOL v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_workoutStatistics, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_activitiesStatistics;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesStatistics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v3 = 0;
          goto LABEL_13;
        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 1;
LABEL_13:

  return v3;
}

- (NSSet)allTypes
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_workoutStatistics, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_activitiesStatistics;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesStatistics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (void)addWorkoutStatistics:(id)a3 forType:(id)a4
{
  id v6;
  NSMutableDictionary *workoutStatistics;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  workoutStatistics = self->_workoutStatistics;
  if (!workoutStatistics)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_workoutStatistics;
    self->_workoutStatistics = v8;

    workoutStatistics = self->_workoutStatistics;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](workoutStatistics, "setObject:forKeyedSubscript:", v10, v6);

}

- (void)addActivityStatistics:(id)a3 forType:(id)a4 activityUUID:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *activitiesStatistics;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  activitiesStatistics = self->_activitiesStatistics;
  if (!activitiesStatistics)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = self->_activitiesStatistics;
    self->_activitiesStatistics = v11;

    activitiesStatistics = self->_activitiesStatistics;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](activitiesStatistics, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activitiesStatistics, "setObject:forKeyedSubscript:", v14, v9);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesStatistics, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitiesStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
}

@end
