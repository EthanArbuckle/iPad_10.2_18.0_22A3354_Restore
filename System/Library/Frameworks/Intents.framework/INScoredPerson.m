@implementation INScoredPerson

- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  INScoredPerson *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    if (v9 < 1.0)
      v10 = 2;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = -[INScoredPerson initWithPerson:score:recommendation:](self, "initWithPerson:score:recommendation:", v6, v8, v10);

  return v11;
}

- (INScoredPerson)initWithPerson:(id)a3 recommendation:(int64_t)a4
{
  double v6;
  void *v7;
  id v8;
  void *v9;
  INScoredPerson *v10;

  if (a4)
    v6 = 0.5;
  else
    v6 = 1.0;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[INScoredPerson initWithPerson:score:recommendation:](self, "initWithPerson:score:recommendation:", v8, v9, a4);

  return v10;
}

- (INScoredPerson)initWithPerson:(id)a3 score:(id)a4 recommendation:(int64_t)a5
{
  id v8;
  id v9;
  INScoredPerson *v10;
  uint64_t v11;
  INPerson *person;
  uint64_t v13;
  NSNumber *score;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)INScoredPerson;
  v10 = -[INScoredPerson init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    person = v10->_person;
    v10->_person = (INPerson *)v11;

    v13 = objc_msgSend(v9, "copy");
    score = v10->_score;
    v10->_score = (NSNumber *)v13;

    v10->_recommendation = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[INPerson hash](self->_person, "hash");
  return -[NSNumber hash](self->_score, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  INPerson *person;
  NSNumber *score;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    person = self->_person;
    v8 = (person == (INPerson *)v5[1] || -[INPerson isEqual:](person, "isEqual:"))
      && ((score = self->_score, score == (NSNumber *)v5[2]) || -[NSNumber isEqual:](score, "isEqual:"))
      && self->_recommendation == v5[3];

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  INPerson *person;
  id v5;

  person = self->_person;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", person, CFSTR("person"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("score"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recommendation, CFSTR("recommendation"));

}

- (INScoredPerson)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  INScoredPerson *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("person"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recommendation"));

  v8 = -[INScoredPerson initWithPerson:score:recommendation:](self, "initWithPerson:score:recommendation:", v5, v6, v7);
  return v8;
}

- (id)description
{
  return -[INScoredPerson descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INScoredPerson;
  -[INScoredPerson description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INScoredPerson _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INPerson *person;
  void *v4;
  NSNumber *score;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("person");
  person = self->_person;
  v4 = person;
  if (!person)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("score");
  score = self->_score;
  v6 = score;
  if (!score)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = CFSTR("recommendation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_recommendation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!score)
  {

    if (person)
      return v8;
LABEL_9:

    return v8;
  }
  if (!person)
    goto LABEL_9;
  return v8;
}

- (INPerson)person
{
  return self->_person;
}

- (NSNumber)score
{
  return self->_score;
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
