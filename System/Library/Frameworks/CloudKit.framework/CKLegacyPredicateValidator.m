@implementation CKLegacyPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;

  v5 = a3;
  objc_msgSend_validate_(self, v6, (uint64_t)v5, v7);

  return 1;
}

- (void)validate:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char isEqual;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_validateCompoundPredicate_(self, v4, (uint64_t)v12, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_validateComparisonPredicate_(self, v6, (uint64_t)v12, v7);
    }
    else
    {
      objc_msgSend_predicateWithValue_(MEMORY[0x1E0CB3880], v6, 1, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v12, v9, (uint64_t)v8, v10);

      if ((isEqual & 1) == 0)
        objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], (const char *)v12, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Invalid predicate: %@"), v12);
    }
  }

}

- (void)validateCompoundPredicate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  CKException *v27;
  const char *v28;
  void *v29;
  CKException *v30;
  const char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_compoundPredicateType(v4, v5, v6, v7) != 1)
  {
    if (objc_msgSend_compoundPredicateType(v4, v8, v9, v10))
    {
      v27 = [CKException alloc];
      v29 = (void *)objc_msgSend_initWithCode_format_(v27, v28, 1009, (uint64_t)CFSTR("Unexpected expression: %@"), v4);
    }
    else
    {
      objc_msgSend_subpredicates(v4, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v22, v23, 0, v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_validate_(self, v25, (uint64_t)v11, v26);
        goto LABEL_13;
      }
      v30 = [CKException alloc];
      v29 = (void *)objc_msgSend_initWithCode_format_(v30, v31, 1009, (uint64_t)CFSTR("Expected comparison subpredicate: %@"), v4);
    }
    objc_exception_throw(v29);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_subpredicates(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v11);
        objc_msgSend_validate_(self, v14, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v15);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }
LABEL_13:

}

- (void)validateComparisonPredicate:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  char *v26;

  v26 = (char *)a3;
  if ((objc_msgSend_validateFullTextSearchPredicate_(self, v4, (uint64_t)v26, v5) & 1) == 0)
  {
    if (objc_msgSend_options(v26, v6, v7, v8))
    {
      v25 = (void *)objc_msgSend_initWithCode_format_([CKException alloc], v26, 1009, (uint64_t)CFSTR("Predicate comparison options are not supported for expression: %@"), v26);
    }
    else
    {
      if ((objc_msgSend_validateNearPredicate_(self, v9, (uint64_t)v26, v10) & 1) != 0
        || (objc_msgSend_validateContainsPredicate_(self, v11, (uint64_t)v26, v12) & 1) != 0
        || (objc_msgSend_validateInPredicate_(self, v13, (uint64_t)v26, v14) & 1) != 0
        || (objc_msgSend_validateContainsAnyPredicate_(self, v15, (uint64_t)v26, v16) & 1) != 0
        || (objc_msgSend_validateContainsAllInPredicate_(self, v17, (uint64_t)v26, v18) & 1) != 0
        || (objc_msgSend_validateBeginsWithPredicate_(self, v19, (uint64_t)v26, v20) & 1) != 0
        || (objc_msgSend_validateBetweenPredicate_(self, v21, (uint64_t)v26, v22) & 1) != 0
        || (objc_msgSend_validateBasicOperatorPredicate_(self, v23, (uint64_t)v26, v24) & 1) != 0)
      {
        goto LABEL_11;
      }
      v25 = (void *)objc_msgSend_initWithCode_format_([CKException alloc], v26, 1009, (uint64_t)CFSTR("Unexpected expression: %@"), v26);
    }
    objc_exception_throw(v25);
  }
LABEL_11:

}

- (BOOL)validateNearPredicate:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int isEqualToString;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  CKException *v117;
  const char *v118;
  void *v119;
  CKException *v120;
  const char *v121;
  CKException *v122;
  const char *v123;
  CKException *v124;
  const char *v125;
  CKException *v126;
  const char *v127;
  CKException *v128;
  const char *v129;

  v4 = a3;
  if (objc_msgSend_comparisonPredicateModifier(v4, v5, v6, v7))
    goto LABEL_2;
  objc_msgSend_leftExpression(v4, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v12, v13, v14, v15) == 4)
  {
    objc_msgSend_leftExpression(v4, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_function(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("distanceToLocation:fromLocation:"), v25);

    if (isEqualToString)
    {
      if (!objc_msgSend_predicateOperatorType(v4, v27, v28, v29)
        || objc_msgSend_predicateOperatorType(v4, v30, v31, v32) == 1)
      {
        objc_msgSend_rightExpression(v4, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_expressionType(v33, v34, v35, v36);

        if (v37)
        {
          v124 = [CKException alloc];
          v119 = (void *)objc_msgSend_initWithCode_format_(v124, v125, 1009, (uint64_t)CFSTR("Expected search radius on right hand side of operator: %@"), v4);
          goto LABEL_39;
        }
        objc_msgSend_leftExpression(v4, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_37;
    }
  }
  else
  {

  }
  objc_msgSend_rightExpression(v4, v27, v28, v29);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v45, v46, v47, v48) != 4)
  {
    v11 = 0;
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend_rightExpression(v4, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_function(v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_isEqualToString_(v56, v57, (uint64_t)CFSTR("distanceToLocation:fromLocation:"), v58);

  if (v59)
  {
    if (objc_msgSend_predicateOperatorType(v4, v60, v61, v62) != 2
      || objc_msgSend_predicateOperatorType(v4, v63, v64, v65) != 3)
    {
      objc_msgSend_leftExpression(v4, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend_expressionType(v66, v67, v68, v69);

      if (v70)
      {
        v128 = [CKException alloc];
        v119 = (void *)objc_msgSend_initWithCode_format_(v128, v129, 1009, (uint64_t)CFSTR("Expected search radius on left hand side of operator: %@"), v4);
        goto LABEL_39;
      }
      objc_msgSend_rightExpression(v4, v71, v72, v73);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v45 = v41;
      objc_msgSend_arguments(v41, v42, v43, v44);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_count(v74, v75, v76, v77);

      if (v78 != 2)
      {
        v120 = [CKException alloc];
        v119 = (void *)objc_msgSend_initWithCode_format_(v120, v121, 1009, (uint64_t)CFSTR("Expected expected 2 arguments for function distanceToLocation:fromLocation: %@"), v4);
        goto LABEL_39;
      }
      objc_msgSend_arguments(v45, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v82, v83, 0, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_arguments(v45, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v89, v90, 1, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      v99 = objc_msgSend_expressionType(v85, v93, v94, v95);
      if (v99 == 3)
      {
        objc_msgSend_keyPath(v85, v96, v97, v98);
        v100 = objc_claimAutoreleasedReturnValue();
        if (!v100)
          goto LABEL_35;
        v3 = (void *)v100;
        if (objc_msgSend_expressionType(v92, v101, v102, v103) != 3)
        {

LABEL_26:
          v111 = objc_msgSend_expressionType(v85, v104, v105, v106);
          v112 = v85;
          if (!v111 || (v113 = objc_msgSend_expressionType(v92, v108, v109, v110), v112 = v92, !v113))
          {
            objc_msgSend_constantValue(v112, v108, v109, v110);
            v114 = objc_claimAutoreleasedReturnValue();
            if (v114)
            {
              v115 = (void *)v114;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {

                v11 = 1;
                goto LABEL_31;
              }
            }
          }
          v117 = [CKException alloc];
          v119 = (void *)objc_msgSend_initWithCode_format_(v117, v118, 1009, (uint64_t)CFSTR("Expected CLLocation argument for distanceToLocation:fromLocation:"));
LABEL_39:
          objc_exception_throw(v119);
        }
      }
      else if (objc_msgSend_expressionType(v92, v96, v97, v98) != 3)
      {
        goto LABEL_26;
      }
      objc_msgSend_keyPath(v92, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99 == 3)
      if (v107)
        goto LABEL_26;
LABEL_35:
      v122 = [CKException alloc];
      v119 = (void *)objc_msgSend_initWithCode_format_(v122, v123, 1009, (uint64_t)CFSTR("Expected NSKeyPathExpressionType argument for distanceToLocation:fromLocation:"));
      goto LABEL_39;
    }
LABEL_37:
    v126 = [CKException alloc];
    v119 = (void *)objc_msgSend_initWithCode_format_(v126, v127, 1009, (uint64_t)CFSTR("Searching for locations outside of a specified circular area is not supported"));
    goto LABEL_39;
  }
LABEL_2:
  v11 = 0;
LABEL_32:

  return v11;
}

- (BOOL)validateContainsPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
LABEL_6:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 99
      && !objc_msgSend_comparisonPredicateModifier(v3, v22, v23, v24))
    {
      objc_msgSend_leftExpression(v3, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_expressionType(v25, v26, v27, v28) == 3)
      {
        objc_msgSend_rightExpression(v3, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_expressionType(v32, v33, v34, v35);

        if (!v36)
          goto LABEL_16;
      }
      else
      {

      }
    }
    if (objc_msgSend_predicateOperatorType(v3, v22, v23, v24) == 4
      && objc_msgSend_comparisonPredicateModifier(v3, v37, v38, v39) == 2)
    {
      objc_msgSend_leftExpression(v3, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_expressionType(v43, v44, v45, v46) == 3)
      {
        objc_msgSend_rightExpression(v3, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_expressionType(v50, v51, v52, v53);

        if (!v54)
          goto LABEL_16;
      }
      else
      {

      }
    }
    v55 = 0;
    goto LABEL_19;
  }
  objc_msgSend_leftExpression(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v10, v11, v12, v13))
  {

    goto LABEL_6;
  }
  objc_msgSend_rightExpression(v3, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21 != 3)
    goto LABEL_6;
LABEL_16:
  v55 = 1;
LABEL_19:

  return v55;
}

- (BOOL)validateInPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  CKException *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char v69;
  BOOL v70;
  CKException *v72;
  const char *v73;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
    goto LABEL_8;
  }
  objc_msgSend_leftExpression(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v10, v11, v12, v13) != 3)
  {

    goto LABEL_8;
  }
  objc_msgSend_rightExpression(v3, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21)
  {
LABEL_8:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 4
      && objc_msgSend_comparisonPredicateModifier(v3, v31, v32, v33) == 2)
    {
      objc_msgSend_leftExpression(v3, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_expressionType(v34, v35, v36, v37))
      {

      }
      else
      {
        objc_msgSend_rightExpression(v3, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_expressionType(v41, v42, v43, v44);

        if (v45 == 3)
          goto LABEL_18;
      }
    }
    if (objc_msgSend_predicateOperatorType(v3, v31, v32, v33) != 99
      || objc_msgSend_comparisonPredicateModifier(v3, v46, v47, v48))
    {
      goto LABEL_20;
    }
    objc_msgSend_leftExpression(v3, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_expressionType(v52, v53, v54, v55))
    {

LABEL_20:
      v70 = 0;
      goto LABEL_21;
    }
    objc_msgSend_rightExpression(v3, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_expressionType(v59, v60, v61, v62);

    if (v63 != 3)
      goto LABEL_20;
LABEL_18:
    objc_msgSend_leftExpression(v3, v31, v32, v33);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKExpressionValue(v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = sub_18A715F40(v68);

    if ((v69 & 1) == 0)
    {
      v72 = [CKException alloc];
      v30 = (void *)objc_msgSend_initWithCode_format_(v72, v73, 1009, (uint64_t)CFSTR("Expected collection on left hand side: %@"), v3);
LABEL_23:
      objc_exception_throw(v30);
    }
    goto LABEL_19;
  }
  objc_msgSend_rightExpression(v3, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKExpressionValue(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = sub_18A715F40(v26);

  if ((v27 & 1) == 0)
  {
    v28 = [CKException alloc];
    v30 = (void *)objc_msgSend_initWithCode_format_(v28, v29, 1009, (uint64_t)CFSTR("Expected collection right hand side: %@"), v3);
    goto LABEL_23;
  }
LABEL_19:
  v70 = 1;
LABEL_21:

  return v70;
}

- (BOOL)validateContainsAnyPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  CKException *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  char v57;
  BOOL v58;
  CKException *v60;
  const char *v61;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9) != 2)
  {
    goto LABEL_8;
  }
  objc_msgSend_leftExpression(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v10, v11, v12, v13) != 3)
  {

    goto LABEL_8;
  }
  objc_msgSend_rightExpression(v3, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21)
  {
LABEL_8:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 10
      && objc_msgSend_comparisonPredicateModifier(v3, v31, v32, v33) == 2)
    {
      objc_msgSend_leftExpression(v3, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_expressionType(v37, v38, v39, v40))
      {

      }
      else
      {
        objc_msgSend_rightExpression(v3, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_expressionType(v44, v45, v46, v47);

        if (v48 == 3)
        {
          objc_msgSend_leftExpression(v3, v49, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKExpressionValue(v52, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = sub_18A715F40(v56);

          if ((v57 & 1) == 0)
          {
            v60 = [CKException alloc];
            v30 = (void *)objc_msgSend_initWithCode_format_(v60, v61, 1009, (uint64_t)CFSTR("Expected collection on left hand side: %@"), v3);
LABEL_18:
            objc_exception_throw(v30);
          }
          goto LABEL_14;
        }
      }
    }
    v58 = 0;
    goto LABEL_16;
  }
  objc_msgSend_rightExpression(v3, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKExpressionValue(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = sub_18A715F40(v26);

  if ((v27 & 1) == 0)
  {
    v28 = [CKException alloc];
    v30 = (void *)objc_msgSend_initWithCode_format_(v28, v29, 1009, (uint64_t)CFSTR("Expected collection on right hand side: %@"), v3);
    goto LABEL_18;
  }
LABEL_14:
  v58 = 1;
LABEL_16:

  return v58;
}

- (BOOL)validateContainsAllInPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  BOOL v34;
  CKException *v36;
  const char *v37;
  void *v38;
  CKException *v39;
  const char *v40;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9) != 1)
  {
    v34 = 0;
    goto LABEL_8;
  }
  objc_msgSend_rightExpression(v3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_expressionType(v13, v14, v15, v16);

  if (v17 != 3)
  {
    v36 = [CKException alloc];
    v38 = (void *)objc_msgSend_initWithCode_format_(v36, v37, 1009, (uint64_t)CFSTR("Expected key-path on right hand side: %@"), v3);
    goto LABEL_12;
  }
  objc_msgSend_leftExpression(v3, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v21, v22, v23, v24))
  {

    goto LABEL_11;
  }
  objc_msgSend_leftExpression(v3, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKExpressionValue(v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = sub_18A715F40(v32);

  if ((v33 & 1) == 0)
  {
LABEL_11:
    v39 = [CKException alloc];
    v38 = (void *)objc_msgSend_initWithCode_format_(v39, v40, 1009, (uint64_t)CFSTR("Expected collection on left hand side: %@"), v3);
LABEL_12:
    objc_exception_throw(v38);
  }
  v34 = 1;
LABEL_8:

  return v34;
}

- (BOOL)validateBeginsWithPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char isKindOfClass;
  CKException *v41;
  const char *v42;
  id v43;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 8)
    goto LABEL_4;
  objc_msgSend_leftExpression(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_expressionType(v10, v11, v12, v13);
  v18 = v14 == 3;
  if (v14 != 3)
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend_rightExpression(v3, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_expressionType(v19, v20, v21, v22);

  if (v23)
  {
LABEL_4:
    v18 = 0;
    goto LABEL_8;
  }
  objc_msgSend_rightExpression(v3, v24, v25, v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKExpressionValue(v10, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_7;
  }
  objc_msgSend_rightExpression(v3, v31, v32, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKExpressionValue(v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v41 = [CKException alloc];
    v43 = (id)objc_msgSend_initWithCode_format_(v41, v42, 1009, (uint64_t)CFSTR("Expected NSString or NSData on right hand side: %@"), v3);
    objc_exception_throw(v43);
  }
  v18 = 1;
LABEL_8:

  return v18;
}

- (BOOL)validateBetweenPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  CKException *v52;
  const char *v53;
  id v54;

  v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 100
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
    goto LABEL_3;
  }
  objc_msgSend_leftExpression(v3, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_expressionType(v15, v16, v17, v18);
  v13 = v19 == 3;
  if (v19 != 3)
  {
LABEL_12:

    goto LABEL_4;
  }
  objc_msgSend_rightExpression(v3, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_expressionType(v23, v24, v25, v26);

  if (v27 == 14)
  {
    objc_msgSend_rightExpression(v3, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constantValue(v31, v32, v33, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    if (objc_msgSend_count(v15, v35, v36, v37) != 2)
      goto LABEL_13;
    objc_msgSend_objectAtIndexedSubscript_(v15, v38, 0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKExpressionValue(v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v15, v45, 1, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKExpressionValue(v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_13:
      v52 = [CKException alloc];
      v54 = (id)objc_msgSend_initWithCode_format_(v52, v53, 1009, (uint64_t)CFSTR("Expected array with two number arguments on right hand side: %@"), v3);
      objc_exception_throw(v54);
    }

    goto LABEL_12;
  }
LABEL_3:
  v13 = 0;
LABEL_4:

  return v13;
}

- (unint64_t)_comparisonOptionForString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("n"), v5) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v3, v6, (uint64_t)CFSTR("N"), v7) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_msgSend_rangeOfString_(v3, v8, (uint64_t)CFSTR("c"), v9) != 0x7FFFFFFFFFFFFFFFLL
       || objc_msgSend_rangeOfString_(v3, v10, (uint64_t)CFSTR("C"), v11) != 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend_rangeOfString_(v3, v10, (uint64_t)CFSTR("d"), v11) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_rangeOfString_(v3, v14, (uint64_t)CFSTR("D"), v15) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 |= 2uLL;
    }
    if (objc_msgSend_rangeOfString_(v3, v14, (uint64_t)CFSTR("l"), v15) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_rangeOfString_(v3, v16, (uint64_t)CFSTR("L"), v17) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 |= 8uLL;
    }
  }
  else
  {
    v12 = 4;
  }

  return v12;
}

- (BOOL)validateFullTextSearchPredicate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int isEqualToString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  char v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  char isKindOfClass;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  CKException *v96;
  const char *v97;
  void *v98;
  BOOL v99;
  void *v100;
  char v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  CKException *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  CKException *v130;
  const char *v131;
  CKException *v132;
  const char *v133;
  CKException *v134;
  const char *v135;
  CKException *v136;
  const char *v137;
  CKException *v138;
  const char *v139;
  CKException *v140;
  const char *v141;
  CKException *v142;
  const char *v143;

  v4 = a3;
  objc_msgSend_leftExpression(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v8, v9, v10, v11) == 3)
  {
    objc_msgSend_leftExpression(v4, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyPath(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("allTokens"), v21);

    if (isEqualToString)
    {
      objc_msgSend_leftExpression(v4, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rightExpression(v4, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend_rightExpression(v4, v23, v24, v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v34, v35, v36, v37) == 3)
  {
    objc_msgSend_rightExpression(v4, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyPath(v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_isEqualToString_(v45, v46, (uint64_t)CFSTR("allTokens"), v47);

    if (v48)
    {
      objc_msgSend_rightExpression(v4, v49, v50, v51);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_leftExpression(v4, v52, v53, v54);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v55 = v30;
      v59 = objc_msgSend_expressionType(v30, v31, v32, v33);
      if (v59)
      {
        if (objc_msgSend_expressionType(v55, v56, v57, v58) != 4
          || (objc_msgSend_function(v55, v60, v61, v62),
              v63 = (void *)objc_claimAutoreleasedReturnValue(),
              v66 = objc_msgSend_isEqualToString_(v63, v64, (uint64_t)CFSTR("tokenize:using:"), v65),
              v63,
              !v66))
        {
          v130 = [CKException alloc];
          v98 = (void *)objc_msgSend_initWithCode_format_(v130, v131, 1009, (uint64_t)CFSTR("Required string or tokenize() arguments when searching special key-path allTokens: %@"), v4);
          goto LABEL_39;
        }
        objc_msgSend_arguments(v55, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v70, v71, 1, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_constantValue(v73, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend__comparisonOptionForString_(self, v78, (uint64_t)v77, v79);

        if ((v80 & 0xF) != 0xBLL)
        {
          v132 = [CKException alloc];
          v98 = (void *)objc_msgSend_initWithCode_format_(v132, v133, 1009, (uint64_t)CFSTR("Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption tokenization options on tokenize() function: %@"), v4);
          goto LABEL_39;
        }
        objc_msgSend_arguments(v55, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v84, v85, 0, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_constantValue(v87, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v96 = [CKException alloc];
          v98 = (void *)objc_msgSend_initWithCode_format_(v96, v97, 1009, (uint64_t)CFSTR("Required string argument when using tokenize(): %@"), v4);
          goto LABEL_39;
        }
      }
      else
      {
        objc_msgSend_constantValue(v55, v56, v57, v58);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v101 = objc_opt_isKindOfClass();

        if ((v101 & 1) == 0)
        {
          v140 = [CKException alloc];
          v98 = (void *)objc_msgSend_initWithCode_format_(v140, v141, 1009, (uint64_t)CFSTR("Required string or tokenize() arguments when comparing to special key-path allTokens: %@"), v4);
          goto LABEL_39;
        }
      }
      if (objc_msgSend_comparisonPredicateModifier(v4, v93, v94, v95) == 1
        && (objc_msgSend_leftExpression(v4, v102, v103, v104),
            v105 = (void *)objc_claimAutoreleasedReturnValue(),
            v105,
            v26 == v105))
      {
        v134 = [CKException alloc];
        v98 = (void *)objc_msgSend_initWithCode_format_(v134, v135, 1009, (uint64_t)CFSTR("Enumerating special key-path allTokens is not allowed: %@"), v4);
      }
      else
      {
        if (objc_msgSend_predicateOperatorType(v4, v102, v103, v104) == 1000)
        {
          if (!v59
            && ((objc_msgSend_options(v4, v106, v107, v108) & 4) != 0
             || (objc_msgSend_options(v4, v109, v110, v111) & 1) == 0
             || (objc_msgSend_options(v4, v112, v113, v114) & 2) == 0
             || (objc_msgSend_options(v4, v115, v116, v117) & 8) == 0))
          {
            v118 = [CKException alloc];
            v98 = (void *)objc_msgSend_initWithCode_format_(v118, v119, 1009, (uint64_t)CFSTR("Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption comparison predicate options: %@"), v4);
            goto LABEL_39;
          }
          goto LABEL_30;
        }
        if (objc_msgSend_predicateOperatorType(v4, v106, v107, v108) == 10)
        {
          if (objc_msgSend_expressionType(v55, v120, v121, v122))
          {
            if (objc_msgSend_comparisonPredicateModifier(v4, v123, v124, v125) == 2
              || objc_msgSend_comparisonPredicateModifier(v4, v126, v127, v128) == 1)
            {
LABEL_30:
              v99 = 1;
              goto LABEL_31;
            }
            v142 = [CKException alloc];
            v98 = (void *)objc_msgSend_initWithCode_format_(v142, v143, 1009, (uint64_t)CFSTR("Required predicate modifier ANY or ALL when searching special key-path allTokens: %@"), v4);
          }
          else
          {
            v138 = [CKException alloc];
            v98 = (void *)objc_msgSend_initWithCode_format_(v138, v139, 1009, (uint64_t)CFSTR("Required tokenize() operand when searching special key-path allTokens: %@"), v4);
          }
        }
        else
        {
          v136 = [CKException alloc];
          v98 = (void *)objc_msgSend_initWithCode_format_(v136, v137, 1009, (uint64_t)CFSTR("Required comparison operators TOKENMATCHES or IN when searching special key-path allTokens: %@"), v4);
        }
      }
LABEL_39:
      objc_exception_throw(v98);
    }
  }
  else
  {

  }
  v99 = 0;
  v26 = 0;
  v55 = 0;
LABEL_31:

  return v99;
}

- (BOOL)validateBasicOperatorPredicate:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL4 v72;
  int v73;
  int isEqualToString;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  CKException *v79;
  const char *v80;
  void *v81;
  CKException *v82;
  const char *v83;
  CKException *v84;
  const char *v85;
  CKException *v86;
  objc_class *v87;
  void *v88;
  const char *v89;
  id v90;
  CKException *v91;
  const char *v92;

  v3 = a3;
  v10 = objc_msgSend_predicateOperatorType(v3, v4, v5, v6);
  if (v10 > 5)
  {
    v21 = 0;
    v22 = 0;
    goto LABEL_27;
  }
  objc_msgSend_leftExpression(v3, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v11, v12, v13, v14) == 3)
  {

LABEL_6:
    objc_msgSend_leftExpression(v3, v18, v19, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v47 = v28;
    objc_msgSend_CKExpressionValue(v28, v29, v30, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend_leftExpression(v3, v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_expressionType(v23, v24, v25, v26);

  if (v27 == 1)
    goto LABEL_6;
  objc_msgSend_rightExpression(v3, v18, v19, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expressionType(v32, v33, v34, v35) == 3)
  {

LABEL_10:
    objc_msgSend_rightExpression(v3, v39, v40, v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend_rightExpression(v3, v36, v37, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_expressionType(v42, v43, v44, v45);

  if (v46 == 1)
    goto LABEL_10;
  v21 = 0;
LABEL_12:
  objc_msgSend_leftExpression(v3, v39, v40, v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_expressionType(v48, v49, v50, v51);

  if (v52)
  {
    objc_msgSend_rightExpression(v3, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_expressionType(v56, v57, v58, v59);

    if (v60)
    {
      v22 = 0;
      goto LABEL_18;
    }
    objc_msgSend_rightExpression(v3, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_leftExpression(v3, v53, v54, v55);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = v64;
  objc_msgSend_CKExpressionValue(v64, v65, v66, v67);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v21)
  {
    v79 = [CKException alloc];
    v81 = (void *)objc_msgSend_initWithCode_format_(v79, v80, 1009, (uint64_t)CFSTR("Expected key-path in comparison expression: %@"), v3);
    goto LABEL_34;
  }
  if (objc_msgSend_isEqualToString_(v21, v61, (uint64_t)CFSTR("___share"), v63))
  {
    v72 = v22 != 0;
    v73 = 1;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v21, v69, (uint64_t)CFSTR("___parent"), v71);
    v73 = isEqualToString;
    v72 = v22 != 0;
    if (!v22 && (isEqualToString & 1) == 0)
    {
      v91 = [CKException alloc];
      v81 = (void *)objc_msgSend_initWithCode_format_(v91, v92, 1009, (uint64_t)CFSTR("Expected constant value in comparison expression: %@"), v3);
LABEL_34:
      objc_exception_throw(v81);
    }
  }
  if (objc_msgSend_comparisonPredicateModifier(v3, v69, v70, v71) == 1)
  {
    v82 = [CKException alloc];
    v81 = (void *)objc_msgSend_initWithCode_format_(v82, v83, 1009, (uint64_t)CFSTR("Aggregate operator ALL not allowed for comparison expression: %@"), v3);
    goto LABEL_34;
  }
  if (objc_msgSend_comparisonPredicateModifier(v3, v75, v76, v77) == 2)
  {
    v84 = [CKException alloc];
    v81 = (void *)objc_msgSend_initWithCode_format_(v84, v85, 1009, (uint64_t)CFSTR("Aggregate operator ANY not allowed for comparison expression: %@"), v3);
    goto LABEL_34;
  }
  if (!CKValueIsAcceptablePredicateClass(v22) && v72 | v73 ^ 1)
  {
    v86 = [CKException alloc];
    v87 = (objc_class *)objc_opt_class();
    NSStringFromClass(v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (id)objc_msgSend_initWithCode_format_(v86, v89, 1009, (uint64_t)CFSTR("Type '%@' not allowed in comparison expression: %@"), v88, v3);

    objc_exception_throw(v90);
  }
LABEL_27:

  return v10 < 6;
}

@end
