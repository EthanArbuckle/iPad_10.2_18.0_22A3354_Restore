@implementation NWPBCommandMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBCommandMessage;
  -[NWPBCommandMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBCommandMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t command;
  __CFString *v5;
  NSData *messageData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    command = self->_command;
    if (command >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_command);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E14A4B20[command];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("command"));

  }
  messageData = self->_messageData;
  if (messageData)
    objc_msgSend(v3, "setObject:forKey:", messageData, CFSTR("messageData"));
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
  NSData *v12;
  NSData *messageData;
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
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  int v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  int v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  int v93;

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
        goto LABEL_85;
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
        goto LABEL_85;
      if ((v16 >> 3) == 2)
      {
        PBReaderReadData();
        v12 = (NSData *)objc_claimAutoreleasedReturnValue();
        messageData = self->_messageData;
        self->_messageData = v12;

      }
      else
      {
        if ((v16 >> 3) == 1)
        {
          *(_BYTE *)&self->_has |= 1u;
          v55 = *v4;
          v56 = *(_QWORD *)((char *)a3 + v55);
          if (v56 == -1 || v56 >= *(_QWORD *)((char *)a3 + *v7))
          {
            v59 = 0;
          }
          else
          {
            v57 = v56 + 1;
            v58 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v56);
            *(_QWORD *)((char *)a3 + v55) = v57;
            v59 = v58 & 0x7F;
            if ((v58 & 0x80) == 0)
              goto LABEL_82;
            v60 = *v4;
            v61 = *(_QWORD *)((char *)a3 + v60);
            if (v61 != -1 && v61 < *(_QWORD *)((char *)a3 + *v7))
            {
              v62 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v61);
              *(_QWORD *)((char *)a3 + v60) = v61 + 1;
              v59 = v59 & 0xFFFFC07F | ((v62 & 0x7F) << 7);
              if ((v62 & 0x80000000) == 0)
                goto LABEL_82;
              v63 = *v4;
              v64 = *(_QWORD *)((char *)a3 + v63);
              if (v64 != -1 && v64 < *(_QWORD *)((char *)a3 + *v7))
              {
                v65 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v64);
                *(_QWORD *)((char *)a3 + v63) = v64 + 1;
                v59 = v59 & 0xFFE03FFF | ((v65 & 0x7F) << 14);
                if ((v65 & 0x80000000) == 0)
                  goto LABEL_82;
                v66 = *v4;
                v67 = *(_QWORD *)((char *)a3 + v66);
                if (v67 != -1 && v67 < *(_QWORD *)((char *)a3 + *v7))
                {
                  v68 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v67);
                  *(_QWORD *)((char *)a3 + v66) = v67 + 1;
                  v59 = v59 & 0xF01FFFFF | ((v68 & 0x7F) << 21);
                  if ((v68 & 0x80000000) == 0)
                    goto LABEL_82;
                  v69 = *v4;
                  v70 = *(_QWORD *)((char *)a3 + v69);
                  if (v70 != -1 && v70 < *(_QWORD *)((char *)a3 + *v7))
                  {
                    v71 = v70 + 1;
                    v72 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v70);
                    *(_QWORD *)((char *)a3 + v69) = v71;
                    v59 |= v72 << 28;
                    if ((v72 & 0x80000000) == 0)
                      goto LABEL_82;
                    v73 = *v4;
                    v74 = *(_QWORD *)((char *)a3 + v73);
                    if (v74 != -1 && v74 < *(_QWORD *)((char *)a3 + *v7))
                    {
                      v75 = v74 + 1;
                      v76 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v74);
                      *(_QWORD *)((char *)a3 + v73) = v75;
                      if ((v76 & 0x80000000) == 0)
                        goto LABEL_82;
                      v77 = *v4;
                      v78 = *(_QWORD *)((char *)a3 + v77);
                      if (v78 != -1 && v78 < *(_QWORD *)((char *)a3 + *v7))
                      {
                        v79 = v78 + 1;
                        v80 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v78);
                        *(_QWORD *)((char *)a3 + v77) = v79;
                        if ((v80 & 0x80000000) == 0)
                          goto LABEL_82;
                        v81 = *v4;
                        v82 = *(_QWORD *)((char *)a3 + v81);
                        if (v82 != -1 && v82 < *(_QWORD *)((char *)a3 + *v7))
                        {
                          v83 = v82 + 1;
                          v84 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v82);
                          *(_QWORD *)((char *)a3 + v81) = v83;
                          if ((v84 & 0x80000000) == 0)
                            goto LABEL_82;
                          v85 = *v4;
                          v86 = *(_QWORD *)((char *)a3 + v85);
                          if (v86 != -1 && v86 < *(_QWORD *)((char *)a3 + *v7))
                          {
                            v87 = v86 + 1;
                            v88 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v86);
                            *(_QWORD *)((char *)a3 + v85) = v87;
                            if ((v88 & 0x80000000) == 0)
                              goto LABEL_82;
                            v89 = *v4;
                            v90 = *(_QWORD *)((char *)a3 + v89);
                            if (v90 != -1 && v90 < *(_QWORD *)((char *)a3 + *v7))
                            {
                              v91 = v90 + 1;
                              v92 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v90);
                              *(_QWORD *)((char *)a3 + v89) = v91;
                              if (v92 < 0)
                              {
                                v59 = 0;
LABEL_84:
                                self->_command = v59;
                                goto LABEL_4;
                              }
LABEL_82:
                              if (*((_BYTE *)a3 + *v9))
                                v59 = 0;
                              goto LABEL_84;
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
          goto LABEL_82;
        }
        v93 = PBReaderSkipValueWithTag();
        if (!v93)
          return v93;
      }
LABEL_4:
      v5 = *v4;
      v6 = *(_QWORD *)((char *)a3 + v5);
      v8 = *(_QWORD *)((char *)a3 + *v7);
      if (v6 >= v8)
        goto LABEL_85;
    }
    v16 = 0;
LABEL_38:
    *v14 = 1;
    goto LABEL_39;
  }
LABEL_85:
  LOBYTE(v93) = *((_BYTE *)a3 + *v9) == 0;
  return v93;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_command;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *messageData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_command != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((_QWORD *)v4 + 2))
    v6 = -[NSData isEqual:](messageData, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_command;
  else
    v2 = 0;
  return -[NSData hash](self->_messageData, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
