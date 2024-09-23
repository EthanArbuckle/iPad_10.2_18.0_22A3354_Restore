@implementation MDLMorphDeformer

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend_allocWithZone_(MDLMorphDeformer, a2, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithOther_, self);
}

- (MDLMorphDeformer)initWithOther:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  MDLMorphDeformer *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *targetShapes;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSData *targetWeights;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSData *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  MDLAnimatedScalarArray *weights;
  MDLMorphDeformer *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MDLMorphDeformer;
  v7 = -[MDLMorphDeformer init](&v36, sel_init);
  if (v7)
  {
    objc_msgSend_targetShapes(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_copy(v8, v9, v10);
    targetShapes = v7->_targetShapes;
    v7->_targetShapes = (NSArray *)v11;

    objc_msgSend_shapeSetTargetWeights(v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_copy(v15, v16, v17);
    targetWeights = v7->_targetWeights;
    v7->_targetWeights = (NSData *)v18;

    objc_msgSend_shapeSetTargetCounts(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_copy(v22, v23, v24);
    v26 = v7->_targetWeights;
    v7->_targetWeights = (NSData *)v25;

    objc_msgSend_weights(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_copy(v29, v30, v31);
    weights = v7->_weights;
    v7->_weights = (MDLAnimatedScalarArray *)v32;

    v34 = v7;
  }

  return v7;
}

- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(id)a4 shapeSetTargetCounts:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  int v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  id v32;
  const char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  int v40;
  int v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  int v50;
  uint64_t v51;
  NSArray *v52;
  MDLAnimatedScalarArray *v53;
  const char *v54;
  uint64_t v55;
  unsigned int v56;
  const char *v57;
  uint64_t v58;
  MDLAnimatedScalarArray *v59;
  MDLMorphDeformer *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSArray *targetShapes;
  id v68;
  const char *v69;
  uint64_t v70;
  NSData *targetWeights;
  id v72;
  const char *v73;
  uint64_t v74;
  NSData *targetCounts;
  MDLAnimatedScalarArray *v76;
  const char *v77;
  uint64_t v78;
  MDLAnimatedScalarArray *weights;
  __int128 v81;
  MDLMorphDeformer *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  void *v87;
  char *v88;
  char *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  void *__p;
  char *v95;
  char *v96;
  objc_super v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  *((_QWORD *)&v81 + 1) = a4;
  *(_QWORD *)&v81 = a5;
  v97.receiver = self;
  v97.super_class = (Class)MDLMorphDeformer;
  v82 = -[MDLMorphDeformer init](&v97, sel_init);
  if (v82)
  {
    if (*((_QWORD *)&v81 + 1) && (_QWORD)v81)
    {
      v11 = objc_msgSend_count(v8, v9, v10);
      if (v11 == objc_msgSend_count(*((void **)&v81 + 1), v12, v13))
      {
        __p = 0;
        v95 = 0;
        v96 = 0;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v14 = *((id *)&v81 + 1);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v90, v99, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v91;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v91 != v19)
                objc_enumerationMutation(v14);
              objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v90 + 1) + 8 * i), (const char *)v16, v17);
              v22 = v21;
              v23 = v95;
              if (v95 >= v96)
              {
                v25 = (char *)__p;
                v26 = (v95 - (_BYTE *)__p) >> 2;
                v27 = v26 + 1;
                if ((unint64_t)(v26 + 1) >> 62)
                  sub_1DCAE4C44();
                v28 = v96 - (_BYTE *)__p;
                if ((v96 - (_BYTE *)__p) >> 1 > v27)
                  v27 = v28 >> 1;
                if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
                  v16 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v16 = v27;
                if (v16)
                {
                  v29 = (char *)sub_1DCAE4D04((uint64_t)&v96, v16);
                  v25 = (char *)__p;
                  v23 = v95;
                }
                else
                {
                  v29 = 0;
                }
                v30 = &v29[4 * v26];
                *(_DWORD *)v30 = v22;
                v24 = v30 + 4;
                while (v23 != v25)
                {
                  v31 = *((_DWORD *)v23 - 1);
                  v23 -= 4;
                  *((_DWORD *)v30 - 1) = v31;
                  v30 -= 4;
                }
                __p = v30;
                v95 = v24;
                v96 = &v29[4 * v16];
                if (v25)
                  operator delete(v25);
              }
              else
              {
                *(_DWORD *)v95 = v21;
                v24 = v23 + 4;
              }
              v95 = v24;
            }
            v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, (const char *)v16, (uint64_t)&v90, v99, 16);
          }
          while (v18);
        }

        v87 = 0;
        v88 = 0;
        v89 = 0;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v32 = (id)v81;
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v83, v98, 16);
        if (v36)
        {
          LODWORD(v37) = 0;
          v38 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v84 != v38)
                objc_enumerationMutation(v32);
              v40 = objc_msgSend_unsignedIntValue(*(void **)(*((_QWORD *)&v83 + 1) + 8 * j), (const char *)v34, v35);
              v41 = v40;
              v42 = v88;
              if (v88 >= v89)
              {
                v44 = (char *)v87;
                v45 = (v88 - (_BYTE *)v87) >> 2;
                v46 = v45 + 1;
                if ((unint64_t)(v45 + 1) >> 62)
                  sub_1DCAE4C44();
                v47 = v89 - (_BYTE *)v87;
                if ((v89 - (_BYTE *)v87) >> 1 > v46)
                  v46 = v47 >> 1;
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
                  v34 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v34 = v46;
                if (v34)
                {
                  v48 = (char *)sub_1DCAE4D04((uint64_t)&v89, v34);
                  v44 = (char *)v87;
                  v42 = v88;
                }
                else
                {
                  v48 = 0;
                }
                v49 = &v48[4 * v45];
                *(_DWORD *)v49 = v41;
                v43 = v49 + 4;
                while (v42 != v44)
                {
                  v50 = *((_DWORD *)v42 - 1);
                  v42 -= 4;
                  *((_DWORD *)v49 - 1) = v50;
                  v49 -= 4;
                }
                v87 = v49;
                v88 = v43;
                v89 = &v48[4 * v34];
                if (v44)
                  operator delete(v44);
              }
              else
              {
                *(_DWORD *)v88 = v40;
                v43 = v42 + 4;
              }
              v37 = (v41 + v37);
              v88 = v43;
            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, (const char *)v34, (uint64_t)&v83, v98, 16);
          }
          while (v36);
        }
        else
        {
          v37 = 0;
        }

        v65 = objc_msgSend_count(v8, v61, v62);
        if (v65 == v37)
        {
          v66 = objc_msgSend_copy(v8, v63, v64);
          targetShapes = v82->_targetShapes;
          v82->_targetShapes = (NSArray *)v66;

          v68 = objc_alloc(MEMORY[0x1E0C99D50]);
          v70 = objc_msgSend_initWithBytes_length_(v68, v69, (uint64_t)__p, v95 - (_BYTE *)__p);
          targetWeights = v82->_targetWeights;
          v82->_targetWeights = (NSData *)v70;

          v72 = objc_alloc(MEMORY[0x1E0C99D50]);
          v74 = objc_msgSend_initWithBytes_length_(v72, v73, (uint64_t)v87, v88 - (_BYTE *)v87);
          targetCounts = v82->_targetCounts;
          v82->_targetCounts = (NSData *)v74;

          v76 = [MDLAnimatedScalarArray alloc];
          v78 = objc_msgSend_initWithElementCount_(v76, v77, ((unint64_t)(v88 - (_BYTE *)v87) >> 2));
          weights = v82->_weights;
          v82->_weights = (MDLAnimatedScalarArray *)v78;

        }
        else
        {
          NSLog(CFSTR("targetShapes.count has to equal sum of all targetShapeCounts."));
        }
        if (v87)
        {
          v88 = (char *)v87;
          operator delete(v87);
        }
        if (__p)
        {
          v95 = (char *)__p;
          operator delete(__p);
        }
        if (v65 == v37)
          goto LABEL_66;
      }
      else
      {
        NSLog(CFSTR("targetShapes.count and shapeSetTargetWeights.count have to match."));
      }
    }
    else
    {
      if (v81 == 0)
      {
        v51 = objc_msgSend_copy(v8, v9, v10);
        v52 = v82->_targetShapes;
        v82->_targetShapes = (NSArray *)v51;

        v53 = [MDLAnimatedScalarArray alloc];
        v56 = objc_msgSend_count(v8, v54, v55);
        v58 = objc_msgSend_initWithElementCount_(v53, v57, v56);
        v59 = v82->_weights;
        v82->_weights = (MDLAnimatedScalarArray *)v58;

LABEL_66:
        v60 = v82;
        goto LABEL_67;
      }
      NSLog(CFSTR("shapeSetTargetWeights and shapeSetTargetCounts have to be either both set or both nil."));
    }
  }
  v60 = 0;
LABEL_67:

  return v60;
}

- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(const float *)a4 count:(unint64_t)a5 shapeSetTargetCounts:(const unsigned int *)a6 count:(unint64_t)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  MDLMorphDeformer *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  MDLAnimatedScalarArray *v22;
  const char *v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  MDLMorphDeformer *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *targetShapes;
  id v33;
  const char *v34;
  uint64_t v35;
  NSData *targetWeights;
  id v37;
  const char *v38;
  uint64_t v39;
  NSData *targetCounts;
  MDLAnimatedScalarArray *v41;
  const char *v42;
  MDLAnimatedScalarArray *weights;
  objc_super v45;

  v12 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MDLMorphDeformer;
  v15 = -[MDLMorphDeformer init](&v45, sel_init);
  if (v15)
  {
    if (a4 && a6)
    {
      if (objc_msgSend_count(v12, v13, v14) == a5)
      {
        if (a7)
        {
          v18 = 0;
          LODWORD(v19) = 0;
          do
            v19 = a6[v18++] + v19;
          while (a7 > v18);
        }
        else
        {
          v19 = 0;
        }
        if (objc_msgSend_count(v12, v16, v17) == v19)
        {
          v31 = objc_msgSend_copy(v12, v29, v30);
          targetShapes = v15->_targetShapes;
          v15->_targetShapes = (NSArray *)v31;

          v33 = objc_alloc(MEMORY[0x1E0C99D50]);
          v35 = objc_msgSend_initWithBytes_length_(v33, v34, (uint64_t)a4, 4 * a5);
          targetWeights = v15->_targetWeights;
          v15->_targetWeights = (NSData *)v35;

          v37 = objc_alloc(MEMORY[0x1E0C99D50]);
          v39 = objc_msgSend_initWithBytes_length_(v37, v38, (uint64_t)a6, 4 * a7);
          targetCounts = v15->_targetCounts;
          v15->_targetCounts = (NSData *)v39;

          v41 = [MDLAnimatedScalarArray alloc];
          v27 = objc_msgSend_initWithElementCount_(v41, v42, a7);
          goto LABEL_17;
        }
        NSLog(CFSTR("targetShapes.count has to equal sum of all targetShapeCounts."));
      }
      else
      {
        NSLog(CFSTR("targetShapes.count and shapeSetTargetWeights.count have to match."));
      }
    }
    else
    {
      if (!((unint64_t)a4 | (unint64_t)a6))
      {
        v20 = objc_msgSend_copy(v12, v13, v14);
        v21 = v15->_targetShapes;
        v15->_targetShapes = (NSArray *)v20;

        v22 = [MDLAnimatedScalarArray alloc];
        v25 = objc_msgSend_count(v12, v23, v24);
        v27 = objc_msgSend_initWithElementCount_(v22, v26, v25);
LABEL_17:
        weights = v15->_weights;
        v15->_weights = (MDLAnimatedScalarArray *)v27;

        v28 = v15;
        goto LABEL_18;
      }
      NSLog(CFSTR("shapeSetTargetWeights and shapeSetTargetCounts have to be either both set or both nil."));
    }
  }
  v28 = 0;
LABEL_18:

  return v28;
}

- (NSArray)shapeSetTargetWeights
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  const char *v18;
  void *v20;

  v3 = (void *)objc_opt_new();
  v6 = objc_msgSend_length(self->_targetWeights, v4, v5);
  v9 = objc_msgSend_bytes(self->_targetWeights, v7, v8);
  if (v6 >= 4)
  {
    v13 = v9;
    v14 = 0;
    v15 = v6 >> 2;
    v16 = 1;
    do
    {
      LODWORD(v12) = *(_DWORD *)(v13 + 4 * v14);
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v10, v11, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v18, (uint64_t)v17);

      v14 = v16;
    }
    while (v15 > v16++);
  }
  v20 = (void *)objc_msgSend_copy(v3, v10, v11);

  return (NSArray *)v20;
}

- (NSArray)shapeSetTargetCounts
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  void *v16;
  const char *v17;
  void *v19;

  v3 = (void *)objc_opt_new();
  v6 = objc_msgSend_length(self->_targetCounts, v4, v5);
  v9 = objc_msgSend_bytes(self->_targetCounts, v7, v8);
  if (v6 >= 4)
  {
    v12 = v9;
    v13 = 0;
    v14 = v6 >> 2;
    v15 = 1;
    do
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v10, *(unsigned int *)(v12 + 4 * v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

      v13 = v15;
    }
    while (v14 > v15++);
  }
  v19 = (void *)objc_msgSend_copy(v3, v10, v11);

  return (NSArray *)v19;
}

- (MDLAnimatedScalarArray)weights
{
  return self->_weights;
}

- (unint64_t)copyShapeSetTargetWeightsInto:(float *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const void *v11;
  const char *v12;
  uint64_t v13;
  size_t v14;

  v7 = objc_msgSend_length(self->_targetWeights, a2, (uint64_t)a3);
  v10 = v7 >> 2;
  if (v7 >> 2 <= a4)
  {
    v11 = (const void *)objc_msgSend_bytes(self->_targetWeights, v8, v9);
    v14 = objc_msgSend_length(self->_targetWeights, v12, v13);
    memcpy(a3, v11, v14);
  }
  else
  {
    NSLog(CFSTR("targetWeightsArray size is too small (%lu elements) to hold all %lu elements"), a4, v7 >> 2);
    return 0;
  }
  return v10;
}

- (unint64_t)copyShapeSetTargetCountsInto:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const void *v11;
  const char *v12;
  uint64_t v13;
  size_t v14;

  v7 = objc_msgSend_length(self->_targetCounts, a2, (uint64_t)a3);
  v10 = v7 >> 1;
  if (v7 >> 1 <= a4)
  {
    v11 = (const void *)objc_msgSend_bytes(self->_targetCounts, v8, v9);
    v14 = objc_msgSend_length(self->_targetCounts, v12, v13);
    memcpy(a3, v11, v14);
  }
  else
  {
    NSLog(CFSTR("targetCountsArray size is too small (%lu elements) to hold all %lu elements"), a4, v7 >> 1);
    return 0;
  }
  return v10;
}

- (NSArray)targetShapes
{
  return self->_targetShapes;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (NSData)targetWeights
{
  return self->_targetWeights;
}

- (void)setTargetWeights:(id)a3
{
  objc_storeStrong((id *)&self->_targetWeights, a3);
}

- (NSData)targetCounts
{
  return self->_targetCounts;
}

- (void)setTargetCounts:(id)a3
{
  objc_storeStrong((id *)&self->_targetCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCounts, 0);
  objc_storeStrong((id *)&self->_targetWeights, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_targetShapes, 0);
}

@end
