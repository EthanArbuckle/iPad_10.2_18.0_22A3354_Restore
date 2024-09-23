@implementation CPLSimpleMerger

- (CPLSimpleMerger)initWithMergeBlock:(id)a3
{
  id v4;
  CPLSimpleMerger *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleMerger;
  v5 = -[CPLSimpleMerger init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1B5E08DC4](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (BOOL)mergeConflictsWithError:(id *)a3
{
  uint64_t (**block)(id, id *);

  block = (uint64_t (**)(id, id *))self->_block;
  if (block)
    return block[2](block, a3);
  else
    return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
