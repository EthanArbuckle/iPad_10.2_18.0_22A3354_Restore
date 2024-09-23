@implementation TextSequenceInference

- (TextSequenceInference)init
{

  return 0;
}

- (TextSequenceInference)initWithLength:(unint64_t)a3
{
  TextSequenceInference *v4;
  uint64_t v5;
  NSMutableArray *sequence;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TextSequenceInference;
  v4 = -[TextSequenceInference init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    sequence = v4->_sequence;
    v4->_sequence = (NSMutableArray *)v5;

  }
  return v4;
}

- (TextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4
{
  TextSequenceInference *v6;
  NSMutableArray *sequence;
  void *v8;
  uint64_t v9;
  NSNumber *target;

  v6 = -[TextSequenceInference initWithLength:](self, "initWithLength:");
  if (v6)
  {
    for (; a3; --a3)
    {
      sequence = v6->_sequence;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](sequence, "addObject:", v8);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    target = v6->_target;
    v6->_target = (NSNumber *)v9;

  }
  return v6;
}

- (void)resetWithBOS:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  NSNumber *v7;
  NSNumber *target;

  if (-[NSMutableArray count](self->_sequence, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](self->_sequence, "setObject:atIndexedSubscript:", v6, v5);

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_sequence, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  target = self->_target;
  self->_target = v7;

}

- (void)addWordWithInputId:(unint64_t)a3
{
  NSNumber *v5;
  NSNumber *target;

  if (-[NSMutableArray count](self->_sequence, "count"))
  {
    -[NSMutableArray addObject:](self->_sequence, "addObject:", self->_target);
    -[NSMutableArray removeObjectAtIndex:](self->_sequence, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    target = self->_target;
    self->_target = v5;

  }
}

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
