@implementation BMMediaRendered

- (BMMediaRendered)initWithAbsoluteTimestamp:(double)a3 mediaAttributes:(id)a4 isOnScreen:(BOOL)a5 isFirstView:(BOOL)a6
{
  id v11;
  BMMediaRendered *v12;
  BMMediaRendered *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMMediaRendered;
  v12 = -[BMEventBase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_hasAbsoluteTimestamp = 1;
    v12->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v12->_mediaAttributes, a4);
    v13->_hasIsOnScreen = 1;
    v13->_isOnScreen = a5;
    v13->_hasIsFirstView = 1;
    v13->_isFirstView = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaRendered mediaAttributes](self, "mediaAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaRendered isOnScreen](self, "isOnScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaRendered isFirstView](self, "isFirstView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaRendered with absoluteTimestamp: %@, mediaAttributes: %@, isOnScreen: %@, isFirstView: %@"), v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaRendered *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  unint64_t v22;
  double v23;
  id v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  NSArray *mediaAttributes;
  int v44;
  BMMediaRendered *v45;
  objc_super v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMMediaRendered;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_56;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasAbsoluteTimestamp = 1;
          v21 = *v7;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0.0;
          }
          v5->_absoluteTimestamp = v23;
          continue;
        case 2u:
          v48 = 0;
          v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_58;
          v24 = -[BMMediaRenderedMediaAttributes initByReadFrom:]([BMMediaRenderedMediaAttributes alloc], "initByReadFrom:", v4);
          if (!v24)
            goto LABEL_58;
          v25 = v24;
          objc_msgSend(v6, "addObject:", v24);
          PBReaderRecallMark();

          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasIsOnScreen = 1;
          while (2)
          {
            v29 = *v7;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v18 = v27++ >= 9;
                if (v18)
                {
                  v28 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v28 = 0;
LABEL_45:
          v40 = v28 != 0;
          v41 = 18;
          goto LABEL_50;
        case 4u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsFirstView = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        v36 = *v7;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v8])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_47;
        v33 += 7;
        v18 = v34++ >= 9;
        if (v18)
        {
          v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9])
        v35 = 0;
LABEL_49:
      v40 = v35 != 0;
      v41 = 20;
LABEL_50:
      *((_BYTE *)&v5->super.super.isa + v41) = v40;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v42 = objc_msgSend(v6, "copy");
  mediaAttributes = v5->_mediaAttributes;
  v5->_mediaAttributes = (NSArray *)v42;

  v44 = v4[*v9];
  if (v44)
LABEL_55:
    v45 = 0;
  else
LABEL_56:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasAbsoluteTimestamp)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_mediaAttributes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_hasIsOnScreen)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFirstView)
    PBDataWriterWriteBOOLField();

}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMMediaRendered initByReadFrom:]([BMMediaRendered alloc], "initByReadFrom:", v7);
  }
  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaRendered writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  int v17;
  _BOOL4 v18;
  int v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMediaRendered hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
      || objc_msgSend(v5, "hasAbsoluteTimestamp"))
    {
      if (-[BMMediaRendered hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
        && objc_msgSend(v5, "hasAbsoluteTimestamp"))
      {
        -[BMMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
        v7 = v6;
        objc_msgSend(v5, "absoluteTimestamp");
        v9 = v7 == v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 1;
    }
    -[BMMediaRendered mediaAttributes](self, "mediaAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v15 = 1;
    }
    else
    {
      -[BMMediaRendered mediaAttributes](self, "mediaAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    if (-[BMMediaRendered hasIsOnScreen](self, "hasIsOnScreen") || objc_msgSend(v5, "hasIsOnScreen"))
    {
      if (-[BMMediaRendered hasIsOnScreen](self, "hasIsOnScreen") && objc_msgSend(v5, "hasIsOnScreen"))
      {
        v16 = -[BMMediaRendered isOnScreen](self, "isOnScreen");
        v17 = v16 ^ objc_msgSend(v5, "isOnScreen") ^ 1;
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 1;
    }
    if (-[BMMediaRendered hasIsFirstView](self, "hasIsFirstView") || objc_msgSend(v5, "hasIsFirstView"))
    {
      if (-[BMMediaRendered hasIsFirstView](self, "hasIsFirstView") && objc_msgSend(v5, "hasIsFirstView"))
      {
        v18 = -[BMMediaRendered isFirstView](self, "isFirstView");
        v19 = v18 ^ objc_msgSend(v5, "isFirstView") ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 1;
    }
    v10 = v9 & v15 & v17 & v19;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasAbsoluteTimestamp
{
  return self->_hasAbsoluteTimestamp;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  self->_hasAbsoluteTimestamp = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSArray)mediaAttributes
{
  return self->_mediaAttributes;
}

- (BOOL)hasIsOnScreen
{
  return self->_hasIsOnScreen;
}

- (void)setHasIsOnScreen:(BOOL)a3
{
  self->_hasIsOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (BOOL)hasIsFirstView
{
  return self->_hasIsFirstView;
}

- (void)setHasIsFirstView:(BOOL)a3
{
  self->_hasIsFirstView = a3;
}

- (BOOL)isFirstView
{
  return self->_isFirstView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAttributes, 0);
}

@end
