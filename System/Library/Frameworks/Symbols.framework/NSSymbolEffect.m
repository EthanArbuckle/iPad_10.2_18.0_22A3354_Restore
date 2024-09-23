@implementation NSSymbolEffect

+ (id)_effectWithType:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

- (void)_setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (id)_rbAnimation
{
  unint64_t v2;

  v2 = -[NSSymbolEffect _effectType](self, "_effectType") - 1;
  if (v2 > 0xB || ((0xB3Fu >> v2) & 1) == 0)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_2353C79C0[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_rbOptionsMutable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
}

+ (void)_mergeEffectOptions:(id)a3 intoRBOptions:(id)a4 forEffect:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v24, "_speed");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE7F368]);

  v10 = objc_msgSend(v24, "_repeatBehavior");
  if (v10 == 2)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v12 = (float)objc_msgSend(v24, "_repeatCount");
    objc_msgSend(v11, "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE7F348]);

  }
  else if (v10 == 1)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_25068ABE0, *MEMORY[0x24BE7F348]);
  }
  objc_msgSend(v24, "_repeatDelay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v24, "_repeatDelay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    *(float *)&v18 = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE7F350]);

  }
  if (!objc_msgSend(v24, "_prefersContinuous"))
    goto LABEL_18;
  switch(a5)
  {
    case 3:
      v20 = (_QWORD *)MEMORY[0x24BE7F318];
      goto LABEL_15;
    case 10:
      v20 = (_QWORD *)MEMORY[0x24BE7F360];
LABEL_15:
      objc_msgSend(v7, "objectForKeyedSubscript:", *v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 16;
      if (!v21)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, *v20);

        break;
      }
LABEL_16:
      v22 = objc_msgSend(v21, "unsignedIntValue") | v22;
      goto LABEL_17;
    case 9:
      v20 = (_QWORD *)MEMORY[0x24BE7F388];
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE7F388]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 256;
      if (!v21)
        goto LABEL_17;
      goto LABEL_16;
  }
LABEL_18:

}

- (id)_rbOptionsWithEffectOptions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSSymbolEffect _rbOptionsMutable](self, "_rbOptionsMutable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_mergeEffectOptions:intoRBOptions:forEffect:", v4, v5, -[NSSymbolEffect _effectType](self, "_effectType"));

  return v5;
}

+ (void)_addLayerBehavior:(int64_t)a3 ToOptions:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  if (a3 == 1)
  {
    v6 = MEMORY[0x24BDBD1C8];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v6 = MEMORY[0x24BDBD1C0];
LABEL_5:
    v7 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F328]);
    v5 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v4[1] = -[NSSymbolEffect _effectType](self, "_effectType");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NSSymbolEffect _effectType](self, "_effectType"), CFSTR("_effectType"));

}

- (NSSymbolEffect)initWithCoder:(id)a3
{
  id v4;
  NSSymbolEffect *v5;

  v4 = a3;
  objc_opt_class();
  v5 = (NSSymbolEffect *)objc_opt_new();

  if (v5)
    v5->_effectType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_effectType"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_effectType
{
  return self->_effectType;
}

@end
