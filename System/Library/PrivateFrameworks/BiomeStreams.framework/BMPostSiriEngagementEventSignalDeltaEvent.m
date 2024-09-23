@implementation BMPostSiriEngagementEventSignalDeltaEvent

- (BMPostSiriEngagementEventSignalDeltaEvent)initWithDuration:(double)a3 sinceUIEnd:(double)a4 sinceUIStart:(double)a5
{
  BMPostSiriEngagementEventSignalDeltaEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BMPostSiriEngagementEventSignalDeltaEvent;
  result = -[BMEventBase init](&v9, sel_init);
  if (result)
  {
    result->_hasDuration = 1;
    result->_duration = a3;
    result->_hasSinceUIEnd = 1;
    result->_sinceUIEnd = a4;
    result->_hasSinceUIStart = 1;
    result->_sinceUIStart = a5;
  }
  return result;
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPostSiriEngagementEventSignalDeltaEvent duration](self, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPostSiriEngagementEventSignalDeltaEvent sinceUIEnd](self, "sinceUIEnd");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPostSiriEngagementEventSignalDeltaEvent sinceUIStart](self, "sinceUIStart");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPostSiriEngagementEventSignalDeltaEvent with duration: %@, sinceUIEnd: %@, sinceUIStart: %@"), v5, v7, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPostSiriEngagementEventSignalDeltaEvent *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  objc_class *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int *v28;
  BMPostSiriEngagementEventSignalDeltaEvent *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMPostSiriEngagementEventSignalDeltaEvent;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_43;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasSinceUIStart = 1;
        v24 = *v6;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__sinceUIStart;
      }
      else if ((_DWORD)v20 == 2)
      {
        v5->_hasSinceUIEnd = 1;
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v27);
          *(_QWORD *)&v4[v26] = v27 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__sinceUIEnd;
      }
      else
      {
        if ((_DWORD)v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_42;
          continue;
        }
        v5->_hasDuration = 1;
        v21 = *v6;
        v22 = *(_QWORD *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v23 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v22);
          *(_QWORD *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v23 = 0;
        }
        v28 = &OBJC_IVAR___BMPostSiriEngagementEventSignalDeltaEvent__duration;
      }
      *(Class *)((char *)&v5->super.super.isa + *v28) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_42:
    v29 = 0;
  else
LABEL_43:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasDuration)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasSinceUIEnd)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasSinceUIStart)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

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

    v4 = -[BMPostSiriEngagementEventSignalDeltaEvent initByReadFrom:]([BMPostSiriEngagementEventSignalDeltaEvent alloc], "initByReadFrom:", v7);
  }
  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPostSiriEngagementEventSignalDeltaEvent writeTo:](self, "writeTo:", v3);
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
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMPostSiriEngagementEventSignalDeltaEvent hasDuration](self, "hasDuration")
      || objc_msgSend(v5, "hasDuration"))
    {
      if (-[BMPostSiriEngagementEventSignalDeltaEvent hasDuration](self, "hasDuration")
        && objc_msgSend(v5, "hasDuration"))
      {
        -[BMPostSiriEngagementEventSignalDeltaEvent duration](self, "duration");
        v7 = v6;
        objc_msgSend(v5, "duration");
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
    if (-[BMPostSiriEngagementEventSignalDeltaEvent hasSinceUIEnd](self, "hasSinceUIEnd")
      || objc_msgSend(v5, "hasSinceUIEnd"))
    {
      if (-[BMPostSiriEngagementEventSignalDeltaEvent hasSinceUIEnd](self, "hasSinceUIEnd")
        && objc_msgSend(v5, "hasSinceUIEnd"))
      {
        -[BMPostSiriEngagementEventSignalDeltaEvent sinceUIEnd](self, "sinceUIEnd");
        v12 = v11;
        objc_msgSend(v5, "sinceUIEnd");
        v14 = v12 == v13;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 1;
    }
    if (-[BMPostSiriEngagementEventSignalDeltaEvent hasSinceUIStart](self, "hasSinceUIStart")
      || objc_msgSend(v5, "hasSinceUIStart"))
    {
      if (-[BMPostSiriEngagementEventSignalDeltaEvent hasSinceUIStart](self, "hasSinceUIStart")
        && objc_msgSend(v5, "hasSinceUIStart"))
      {
        -[BMPostSiriEngagementEventSignalDeltaEvent sinceUIStart](self, "sinceUIStart");
        v16 = v15;
        objc_msgSend(v5, "sinceUIStart");
        v18 = v16 == v17;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 1;
    }
    v10 = v9 && v14 && v18;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasSinceUIEnd
{
  return self->_hasSinceUIEnd;
}

- (void)setHasSinceUIEnd:(BOOL)a3
{
  self->_hasSinceUIEnd = a3;
}

- (double)sinceUIEnd
{
  return self->_sinceUIEnd;
}

- (BOOL)hasSinceUIStart
{
  return self->_hasSinceUIStart;
}

- (void)setHasSinceUIStart:(BOOL)a3
{
  self->_hasSinceUIStart = a3;
}

- (double)sinceUIStart
{
  return self->_sinceUIStart;
}

@end
