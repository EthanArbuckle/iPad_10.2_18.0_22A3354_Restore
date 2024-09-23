@implementation NWPBSendData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBSendData;
  -[NWPBSendData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBSendData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *messageData;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID)
    objc_msgSend(v3, "setObject:forKey:", clientUUID, CFSTR("clientUUID"));
  messageData = self->_messageData;
  if (messageData)
    objc_msgSend(v4, "setObject:forKey:", messageData, CFSTR("messageData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_receiveWindow);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("receiveWindow"));

  }
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
  objc_class *v12;
  uint64_t v13;
  void *v14;
  _BYTE *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  BOOL v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  int v64;
  uint64_t v65;
  unint64_t v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  int v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  int v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  int v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  int v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  int v94;
  int v95;

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
      v15 = (char *)a3 + *v9;
      if (*v15)
        goto LABEL_88;
      if (v6 >= v8)
        break;
      v16 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v6);
      *(_QWORD *)((char *)a3 + (int)v5) = v6 + 1;
      v17 = v16 & 0x7F;
      if ((v16 & 0x80) == 0)
        goto LABEL_40;
      v18 = *v4;
      v19 = *(_QWORD *)((char *)a3 + v18);
      if (v19 == -1 || v19 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v20 = v19 + 1;
      v21 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v19);
      *(_QWORD *)((char *)a3 + v18) = v20;
      v17 |= (unint64_t)(v21 & 0x7F) << 7;
      if ((v21 & 0x80000000) == 0)
        goto LABEL_40;
      v22 = *v4;
      v23 = *(_QWORD *)((char *)a3 + v22);
      if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v24 = v23 + 1;
      v25 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v23);
      *(_QWORD *)((char *)a3 + v22) = v24;
      v17 |= (unint64_t)(v25 & 0x7F) << 14;
      if ((v25 & 0x80000000) == 0)
        goto LABEL_40;
      v26 = *v4;
      v27 = *(_QWORD *)((char *)a3 + v26);
      if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v28 = v27 + 1;
      v29 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v27);
      *(_QWORD *)((char *)a3 + v26) = v28;
      v17 |= (unint64_t)(v29 & 0x7F) << 21;
      if ((v29 & 0x80000000) == 0)
        goto LABEL_40;
      v30 = *v4;
      v31 = *(_QWORD *)((char *)a3 + v30);
      if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v32 = v31 + 1;
      v33 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v31);
      *(_QWORD *)((char *)a3 + v30) = v32;
      v17 |= (unint64_t)(v33 & 0x7F) << 28;
      if ((v33 & 0x80000000) == 0)
        goto LABEL_40;
      v34 = *v4;
      v35 = *(_QWORD *)((char *)a3 + v34);
      if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v36 = v35 + 1;
      v37 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v35);
      *(_QWORD *)((char *)a3 + v34) = v36;
      if ((v37 & 0x80000000) == 0)
        goto LABEL_40;
      v38 = *v4;
      v39 = *(_QWORD *)((char *)a3 + v38);
      if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v40 = v39 + 1;
      v41 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v39);
      *(_QWORD *)((char *)a3 + v38) = v40;
      if ((v41 & 0x80000000) == 0)
        goto LABEL_40;
      v42 = *v4;
      v43 = *(_QWORD *)((char *)a3 + v42);
      if (v43 == -1 || v43 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v44 = v43 + 1;
      v45 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v43);
      *(_QWORD *)((char *)a3 + v42) = v44;
      if ((v45 & 0x80000000) == 0)
        goto LABEL_40;
      v46 = *v4;
      v47 = *(_QWORD *)((char *)a3 + v46);
      if (v47 == -1 || v47 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v48 = v47 + 1;
      v49 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v47);
      *(_QWORD *)((char *)a3 + v46) = v48;
      if ((v49 & 0x80000000) == 0)
        goto LABEL_40;
      v50 = *v4;
      v51 = *(_QWORD *)((char *)a3 + v50);
      if (v51 == -1 || v51 >= *(_QWORD *)((char *)a3 + *v7))
      {
LABEL_38:
        v15 = (char *)a3 + *v9;
        goto LABEL_39;
      }
      v52 = v51 + 1;
      v53 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v51);
      *(_QWORD *)((char *)a3 + v50) = v52;
      if (v53 < 0)
      {
        v17 = 0;
        v54 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }
LABEL_40:
      v54 = *((unsigned __int8 *)a3 + *v9);
      if (*((_BYTE *)a3 + *v9))
        v17 = 0;
LABEL_42:
      if (v54)
        v55 = 1;
      else
        v55 = (v17 & 7) == 4;
      if (v55)
        goto LABEL_88;
      v56 = v17 >> 3;
      if ((v17 >> 3) == 3)
      {
        *(_BYTE *)&self->_has |= 1u;
        v57 = *v4;
        v58 = *(_QWORD *)((char *)a3 + v57);
        if (v58 == -1 || v58 >= *(_QWORD *)((char *)a3 + *v7))
        {
          v61 = 0;
        }
        else
        {
          v59 = v58 + 1;
          v60 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v58);
          *(_QWORD *)((char *)a3 + v57) = v59;
          v61 = v60 & 0x7F;
          if ((v60 & 0x80) == 0)
            goto LABEL_85;
          v62 = *v4;
          v63 = *(_QWORD *)((char *)a3 + v62);
          if (v63 != -1 && v63 < *(_QWORD *)((char *)a3 + *v7))
          {
            v64 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v63);
            *(_QWORD *)((char *)a3 + v62) = v63 + 1;
            v61 = v61 & 0xFFFFC07F | ((v64 & 0x7F) << 7);
            if ((v64 & 0x80000000) == 0)
              goto LABEL_85;
            v65 = *v4;
            v66 = *(_QWORD *)((char *)a3 + v65);
            if (v66 != -1 && v66 < *(_QWORD *)((char *)a3 + *v7))
            {
              v67 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v66);
              *(_QWORD *)((char *)a3 + v65) = v66 + 1;
              v61 = v61 & 0xFFE03FFF | ((v67 & 0x7F) << 14);
              if ((v67 & 0x80000000) == 0)
                goto LABEL_85;
              v68 = *v4;
              v69 = *(_QWORD *)((char *)a3 + v68);
              if (v69 != -1 && v69 < *(_QWORD *)((char *)a3 + *v7))
              {
                v70 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v69);
                *(_QWORD *)((char *)a3 + v68) = v69 + 1;
                v61 = v61 & 0xF01FFFFF | ((v70 & 0x7F) << 21);
                if ((v70 & 0x80000000) == 0)
                  goto LABEL_85;
                v71 = *v4;
                v72 = *(_QWORD *)((char *)a3 + v71);
                if (v72 != -1 && v72 < *(_QWORD *)((char *)a3 + *v7))
                {
                  v73 = v72 + 1;
                  v74 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v72);
                  *(_QWORD *)((char *)a3 + v71) = v73;
                  v61 |= v74 << 28;
                  if ((v74 & 0x80000000) == 0)
                    goto LABEL_85;
                  v75 = *v4;
                  v76 = *(_QWORD *)((char *)a3 + v75);
                  if (v76 != -1 && v76 < *(_QWORD *)((char *)a3 + *v7))
                  {
                    v77 = v76 + 1;
                    v78 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v76);
                    *(_QWORD *)((char *)a3 + v75) = v77;
                    if ((v78 & 0x80000000) == 0)
                      goto LABEL_85;
                    v79 = *v4;
                    v80 = *(_QWORD *)((char *)a3 + v79);
                    if (v80 != -1 && v80 < *(_QWORD *)((char *)a3 + *v7))
                    {
                      v81 = v80 + 1;
                      v82 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v80);
                      *(_QWORD *)((char *)a3 + v79) = v81;
                      if ((v82 & 0x80000000) == 0)
                        goto LABEL_85;
                      v83 = *v4;
                      v84 = *(_QWORD *)((char *)a3 + v83);
                      if (v84 != -1 && v84 < *(_QWORD *)((char *)a3 + *v7))
                      {
                        v85 = v84 + 1;
                        v86 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v84);
                        *(_QWORD *)((char *)a3 + v83) = v85;
                        if ((v86 & 0x80000000) == 0)
                          goto LABEL_85;
                        v87 = *v4;
                        v88 = *(_QWORD *)((char *)a3 + v87);
                        if (v88 != -1 && v88 < *(_QWORD *)((char *)a3 + *v7))
                        {
                          v89 = v88 + 1;
                          v90 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v88);
                          *(_QWORD *)((char *)a3 + v87) = v89;
                          if ((v90 & 0x80000000) == 0)
                            goto LABEL_85;
                          v91 = *v4;
                          v92 = *(_QWORD *)((char *)a3 + v91);
                          if (v92 != -1 && v92 < *(_QWORD *)((char *)a3 + *v7))
                          {
                            v93 = v92 + 1;
                            v94 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v92);
                            *(_QWORD *)((char *)a3 + v91) = v93;
                            if (v94 < 0)
                            {
                              v61 = 0;
LABEL_87:
                              self->_receiveWindow = v61;
                              goto LABEL_5;
                            }
LABEL_85:
                            if (*((_BYTE *)a3 + *v9))
                              v61 = 0;
                            goto LABEL_87;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        *((_BYTE *)a3 + *v9) = 1;
        goto LABEL_85;
      }
      if ((_DWORD)v56 == 2)
      {
        PBReaderReadData();
        v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v13 = 16;
LABEL_4:
        v14 = *(Class *)((char *)&self->super.super.isa + v13);
        *(Class *)((char *)&self->super.super.isa + v13) = v12;

        goto LABEL_5;
      }
      if ((_DWORD)v56 == 1)
      {
        PBReaderReadString();
        v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v13 = 8;
        goto LABEL_4;
      }
      v95 = PBReaderSkipValueWithTag();
      if (!v95)
        return v95;
LABEL_5:
      v5 = *v4;
      v6 = *(_QWORD *)((char *)a3 + v5);
      v8 = *(_QWORD *)((char *)a3 + *v7);
      if (v6 >= v8)
        goto LABEL_88;
    }
    v17 = 0;
LABEL_39:
    *v15 = 1;
    goto LABEL_40;
  }
LABEL_88:
  LOBYTE(v95) = *((_BYTE *)a3 + *v9) == 0;
  return v95;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_receiveWindow;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientUUID;
  NSData *messageData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientUUID, "isEqual:"))
      goto LABEL_10;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](messageData, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_receiveWindow == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_clientUUID, "hash");
  v4 = -[NSData hash](self->_messageData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_receiveWindow;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
}

@end
