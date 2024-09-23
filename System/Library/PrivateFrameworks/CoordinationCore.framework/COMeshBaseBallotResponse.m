@implementation COMeshBaseBallotResponse

- (COMeshBaseBallotResponse)initWithBallot:(id)a3 generation:(unint64_t)a4
{
  id v6;
  COMeshBaseBallotResponse *v7;
  uint64_t v8;
  COBallot *ballot;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMeshBaseBallotResponse;
  v7 = -[COMeshCommand init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    ballot = v7->_ballot;
    v7->_ballot = (COBallot *)v8;

    v7->_generation = a4;
    v7->_variant = 1;
  }

  return v7;
}

- (COMeshBaseBallotResponse)initWithBallot:(id)a3 generation:(unint64_t)a4 variant:(int64_t)a5
{
  COMeshBaseBallotResponse *result;

  result = -[COMeshBaseBallotResponse initWithBallot:generation:](self, "initWithBallot:generation:", a3, a4);
  if (result)
    result->_variant = a5;
  return result;
}

- (COMeshBaseBallotResponse)initWithCoder:(id)a3
{
  id v4;
  COMeshBaseBallotResponse *v5;
  uint64_t v6;
  COBallot *ballot;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COMeshBaseBallotResponse;
  v5 = -[COMeshResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ballot"));
    v6 = objc_claimAutoreleasedReturnValue();
    ballot = v5->_ballot;
    v5->_ballot = (COBallot *)v6;

    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variant"));
    v5->_variant = v8;
    if (v8)
      v5->_generation = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("generation"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)COMeshBaseBallotResponse;
  -[COMeshResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[COMeshBaseBallotResponse ballot](self, "ballot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ballot"));

  v6 = -[COMeshBaseBallotResponse variant](self, "variant");
  objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("variant"));
  if (v6)
    objc_msgSend(v4, "encodeInt64:forKey:", -[COMeshBaseBallotResponse generation](self, "generation"), CFSTR("generation"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COBallot)ballot
{
  return self->_ballot;
}

- (void)setBallot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)generation
{
  return self->_generation;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ballot, 0);
}

@end
