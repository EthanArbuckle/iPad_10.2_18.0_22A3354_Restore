@implementation MLModelExecutionSchedule

- (MLModelExecutionSchedule)init
{
  MLModelExecutionSchedule *v2;
  MLModelExecutionSchedule *v3;
  NSDictionary *modelExecutionSchedule;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLModelExecutionSchedule;
  v2 = -[MLModelExecutionSchedule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    modelExecutionSchedule = v2->_modelExecutionSchedule;
    v2->_modelExecutionSchedule = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

- (NSDictionary)modelExecutionSchedule
{
  return self->_modelExecutionSchedule;
}

- (void)setModelExecutionSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)modelExecutionScheduleByModelStructurePath
{
  return self->_modelExecutionScheduleByModelStructurePath;
}

- (void)setModelExecutionScheduleByModelStructurePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelExecutionScheduleByModelStructurePath, 0);
  objc_storeStrong((id *)&self->_modelExecutionSchedule, 0);
}

@end
