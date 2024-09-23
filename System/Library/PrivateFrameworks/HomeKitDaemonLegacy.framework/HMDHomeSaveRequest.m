@implementation HMDHomeSaveRequest

- (id)_initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7 saveOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  HMDHomeSaveRequest *v17;
  HMDHomeSaveRequest *v18;
  objc_super v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDHomeSaveRequest;
  v17 = -[HMDHomeSaveRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v18->_reason, a4);
    objc_storeStrong((id *)&v18->_information, a5);
    v18->_objectChange = a7;
    v18->_incrementGeneration = +[HMDHomeManager shouldIncrementGenerationCounterForReason:](HMDHomeManager, "shouldIncrementGenerationCounterForReason:", v15);
    v18->_saveOptions = a8;
  }

  return v18;
}

- (HMDHomeSaveRequest)initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  HMDHomeSaveRequest *v13;
  HMDHomeSaveRequest *v14;

  v7 = a7;
  v8 = a6;
  v12 = a4;
  v13 = -[HMDHomeSaveRequest _initWithHome:reason:information:postSyncNotification:objectChange:saveOptions:](self, "_initWithHome:reason:information:postSyncNotification:objectChange:saveOptions:", a3, v12, a5, v8, v7, 0);
  v14 = v13;
  if (v13)
    -[HMDHomeSaveRequest _updateSaveOptions:reason:](v13, "_updateSaveOptions:reason:", v8, v12);

  return v14;
}

- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 postSyncNotification:(BOOL)a5
{
  return -[HMDHomeSaveRequest initWithHome:reason:information:postSyncNotification:objectChange:](self, "initWithHome:reason:information:postSyncNotification:objectChange:", 0, a3, a4, a5, 0);
}

- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 saveOptions:(unint64_t)a5
{
  return (HMDHomeSaveRequest *)-[HMDHomeSaveRequest _initWithHome:reason:information:postSyncNotification:objectChange:saveOptions:](self, "_initWithHome:reason:information:postSyncNotification:objectChange:saveOptions:", 0, a3, a4, 0, 0, a5);
}

- (void)_updateSaveOptions:(BOOL)a3 reason:(id)a4
{
  if (a3)
    self->_saveOptions |= 2uLL;
  if (!+[HMDHomeManager doesSaveReasonAffectOnlyLocalData:](HMDHomeManager, "doesSaveReasonAffectOnlyLocalData:", a4))self->_saveOptions |= 1uLL;
}

- (HMDHome)home
{
  return self->_home;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDictionary)information
{
  return self->_information;
}

- (unint64_t)saveOptions
{
  return self->_saveOptions;
}

- (BOOL)objectChange
{
  return self->_objectChange;
}

- (BOOL)incrementGeneration
{
  return self->_incrementGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
