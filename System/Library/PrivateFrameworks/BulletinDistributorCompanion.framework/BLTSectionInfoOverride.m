@implementation BLTSectionInfoOverride

- (BLTSectionInfoOverride)initWithOverrides:(id)a3
{
  id v4;
  BLTSectionInfoOverride *v5;
  BLTSectionInfoOverride *v6;
  uint64_t v7;
  uint64_t level;
  NSNumber *v9;
  NSNumber *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *grouping;
  NSNumber *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSNumber *v19;
  NSNumber *sound;
  void *v21;
  void *v22;
  uint64_t v23;
  NSNumber *criticalAlert;
  NSNumber *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLTSectionInfoOverride;
  v5 = -[BLTSectionInfoOverride init](&v27, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD18]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v7, "integerValue"))
    {
      level = (uint64_t)v6->_level;
      v6->_level = (NSNumber *)&unk_24D786608;
      goto LABEL_10;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD10]);
    level = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)level, "integerValue"))
    {
      v9 = v6->_level;
      v10 = (NSNumber *)&unk_24D786620;
    }
    else
    {
      if (!(v7 | level))
        goto LABEL_10;
      v9 = v6->_level;
      v10 = (NSNumber *)&unk_24D786638;
    }
    v6->_level = v10;

LABEL_10:
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FCF8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      goto LABEL_19;
    v13 = objc_msgSend(v11, "unsignedIntegerValue");
    if (v13 == 2)
    {
      grouping = v6->_grouping;
      v15 = (NSNumber *)&unk_24D786620;
    }
    else
    {
      if (v13 != 1)
      {
        if (v13)
          goto LABEL_19;
        grouping = v6->_grouping;
        v6->_grouping = (NSNumber *)&unk_24D786608;
LABEL_18:

LABEL_19:
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD30]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = objc_msgSend(v16, "unsignedIntegerValue");
          v19 = (NSNumber *)&unk_24D786620;
          sound = v6->_sound;
          if (!v18)
            v19 = (NSNumber *)&unk_24D786638;
          v6->_sound = v19;

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD00]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = objc_msgSend(v21, "unsignedIntegerValue");
          criticalAlert = v6->_criticalAlert;
          if (v23)
          {
            v6->_criticalAlert = (NSNumber *)&unk_24D786608;
LABEL_29:

            goto LABEL_30;
          }
          v25 = (NSNumber *)&unk_24D786620;
        }
        else
        {
          criticalAlert = v6->_criticalAlert;
          v25 = (NSNumber *)&unk_24D786638;
        }
        v6->_criticalAlert = v25;
        goto LABEL_29;
      }
      grouping = v6->_grouping;
      v15 = (NSNumber *)&unk_24D786638;
    }
    v6->_grouping = v15;
    goto LABEL_18;
  }
LABEL_30:

  return v6;
}

- (NSNumber)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
  objc_storeStrong((id *)&self->_grouping, a3);
}

- (NSNumber)level
{
  return self->_level;
}

- (void)setLevel:(id)a3
{
  objc_storeStrong((id *)&self->_level, a3);
}

- (NSNumber)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (NSNumber)criticalAlert
{
  return self->_criticalAlert;
}

- (void)setCriticalAlert:(id)a3
{
  objc_storeStrong((id *)&self->_criticalAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAlert, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
}

@end
