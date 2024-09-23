@implementation SetChange

- (id)initAsInsertAllWithIndexes:(id)a3
{
  id v5;
  SetChange *v6;
  SetChange *v7;
  uint64_t v8;
  NSIndexSet *deletedIndexes;
  uint64_t v10;
  NSIndexSet *modifiedIndexes;
  uint64_t v12;
  NSSet *moves;
  SetChange *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SetChange;
  v6 = -[SetChange init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_insertedIndexes, a3);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v8 = objc_claimAutoreleasedReturnValue();
    deletedIndexes = v7->_deletedIndexes;
    v7->_deletedIndexes = (NSIndexSet *)v8;

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v10 = objc_claimAutoreleasedReturnValue();
    modifiedIndexes = v7->_modifiedIndexes;
    v7->_modifiedIndexes = (NSIndexSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    moves = v7->_moves;
    v7->_moves = (NSSet *)v12;

    v7->_empty = objc_msgSend(v5, "count") == 0;
    v7->_insertAll = objc_msgSend(v5, "count") != 0;
    v14 = v7;
  }

  return v7;
}

- (id)initAsDeleteAllWithIndexes:(id)a3
{
  id v5;
  SetChange *v6;
  uint64_t v7;
  NSIndexSet *insertedIndexes;
  uint64_t v9;
  NSIndexSet *modifiedIndexes;
  uint64_t v11;
  NSSet *moves;
  SetChange *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SetChange;
  v6 = -[SetChange init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v7 = objc_claimAutoreleasedReturnValue();
    insertedIndexes = v6->_insertedIndexes;
    v6->_insertedIndexes = (NSIndexSet *)v7;

    objc_storeStrong((id *)&v6->_deletedIndexes, a3);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = objc_claimAutoreleasedReturnValue();
    modifiedIndexes = v6->_modifiedIndexes;
    v6->_modifiedIndexes = (NSIndexSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    moves = v6->_moves;
    v6->_moves = (NSSet *)v11;

    v6->_empty = objc_msgSend(v5, "count") == 0;
    v6->_singleDelete = objc_msgSend(v5, "count") == 1;
    v6->_deleteAll = objc_msgSend(v5, "count") != 0;
    v13 = v6;
  }

  return v6;
}

- (SetChange)initWithInsertedIndexes:(id)a3 deletedIndexes:(id)a4 modifiedIndexes:(id)a5 moves:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SetChange *v15;
  SetChange *v16;
  BOOL v17;
  BOOL v18;
  SetChange *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SetChange;
  v15 = -[SetChange init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_insertedIndexes, a3);
    objc_storeStrong((id *)&v16->_deletedIndexes, a4);
    objc_storeStrong((id *)&v16->_modifiedIndexes, a5);
    objc_storeStrong((id *)&v16->_moves, a6);
    v17 = !objc_msgSend(v11, "count")
       && !objc_msgSend(v12, "count")
       && !objc_msgSend(v13, "count")
       && objc_msgSend(v14, "count") == 0;
    v16->_empty = v17;
    v18 = -[NSIndexSet count](v16->_deletedIndexes, "count") == 1
       && !-[NSIndexSet count](v16->_insertedIndexes, "count")
       && !-[NSIndexSet count](v16->_modifiedIndexes, "count")
       && -[NSSet count](v16->_moves, "count") == 0;
    v16->_singleDelete = v18;
    v19 = v16;
  }

  return v16;
}

+ (id)emptyChange
{
  if (emptyChange_onceToken != -1)
    dispatch_once(&emptyChange_onceToken, &__block_literal_global_70);
  return (id)emptyChange_instance;
}

void __24__SetChange_emptyChange__block_invoke()
{
  SetChange *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = [SetChange alloc];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SetChange initWithInsertedIndexes:deletedIndexes:modifiedIndexes:moves:](v0, "initWithInsertedIndexes:deletedIndexes:modifiedIndexes:moves:", v6, v1, v2, v3);
  v5 = (void *)emptyChange_instance;
  emptyChange_instance = v4;

}

- (BOOL)isEqual:(id)a3
{
  SetChange *v4;
  BOOL v5;

  v4 = (SetChange *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SetChange isEqualToChange:](self, "isEqualToChange:", v4);
  }

  return v5;
}

- (BOOL)isEqualToChange:(id)a3
{
  SetChange *v4;
  SetChange *v5;
  BOOL v6;

  v4 = (SetChange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && -[NSIndexSet isEqualToIndexSet:](self->_insertedIndexes, "isEqualToIndexSet:", v4->_insertedIndexes)
      && -[NSIndexSet isEqualToIndexSet:](self->_deletedIndexes, "isEqualToIndexSet:", v5->_deletedIndexes)
      && -[NSIndexSet isEqualToIndexSet:](self->_modifiedIndexes, "isEqualToIndexSet:", v5->_modifiedIndexes)
      && -[NSSet isEqualToSet:](self->_moves, "isEqualToSet:", v5->_moves);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSIndexSet hash](self->_insertedIndexes, "hash");
  v4 = -[NSIndexSet hash](self->_deletedIndexes, "hash") ^ v3;
  v5 = -[NSIndexSet hash](self->_modifiedIndexes, "hash");
  return v4 ^ v5 ^ -[NSSet hash](self->_moves, "hash");
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_empty)
    objc_msgSend(v3, "appendString:", CFSTR("; _empty=YES"));
  if (self->_singleDelete)
    objc_msgSend(v4, "appendString:", CFSTR("; _singleDelete=YES"));
  if (self->_deleteAll)
    objc_msgSend(v4, "appendString:", CFSTR("; _deleteAll=YES"));
  if (self->_insertAll)
    objc_msgSend(v4, "appendString:", CFSTR("; _insertAll=YES"));
  if (-[NSIndexSet count](self->_insertedIndexes, "count"))
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_insertedIndexes, (uint64_t)CFSTR("_insertedIndexes"), v4);
  if (-[NSIndexSet count](self->_deletedIndexes, "count"))
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_deletedIndexes, (uint64_t)CFSTR("_deletedIndexes"), v4);
  if (-[NSIndexSet count](self->_modifiedIndexes, "count"))
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_modifiedIndexes, (uint64_t)CFSTR("_modifiedIndexes"), v4);
  if (-[NSSet count](self->_moves, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(";\n_moves=%@"), self->_moves);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (void)_appendDescriptionForIndexSet:(uint64_t)a3 named:(void *)a4 toDescription:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a2;
  v7 = a4;
  v8 = v7;
  if (a1)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR(";\n%@=("), a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__SetChange__appendDescriptionForIndexSet_named_toDescription___block_invoke;
    v11[3] = &unk_1E9CFAC00;
    v9 = v8;
    v12 = v9;
    v13 = v10;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v11);
    objc_msgSend(v9, "appendString:", CFSTR(")"));

  }
}

unint64_t __63__SetChange__appendDescriptionForIndexSet_named_toDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %ld"), a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (a2 + 1 < result)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  return result;
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (NSIndexSet)deletedIndexes
{
  return self->_deletedIndexes;
}

- (NSIndexSet)modifiedIndexes
{
  return self->_modifiedIndexes;
}

- (NSSet)moves
{
  return self->_moves;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (BOOL)isSingleDelete
{
  return self->_singleDelete;
}

- (BOOL)isInsertAll
{
  return self->_insertAll;
}

- (BOOL)isDeleteAll
{
  return self->_deleteAll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moves, 0);
  objc_storeStrong((id *)&self->_modifiedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
}

@end
