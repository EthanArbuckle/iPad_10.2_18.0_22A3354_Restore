@implementation MLMultiArrayView

- (id)initSlicingMultiArray:(id)a3 origin:(id)a4 shape:(id)a5 squeeze:(BOOL)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  MLMultiArrayView *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  MLMultiArrayView *v36;
  MLMultiArrayView *v37;
  MLMultiArrayView *v38;
  _BOOL4 v40;
  void *v43;
  objc_super v44;
  id v45;
  id v46;

  v40 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v43 = v9;
  objc_msgSend(v9, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v10, "count");

  if (v13 != v14)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid origin %@ for slicing %@"), v10, v43);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v15 = objc_msgSend(v11, "count");
  if (v15 != objc_msgSend(v10, "count"))
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid shape %@ for slicing %@"), v11, v43);
    v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    if (a7)
    {
      v24 = objc_retainAutorelease(v24);
      v26 = 0;
      *a7 = v24;
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_20;
  }
  v16 = 0;
  while (v16 < objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");
    objc_msgSend(v43, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    ++v16;
    if (v20 + v18 > v23)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Slice at %@ with shape %@ is out of bounds"), v10, v11);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v43;
      if (a7)
      {
        v24 = objc_retainAutorelease(v24);
        v26 = 0;
        *a7 = v24;
      }
      else
      {
        v26 = 0;
      }
      goto LABEL_21;
    }
  }
  if (v40 && objc_msgSend((id)objc_opt_class(), "isSqueezableShape:", v11))
  {
    v27 = (void *)objc_opt_class();
    objc_msgSend(v43, "strides");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = 0;
    objc_msgSend(v27, "squeezeShape:strides:resultingShape:resultingStrides:", v11, v28, &v46, &v45);
    v29 = v46;
    v30 = v45;

    v31 = v29;
  }
  else
  {
    v32 = v11;
    objc_msgSend(v43, "strides");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v32;
  }
  v33 = objc_msgSend(v43, "offsetForKeyedSubscript:", v10);
  v34 = objc_msgSend(v43, "numberOfBytesPerElement");
  v35 = objc_retainAutorelease(v43);
  v44.receiver = self;
  v44.super_class = (Class)MLMultiArrayView;
  v36 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](&v44, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, objc_msgSend(v35, "mutableBytes") + v34 * v33, v31, objc_msgSend(v35, "dataType"), v30, 0, a7);
  v37 = v36;
  if (v36)
    objc_storeStrong((id *)&v36->_parent, v35);
  v38 = v37;

  v24 = 0;
  self = v38;
  v26 = v38;
LABEL_20:
  v25 = v43;
LABEL_21:

  return v26;
}

- (id)initSqueezingMultiArray:(id)a3 dimensions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  MLMultiArrayView *v29;
  MLMultiArrayView *v30;
  MLMultiArrayView *v31;
  void *v33;
  void *v34;
  objc_super v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  objc_msgSend(v8, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isSqueezableShape:", v11);

  if (!v12)
  {
    objc_msgSend(v8, "shape");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "strides");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (id)v25;
LABEL_15:
    v28 = objc_retainAutorelease(v8);
    v35.receiver = self;
    v35.super_class = (Class)MLMultiArrayView;
    v29 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](&v35, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, objc_msgSend(v28, "mutableBytes"), v22, objc_msgSend(v28, "dataType"), v24, 0, a5);
    v30 = v29;
    if (v29)
      objc_storeStrong((id *)&v29->_parent, v28);
    self = v30;

    v31 = self;
    goto LABEL_18;
  }
  if (!v9)
  {
    v26 = (void *)objc_opt_class();
    objc_msgSend(v8, "shape");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "strides");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = 0;
    objc_msgSend(v26, "squeezeShape:strides:resultingShape:resultingStrides:", v16, v27, &v37, &v36);
    v22 = v37;
    v24 = v36;

LABEL_14:
    goto LABEL_15;
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(v8, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isSqueezableShape:dimensions:", v14, v9);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v39;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v20++), "unsignedIntegerValue"));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    objc_msgSend(v8, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v8, "strides");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(v22, "removeObjectsAtIndexes:", v16);
    objc_msgSend(v24, "removeObjectsAtIndexes:", v16);
    goto LABEL_14;
  }
  objc_msgSend(v8, "shape");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Shape %@ is not squeezable at dimensions %@"), v33, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v34);

  v31 = 0;
LABEL_18:

  return v31;
}

- (id)initExpandingDimensionsOfMultiArray:(id)a3 axis:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  unint64_t v25;
  int64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  MLMultiArrayView *v36;
  objc_super v39;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObject:", &unk_1E3DA1ED0);
  objc_msgSend(v5, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v6, "addObject:", &unk_1E3DA1ED0);
  objc_msgSend(v7, "addObject:", &unk_1E3DA1ED0);
  objc_msgSend(v5, "strides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(v7, "addObject:", &unk_1E3DA1ED0);
  objc_msgSend(v5, "strides");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v10, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  v15 = (void *)MEMORY[0x1E0CB37E8];
  if (v12 >= v14)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "unsignedIntegerValue");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") * v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v19, 0);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") * v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v19, objc_msgSend(v7, "count") - 1);
  }

  objc_msgSend(v5, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count") + 1;

  v23 = (a4 % v22 + v22) % v22;
  objc_msgSend(v7, "objectAtIndexedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  v26 = v23 + 1;
  objc_msgSend(v7, "objectAtIndexedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  objc_msgSend(v6, "insertObject:atIndex:", &unk_1E3DA1ED0, v26);
  if (v25 <= v28)
    v29 = v28;
  else
    v29 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v30, v26);

  v31 = objc_retainAutorelease(v5);
  v32 = objc_msgSend(v31, "mutableBytes");
  objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v31, "dataType");
  objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)MLMultiArrayView;
  v36 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](&v39, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v32, v33, v34, v35, 0, 0);

  if (v36)
    objc_storeStrong((id *)&v36->_parent, v31);

  return v36;
}

- (MLMultiArray)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
}

+ (BOOL)isSqueezableShape:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = 0;
  do
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "count");
    if (v5 >= v6)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    v4 = v5 + 1;
  }
  while (v8 != 1);

  return v5 < v6;
}

+ (BOOL)isSqueezableShape:(id)a3 dimensions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v15);
        if (v10 < objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue") == 1;

          if (v12)
            continue;
        }
        v13 = 0;
        goto LABEL_13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 1;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_13:

  return v13;
}

+ (void)squeezeShape:(id)a3 strides:(id)a4 resultingShape:(id *)a5 resultingStrides:(id *)a6
{
  id v9;
  id v10;
  id v11;
  unint64_t i;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i < objc_msgSend(v19, "count"); ++i)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    if (v14 != 1)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v15);

      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v16);

    }
  }
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "addObject:", &unk_1E3DA1ED0);
    objc_msgSend(v11, "addObject:", &unk_1E3DA1ED0);
  }
  v17 = objc_retainAutorelease(v10);
  *a5 = v17;
  v18 = objc_retainAutorelease(v11);
  *a6 = v18;

}

@end
