@implementation MLMultiArrayShapeConstraint

- (MLMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MLMultiArrayShapeConstraint *v8;
  MLMultiArrayShapeConstraint *v9;
  uint64_t v10;
  NSOrderedSet *shapeSet;
  NSOrderedSet *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  MLMultiArrayShapeConstraint *v19;
  MLMultiArrayShapeConstraint *v20;
  void *v22;
  void *v23;
  NSArray *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  MLMultiArrayShapeConstraint *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  uint64_t j;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSArray *v67;
  NSArray *sizeRangeForDimension;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSArray *v76;
  void *v77;
  void *v78;
  MLMultiArrayShapeConstraint *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "count")
    && (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v84.receiver = self;
    v84.super_class = (Class)MLMultiArrayShapeConstraint;
    v8 = -[MLMultiArrayShapeConstraint init](&v84, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_type = 2;
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      shapeSet = v9->_shapeSet;
      v9->_shapeSet = (NSOrderedSet *)v10;

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v12 = v9->_shapeSet;
      v13 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v81 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            if (v15 <= objc_msgSend(v18, "count"))
              v15 = objc_msgSend(v18, "count");
          }
          v14 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
      v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v70 = v15;
      if (v15)
      {
        v25 = v15;
        do
        {
          objc_msgSend(v22, "addObject:", &unk_1E3DA2008);
          objc_msgSend(v23, "addObject:", &unk_1E3DA2008);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v24, "addObject:", v26);

          --v25;
        }
        while (v25);
      }
      if (!-[NSOrderedSet count](v9->_shapeSet, "count"))
      {
        sizeRangeForDimension = v9->_sizeRangeForDimension;
        v9->_sizeRangeForDimension = v24;

        v20 = v9;
        goto LABEL_17;
      }
      v69 = v5;
      -[NSOrderedSet objectAtIndexedSubscript:](v9->_shapeSet, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28)
      {
        v29 = 0;
        do
        {
          -[NSOrderedSet objectAtIndexedSubscript:](v9->_shapeSet, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:atIndexedSubscript:", v31, v29);

          objc_msgSend(v22, "objectAtIndexedSubscript:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:atIndexedSubscript:", v32, v29);

          ++v29;
          -[NSOrderedSet objectAtIndexedSubscript:](v9->_shapeSet, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

        }
        while (v29 < v34);
      }
      v77 = v22;
      if (-[NSOrderedSet count](v9->_shapeSet, "count") >= 2)
      {
        v35 = 1;
        v79 = v9;
        v76 = v24;
        do
        {
          v71 = v35;
          -[NSOrderedSet objectAtIndexedSubscript:](v9->_shapeSet, "objectAtIndexedSubscript:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37)
          {
            v38 = 0;
            do
            {
              v39 = (void *)MEMORY[0x1E0CB37E8];
              -[NSOrderedSet objectAtIndexedSubscript:](v9->_shapeSet, "objectAtIndexedSubscript:", 0);
              v40 = v9;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectAtIndexedSubscript:", v38);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "unsignedIntegerValue");
              objc_msgSend(v77, "objectAtIndexedSubscript:", v38);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "unsignedIntegerValue");
              if (v43 >= v45)
              {
                objc_msgSend(v77, "objectAtIndexedSubscript:", v38);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v46;
              }
              else
              {
                -[NSOrderedSet objectAtIndexedSubscript:](v40->_shapeSet, "objectAtIndexedSubscript:", 0);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectAtIndexedSubscript:", v38);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v46;
                v47 = v78;
              }
              objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v46, "unsignedIntegerValue"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "setObject:atIndexedSubscript:", v48, v38);

              v78 = v47;
              v49 = v47;
              if (v43 < v45)
              {

                v49 = v74;
              }

              v50 = (void *)MEMORY[0x1E0CB37E8];
              -[NSOrderedSet objectAtIndexedSubscript:](v79->_shapeSet, "objectAtIndexedSubscript:", 0);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "objectAtIndexedSubscript:", v38);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "unsignedIntegerValue");
              objc_msgSend(v23, "objectAtIndexedSubscript:", v38);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "unsignedIntegerValue");
              if (v53 <= v55)
              {
                objc_msgSend(v23, "objectAtIndexedSubscript:", v38);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = (unint64_t)v56;
              }
              else
              {
                -[NSOrderedSet objectAtIndexedSubscript:](v79->_shapeSet, "objectAtIndexedSubscript:", 0);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "objectAtIndexedSubscript:", v38);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v56;
              }
              v24 = v76;
              objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v56, "unsignedIntegerValue"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:atIndexedSubscript:", v57, v38);

              v58 = (void *)v15;
              if (v53 > v55)
              {

                v58 = v75;
              }

              ++v38;
              v9 = v79;
              -[NSOrderedSet objectAtIndexedSubscript:](v79->_shapeSet, "objectAtIndexedSubscript:", 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "count");

            }
            while (v38 < v60);
          }
          v35 = v71 + 1;
        }
        while (v71 + 1 < -[NSOrderedSet count](v9->_shapeSet, "count"));
      }
      if (v70)
      {
        for (j = 0; j != v70; ++j)
        {
          objc_msgSend(v77, "objectAtIndexedSubscript:", j);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "unsignedIntegerValue");

          objc_msgSend(v23, "objectAtIndexedSubscript:", j);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v63, v65 - v63 + 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray setObject:atIndexedSubscript:](v24, "setObject:atIndexedSubscript:", v66, j);

        }
      }
      v67 = v9->_sizeRangeForDimension;
      v9->_sizeRangeForDimension = v24;

      v5 = v69;
    }
    v19 = v9;
  }
  else
  {
    v19 = (MLMultiArrayShapeConstraint *)-[MLMultiArrayShapeConstraint initUnspecified](self, "initUnspecified");
  }
  v20 = v19;
LABEL_17:

  return v20;
}

- (MLMultiArrayShapeConstraintType)type
{
  return self->_type;
}

- (id)initUnspecified
{
  MLMultiArrayShapeConstraint *v2;
  MLMultiArrayShapeConstraint *v3;
  NSArray *sizeRangeForDimension;
  NSArray *v5;
  NSOrderedSet *v6;
  NSOrderedSet *shapeSet;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLMultiArrayShapeConstraint;
  v2 = -[MLMultiArrayShapeConstraint init](&v9, sel_init);
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

- (NSArray)enumeratedShapes
{
  return -[NSOrderedSet array](self->_shapeSet, "array");
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t type;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = v6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  type = self->_type;
  if (type == 2)
  {
    if (-[NSOrderedSet containsObject:](self->_shapeSet, "containsObject:", v6))
      goto LABEL_18;
    if (a4)
    {
      -[MLMultiArrayShapeConstraint enumeratedShapes](self, "enumeratedShapes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 != 1)
      {
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" x "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MultiArray Shape (%@) was not in enumerated set of allowed shapes"), v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" x "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLMultiArrayShapeConstraint enumeratedShapes](self, "enumeratedShapes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" x "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MultiArray shape (%@) does not match the shape (%@) specified in the model description"), v12, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_16:

    }
LABEL_17:
    *((_BYTE *)v26 + 24) = 0;
    goto LABEL_18;
  }
  if (type != 3)
    goto LABEL_18;
  v9 = objc_msgSend(v6, "count");
  if (v9 != -[NSArray count](self->_sizeRangeForDimension, "count"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_sizeRangeForDimension, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MultiArray %@-d shape is not allowed, expected %@-d"), v12, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5124;
  v23 = __Block_byref_object_dispose__5125;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MLMultiArrayShapeConstraint_isAllowedShape_error___block_invoke;
  v18[3] = &unk_1E3D654D0;
  v18[4] = self;
  v18[5] = &v19;
  v18[6] = &v25;
  v18[7] = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  if (a4 && !*((_BYTE *)v26 + 24))
    *a4 = objc_retainAutorelease((id)v20[5]);
  _Block_object_dispose(&v19, 8);

LABEL_18:
  v16 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __52__MLMultiArrayShapeConstraint_isAllowedShape_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeValue");
  v11 = v10;

  if (v7 < v9 || v7 - v9 >= v11)
  {
    if (a1[7])
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v9 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Size (%@) of dimension (%@) is not in allowed range (%@..%@)"), v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1[5] + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (MLMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3
{
  id v5;
  MLMultiArrayShapeConstraint *v6;
  MLMultiArrayShapeConstraint *v7;
  NSOrderedSet *v8;
  NSOrderedSet *shapeSet;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLMultiArrayShapeConstraint;
  v6 = -[MLMultiArrayShapeConstraint init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_sizeRangeForDimension, a3);
    v8 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    shapeSet = v7->_shapeSet;
    v7->_shapeSet = v8;

  }
  return v7;
}

- (id)findAvailableShape:(id)a3
{
  id v4;
  int64_t type;
  id v6;
  NSOrderedSet *v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  type = self->_type;
  if (type == 1)
    goto LABEL_7;
  if (type != 2)
  {
    if (type != 3)
    {
      v6 = 0;
      goto LABEL_20;
    }
    v6 = 0;
    if (!-[MLMultiArrayShapeConstraint isAllowedShape:error:](self, "isAllowedShape:error:", v4, 0))
      goto LABEL_20;
    goto LABEL_7;
  }
  if (-[NSOrderedSet containsObject:](self->_shapeSet, "containsObject:", v4))
  {
LABEL_7:
    v6 = v4;
    goto LABEL_20;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_shapeSet;
  v6 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (+[MLFeatureTypeUtils canShapeArrayBePromotedFrom:to:](MLFeatureTypeUtils, "canShapeArrayBePromotedFrom:to:", v4, v10, (_QWORD)v12))
        {
          v6 = v10;
          goto LABEL_19;
        }
      }
      v6 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_19:

LABEL_20:
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MLMultiArrayShapeConstraint sizeRangeForDimension](self, "sizeRangeForDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sizeRangeForDimension"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLMultiArrayShapeConstraint type](self, "type"), CFSTR("type"));
  -[MLMultiArrayShapeConstraint shapeSet](self, "shapeSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shapeSet"));

}

- (MLMultiArrayShapeConstraint)initWithCoder:(id)a3
{
  id v4;
  MLMultiArrayShapeConstraint *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *shapeSet;
  uint64_t v11;
  NSArray *sizeRangeForDimension;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MLMultiArrayShapeConstraint;
  v5 = -[MLMultiArrayShapeConstraint init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("shapeSet"));
    v9 = objc_claimAutoreleasedReturnValue();
    shapeSet = v5->_shapeSet;
    v5->_shapeSet = (NSOrderedSet *)v9;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sizeRangeForDimension"));
    v11 = objc_claimAutoreleasedReturnValue();
    sizeRangeForDimension = v5->_sizeRangeForDimension;
    v5->_sizeRangeForDimension = (NSArray *)v11;

  }
  return v5;
}

- (NSArray)sizeRangeForDimension
{
  return self->_sizeRangeForDimension;
}

- (NSOrderedSet)shapeSet
{
  return self->_shapeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeSet, 0);
  objc_storeStrong((id *)&self->_sizeRangeForDimension, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
