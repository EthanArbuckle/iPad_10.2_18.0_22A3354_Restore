@implementation ATXAnchorModelPhase1TrainingResult

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, num unique anchor occurrences: %ld, class conditional probability: %.2f, posterior probability: %.2f"), self->_candidateId, self->_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, *(_QWORD *)&self->_classConditionalProbability, *(_QWORD *)&self->_posteriorProbability);
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (void)setCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_candidateId, a3);
}

- (int64_t)numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence
{
  return self->_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence;
}

- (void)setNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence:(int64_t)a3
{
  self->_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence = a3;
}

- (int64_t)numShownSuggestions
{
  return self->_numShownSuggestions;
}

- (void)setNumShownSuggestions:(int64_t)a3
{
  self->_numShownSuggestions = a3;
}

- (int64_t)numEngagedSuggestions
{
  return self->_numEngagedSuggestions;
}

- (void)setNumEngagedSuggestions:(int64_t)a3
{
  self->_numEngagedSuggestions = a3;
}

- (int64_t)numRejectedSuggestion
{
  return self->_numRejectedSuggestion;
}

- (void)setNumRejectedSuggestion:(int64_t)a3
{
  self->_numRejectedSuggestion = a3;
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (void)setPosteriorProbability:(double)a3
{
  self->_posteriorProbability = a3;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (void)setClassConditionalProbability:(double)a3
{
  self->_classConditionalProbability = a3;
}

- (double)standardDeviationOfOffsetFromAnchor
{
  return self->_standardDeviationOfOffsetFromAnchor;
}

- (void)setStandardDeviationOfOffsetFromAnchor:(double)a3
{
  self->_standardDeviationOfOffsetFromAnchor = a3;
}

- (double)anchorPopularity
{
  return self->_anchorPopularity;
}

- (void)setAnchorPopularity:(double)a3
{
  self->_anchorPopularity = a3;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (void)setGlobalPopularity:(double)a3
{
  self->_globalPopularity = a3;
}

- (ATXAnchorModelPBLaunchHistoryMetadata)launchHistory
{
  return self->_launchHistory;
}

- (void)setLaunchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_launchHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchHistory, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
}

@end
