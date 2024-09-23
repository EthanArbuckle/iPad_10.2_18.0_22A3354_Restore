@implementation TextSequenceTrain

- (TextSequenceTrain)init
{

  return 0;
}

- (TextSequenceTrain)initWithLength:(unint64_t)a3
{
  TextSequenceTrain *v4;
  uint64_t v5;
  NSMutableArray *sequence;
  uint64_t v7;
  NSMutableArray *target;
  uint64_t v9;
  NSMutableArray *mask;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TextSequenceTrain;
  v4 = -[TextSequenceTrain init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    sequence = v4->_sequence;
    v4->_sequence = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    target = v4->_target;
    v4->_target = (NSMutableArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    mask = v4->_mask;
    v4->_mask = (NSMutableArray *)v9;

  }
  return v4;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  NSMutableArray *sequence;
  id v4;

  sequence = self->_sequence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sequence, "addObject:");

}

- (void)addWordWithInputId:(unint64_t)a3 target:(unint64_t)a4 mask:(unint64_t)a5
{
  NSMutableArray *target;
  NSMutableArray *mask;
  id v10;
  id v11;

  -[TextSequenceTrain addWordWithInputId:](self, "addWordWithInputId:", a3);
  target = self->_target;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](target, "addObject:");

  mask = self->_mask;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mask, "addObject:");

}

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (id)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
