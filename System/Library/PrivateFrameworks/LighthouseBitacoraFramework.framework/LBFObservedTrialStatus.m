@implementation LBFObservedTrialStatus

- (LBFObservedTrialStatus)initWithObservedStatus:(id)a3 deploymentId:(id)a4
{
  id v7;
  id v8;
  LBFObservedTrialStatus *v9;
  LBFObservedTrialStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LBFObservedTrialStatus;
  v9 = -[LBFObservedTrialStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentOrTaskId, a3);
    objc_storeStrong((id *)&v10->_deploymentId, a4);
  }

  return v10;
}

- (LBFObservedTrialStatus)initWithObservedStatus:(id)a3 deploymentId:(id)a4 isAllocated:(id)a5 isActivated:(id)a6 isAllocated_implicit:(BOOL)a7 isActivated_implicit:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  LBFObservedTrialStatus *v18;
  LBFObservedTrialStatus *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LBFObservedTrialStatus;
  v18 = -[LBFObservedTrialStatus init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_experimentOrTaskId, a3);
    objc_storeStrong((id *)&v19->_deploymentId, a4);
    objc_storeStrong((id *)&v19->_isAllocated, a5);
    objc_storeStrong((id *)&v19->_isActivated, a6);
    v19->_isAllocated_implicit = a7;
    v19->_isActivated_implicit = a8;
  }

  return v19;
}

- (NSString)experimentOrTaskId
{
  return self->_experimentOrTaskId;
}

- (NSString)deploymentId
{
  return self->_deploymentId;
}

- (NSDate)lastObservedTimestamp
{
  return self->_lastObservedTimestamp;
}

- (void)setLastObservedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastObservedTimestamp, a3);
}

- (NSNumber)isAllocated
{
  return self->_isAllocated;
}

- (void)setIsAllocated:(id)a3
{
  objc_storeStrong((id *)&self->_isAllocated, a3);
}

- (NSNumber)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(id)a3
{
  objc_storeStrong((id *)&self->_isActivated, a3);
}

- (BOOL)isAllocated_implicit
{
  return self->_isAllocated_implicit;
}

- (void)setIsAllocated_implicit:(BOOL)a3
{
  self->_isAllocated_implicit = a3;
}

- (BOOL)isActivated_implicit
{
  return self->_isActivated_implicit;
}

- (void)setIsActivated_implicit:(BOOL)a3
{
  self->_isActivated_implicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isActivated, 0);
  objc_storeStrong((id *)&self->_isAllocated, 0);
  objc_storeStrong((id *)&self->_lastObservedTimestamp, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentOrTaskId, 0);
}

@end
