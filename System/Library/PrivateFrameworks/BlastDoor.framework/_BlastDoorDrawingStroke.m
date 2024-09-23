@implementation _BlastDoorDrawingStroke

- (_BlastDoorDrawingStroke)init
{
  _BlastDoorDrawingStroke *v2;
  uint64_t v3;
  NSMutableArray *strokePoints;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorDrawingStroke;
  v2 = -[_BlastDoorDrawingStroke init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    strokePoints = v2->_strokePoints;
    v2->_strokePoints = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)createDKStroke:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getDKDrawingStrokeClass_softClass;
  v18 = getDKDrawingStrokeClass_softClass;
  if (!getDKDrawingStrokeClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getDKDrawingStrokeClass_block_invoke;
    v14[3] = &unk_1E5CCC218;
    v14[4] = &v15;
    __getDKDrawingStrokeClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "init");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "createDKStrokePoint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "strokePoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)createBDStroke:(id)a3
{
  id v3;
  _BlastDoorDrawingStroke *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BlastDoorDrawingStrokePoint *v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(_BlastDoorDrawingStroke);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "strokePoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc_init(_BlastDoorDrawingStrokePoint);
        objc_msgSend(v10, "location");
        -[_BlastDoorDrawingStrokePoint setLocation:](v11, "setLocation:");
        objc_msgSend(v10, "force");
        -[_BlastDoorDrawingStrokePoint setForce:](v11, "setForce:");
        objc_msgSend(v10, "velocity");
        -[_BlastDoorDrawingStrokePoint setVelocity:](v11, "setVelocity:");
        -[_BlastDoorDrawingStroke strokePoints](v4, "strokePoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSMutableArray)strokePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokePoints, 0);
}

@end
