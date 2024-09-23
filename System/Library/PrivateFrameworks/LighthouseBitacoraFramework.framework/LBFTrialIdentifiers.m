@implementation LBFTrialIdentifiers

- (LBFTrialIdentifiers)initWithExperimentID:(id)a3 deploymentID:(int)a4 treatmentID:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  LBFTrialIdentifiers *v11;
  LBFTrialIdentifiers *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *deploymentID;
  objc_super v19;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)LBFTrialIdentifiers;
  v11 = -[LBFTrialIdentifiers init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_experimentID, a3);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%d"), v14, v15, v6);
    v16 = objc_claimAutoreleasedReturnValue();
    deploymentID = v12->_deploymentID;
    v12->_deploymentID = (NSString *)v16;

    objc_storeStrong((id *)&v12->_treatmentID, a5);
    v12->_identifierType = 1;
  }

  return v12;
}

- (LBFTrialIdentifiers)initWithBMLTTaskID:(id)a3 deploymentID:(int)a4
{
  uint64_t v4;
  id v7;
  LBFTrialIdentifiers *v8;
  LBFTrialIdentifiers *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *deploymentID;
  objc_super v16;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LBFTrialIdentifiers;
  v8 = -[LBFTrialIdentifiers init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trialTaskID, a3);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%d"), v11, v12, v4);
    v13 = objc_claimAutoreleasedReturnValue();
    deploymentID = v9->_deploymentID;
    v9->_deploymentID = (NSString *)v13;

    v9->_identifierType = 2;
  }

  return v9;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (NSString)trialTaskID
{
  return self->_trialTaskID;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTaskID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
}

@end
