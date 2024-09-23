@implementation MIOStateConstraint

- (MIOStateConstraint)initWithSpecification:(const void *)a3
{
  char *v4;
  MIOStateConstraint *v5;
  CoreML::Specification::ArrayFeatureType *v6;
  NSArray *v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  NSArray *bufferShape;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MIOStateConstraint;
  v4 = -[MIOStateConstraint init](&v15, sel_init);
  v5 = (MIOStateConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::StateFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    v6 = (CoreML::Specification::ArrayFeatureType *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = (NSArray *)v6;
    if (*((_DWORD *)a3 + 7) == 1)
      v8 = (uint64_t *)*((_QWORD *)a3 + 2);
    else
      v8 = CoreML::Specification::ArrayFeatureType::default_instance(v6);
    v9 = v8[3];
    if (v9)
      v10 = (_QWORD *)(v9 + 8);
    else
      v10 = 0;
    if (v9)
      v11 = v9 + 8 + 8 * *((int *)v8 + 4);
    else
      v11 = 0;
    for (; v10 != (_QWORD *)v11; ++v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v7, "addObject:", v12);

    }
    bufferShape = v5->_bufferShape;
    v5->_bufferShape = v7;

  }
  return v5;
}

- (const)stateFeatureTypeSpecification
{
  return &self->_stateFeatureTypeParams;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIOStateConstraint bufferShape](self, "bufferShape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MIOMultiArrayDataTypeToString(-[MIOStateConstraint dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MIOStateConstraint { bufferShape: [%@] dataType: %@ }"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  MIOStateConstraint *v4;
  MIOStateConstraint *v5;
  void *v6;
  void *v7;
  char v8;
  int64_t v9;
  BOOL v10;

  v4 = (MIOStateConstraint *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOStateConstraint bufferShape](self, "bufferShape");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOStateConstraint bufferShape](v5, "bufferShape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = -[MIOStateConstraint dataType](self, "dataType");
        v10 = v9 == -[MIOStateConstraint dataType](v5, "dataType");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MIOStateConstraint bufferShape](self, "bufferShape", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return -[MIOStateConstraint dataType](self, "dataType") ^ v6;
}

- (int64_t)dataType
{
  uint64_t *arraytype;
  int64_t result;
  int v4;

  if (self->_stateFeatureTypeParams._oneof_case_[0] == 1)
    arraytype = (uint64_t *)self->_stateFeatureTypeParams.Type_.arraytype_;
  else
    arraytype = CoreML::Specification::ArrayFeatureType::default_instance((CoreML::Specification::ArrayFeatureType *)self);
  result = 65600;
  v4 = *((_DWORD *)arraytype + 9);
  if (v4 > 65599)
  {
    if (v4 == 131104)
      return 131104;
  }
  else if (v4 == 65552)
  {
    return 65552;
  }
  else if (v4 == 65568)
  {
    return 65568;
  }
  return result;
}

- (NSArray)bufferShape
{
  return self->_bufferShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferShape, 0);
  CoreML::Specification::StateFeatureType::~StateFeatureType((CoreML::Specification::StateFeatureType *)&self->_stateFeatureTypeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::StateFeatureType::StateFeatureType((CoreML::Specification::StateFeatureType *)&self->_stateFeatureTypeParams);
  return self;
}

@end
