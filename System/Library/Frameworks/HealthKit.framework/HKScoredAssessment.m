@implementation HKScoredAssessment

+ (id)assessmentWithDate:(id)a3 type:(id)a4 score:(int64_t)a5 metadata:(id)a6 config:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  int64_t v23;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  if (objc_msgSend(v13, "count"))
    v16 = v13;
  else
    v16 = 0;
  v21[1] = 3221225472;
  v21[2] = __68__HKScoredAssessment_assessmentWithDate_type_score_metadata_config___block_invoke;
  v21[3] = &unk_1E37F7A70;
  v22 = v12;
  v23 = a5;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___HKScoredAssessment;
  v21[0] = MEMORY[0x1E0C809B0];
  v17 = v12;
  v18 = objc_msgSendSuper2(&v20, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v14, v15, v15, 0, v16, v21);

  return v18;
}

uint64_t __68__HKScoredAssessment_assessmentWithDate_type_score_metadata_config___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 40);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKScoredAssessment;
  if (-[HKSample isEquivalent:](&v7, sel_isEquivalent_, v4))
    v5 = self->_score == v4[12];
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKSample sampleType](self, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type: %@, date: %@, score: %ld>"), v4, self, v5, v6, -[HKScoredAssessment score](self, "score"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v5.super_class = (Class)HKScoredAssessment;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_score, CFSTR("Score"), v5.receiver, v5.super_class);

}

- (HKScoredAssessment)initWithCoder:(id)a3
{
  id v4;
  HKScoredAssessment *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKScoredAssessment;
  v5 = -[HKSample initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_score = (int)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Score"));

  return v5;
}

- (int64_t)score
{
  return self->_score;
}

- (void)_setScore:(int64_t)a3
{
  self->_score = a3;
}

@end
