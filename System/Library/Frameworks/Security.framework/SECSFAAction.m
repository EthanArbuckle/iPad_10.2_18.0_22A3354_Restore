@implementation SECSFAAction

- (BOOL)hasRadarnumber
{
  return self->_radarnumber != 0;
}

- (BOOL)hasTtr
{
  return self->_ttr != 0;
}

- (void)setTtr:(id)a3
{
  SECSFAActionTapToRadar *v4;
  SECSFAActionTapToRadar *ttr;

  v4 = (SECSFAActionTapToRadar *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 1;
  ttr = self->_ttr;
  self->_ttr = v4;

}

- (BOOL)hasAbc
{
  return self->_abc != 0;
}

- (void)setAbc:(id)a3
{
  SECSFAActionAutomaticBugCapture *v4;
  SECSFAActionAutomaticBugCapture *abc;

  v4 = (SECSFAActionAutomaticBugCapture *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 2;
  abc = self->_abc;
  self->_abc = v4;

}

- (BOOL)hasDrop
{
  return self->_drop != 0;
}

- (void)setDrop:(id)a3
{
  SECSFAActionDropEvent *v4;
  SECSFAActionDropEvent *drop;

  v4 = (SECSFAActionDropEvent *)a3;
  -[SECSFAAction clearOneofValuesForAction](self, "clearOneofValuesForAction");
  *(_BYTE *)&self->_has |= 1u;
  self->_action = 3;
  drop = self->_drop;
  self->_drop = v4;

}

- (int)action
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_action;
  else
    return 0;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1FCBE30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ttr")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("abc")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("drop")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForAction
{
  SECSFAActionTapToRadar *ttr;
  SECSFAActionAutomaticBugCapture *abc;
  SECSFAActionDropEvent *drop;

  *(_BYTE *)&self->_has &= ~1u;
  self->_action = 0;
  ttr = self->_ttr;
  self->_ttr = 0;

  abc = self->_abc;
  self->_abc = 0;

  drop = self->_drop;
  self->_drop = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SECSFAAction;
  -[SECSFAAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SECSFAAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *radarnumber;
  SECSFAActionTapToRadar *ttr;
  void *v7;
  SECSFAActionAutomaticBugCapture *abc;
  void *v9;
  SECSFAActionDropEvent *drop;
  void *v11;
  uint64_t action;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  radarnumber = self->_radarnumber;
  if (radarnumber)
    objc_msgSend(v3, "setObject:forKey:", radarnumber, CFSTR("radarnumber"));
  ttr = self->_ttr;
  if (ttr)
  {
    -[SECSFAActionTapToRadar dictionaryRepresentation](ttr, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("ttr"));

  }
  abc = self->_abc;
  if (abc)
  {
    -[SECSFAActionAutomaticBugCapture dictionaryRepresentation](abc, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("abc"));

  }
  drop = self->_drop;
  if (drop)
  {
    -[SECSFAActionDropEvent dictionaryRepresentation](drop, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("drop"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    action = self->_action;
    if (action >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_action);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1FCBE30[action];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Action"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_radarnumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_ttr)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_abc)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_drop)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_action;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v5 = v4;
  if (self->_radarnumber)
  {
    objc_msgSend(v4, "setRadarnumber:");
    v4 = v5;
  }
  if (self->_ttr)
  {
    objc_msgSend(v5, "setTtr:");
    v4 = v5;
  }
  if (self->_abc)
  {
    objc_msgSend(v5, "setAbc:");
    v4 = v5;
  }
  if (self->_drop)
  {
    objc_msgSend(v5, "setDrop:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_radarnumber, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[SECSFAActionTapToRadar copyWithZone:](self->_ttr, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[SECSFAActionAutomaticBugCapture copyWithZone:](self->_abc, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[SECSFAActionDropEvent copyWithZone:](self->_drop, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *radarnumber;
  SECSFAActionTapToRadar *ttr;
  SECSFAActionAutomaticBugCapture *abc;
  SECSFAActionDropEvent *drop;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_action != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  radarnumber = self->_radarnumber;
  if ((unint64_t)radarnumber | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](radarnumber, "isEqual:"))
  {
    goto LABEL_15;
  }
  ttr = self->_ttr;
  if ((unint64_t)ttr | *((_QWORD *)v4 + 5))
  {
    if (!-[SECSFAActionTapToRadar isEqual:](ttr, "isEqual:"))
      goto LABEL_15;
  }
  abc = self->_abc;
  if ((unint64_t)abc | *((_QWORD *)v4 + 1))
  {
    if (!-[SECSFAActionAutomaticBugCapture isEqual:](abc, "isEqual:"))
      goto LABEL_15;
  }
  drop = self->_drop;
  if ((unint64_t)drop | *((_QWORD *)v4 + 3))
    v9 = -[SECSFAActionDropEvent isEqual:](drop, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_action;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_radarnumber, "hash") ^ v3;
  v5 = -[SECSFAActionTapToRadar hash](self->_ttr, "hash");
  v6 = v4 ^ v5 ^ -[SECSFAActionAutomaticBugCapture hash](self->_abc, "hash");
  return v6 ^ -[SECSFAActionDropEvent hash](self->_drop, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  SECSFAActionTapToRadar *ttr;
  uint64_t v7;
  SECSFAActionAutomaticBugCapture *abc;
  uint64_t v9;
  SECSFAActionDropEvent *drop;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_action = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v12 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SECSFAAction setRadarnumber:](self, "setRadarnumber:");
    v5 = v12;
  }
  ttr = self->_ttr;
  v7 = v5[5];
  if (ttr)
  {
    if (!v7)
      goto LABEL_11;
    -[SECSFAActionTapToRadar mergeFrom:](ttr, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[SECSFAAction setTtr:](self, "setTtr:");
  }
  v5 = v12;
LABEL_11:
  abc = self->_abc;
  v9 = v5[1];
  if (abc)
  {
    if (!v9)
      goto LABEL_17;
    -[SECSFAActionAutomaticBugCapture mergeFrom:](abc, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[SECSFAAction setAbc:](self, "setAbc:");
  }
  v5 = v12;
LABEL_17:
  drop = self->_drop;
  v11 = v5[3];
  if (drop)
  {
    if (v11)
    {
      -[SECSFAActionDropEvent mergeFrom:](drop, "mergeFrom:");
LABEL_22:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[SECSFAAction setDrop:](self, "setDrop:");
    goto LABEL_22;
  }

}

- (NSString)radarnumber
{
  return self->_radarnumber;
}

- (void)setRadarnumber:(id)a3
{
  objc_storeStrong((id *)&self->_radarnumber, a3);
}

- (SECSFAActionTapToRadar)ttr
{
  return self->_ttr;
}

- (SECSFAActionAutomaticBugCapture)abc
{
  return self->_abc;
}

- (SECSFAActionDropEvent)drop
{
  return self->_drop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttr, 0);
  objc_storeStrong((id *)&self->_radarnumber, 0);
  objc_storeStrong((id *)&self->_drop, 0);
  objc_storeStrong((id *)&self->_abc, 0);
}

@end
