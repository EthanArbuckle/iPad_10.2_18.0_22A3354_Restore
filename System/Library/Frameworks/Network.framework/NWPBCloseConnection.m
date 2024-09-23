@implementation NWPBCloseConnection

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBCloseConnection;
  -[NWPBCloseConnection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBCloseConnection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID)
    objc_msgSend(v3, "setObject:forKey:", clientUUID, CFSTR("clientUUID"));
  return v4;
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
  NSString *v12;
  NSString *clientUUID;
  _BYTE *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  int v53;
  BOOL v54;
  int v55;

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
      v14 = (char *)a3 + *v9;
      if (*v14)
        goto LABEL_48;
      if (v6 >= v8)
        break;
      v15 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v6);
      *(_QWORD *)((char *)a3 + (int)v5) = v6 + 1;
      v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0)
        goto LABEL_39;
      v17 = *v4;
      v18 = *(_QWORD *)((char *)a3 + v17);
      if (v18 == -1 || v18 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v19 = v18 + 1;
      v20 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v18);
      *(_QWORD *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0)
        goto LABEL_39;
      v21 = *v4;
      v22 = *(_QWORD *)((char *)a3 + v21);
      if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v23 = v22 + 1;
      v24 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v22);
      *(_QWORD *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0)
        goto LABEL_39;
      v25 = *v4;
      v26 = *(_QWORD *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v27 = v26 + 1;
      v28 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v26);
      *(_QWORD *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0)
        goto LABEL_39;
      v29 = *v4;
      v30 = *(_QWORD *)((char *)a3 + v29);
      if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v31 = v30 + 1;
      v32 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v30);
      *(_QWORD *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0)
        goto LABEL_39;
      v33 = *v4;
      v34 = *(_QWORD *)((char *)a3 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v35 = v34 + 1;
      v36 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v34);
      *(_QWORD *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0)
        goto LABEL_39;
      v37 = *v4;
      v38 = *(_QWORD *)((char *)a3 + v37);
      if (v38 == -1 || v38 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v39 = v38 + 1;
      v40 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v38);
      *(_QWORD *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0)
        goto LABEL_39;
      v41 = *v4;
      v42 = *(_QWORD *)((char *)a3 + v41);
      if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v43 = v42 + 1;
      v44 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v42);
      *(_QWORD *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0)
        goto LABEL_39;
      v45 = *v4;
      v46 = *(_QWORD *)((char *)a3 + v45);
      if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_37;
      v47 = v46 + 1;
      v48 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v46);
      *(_QWORD *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0)
        goto LABEL_39;
      v49 = *v4;
      v50 = *(_QWORD *)((char *)a3 + v49);
      if (v50 == -1 || v50 >= *(_QWORD *)((char *)a3 + *v7))
      {
LABEL_37:
        v14 = (char *)a3 + *v9;
        goto LABEL_38;
      }
      v51 = v50 + 1;
      v52 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v50);
      *(_QWORD *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        v16 = 0;
        v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_41;
      }
LABEL_39:
      v53 = *((unsigned __int8 *)a3 + *v9);
      if (*((_BYTE *)a3 + *v9))
        v16 = 0;
LABEL_41:
      if (v53)
        v54 = 1;
      else
        v54 = (v16 & 7) == 4;
      if (v54)
        goto LABEL_48;
      if ((v16 >> 3) == 1)
      {
        PBReaderReadString();
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        clientUUID = self->_clientUUID;
        self->_clientUUID = v12;

      }
      else
      {
        v55 = PBReaderSkipValueWithTag();
        if (!v55)
          return v55;
      }
      v5 = *v4;
      v6 = *(_QWORD *)((char *)a3 + v5);
      v8 = *(_QWORD *)((char *)a3 + *v7);
      if (v6 >= v8)
        goto LABEL_48;
    }
    v16 = 0;
LABEL_38:
    *v14 = 1;
    goto LABEL_39;
  }
LABEL_48:
  LOBYTE(v55) = *((_BYTE *)a3 + *v9) == 0;
  return v55;
}

- (void)writeTo:(id)a3
{
  if (self->_clientUUID)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientUUID;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    clientUUID = self->_clientUUID;
    if ((unint64_t)clientUUID | v4[1])
      v6 = -[NSString isEqual:](clientUUID, "isEqual:");
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
  return -[NSString hash](self->_clientUUID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUUID, 0);
}

@end
