@implementation ATXFakeAnchorModelPhase2Trainer

- (ATXFakeAnchorModelPhase2Trainer)init
{
  ATXFakeAnchorModelPhase2Trainer *v2;
  uint64_t v3;
  NSMutableArray *candidateIdsForPhase2Training;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPhase2Trainer;
  v2 = -[ATXFakeAnchorModelPhase2Trainer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    candidateIdsForPhase2Training = v2->_candidateIdsForPhase2Training;
    v2->_candidateIdsForPhase2Training = (NSMutableArray *)v3;

  }
  return v2;
}

- (int64_t)candidateClassifierType
{
  return 1;
}

- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4
{
  NSMutableArray *candidateIdsForPhase2Training;
  id v5;
  ATXNaivePositiveAnchorModelCandidateClassifier *v6;
  void *v7;
  ATXNaivePositiveAnchorModelCandidateClassifier *v8;

  candidateIdsForPhase2Training = self->_candidateIdsForPhase2Training;
  v5 = a3;
  -[NSMutableArray addObject:](candidateIdsForPhase2Training, "addObject:", v5);
  v6 = [ATXNaivePositiveAnchorModelCandidateClassifier alloc];
  v7 = (void *)objc_opt_new();
  v8 = -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:](v6, "initWithCandidateId:candidateType:anchor:", v5, CFSTR("action"), v7);

  -[ATXNaivePositiveAnchorModelCandidateClassifier train](v8, "train");
  return v8;
}

- (id)candidateIdsForPhase2Training
{
  return self->_candidateIdsForPhase2Training;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIdsForPhase2Training, 0);
}

@end
