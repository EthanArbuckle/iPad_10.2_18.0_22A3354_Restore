@implementation _HKCFGReplacementRule

- (unint64_t)lengthIncrease
{
  return self->_lengthIncrease;
}

- (NSArray)rightHandSide
{
  return self->_rightHandSide;
}

- (id)nodeEvaluator
{
  return self->_nodeEvaluator;
}

+ (_HKCFGReplacementRule)ruleWithLHS:(id)a3 RHS:(id)a4 nodeEvaluator:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v41;
  _QWORD *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKContextFreeGrammar.m"), 270, CFSTR("Replacement rule must have at least one expression on the right-hand side"));

  }
  v11 = objc_alloc_init((Class)a1);
  v43 = v10;
  v12 = objc_msgSend(v10, "copy");
  v13 = (void *)*((_QWORD *)v11 + 3);
  v42 = v11;
  *((_QWORD *)v11 + 3) = v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v54;
    v19 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "addObject:", v21);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[_HKCFGTerminal terminalMatchingString:](_HKCFGTerminal, "terminalMatchingString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v22);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v19, CFSTR("Invalid expression in replacement rule: %@"), v21);
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v17);
  }

  objc_storeStrong((id *)v11 + 2, v14);
  v23 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v44, "_label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ -> "), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = v14;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "_label");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendString:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v28);
  }

  v32 = objc_msgSend(v25, "copy");
  v33 = (void *)v42[1];
  v42[1] = v32;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = v26;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v35)
  {
    v36 = v35;
    v37 = 0;
    v38 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(v34);
        v37 += objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "_minimumLength");
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v36);
  }
  else
  {
    v37 = 0;
  }

  v42[4] = v37 - objc_msgSend(v44, "_minimumLength");
  return (_HKCFGReplacementRule *)v42;
}

- (id)description
{
  return self->_description;
}

- (void)setRightHandSide:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nodeEvaluator, 0);
  objc_storeStrong((id *)&self->_rightHandSide, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
