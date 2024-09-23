@implementation CNDecision

- (CNDecision)initWithTime:(CMTime *)time detectionID:(CNDetectionID)detectionID strong:(BOOL)isStrong
{
  _BOOL8 v8;
  id v9;
  void *v10;
  CNDecision *v11;
  CMTime v13;

  v8 = isStrong;
  v9 = objc_alloc(MEMORY[0x24BE74B50]);
  v13 = *time;
  v10 = (void *)objc_msgSend(v9, "initWithTime:trackIdentifier:options:", &v13, detectionID, v8);
  v11 = -[CNDecision _initTakingInternalDecision:](self, "_initTakingInternalDecision:", v10);

  return v11;
}

- (CNDecision)initWithTime:(CMTime *)time detectionGroupID:(CNDetectionGroupID)detectionGroupID strong:(BOOL)isStrong
{
  uint64_t v8;
  id v9;
  void *v10;
  CNDecision *v11;
  CMTime v13;

  v8 = isStrong | 2;
  v9 = objc_alloc(MEMORY[0x24BE74B50]);
  v13 = *time;
  v10 = (void *)objc_msgSend(v9, "initWithTime:groupIdentifier:options:", &v13, detectionGroupID, v8);
  v11 = -[CNDecision _initTakingInternalDecision:](self, "_initTakingInternalDecision:", v10);

  return v11;
}

- (CMTime)time
{
  CMTime *result;

  result = (CMTime *)self->_internalDecision;
  if (result)
    return (CMTime *)-[CMTime time](result, "time");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CNDetectionID)detectionID
{
  return -[PTCinematographyDecision trackIdentifier](self->_internalDecision, "trackIdentifier");
}

- (CNDetectionGroupID)detectionGroupID
{
  return -[PTCinematographyDecision groupIdentifier](self->_internalDecision, "groupIdentifier");
}

- (BOOL)isUserDecision
{
  return -[PTCinematographyDecision isUserDecision](self->_internalDecision, "isUserDecision");
}

- (BOOL)isStrongDecision
{
  return -[PTCinematographyDecision isStrongDecision](self->_internalDecision, "isStrongDecision");
}

- (BOOL)isGroupDecision
{
  return -[PTCinematographyDecision isGroupDecision](self->_internalDecision, "isGroupDecision");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNDecision internalDecision](self, "internalDecision");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalDecision");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNDecision internalDecision](self, "internalDecision");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CNDecision internalDecision](self, "internalDecision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initCopyingInternalDecision:", v5);

  return v6;
}

- (id)_initTakingInternalDecision:(id)a3
{
  id v5;
  CNDecision *v6;
  CNDecision *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDecision;
  v6 = -[CNDecision init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalDecision, a3);

  return v7;
}

- (id)_initCopyingInternalDecision:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[CNDecision _initTakingInternalDecision:](self, "_initTakingInternalDecision:", v4);

  return v5;
}

- (PTCinematographyDecision)internalDecision
{
  return (PTCinematographyDecision *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalDecision:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDecision, 0);
}

+ (id)_copyDecisionFromInternal:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initCopyingInternalDecision:", v4);

  return v5;
}

+ (id)_takeDecisionsFromInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = objc_alloc((Class)a1);
        v13 = (void *)objc_msgSend(v12, "_initTakingInternalDecision:", v11, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

+ (id)_copyDecisionsFromInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(a1, "_copyDecisionFromInternal:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_copyInternalFromDecisions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "internalDecision", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

@end
