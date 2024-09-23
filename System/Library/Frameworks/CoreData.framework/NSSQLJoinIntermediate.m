@implementation NSSQLJoinIntermediate

+ (id)createJoinIntermediatesForKeypath:(uint64_t)a3 startEntity:(void *)a4 startAlias:(void *)a5 forScope:(uint64_t)a6 inStatementIntermediate:(void *)a7 inContext:
{
  int v12;
  char v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  int v27;
  int v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSSQLJoinIntermediate *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  int v42;
  int v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  char v55;

  objc_opt_self();
  v12 = objc_msgSend(a5, "isUpdateScoped");
  if ((v12 & 1) == 0 && (!a6 || !*(_QWORD *)(a6 + 112)))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Join being created outside a fetch scope for keypath %@ entity %@"), a2, a3);
    goto LABEL_71;
  }
  if ((objc_msgSend(a5, "isOrScoped") & 1) != 0)
    v49 = 1;
  else
    v49 = objc_msgSend(a5, "isTargetColumnsScoped");
  v44 = v12;
  if (objc_msgSend(a5, "isOrScoped"))
    v13 = objc_msgSend(a5, "isTargetColumnsScoped");
  else
    v13 = 1;
  v14 = objc_msgSend(a2, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v16 = (void *)objc_msgSend(a5, "disambiguationKeypath");
  v51 = objc_msgSend(a5, "disambiguatingEntity");
  if (v51 && objc_msgSend(v16, "count") <= v14)
  {
    if (objc_msgSend(v16, "count"))
    {
      v53 = v14;
      v20 = 0;
      do
      {
        v21 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v20), "isEqual:", objc_msgSend(a2, "objectAtIndex:", v20));
        if ((v21 & 1) == 0)
          break;
        ++v20;
      }
      while (v20 < objc_msgSend(v16, "count"));
      v55 = v21 ^ 1;
      v14 = v53;
      if (!v53)
        goto LABEL_65;
    }
    else
    {
      v55 = 0;
      if (!v14)
      {
LABEL_65:

        v41 = 0;
        return v41;
      }
    }
  }
  else
  {
    v55 = 1;
    if (!v14)
      goto LABEL_65;
  }
  v22 = 0;
  v52 = 0;
  v54 = v14;
  if (a6)
    v23 = v13;
  else
    v23 = 1;
  v45 = v23;
  v47 = a6;
  v48 = v14 - 1;
  v46 = (uint64_t)a5;
  while (1)
  {
    v24 = objc_msgSend(a2, "objectAtIndex:", v22);
    v25 = a3 ? (void *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", v24) : 0;
    v26 = v25 ? 1 : v55;
    if ((v26 & 1) == 0)
      break;
LABEL_32:
    v27 = objc_msgSend(v25, "propertyType");
    if (!v25)
      goto LABEL_67;
    v28 = v27;
    objc_msgSend(v15, "addObject:", v24);
    if ((v28 - 7) > 2)
      goto LABEL_61;
    if (v28 == 9)
    {
      v33 = v48 == v22 && objc_msgSend(a7, "objectForKey:", CFSTR("subqueryCollectionContext")) == 0;
      objc_opt_self();
      if (v52)
        v34 = (void *)v52[4];
      else
        v34 = 0;
      v35 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias");
      v36 = (void *)objc_msgSend((id)objc_msgSend(a7, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias");
      v37 = [NSSQLJoinIntermediate alloc];
      v38 = (void *)v35;
      a5 = (void *)v46;
      v30 = -[NSSQLJoinIntermediate initForRelationship:sourceAlias:destinationAlias:correlationAlias:direct:inScope:](v37, (uint64_t)v25, v34, v36, v38, v33, v46);
      a6 = v47;
    }
    else
    {
      if (v28 != 8)
      {
        if (v28 != 7 || v48 == v22 && !objc_msgSend(a7, "objectForKey:", CFSTR("subqueryCollectionContext")))
          goto LABEL_61;
        v29 = (_QWORD *)-[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:](a6, v15);
        if (v29)
        {
          v30 = v29;
          v31 = v29;
LABEL_53:
          a3 = objc_msgSend((id)v30[2], "destinationEntity");
          if (v49)
          {
            v30[6] = 2;
            if ((v45 & 1) == 0)
            {
              v39 = *(_QWORD *)(a6 + 64);
              if (v39)
                *(_BYTE *)(v39 + 48) = 1;
            }
          }
          if (a4 && !v30[3])
          {
            v40 = a4;

            v30[3] = a4;
          }

          v52 = v30;
          goto LABEL_61;
        }
      }
      objc_opt_self();
      if (v52)
        v32 = (void *)v52[4];
      else
        v32 = 0;
      v30 = -[NSSQLJoinIntermediate initForRelationship:sourceAlias:destinationAlias:correlationAlias:direct:inScope:]([NSSQLJoinIntermediate alloc], (uint64_t)v25, v32, (void *)objc_msgSend((id)objc_msgSend(a7, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias"), 0, 0, (uint64_t)a5);
    }
    -[NSSQLFetchIntermediate addJoinIntermediate:atKeypathWithComponents:](a6, (uint64_t)v30, v15);
    if (v30)
      goto LABEL_53;
LABEL_61:
    if (v54 == ++v22)
      goto LABEL_67;
  }
  if (v51)
  {
    v25 = (void *)objc_msgSend(*(id *)(v51 + 40), "objectForKey:", v24);
    goto LABEL_32;
  }
  objc_msgSend(0, "propertyType");
LABEL_67:

  v41 = v52;
  v42 = v44;
  if (!v52)
    v42 = 0;
  if (v42 != 1)
    return v41;
  v17 = (void *)MEMORY[0x1E0C99DA0];
  v18 = *MEMORY[0x1E0C99778];
  v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Join being created inside an update scope for keypath %@ entity %@"), a2, a3);
LABEL_71:
  objc_msgSend(a7, "setObject:forKey:", objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0), CFSTR("NSUnderlyingException"));
  return 0;
}

- (_QWORD)initForRelationship:(void *)a3 sourceAlias:(void *)a4 destinationAlias:(void *)a5 correlationAlias:(char)a6 direct:(uint64_t)a7 inScope:
{
  _QWORD *v12;
  _QWORD *v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)NSSQLJoinIntermediate;
  v12 = objc_msgSendSuper2(&v15, sel_initWithScope_, a7);
  v13 = v12;
  if (v12)
  {
    v12[2] = a2;
    v12[3] = a3;
    v13[4] = a4;
    v13[5] = a5;
    *((_BYTE *)v13 + 56) = a6;
  }
  return v13;
}

- (id)generateSQLStringInContext:(id)a3
{
  id v4;
  NSSQLRelationship *relationship;
  NSString *sourceAlias;
  unint64_t type;
  const __CFString *v8;
  _BOOL4 v9;
  NSString *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  _QWORD *v15;
  _QWORD *v16;
  NSSQLRelationship *v17;
  NSSQLRelationship *inverse;
  _QWORD *v20;
  unint64_t v21;
  const __CFString *v22;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  relationship = self->_relationship;
  if (relationship && relationship->super._propertyType == 7)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    sourceAlias = self->_sourceAlias;
    if (!sourceAlias)
      sourceAlias = -[NSSQLIntermediate governingAlias](self, "governingAlias");
    type = self->_type;
    if (type == 1)
    {
      v8 = CFSTR("INNER ");
    }
    else
    {
      if (type != 2)
        goto LABEL_23;
      v8 = CFSTR("LEFT OUTER ");
    }
    objc_msgSend(v4, "appendString:", v8);
LABEL_23:
    objc_msgSend(v4, "appendString:", CFSTR("JOIN "));
    objc_msgSend(v4, "appendString:", objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "tableName"));
    objc_msgSend(v4, "appendString:", CFSTR(" "));
    objc_msgSend(v4, "appendString:", self->_destinationAlias);
    objc_msgSend(v4, "appendString:", CFSTR(" ON "));
    objc_msgSend(v4, "appendString:", sourceAlias);
    objc_msgSend(v4, "appendString:", CFSTR("."));
    objc_msgSend(v4, "appendString:", -[NSSQLProperty columnName](self->_relationship, "columnName"));
    objc_msgSend(v4, "appendString:", CFSTR(" = "));
    objc_msgSend(v4, "appendString:", self->_destinationAlias);
    objc_msgSend(v4, "appendString:", CFSTR("."));
    v15 = -[NSSQLRelationship sourceEntity](self->_relationship, "sourceEntity");
    if (!v15)
    {
LABEL_32:
      objc_msgSend(v4, "appendString:", objc_msgSend(v15, "columnName"));
      return v4;
    }
LABEL_24:
    v15 = (_QWORD *)v15[16];
    goto LABEL_32;
  }
  v9 = -[NSSQLProperty isToMany](relationship, "isToMany");
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = self->_sourceAlias;
  if (v9)
  {
    if (!v10)
      v10 = -[NSSQLIntermediate governingAlias](self, "governingAlias");
    v11 = self->_type;
    if (v11 == 1)
    {
      v12 = CFSTR("INNER ");
    }
    else
    {
      if (v11 != 2)
      {
LABEL_27:
        objc_msgSend(v4, "appendString:", CFSTR("JOIN "));
        objc_msgSend(v4, "appendString:", objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "tableName"));
        objc_msgSend(v4, "appendString:", CFSTR(" "));
        objc_msgSend(v4, "appendString:", self->_destinationAlias);
        objc_msgSend(v4, "appendString:", CFSTR(" ON "));
        objc_msgSend(v4, "appendString:", v10);
        objc_msgSend(v4, "appendString:", CFSTR("."));
        v16 = -[NSSQLRelationship sourceEntity](self->_relationship, "sourceEntity");
        if (v16)
          v16 = (_QWORD *)v16[16];
        objc_msgSend(v4, "appendString:", objc_msgSend(v16, "columnName"));
        objc_msgSend(v4, "appendString:", CFSTR(" = "));
        objc_msgSend(v4, "appendString:", self->_destinationAlias);
        objc_msgSend(v4, "appendString:", CFSTR("."));
        v17 = self->_relationship;
        if (v17)
          inverse = v17->_inverse;
        else
          inverse = 0;
        v15 = -[NSSQLRelationship foreignKey](inverse, "foreignKey");
        goto LABEL_32;
      }
      v12 = CFSTR("LEFT OUTER ");
    }
    objc_msgSend(v4, "appendString:", v12);
    goto LABEL_27;
  }
  if (!v10)
    v10 = -[NSSQLIntermediate governingAlias](self, "governingAlias");
  v13 = self->_type;
  if (v13 == 1)
  {
    v14 = CFSTR("INNER ");
  }
  else
  {
    if (v13 != 2)
      goto LABEL_36;
    v14 = CFSTR("LEFT OUTER ");
  }
  objc_msgSend(v4, "appendString:", v14);
LABEL_36:
  objc_msgSend(v4, "appendString:", CFSTR("JOIN "));
  objc_msgSend(v4, "appendString:", -[NSSQLRelationship correlationTableName](self->_relationship, "correlationTableName"));
  objc_msgSend(v4, "appendString:", CFSTR(" "));
  objc_msgSend(v4, "appendString:", self->_correlationAlias);
  objc_msgSend(v4, "appendString:", CFSTR(" ON "));
  objc_msgSend(v4, "appendString:", v10);
  objc_msgSend(v4, "appendString:", CFSTR("."));
  v20 = -[NSSQLRelationship sourceEntity](self->_relationship, "sourceEntity");
  if (v20)
    v20 = (_QWORD *)v20[16];
  objc_msgSend(v4, "appendString:", objc_msgSend(v20, "columnName"));
  objc_msgSend(v4, "appendString:", CFSTR(" = "));
  objc_msgSend(v4, "appendString:", self->_correlationAlias);
  objc_msgSend(v4, "appendString:", CFSTR("."));
  objc_msgSend(v4, "appendString:", -[NSSQLProperty columnName](self->_relationship, "columnName"));
  if (!self->_direct)
  {
    v21 = self->_type;
    if (v21 == 1)
    {
      v22 = CFSTR(" INNER");
    }
    else
    {
      if (v21 != 2)
        goto LABEL_44;
      v22 = CFSTR(" LEFT OUTER");
    }
    objc_msgSend(v4, "appendString:", v22);
LABEL_44:
    objc_msgSend(v4, "appendString:", CFSTR(" JOIN "));
    objc_msgSend(v4, "appendString:", objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "tableName"));
    objc_msgSend(v4, "appendString:", CFSTR(" "));
    objc_msgSend(v4, "appendString:", self->_destinationAlias);
    objc_msgSend(v4, "appendString:", CFSTR(" ON "));
    objc_msgSend(v4, "appendString:", self->_correlationAlias);
    objc_msgSend(v4, "appendString:", CFSTR("."));
    objc_msgSend(v4, "appendString:", -[NSSQLManyToMany inverseColumnName]((const __CFString *)self->_relationship));
    objc_msgSend(v4, "appendString:", CFSTR(" = "));
    objc_msgSend(v4, "appendString:", self->_destinationAlias);
    objc_msgSend(v4, "appendString:", CFSTR("."));
    v15 = -[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity");
    if (!v15)
      goto LABEL_32;
    goto LABEL_24;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_relationship = 0;

  self->_sourceAlias = 0;
  self->_destinationAlias = 0;

  self->_correlationAlias = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLJoinIntermediate;
  -[NSSQLJoinIntermediate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source (%@, %@), destination (%@, %@), correlation (%@)"), objc_msgSend(-[NSSQLProperty entity](self->_relationship, "entity"), "name"), self->_sourceAlias, objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "name"), self->_destinationAlias, self->_correlationAlias);
}

@end
