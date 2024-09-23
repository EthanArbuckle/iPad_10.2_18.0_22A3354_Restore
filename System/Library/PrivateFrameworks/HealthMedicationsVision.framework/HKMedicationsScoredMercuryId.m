@implementation HKMedicationsScoredMercuryId

- (HKMedicationsScoredMercuryId)initWithMercuryId:(id)a3 score:(id)a4
{
  id v6;
  id v7;
  HKMedicationsScoredMercuryId *v8;
  HKMedicationsScoredMercuryId *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsScoredMercuryId;
  v8 = -[HKMedicationsScoredMercuryId init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKMedicationsScoredMercuryId setMercuryId:](v8, "setMercuryId:", v6);
    -[HKMedicationsScoredMercuryId setScore:](v9, "setScore:", v7);
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_mercuryId, "hash");
  return -[NSNumber hash](self->_score, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationsScoredMercuryId *v4;
  HKMedicationsScoredMercuryId *v5;
  NSNumber *mercuryId;
  void *v7;
  NSNumber *score;
  void *v9;
  char v10;

  v4 = (HKMedicationsScoredMercuryId *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      mercuryId = self->_mercuryId;
      -[HKMedicationsScoredMercuryId mercuryId](v5, "mercuryId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSNumber isEqual:](mercuryId, "isEqual:", v7))
      {
        score = self->_score;
        -[HKMedicationsScoredMercuryId score](v5, "score");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSNumber isEqual:](score, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mercury ID: %@ - Score: %@"), self->_mercuryId, self->_score);
}

- (NSNumber)mercuryId
{
  return self->_mercuryId;
}

- (void)setMercuryId:(id)a3
{
  objc_storeStrong((id *)&self->_mercuryId, a3);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_mercuryId, 0);
}

@end
