@implementation CLSOutputClue

- (CLSOutputClue)init
{
  CLSOutputClue *v2;
  uint64_t v3;
  NSMutableArray *relatedInputLocationClues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSOutputClue;
  v2 = -[CLSClue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    relatedInputLocationClues = v2->_relatedInputLocationClues;
    v2->_relatedInputLocationClues = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRelatedInputLocationClues:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_relatedInputLocationClues, "addObjectsFromArray:", a3);
}

- (id)relatedInputLocationClues
{
  return (id)-[NSMutableArray copy](self->_relatedInputLocationClues, "copy");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)CLSOutputClue;
  -[CLSClue description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableArray count](self->_relatedInputLocationClues, "count"))
  {
    -[NSMutableArray valueForKeyPath:](self->_relatedInputLocationClues, "valueForKeyPath:", CFSTR("address"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flattenWithSeparator:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\trelatedLocation:[%@]"), v7);

  }
  if (self->_relatedPerson)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\trelatedPerson:[%@]"), self->_relatedPerson);
  return v5;
}

- (CLSPersonIdentity)relatedPerson
{
  return (CLSPersonIdentity *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRelatedPerson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPerson, 0);
  objc_storeStrong((id *)&self->_relatedInputLocationClues, 0);
}

@end
