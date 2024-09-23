@implementation FCTopicalNode

- (id)initWithIdentifier:(void *)a3 displayedElements:(void *)a4 allTopicCollections:(double)a5 relatednessThreshold:(double)a6 relatednessKWeight:(double)a7 topicScoreWeight:(double)a8 highestScoringRelativeScoreMultiplier:
{
  id v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = a3;
  v18 = a4;
  if (a1)
  {
    if (!objc_msgSend(v16, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Node initialized with an empty identifiers set"));
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCTopicalNode initWithIdentifier:displayedElements:allTopicCollections:relatednessThreshold:relatednessKWe"
            "ight:topicScoreWeight:highestScoringRelativeScoreMultiplier:]";
      v29 = 2080;
      v30 = "FCHeadlineClusterOrdering.m";
      v31 = 1024;
      v32 = 149;
      v33 = 2114;
      v34 = v25;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v26.receiver = a1;
    v26.super_class = (Class)FCTopicalNode;
    v19 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 3, a2);
      objc_msgSend(v16, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = a1[4];
      a1[4] = (id)v22;

      objc_storeStrong(a1 + 5, a3);
      objc_storeStrong(a1 + 6, a4);
      a1[1] = 0;
      *((_BYTE *)a1 + 16) = 0;
      *((double *)a1 + 13) = a5;
      *((double *)a1 + 14) = a6;
      *((double *)a1 + 15) = a7;
      *((double *)a1 + 16) = a8;
      a1[9] = (id)0x3FF0000000000000;
      a1[10] = 0;
      a1[11] = 0;
      a1[12] = 0;
    }
  }

  return a1;
}

uint64_t __169__FCTopicalNode_initWithIdentifier_displayedElements_allTopicCollections_relatednessThreshold_relatednessKWeight_topicScoreWeight_highestScoringRelativeScoreMultiplier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSSet *identifiers;
  uint64_t v7;
  NSSet *v8;
  BOOL v9;

  v4 = (uint64_t *)a3;
  v5 = v4;
  if (!self)
  {
    identifiers = 0;
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  identifiers = self->_identifiers;
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[3];
LABEL_4:
  v8 = identifiers;
  v9 = -[NSSet isEqualToSet:](v8, "isEqualToSet:", v7);

  return v9;
}

- (void)considerEdge:(void *)a3 withNodeScorer:
{
  id v5;
  double (**v6)(id, void *);
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  void (**v26)(_QWORD);
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  id v31;
  id Property;
  uint64_t v33;
  const char *v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD aBlock[4];
  double *v39;
  double *v40;
  double v41;
  double v42;
  double v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      v7 = (double *)*((id *)v5 + 2);
      v8 = (double *)*((id *)v5 + 3);
      v9 = v8;
      if (v7 == a1)
      {
        v7 = a1;
LABEL_9:

        if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "possibleParent");
          *(_DWORD *)buf = 136315906;
          v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
          v46 = 2080;
          v47 = "FCHeadlineClusterOrdering.m";
          v48 = 1024;
          v49 = 196;
          v50 = 2114;
          v51 = v29;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v11 = -[FCTopicalEdge independentCountForNode:]((uint64_t)v5, a1);
        if (v5)
          v12 = *((_QWORD *)v5 + 5);
        else
          v12 = 0;
        v13 = -[FCTopicalEdge independentCountForNode:]((uint64_t)v5, v9);
        if (v11 | v12)
        {
          if (v12 | v13)
          {
            if (v12)
            {
              if (v11 | v13)
              {
                v16 = (double)(unint64_t)v11;
                v17 = (double)(unint64_t)v13;
                v18 = (double)v12
                    / ((double)(unint64_t)v11 + (double)v12 + a1[14] * sqrt((double)(unint64_t)v13));
                v20 = v6[2](v6, v9);
                if (v18 >= a1[13])
                {
                  v21 = a1[10];
                  v22 = (double)v12 / ((double)v12 + v17);
                  if (v18 > v21
                    || v18 == v21
                    && ((v23 = a1[11], v22 > v23)
                     || v22 == v23
                     && ((v24 = a1[12], v20 > v24)
                      || v20 == v24
                      && ((v35 = objc_getProperty(a1, v19, 32, 1), !v9)
                        ? (v36 = 0)
                        : (v36 = objc_getProperty(v9, v34, 32, 1)),
                          v37 = objc_msgSend(v35, "compare:", v36),
                          v35,
                          v37 == -1))))
                  {
                    aBlock[0] = MEMORY[0x1E0C809B0];
                    aBlock[1] = 3221225472;
                    aBlock[2] = __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke;
                    aBlock[3] = &unk_1E463BD30;
                    v25 = v9;
                    v39 = v25;
                    v40 = a1;
                    v41 = v18;
                    v42 = v22;
                    v43 = v20;
                    v26 = (void (**)(_QWORD))_Block_copy(aBlock);
                    if (v16 < v17
                      || v16 == v17
                      && ((v28 = v6[2](v6, a1), v28 > v20)
                       || v28 == v20
                       && ((v31 = objc_getProperty(a1, v27, 32, 1), !v9)
                         ? (Property = 0)
                         : (Property = objc_getProperty(v25, v30, 32, 1)),
                           v33 = objc_msgSend(v31, "compare:", Property),
                           v31,
                           v33 == -1)))
                    {
                      v26[2](v26);
                    }

                  }
                }
                goto LABEL_38;
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Considered an edge that has only shared mentions of %@ and %@, these two nodes should have been merged"), a1, v9);
                *(_DWORD *)buf = 136315906;
                v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
                v46 = 2080;
                v47 = "FCHeadlineClusterOrdering.m";
                v48 = 1024;
                v49 = 226;
                v50 = 2114;
                v51 = v14;
                v15 = MEMORY[0x1E0C81028];
                goto LABEL_26;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Considered an edge that has no shared mentions of %@ and %@"), a1, v9);
              *(_DWORD *)buf = 136315906;
              v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
              v46 = 2080;
              v47 = "FCHeadlineClusterOrdering.m";
              v48 = 1024;
              v49 = 221;
              v50 = 2114;
              v51 = v14;
              v15 = MEMORY[0x1E0C81028];
              goto LABEL_26;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Considered an edge that has no independent mentions of %@ or shared mentions with %@"), v9, a1);
            *(_DWORD *)buf = 136315906;
            v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
            v46 = 2080;
            v47 = "FCHeadlineClusterOrdering.m";
            v48 = 1024;
            v49 = 216;
            v50 = 2114;
            v51 = v14;
            v15 = MEMORY[0x1E0C81028];
            goto LABEL_26;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Considered an edge that has no independent mentions of %@ or shared mentions with %@"), a1, v9);
          *(_DWORD *)buf = 136315906;
          v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
          v46 = 2080;
          v47 = "FCHeadlineClusterOrdering.m";
          v48 = 1024;
          v49 = 211;
          v50 = 2114;
          v51 = v14;
          v15 = MEMORY[0x1E0C81028];
LABEL_26:
          _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
LABEL_38:

        goto LABEL_39;
      }
      if (v8 == a1)
      {
        v10 = (double *)*((id *)v5 + 2);
        v9 = a1;
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 0;
      v9 = 0;
    }
    v10 = 0;
LABEL_8:

    v9 = v10;
    goto LABEL_9;
  }
LABEL_39:

}

void __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[6];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2;
  v9[3] = &unk_1E463ABB8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = v2;
  v9[4] = v2;
  v9[5] = v3;
  if (__45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2((uint64_t)v9))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_storeWeak((id *)(v4 + 56), *(id *)(a1 + 32));
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        *(_QWORD *)(v5 + 80) = *(_QWORD *)(a1 + 48);
        v6 = *(_QWORD *)(a1 + 40);
        if (v6)
        {
          *(_QWORD *)(v6 + 88) = *(_QWORD *)(a1 + 56);
          v7 = *(_QWORD *)(a1 + 40);
          if (v7)
            *(_QWORD *)(v7 + 96) = *(_QWORD *)(a1 + 64);
        }
      }
    }
  }

}

uint64_t __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *v3;
  id *v4;
  _BOOL8 v5;
  id *WeakRetained;

  v2 = (id *)*(id *)(a1 + 32);
  if (!v2)
    return 1;
  v3 = v2;
  do
  {
    v4 = *(id **)(a1 + 40);
    v5 = v3 != v4;
    if (v3 == v4)
      break;
    WeakRetained = (id *)objc_loadWeakRetained(v3 + 7);

    v3 = WeakRetained;
  }
  while (WeakRetained);

  return v5;
}

- (id)description
{
  FCTopicalNode **p_parent;
  void *v3;
  NSSet *v5;
  id WeakRetained;
  BOOL v7;
  FCTopicalNode **v8;
  FCTopicalNode *v9;
  __CFString *v10;
  NSSet *children;
  NSSet *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v5 = self->_identifiers;
    p_parent = &self->_parent;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    v7 = WeakRetained == 0;
    if (WeakRetained)
    {
      v8 = (FCTopicalNode **)objc_loadWeakRetained((id *)&self->_parent);
      p_parent = v8;
      if (v8)
        v9 = v8[3];
      else
        v9 = 0;
      v10 = v9;
    }
    else
    {
      v10 = CFSTR("Root");
    }
    children = self->_children;
  }
  else
  {
    v5 = 0;
    WeakRetained = 0;
    children = 0;
    v7 = 1;
    v10 = CFSTR("Root");
  }
  v12 = children;
  -[NSSet allObjects](v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Node : %@ with Parent : %@ and Children : %@"), v5, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

  }
  return v15;
}

id __28__FCTopicalNode_description__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 24);
  else
    return 0;
}

- (void)setScore:(uint64_t)a1
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 16) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Asked to score a node that has already been scored"));
    v5 = 136315906;
    v6 = "-[FCTopicalNode setScore:]";
    v7 = 2080;
    v8 = "FCHeadlineClusterOrdering.m";
    v9 = 1024;
    v10 = 336;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  *(double *)(a1 + 8) = a2;
  *(_BYTE *)(a1 + 16) = 1;
}

- (double)individualScoreWithTopicScoreProvider:(uint64_t)a1
{
  double v3;
  double v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  if (!a1)
    return 0.0;
  v3 = *(double *)(a1 + 120);
  v4 = (*(double (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 24));
  v5 = *(id *)(a1 + 40);
  if (objc_msgSend(v5, "count"))
  {
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_reduceArrayWithDouble:block:", &__block_literal_global_45_1, 0.0);
    v9 = v8 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count");

  }
  else
  {
    v9 = 0.0;
  }

  return (1.0 - v3) * v9 + v3 * v4;
}

double __55__FCTopicalNode_individualScoreWithTopicScoreProvider___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  double v3;

  if (a3)
    v3 = *(double *)(a3 + 24);
  else
    v3 = 0.0;
  return v3 + a1;
}

- (double)calculateLeafScoresWithTopicScoreProvider:(double *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  id v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(*((id *)a1 + 8), "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v4 = *((id *)a1 + 8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v5)
      {
        v7 = 0;
        v9 = 0.0;
        goto LABEL_20;
      }
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      v9 = 0.0;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          -[FCTopicalNode calculateLeafScoresWithTopicScoreProvider:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10), v3);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (double *)v11;
          if (v11)
          {
            v13 = *(id *)(v11 + 8);
            v14 = v12[2];
            if (v7)
              goto LABEL_10;
          }
          else
          {
            v13 = 0;
            v14 = 0.0;
            if (v7)
            {
LABEL_10:
              if (v14 <= v9)
                goto LABEL_12;
            }
          }
          v15 = v13;

          v9 = v14;
          v7 = v15;
LABEL_12:

          ++v10;
        }
        while (v6 != v10);
        v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v6 = v16;
        if (!v16)
        {
LABEL_20:

          a1 = -[FCTopicalLeafNode initWithNode:score:]((double *)[FCTopicalLeafNode alloc], v7, v9);
          goto LABEL_21;
        }
      }
    }
    v17 = -[FCTopicalNode individualScoreWithTopicScoreProvider:]((uint64_t)a1, (uint64_t)v3);
    -[FCTopicalNode setScore:]((uint64_t)a1, v17);
    a1 = -[FCTopicalLeafNode initWithNode:score:]((double *)[FCTopicalLeafNode alloc], a1, a1[1] * a1[9]);
  }
LABEL_21:

  return a1;
}

- (void)calculateNonLeafScoresWithTopicProvider:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  if (a1 && objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    v4 = *(id *)(a1 + 64);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __57__FCTopicalNode_calculateNonLeafScoresWithTopicProvider___block_invoke;
    v12 = &unk_1E463BDC0;
    v5 = v3;
    v13 = v5;
    v14 = &v15;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);

    v6 = v16[3];
    v7 = v6 + -[FCTopicalNode individualScoreWithTopicScoreProvider:](a1, (uint64_t)v5);
    v16[3] = v7;
    v8 = *(id *)(a1 + 64);
    -[FCTopicalNode setScore:](a1, v7 / ((double)(unint64_t)objc_msgSend(v8, "count", v9, v10, v11, v12) + 1.0));

    _Block_object_dispose(&v15, 8);
  }

}

void __57__FCTopicalNode_calculateNonLeafScoresWithTopicProvider___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[FCTopicalNode calculateNonLeafScoresWithTopicProvider:]();
  if (v3 && v3[16])
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(double *)(v4 + 24);
    v5 = (double *)(v4 + 24);
    v7 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Scoring node that has an unscored child"));
      v12 = 136315906;
      v13 = "-[FCTopicalNode calculateNonLeafScoresWithTopicProvider:]_block_invoke";
      v14 = 2080;
      v15 = "FCHeadlineClusterOrdering.m";
      v16 = 1024;
      v17 = 390;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(double *)(v8 + 24);
    v5 = (double *)(v8 + 24);
    v7 = v9;
    if (!v3)
    {
      v10 = 0.0;
      goto LABEL_8;
    }
  }
  v10 = *((double *)v3 + 1) * *((double *)v3 + 9);
LABEL_8:
  *v5 = v7 + v10;

}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_topicCollections, 0);
  objc_storeStrong((id *)&self->_displayedElements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
