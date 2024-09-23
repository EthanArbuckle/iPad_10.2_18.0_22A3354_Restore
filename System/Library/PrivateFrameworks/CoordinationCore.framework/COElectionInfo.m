@implementation COElectionInfo

- (COElectionInfo)initWithGeneration:(unint64_t)a3 ballot:(id)a4
{
  id v6;
  COElectionInfo *v7;
  COElectionInfo *v8;
  uint64_t v9;
  COBallot *ballot;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COElectionInfo;
  v7 = -[COElectionInfo init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_generation = a3;
    v9 = objc_msgSend(v6, "copy");
    ballot = v8->_ballot;
    v8->_ballot = (COBallot *)v9;

  }
  return v8;
}

- (COElectionInfo)initWithCommand:(id)a3
{
  id v4;
  COElectionInfo *v5;
  uint64_t v6;
  COBallot *ballot;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COElectionInfo;
  v5 = -[COElectionInfo init](&v9, sel_init);
  if (v5)
  {
    v5->_generation = objc_msgSend(v4, "generation");
    objc_msgSend(v4, "ballot");
    v6 = objc_claimAutoreleasedReturnValue();
    ballot = v5->_ballot;
    v5->_ballot = (COBallot *)v6;

  }
  return v5;
}

- (void)setBallot:(id)a3
{
  COBallot *v4;
  COBallot *ballot;
  COBallot *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BE19E30], "isSlimBallotsEnabled") & 1) != 0)
  {
    v4 = (COBallot *)objc_msgSend(v7, "mutableCopy");
    -[COBallot clearInsignificantCandidates](v4, "clearInsignificantCandidates");
    ballot = self->_ballot;
    self->_ballot = v4;
  }
  else
  {
    v6 = (COBallot *)v7;
    ballot = self->_ballot;
    self->_ballot = v6;
  }

}

- (id)leader
{
  void *v2;
  void *v3;
  void *v4;

  -[COElectionInfo ballot](self, "ballot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasGreaterGenerationThan:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[COElectionInfo generation](self, "generation");
  v6 = objc_msgSend(v4, "generation");

  return v5 > v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  COElectionInfo *v4;
  unint64_t v5;
  void *v6;
  COElectionInfo *v7;

  v4 = [COElectionInfo alloc];
  v5 = -[COElectionInfo generation](self, "generation");
  -[COElectionInfo ballot](self, "ballot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COElectionInfo initWithGeneration:ballot:](v4, "initWithGeneration:ballot:", v5, v6);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[COElectionInfo generation](self, "generation");
  -[COElectionInfo ballot](self, "ballot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  COElectionInfo *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (COElectionInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[COElectionInfo generation](self, "generation"), v5 == -[COElectionInfo generation](v4, "generation")))
    {
      -[COElectionInfo ballot](self, "ballot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[COElectionInfo ballot](v4, "ballot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToBallot:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasSameGenerationAndLeader:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[COElectionInfo generation](self, "generation");
  if (v5 == objc_msgSend(v4, "generation"))
  {
    -[COElectionInfo leader](self, "leader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (COBallot)ballot
{
  return self->_ballot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ballot, 0);
}

@end
