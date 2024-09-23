@implementation IRContextWrapper

- (IRContextWrapper)initWithName:(id)a3 defaultClassification:(int64_t)a4
{
  id v7;
  IRContextWrapper *v8;
  IRContextWrapper *v9;
  uint64_t v10;
  NSSet *candidates;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRContextWrapper;
  v8 = -[IRContextWrapper init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_defaultClassification = a4;
    v10 = objc_opt_new();
    candidates = v9->_candidates;
    v9->_candidates = (NSSet *)v10;

    objc_storeStrong((id *)&v9->_name, a3);
  }

  return v9;
}

- (IRContextWrapper)initWithName:(id)a3 andDefaultClassification:(int64_t)a4 andCandidates:(id)a5
{
  id v8;
  IRContextWrapper *v9;
  IRContextWrapper *v10;
  _QWORD v12[4];
  IRContextWrapper *v13;

  v8 = a5;
  v9 = -[IRContextWrapper initWithName:defaultClassification:](self, "initWithName:defaultClassification:", a3, a4);
  v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__IRContextWrapper_initWithName_andDefaultClassification_andCandidates___block_invoke;
    v12[3] = &unk_251044F20;
    v13 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  }
  return v10;
}

void __72__IRContextWrapper_initWithName_andDefaultClassification_andCandidates___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRCandidateDO candidateFromCandidateDO:](IRCandidateDO, "candidateFromCandidateDO:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCandidate:logOrderOfExecution:", v3, 0);

}

- (void)addCandidate:(id)a3 logOrderOfExecution:(BOOL)a4
{
  _BOOL8 v4;
  NSSet *candidates;
  id v7;
  NSSet *v8;
  NSSet *v9;
  IRCandidateWrapper *v10;

  v4 = a4;
  candidates = self->_candidates;
  v7 = a3;
  v10 = -[IRCandidateWrapper initWithCandidate:andDefaultClassification:logOrderOfExecution:]([IRCandidateWrapper alloc], "initWithCandidate:andDefaultClassification:logOrderOfExecution:", v7, self->_defaultClassification, v4);

  -[NSSet setByAddingObject:](candidates, "setByAddingObject:", v10);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v9 = self->_candidates;
  self->_candidates = v8;

}

- (IRContext)context
{
  id v3;
  NSSet *candidates;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BE5B2D8]);
  candidates = self->_candidates;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__IRContextWrapper_context__block_invoke;
  v7[3] = &unk_251044F48;
  v5 = v3;
  v8 = v5;
  -[NSSet enumerateObjectsUsingBlock:](candidates, "enumerateObjectsUsingBlock:", v7);

  return (IRContext *)v5;
}

void __27__IRContextWrapper_context__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BE5B2C8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "candidateResult");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "classification");
  objc_msgSend(v4, "candidateResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "classificationDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithCandidate:classification:andClassificationDescription:", v6, v8, v10);
  objc_msgSend(v2, "addCandidateResult:", v11);

}

- (IRPolicyInspection)policyInspection
{
  IRPolicyInspection *v3;
  NSSet *candidates;
  IRPolicyInspection *v5;
  _QWORD v7[4];
  IRPolicyInspection *v8;

  v3 = -[IRPolicyInspection initWithName:]([IRPolicyInspection alloc], "initWithName:", self->_name);
  candidates = self->_candidates;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__IRContextWrapper_policyInspection__block_invoke;
  v7[3] = &unk_251044F48;
  v5 = v3;
  v8 = v5;
  -[NSSet enumerateObjectsUsingBlock:](candidates, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __36__IRContextWrapper_policyInspection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IRCandidateInspectionServicePackage *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IRCandidateInspectionServicePackage *v13;
  void *v14;
  IRCandidateInspection *v16;
  IRCandidateInspection *v17;

  v2 = a2;
  v16 = [IRCandidateInspection alloc];
  v3 = [IRCandidateInspectionServicePackage alloc];
  objc_msgSend(v2, "ruleInspections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "candidateResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "classification");
  objc_msgSend(v2, "orderOfExecution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "classificationDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IRCandidateInspectionServicePackage initWithRules:classification:orderOfExecution:andClassificationDescription:forCandidate:](v3, "initWithRules:classification:orderOfExecution:andClassificationDescription:forCandidate:", v5, v7, v8, v10, v12);
  v17 = -[IRCandidateInspection initWithInspectionServicePackage:](v16, "initWithInspectionServicePackage:", v13);

  objc_msgSend(*(id *)(a1 + 32), "addCandidate:", v17);
}

- (NSSet)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
