@implementation NSSQLManyToMany

- (NSSQLManyToMany)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLManyToMany *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLManyToMany;
  result = -[NSSQLRelationship initWithEntity:propertyDescription:](&v5, sel_initWithEntity_propertyDescription_, a3, a4);
  if (result)
    result->super.super._propertyType = 9;
  return result;
}

- (void)_setInverseManyToMany:(_QWORD *)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = objc_msgSend(a1, "entity");
  if (a1[7] != a2)
  {
    -[NSSQLRelationship _setInverseRelationship:](a1, (_QWORD *)a2);
    if (a1[8])
    {
      if (!a2)
      {
LABEL_12:
        -[NSSQLManyToMany _setInverseManyToMany:](a2, a1);
        goto LABEL_13;
      }
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v4)
        v6 = *(unsigned int *)(v4 + 184);
      else
        v6 = 0;
      v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@_%d%@"), CFSTR("Z"), v6, objc_msgSend((id)objc_msgSend(a1, "name"), "uppercaseString"));
      v8 = (void *)a1[8];
      if (v8 != v7)
      {

        a1[8] = objc_msgSend(v7, "copy");
      }

      -[NSSQLRelationship _setInverseRelationship:]((_QWORD *)a2, a1);
      if (!a2)
        goto LABEL_12;
    }
    if (*(_BYTE *)(a2 + 24) != 9)
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99768];
      v33[0] = CFSTR("entity");
      v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entity"), "entityDescription"), "name");
      if (v26)
        v27 = (const __CFString *)v26;
      else
        v27 = CFSTR("nil");
      v34[0] = v27;
      v33[1] = CFSTR("relationship");
      v28 = objc_msgSend(a1, "name");
      if (v28)
        v29 = (const __CFString *)v28;
      else
        v29 = CFSTR("nil");
      v34[1] = v29;
      v33[2] = CFSTR("inverse");
      v30 = objc_msgSend((id)a2, "name");
      if (v30)
        v31 = (const __CFString *)v30;
      else
        v31 = CFSTR("nil");
      v34[2] = v31;
      objc_exception_throw((id)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, CFSTR("improper model with nonsensical relationship definitions"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3)));
    }
    goto LABEL_12;
  }
LABEL_13:
  if (!a1[9])
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v4)
      v10 = *(unsigned int *)(v4 + 184);
    else
      v10 = 0;
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@_%d%@"), CFSTR("Z"), v10, objc_msgSend((id)objc_msgSend((id)a2, "name"), "uppercaseString"));
    if (v4)
      v12 = *(_QWORD *)(v4 + 176);
    else
      v12 = 0;
    v13 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v12, v11);
    v14 = (void *)a1[9];
    if (v14 != (void *)v13)
    {
      v15 = (void *)v13;

      a1[9] = objc_msgSend(v15, "copy");
    }

  }
  if (!a1[10])
  {
    v16 = a2 ? (void *)objc_msgSend((id)a2, "propertyDescription") : 0;
    if (objc_msgSend(v16, "isOrdered"))
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v4)
        v18 = *(unsigned int *)(v4 + 184);
      else
        v18 = 0;
      v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@_%d%@"), CFSTR("Z_FOK"), v18, objc_msgSend((id)objc_msgSend((id)a2, "name"), "uppercaseString"));
      if (v4)
        v20 = *(_QWORD *)(v4 + 176);
      else
        v20 = 0;
      v32 = v19;
      v21 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v20, v19);
      v22 = (void *)a1[10];
      if (v22 != (void *)v21)
      {
        v23 = (void *)v21;

        a1[10] = objc_msgSend(v23, "copy");
      }

    }
  }
}

- (id)correlationTableName
{
  if (self->_correlationTableName)
    return self->_correlationTableName;
  else
    return -[NSSQLRelationship correlationTableName](self->super._inverse, "correlationTableName");
}

- (id)columnName
{
  return self->_columnName;
}

- (__CFString)inverseOrderColumnName
{
  __CFString *length;

  if (result)
  {
    length = (__CFString *)result[1].length;
    if (length == result)
    {
      if (objc_msgSend((id)-[__CFString propertyDescription](result, "propertyDescription"), "isOrdered"))
        return CFSTR("FOK_REFLEXIVE");
      else
        return 0;
    }
    else if (length)
    {
      return (__CFString *)length[2].data;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (const)inverseColumnName
{
  if (result)
  {
    if ((const __CFString *)result[1].length == result)
      return CFSTR("REFLEXIVE");
    else
      return (const __CFString *)objc_msgSend((id)result[1].length, "columnName");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLManyToMany;
  -[NSSQLRelationship dealloc](&v3, sel_dealloc);
}

- (uint64_t)isTableSchemaEqual:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *length;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  if (!result)
    return result;
  v3 = result;
  result = objc_msgSend(*(id *)(result + 72), "isEqualToString:", -[__CFString columnName](a2, "columnName"));
  if (!(_DWORD)result)
    return result;
  result = objc_msgSend(*(id *)(v3 + 64), "isEqualToString:", -[__CFString correlationTableName](a2, "correlationTableName"));
  if (!(_DWORD)result)
    return result;
  v4 = *(void **)(v3 + 56);
  if (v4 == (void *)v3)
  {
    v5 = CFSTR("REFLEXIVE");
    if (a2)
      goto LABEL_6;
LABEL_9:
    result = -[__CFString isEqualToString:](v5, "isEqualToString:", 0);
    if (!(_DWORD)result)
      return result;
    if (*(_QWORD *)(v3 + 80))
      return 0;
    goto LABEL_17;
  }
  v5 = (__CFString *)objc_msgSend(v4, "columnName");
  if (!a2)
    goto LABEL_9;
LABEL_6:
  length = (__CFString *)a2[1].length;
  if (length == a2)
    v7 = CFSTR("REFLEXIVE");
  else
    v7 = (const __CFString *)-[__CFString columnName](length, "columnName");
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v7) & 1) == 0)
    return 0;
  v8 = *(void **)(v3 + 80);
  if ((v8 != 0) == (a2[2].data == 0))
    return 0;
  if (v8)
  {
    result = objc_msgSend(v8, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
  }
LABEL_17:
  v9 = *(_QWORD *)(v3 + 56);
  if (v9 == v3)
  {
    if (objc_msgSend((id)objc_msgSend((id)v3, "propertyDescription"), "isOrdered"))
      v10 = CFSTR("FOK_REFLEXIVE");
    else
      v10 = 0;
  }
  else if (v9)
  {
    v10 = *(__CFString **)(v9 + 80);
  }
  else
  {
    v10 = 0;
  }
  v11 = -[NSSQLManyToMany inverseOrderColumnName](a2);
  if ((v10 != 0) == (v11 == 0))
    return 0;
  if (!v10)
    return 1;
  result = -[__CFString isEqualToString:](v10, "isEqualToString:", v11);
  if ((_DWORD)result)
    return 1;
  return result;
}

@end
