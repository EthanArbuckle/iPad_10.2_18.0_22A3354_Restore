@implementation CMWorkoutSnapshot

- (CMWorkoutSnapshot)initWithState:(int64_t)a3 workout:(id)a4 entryDate:(id)a5
{
  CMWorkoutSnapshot *v8;
  CMWorkoutSnapshot *v9;
  CMWorkout *v10;
  NSDate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMWorkoutSnapshot;
  v8 = -[CMWorkoutSnapshot init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    if (a4)
      v10 = (CMWorkout *)a4;
    else
      v10 = 0;
    v9->_workout = v10;
    if (a5)
      v11 = (NSDate *)a5;
    else
      v11 = 0;
    v9->_entryDate = v11;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutSnapshot;
  -[CMWorkoutSnapshot dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  return self->_state;
}

- (CMWorkout)workout
{
  return self->_workout;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutSnapshot)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWorkoutSnapshot *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMWorkoutSnapshot;
  v7 = -[CMWorkoutSnapshot init](&v15, sel_init);
  if (v7)
  {
    v7->_state = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyState"), v5, v6);
    v8 = objc_opt_class();
    v7->_workout = (CMWorkout *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyWorkout"), v10);
    v11 = objc_opt_class();
    v7->_entryDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyEntryDate"), v13);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_state(self, v10, v11, v12, v13);
  v19 = objc_msgSend_workout(self, v15, v16, v17, v18);
  v24 = objc_msgSend_entryDate(self, v20, v21, v22, v23);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithState_workout_entryDate_, v14, v19, v24);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_state, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyState"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_workout, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyWorkout"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_entryDate, (uint64_t)CFSTR("kCMWorkoutSnapshotCodingKeyEntryDate"), v9);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@, <state %ld, workout %@, entryDate %@"), v7, v8, v5, self->_state, self->_workout, self->_entryDate);
}

@end
