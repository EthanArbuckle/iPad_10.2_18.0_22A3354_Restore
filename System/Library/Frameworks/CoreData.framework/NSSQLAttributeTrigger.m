@implementation NSSQLAttributeTrigger

- (NSSQLAttributeTrigger)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  NSSQLAttributeTrigger *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLAttributeTrigger;
  v8 = -[NSSQLAttributeTrigger init](&v11, sel_init);
  if (v8)
  {
    if (a5)
      v9 = (void *)objc_msgSend(*((id *)a5 + 5), "objectForKey:", a4);
    else
      v9 = 0;
    v8->_attribute = (NSSQLAttribute *)v9;
    v8->_entity = (NSSQLEntity *)a5;
    v8->_predicateString = (NSString *)a3;
    v8->_mToManyDecrementWhenClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mToManyIncrementWhenClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mToManyInnerFetchWhereClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mOfClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mOldMatchingClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mNewMatchingClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_mColumnChangedClause = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8->_destinationAttributes = (NSArray *)(id)NSArray_EmptyArray;
    v8->_mBulkChangeStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_mSqlDropStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_insertSQLStrings = 0;
  }
  return v8;
}

- (BOOL)validatePredicate:(uint64_t *)a3 error:
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  _QWORD *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  const __CFString *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  uint8_t v88[128];
  uint8_t v89[4];
  const char *v90;
  __int16 v91;
  int v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[3];
  _BYTE buf[24];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v83 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend((id)objc_msgSend(a2, "leftExpression"), "expressionType") != 3)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v20 = *MEMORY[0x1E0CB2D68];
        v93[0] = CFSTR("offendingPredicate");
        v93[1] = v20;
        v94[0] = a2;
        v94[1] = CFSTR("Invalid trigger predicate, left expression must evaluate to an instance of NSKeyPathExpressionType.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v94;
        v12 = v93;
        goto LABEL_38;
      }
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "leftExpression"), "keyPath"), "componentsSeparatedByString:", CFSTR("."));
      if (objc_msgSend(v6, "count") != 2)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v35 = *MEMORY[0x1E0CB2D68];
        v95[0] = CFSTR("offendingPredicate");
        v95[1] = v35;
        v96[0] = a2;
        v96[1] = CFSTR("Invalid trigger predicate, left expression must be a key-path with only two components.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v96;
        v12 = v95;
        goto LABEL_38;
      }
      if (objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "expressionType"))
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v9 = *MEMORY[0x1E0CB2D68];
        v97[0] = CFSTR("offendingPredicate");
        v97[1] = v9;
        v98[0] = a2;
        v98[1] = CFSTR("Invalid trigger predicate, right expression must evaluate to an instance of NSConstantValueExpressionType.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v98;
        v12 = v97;
LABEL_38:
        v36 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2);
        v37 = v7;
        v38 = v8;
        goto LABEL_39;
      }
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "isNSNumber"))
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v58 = *MEMORY[0x1E0CB2D68];
        v99[0] = CFSTR("offendingPredicate");
        v99[1] = v58;
        v100[0] = a2;
        v100[1] = CFSTR("Invalid trigger predicate, right expression must evaluate to a constant integer value.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v100;
        v12 = v99;
        goto LABEL_38;
      }
      v48 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "integerValue");
      if ((unint64_t)objc_msgSend(a2, "predicateOperatorType") > 5)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v59 = *MEMORY[0x1E0CB2D68];
        v101[0] = CFSTR("offendingPredicate");
        v101[1] = v59;
        v102[0] = a2;
        v102[1] = CFSTR("Invalid trigger predicate, predicate operator must be one of:\nNSLessThanPredicateOperatorType,\nNSLessThanOrEqualToPredicateOperatorType,\nNSGreaterThanPredicateOperatorType,\nNSGreaterThanOrEqualToPredicateOperatorType,\nNSEqualToPredicateOperatorType,\nNSNotEqualToPredicateOperatorType");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v102;
        v12 = v101;
        goto LABEL_38;
      }
      v49 = *(_QWORD *)(v5 + 24);
      v50 = objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      if (v49)
        v51 = (_QWORD *)objc_msgSend(*(id *)(v49 + 40), "objectForKey:", v50);
      else
        v51 = 0;
      v52 = objc_msgSend(v51, "destinationEntity");
      v53 = objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      if (v52)
        v54 = (void *)objc_msgSend(*(id *)(v52 + 40), "objectForKey:", v53);
      else
        v54 = 0;
      v55 = objc_msgSend((id)objc_msgSend(a2, "predicateOperator"), "symbol");
      v56 = objc_msgSend((id)objc_msgSend(a2, "predicateOperator"), "operatorType");
      if (v56 > 5)
        v57 = 0;
      else
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3888]), "initWithOperatorType:", qword_18A509E40[v56]);
      v60 = (id)objc_msgSend(v57, "symbol");

      if (!v51)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v72 = *MEMORY[0x1E0CB2D68];
        v103[0] = CFSTR("offendingPredicate");
        v103[1] = v72;
        v104[0] = a2;
        v104[1] = CFSTR("Invalid trigger predicate, failed to find the relationship identified by the keyPath.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v104;
        v12 = v103;
        goto LABEL_38;
      }
      v61 = *(void **)(v5 + 40);
      if (!v61)
        goto LABEL_68;
      if (!objc_msgSend(v61, "isEqual:", v51))
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB28A8];
        v73 = *MEMORY[0x1E0CB2D68];
        v105[0] = CFSTR("offendingPredicate");
        v105[1] = v73;
        v106[0] = a2;
        v106[1] = CFSTR("Invalid trigger predicate, this predicate appears to reference a different relationship than other predicates in this trigger.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v106;
        v12 = v105;
        goto LABEL_38;
      }
      if (!*(_QWORD *)(v5 + 40))
      {
LABEL_68:
        v62 = v51;
        *(_QWORD *)(v5 + 40) = v62;
        *(_QWORD *)(v5 + 48) = (id)objc_msgSend(v62, "destinationEntity");
      }
      if (!v54)
      {
        v74 = (void *)MEMORY[0x1E0CB35C8];
        v75 = *MEMORY[0x1E0CB28A8];
        *(_QWORD *)buf = a2;
        v107[0] = CFSTR("offendingPredicate");
        v107[1] = CFSTR("offendingAttribute");
        v76 = objc_msgSend(*(id *)(v5 + 32), "name");
        v107[2] = *MEMORY[0x1E0CB2D68];
        *(_QWORD *)&buf[8] = v76;
        *(_QWORD *)&buf[16] = CFSTR("Invalid trigger predicate, unable to find the attribute specified by this predicate.");
        v36 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v107, 3);
        v37 = v74;
        v38 = v75;
LABEL_39:
        v39 = objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 134060, v36);
        v26 = v39;
        if (v39)
        {
          v83 = v39;
        }
        else
        {
          v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
          v47 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v89 = 136315394;
            v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
            v91 = 1024;
            v92 = 837;
            _os_log_fault_impl(&dword_18A253000, v47, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v89, 0x12u);
          }
        }
        if (v26)
          goto LABEL_44;
        goto LABEL_35;
      }
      v63 = *(_QWORD *)(v5 + 32);
      if (v63)
        *(_WORD *)(v63 + 32) |= 8u;
      if ((objc_msgSend(*(id *)(v5 + 56), "containsObject:", v54) & 1) == 0)
      {
        v64 = (void *)objc_msgSend(*(id *)(v5 + 56), "mutableCopy");
        objc_msgSend(v64, "addObject:", v54);

        *(_QWORD *)(v5 + 56) = objc_msgSend(v64, "copy");
        v65 = (void *)v51[7];
        if (v65)
          -[NSSQLAttribute addKeyForTriggerOnRelationship:](v54, v65);
        v66 = objc_msgSend(*(id *)(v5 + 80), "length");
        v67 = *(void **)(v5 + 80);
        v68 = objc_msgSend(v54, "columnName");
        v69 = objc_msgSend(v54, "columnName");
        if (v66)
          v70 = CFSTR(" OR (NEW.%@ %@ %ld AND OLD.%@ %@ %ld)");
        else
          v70 = CFSTR("(NEW.%@ %@ %ld AND OLD.%@ %@ %ld)");
        v71 = CFSTR(" OR (NEW.%@ %@ %ld AND OLD.%@ %@ %ld)");
        objc_msgSend(v67, "appendFormat:", v70, v68, v55, v48, v69, v60, v48);
        if (!objc_msgSend(*(id *)(v5 + 72), "length"))
          v71 = CFSTR("(NEW.%@ %@ %ld AND OLD.%@ %@ %ld)");
        objc_msgSend(*(id *)(v5 + 72), "appendFormat:", v71, objc_msgSend(v54, "columnName"), v60, v48, objc_msgSend(v54, "columnName"), v55, v48);
        if (objc_msgSend(*(id *)(v5 + 88), "length"))
          objc_msgSend(*(id *)(v5 + 88), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(v5 + 88), "appendString:", objc_msgSend(v54, "columnName"));
        if (objc_msgSend(*(id *)(v5 + 112), "length"))
          objc_msgSend(*(id *)(v5 + 112), "appendString:", CFSTR(" OR "));
        objc_msgSend(*(id *)(v5 + 112), "appendFormat:", CFSTR("NEW.%@ != OLD.%@"), objc_msgSend(v54, "columnName"), objc_msgSend(v54, "columnName"));
      }
      objc_msgSend(*(id *)(v5 + 64), "appendFormat:", CFSTR("%@ %@ %ld"), objc_msgSend(v54, "columnName"), v55, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rightExpression"), "constantValue"), "integerValue"));
      objc_msgSend(*(id *)(v5 + 96), "appendFormat:", CFSTR("OLD.%@ %@ %ld"), objc_msgSend(v54, "columnName"), v55, v48);
      objc_msgSend(*(id *)(v5 + 104), "appendFormat:", CFSTR("NEW.%@ %@ %ld"), objc_msgSend(v54, "columnName"), v55, v48);
      return 1;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a2, "compoundPredicateType") == 1 || objc_msgSend(a2, "compoundPredicateType") == 2)
      {
        v77 = a3;
        v78 = objc_msgSend(*(id *)(v5 + 64), "length");
        if (v78)
        {
          objc_msgSend(*(id *)(v5 + 64), "appendString:", CFSTR("("));
          objc_msgSend(*(id *)(v5 + 96), "appendString:", CFSTR("("));
          objc_msgSend(*(id *)(v5 + 104), "appendString:", CFSTR("("));
        }
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v13 = (void *)objc_msgSend(a2, "subpredicates");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v80;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v80 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
              if (objc_msgSend(*(id *)(v5 + 64), "length")
                && objc_msgSend(*(id *)(v5 + 64), "characterAtIndex:", objc_msgSend(*(id *)(v5 + 64), "length") - 1) != 40)
              {
                if (objc_msgSend(a2, "compoundPredicateType") == 1)
                  v19 = CFSTR("AND");
                else
                  v19 = CFSTR("OR");
                objc_msgSend(*(id *)(v5 + 64), "appendFormat:", CFSTR(" %@ "), v19);
                objc_msgSend(*(id *)(v5 + 96), "appendFormat:", CFSTR(" %@ "), v19);
                objc_msgSend(*(id *)(v5 + 104), "appendFormat:", CFSTR(" %@ "), v19);
              }
              if (!-[NSSQLAttributeTrigger validatePredicate:error:](v5, v18, &v83))
              {
                a3 = v77;
                if (v78)
                {
                  objc_msgSend(*(id *)(v5 + 64), "appendString:", CFSTR(")"));
                  objc_msgSend(*(id *)(v5 + 96), "appendString:", CFSTR(")"));
                  objc_msgSend(*(id *)(v5 + 104), "appendString:", CFSTR(")"));
                }
                goto LABEL_34;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
            if (v15)
              continue;
            break;
          }
        }
        if (v78)
        {
          objc_msgSend(*(id *)(v5 + 64), "appendString:", CFSTR(")"));
          objc_msgSend(*(id *)(v5 + 96), "appendString:", CFSTR(")"));
          objc_msgSend(*(id *)(v5 + 104), "appendString:", CFSTR(")"));
        }
        return 1;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB28A8];
      v86[0] = CFSTR("offendingPredicate");
      if (!a2)
        a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v86[1] = *MEMORY[0x1E0CB2D68];
      v87[0] = a2;
      v87[1] = CFSTR("Invalid trigger predicate, compound predicates must be AND or OR predicates.");
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v87;
      v25 = v86;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB28A8];
      v84[0] = CFSTR("offendingPredicate");
      if (!a2)
        a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84[1] = *MEMORY[0x1E0CB2D68];
      v85[0] = a2;
      v85[1] = CFSTR("Invalid trigger predicate, predicate must evaluate to an instance of NSComparisonPredicate or NSCompoundPredicate.");
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v85;
      v25 = v84;
    }
    v83 = objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 134060, objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 2));
LABEL_34:
    v26 = v83;
    if (v83)
    {
LABEL_44:
      if (a3)
      {
        result = 0;
        *a3 = v26;
        return result;
      }
      return 0;
    }
LABEL_35:
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
    v34 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 676;
    _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  return result;
}

- (BOOL)validate:(id *)a3
{
  NSSQLAttributeTrigger *v4;
  NSPredicate *v5;
  uint64_t v6;
  uint64_t v7;
  NSSQLEntity *entity;
  NSSQLPrimaryKey *primaryKey;
  uint64_t v10;
  NSSQLEntity *v11;
  NSSQLEntityKey *entityKey;
  NSSQLRelationship *relationship;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *p_mBulkChangeStrings;
  void *v34;
  uint64_t v35;
  BOOL v36;
  _BOOL4 v37;
  NSSQLRelationship *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  const __CFString *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSSQLAttributeTrigger *v112;
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  int v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v112 = 0;
  if (self)
  {
    v4 = self;
    v5 = (NSPredicate *)(id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", self->_predicateString);
    v4->_predicate = v5;
    if (-[NSSQLAttributeTrigger validatePredicate:error:]((_BOOL8)v4, v5, (uint64_t *)&v112))
    {
      v6 = -[NSSQLColumn columnName](v4->_attribute, "columnName");
      v7 = -[NSSQLEntity tableName](v4->_entity, "tableName");
      v111 = -[NSSQLEntity tableName](v4->_destinationEntity, "tableName");
      v109 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZT_%@_%@_%@"), v7, v6, v111);
      entity = v4->_entity;
      if (entity)
        primaryKey = entity->_primaryKey;
      else
        primaryKey = 0;
      v10 = -[NSSQLColumn columnName](primaryKey, "columnName");
      v11 = v4->_entity;
      if (v11)
        entityKey = v11->_entityKey;
      else
        entityKey = 0;
      v108 = -[NSSQLColumn columnName](entityKey, "columnName");
      v110 = (void *)objc_opt_new();
      relationship = v4->_relationship;
      if (relationship && relationship->super._propertyType == 9)
      {
        v14 = -[NSSQLRelationship correlationTableName](v4->_relationship, "correlationTableName");
        v15 = -[NSSQLProperty columnName](relationship, "columnName");
        v107 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)relationship);
        v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INSERT_INCREMENT"), v109, v14);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v17);
        objc_msgSend(v16, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER INSERT ON %@ FOR EACH ROW"), v17, v14);
        objc_msgSend(v16, "appendString:", CFSTR(" BEGIN"));
        objc_msgSend(v16, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
        objc_msgSend(v16, "appendFormat:", CFSTR(" WHERE NEW.%@ IN (SELECT %@ FROM %@ WHERE %@)"), v107, v10, v111, v4->_mToManyInnerFetchWhereClause);
        objc_msgSend(v16, "appendFormat:", CFSTR(" AND NEW.%@ = %@;"), v15, v10);
        objc_msgSend(v16, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v15);
        objc_msgSend(v16, "appendFormat:", CFSTR(" END"));
        -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v18);

        objc_msgSend(v110, "addObject:", v16);
        v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_INCREMENT"), v109);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v20);
        objc_msgSend(v19, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v20);
        objc_msgSend(v19, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ FOR EACH ROW"), v4->_mOfClause, v111);
        objc_msgSend(v19, "appendFormat:", CFSTR(" WHEN %@"), v4->_mToManyIncrementWhenClause);
        objc_msgSend(v19, "appendString:", CFSTR(" BEGIN"));
        objc_msgSend(v19, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
        objc_msgSend(v19, "appendFormat:", CFSTR(" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = NEW.%@ AND (%@));"),
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mNewMatchingClause);
        objc_msgSend(v19, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        objc_msgSend(v19, "appendString:", CFSTR(" END"));
        objc_msgSend(v110, "addObject:", v19);
        -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v21);

        v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_DECREMENT"), v109);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v23);
        objc_msgSend(v22, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v23);
        objc_msgSend(v22, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ FOR EACH ROW"), v4->_mOfClause, v111);
        objc_msgSend(v22, "appendFormat:", CFSTR(" WHEN %@"), v4->_mToManyDecrementWhenClause);
        objc_msgSend(v22, "appendString:", CFSTR(" BEGIN"));
        objc_msgSend(v22, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v7, v6, v6);
        objc_msgSend(v22, "appendFormat:", CFSTR(" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = NEW.%@ AND (%@));"),
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mOldMatchingClause);
        objc_msgSend(v22, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        objc_msgSend(v22, "appendString:", CFSTR(" END"));
        objc_msgSend(v110, "addObject:", v22);
        -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v24);

        v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_DELETE_DECREMENT"), v109, v14);
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v26);
        objc_msgSend(v25, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW"), v26, v14);
        objc_msgSend(v25, "appendFormat:", CFSTR(" BEGIN"));
        objc_msgSend(v25, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v7, v6, v6);
        objc_msgSend(v25, "appendFormat:", CFSTR(" WHERE OLD.%@ IN (SELECT %@ FROM %@ WHERE %@)"), v107, v10, v111, v4->_mToManyInnerFetchWhereClause);
        objc_msgSend(v25, "appendFormat:", CFSTR(" AND OLD.%@ = %@;"), v15, v10);
        objc_msgSend(v25, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v15);
        objc_msgSend(v25, "appendFormat:", CFSTR(" END"));
        objc_msgSend(v110, "addObject:", v25);
        -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v27);

        v28 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_DELETE_DECREMENT"), v109);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v29);
        objc_msgSend(v28, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW WHEN %@"), v29, v111, v4->_mOldMatchingClause);
        objc_msgSend(v28, "appendFormat:", CFSTR(" BEGIN"));
        objc_msgSend(v28, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v7, v6, v6);
        objc_msgSend(v28, "appendFormat:", CFSTR(" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@ = OLD.%@ AND (%@));"),
          v10,
          v15,
          v14,
          v107,
          v10,
          v4->_mOldMatchingClause);
        objc_msgSend(v28, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
          v7,
          v108,
          v10,
          v6,
          v6,
          v7,
          v10,
          v10);
        objc_msgSend(v28, "appendFormat:", CFSTR(" END"));
        objc_msgSend(v110, "addObject:", v28);
        -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v30);

        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("COUNT_%@"), v109);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS"), v31);
        objc_msgSend(v32, "appendFormat:", CFSTR(" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT"), v15, v111, v10);
        objc_msgSend(v32, "appendFormat:", CFSTR(" FROM %@, %@"), v111, v14);
        objc_msgSend(v32, "appendFormat:", CFSTR(" WHERE %@ AND %@.%@ == %@.%@"), v4->_mToManyInnerFetchWhereClause, v14, v107, v111, v10);
        objc_msgSend(v32, "appendFormat:", CFSTR(" GROUP BY %@;"), v15);
        p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
        -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v32);

        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" CREATE INDEX %@_INDEX ON %@(%@,COUNT);"),
                        v31,
                        v31,
                        v15);
        -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v34);

        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@),0);"),
                v7,
                v6,
                v31,
                v10,
                v15);
      }
      else
      {
        v37 = -[NSSQLProperty isToMany](v4->_relationship, "isToMany");
        v38 = v4->_relationship;
        if (v37)
        {
          if (v38)
            v38 = v38->_inverse;
          v39 = -[NSSQLProperty columnName](v38, "columnName");
          v40 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_INSERT_INCREMENT"), v109);
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v41);
          objc_msgSend(v40, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v41);
          objc_msgSend(v40, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW WHEN %@"), v111, v4->_mNewMatchingClause);
          objc_msgSend(v40, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v40, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
          objc_msgSend(v40, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v39, v10);
          objc_msgSend(v40, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v40, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v40);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v42);

          v43 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_INCREMENT"), v109);
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v44);
          objc_msgSend(v43, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v44);
          objc_msgSend(v43, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@"), v4->_mOfClause, v111);
          objc_msgSend(v43, "appendFormat:", CFSTR(" FOR EACH ROW WHEN (%@) AND (%@) AND (NEW.%@ == OLD.%@)"), v4->_mNewMatchingClause, v4->_mColumnChangedClause, v39, v39);
          objc_msgSend(v43, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v43, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
          objc_msgSend(v43, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v39, v10);
          objc_msgSend(v43, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v43, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v43);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v45);

          v46 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_DECREMENT"), v109);
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v47);
          objc_msgSend(v46, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v47);
          objc_msgSend(v46, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@"), v4->_mOfClause, v111);
          objc_msgSend(v46, "appendFormat:", CFSTR(" FOR EACH ROW WHEN (%@) AND (%@) AND (OLD.%@ == NEW.%@)"), v4->_mOldMatchingClause, v4->_mColumnChangedClause, v39, v39);
          objc_msgSend(v46, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v46, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v7, v6, v6);
          objc_msgSend(v46, "appendFormat:", CFSTR(" WHERE OLD.%@ = %@;"), v39, v10);
          objc_msgSend(v46, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v46, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v46);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v48);

          v49 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_DELETE_DECREMENT"), v109);
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v50);
          objc_msgSend(v49, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v50);
          objc_msgSend(v49, "appendFormat:", CFSTR(" AFTER DELETE ON %@ FOR EACH ROW WHEN %@"), v111, v4->_mOldMatchingClause);
          objc_msgSend(v49, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v49, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;"),
            v7,
            v6,
            v6,
            v39,
            v10);
          objc_msgSend(v49, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v49, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v49);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v51);

          v52 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INSERT_INCREMENT"), v109, v7);
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v53);
          objc_msgSend(v52, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v53);
          objc_msgSend(v52, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW"), v7);
          objc_msgSend(v52, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v52, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@) AND (%@)) WHERE %@ = NEW.%@;"),
            v7,
            v6,
            v10,
            v111,
            v39,
            v10,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v52, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          objc_msgSend(v52, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v52);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v54);

          v55 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_INCREMENT"), v109, v39);
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v56);
          objc_msgSend(v55, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v56);
          objc_msgSend(v55, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN (%@) AND"), v39, v111, v4->_mNewMatchingClause);
          objc_msgSend(v55, "appendFormat:", CFSTR(" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))"), v39, v39, v39, v39);
          objc_msgSend(v55, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v55, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1 WHERE %@ = NEW.%@;"),
            v7,
            v6,
            v6,
            v10,
            v39);
          objc_msgSend(v55, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v55, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v55);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v57);

          v58 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_DECREMENT"), v109, v39);
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v59);
          objc_msgSend(v58, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v59);
          objc_msgSend(v58, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN (%@) AND"), v39, v111, v4->_mOldMatchingClause);
          objc_msgSend(v58, "appendFormat:", CFSTR(" ((OLD.%@ IS NOT NULL AND NEW.%@ IS NULL) OR (NEW.%@ != OLD.%@))"), v39, v39, v39, v39);
          objc_msgSend(v58, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v58, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE %@ = OLD.%@;"),
            v7,
            v6,
            v6,
            v10,
            v39);
          objc_msgSend(v58, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v39);
          objc_msgSend(v58, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v58);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v60);

          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("COUNT_%@"), v109);
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS"), v31);
          objc_msgSend(v61, "appendFormat:", CFSTR(" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT"), v39, v111, v10);
          objc_msgSend(v61, "appendFormat:", CFSTR(" FROM %@"), v111);
          objc_msgSend(v61, "appendFormat:", CFSTR(" WHERE %@"), v4->_mToManyInnerFetchWhereClause);
          objc_msgSend(v61, "appendFormat:", CFSTR(" GROUP BY %@;"), v39);
          p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
          -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v61);

          v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" CREATE INDEX %@_INDEX ON %@(%@,COUNT);"),
                          v31,
                          v31,
                          v39);
          -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v62);

          v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);"),
                  v7,
                  v6,
                  v31,
                  v10,
                  v39);
        }
        else
        {
          if (!v38 || v38->super._propertyType != 7)
          {
LABEL_25:
            if (objc_msgSend(v110, "count"))
            {
              v97 = objc_msgSend(v110, "copy");

              if (v97)
              {
LABEL_32:
                v4->_insertSQLStrings = (NSArray *)v97;
                return 1;
              }
            }
            else
            {

            }
            v98 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v98, v99, v100, v101, v102, v103, v104, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
            v105 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
              v115 = 1024;
              v116 = 584;
              _os_log_fault_impl(&dword_18A253000, v105, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
            v97 = 0;
            goto LABEL_32;
          }
          v71 = -[NSSQLProperty columnName](v38, "columnName");
          v72 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_INSERT_INCREMENT"), v109);
          v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v73);
          objc_msgSend(v72, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v73);
          objc_msgSend(v72, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW WHEN %@"), v111, v4->_mNewMatchingClause);
          objc_msgSend(v72, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v72, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
          objc_msgSend(v72, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v10, v71);
          objc_msgSend(v72, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          objc_msgSend(v72, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v72);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v74);

          v75 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_INCREMENT"), v109);
          v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v76);
          objc_msgSend(v75, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v76);
          objc_msgSend(v75, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@"), v4->_mOfClause, v111);
          objc_msgSend(v75, "appendFormat:", CFSTR(" FOR EACH ROW WHEN (%@) AND (%@)"), v4->_mNewMatchingClause, v4->_mColumnChangedClause);
          objc_msgSend(v75, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v75, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v7, v6, v6);
          objc_msgSend(v75, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v10, v71);
          objc_msgSend(v75, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          objc_msgSend(v75, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v75);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v77);

          v78 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_UPDATE_DECREMENT"), v109);
          v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v79);
          objc_msgSend(v78, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v79);
          objc_msgSend(v78, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@"), v4->_mOfClause, v111);
          objc_msgSend(v78, "appendFormat:", CFSTR(" FOR EACH ROW WHEN (%@) AND (%@)"), v4->_mOldMatchingClause, v4->_mColumnChangedClause);
          objc_msgSend(v78, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v78, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v7, v6, v6);
          objc_msgSend(v78, "appendFormat:", CFSTR(" WHERE OLD.%@ = %@;"), v10, v71);
          objc_msgSend(v78, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          objc_msgSend(v78, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v78);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v80);

          v81 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_DELETE_DECREMENT"), v109);
          v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v82);
          objc_msgSend(v81, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v82);
          objc_msgSend(v81, "appendFormat:", CFSTR(" AFTER DELETE ON %@ FOR EACH ROW WHEN %@"), v111, v4->_mOldMatchingClause);
          objc_msgSend(v81, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v81, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;"),
            v7,
            v6,
            v6,
            v10,
            v71);
          objc_msgSend(v81, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v71,
            v10);
          objc_msgSend(v81, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v81);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v83);

          v84 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INSERT_INCREMENT"), v109, v7);
          v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v85);
          objc_msgSend(v84, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v85);
          objc_msgSend(v84, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW"), v7);
          objc_msgSend(v84, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v84, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@) AND (%@)) WHERE %@ = NEW.%@;"),
            v7,
            v6,
            v10,
            v111,
            v10,
            v71,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v84, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          objc_msgSend(v84, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v84);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v86);

          v87 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_TO_NULL"), v109, v71);
          v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v88);
          objc_msgSend(v87, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v88);
          objc_msgSend(v87, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN"), v71, v7);
          objc_msgSend(v87, "appendFormat:", CFSTR(" (NEW.%@ IS NULL AND OLD.%@ IS NOT NULL)"), v71, v71);
          objc_msgSend(v87, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v87, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = 0 WHERE %@ = NEW.%@;"), v7, v6, v10, v10);
          objc_msgSend(v87, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          objc_msgSend(v87, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v87);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v89);

          v90 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_INCREMENT"), v109, v71);
          v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v91);
          objc_msgSend(v90, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v91);
          objc_msgSend(v90, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN"), v71, v7);
          objc_msgSend(v90, "appendFormat:", CFSTR(" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))"), v71, v71, v71, v71);
          objc_msgSend(v90, "appendFormat:", CFSTR(" BEGIN"));
          objc_msgSend(v90, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE %@ = NEW.%@ AND (%@)) WHERE %@ = NEW.%@;"),
            v7,
            v6,
            v10,
            v111,
            v10,
            v71,
            v4->_mToManyInnerFetchWhereClause,
            v10,
            v10);
          objc_msgSend(v90, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
            v7,
            v108,
            v10,
            v6,
            v6,
            v7,
            v10,
            v10);
          objc_msgSend(v90, "appendFormat:", CFSTR(" END"));
          objc_msgSend(v110, "addObject:", v90);
          -[NSMutableArray addObject:](v4->_mSqlDropStrings, "addObject:", v92);

          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("COUNT_%@"), v109);
          v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS"), v31);
          objc_msgSend(v93, "appendFormat:", CFSTR(" SELECT %@, COUNT(DISTINCT(%@)) AS COUNT"), v10, v10);
          objc_msgSend(v93, "appendFormat:", CFSTR(" FROM %@"), v111);
          objc_msgSend(v93, "appendFormat:", CFSTR(" WHERE %@"), v4->_mToManyInnerFetchWhereClause);
          objc_msgSend(v93, "appendFormat:", CFSTR(" GROUP BY %@;"), v10);
          p_mBulkChangeStrings = (id *)&v4->_mBulkChangeStrings;
          -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v93);

          v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" CREATE INDEX %@_INDEX ON %@(%@,COUNT);"),
                          v31,
                          v31,
                          v10);
          -[NSMutableArray addObject:](v4->_mBulkChangeStrings, "addObject:", v94);

          v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);"),
                  v7,
                  v6,
                  v31,
                  v10,
                  v71);
        }
      }
      v95 = (void *)v35;
      objc_msgSend(*p_mBulkChangeStrings, "addObject:", v35);

      v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" DROP TABLE %@;"), v31);
      objc_msgSend(*p_mBulkChangeStrings, "addObject:", v96);

      goto LABEL_25;
    }
    self = v112;
  }
  if (!self)
  {
    v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m");
    v70 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeTrigger.m";
      v115 = 1024;
      v116 = 145;
      _os_log_fault_impl(&dword_18A253000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  if (!a3)
    return 0;
  v36 = 0;
  *a3 = self;
  return v36;
}

- (void)dealloc
{
  objc_super v3;

  self->_attribute = 0;
  self->_entity = 0;

  self->_relationship = 0;
  self->_destinationEntity = 0;

  self->_destinationAttributes = 0;
  self->_predicate = 0;

  self->_predicateString = 0;
  self->_mToManyInnerFetchWhereClause = 0;

  self->_mToManyIncrementWhenClause = 0;
  self->_mToManyDecrementWhenClause = 0;

  self->_mOfClause = 0;
  self->_mOldMatchingClause = 0;

  self->_mNewMatchingClause = 0;
  self->_mColumnChangedClause = 0;

  self->_mBulkChangeStrings = 0;
  self->_mSqlDropStrings = 0;

  self->_insertSQLStrings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLAttributeTrigger;
  -[NSSQLAttributeTrigger dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualToExtension:(id)a3
{
  const char *v6;
  const char *v7;
  const char *v8;
  NSSQLEntity *entity;
  id Property;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLAttributeTrigger;
  if ((-[NSSQLAttributeTrigger isEqual:](&v11, sel_isEqual_) & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      if (-[NSString isEqualToString:](self->_predicateString, "isEqualToString:", objc_getProperty(a3, v6, 16, 1))
        && -[NSSQLProperty isEqual:](self->_attribute, "isEqual:", objc_getProperty(a3, v7, 32, 1)))
      {
        entity = self->_entity;
        Property = objc_getProperty(a3, v8, 24, 1);
        return -[NSStoreMapping isEqual:](entity, "isEqual:", Property);
      }
    }
    else if (-[NSString isEqualToString:](self->_predicateString, "isEqualToString:", 0)
           && -[NSSQLProperty isEqual:](self->_attribute, "isEqual:", 0))
    {
      Property = 0;
      entity = self->_entity;
      return -[NSStoreMapping isEqual:](entity, "isEqual:", Property);
    }
  }
  return 0;
}

- (NSArray)bulkUpdateSQLStrings
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mBulkChangeStrings, "copy");
}

- (NSArray)dropSQLStrings
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mSqlDropStrings, "copy");
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

@end
