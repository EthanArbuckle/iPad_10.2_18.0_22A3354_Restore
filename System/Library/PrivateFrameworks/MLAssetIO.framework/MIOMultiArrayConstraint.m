@implementation MIOMultiArrayConstraint

- (MIOMultiArrayConstraint)initWithSpecification:(const void *)a3
{
  id v4;
  MIOMultiArrayConstraint *v5;
  MIOMultiArrayShapeConstraint *v6;
  MIOMultiArrayShapeConstraint *shapeConstraint;
  MIOMultiArrayShapeConstraint *v8;
  NSArray *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSArray *shape;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)MIOMultiArrayConstraint;
  v4 = -[MIOMultiArrayConstraint init](&v27, sel_init);
  v5 = (MIOMultiArrayConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::ArrayFeatureType::CopyFrom((uint64_t *)v4 + 1, (const CoreML::Specification::ArrayFeatureType *)a3);
    v6 = -[MIOMultiArrayShapeConstraint initWithSpecification:]([MIOMultiArrayShapeConstraint alloc], "initWithSpecification:", a3);
    shapeConstraint = v5->_shapeConstraint;
    v5->_shapeConstraint = v6;

    v8 = v5->_shapeConstraint;
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *((_QWORD *)a3 + 3);
    if (v10)
      v11 = (_QWORD *)(v10 + 8);
    else
      v11 = 0;
    if (v10)
      v12 = v10 + 8 + 8 * *((int *)a3 + 4);
    else
      v12 = 0;
    for (; v11 != (_QWORD *)v12; ++v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v9, "addObject:", v13);

    }
    if (-[MIOMultiArrayShapeConstraint type](v8, "type") == 2)
    {
      if (-[NSArray count](v9, "count"))
        goto LABEL_25;
      -[MIOMultiArrayShapeConstraint enumeratedShapes](v8, "enumeratedShapes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count") == 0;

      if (v15)
        goto LABEL_25;
      -[MIOMultiArrayShapeConstraint enumeratedShapes](v8, "enumeratedShapes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mutableCopy");

      v9 = (NSArray *)v18;
    }
    else
    {
      if (-[MIOMultiArrayShapeConstraint type](v8, "type") != 3)
        goto LABEL_25;
      if (-[NSArray count](v9, "count"))
        goto LABEL_25;
      -[MIOMultiArrayShapeConstraint sizeRangeForDimension](v8, "sizeRangeForDimension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count") == 0;

      if (v20)
        goto LABEL_25;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[MIOMultiArrayShapeConstraint sizeRangeForDimension](v8, "sizeRangeForDimension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v16);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "MIORangeValue"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v9, "addObject:", v24);

          }
          v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v21);
      }
    }

LABEL_25:
    shape = v5->_shape;
    v5->_shape = v9;

  }
  return v5;
}

- (const)arrayFeatureTypeSpecification
{
  return &self->_arrayFeatureTypeParams;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIOMultiArrayConstraint shape](self, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MIOMultiArrayConstraint dataType](self, "dataType");
  v7 = CFSTR("unknown");
  v8 = CFSTR("Double");
  if (v6 != 65600)
    v8 = CFSTR("unknown");
  if (v6 == 131104)
    v9 = CFSTR("Int32");
  else
    v9 = v8;
  if (v6 == 65568)
    v7 = CFSTR("Float32");
  if (v6 == 65552)
    v7 = CFSTR("Float16");
  if (v6 <= 65599)
    v10 = v7;
  else
    v10 = v9;
  -[MIOMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MIOMultiArrayConstraint { shape: [%@] dataType: %@ shapeConstraint: %@ }"), v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  MIOMultiArrayConstraint *v4;
  MIOMultiArrayConstraint *v5;
  void *v6;
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;

  v4 = (MIOMultiArrayConstraint *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOMultiArrayConstraint shape](self, "shape");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOMultiArrayConstraint shape](v5, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = -[MIOMultiArrayConstraint dataType](self, "dataType");
        if (v9 == -[MIOMultiArrayConstraint dataType](v5, "dataType"))
        {
          -[MIOMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10
            && (-[MIOMultiArrayConstraint shapeConstraint](v5, "shapeConstraint"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v11,
                v10,
                v11))
          {
            -[MIOMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIOMultiArrayConstraint shapeConstraint](v5, "shapeConstraint");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if ((v14 & 1) != 0)
              goto LABEL_17;
          }
          else
          {
            -[MIOMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {

            }
            else
            {
              -[MIOMultiArrayConstraint shapeConstraint](v5, "shapeConstraint");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
LABEL_17:
                v15 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MIOMultiArrayConstraint shape](self, "shape", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  v8 = -[MIOMultiArrayConstraint dataType](self, "dataType");
  -[MIOMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  return v8 ^ v6 ^ v10;
}

- (int64_t)dataType
{
  int64_t result;
  int datatype;

  result = 65600;
  datatype = self->_arrayFeatureTypeParams.datatype_;
  if (datatype > 65599)
  {
    if (datatype == 131104)
      return 131104;
  }
  else if (datatype == 65552)
  {
    return 65552;
  }
  else if (datatype == 65568)
  {
    return 65568;
  }
  return result;
}

- (NSArray)shape
{
  return self->_shape;
}

- (MIOMultiArrayShapeConstraint)shapeConstraint
{
  return self->_shapeConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeConstraint, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  CoreML::Specification::ArrayFeatureType::~ArrayFeatureType((CoreML::Specification::ArrayFeatureType *)&self->_arrayFeatureTypeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::ArrayFeatureType::ArrayFeatureType((CoreML::Specification::ArrayFeatureType *)&self->_arrayFeatureTypeParams);
  return self;
}

@end
