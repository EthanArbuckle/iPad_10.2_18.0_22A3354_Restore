@implementation IRPolicyInspection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_generatorNegativeInputs, 0);
  objc_storeStrong((id *)&self->_internalCandidates, 0);
}

- (void)setStateMachineClassification:(int64_t)a3
{
  self->_stateMachineClassification = a3;
}

- (void)setGeneratorNegativeInputs:(id)a3
{
  objc_storeStrong((id *)&self->_generatorNegativeInputs, a3);
}

- (IRPolicyInspection)initWithName:(id)a3
{
  id v5;
  IRPolicyInspection *v6;
  uint64_t v7;
  NSMutableSet *internalCandidates;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRPolicyInspection;
  v6 = -[IRPolicyInspection init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    internalCandidates = v6->_internalCandidates;
    v6->_internalCandidates = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (void)addCandidate:(id)a3
{
  -[NSMutableSet addObject:](self->_internalCandidates, "addObject:", a3);
}

- (NSSet)candidates
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_internalCandidates, "copy");
}

- (NSDictionary)generatorNegativeInputs
{
  return self->_generatorNegativeInputs;
}

- (int64_t)stateMachineClassification
{
  return self->_stateMachineClassification;
}

- (NSString)name
{
  return self->_name;
}

@end
