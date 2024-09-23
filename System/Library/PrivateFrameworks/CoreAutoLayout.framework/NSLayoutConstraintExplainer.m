@implementation NSLayoutConstraintExplainer

- (NSLayoutConstraintExplainer)initWithConstraint:(id)a3
{
  NSLayoutConstraintExplainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSLayoutConstraintExplainer;
  v4 = -[NSLayoutConstraintExplainer init](&v6, sel_init);
  if (v4)
  {
    v4->_constraint = (NSLayoutConstraint *)a3;
    v4->_requiredConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_relaxedConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_frozenConstraints = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSLayoutConstraintExplainer recalculateExplanation](v4, "recalculateExplanation");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_constraint = 0;
  self->_requiredConstraints = 0;

  self->_relaxedConstraints = 0;
  self->_frozenConstraints = 0;
  -[NSLayoutConstraintExplainer setSatisfactionChanges:](self, "setSatisfactionChanges:", 0);
  -[NSLayoutConstraintExplainer setPriorities:](self, "setPriorities:", 0);
  -[NSLayoutConstraintExplainer setMutuallyExclusiveConstraints:](self, "setMutuallyExclusiveConstraints:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraintExplainer;
  -[NSLayoutConstraintExplainer dealloc](&v3, sel_dealloc);
}

- (void)_freezeErrorVariable:(id)a3 forcingZeroValue:(BOOL)a4 inEngine:(id)a5 accumulatingConstraints:(id)a6 andMutuallyExclusiveConstraints:(id *)a7
{
  _BOOL4 v10;
  NSErrorVariableConstraint *v14;
  NSErrorVariableConstraint *v15;
  id v16;
  double v17;

  v10 = a4;
  if (a7)
    *a7 = 0;
  if (objc_msgSend(a3, "shouldBeMinimized"))
  {
    v17 = 0.0;
    if ((objc_msgSend(a5, "hasValue:forVariable:", &v17, a3) & 1) != 0)
    {
      if (!v10)
      {
LABEL_7:
        v14 = [NSErrorVariableConstraint alloc];
        v15 = -[NSErrorVariableConstraint initWithVariable:value:](v14, "initWithVariable:value:", a3, v17);
        v16 = 0;
        -[NSLayoutConstraint _addToEngine:mutuallyExclusiveConstraints:](v15, "_addToEngine:mutuallyExclusiveConstraints:", a5, &v16);
        if (a7)
        {
          *a7 = v16;
        }
        else if (objc_msgSend(v16, "count"))
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraintExplainer.m"), 74, CFSTR("Error variable freezing should never fail."));
        }
        objc_msgSend(a6, "addObject:", v15);

        return;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraintExplainer.m"), 58, CFSTR("Expected engine to contain variable %@"), a3);
      if (!v10)
        goto LABEL_7;
    }
    v17 = 0.0;
    goto LABEL_7;
  }
}

- (void)recalculateExplanation
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  id v13;
  NSMutableSet *frozenConstraints;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableSet *requiredConstraints;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  NSLayoutConstraint *v31;
  float v32;
  double v33;
  double v34;
  NSMapTable *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSLayoutConstraint _layoutEngine]((uint64_t)self->_constraint);
  v4 = (void *)objc_msgSend(v3, "constraints");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v74 = 0;
  -[NSLayoutConstraintExplainer setSatisfactionChanges:](self, "setSatisfactionChanges:", 0);
  -[NSLayoutConstraintExplainer setMutuallyExclusiveConstraints:](self, "setMutuallyExclusiveConstraints:", 0);
  -[NSLayoutConstraintExplainer setPriorities:](self, "setPriorities:", 0);
  v6 = -[NSLayoutConstraint isActive](self->_constraint, "isActive");
  if (v3 && v6)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v71 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v11, "unsatisfaction");
          if (v12 != 0.0)
          {
            *(float *)&v12 = v12;
            objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12), v11);
          }
        }
        v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v8);
    }
    obj = v4;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    frozenConstraints = self->_frozenConstraints;
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](frozenConstraints, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v67 != v17)
            objc_enumerationMutation(frozenConstraints);
          v19 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", objc_msgSend(v19, "_markerAndPositiveExtraVar"), 0, v3, v13, 0);
          -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)v19), 0, v3, v13, 0);
        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](frozenConstraints, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v16);
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    requiredConstraints = self->_requiredConstraints;
    v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](requiredConstraints, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v63;
LABEL_21:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v23)
          objc_enumerationMutation(requiredConstraints);
        v25 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v24);
        -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", objc_msgSend(v25, "_markerAndPositiveExtraVar"), 1, v3, v13, &v74);
        if (objc_msgSend(v74, "count"))
          break;
        -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)v25), 1, v3, v13, &v74);
        if (objc_msgSend(v74, "count"))
          break;
        if (v22 == ++v24)
        {
          v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](requiredConstraints, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
          if (v22)
            goto LABEL_21;
          break;
        }
      }
    }
    if (!objc_msgSend(v74, "count"))
      -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self->_constraint, "_markerAndPositiveExtraVar"), 1, v3, v13, &v74);
    if (!objc_msgSend(v74, "count"))
      -[NSLayoutConstraintExplainer _freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:](self, "_freezeErrorVariable:forcingZeroValue:inEngine:accumulatingConstraints:andMutuallyExclusiveConstraints:", -[NSLayoutConstraint _negativeExtraVar]((uint64_t)self->_constraint), 1, v3, v13, &v74);
    if (!objc_msgSend(v74, "count"))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0CB3748]);
      -[NSLayoutConstraintExplainer setPriorities:](self, "setPriorities:", v26);

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v59 != v29)
              objc_enumerationMutation(obj);
            v31 = *(NSLayoutConstraint **)(*((_QWORD *)&v58 + 1) + 8 * k);
            objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v31), "floatValue");
            v57 = 0.0;
            v33 = fabsf(v32) - fabs(-[NSLayoutConstraint _unsatisfaction:]((id *)&v31->super.isa, &v57));
            objc_msgSend(v5, "removeObjectForKey:", v31);
            if (v33 != 0.0 && v31 != self->_constraint)
            {
              *(float *)&v34 = v33;
              objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34), v31);
            }
            v35 = -[NSLayoutConstraintExplainer priorities](self, "priorities");
            HIDWORD(v36) = HIDWORD(v57);
            *(float *)&v36 = v57;
            -[NSMapTable setObject:forKey:](v35, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36), v31);
          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
        }
        while (v28);
      }
      -[NSLayoutConstraintExplainer setSatisfactionChanges:](self, "setSatisfactionChanges:", v5);
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v37 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v54;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v54 != v39)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * m), "_removeFromEngine:", v3);
        }
        v38 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
      }
      while (v38);
    }

    if (objc_msgSend(v74, "count"))
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v42 = v74;
      v43 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v50;
        do
        {
          for (n = 0; n != v44; ++n)
          {
            if (*(_QWORD *)v50 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * n);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v47 = (void *)objc_msgSend(v47, "constrainedConstraint");
            if ((objc_msgSend(v41, "containsObject:", v47) & 1) == 0)
              objc_msgSend(v41, "addObject:", v47);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
        }
        while (v44);
      }
      -[NSLayoutConstraintExplainer setMutuallyExclusiveConstraints:](self, "setMutuallyExclusiveConstraints:", v41);

    }
  }
}

- (unint64_t)_satisfactionChangeCount:(id)a3 withResults:(id *)a4
{
  id v7;
  unint64_t v8;
  NSMapTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  float v15;
  double v16;
  float v17;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[NSLayoutConstraintExplainer satisfactionChanges](self, "satisfactionChanges"))
    return 0;
  if (a4)
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  else
    v7 = 0;
  v19 = a4;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[NSLayoutConstraintExplainer satisfactionChanges](self, "satisfactionChanges");
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v8 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(-[NSMapTable objectForKey:](-[NSLayoutConstraintExplainer satisfactionChanges](self, "satisfactionChanges"), "objectForKey:", v14), "floatValue");
        v16 = v15;
        objc_msgSend(-[NSMapTable objectForKey:](-[NSLayoutConstraintExplainer priorities](self, "priorities"), "objectForKey:", v14), "floatValue");
        if ((*((unsigned int (**)(id, double, double))a3 + 2))(a3, v17, v16))
        {
          objc_msgSend(v7, "appendFormat:", CFSTR("    %@:  satisfaction changes by %f\n"), v14, *(_QWORD *)&v16);
          ++v8;
        }
      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v8 = 0;
  }
  if (v19)
    *v19 = v7;
  return v8;
}

- (id)description
{
  void *v3;
  NSMutableSet *frozenConstraints;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableSet *requiredConstraints;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  double v14;
  const __CFString *v15;
  const __CFString *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v40 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("============= Satisfaction Explainer %p =============\n"), -[NSLayoutConstraint _unsatisfaction:]((id *)&self->_constraint->super.isa, (double *)&v40), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("Target constraint: \n    %@\n"), self->_constraint);
  if (!-[NSLayoutConstraint isActive](self->_constraint, "isActive"))
  {
    v15 = CFSTR("\nThe constraint is not satisfied because it is inactive.\n");
LABEL_23:
    objc_msgSend(v3, "appendString:", v15);
    return v3;
  }
  if (!-[NSLayoutConstraint _layoutEngine]((uint64_t)self->_constraint))
  {
    v15 = CFSTR("\nThe constraint is active, but cannot be unsatisfied since there is no layout engine yet.\n");
    goto LABEL_23;
  }
  if (-[NSMutableSet count](self->_frozenConstraints, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nFrozen constraints:     (thaw with 'po [%p thawConstraint:<address>]')\n"), self);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    frozenConstraints = self->_frozenConstraints;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](frozenConstraints, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(frozenConstraints);
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](frozenConstraints, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v6);
    }
  }
  if (-[NSMutableSet count](self->_requiredConstraints, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nRequired constraints:    (relax with 'po [%p relaxConstraint:<address>]')\n"), self);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    requiredConstraints = self->_requiredConstraints;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](requiredConstraints, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(requiredConstraints);
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](requiredConstraints, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v11);
    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  -[NSLayoutConstraint unsatisfaction](self->_constraint, "unsatisfaction");
  if (v14 == 0.0)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\nThe target constraint is already satisfied.\n"), v24);
    return v3;
  }
  -[NSLayoutConstraintExplainer recalculateExplanation](self, "recalculateExplanation");
  v31 = &stru_1E4A49B28;
  if (!-[NSArray count](-[NSLayoutConstraintExplainer mutuallyExclusiveConstraints](self, "mutuallyExclusiveConstraints"), "count"))
  {
    v23 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __42__NSLayoutConstraintExplainer_description__block_invoke;
    v26[3] = &__block_descriptor_40_e11_B24__0d8d16l;
    v26[4] = v40;
    if (-[NSLayoutConstraintExplainer _satisfactionChangeCount:withResults:](self, "_satisfactionChangeCount:withResults:", v26, &v31))
    {
      objc_msgSend(v3, "appendString:", CFSTR("Forcing the target constraint to be satisfied would make the following higher priority constraints less satisfied:\n\n"));
      objc_msgSend(v3, "appendString:", v31);
      objc_msgSend(v3, "appendFormat:", CFSTR("\nIf the above list only shows correct constraints, then the problem may lie with an even higher priority constraint that was unaffected because the layout engine was able to stretch one of these instead.  You can 'freeze' these correct constraints and re-print the explanation using this lldb command:\npo [%p freezeConstraint:<address-of-constraint>]\n\nThis will cause higher priority constraints to be shown.\n"), self);
      return v3;
    }
    v25[0] = v23;
    v25[1] = 3221225472;
    v25[2] = __42__NSLayoutConstraintExplainer_description__block_invoke_2;
    v25[3] = &__block_descriptor_40_e11_B24__0d8d16l;
    v25[4] = v40;
    if (-[NSLayoutConstraintExplainer _satisfactionChangeCount:withResults:](self, "_satisfactionChangeCount:withResults:", v25, &v31))
    {
      objc_msgSend(v3, "appendString:", CFSTR("The target constraint can be satisfied without making any higher priority constraints less satisfied.  This probably means the layout is ambiguous, which in this case is probably due to opposing constraints of the same priority.  Here's a list of likely candidates:\n\n"));
      objc_msgSend(v3, "appendString:", v31);
      objc_msgSend(v3, "appendFormat:", CFSTR("\nIf you cannot alter the priority of the above constraints to resolve the ambiguity, then the problem may lie with a different same-priority constraint that was unaffected because the layout engine happened to stretch these instead.  You can 'freeze' these correct constraints and re-print the explanation using this lldb command:\npo [%p freezeConstraint:<address-of-constraint>]\n\nThis will potentially reveal other problematic constraints.\n"), self);
      return v3;
    }
    objc_msgSend(v3, "appendString:", CFSTR("Forcing the target constraint to be satisfied didn't seem to effect anything else of note.  This isn't something that should happen under normal circumstances.  Here's the list of all constraints with satisfaction changes.\n\n"));
    -[NSLayoutConstraintExplainer _satisfactionChangeCount:withResults:](self, "_satisfactionChangeCount:withResults:", &__block_literal_global_2, &v31);
    objc_msgSend(v3, "appendString:", v31);
    v15 = CFSTR("\nPlease file a radar with the entire Satisfaction Explainer output above, and include a sample app if possible.\n");
    goto LABEL_23;
  }
  if (-[NSArray containsObject:](-[NSLayoutConstraintExplainer mutuallyExclusiveConstraints](self, "mutuallyExclusiveConstraints"), "containsObject:", self->_constraint))
  {
    v17 = CFSTR("The target constraint can't be satisfied because it's mutually exclusive with the following constraints:\n");
  }
  else
  {
    v17 = CFSTR("The additional required constraints cannot be satisfied because the following set are mutually exclusive:\n");
  }
  objc_msgSend(v3, "appendFormat:", v17);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = -[NSLayoutConstraintExplainer mutuallyExclusiveConstraints](self, "mutuallyExclusiveConstraints");
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        if (*(NSLayoutConstraint **)(*((_QWORD *)&v27 + 1) + 8 * k) != self->_constraint)
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v20);
  }
  return v3;
}

BOOL __42__NSLayoutConstraintExplainer_description__block_invoke(uint64_t a1, double a2, double a3)
{
  return *(double *)(a1 + 32) < a2 && a3 < 0.0;
}

BOOL __42__NSLayoutConstraintExplainer_description__block_invoke_2(uint64_t a1, double a2, double a3)
{
  return *(double *)(a1 + 32) == a2 && a3 < 0.0;
}

uint64_t __42__NSLayoutConstraintExplainer_description__block_invoke_3()
{
  return 1;
}

- (id)requireConstraint:(id)a3
{
  if (self->_constraint != a3)
  {
    if (-[NSMutableSet containsObject:](self->_frozenConstraints, "containsObject:"))
      -[NSLayoutConstraintExplainer thawConstraint:](self, "thawConstraint:", a3);
    -[NSMutableSet addObject:](self->_requiredConstraints, "addObject:", a3);
  }
  return self;
}

- (id)relaxConstraint:(id)a3
{
  -[NSMutableSet removeObject:](self->_requiredConstraints, "removeObject:", a3);
  return self;
}

- (id)freezeConstraint:(id)a3
{
  if (self->_constraint != a3)
  {
    if (-[NSMutableSet containsObject:](self->_requiredConstraints, "containsObject:"))
      -[NSLayoutConstraintExplainer relaxConstraint:](self, "relaxConstraint:", a3);
    -[NSMutableSet addObject:](self->_frozenConstraints, "addObject:", a3);
  }
  return self;
}

- (id)thawConstraint:(id)a3
{
  -[NSMutableSet removeObject:](self->_frozenConstraints, "removeObject:", a3);
  return self;
}

- (NSMapTable)satisfactionChanges
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSatisfactionChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMapTable)priorities
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPriorities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)mutuallyExclusiveConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMutuallyExclusiveConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
