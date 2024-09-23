@implementation HKWorkoutTrainingLoadCollection

- (HKWorkoutTrainingLoadCollection)initWithTotalTrainingLoads:(id)a3
{
  id v4;
  HKWorkoutTrainingLoadCollection *v5;
  uint64_t v6;
  NSMutableArray *trainingLoads;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkoutTrainingLoadCollection;
  v5 = -[HKWorkoutTrainingLoadCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trainingLoads = v5->_trainingLoads;
    v5->_trainingLoads = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutTrainingLoadCollection;
  return -[HKWorkoutTrainingLoadCollection init](&v3, sel_init);
}

- (void)addTrainingLoad:(id)a3
{
  id v4;
  NSMutableArray *trainingLoads;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSMutableArray *v12;
  id v13;

  v4 = a3;
  trainingLoads = self->_trainingLoads;
  v13 = v4;
  if (trainingLoads)
  {
    -[NSMutableArray lastObject](trainingLoads, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToDate:", v8);

    if (v11)
      -[NSMutableArray removeObject:](self->_trainingLoads, "removeObject:", v6);

  }
  else
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_trainingLoads;
    self->_trainingLoads = v12;
  }

  -[NSMutableArray addObject:](self->_trainingLoads, "addObject:", v13);
}

- (id)trainingLoad
{
  return (id)-[NSMutableArray copy](self->_trainingLoads, "copy");
}

- (id)trainingLoadForDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_trainingLoads;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dateInterval", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsDate:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_trainingLoads, CFSTR("trainingLoads"));
}

- (HKWorkoutTrainingLoadCollection)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutTrainingLoadCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *trainingLoads;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutTrainingLoadCollection;
  v5 = -[HKWorkoutTrainingLoadCollection init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trainingLoads"));
    v9 = objc_claimAutoreleasedReturnValue();
    trainingLoads = v5->_trainingLoads;
    v5->_trainingLoads = (NSMutableArray *)v9;

  }
  return v5;
}

- (NSArray)trainingLoads
{
  return &self->_trainingLoads->super;
}

- (void)setTrainingLoads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingLoads, 0);
}

@end
