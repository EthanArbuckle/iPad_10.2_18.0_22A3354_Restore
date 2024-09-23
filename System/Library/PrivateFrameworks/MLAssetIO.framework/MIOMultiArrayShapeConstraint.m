@implementation MIOMultiArrayShapeConstraint

- (MIOMultiArrayShapeConstraint)init
{
  MIOMultiArrayShapeConstraint *v2;
  MIOMultiArrayShapeConstraint *v3;
  NSArray *sizeRangeForDimension;
  NSArray *v5;
  NSOrderedSet *v6;
  NSOrderedSet *shapeSet;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MIOMultiArrayShapeConstraint;
  v2 = -[MIOMultiArrayShapeConstraint init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    sizeRangeForDimension = v2->_sizeRangeForDimension;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_type = 1;
    v2->_sizeRangeForDimension = v5;

    v6 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    shapeSet = v3->_shapeSet;
    v3->_shapeSet = v6;

  }
  return v3;
}

- (MIOMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3
{
  id v4;
  MIOMultiArrayShapeConstraint *v5;
  MIOMultiArrayShapeConstraint *v6;
  uint64_t v7;
  NSArray *sizeRangeForDimension;
  NSOrderedSet *v9;
  NSOrderedSet *shapeSet;

  v4 = a3;
  v5 = -[MIOMultiArrayShapeConstraint init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    v7 = objc_msgSend(v4, "copy");
    sizeRangeForDimension = v6->_sizeRangeForDimension;
    v6->_sizeRangeForDimension = (NSArray *)v7;

    v9 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    shapeSet = v6->_shapeSet;
    v6->_shapeSet = v9;

  }
  return v6;
}

- (MIOMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3
{
  id v4;
  MIOMultiArrayShapeConstraint *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSOrderedSet *shapeSet;
  NSOrderedSet *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  NSOrderedSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSArray *v28;
  uint64_t k;
  void *v30;
  NSArray *sizeRangeForDimension;
  id v33;
  MIOMultiArrayShapeConstraint *v34;
  _QWORD v35[6];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MIOMultiArrayShapeConstraint init](self, "init");
  v34 = v5;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        if (v5)
        {
          v5->_type = 2;
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
          v8 = objc_claimAutoreleasedReturnValue();
          v33 = v4;
          shapeSet = v5->_shapeSet;
          v5->_shapeSet = (NSOrderedSet *)v8;

          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v10 = v5->_shapeSet;
          v11 = 0;
          v12 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v41 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                if (v11 <= objc_msgSend(v15, "count", v33))
                  v11 = objc_msgSend(v15, "count");
              }
              v12 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            }
            while (v12);
          }

          v16 = malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
          v17 = malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
          v18 = v17;
          if (v11)
          {
            v19 = v16;
            v20 = v17;
            v21 = v11;
            do
            {
              *v19++ = -1;
              *v20++ = 0;
              --v21;
            }
            while (v21);
          }
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v22 = v5->_shapeSet;
          v23 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v37;
            v25 = MEMORY[0x1E0C809B0];
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v37 != v24)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                v35[0] = v25;
                v35[1] = 3221225472;
                v35[2] = __57__MIOMultiArrayShapeConstraint_initWithEnumeratedShapes___block_invoke;
                v35[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
                v35[4] = v16;
                v35[5] = v18;
                objc_msgSend(v27, "enumerateObjectsUsingBlock:", v35, v33);
              }
              v23 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v23);
          }

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
          v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            for (k = 0; k != v11; ++k)
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v33);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray setObject:atIndexedSubscript:](v28, "setObject:atIndexedSubscript:", v30, k);

            }
          }
          sizeRangeForDimension = v34->_sizeRangeForDimension;
          v34->_sizeRangeForDimension = v28;

          free(v16);
          free(v18);
          v4 = v33;
        }
      }
    }
  }

  return v34;
}

void __57__MIOMultiArrayShapeConstraint_initWithEnumeratedShapes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3);
  v12 = v5;
  if (v6 >= objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v8 = objc_msgSend(v12, "unsignedIntegerValue");
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 8 * a3);
  }
  *(_QWORD *)(v7 + 8 * a3) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3);
  if (v9 <= objc_msgSend(v12, "unsignedIntegerValue"))
  {
    v11 = objc_msgSend(v12, "unsignedIntegerValue");
    v10 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 8 * a3);
  }
  *(_QWORD *)(v10 + 8 * a3) = v11;

}

- (MIOMultiArrayShapeConstraint)initWithSpecification:(const void *)a3
{
  int v5;
  CoreML::Specification::ArrayFeatureType_EnumeratedShapes *v6;
  CoreML::Specification::ArrayFeatureType_ShapeRange *v7;
  uint64_t *v8;
  CoreML::Specification::ArrayFeatureType_ShapeRange *v9;
  uint64_t *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  MIOMultiArrayShapeConstraint *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  MIOMultiArrayShapeConstraint *v31;

  v5 = *((_DWORD *)a3 + 15);
  if (v5 == 31)
  {
    v9 = (CoreML::Specification::ArrayFeatureType_ShapeRange *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v9;
    if (*((_DWORD *)a3 + 15) == 31)
      v10 = (uint64_t *)*((_QWORD *)a3 + 5);
    else
      v10 = CoreML::Specification::ArrayFeatureType_ShapeRange::default_instance(v9);
    v23 = v10[4];
    if (v23)
      v24 = v23 + 8;
    else
      v24 = 0;
    v25 = *((int *)v10 + 6);
    if ((_DWORD)v25)
    {
      v26 = 8 * v25;
      do
      {
        if (*(uint64_t *)(*(_QWORD *)v24 + 24) <= 0)
          v27 = -1;
        else
          v27 = *(_QWORD *)(*(_QWORD *)v24 + 24);
        v28 = MIOMakeRange(*(_QWORD *)(*(_QWORD *)v24 + 16), v27);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithMIORange:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreML::Specification::ArrayFeatureType_ShapeRange addObject:](v7, "addObject:", v30);

        v24 += 8;
        v26 -= 8;
      }
      while (v26);
    }
    v22 = -[MIOMultiArrayShapeConstraint initWithSizeRangeForDimension:](self, "initWithSizeRangeForDimension:", v7);
  }
  else
  {
    if (v5 != 21)
      return -[MIOMultiArrayShapeConstraint init](self, "init");
    v6 = (CoreML::Specification::ArrayFeatureType_EnumeratedShapes *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v6;
    if (*((_DWORD *)a3 + 15) == 21)
      v8 = (uint64_t *)*((_QWORD *)a3 + 5);
    else
      v8 = CoreML::Specification::ArrayFeatureType_EnumeratedShapes::default_instance(v6);
    v12 = v8[4];
    if (v12)
      v13 = (uint64_t *)(v12 + 8);
    else
      v13 = 0;
    v14 = *((int *)v8 + 6);
    if ((_DWORD)v14)
    {
      v15 = &v13[v14];
      do
      {
        v16 = *v13;
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v18 = *(_QWORD *)(v16 + 24);
        if (v18)
          v19 = (_QWORD *)(v18 + 8);
        else
          v19 = 0;
        if (v18)
          v20 = v18 + 8 + 8 * *(int *)(v16 + 16);
        else
          v20 = 0;
        while (v19 != (_QWORD *)v20)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v21);

          ++v19;
        }
        -[CoreML::Specification::ArrayFeatureType_ShapeRange addObject:](v7, "addObject:", v17);

        ++v13;
      }
      while (v13 != v15);
    }
    v22 = -[MIOMultiArrayShapeConstraint initWithEnumeratedShapes:](self, "initWithEnumeratedShapes:", v7);
  }
  v31 = v22;

  return v31;
}

- (NSArray)enumeratedShapes
{
  return -[NSOrderedSet array](self->_shapeSet, "array");
}

- (id)description
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = -[MIOMultiArrayShapeConstraint type](self, "type");
  v5 = CFSTR("unspecified");
  if (v4 == 3)
    v5 = CFSTR("ranges");
  if (v4 == 2)
    v5 = CFSTR("enumerated");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("MIOMultiArrayShapeConstraint (%@) "), v5);
  if (-[MIOMultiArrayShapeConstraint type](self, "type") == 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MIOMultiArrayShapeConstraint enumeratedShapes](self, "enumeratedShapes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "componentsJoinedByString:", CFSTR(", "));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("(%@) "), v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
LABEL_22:

    return v6;
  }
  if (-[MIOMultiArrayShapeConstraint type](self, "type") == 3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MIOMultiArrayShapeConstraint sizeRangeForDimension](self, "sizeRangeForDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v7);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "MIORangeValue");
          objc_msgSend(v6, "appendFormat:", CFSTR("[%zd, %zd] "), v15, v16);
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }
    goto LABEL_22;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MIOMultiArrayShapeConstraint *v4;
  MIOMultiArrayShapeConstraint *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = (MIOMultiArrayShapeConstraint *)a3;
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
      v6 = -[MIOMultiArrayShapeConstraint type](self, "type");
      if (v6 == -[MIOMultiArrayShapeConstraint type](v5, "type"))
      {
        if (-[MIOMultiArrayShapeConstraint type](self, "type") == 2)
        {
          -[MIOMultiArrayShapeConstraint enumeratedShapes](self, "enumeratedShapes");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIOMultiArrayShapeConstraint enumeratedShapes](v5, "enumeratedShapes");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "isEqual:", v8);
        }
        else
        {
          if (-[MIOMultiArrayShapeConstraint type](self, "type") != 3)
          {
            v10 = 1;
            goto LABEL_13;
          }
          -[MIOMultiArrayShapeConstraint sizeRangeForDimension](self, "sizeRangeForDimension");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIOMultiArrayShapeConstraint sizeRangeForDimension](v5, "sizeRangeForDimension");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "isEqual:", v8);
        }
        v10 = v9;

      }
      else
      {
        v10 = 0;
      }
LABEL_13:

      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[MIOMultiArrayShapeConstraint type](self, "type");
  -[MIOMultiArrayShapeConstraint enumeratedShapes](self, "enumeratedShapes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[MIOMultiArrayShapeConstraint sizeRangeForDimension](self, "sizeRangeForDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v3 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)sizeRangeForDimension
{
  return self->_sizeRangeForDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeRangeForDimension, 0);
  objc_storeStrong((id *)&self->_shapeSet, 0);
}

@end
