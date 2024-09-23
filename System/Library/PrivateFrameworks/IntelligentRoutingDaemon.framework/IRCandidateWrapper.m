@implementation IRCandidateWrapper

- (IRCandidateWrapper)initWithCandidate:(id)a3
{
  id v4;
  IRCandidateWrapper *v5;
  IRCandidateWrapper *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRCandidateWrapper;
  v5 = -[IRCandidateWrapper init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IRCandidateWrapper setCandidate:](v5, "setCandidate:", v4);
    v7 = objc_alloc(MEMORY[0x24BE5B2C8]);
    +[IRCandidateDO candidateFromCandidateDO:](IRCandidateDO, "candidateFromCandidateDO:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCandidate:classification:andClassificationDescription:", v8, 0, CFSTR("No classification assigned"));
    -[IRCandidateWrapper setCandidateResult:](v6, "setCandidateResult:", v9);

  }
  return v6;
}

- (IRCandidateWrapper)initWithCandidate:(id)a3 andDefaultClassification:(int64_t)a4 logOrderOfExecution:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  IRCandidateWrapper *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IRCandidateWrapper;
  v9 = -[IRCandidateWrapper init](&v14, sel_init);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B2C8]), "initWithCandidate:classification:andClassificationDescription:", v8, a4, CFSTR("No classification assigned"));
    -[IRCandidateWrapper setCandidateResult:](v9, "setCandidateResult:", v10);

    v11 = (void *)objc_opt_new();
    -[IRCandidateWrapper setRuleInspections:](v9, "setRuleInspections:", v11);

    v12 = (void *)objc_opt_new();
    -[IRCandidateWrapper setInternalOrderOfExecution:](v9, "setInternalOrderOfExecution:", v12);

    -[IRCandidateWrapper setEnableOrderOfExecutionLogging:](v9, "setEnableOrderOfExecutionLogging:", v5);
  }

  return v9;
}

- (void)setEvaluation:(id)a3 forRuleKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IRRuleInspection *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[IRRuleInspection initWithRuleName:evaluation:]([IRRuleInspection alloc], "initWithRuleName:evaluation:", v6, v7);

  -[IRCandidateWrapper ruleInspections](self, "ruleInspections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

}

- (void)setClassification:(int64_t)a3 withDescription:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[IRCandidateWrapper candidateResult](self, "candidateResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassification:withDescription:", a3, v6);

}

- (void)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IRInspectionOrderOfExectionElement *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  if (-[IRCandidateWrapper enableOrderOfExecutionLogging](self, "enableOrderOfExecutionLogging"))
  {
    IRCandidateClassificationToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCandidateWrapper internalOrderOfExecution](self, "internalOrderOfExecution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_new();
      -[IRCandidateWrapper internalOrderOfExecution](self, "internalOrderOfExecution");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

    }
    -[IRCandidateWrapper internalOrderOfExecution](self, "internalOrderOfExecution");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IRInspectionOrderOfExectionElement initWithRuleName:andRuleType:]([IRInspectionOrderOfExectionElement alloc], "initWithRuleName:andRuleType:", v16, v7);
    objc_msgSend(v14, "addObject:", v15);

  }
}

- (BOOL)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5 andReturn:(BOOL)a6
{
  -[IRCandidateWrapper logOrderOfExecution:withRuleKey:ruleType:](self, "logOrderOfExecution:withRuleKey:ruleType:", a3, a4, a5);
  return a6;
}

- (IRInspectionOrderOfExectionForCandidate)orderOfExecution
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  IRCandidateWrapper *v14;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[IRCandidateWrapper internalOrderOfExecution](self, "internalOrderOfExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __38__IRCandidateWrapper_orderOfExecution__block_invoke;
  v12 = &unk_251044EF8;
  v13 = v4;
  v14 = self;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v9);

  objc_msgSend(v3, "setExecutionOrderForClassification:", v7, v9, v10, v11, v12);
  return (IRInspectionOrderOfExectionForCandidate *)v3;
}

void __38__IRCandidateWrapper_orderOfExecution__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "internalOrderOfExecution");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

- (IRCandidateResult)candidateResult
{
  return self->_candidateResult;
}

- (void)setCandidateResult:(id)a3
{
  objc_storeStrong((id *)&self->_candidateResult, a3);
}

- (NSMutableDictionary)ruleInspections
{
  return self->_ruleInspections;
}

- (void)setRuleInspections:(id)a3
{
  objc_storeStrong((id *)&self->_ruleInspections, a3);
}

- (IRCandidateDO)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (BOOL)sameSpaceBasedOnMiLo
{
  return self->_sameSpaceBasedOnMiLo;
}

- (void)setSameSpaceBasedOnMiLo:(BOOL)a3
{
  self->_sameSpaceBasedOnMiLo = a3;
}

- (BOOL)sameSpaceBasedOnBrokeredLOI
{
  return self->_sameSpaceBasedOnBrokeredLOI;
}

- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3
{
  self->_sameSpaceBasedOnBrokeredLOI = a3;
}

- (BOOL)sameSpaceBasedOnUWB
{
  return self->_sameSpaceBasedOnUWB;
}

- (void)setSameSpaceBasedOnUWB:(BOOL)a3
{
  self->_sameSpaceBasedOnUWB = a3;
}

- (BOOL)sameSpaceBasedOnBLE
{
  return self->_sameSpaceBasedOnBLE;
}

- (void)setSameSpaceBasedOnBLE:(BOOL)a3
{
  self->_sameSpaceBasedOnBLE = a3;
}

- (BOOL)sameSpaceBasedOnPDRFence
{
  return self->_sameSpaceBasedOnPDRFence;
}

- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3
{
  self->_sameSpaceBasedOnPDRFence = a3;
}

- (BOOL)isSameSpace
{
  return self->_isSameSpace;
}

- (void)setIsSameSpace:(BOOL)a3
{
  self->_isSameSpace = a3;
}

- (NSNumber)uwbRange
{
  return self->_uwbRange;
}

- (void)setUwbRange:(id)a3
{
  objc_storeStrong((id *)&self->_uwbRange, a3);
}

- (NSNumber)bleRange
{
  return self->_bleRange;
}

- (void)setBleRange:(id)a3
{
  objc_storeStrong((id *)&self->_bleRange, a3);
}

- (int64_t)nominatedClassification
{
  return self->_nominatedClassification;
}

- (void)setNominatedClassification:(int64_t)a3
{
  self->_nominatedClassification = a3;
}

- (NSString)nominatedClassificationDesc
{
  return self->_nominatedClassificationDesc;
}

- (void)setNominatedClassificationDesc:(id)a3
{
  objc_storeStrong((id *)&self->_nominatedClassificationDesc, a3);
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
  self->_sortingHint = (NSNumber *)a3;
}

- (NSNumber)isCallToAction
{
  return self->_isCallToAction;
}

- (void)setIsCallToAction:(id)a3
{
  self->_isCallToAction = (NSNumber *)a3;
}

- (BOOL)isLockScreenControl
{
  return self->_isLockScreenControl;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  self->_isLockScreenControl = a3;
}

- (BOOL)isConservativeFiltered
{
  return self->_isConservativeFiltered;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  self->_isConservativeFiltered = a3;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSMutableDictionary)internalOrderOfExecution
{
  return self->_internalOrderOfExecution;
}

- (void)setInternalOrderOfExecution:(id)a3
{
  objc_storeStrong((id *)&self->_internalOrderOfExecution, a3);
}

- (BOOL)enableOrderOfExecutionLogging
{
  return self->_enableOrderOfExecutionLogging;
}

- (void)setEnableOrderOfExecutionLogging:(BOOL)a3
{
  self->_enableOrderOfExecutionLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalOrderOfExecution, 0);
  objc_storeStrong((id *)&self->_nominatedClassificationDesc, 0);
  objc_storeStrong((id *)&self->_bleRange, 0);
  objc_storeStrong((id *)&self->_uwbRange, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_ruleInspections, 0);
  objc_storeStrong((id *)&self->_candidateResult, 0);
}

@end
