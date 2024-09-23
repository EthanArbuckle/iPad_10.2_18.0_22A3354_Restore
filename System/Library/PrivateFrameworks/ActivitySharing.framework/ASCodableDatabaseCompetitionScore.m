@implementation ASCodableDatabaseCompetitionScore

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableDatabaseCompetitionScore;
  -[ASCodableDatabaseCompetitionScore dealloc](&v3, sel_dealloc);
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (int64_t)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
  PBRepeatedInt64Clear();
}

- (void)addScores:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)scoresAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_scores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scores = &self->_scores;
  count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scores->list[a3];
}

- (void)setScores:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetitionScore;
  -[ASCodableDatabaseCompetitionScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableDatabaseCompetitionScore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt64NSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("scores"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $A58966F474337DCABE012981F76706F5 *p_scores;
  unint64_t v4;

  p_scores = &self->_scores;
  if (self->_scores.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v4;
    }
    while (v4 < p_scores->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[ASCodableDatabaseCompetitionScore scoresCount](self, "scoresCount"))
  {
    objc_msgSend(v7, "clearScores");
    v4 = -[ASCodableDatabaseCompetitionScore scoresCount](self, "scoresCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addScores:", -[ASCodableDatabaseCompetitionScore scoresAtIndex:](self, "scoresAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedInt64IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "scoresCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[ASCodableDatabaseCompetitionScore addScores:](self, "addScores:", objc_msgSend(v7, "scoresAtIndex:", i));
  }

}

@end
