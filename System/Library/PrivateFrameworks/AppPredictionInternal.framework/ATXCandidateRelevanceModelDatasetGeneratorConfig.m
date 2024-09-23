@implementation ATXCandidateRelevanceModelDatasetGeneratorConfig

+ (id)candidatePublisher
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
  v3 = (void *)objc_opt_class();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "candidatePublisherFromStartTime:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

@end
