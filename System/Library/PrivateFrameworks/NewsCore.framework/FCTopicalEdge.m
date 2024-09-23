@implementation FCTopicalEdge

- (uint64_t)independentCountForNode:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 16);
    if (v4 == v3)
    {

    }
    else
    {
      v5 = *(id *)(a1 + 24);

      if (v5 != v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Asked for independent count for node %@ but node not part of edge %@"), v3, a1);
        *(_DWORD *)buf = 136315906;
        v10 = "-[FCTopicalEdge independentCountForNode:]";
        v11 = 2080;
        v12 = "FCHeadlineClusterOrdering.m";
        v13 = 1024;
        v14 = 510;
        v15 = 2114;
        v16 = v6;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
    v7 = 48;
    if (*(id *)(a1 + 16) == v3)
      v7 = 32;
    a1 = *(_QWORD *)(a1 + v7);
  }

  return a1;
}

uint64_t __38__FCTopicalEdge_initWithNode_andNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const char *v4;
  id v5;
  const char *v6;
  id v7;
  id Property;
  uint64_t v9;

  v5 = a3;
  if (a2)
  {
    v7 = objc_getProperty(a2, v4, 32, 1);
    if (v5)
      Property = objc_getProperty(v5, v6, 32, 1);
    else
      Property = 0;
    v9 = objc_msgSend(v7, "compare:", Property);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)calculateRelatedness
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a1, "relatednessCalculated")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Asking to calculate relatedness when it already calculated : %@"), a1);
      *(_DWORD *)buf = 136315906;
      v12 = "-[FCTopicalEdge calculateRelatedness]";
      v13 = 2080;
      v14 = "FCHeadlineClusterOrdering.m";
      v15 = 1024;
      v16 = 456;
      v17 = 2114;
      v18 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v2 = (_QWORD *)a1[2];
    if (v2)
      v2 = (_QWORD *)v2[6];
    v3 = v2;
    v4 = (_QWORD *)a1[3];
    if (v4)
      v4 = (_QWORD *)v4[6];
    v5 = v4;
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_3;
    v10[3] = &unk_1E463BE50;
    v10[4] = a1;
    a1[4] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v3, v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_4;
    v9[3] = &unk_1E463BE50;
    v9[4] = a1;
    a1[5] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v3, v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_5;
    v8[3] = &unk_1E463BE50;
    v8[4] = a1;
    a1[6] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v5, v8);
    objc_msgSend(a1, "setRelatednessCalculated:", 1);

  }
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_2;
  v9[3] = &unk_1E463BE28;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __37__FCTopicalEdge_calculateRelatedness__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    v3 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v4);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v3;

}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  id Property;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v5 = *(id *)(v4 + 24);
  v7 = v5;
  if (!v5)
  {
LABEL_6:
    Property = 0;
    goto LABEL_4;
  }
  Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  v9 = objc_msgSend(v3, "containsObject:", Property) ^ 1;

  return v9;
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  id Property;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v5 = *(id *)(v4 + 24);
  v7 = v5;
  if (!v5)
  {
LABEL_6:
    Property = 0;
    goto LABEL_4;
  }
  Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  v9 = objc_msgSend(v3, "containsObject:", Property);

  return v9;
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  id Property;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v5 = *(id *)(v4 + 16);
  v7 = v5;
  if (!v5)
  {
LABEL_6:
    Property = 0;
    goto LABEL_4;
  }
  Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  v9 = objc_msgSend(v3, "containsObject:", Property) ^ 1;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCTopicalNode *a;
  FCTopicalNode *v6;
  FCTopicalNode *v7;
  FCTopicalNode *v8;
  BOOL v9;
  FCTopicalNode *b;
  FCTopicalNode *v11;

  v4 = a3;
  if (self)
    a = self->_a;
  else
    a = 0;
  v6 = a;
  v7 = v6;
  if (v4)
    v8 = (FCTopicalNode *)v4[2];
  else
    v8 = 0;
  if (v6 == v8)
  {
    if (self)
    {
      b = self->_b;
      if (v4)
      {
LABEL_9:
        v11 = (FCTopicalNode *)v4[3];
LABEL_10:
        v9 = b == v11;

        goto LABEL_11;
      }
    }
    else
    {
      b = 0;
      if (v4)
        goto LABEL_9;
    }
    v11 = 0;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  FCTopicalEdge *v2;
  FCTopicalNode *v3;
  FCTopicalNode *v4;
  NSSet *identifiers;
  NSSet *v6;
  uint64_t v7;
  FCTopicalNode *v8;
  unint64_t v9;

  v2 = self;
  if (self)
  {
    v3 = self->_a;
    v4 = v3;
    if (v3)
    {
      identifiers = v3->_identifiers;
      goto LABEL_4;
    }
  }
  else
  {
    v4 = 0;
  }
  identifiers = 0;
LABEL_4:
  v6 = identifiers;
  v7 = -[NSSet hash](v6, "hash");
  if (v2)
  {
    v8 = v2->_b;
    v2 = (FCTopicalEdge *)v8;
    if (v8)
      v8 = (FCTopicalNode *)v8->_identifiers;
  }
  else
  {
    v8 = 0;
  }
  v9 = -[FCTopicalNode hash](v8, "hash") ^ v7;

  return v9;
}

- (id)description
{
  void *v3;
  FCTopicalNode *v4;
  FCTopicalNode *v5;
  NSSet *identifiers;
  NSSet *v7;
  FCTopicalNode *v8;
  FCTopicalNode *v9;
  NSSet *v10;
  NSSet *v11;
  unint64_t containsAButNotB;
  void *v13;
  unint64_t containsAAndB;
  void *v15;
  unint64_t containsBButNotA;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v4 = self->_a;
    v5 = v4;
    if (v4)
      identifiers = v4->_identifiers;
    else
      identifiers = 0;
    v7 = identifiers;
    v8 = self->_b;
    v9 = v8;
    if (v8)
      v10 = v8->_identifiers;
    else
      v10 = 0;
    v11 = v10;
    containsAButNotB = self->_containsAButNotB;
  }
  else
  {
    v11 = 0;
    v7 = 0;
    v5 = 0;
    v9 = 0;
    containsAButNotB = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", containsAButNotB);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    containsAAndB = self->_containsAAndB;
  else
    containsAAndB = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", containsAAndB);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    containsBButNotA = self->_containsBButNotA;
  else
    containsBButNotA = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", containsBButNotA);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Edge from %@ to %@ with { %@ -- %@ -- %@ }"), v7, v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)setA:(id)a3
{
  objc_storeStrong((id *)&self->_a, a3);
}

- (void)setB:(id)a3
{
  objc_storeStrong((id *)&self->_b, a3);
}

- (BOOL)relatednessCalculated
{
  return self->_relatednessCalculated;
}

- (void)setRelatednessCalculated:(BOOL)a3
{
  self->_relatednessCalculated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
