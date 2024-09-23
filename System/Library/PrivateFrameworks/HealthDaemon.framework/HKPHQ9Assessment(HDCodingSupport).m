@implementation HKPHQ9Assessment(HDCodingSupport)

- (HDCodableScoredAssessment)codableRepresentationForSync
{
  HDCodableScoredAssessment *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableScoredAssessment);
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EF227538;
  objc_msgSendSuper2(&v11, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableScoredAssessment setSample:](v2, "setSample:", v3);

  -[HDCodableScoredAssessment setScore:](v2, "setScore:", objc_msgSend(a1, "score"));
  v4 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "answers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5318];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5318], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Error archiving answers: %@", buf, 0xCu);
    }
  }
  -[HDCodableScoredAssessment setAnswers:](v2, "setAnswers:", v6);
  -[HDCodableScoredAssessment setRisk:](v2, "setRisk:", objc_msgSend(a1, "risk"));

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addScoredAssessmentSamples:", v5);

  return v5 != 0;
}

@end
