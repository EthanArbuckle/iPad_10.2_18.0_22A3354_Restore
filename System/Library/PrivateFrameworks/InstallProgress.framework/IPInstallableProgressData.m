@implementation IPInstallableProgressData

- (id)_findOrCreatePhaseState:(unint64_t)a3
{
  NSMutableDictionary *phaseStates;
  void *v6;
  IPPhaseState *v7;
  NSMutableDictionary *v8;
  void *v9;

  phaseStates = self->_phaseStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](phaseStates, "objectForKey:", v6);
  v7 = (IPPhaseState *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(IPPhaseState);
    v8 = self->_phaseStates;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  return v7;
}

- (IPInstallableProgressData)init
{
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPInstallableProgressData;
  v2 = -[IPInstallableProgressData init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = 0;
    *(_OWORD *)(v2 + 24) = xmmword_23F118250;
    *((_QWORD *)v2 + 2) = 0;
    do
      v6 = (id)objc_msgSend(v2, "_findOrCreatePhaseState:", orderedPhases[v5++]);
    while (v5 != 5);
  }
  return (IPInstallableProgressData *)v2;
}

- (void)_recalculateCurrentFractionCompleted
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_phaseStates;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {

LABEL_18:
    v16 = 0.0;
    goto LABEL_19;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v18;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v3);
      v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_phaseStates, "objectForKeyedSubscript:", v10, (_QWORD)v17);
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = v11[1];
      else
        v12 = 0;

      -[NSMutableDictionary objectForKeyedSubscript:](self->_phaseStates, "objectForKeyedSubscript:", v10);
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = v13[2];
      else
        v14 = 0;
      v7 += v12;
      v6 += v14;

      ++v9;
    }
    while (v5 != v9);
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v5 = v15;
  }
  while (v15);

  if (!v7)
    goto LABEL_18;
  v16 = (double)v6 / (double)v7;
LABEL_19:
  self->_currentFractionCompleted = v16;
}

- (unint64_t)completedUnitCountForPhase:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v4;

  -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[2];
  else
    v4 = 0;

  return v4;
}

- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  _QWORD *v6;

  -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", a4);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2] = a3;

  -[IPInstallableProgressData _recalculateCurrentFractionCompleted](self, "_recalculateCurrentFractionCompleted");
}

- (unint64_t)totalUnitCountForPhase:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v4;

  -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[1];
  else
    v4 = 0;

  return v4;
}

- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPInstallableProgressData setTotalUnitCountsForPhases:](self, "setTotalUnitCountsForPhases:", v8);

}

- (void)setTotalUnitCountsForPhases:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", objc_msgSend(v9, "unsignedIntegerValue"));
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "unsignedLongLongValue");
        if (v11)
          v11[1] = v12;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  -[IPInstallableProgressData _recalculateCurrentFractionCompleted](self, "_recalculateCurrentFractionCompleted");

}

- (void)setInstallPhase:(unint64_t)a3
{
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;

  v4 = 0;
  self->_installPhase = a3;
  while (orderedPhases[v4] != a3)
  {
    if (++v4 == 5)
      goto LABEL_10;
  }
  if ((int)v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", orderedPhases[i]);
      v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v6[2] = v6[1];

    }
  }
LABEL_10:
  -[IPInstallableProgressData _recalculateCurrentFractionCompleted](self, "_recalculateCurrentFractionCompleted");
}

- (double)fractionCompleted
{
  return self->_currentFractionCompleted;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<%@: %p {P %llu PTUC %llu PCUC %llu FC %f}>"), objc_opt_class(), self, self->_installPhase, -[IPInstallableProgressData totalUnitCountForPhase:](self, "totalUnitCountForPhase:", self->_installPhase), -[IPInstallableProgressData completedUnitCountForPhase:](self, "completedUnitCountForPhase:", self->_installPhase), *(_QWORD *)&self->_currentFractionCompleted);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPInstallableProgressData)initWithCoder:(id)a3
{
  id v4;
  IPInstallableProgressData *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *phaseStates;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPInstallableProgressData;
  v5 = -[IPInstallableProgressData init](&v12, sel_init);
  if (v5)
  {
    v5->_installPhase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installPhase"));
    v5->_finalPhase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("finalPhase"));
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    IPDecodeDictionaryWithKeyClassAndValueClass(v4, CFSTR("phaseStates"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    phaseStates = v5->_phaseStates;
    v5->_phaseStates = (NSMutableDictionary *)v9;

    if (v5->_installPhase && v5->_finalPhase && v5->_phaseStates)
    {
      -[IPInstallableProgressData _recalculateCurrentFractionCompleted](v5, "_recalculateCurrentFractionCompleted");
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t installPhase;
  id v5;

  installPhase = self->_installPhase;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", installPhase, CFSTR("installPhase"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_finalPhase, CFSTR("finalPhase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phaseStates, CFSTR("phaseStates"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  IPInstallableProgressData *v4;
  uint64_t v5;
  NSMutableDictionary *phaseStates;

  v4 = objc_alloc_init(IPInstallableProgressData);
  v4->_installPhase = self->_installPhase;
  v4->_finalPhase = self->_finalPhase;
  v5 = -[NSMutableDictionary mutableCopy](self->_phaseStates, "mutableCopy");
  phaseStates = v4->_phaseStates;
  v4->_phaseStates = (NSMutableDictionary *)v5;

  -[IPInstallableProgressData _recalculateCurrentFractionCompleted](v4, "_recalculateCurrentFractionCompleted");
  return v4;
}

- (unint64_t)installPhase
{
  return self->_installPhase;
}

- (unint64_t)finalPhase
{
  return self->_finalPhase;
}

- (void)setFinalPhase:(unint64_t)a3
{
  self->_finalPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseStates, 0);
}

@end
