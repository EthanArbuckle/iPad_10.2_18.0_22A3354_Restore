@implementation ICTuple

- (ICTuple)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v7;
  id v8;
  ICTuple *v9;
  ICTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTuple;
  v9 = -[ICTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_firstObject, a3);
    objc_storeStrong(&v10->_secondObject, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTuple firstObject](self, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTuple secondObject](self, "secondObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, firstObject: %@, secondObject: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  BOOL v23;

  if (a3 != self)
  {
    v4 = a3;
    v5 = objc_opt_class();
    ICDynamicCast(v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTuple firstObject](self, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v7)
      v10 = 0;
    else
      v10 = v7;
    v11 = v10;
    if (v9 == v8)
      v12 = 0;
    else
      v12 = v8;
    v13 = v12;
    if (v11 | v13)
    {
      v14 = (void *)v13;
      if (v11)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
      {
        v16 = 0;
LABEL_32:

LABEL_33:
        return v16;
      }
      v17 = objc_msgSend((id)v11, "isEqual:", v13);

      if (!v17)
      {
        v16 = 0;
        goto LABEL_33;
      }
    }
    -[ICTuple secondObject](self, "secondObject");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v11)
      v18 = 0;
    else
      v18 = (void *)v11;
    v19 = v18;
    if (v9 == v14)
      v20 = 0;
    else
      v20 = v14;
    v21 = v20;
    v22 = (void *)v21;
    if (v19 | v21)
    {
      if (v19)
        v23 = v21 == 0;
      else
        v23 = 1;
      if (v23)
        v16 = 0;
      else
        v16 = objc_msgSend((id)v19, "isEqual:", v21);
    }
    else
    {
      v16 = 1;
    }

    goto LABEL_32;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  result = self->_hash;
  if (!result)
  {
    -[ICTuple firstObject](self, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_opt_class();
      ICCheckedDynamicCast(v5, (uint64_t)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = ICHashWithArray(v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_opt_class();
        ICCheckedDynamicCast(v8, (uint64_t)v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = ICHashWithDictionary(v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_opt_class();
          ICCheckedDynamicCast(v9, (uint64_t)v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = ICHashWithSet(v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = objc_opt_class();
            ICCheckedDynamicCast(v10, (uint64_t)v4);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = ICHashWithOrderedSet(v6);
          }
          else
          {
            v11 = objc_msgSend(v4, "hash");
            if (v11)
              goto LABEL_13;
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v6, "hash");
          }
        }
      }
    }
    v11 = v7;

LABEL_13:
    -[ICTuple secondObject](self, "secondObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_opt_class();
      ICCheckedDynamicCast(v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = ICHashWithArray(v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_opt_class();
        ICCheckedDynamicCast(v16, (uint64_t)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = ICHashWithDictionary(v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = objc_opt_class();
          ICCheckedDynamicCast(v17, (uint64_t)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = ICHashWithSet(v14);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = objc_opt_class();
            ICCheckedDynamicCast(v18, (uint64_t)v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = ICHashWithOrderedSet(v14);
          }
          else
          {
            v19 = objc_msgSend(v12, "hash");
            v20 = v19;
            if (v19)
            {
LABEL_24:

              self->_hash = ICHashWithHashKeys(v11, v21, v22, v23, v24, v25, v26, v27, v20);
              return self->_hash;
            }
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "hash");
          }
        }
      }
    }
    v20 = v15;

    goto LABEL_24;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTuple *v4;
  void *v5;
  void *v6;
  ICTuple *v7;

  v4 = +[ICTuple allocWithZone:](ICTuple, "allocWithZone:", a3);
  -[ICTuple firstObject](self, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTuple secondObject](self, "secondObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICTuple initWithFirstObject:secondObject:](v4, "initWithFirstObject:secondObject:", v5, v6);

  return v7;
}

- (id)firstObject
{
  return self->_firstObject;
}

- (id)secondObject
{
  return self->_secondObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondObject, 0);
  objc_storeStrong(&self->_firstObject, 0);
}

@end
