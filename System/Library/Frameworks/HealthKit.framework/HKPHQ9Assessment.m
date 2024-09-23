@implementation HKPHQ9Assessment

+ (id)assessmentWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  id v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[HKObjectType scoredAssessmentTypeForIdentifier:](HKScoredAssessmentType, "scoredAssessmentTypeForIdentifier:", CFSTR("HKScoredAssessmentTypeIdentifierPHQ9"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[HKPHQ9Assessment _scoreForAnswers:](HKPHQ9Assessment, "_scoreForAnswers:", v8);
  v17[1] = 3221225472;
  v17[2] = __56__HKPHQ9Assessment_assessmentWithDate_answers_metadata___block_invoke;
  v17[3] = &unk_1E37E6D68;
  v18 = v8;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___HKPHQ9Assessment;
  v17[0] = MEMORY[0x1E0C809B0];
  v13 = v8;
  objc_msgSendSuper2(&v16, sel_assessmentWithDate_type_score_metadata_config_, v10, v11, v12, v9, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __56__HKPHQ9Assessment_assessmentWithDate_answers_metadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v6[13];
  v6[13] = v4;

  v6[14] = +[HKPHQ9Assessment _riskForAnswers:](HKPHQ9Assessment, "_riskForAnswers:", *(_QWORD *)(a1 + 32));
}

+ (id)assessmentWithDate:(id)a3 answers:(id)a4
{
  return (id)objc_msgSend(a1, "assessmentWithDate:answers:metadata:", a3, a4, 0);
}

- (HKPHQ9Assessment)initWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  HKPHQ9Assessment *v6;

  +[HKPHQ9Assessment assessmentWithDate:answers:metadata:](HKPHQ9Assessment, "assessmentWithDate:answers:metadata:", a3, a4, a5);
  v6 = (HKPHQ9Assessment *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)_scoreForAnswers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "integerValue");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v3, "count") == 9)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == 4)
      v6 -= 4;
  }

  return v6;
}

+ (int64_t)_riskForAnswers:(id)a3
{
  unint64_t v3;
  int64_t v4;

  v3 = +[HKPHQ9Assessment _scoreForAnswers:](HKPHQ9Assessment, "_scoreForAnswers:", a3);
  if ((uint64_t)v3 < 5)
    return 1;
  if (v3 < 0xA)
    return 2;
  v4 = 4;
  if (v3 > 0x13)
    v4 = 5;
  if (v3 >= 0xF)
    return v4;
  else
    return 3;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKPHQ9Assessment;
  -[HKSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    -[HKPHQ9Assessment _validateAnswers:](self, "_validateAnswers:", self->_answers);

  return v5;
}

- (void)_validateAnswers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") != 9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ requires 9 answers."), objc_opt_class());
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "subarrayWithRange:", 0, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "integerValue") > 3 || objc_msgSend(v10, "integerValue") < 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("%@ answer for questions #1-8 must be on a scale of 0 to 3."), objc_opt_class());
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "integerValue") >= 5)
  {

LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ answer for questions #9 must be on a scale of 0 to 3 or unanswered."), objc_opt_class());
    goto LABEL_18;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (v13 < 0)
    goto LABEL_17;
LABEL_18:

}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKPHQ9Assessment;
  if (-[HKScoredAssessment isEquivalent:](&v8, sel_isEquivalent_, v4))
  {
    v5 = v4;
    if (-[NSArray isEqual:](self->_answers, "isEqual:", v5[13]))
      v6 = self->_risk == v5[14];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setAnswers:(id)a3
{
  objc_storeStrong((id *)&self->_answers, a3);
}

- (void)_setRisk:(int64_t)a3
{
  self->_risk = a3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKPHQ9Assessment;
  -[HKScoredAssessment description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample sampleType](self, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPHQ9Assessment answers](self, "answers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("type: %@, date: %@, answers: %@, score: %ld, risk: %ld"), v4, v5, v6, -[HKScoredAssessment score](self, "score"), -[HKPHQ9Assessment risk](self, "risk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKPHQ9Assessment;
  v4 = a3;
  -[HKScoredAssessment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_answers, CFSTR("Answers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_risk, CFSTR("Risk"));

}

- (HKPHQ9Assessment)initWithCoder:(id)a3
{
  id v4;
  HKPHQ9Assessment *v5;
  void *v6;
  uint64_t v7;
  NSArray *answers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKPHQ9Assessment;
  v5 = -[HKScoredAssessment initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("Answers"));
    v7 = objc_claimAutoreleasedReturnValue();
    answers = v5->_answers;
    v5->_answers = (NSArray *)v7;

    v5->_risk = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Risk"));
  }

  return v5;
}

- (NSArray)answers
{
  return self->_answers;
}

- (int64_t)risk
{
  return self->_risk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answers, 0);
}

@end
