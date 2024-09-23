@implementation NWPBUpdatePath

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBUpdatePath;
  -[NWPBUpdatePath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBUpdatePath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NWPBPath *responsePath;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  responsePath = self->_responsePath;
  if (responsePath)
  {
    -[NWPBPath dictionaryRepresentation](responsePath, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("responsePath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  uint64_t v5;
  unint64_t v6;
  int *v7;
  unint64_t v8;
  int *v9;
  int *v11;
  int v12;
  _BYTE *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  int v52;
  BOOL v53;
  NWPBPath *v54;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int)*MEMORY[0x1E0D82BF0];
  v6 = *(_QWORD *)((char *)a3 + v5);
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]);
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      v13 = (char *)a3 + *v9;
      if (*v13)
        goto LABEL_49;
      if (v6 >= v8)
        break;
      v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v6);
      *(_QWORD *)((char *)a3 + (int)v5) = v6 + 1;
      v15 = v14 & 0x7F;
      if ((v14 & 0x80) == 0)
        goto LABEL_39;
      v16 = *v4;
      v17 = *(_QWORD *)((char *)a3 + v16);
      if (v17 == -1 || v17 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v18 = v17 + 1;
      v19 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v17);
      *(_QWORD *)((char *)a3 + v16) = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << 7;
      if ((v19 & 0x80000000) == 0)
        goto LABEL_39;
      v20 = *v4;
      v21 = *(_QWORD *)((char *)a3 + v20);
      if (v21 == -1 || v21 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v22 = v21 + 1;
      v23 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v21);
      *(_QWORD *)((char *)a3 + v20) = v22;
      v15 |= (unint64_t)(v23 & 0x7F) << 14;
      if ((v23 & 0x80000000) == 0)
        goto LABEL_39;
      v24 = *v4;
      v25 = *(_QWORD *)((char *)a3 + v24);
      if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v26 = v25 + 1;
      v27 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v25);
      *(_QWORD *)((char *)a3 + v24) = v26;
      v15 |= (unint64_t)(v27 & 0x7F) << 21;
      if ((v27 & 0x80000000) == 0)
        goto LABEL_39;
      v28 = *v4;
      v29 = *(_QWORD *)((char *)a3 + v28);
      if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v30 = v29 + 1;
      v31 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v29);
      *(_QWORD *)((char *)a3 + v28) = v30;
      v15 |= (unint64_t)(v31 & 0x7F) << 28;
      if ((v31 & 0x80000000) == 0)
        goto LABEL_39;
      v32 = *v4;
      v33 = *(_QWORD *)((char *)a3 + v32);
      if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v34 = v33 + 1;
      v35 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v33);
      *(_QWORD *)((char *)a3 + v32) = v34;
      if ((v35 & 0x80000000) == 0)
        goto LABEL_39;
      v36 = *v4;
      v37 = *(_QWORD *)((char *)a3 + v36);
      if (v37 == -1 || v37 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v38 = v37 + 1;
      v39 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v37);
      *(_QWORD *)((char *)a3 + v36) = v38;
      if ((v39 & 0x80000000) == 0)
        goto LABEL_39;
      v40 = *v4;
      v41 = *(_QWORD *)((char *)a3 + v40);
      if (v41 == -1 || v41 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v42 = v41 + 1;
      v43 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v41);
      *(_QWORD *)((char *)a3 + v40) = v42;
      if ((v43 & 0x80000000) == 0)
        goto LABEL_39;
      v44 = *v4;
      v45 = *(_QWORD *)((char *)a3 + v44);
      if (v45 == -1 || v45 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v46 = v45 + 1;
      v47 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v45);
      *(_QWORD *)((char *)a3 + v44) = v46;
      if ((v47 & 0x80000000) == 0)
        goto LABEL_39;
      v48 = *v4;
      v49 = *(_QWORD *)((char *)a3 + v48);
      if (v49 == -1 || v49 >= *(_QWORD *)((char *)a3 + *v7))
      {
LABEL_37:
        v13 = (char *)a3 + *v9;
        goto LABEL_38;
      }
      v50 = v49 + 1;
      v51 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v49);
      *(_QWORD *)((char *)a3 + v48) = v50;
      if (v51 < 0)
      {
        v15 = 0;
        v52 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_41;
      }
LABEL_39:
      v52 = *((unsigned __int8 *)a3 + *v9);
      if (*((_BYTE *)a3 + *v9))
        v15 = 0;
LABEL_41:
      if (v52)
        v53 = 1;
      else
        v53 = (v15 & 7) == 4;
      if (v53)
        goto LABEL_49;
      if ((v15 >> 3) == 1)
      {
        v54 = objc_alloc_init(NWPBPath);
        objc_storeStrong((id *)&self->_responsePath, v54);
        if (!PBReaderPlaceMark() || (NWPBPathReadFrom((uint64_t)v54, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v12) = 0;
          return v12;
        }
        PBReaderRecallMark();

      }
      else
      {
        v12 = PBReaderSkipValueWithTag();
        if (!v12)
          return v12;
      }
      v5 = *v4;
      v6 = *(_QWORD *)((char *)a3 + v5);
      v8 = *(_QWORD *)((char *)a3 + *v7);
      if (v6 >= v8)
        goto LABEL_49;
    }
    v15 = 0;
LABEL_38:
    *v13 = 1;
    goto LABEL_39;
  }
LABEL_49:
  LOBYTE(v12) = *((_BYTE *)a3 + *v9) == 0;
  return v12;
}

- (void)writeTo:(id)a3
{
  if (self->_responsePath)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NWPBPath copyWithZone:](self->_responsePath, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NWPBPath *responsePath;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    responsePath = self->_responsePath;
    if ((unint64_t)responsePath | v4[1])
      v6 = -[NWPBPath isEqual:](responsePath, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NWPBPath hash](self->_responsePath, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePath, 0);
}

@end
