@implementation NSSQLUpdateColumnsIntermediate

- (NSSQLUpdateColumnsIntermediate)initWithPropertiesToUpdate:(id)a3 inScope:(id)a4
{
  NSSQLUpdateColumnsIntermediate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLUpdateColumnsIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5)
    v5->_propertiesToUpdate = (NSDictionary *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_propertiesToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLUpdateColumnsIntermediate;
  -[NSSQLUpdateColumnsIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  id v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  id *v14;
  int v15;
  uint64_t v16;
  NSSQLConstantValueIntermediate *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  _QWORD *v27;
  int v28;
  void *v29;
  NSSQLUpdateColumnsIntermediate *v30;
  id *v31;
  uint64_t v32;
  NSSQLSubqueryExpressionIntermediate *v33;
  id v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSQLSubqueryExpressionIntermediate *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  BOOL v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v86;
  const __CFString *v87;
  id v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  id *v93;
  id v94;
  id v95;
  NSDictionary *obj;
  id v97;
  NSSQLUpdateColumnsIntermediate *v98;
  uint64_t v99;
  uint64_t v100;
  _OWORD v101[4];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = (id *)objc_msgSend(a3, "objectForKey:", CFSTR("entity"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = self->_propertiesToUpdate;
  v100 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
  if (!v100)
    goto LABEL_103;
  v7 = 0;
  v98 = self;
  v99 = *(_QWORD *)v103;
  v95 = v5;
  do
  {
    v8 = 0;
    v92 = v100 + v7;
    do
    {
      if (*(_QWORD *)v103 != v99)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v8);
      if (v7)
        objc_msgSend(v5, "appendString:", CFSTR(", "));
      v10 = -[NSDictionary objectForKey:](self->_propertiesToUpdate, "objectForKey:", v9);
      v11 = objc_msgSend(v9, "_propertyType");
      v12 = objc_msgSend(v9, "_qualifiedName");
      if (!v6 || (v13 = (id *)objc_msgSend(v6[5], "objectForKey:", v12)) == 0)
      {
        v63 = (void *)MEMORY[0x1E0C99DA0];
        v64 = *MEMORY[0x1E0C99778];
        v65 = a3;
        v66 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find property %@ on entity %@"), objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription"));
        goto LABEL_111;
      }
      v14 = v13;
      v15 = objc_msgSend(v13, "propertyType");
      if (v15 == 1)
      {
        if (objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "_propertyType") == 6)
        {
          v63 = (void *)MEMORY[0x1E0C99DA0];
          v64 = *MEMORY[0x1E0C99778];
          v65 = a3;
          v66 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property for update (can't batch update derived attributes) %@/%@"), objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription"));
          goto LABEL_111;
        }
      }
      else if (v15 != 7)
      {
        v63 = (void *)MEMORY[0x1E0C99DA0];
        v64 = *MEMORY[0x1E0C99778];
        v65 = a3;
        v66 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property for update (not an attribute or a to one) %@/%@"), objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription"));
LABEL_111:
        v67 = objc_msgSend(v63, "exceptionWithName:reason:userInfo:", v64, v66, 0);
        v68 = v65;
        goto LABEL_136;
      }
      v16 = objc_msgSend(v10, "expressionType");
      if (v16 > 9)
      {
        if (v16 == 10)
          goto LABEL_30;
        if (v16 == 13)
        {
          v97 = v10;
          v33 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", v10, 0, self);
          v34 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v33, "generateSQLStringInContext:", a3);

          if (!v34)
          {
            v10 = v97;
            if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
            {
              v76 = (void *)MEMORY[0x1E0C99DA0];
              v77 = *MEMORY[0x1E0C99778];
              v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for update expression %@"), v97, v89);
              goto LABEL_131;
            }
            goto LABEL_133;
          }
          v17 = (NSSQLConstantValueIntermediate *)objc_msgSend((id)objc_msgSend(v14, "columnName"), "mutableCopy");
          -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", CFSTR(" = "));
          -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", v34);

          v10 = v97;
          goto LABEL_45;
        }
        if (v16 != 50)
        {
LABEL_112:
          v69 = (void *)MEMORY[0x1E0C99DA0];
          v70 = v10;
          v71 = *MEMORY[0x1E0C99778];
          v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid expression (%@) in propertiesToUpdate"), v70);
          goto LABEL_135;
        }
        v20 = (void *)objc_msgSend(v10, "expressionValueWithObject:context:", 0, 0);
        if (!v20)
        {
          v69 = (void *)MEMORY[0x1E0C99DA0];
          v74 = v10;
          v71 = *MEMORY[0x1E0C99778];
          v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch request expression evaluation (%@) failed"), v74);
          goto LABEL_135;
        }
        v21 = v20;
        if (!objc_msgSend(v20, "isNSArray"))
          goto LABEL_93;
        v22 = objc_msgSend(v21, "count");
        if (v22)
        {
          if (v22 != 1)
            goto LABEL_148;
          v21 = (void *)objc_msgSend(v21, "lastObject");
          objc_opt_class();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = (void *)objc_msgSend(v21, "objectID");
            goto LABEL_79;
          }
          objc_opt_class();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_79:
            self = v98;
LABEL_93:
            if (v11 == 4)
            {
              v97 = v10;
              v76 = (void *)MEMORY[0x1E0C99DA0];
              v77 = *MEMORY[0x1E0C99778];
              v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate new column values for %@ - incompatible destination: %@"), objc_msgSend(v14, "name"), v21);
              goto LABEL_131;
            }
            v30 = self;
            v31 = v14;
            v32 = (uint64_t)v21;
            goto LABEL_95;
          }
          self = v98;
          if (objc_msgSend(v21, "isNSDictionary") && objc_msgSend(v21, "count"))
          {
            if (objc_msgSend(v21, "count") != 1)
            {
LABEL_148:
              v69 = (void *)MEMORY[0x1E0C99DA0];
              v88 = v10;
              v71 = *MEMORY[0x1E0C99778];
              v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid fetch expression (%@) in propertiesToUpdate - fetch has multiple results"), v88);
              goto LABEL_135;
            }
            memset(v101, 0, sizeof(v101));
            if (objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v101, v106, 16))
            {
              v21 = (void *)objc_msgSend(v21, "objectForKey:", **((_QWORD **)&v101[0] + 1));
              goto LABEL_93;
            }
          }
        }
        v21 = 0;
        goto LABEL_93;
      }
      if (v16)
      {
        if (v16 != 3)
        {
          if (v16 != 4)
            goto LABEL_112;
          if (v11 == 4)
          {
            v69 = (void *)MEMORY[0x1E0C99DA0];
            v73 = v10;
            v71 = *MEMORY[0x1E0C99778];
            v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid value expression (%@) in propertiesToUpdate : what does it mean to update a relationship to the result of a function?"), v73);
            goto LABEL_135;
          }
          v17 = (NSSQLConstantValueIntermediate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ "), objc_msgSend(v14, "columnName"));
          v18 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v10, 0, a3);
          if (!v18)
          {
            if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch request expression evaluation (%@) failed"), v10), 0), CFSTR("NSUnderlyingException"));

LABEL_137:
            return 0;
          }
          v19 = v18;
          -[NSSQLConstantValueIntermediate appendFormat:](v17, "appendFormat:", CFSTR(" = %@"), v18);

LABEL_45:
          self = v98;
          if (!v17)
            goto LABEL_133;
          goto LABEL_96;
        }
LABEL_30:
        v97 = v10;
        v23 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", CFSTR("."));
        if (objc_msgSend(v23, "count") != 1)
        {
          v93 = v6;
          v94 = a3;
          v35 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("entity")), "entityDescription");
          v91 = objc_msgSend(v23, "count");
          v36 = v91 - 1;
          v90 = objc_msgSend((id)objc_msgSend(v23, "lastObject"), "hasPrefix:", CFSTR("@"));
          v37 = 0;
          v38 = 0;
          while (1)
          {
            v39 = (void *)objc_msgSend(v23, "objectAtIndex:", v37);
            if (!v35)
              break;
            v40 = (void *)objc_msgSend((id)objc_msgSend(v35, "propertiesByName"), "objectForKey:", v39);
            if (!v40)
              break;
            v41 = v40;
            if (objc_msgSend(v40, "_isAttribute"))
            {
              if (v36 == v37)
                goto LABEL_64;
              v43 = v90;
              if (v91 - 2 != v37)
                v43 = 0;
              if ((v43 & 1) != 0)
                goto LABEL_64;
              v87 = CFSTR("Can't generate SQL for keypath %@ : invalid attribute name location");
LABEL_106:
              a3 = v94;
              v5 = v95;
LABEL_107:
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v87, objc_msgSend(v23, "componentsJoinedByString:", CFSTR("."))), 0), CFSTR("NSUnderlyingException"));
              v10 = v97;
              goto LABEL_108;
            }
            if (objc_msgSend(v41, "_isRelationship"))
            {
              v35 = (void *)objc_msgSend(v41, "destinationEntity");
              v42 = objc_msgSend(v41, "isToMany");
              if ((v42 & v38 & 1) != 0)
              {
                v87 = CFSTR("Can't generate SQL for keypath %@ : multiple to many keypath components");
                goto LABEL_106;
              }
              v38 |= v42;
            }
            if (++v37 > v36)
              goto LABEL_64;
          }
          if (!objc_msgSend(v39, "hasPrefix:", CFSTR("@")))
          {
            a3 = v94;
            v5 = v95;
            v87 = CFSTR("Can't generate SQL for keypath %@ : invalid keypath");
            goto LABEL_107;
          }
          if (v36 != v37)
          {
            v87 = CFSTR("Can't generate SQL for keypath %@ : invalid location of keypath aggregate function");
            goto LABEL_106;
          }
LABEL_64:
          v44 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), objc_msgSend(v23, "lastObject")));
          v45 = objc_msgSend((id)objc_msgSend(v23, "subarrayWithRange:", 0, objc_msgSend(v23, "count") - 1), "componentsJoinedByString:", CFSTR("."));
          v46 = -[NSSQLIntermediate governingAlias](v98->super._scope, "governingAlias");
          a3 = v94;
          if (!v46)
            v46 = -[NSSQLAliasGenerator generateVariableAlias](objc_msgSend(v94, "objectForKey:", CFSTR("aliasGenerator")));
          v47 = (void *)MEMORY[0x1E0CB35D0];
          v48 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v45);
          v49 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", objc_msgSend(v47, "expressionForSubquery:usingIteratorVariable:predicate:", v48, v46, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1)), v44, v98);

          v50 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v49, "generateSQLStringInContext:", v94);
          v6 = v93;
          if (v50)
          {
            v17 = (NSSQLConstantValueIntermediate *)objc_msgSend((id)objc_msgSend(v14, "columnName"), "mutableCopy");
            -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", CFSTR(" = "));
            -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", v50);

            v5 = v95;
            goto LABEL_68;
          }
          v5 = v95;
          v10 = v97;
          if (!objc_msgSend(v94, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
            v87 = CFSTR("Can't generate SQL for keypath %@ : unexpected problem");
            goto LABEL_107;
          }
LABEL_108:
          if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
            v59 = (void *)MEMORY[0x1E0C99DA0];
            v60 = *MEMORY[0x1E0C99778];
            v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for components %@"), v23);
            v62 = v60;
            v10 = v97;
            objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v59, "exceptionWithName:reason:userInfo:", v62, v61, 0), CFSTR("NSUnderlyingException"));
          }
          goto LABEL_129;
        }
        v24 = objc_msgSend(v23, "lastObject");
        v25 = objc_msgSend(v14, "propertyType");
        v26 = objc_msgSend(v14, "entity");
        if (v26)
          v27 = (_QWORD *)objc_msgSend(*(id *)(v26 + 40), "objectForKey:", v24);
        else
          v27 = 0;
        v28 = objc_msgSend(v27, "propertyType");
        if (v28 != 1 && v28 != 7)
        {
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99778];
          v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath for update (not an attribute or a to one) %@"), objc_msgSend(v14, "name"), v89);
LABEL_128:
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v79, "exceptionWithName:reason:userInfo:", v80, v81, 0), CFSTR("NSUnderlyingException"));
          v10 = v97;
LABEL_129:
          if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
            v76 = (void *)MEMORY[0x1E0C99DA0];
            v82 = v10;
            v77 = *MEMORY[0x1E0C99778];
            v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath expression (%@) in propertiesToUpdate - joins unsupported here"), v82, v89);
LABEL_131:
            v83 = objc_msgSend(v76, "exceptionWithName:reason:userInfo:", v77, v78, 0);
LABEL_132:
            objc_msgSend(a3, "setObject:forKey:", v83, CFSTR("NSUnderlyingException"));
            v10 = v97;
          }
LABEL_133:
          if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
            goto LABEL_137;
          v69 = (void *)MEMORY[0x1E0C99DA0];
          v84 = v10;
          v71 = *MEMORY[0x1E0C99778];
          v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate new column value from expression %@"), v84);
LABEL_135:
          v67 = objc_msgSend(v69, "exceptionWithName:reason:userInfo:", v71, v72, 0);
          v68 = a3;
LABEL_136:
          objc_msgSend(v68, "setObject:forKey:", v67, CFSTR("NSUnderlyingException"));
          goto LABEL_137;
        }
        if (v25 != v28)
        {
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99778];
          v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to insert a relationship value into an attribute or vice versa is not supported %@/%@"), objc_msgSend(v14, "name"), objc_msgSend(v27, "name"));
          goto LABEL_128;
        }
        if (objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "_propertyType") != 4)
        {
          v17 = (NSSQLConstantValueIntermediate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ = %@"), objc_msgSend(v14, "columnName"), objc_msgSend(v27, "columnName"));
LABEL_68:
          v10 = v97;
LABEL_85:
          self = v98;
          if (!v17)
            goto LABEL_129;
          goto LABEL_96;
        }
        if (v14[9])
        {
          if (!v27 || !v27[9])
            goto LABEL_124;
        }
        else if (v27 && v27[9])
        {
LABEL_124:
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99778];
          v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate new column values for destination - incompatible entity foreign key state: %@"), v14, v89);
          goto LABEL_128;
        }
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription"), "_subentitiesIncludes:", objc_msgSend((id)objc_msgSend(v27, "destinationEntity"), "entityDescription")) & 1) == 0)goto LABEL_124;
        v17 = (NSSQLConstantValueIntermediate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ = %@"), objc_msgSend(v14, "columnName"), objc_msgSend(v27, "columnName"));
        v51 = objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription");
        v52 = v51;
        if (v51)
        {
          v10 = v97;
          if (!objc_msgSend(*(id *)(v51 + 144), "count"))
          {
            if ((*(_BYTE *)(v52 + 120) & 4) != 0)
            {
              v54 = *(void **)(v52 + 72);
            }
            else
            {
              v53 = (void *)v52;
              do
              {
                v54 = v53;
                v53 = (void *)objc_msgSend(v53, "superentity");
              }
              while (v53);
            }
LABEL_81:
            v55 = v54 == (void *)v52;
            v10 = v97;
            if (v55)
              goto LABEL_85;
          }
        }
        else
        {
          v10 = v97;
          if (!objc_msgSend(0, "count"))
          {
            v54 = 0;
            goto LABEL_81;
          }
        }
        v56 = objc_msgSend(v14[9], "columnName");
        if (v27)
          v57 = (void *)v27[9];
        else
          v57 = 0;
        -[NSSQLConstantValueIntermediate appendFormat:](v17, "appendFormat:", CFSTR(", %@ = %@"), v56, objc_msgSend(v57, "columnName"));
        v5 = v95;
        goto LABEL_85;
      }
      v29 = (void *)objc_msgSend(v10, "constantValue");
      if (v11 == 4)
      {
        objc_opt_class();
        v97 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v75 = objc_msgSend(v29, "objectID");
        }
        else
        {
          objc_opt_class();
          v75 = (uint64_t)v29;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v75 = 0;
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v29)
              v29 = 0;
          }
        }
        v86 = *MEMORY[0x1E0C99778];
        if (!v75 && v29)
        {
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v86, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid new constant value %@ for %@ (not a managed object)"), v10, v9), 0), CFSTR("NSUnderlyingException"));

          return 0;
        }
        v83 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v86, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate new column values for %@ - incompatible destination: %@"), objc_msgSend(v14, "name"), v75), 0);
        goto LABEL_132;
      }
      v30 = v98;
      v31 = v14;
      v32 = (uint64_t)v29;
      self = v98;
LABEL_95:
      v17 = -[NSSQLUpdateColumnsIntermediate _generateSQLForAttributeUpdate:value:inContext:]((uint64_t)v30, v31, v32, a3);
      if (!v17)
        goto LABEL_133;
LABEL_96:
      ++v7;
      objc_msgSend(v5, "appendString:", v17);

      ++v8;
    }
    while (v8 != v100);
    v58 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
    v7 = v92;
    v100 = v58;
  }
  while (v58);
LABEL_103:
  objc_msgSend(v5, "appendString:", CFSTR(", Z_OPT = (Z_OPT + 1) "));
  return v5;
}

- (NSSQLConstantValueIntermediate)_generateSQLForAttributeUpdate:(uint64_t)a3 value:(void *)a4 inContext:
{
  NSSQLConstantValueIntermediate *v8;
  NSSQLConstantValueIntermediate *v9;
  uint64_t v10;
  void *v11;

  if (!a1)
    return 0;
  v8 = (NSSQLConstantValueIntermediate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ "), objc_msgSend(a2, "columnName"));
  v9 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:ofType:inScope:context:", a3, objc_msgSend(a2, "sqlType"), a1, a4);
  v10 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v9, "generateSQLStringInContext:", a4);
  if (v10)
  {
    v11 = (void *)v10;
    -[NSSQLConstantValueIntermediate appendFormat:](v8, "appendFormat:", CFSTR("= %@"), v10);

  }
  else
  {
    if (!objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate new column value from value: %@"), a3), 0), CFSTR("NSUnderlyingException"));

    v9 = v8;
    v8 = 0;
  }

  return v8;
}

- (BOOL)isUpdateColumnsScoped
{
  return 1;
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return &stru_1E1EE23F0;
}

- (NSDictionary)propertiesToUpdate
{
  return self->_propertiesToUpdate;
}

- (void)setPropertiesToUpdate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
