@implementation ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles;
  -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles dealloc](&v3, sel_dealloc);
}

- (unint64_t)stylesCount
{
  return self->_styles.count;
}

- (int)styles
{
  return self->_styles.list;
}

- (void)clearStyles
{
  PBRepeatedInt32Clear();
}

- (void)addStyles:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)stylesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_styles;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_styles = &self->_styles;
  count = self->_styles.count;
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
  return p_styles->list[a3];
}

- (void)setStyles:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
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
  v8.super_class = (Class)ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles;
  -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles dictionaryRepresentation](self, "dictionaryRepresentation");
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
  PBRepeatedInt32NSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("styles"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionPreferredVictoryBadgeStylesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_styles;
  unint64_t v4;

  p_styles = &self->_styles;
  if (self->_styles.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_styles->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles stylesCount](self, "stylesCount"))
  {
    objc_msgSend(v7, "clearStyles");
    v4 = -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles stylesCount](self, "stylesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addStyles:", -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles stylesAtIndex:](self, "stylesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "stylesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles addStyles:](self, "addStyles:", objc_msgSend(v7, "stylesAtIndex:", i));
  }

}

@end
