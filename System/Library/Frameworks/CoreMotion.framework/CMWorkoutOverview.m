@implementation CMWorkoutOverview

- (CMWorkoutOverview)initWithOverviewId:(id)a3 workouts:(id)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CMWorkoutOverview *v25;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutOverview.mm"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overviewId"));
    if (a4)
      goto LABEL_3;
LABEL_18:
    v29 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutOverview.mm"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workouts"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_18;
LABEL_3:
  if ((unint64_t)objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4, v4) >= 2)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v9, (uint64_t)&v32, (uint64_t)v36, 16);
    if (v10)
    {
      v15 = v10;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(a4);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend_mode(v18, v11, v12, v13, v14) == 1)
          {
            v19 = objc_msgSend_type(v18, v11, v12, v13, v14);
            if ((objc_msgSend_workoutIsSupportedForLowPower_(CMWorkout, v20, v19, v21, v22) & 1) == 0)
            {
              v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13, v14);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMWorkoutOverview.mm"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wrk.mode != CMWorkoutModeExtended || [CMWorkout workoutIsSupportedForLowPower:wrk.type]"));
            }
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v11, (uint64_t)&v32, (uint64_t)v36, 16);
      }
      while (v15);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)CMWorkoutOverview;
  v25 = -[CMWorkoutOverview init](&v31, sel_init);
  if (v25)
  {
    v25->_overviewId = (NSUUID *)a3;
    v25->_workouts = (NSArray *)a4;
  }
  return v25;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutOverview;
  -[CMWorkoutOverview dealloc](&v3, sel_dealloc);
}

- (NSUUID)overviewId
{
  return self->_overviewId;
}

- (NSArray)workouts
{
  return self->_workouts;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutOverview)initWithCoder:(id)a3
{
  CMWorkoutOverview *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMWorkoutOverview;
  v4 = -[CMWorkoutOverview init](&v18, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_overviewId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMWorkoutOverviewCodingKeyOverviewId"), v7);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v14 = objc_msgSend_setWithObjects_(v8, v11, v9, v12, v13, v10, 0);
    v4->_workouts = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMWorkoutOverviewCodingKeyWorkouts"), v16);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_overviewId(self, v10, v11, v12, v13);
  v19 = objc_msgSend_workouts(self, v15, v16, v17, v18);
  return (id)objc_msgSend_initWithOverviewId_workouts_(v9, v20, v14, v19, v21);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_overviewId, (uint64_t)CFSTR("kCMWorkoutOverviewCodingKeyOverviewId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_workouts, (uint64_t)CFSTR("kCMWorkoutOverviewCodingKeyWorkouts"), v7);
}

- (id)description
{
  id v3;
  NSArray *workouts;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  objc_class *v14;
  NSString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  workouts = self->_workouts;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(workouts, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(workouts);
        objc_msgSend_appendFormat_(v3, v7, (uint64_t)CFSTR("%@, "), v8, v9, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(workouts, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  return (id)objc_msgSend_stringWithFormat_(v13, v16, (uint64_t)CFSTR("%@, <overviewId %@, workouts [ %@]>"), v17, v18, v15, self->_overviewId, v3);
}

@end
