@implementation ATXFakeAnchorModelPhase3Trainer

- (ATXFakeAnchorModelPhase3Trainer)init
{
  ATXFakeAnchorModelPhase3Trainer *v2;
  uint64_t v3;
  NSMutableArray *candidateIdsForPhase3Training;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPhase3Trainer;
  v2 = -[ATXFakeAnchorModelPhase3Trainer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    candidateIdsForPhase3Training = v2->_candidateIdsForPhase3Training;
    v2->_candidateIdsForPhase3Training = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)trainPhase3ForCandidate:(id)a3
{
  -[NSMutableArray addObject:](self->_candidateIdsForPhase3Training, "addObject:", a3);
  return -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:]([ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc], "initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:", -1.0, -1.0);
}

- (id)candidateIdsForPhase3Training
{
  return self->_candidateIdsForPhase3Training;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIdsForPhase3Training, 0);
}

@end
