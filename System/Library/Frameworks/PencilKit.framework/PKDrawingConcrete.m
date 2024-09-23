@implementation PKDrawingConcrete

- (PKDrawingConcrete)init
{
  PKDrawingConcrete *v2;
  uint64_t v3;
  NSUUID *uuid;
  NSMutableArray *v5;
  NSMutableArray *allStrokes;
  PKVectorTimestamp *v7;
  PKVectorTimestamp *version;
  CGPoint *v9;
  CGSize v10;
  CGSize v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDrawingConcrete;
  v2 = -[PKDrawing init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allStrokes = v2->_allStrokes;
    v2->_allStrokes = v5;

    v7 = objc_alloc_init(PKVectorTimestamp);
    version = v2->_version;
    v2->_version = v7;

    v9 = (CGPoint *)MEMORY[0x1E0C9D628];
    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->__canvasBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->__canvasBounds.size = v10;
    v11 = (CGSize)v9[1];
    v2->__bounds.origin = *v9;
    v2->__bounds.size = v11;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_replicaUUID)
  {
    +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "returnReplicaForDrawing:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PKDrawingConcrete;
  -[PKDrawing dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_unknownFields);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong((id *)&self->_allStrokes, 0);
  objc_storeStrong((id *)&self->_strokesIdentifierMap, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  return self;
}

- (PKDrawingConcrete)initWithUUID:(id)a3 strokes:(id)a4 version:(id)a5 canvasBounds:(CGRect)a6 boundsVersion:(_PKStrokeID *)a7 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a8
{
  uint64_t *ptr;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  PKDrawingConcrete *v20;
  PKDrawingConcrete *v21;
  uint64_t v22;
  NSMutableArray *allStrokes;
  CGSize v24;
  objc_super v26;

  ptr = (uint64_t *)a8.__ptr_;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKDrawingConcrete;
  v20 = -[PKDrawing init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a3);
    v22 = objc_msgSend(v18, "mutableCopy");
    allStrokes = v21->_allStrokes;
    v21->_allStrokes = (NSMutableArray *)v22;

    objc_storeStrong((id *)&v21->_version, a5);
    v21->__canvasBounds.origin.x = x;
    v21->__canvasBounds.origin.y = y;
    v21->__canvasBounds.size.width = width;
    v21->__canvasBounds.size.height = height;
    v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v21->__bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v21->__bounds.size = v24;
    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v21->_unknownFields.__ptr_, ptr);
  }

  return v21;
}

- (PKDrawingConcrete)initWithDrawing:(id)a3
{
  id v4;
  PKDrawingConcrete *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  uint64_t v9;
  NSMutableArray *allStrokes;
  void *v11;
  uint64_t v12;
  PKVectorTimestamp *version;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGSize v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *strokesIdentifierMap;
  objc_super v23[2];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23[0].receiver = self;
  v23[0].super_class = (Class)PKDrawingConcrete;
  v5 = -[objc_super initWithDrawing:](v23, sel_initWithDrawing_, v4);
  if (v5)
  {
    objc_msgSend(v4, "nsuuid");
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "_allStrokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    allStrokes = v5->_allStrokes;
    v5->_allStrokes = (NSMutableArray *)v9;

    objc_msgSend(v4, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    version = v5->_version;
    v5->_version = (PKVectorTimestamp *)v12;

    objc_msgSend(v4, "_canvasBounds");
    v5->__canvasBounds.origin.x = v14;
    v5->__canvasBounds.origin.y = v15;
    v5->__canvasBounds.size.width = v16;
    v5->__canvasBounds.size.height = v17;
    v18 = (CGSize)*((_OWORD *)v4 + 9);
    v5->__bounds.origin = (CGPoint)*((_OWORD *)v4 + 8);
    v5->__bounds.size = v18;
    objc_msgSend(v4, "boundsVersion");
    v19 = v24;
    *(objc_super *)&v5->_boundsVersion.clock = v23[1];
    *(_QWORD *)&v5->_boundsVersion.replicaUUID[12] = v19;
    v20 = objc_msgSend(*((id *)v4 + 10), "mutableCopy");
    strokesIdentifierMap = v5->_strokesIdentifierMap;
    v5->_strokesIdentifierMap = (NSMutableDictionary *)v20;

    std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v5->_unknownFields.__ptr_, (uint64_t *)v4 + 22);
  }

  return v5;
}

- (PKDrawingConcrete)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  id v6;
  id v7;
  PKDrawingConcrete *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *allStrokes;
  void *v13;
  uint64_t v14;
  PKVectorTimestamp *version;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  v6 = a3;
  v7 = a4;
  v8 = -[PKDrawingConcrete init](self, "init");
  if (!v8)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");
      allStrokes = v8->_allStrokes;
      v8->_allStrokes = (NSMutableArray *)v11;

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = v8->_allStrokes;
  v8->_allStrokes = (NSMutableArray *)v9;
LABEL_8:

  if (v7)
  {
    objc_msgSend(v7, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    version = v8->_version;
    v8->_version = (PKVectorTimestamp *)v14;

    objc_msgSend(v7, "_canvasBounds");
    v8->__canvasBounds.origin.x = v16;
    v8->__canvasBounds.origin.y = v17;
    v8->__canvasBounds.size.width = v18;
    v8->__canvasBounds.size.height = v19;
  }
LABEL_10:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  if (self->_replicaUUID)
  {
    +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateVersionForDrawing:", self);

  }
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDrawing:", self);
}

- (NSUUID)nsuuid
{
  return self->_uuid;
}

- (Class)strokeClass
{
  return (Class)objc_opt_class();
}

- (id)newStroke
{
  return objc_alloc_init(_PKStrokeConcrete);
}

- (Class)strokeSelectionClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithoutInternalStrokes
{
  PKDrawingConcrete *v2;
  void *v3;
  void *v4;

  v2 = -[PKDrawingConcrete initWithDrawing:]([PKDrawingConcrete alloc], "initWithDrawing:", self);
  -[PKDrawingConcrete _allStrokes](v2, "_allStrokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterUsingPredicate:", v4);

  -[PKDrawingConcrete invalidateVisibleStrokes](v2, "invalidateVisibleStrokes");
  return v2;
}

uint64_t __47__PKDrawingConcrete_copyWithoutInternalStrokes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isInternal") ^ 1;
}

- (id)uuid
{
  return self->_uuid;
}

- (void)_setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (id)_rootStrokes
{
  return self->_allStrokes;
}

- (NSMutableArray)_allStrokes
{
  return self->_allStrokes;
}

- (void)_setAllStrokes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *allStrokes;
  id v6;

  v6 = a3;
  v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  allStrokes = self->_allStrokes;
  self->_allStrokes = v4;

}

- (NSUUID)replicaUUID
{
  NSUUID *replicaUUID;
  void *v4;
  NSUUID *v5;
  NSUUID *v6;

  replicaUUID = self->_replicaUUID;
  if (!replicaUUID)
  {
    +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkoutReplicaUUIDForDrawing:", self);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_replicaUUID;
    self->_replicaUUID = v5;

    replicaUUID = self->_replicaUUID;
  }
  return replicaUUID;
}

- (BOOL)_hasReplicaUUID
{
  return self->_replicaUUID != 0;
}

- (void)_collectAllStrokesIn:(id)a3 into:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_strokeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v6, "_substrokesInDrawing:", self, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        -[PKDrawingConcrete _collectAllStrokesIn:into:](self, "_collectAllStrokesIn:into:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)_strokesIdentifierMap
{
  PKDrawingConcrete *v2;
  NSMutableDictionary *strokesIdentifierMap;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  strokesIdentifierMap = v2->_strokesIdentifierMap;
  if (!strokesIdentifierMap)
  {
    -[PKDrawing strokes](v2, "strokes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_strokesIdentifierMap;
    v2->_strokesIdentifierMap = (NSMutableDictionary *)v5;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v2->_allStrokes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          -[PKDrawingConcrete _collectAllStrokesIn:into:](v2, "_collectAllStrokesIn:into:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), v2->_strokesIdentifierMap, (_QWORD)v13);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    strokesIdentifierMap = v2->_strokesIdentifierMap;
  }
  v11 = strokesIdentifierMap;
  objc_sync_exit(v2);

  return v11;
}

- (id)_strokeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[PKDrawingConcrete _strokesIdentifierMap](self, "_strokesIdentifierMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGRect)_canvasBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__canvasBounds.origin.x;
  y = self->__canvasBounds.origin.y;
  width = self->__canvasBounds.size.width;
  height = self->__canvasBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)set_canvasBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_canvasBounds;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_canvasBounds = &self->__canvasBounds;
  if (!CGRectEqualToRect(a3, self->__canvasBounds))
  {
    p_canvasBounds->origin.x = x;
    p_canvasBounds->origin.y = y;
    p_canvasBounds->size.width = width;
    p_canvasBounds->size.height = height;
    ++self->_boundsVersion.clock;
    -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getUUIDBytes:", self->_boundsVersion.replicaUUID);

    -[PKDrawingConcrete version](self, "version");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "clockForUUID:", v9);

    if (!v10)
    {
      -[PKDrawingConcrete version](self, "version");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setClock:forUUID:", 0, v11);

    }
  }
}

- (void)invalidateStrokeBounds
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->__bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->__bounds.size = v2;
}

- (void)invalidateVisibleStrokes
{
  NSMutableDictionary *strokesIdentifierMap;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDrawingConcrete;
  -[PKDrawing invalidateVisibleStrokes](&v5, sel_invalidateVisibleStrokes);
  strokesIdentifierMap = self->_strokesIdentifierMap;
  self->_strokesIdentifierMap = 0;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->__bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->__bounds.size = v4;
}

- (CGRect)bounds
{
  PKDrawingConcrete *v2;
  double *p_x;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v2 = self;
  objc_sync_enter(v2);
  p_x = &v2->__bounds.origin.x;
  if (CGRectIsNull(v2->__bounds))
  {
    -[PKDrawing calculateStrokeBounds](v2, "calculateStrokeBounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
    *p_x = v4;
    v2->__bounds.origin.y = v6;
    v2->__bounds.size.width = v8;
    v2->__bounds.size.height = v10;
  }
  else
  {
    x = *p_x;
    y = v2->__bounds.origin.y;
    width = v2->__bounds.size.width;
    height = v2->__bounds.size.height;
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectIsNull(v16))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectIntegral(v17);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }
  objc_sync_exit(v2);

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setStrokeSortIDForInsertion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  unsigned int v23;
  __int128 v24;
  unsigned int v25;
  _PKStrokeID v26;
  _PKStrokeID v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[24];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0uLL;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "_sortID");
      v9 = *(_DWORD *)v30;
      v10 = *(_DWORD *)&v30[20];
    }
    else
    {
      v10 = 0;
      v9 = 0;
      memset(v30, 0, sizeof(v30));
    }
    v31 = *(_OWORD *)&v30[4];

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[PKDrawingConcrete version](self, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clockElementForUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0uLL;
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getUUIDBytes:", &v29);

  v15 = objc_msgSend(v13, "clock");
  v16 = objc_msgSend(v13, "subclock");
  v28 = v29;
  v26.subclock = v16;
  v27.clock = v9;
  *(_OWORD *)v27.replicaUUID = v31;
  v27.subclock = v10;
  v26.clock = v15;
  *(_OWORD *)v26.replicaUUID = v29;
  if (_PKStrokeIDCompare(&v27, &v26) == -1)
  {
    v31 = v28;
    v9 = v15;
    v10 = v16;
  }
  memset(v30, 0, sizeof(v30));
  v23 = v9;
  v24 = v31;
  v25 = v10;
  -[PKDrawingConcrete newStrokeIDGreaterThan:](self, "newStrokeIDGreaterThan:", &v23);
  v21 = *(_OWORD *)v30;
  v22 = *(_QWORD *)&v30[16];
  objc_msgSend(v4, "set_sortID:", &v21);
  -[PKDrawingConcrete version](self, "version");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(unsigned int *)v30;
  v19 = *(unsigned int *)&v30[20];
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClock:subclock:forUUID:", v18, v19, v20);

}

- (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3
{
  void *v4;
  _PKStrokeID *result;
  __int128 v6;

  -[PKDrawingConcrete replicaUUID](self, "replicaUUID", *(_QWORD *)&a4->clock, *(_QWORD *)&a4->replicaUUID[4], *(_QWORD *)&a4->replicaUUID[12], *MEMORY[0x1E0C80C00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDrawingConcrete newStrokeIDGreaterThan:forUUID:](PKDrawingConcrete, "newStrokeIDGreaterThan:forUUID:", &v6, v4);

  return result;
}

+ (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3 forUUID:(_PKStrokeID *)a4
{
  id v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int clock;
  _PKStrokeID *result;
  unsigned __int8 uu2[16];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  memset(uu2, 0, sizeof(uu2));
  objc_msgSend(v7, "getUUIDBytes:", uu2);
  v8 = uuid_compare(a4->replicaUUID, uu2);
  v9 = v8 != 0;
  if (v8 < 0)
    v9 = -1;
  if (v9 == -1)
  {
    v10 = 0;
    clock = a4->clock;
  }
  else if (v9)
  {
    v10 = 0;
    clock = a4->clock + 1;
  }
  else
  {
    clock = a4->clock;
    v10 = a4->subclock + 1;
  }
  retstr->clock = clock;
  *(_OWORD *)retstr->replicaUUID = *(_OWORD *)uu2;
  retstr->subclock = v10;

  return result;
}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _PKStrokeConcrete *v8;
  void *v9;
  _PKStrokeConcrete *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_clipPlane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_renderMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0uLL;
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", &v19);

  v8 = [_PKStrokeConcrete alloc];
  v16 = 0;
  v17 = v19;
  v18 = 0;
  objc_msgSend(v4, "ink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "_transform");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v10 = -[_PKStrokeConcrete initWithStroke:hidden:version:ink:transform:](v8, "initWithStroke:hidden:version:ink:transform:", v4, 0, &v16, v9, &v13);

  -[PKDrawingConcrete setStrokeSortIDForInsertion:](self, "setStrokeSortIDForInsertion:", v10);
  if (v5)
    -[_PKStrokeConcrete _setClipPlane:](v10, "_setClipPlane:", v5);
  if (v6)
    -[PKStroke _setRenderMask:](v10, "_setRenderMask:", v6);
  objc_msgSend(v4, "_groupID", v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _setGroupID:](v10, "_setGroupID:", v11);

  return v10;
}

- (void)addNewStroke:(id)a3
{
  void *v4;
  NSMutableDictionary *strokesIdentifierMap;
  void *v6;
  CGRect *p_bounds;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18 = a3;
  -[NSMutableArray addObject:](self->_allStrokes, "addObject:");
  if ((objc_msgSend(v18, "_isHidden") & 1) == 0)
  {
    if ((objc_msgSend(v18, "hasSubstrokes") & 1) != 0)
    {
      -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
      -[PKDrawingConcrete invalidateStrokeBounds](self, "invalidateStrokeBounds");
    }
    else
    {
      -[PKDrawing _cachedVisibleStrokes](self, "_cachedVisibleStrokes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      strokesIdentifierMap = self->_strokesIdentifierMap;
      objc_msgSend(v18, "_strokeUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](strokesIdentifierMap, "setObject:forKey:", v18, v6);

      p_bounds = &self->__bounds;
      if (!CGRectIsNull(self->__bounds))
      {
        x = p_bounds->origin.x;
        y = self->__bounds.origin.y;
        width = self->__bounds.size.width;
        height = self->__bounds.size.height;
        objc_msgSend(v18, "_bounds");
        v21.origin.x = v12;
        v21.origin.y = v13;
        v21.size.width = v14;
        v21.size.height = v15;
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        v20 = CGRectUnion(v19, v21);
        p_bounds->origin.x = v20.origin.x;
        self->__bounds.origin.y = v20.origin.y;
        self->__bounds.size.width = v20.size.width;
        self->__bounds.size.height = v20.size.height;
      }
    }
  }
  -[PKDrawingConcrete version](self, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementClockForUUID:", v17);

  -[PKDrawing setNeedsRecognitionUpdate](self, "setNeedsRecognitionUpdate");
}

- (id)undoableAddNewStrokes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v19;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "ink");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.ink.lasso"));

        if ((v11 & 1) == 0)
        {
          -[PKDrawingConcrete addNewStroke:](self, "addNewStroke:", v8);
          objc_msgSend(v8, "ink");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "behavior");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEraser");

          if ((v14 & 1) == 0)
            objc_msgSend(v20, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_isHidden");

    +[PKModifyStrokesCommand commandForMakingStrokesVisible:drawing:hiding:](PKModifyStrokesCommand, "commandForMakingStrokesVisible:drawing:hiding:", v20, self, v16 ^ 1u);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKUndoGroupCommand *v16;
  void *v17;
  void *v18;
  void *v19;
  PKUndoGroupCommand *v20;
  PKUndoGroupCommand *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        -[PKDrawingConcrete visibleStrokeForInsertingStroke:](self, "visibleStrokeForInsertingStroke:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  -[PKDrawingConcrete undoableDeleteStrokes:](self, "undoableDeleteStrokes:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingConcrete undoableAddNewStrokes:](self, "undoableAddNewStrokes:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    v21 = v14;
LABEL_13:
    v20 = v21;
    goto LABEL_14;
  }
  if (!v14)
  {
    v21 = v13;
    goto LABEL_13;
  }
  v16 = [PKUndoGroupCommand alloc];
  -[PKDrawingConcrete uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PKUndoGroupCommand initWithDrawingUUID:actionName:commands:](v16, "initWithDrawingUUID:actionName:commands:", v17, v18, v19);

LABEL_14:
  return v20;
}

- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", a4, v7);

}

- (void)updateStrokes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableArray count](self->_allStrokes, "count");
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_allStrokes, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __35__PKDrawingConcrete_updateStrokes___block_invoke;
      v13[3] = &unk_1E77780B8;
      v14 = v12;
      v15 = &v16;
      objc_msgSend(v7, "_updateStroke:inDrawing:", v13, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v7)
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_allStrokes, "replaceObjectAtIndex:withObject:", v6, v8);
        objc_msgSend(v11, "addObject:", v8);
      }
      v9 = *((unsigned __int8 *)v17 + 24);

      _Block_object_dispose(&v16, 8);
      if (v9)
        break;
    }
    while (v5 != v6++);
  }
  if (objc_msgSend(v11, "count"))
  {
    -[PKDrawingConcrete didUpdate](self, "didUpdate");
    -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
    -[PKDrawing setNeedsRecognitionUpdate](self, "setNeedsRecognitionUpdate");
  }

}

id __35__PKDrawingConcrete_updateStrokes___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return v5;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PKDrawingConcrete_setStrokes_hidden___block_invoke;
  v4[3] = &__block_descriptor_33_e44___PKStroke_32__0__PKStroke_8__PKStroke_16Q24l;
  v5 = a4;
  -[PKDrawingConcrete _updateStrokes:updateBlock:](self, "_updateStrokes:updateBlock:", a3, v4);
}

id __39__PKDrawingConcrete_setStrokes_hidden___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 32) != objc_msgSend(v7, "_isHidden"))
  {
    if (objc_msgSend(v7, "_pointsCount"))
      v9 = v7;
    else
      v9 = v6;
    v10 = v9;
    v8 = (void *)objc_msgSend(v10, "copyForMutation");

    objc_msgSend(v8, "_setHidden:", *(unsigned __int8 *)(a1 + 32));
    objc_msgSend(v8, "_setFlags:", objc_msgSend(v8, "_flags") & 0xFFFFFFFFFFFFFFFDLL);

  }
  return v8;
}

- (void)deleteStrokes:(id)a3
{
  -[PKDrawingConcrete setStrokes:hidden:](self, "setStrokes:hidden:", a3, 1);
}

- (id)undoableDeleteStrokes:(id)a3
{
  void *v4;
  void *v5;

  +[PKModifyStrokesCommand commandForErasingStrokes:drawing:](PKModifyStrokesCommand, "commandForErasingStrokes:drawing:", a3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToDrawing:", self);
  objc_msgSend(v4, "invertedInDrawing:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stroke:(id)a3 transformed:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v15;

  v5 = a5;
  v7 = (void *)objc_msgSend(a3, "copyForMutation");
  v8 = v7;
  if (v5)
  {
    if (v7)
      objc_msgSend(v7, "_transform");
    else
      memset(&t1, 0, sizeof(t1));
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v10;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v15, &t1, &t2);
  }
  else
  {
    v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v9;
    *(_OWORD *)&v15.tx = *(_OWORD *)&a4->tx;
  }
  v12 = v15;
  objc_msgSend(v8, "_setTransform:", &v12);
  objc_msgSend(v8, "_setFlags:", objc_msgSend(v8, "_flags") & 0xFFFFFFFFFFFFFFF7);
  return v8;
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  BOOL v15;
  CGAffineTransform v16;

  v5 = a5;
  v8 = a3;
  if (!v5
    || (v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&v16.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&v16.c = v9,
        *(_OWORD *)&v16.tx = *(_OWORD *)&a4->tx,
        !CGAffineTransformIsIdentity(&v16)))
  {
    v11[1] = 3221225472;
    v10 = *(_OWORD *)&a4->c;
    v12 = *(_OWORD *)&a4->a;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[2] = __59__PKDrawingConcrete_transformStrokes_withTransform_concat___block_invoke;
    v11[3] = &unk_1E7778100;
    v11[4] = self;
    v13 = v10;
    v14 = *(_OWORD *)&a4->tx;
    v15 = v5;
    -[PKDrawingConcrete _updateStrokes:updateBlock:](self, "_updateStrokes:updateBlock:", v8, v11);
  }

}

id __59__PKDrawingConcrete_transformStrokes_withTransform_concat___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "_stroke:transformed:concat:", a2, v5, *(unsigned __int8 *)(a1 + 88));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  __int128 v6;
  void *v7;
  void *v8;
  _OWORD v10[3];

  v6 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->tx;
  +[PKTransformStrokesCommand commandForTransforming:drawing:strokeTransform:](PKTransformStrokesCommand, "commandForTransforming:drawing:strokeTransform:", a3, self, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToDrawing:", self);
  objc_msgSend(v7, "invertedInDrawing:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKDrawingConcrete *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__PKDrawingConcrete_setStrokes_inks___block_invoke;
  v8[3] = &unk_1E7778128;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[PKDrawingConcrete _updateStrokes:updateBlock:](self, "_updateStrokes:updateBlock:", a3, v8);

}

id __37__PKDrawingConcrete_setStrokes_inks___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newStroke:withInk:", v6, v7);

  return v8;
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  +[PKDrawing drawingStrokesFromStrokes:inDrawing:](PKDrawing, "drawingStrokesFromStrokes:inDrawing:", v6, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKModifyStrokeInkCommand commandForModifyingStrokes:drawing:inks:](PKModifyStrokeInkCommand, "commandForModifyingStrokes:drawing:inks:", v8, self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedInDrawing:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDrawingConcrete setStrokes:inks:](self, "setStrokes:inks:", v6, v7);
  return v10;
}

- (id)_newStroke:(id)a3 withInk:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v9 = (id)objc_msgSend(v5, "copyForMutation");
    objc_msgSend(v9, "_setInk:", v6);
    objc_msgSend(v9, "_setFlags:", objc_msgSend(v9, "_flags") & 0xFFFFFFFFFFFFFFFBLL);
  }

  return v9;
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PKDrawingConcrete_setStrokes_groupID___block_invoke;
  v8[3] = &unk_1E7778128;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PKDrawingConcrete _updateStrokes:updateBlock:](self, "_updateStrokes:updateBlock:", a3, v8);

}

id __40__PKDrawingConcrete_setStrokes_groupID___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_newStroke:withGroupID:", a2, *(_QWORD *)(a1 + 40));
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PKDrawing drawingStrokesFromStrokes:inDrawing:](PKDrawing, "drawingStrokesFromStrokes:inDrawing:", v8, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKModifyStrokesGroupIDCommand commandForModifyingStrokes:drawing:groupID:actionName:](PKModifyStrokesGroupIDCommand, "commandForModifyingStrokes:drawing:groupID:actionName:", v11, self, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invertedInDrawing:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDrawingConcrete setStrokes:groupID:](self, "setStrokes:groupID:", v8, v9);
  return v13;
}

- (id)_newStroke:(id)a3 withGroupID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_groupID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "_groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if (v9)
  {
LABEL_5:
    v10 = v5;
    goto LABEL_6;
  }
  v10 = (id)objc_msgSend(v5, "copyForMutation");
  objc_msgSend(v10, "_setGroupID:", v6);
LABEL_6:

  return v10;
}

- (void)_updateStrokes:(id)a3 updateBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PKDrawingConcrete *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "_strokeUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v15 = objc_msgSend(v9, "count");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__PKDrawingConcrete__updateStrokes_updateBlock___block_invoke;
  v18[3] = &unk_1E7778150;
  v16 = v8;
  v19 = v16;
  v17 = v7;
  v22 = v24;
  v23 = v15;
  v20 = self;
  v21 = v17;
  -[PKDrawingConcrete updateStrokes:](self, "updateStrokes:", v18);

  _Block_object_dispose(v24, 8);
}

id __48__PKDrawingConcrete__updateStrokes_updateBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = (void *)a1[4];
  objc_msgSend(v5, "_strokeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5;
  v10 = v9;
  if (v8)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(_QWORD *)(v12 + 24) + 1;
    *(_QWORD *)(v12 + 24) = v13;
    if (v13 == a1[8])
      *a3 = 1;
    v10 = v9;
    if (v11 != v9)
    {
      objc_msgSend(v11, "didUpdateInDrawing:", a1[5]);
      v10 = v11;
    }
  }

  return v10;
}

- (void)_mergeStroke:(id)a3
{
  uint64_t v4;
  NSMutableArray *allStrokes;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = -[NSMutableArray count](self->_allStrokes, "count") + 1;
  while (1)
  {
    allStrokes = self->_allStrokes;
    v6 = v4 - 2;
    if (v4 - 2 < 0)
    {
      -[NSMutableArray insertObject:atIndex:](allStrokes, "insertObject:atIndex:", v19, 0);
      goto LABEL_9;
    }
    -[NSMutableArray objectAtIndexedSubscript:](allStrokes, "objectAtIndexedSubscript:", v4 - 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_strokeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_strokeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    v11 = self->_allStrokes;
    if (v10)
      break;
    -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v4 - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compareToStroke:", v19);

    --v4;
    if (v13 != 1)
    {
      -[NSMutableArray insertObject:atIndex:](self->_allStrokes, "insertObject:atIndex:", v19, v4);
LABEL_9:
      -[PKDrawingConcrete version](self, "version");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "incrementClockForUUID:", v18);

      -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
      -[PKDrawing setNeedsRecognitionUpdate](self, "setNeedsRecognitionUpdate");
      goto LABEL_10;
    }
  }
  -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v4 - 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_mergeWithStroke:inDrawing:", v19, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndexedSubscript:](self->_allStrokes, "objectAtIndexedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v16)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_allStrokes, "setObject:atIndexedSubscript:", v15, v6);

    goto LABEL_9;
  }

LABEL_10:
}

- (void)normalizeUUIDsWithDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  -[PKDrawingConcrete version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
  {

LABEL_8:
    -[PKDrawingConcrete uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_fault_impl(&dword_1BE213000, v16, OS_LOG_TYPE_FAULT, "Attempt to merge with invalid drawing", v20, 2u);
      }

    }
    goto LABEL_18;
  }
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) == 0)
    goto LABEL_8;
  -[PKDrawingConcrete version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
  {
    objc_msgSend(v4, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEmpty");

    if (v10)
    {
      -[PKDrawingConcrete nsuuid](self, "nsuuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nsuuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "PK_compare:", v12) == -1)
        objc_msgSend(v4, "uuid");
      else
        -[PKDrawingConcrete uuid](self, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete _setUUID:](self, "_setUUID:", v19);

      goto LABEL_17;
    }
  }
  else
  {

  }
  -[PKDrawingConcrete version](self, "version");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEmpty");

  if (v18)
  {
    objc_msgSend(v4, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingConcrete _setUUID:](self, "_setUUID:", v11);
LABEL_17:

  }
LABEL_18:

}

- (unint64_t)mergeWithDrawing:(id)a3
{
  PKDrawingConcrete *v4;
  unsigned int v5;
  unint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *allStrokes;
  void *v25;
  PKVectorTimestamp *v26;
  PKVectorTimestamp *version;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *strokesIdentifierMap;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  unsigned int v56;
  uint8_t buf[24];
  uint64_t v58;
  CGRect v59;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = (PKDrawingConcrete *)a3;
  if (v4 != self)
  {
    -[PKDrawingConcrete normalizeUUIDsWithDrawing:](self, "normalizeUUIDsWithDrawing:", v4);
    -[PKDrawingConcrete willMergeWithDrawing:](v4, "willMergeWithDrawing:", self);
    if (v4)
    {
      -[PKDrawingConcrete boundsVersion](v4, "boundsVersion");
      v5 = *(_DWORD *)buf;
    }
    else
    {
      v5 = 0;
      memset(buf, 0, sizeof(buf));
    }
    -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
    if (v5 < v56)
      goto LABEL_11;
    if (v4)
      -[PKDrawingConcrete boundsVersion](v4, "boundsVersion");
    else
      memset(buf, 0, sizeof(buf));
    *(_OWORD *)&self->_boundsVersion.clock = *(_OWORD *)buf;
    *(_QWORD *)&self->_boundsVersion.replicaUUID[12] = *(_QWORD *)&buf[16];
    -[PKDrawingConcrete _canvasBounds](v4, "_canvasBounds");
    v59.origin.x = v7;
    v59.origin.y = v8;
    v59.size.width = v9;
    v59.size.height = v10;
    if (CGRectEqualToRect(self->__canvasBounds, v59))
    {
LABEL_11:
      v6 = 1;
    }
    else
    {
      -[PKDrawingConcrete _canvasBounds](v4, "_canvasBounds");
      self->__canvasBounds.origin.x = v11;
      self->__canvasBounds.origin.y = v12;
      v6 = 2;
      self->__canvasBounds.size.width = v13;
      self->__canvasBounds.size.height = v14;
    }
    -[PKDrawingConcrete version](self, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingConcrete version](v4, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "compareTo:", v16);

    if ((v17 & 1) == 0)
    {
      -[PKDrawingConcrete didMergeWithDrawing:](v4, "didMergeWithDrawing:", self);
      v18 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[PKDrawingConcrete uuid](self, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v21;
        _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Skipped drawing merge: %@, strokes: %lu", buf, 0x16u);

      }
      goto LABEL_36;
    }
    if ((v17 & 4) == 0)
    {
      -[PKDrawingConcrete _allStrokes](v4, "_allStrokes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (NSMutableArray *)objc_msgSend(v22, "mutableCopy");
      allStrokes = self->_allStrokes;
      self->_allStrokes = v23;

      -[PKDrawingConcrete version](v4, "version");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (PKVectorTimestamp *)objc_msgSend(v25, "copy");
      version = self->_version;
      self->_version = v26;

      -[PKDrawing _cachedVisibleStrokes](v4, "_cachedVisibleStrokes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");
      -[PKDrawing set_cachedVisibleStrokes:](self, "set_cachedVisibleStrokes:", v29);

      v30 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4->_strokesIdentifierMap, "mutableCopy");
      strokesIdentifierMap = self->_strokesIdentifierMap;
      self->_strokesIdentifierMap = v30;

      -[PKDrawingConcrete bounds](v4, "bounds");
      self->__bounds.origin.x = v32;
      self->__bounds.origin.y = v33;
      self->__bounds.size.width = v34;
      self->__bounds.size.height = v35;
      -[PKDrawing setNeedsRecognitionUpdate](self, "setNeedsRecognitionUpdate");
      -[PKDrawingConcrete didMergeWithDrawing:](v4, "didMergeWithDrawing:", self);
      v18 = os_log_create("com.apple.pencilkit", ");
      v6 = 2;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[PKDrawingConcrete uuid](self, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v38;
        _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Quick merged drawing: %@, strokes: %lu", buf, 0x16u);

LABEL_39:
        v6 = 2;
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    v39 = -[NSMutableArray count](self->_allStrokes, "count");
    -[PKDrawingConcrete _allStrokes](v4, "_allStrokes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    v42 = v41 - 1;
    if (v41 - 1 < 0)
    {
LABEL_35:
      -[PKDrawingConcrete version](self, "version");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete version](v4, "version");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "mergeWithTimestamp:", v51);

      -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
      -[PKDrawing setNeedsRecognitionUpdate](self, "setNeedsRecognitionUpdate");
      -[PKDrawingConcrete didMergeWithDrawing:](v4, "didMergeWithDrawing:", self);
      v18 = os_log_create("com.apple.pencilkit", ");
      v6 = 2;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[PKDrawingConcrete uuid](self, "uuid");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v55;
        _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Merged drawing: %@, strokes: %lu", buf, 0x16u);

        goto LABEL_39;
      }
LABEL_36:

      goto LABEL_37;
    }
    v43 = v39 - 1;
    while (1)
    {
      -[PKDrawingConcrete _allStrokes](v4, "_allStrokes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = self->_allStrokes;
      if ((v43 & 0x8000000000000000) == 0)
        break;
      -[NSMutableArray insertObject:atIndex:](v46, "insertObject:atIndex:", v45, 0);
      --v42;
LABEL_34:

      if (v42 < 0)
        goto LABEL_35;
    }
    -[NSMutableArray objectAtIndexedSubscript:](v46, "objectAtIndexedSubscript:", v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "compareToStroke:", v45);
    if (v48 == -1)
    {
      -[NSMutableArray insertObject:atIndex:](self->_allStrokes, "insertObject:atIndex:", v45, v43 + 1);
    }
    else
    {
      if (v48)
      {
        if (v48 == 1)
          --v43;
        goto LABEL_33;
      }
      objc_msgSend(v47, "_mergeWithStroke:inDrawing:", v45, self);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49 != v47)
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_allStrokes, "replaceObjectAtIndex:withObject:", v43, v49);

      --v43;
    }
    --v42;
LABEL_33:

    goto LABEL_34;
  }
  v6 = 1;
LABEL_37:

  return v6;
}

- (void)didUpdate
{
  void *v3;
  id v4;

  -[PKDrawingConcrete version](self, "version");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDrawingConcrete replicaUUID](self, "replicaUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementClockForUUID:", v3);

}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[PKDrawingConcrete uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PKDrawingConcrete version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v3 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  BOOL v11;
  _PKStrokeID v13;
  _PKStrokeID v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_7;
  -[PKDrawingConcrete uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_7;
  -[PKDrawingConcrete version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v10))
  {

LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "boundsVersion");
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v11 = _PKStrokeIDCompare(&v14, &v13) == 0;

LABEL_8:
  return v11;
}

- (void)willMergeWithDrawing:(id)a3
{
  id v4;

  if (self->_replicaUUID)
  {
    +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateVersionForDrawing:", self);

  }
}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
  char v11;
  const void **v12;
  const void **v13;
  int64_t *v14;
  int64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PKSliceStrokesCommand *v26;
  void *v27;
  void *v28;
  void *v29;
  PKSliceStrokesCommand *v30;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 < 1)
  {
LABEL_15:
    v30 = 0;
    goto LABEL_16;
  }
  v11 = 0;
  v12 = a5 - 1;
  v13 = a4 - 1;
  v14 = a3 - 1;
  while (1)
  {
    v15 = v14[a6];
    v16 = (id)v13[a6];
    if (v16)
      break;
    -[PKDrawingConcrete _rootStrokes](self, "_rootStrokes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v22);

    -[PKDrawingConcrete _rootStrokes](self, "_rootStrokes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v25, "_setHidden:", 1);
    objc_msgSend(v25, "didUpdateSubstrokesInDrawing:", self);
    -[PKDrawingConcrete updateStroke:indexHint:](self, "updateStroke:indexHint:", v25, v15);

    if ((unint64_t)a6 < 2)
      goto LABEL_14;
    v11 = 1;
LABEL_12:
    --a6;
  }
  if (objc_msgSend((id)v12[a6], "count"))
  {
    -[PKDrawingConcrete _rootStrokes](self, "_rootStrokes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 != v18)
    {
      objc_msgSend(v18, "_substrokes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_strokeUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v19, v20);

      -[PKDrawingConcrete updateStroke:indexHint:](self, "updateStroke:indexHint:", v16, v15);
      v11 = 1;
    }

  }
  if ((unint64_t)a6 > 1)
    goto LABEL_12;
  if ((v11 & 1) == 0)
    goto LABEL_15;
LABEL_14:
  -[PKDrawingConcrete didUpdate](self, "didUpdate");
  -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
  v26 = [PKSliceStrokesCommand alloc];
  -[PKDrawingConcrete uuid](self, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _PencilKitBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Bitmap Erase"), CFSTR("Bitmap Erase"), CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PKSliceStrokesCommand initWithDrawingUUID:actionName:substrokes:strokesHidden:hiding:](v26, "initWithDrawingUUID:actionName:substrokes:strokesHidden:hiding:", v27, v29, v32, v33, 0);

LABEL_16:
  return v30;
}

- (PKDrawingConcrete)initWithData:(id)a3 error:(id *)a4
{
  return -[PKDrawingConcrete initWithData:loadNonInkingStrokes:error:](self, "initWithData:loadNonInkingStrokes:error:", a3, 0, a4);
}

- (void)_addTestDataToUnknownFields
{
  PKProtobufUnknownFields *v3;
  shared_ptr<PKProtobufUnknownFields> *p_unknownFields;
  PB::Writer **v5;
  PB::Writer **ptr;
  PB::Writer **v7;

  v3 = (PKProtobufUnknownFields *)operator new();
  PKProtobufUnknownFields::PKProtobufUnknownFields(v3);
  v7 = (PB::Writer **)v3;
  p_unknownFields = &self->_unknownFields;
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]<PKProtobufUnknownFields,std::default_delete<PKProtobufUnknownFields>,void>(p_unknownFields, (uint64_t *)&v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    std::unique_ptr<PB::Writer>::reset[abi:ne180100](v5, 0);
    MEMORY[0x1C3B7F770](v5, 0x1020C40EDED9539);
  }
  ptr = (PB::Writer **)p_unknownFields->__ptr_;
  arc4random_uniform(0x186A0u);
  PB::Writer::writeVarInt(*ptr);
}

- (id)_dataInUnknownFields
{
  PKProtobufUnknownFields *ptr;
  _QWORD *v3;
  void *v4;

  ptr = self->_unknownFields.__ptr_;
  if (ptr && (v3 = *(_QWORD **)ptr) != 0 && *v3 != v3[1])
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (PKVectorTimestamp)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (_PKStrokeID)boundsVersion
{
  *retstr = self[8];
  return self;
}

- (void)setBoundsVersion:(_PKStrokeID *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_boundsVersion.clock = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_boundsVersion.replicaUUID[12] = v3;
}

- (shared_ptr<PKProtobufUnknownFields>)_unknownFields
{
  PKProtobufUnknownFields **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<PKProtobufUnknownFields> result;

  cntrl = self->_unknownFields.__cntrl_;
  *v2 = self->_unknownFields.__ptr_;
  v2[1] = (PKProtobufUnknownFields *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKProtobufUnknownFields *)self;
  return result;
}

- (void)set_orientation:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &kOrientationKey, v4, (void *)0x301);

}

- (int64_t)_orientation
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_getAssociatedObject(self, &kOrientationKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)_removeHiddenAndEraserStrokes
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PKDrawingConcrete_UpgradeAdditions___removeHiddenAndEraserStrokes__block_invoke;
  v7[3] = &unk_1E7779FD8;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v6);

  -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
}

void __68__PKDrawingConcrete_UpgradeAdditions___removeHiddenAndEraserStrokes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "_isHidden") & 1) != 0
    || (objc_msgSend(v8, "ink"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ink.eraser")),
        v6,
        v5,
        v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

- (void)_removeInvisibleStrokes
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKDrawingConcrete_UpgradeAdditions___removeInvisibleStrokes__block_invoke;
  v7[3] = &unk_1E7779FD8;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  if (objc_msgSend(v6, "count"))
  {
    -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsAtIndexes:", v6);

    -[PKDrawingConcrete invalidateVisibleStrokes](self, "invalidateVisibleStrokes");
  }

}

void __62__PKDrawingConcrete_UpgradeAdditions___removeInvisibleStrokes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "_isHidden"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }
  else if ((unint64_t)objc_msgSend(v14, "_pointsCount") >= 2)
  {
    objc_msgSend(v14, "_strokeData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_pointsCount");
    v7 = 1;
    while (v6 != v7)
    {
      objc_msgSend(v5, "locationAtIndex:", v7 - 1);
      v9 = v8;
      v11 = v10;
      objc_msgSend(v5, "locationAtIndex:", v7++);
      if (sqrt((v13 - v11) * (v13 - v11) + (v12 - v9) * (v12 - v9)) >= 0.00000011920929)
        goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
LABEL_9:

  }
}

- ($3CC19D079FD0B010EE84973AA846B91B)_drawingStrokeInfoIsLegacyDrawing:(SEL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  uint64_t v18;
  id obj;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v21 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  -[PKDrawing strokes](self, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var0 = objc_msgSend(v5, "count");

  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var3 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PKDrawing strokes](self, "strokes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v18 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "ink");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

        if (v14)
          retstr->var1 = ++v8;
        objc_msgSend(v11, "_clipPlane");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (!v16)
          retstr->var2 = ++v7;
        if (v21 && objc_msgSend(v11, "_shouldBeClippedAgainstLegacyCanvas"))
          retstr->var3 = ++v18;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  return result;
}

+ (CGAffineTransform)_orientationTransform:(SEL)a3 size:(int64_t)a4
{
  uint64_t v5;
  __int128 v6;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  switch(a4)
  {
    case 3:
      *(_OWORD *)&retstr->a = xmmword_1BE4FB810;
      *(_OWORD *)&retstr->c = xmmword_1BE4FCF90;
      retstr->tx = a5.width;
      retstr->ty = 0.0;
      break;
    case 2:
      *(_OWORD *)&retstr->a = xmmword_1BE4FCF80;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->c = 1.0;
      retstr->ty = a5.height;
      break;
    case 1:
      retstr->a = -1.0;
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->d = -1.0;
      *(CGSize *)&retstr->tx = a5;
      break;
  }
  return result;
}

+ (id)_defaultConversionQueue
{
  if (_MergedGlobals_129 != -1)
    dispatch_once(&_MergedGlobals_129, &__block_literal_global_37);
  return (id)qword_1ECEE6208;
}

void __62__PKDrawingConcrete_UpgradeAdditions___defaultConversionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.pencilkit.conversion", attr);
  v2 = (void *)qword_1ECEE6208;
  qword_1ECEE6208 = (uint64_t)v1;

}

- (id)_upgradeOnQueue:(id)a3 isLegacyDrawing:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  NSObject *v8;
  id v9;
  double v10;
  double v11;
  CGFloat v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  BOOL v26;
  BOOL v27;
  CGAffineTransform v28;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v31;
  CGAffineTransform v32;
  __int128 v33;
  __int128 v34;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v33 = 0u;
  v34 = 0u;
  -[PKDrawingConcrete _drawingStrokeInfoIsLegacyDrawing:](self, "_drawingStrokeInfoIsLegacyDrawing:", v6);
  -[PKDrawingConcrete _unscaledOrientedDrawingSize](self, "_unscaledOrientedDrawingSize");
  memset(&v32, 0, sizeof(v32));
  +[PKDrawingConcrete _orientationTransform:size:](PKDrawingConcrete, "_orientationTransform:size:", -[PKDrawingConcrete _orientation](self, "_orientation"), v10, v11);
  -[PKDrawingConcrete _conversionScaleFactor](self, "_conversionScaleFactor");
  if (v12 != 1.0)
  {
    t1 = v32;
    CGAffineTransformMakeScale(&t2, v12, v12);
    CGAffineTransformConcat(&v31, &t1, &t2);
    v32 = v31;
  }
  v28 = v32;
  v13 = !CGAffineTransformIsIdentity(&v28);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", *((_QWORD *)&v33 + 1) + (_QWORD)v34 + v13 + *((_QWORD *)&v34 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultConversionQueue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__PKDrawingConcrete_UpgradeAdditions___upgradeOnQueue_isLegacyDrawing_completionBlock___block_invoke;
  v20[3] = &unk_1E777A000;
  v20[4] = self;
  v23 = v33;
  v24 = v34;
  v15 = v14;
  v26 = v6;
  v27 = v13;
  v25 = v32;
  v21 = v15;
  v22 = v9;
  v16 = v9;
  dispatch_async(v8, v20);
  v17 = v22;
  v18 = v15;

  return v18;
}

void __87__PKDrawingConcrete_UpgradeAdditions___upgradeOnQueue_isLegacyDrawing_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[3];
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_removeInvisibleStrokes");
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_allStrokes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3 >= 1)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = (void *)MEMORY[0x1C3B7FBFC]();
        objc_msgSend(*(id *)(a1 + 32), "_allStrokes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "_clipPlane");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_msgSend(v7, "_isHidden");

          if ((v9 & 1) == 0)
          {
            objc_msgSend(v7, "ink");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

            if (v12)
            {
              objc_msgSend(v7, "_clipPlane");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "_strokeUUID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v13, v14);

            }
            else
            {
              v50 = 0;
              v15 = (id)objc_msgSend(*(id *)(a1 + 32), "_clipStroke:newRootStroke:", v7, &v50);
              v16 = v50;
              v17 = *(void **)(a1 + 32);
              if (v50)
              {
                objc_msgSend(v17, "_allStrokes");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:atIndexedSubscript:", v16, i);

              }
              else
              {
                objc_msgSend(v17, "_allStrokes");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "removeObjectAtIndex:", i);

                --i;
                --v3;
              }

            }
            objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
          }
        }

        objc_autoreleasePoolPop(v5);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidateVisibleStrokes");
  }
  if (*(_QWORD *)(a1 + 80) && *(_BYTE *)(a1 + 136))
  {
    objc_msgSend(*(id *)(a1 + 32), "_allStrokes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 >= 1)
    {
      for (j = 0; j != v21; ++j)
      {
        v23 = (void *)MEMORY[0x1C3B7FBFC]();
        objc_msgSend(*(id *)(a1 + 32), "_allStrokes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", j);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "_shouldBeClippedAgainstLegacyCanvas"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_clipAgainstLegacyCanvas:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26 && (void *)v26 != v25)
          {
            objc_msgSend(*(id *)(a1 + 32), "_allStrokes");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, j);

          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);

        }
        objc_autoreleasePoolPop(v23);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidateVisibleStrokes");
  }
  if (*(_BYTE *)(a1 + 137))
  {
    v29 = *(void **)(a1 + 32);
    v30 = *(_OWORD *)(a1 + 104);
    v49[0] = *(_OWORD *)(a1 + 88);
    v49[1] = v30;
    v49[2] = *(_OWORD *)(a1 + 120);
    objc_msgSend(v29, "_transformAllStrokes:", v49);
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "strokes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          objc_msgSend(v36, "ink");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.ink.eraser"));

          if (v39)
          {
            v40 = (void *)MEMORY[0x1C3B7FBFC]();
            objc_msgSend(v36, "_strokeUUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "_setClipPlane:", v42);

            v43 = (id)objc_msgSend(*(id *)(a1 + 32), "sliceWithEraseStroke:", v36);
            objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
            objc_autoreleasePoolPop(v40);
          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v33);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_removeHiddenAndEraserStrokes");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "set_canvasBounds:", 0.0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (CGAffineTransform)_transformForImageWithSize:(SEL)a3
{
  CGAffineTransform *result;
  CGFloat v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  +[PKDrawingConcrete _orientationTransform:size:](PKDrawingConcrete, "_orientationTransform:size:", -[PKDrawingConcrete _orientation](self, "_orientation"), a4.width, a4.height);
  CGAffineTransformInvert(retstr, &v13);
  result = (CGAffineTransform *)-[PKDrawingConcrete _conversionScaleFactor](self, "_conversionScaleFactor");
  if (v7 != 1.0)
  {
    v8 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformMakeScale(&v10, v7, v7);
    result = CGAffineTransformConcat(&v12, &t1, &v10);
    v9 = *(_OWORD *)&v12.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v12.tx;
  }
  return result;
}

- (double)_conversionScaleFactor
{
  unint64_t v2;
  double result;

  v2 = -[PKDrawingConcrete _orientation](self, "_orientation");
  result = 1.0;
  if (v2 < 2)
    return 0.75;
  return result;
}

- (CGSize)_unscaledOrientedDrawingSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[PKDrawingConcrete _orientation](self, "_orientation");
  v3 = 768.0;
  if (v2 >= 2)
    v4 = 768.0;
  else
    v4 = 1024.0;
  if (v2 >= 2)
    v3 = 1024.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)_orientedDrawingSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PKDrawingConcrete _unscaledOrientedDrawingSize](self, "_unscaledOrientedDrawingSize");
  v4 = v3;
  v6 = v5;
  -[PKDrawingConcrete _conversionScaleFactor](self, "_conversionScaleFactor");
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_upgradeLegacyPenInks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PKInk *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  PKInk *v18;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  -[PKDrawing strokes](self, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[PKDrawing strokes](self, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PKDrawing strokes](self, "strokes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v23 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "ink");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "version"))
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ink.pen"));

          if (v11)
          {
            v12 = [PKInk alloc];
            objc_msgSend(v9, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "color");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v15);
            objc_msgSend(v9, "variant");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "weight");
            v18 = -[PKInk initWithIdentifier:color:version:variant:weight:](v12, "initWithIdentifier:color:version:variant:weight:", v13, v14, v16, v17);

            objc_msgSend(v21, "addObject:", v8);
            objc_msgSend(v20, "addObject:", v18);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v21, "count"))
    -[PKDrawingConcrete setStrokes:inks:](self, "setStrokes:inks:", v21, v20);

}

- (PKDrawingConcrete)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  PKDrawingConcrete *v12;
  _BYTE v14[24];
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((unint64_t)objc_msgSend(v8, "length") >= 0xB)
  {
    objc_msgSend(v8, "getBytes:length:", v14, 10);
    if (v14[0] == 31 && v14[1] == 139)
    {
      objc_msgSend(v8, "PK_gzipInflate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;

        v8 = v11;
      }

    }
  }
  v12 = -[PKDrawingConcrete _initWithUnzippedData:loadNonInkingStrokes:error:](self, "_initWithUnzippedData:loadNonInkingStrokes:error:", v8, v6, a5);

  return v12;
}

- (id)_initWithUnzippedData:(id)a3 error:(id *)a4
{
  return -[PKDrawingConcrete _initWithUnzippedData:loadNonInkingStrokes:error:](self, "_initWithUnzippedData:loadNonInkingStrokes:error:", a3, 0, a4);
}

- (id)_initWithUnzippedData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  PKDrawingVersionedDocument *v9;
  PKDrawingConcrete *v10;
  id v11;
  id v13;
  const unsigned __int8 *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(drawing::Drawing *__hidden);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned __int8 v29;
  _BYTE v30[36];
  int v31;

  v6 = a4;
  v8 = a3;
  v9 = -[PKDrawingVersionedDocument initWithDrawingClass:]([PKDrawingVersionedDocument alloc], "initWithDrawingClass:", objc_opt_class());
  -[PKDrawingVersionedDocument setLoadNonInkingStrokes:](v9, "setLoadNonInkingStrokes:", v6);
  if (!-[PKDrawingVersionedDocument loadUnzippedData:](v9, "loadUnzippedData:", v8))
  {
    v18 = &off_1E77749F0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0;
    v11 = v8;
    if ((unint64_t)objc_msgSend(v11, "length") <= 7)
    {
      PKProtobufUtilitiesMalformedError(a5);
LABEL_5:

LABEL_6:
      v10 = 0;
LABEL_7:
      drawing::Drawing::~Drawing((void ***)&v18);
      goto LABEL_8;
    }
    v31 = 0;
    objc_msgSend(v11, "getBytes:range:", &v31, 0, 4);
    if (v31 == -261852553)
    {
      v29 = 0;
      objc_msgSend(v11, "getBytes:range:", &v29, 4, 1);
      if (v29 >= 5u)
      {
        PKProtobufUtilitiesFormatTooNew(a5);
        goto LABEL_5;
      }
      v28 = 0;
      objc_msgSend(v11, "getBytes:range:", &v28, 6, 2);
      v15 = v28;
      if (v28 < 8uLL || objc_msgSend(v11, "length") <= v15)
      {
        PKProtobufUtilitiesMalformedError(a5);
        goto LABEL_5;
      }
      v13 = objc_retainAutorelease(v11);
      v16 = objc_msgSend(v13, "bytes");
      v17 = v28;
      objc_msgSend(v13, "length");
      PB::Reader::Reader((PB::Reader *)v30, (const unsigned __int8 *)(v16 + v17));
      if (!((BOOL (*)(drawing::Drawing *, PB::Reader *))v18[2])((drawing::Drawing *)&v18, (PB::Reader *)v30))
      {
LABEL_17:
        PKProtobufUtilitiesMalformedError(a5);

        goto LABEL_6;
      }
    }
    else
    {
      v13 = objc_retainAutorelease(v11);
      v14 = (const unsigned __int8 *)objc_msgSend(v13, "bytes");
      objc_msgSend(v13, "length");
      PB::Reader::Reader((PB::Reader *)v30, v14);
      if (!((BOOL (*)(drawing::Drawing *, PB::Reader *))v18[2])((drawing::Drawing *)&v18, (PB::Reader *)v30))
        goto LABEL_17;
    }

    v10 = -[PKDrawingConcrete initWithArchive:loadNonInkingStrokes:error:](self, "initWithArchive:loadNonInkingStrokes:error:", &v18, v6, a5);
    self = v10;
    goto LABEL_7;
  }
  -[PKDrawingVersionedDocument drawing](v9, "drawing");
  v10 = (PKDrawingConcrete *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

- (id)serialize
{
  return -[PKDrawingConcrete serializeWithVersion:](self, "serializeWithVersion:", -[PKDrawing _minimumSerializationVersion](self, "_minimumSerializationVersion"));
}

- (id)_data
{
  return -[PKDrawingConcrete serializeWithVersion:](self, "serializeWithVersion:", +[PKDrawing _currentSerializationVersion](PKDrawing, "_currentSerializationVersion"));
}

- (id)serializeTransiently
{
  void *v2;
  void *v3;

  v2 = (void *)-[PKDrawingConcrete copy](self, "copy");
  objc_msgSend(v2, "_setUUID:", 0);
  objc_msgSend(v2, "serializeWithVersion:", +[PKDrawing _currentSerializationVersion](PKDrawing, "_currentSerializationVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)serializeWithVersion:(int64_t)a3
{
  PKDrawingVersionedDocument *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v12)(drawing::Drawing *__hidden);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (a3 > 1)
  {
    v12 = &off_1E77749F0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PKDrawingConcrete saveToArchive:withPathData:](self, "saveToArchive:withPathData:", &v12, 1);
      PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::Drawing>((uint64_t)&v12, 255);
    }
    else
    {
      PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::Drawing>((uint64_t)&v12, -[PKDrawingConcrete saveToArchive:withPathData:](self, "saveToArchive:withPathData:", &v12, 1));
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    drawing::Drawing::~Drawing((void ***)&v12);
  }
  else
  {
    v4 = -[PKDrawingVersionedDocument initWithDrawing:]([PKDrawingVersionedDocument alloc], "initWithDrawing:", self);
    -[PKVersionedDocument serialize](v4, "serialize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = -[PKDrawingConcrete _hasReplicaUUID](self, "_hasReplicaUUID");
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  if (v7)
  {
    -[PKDrawingConcrete uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateVersionForDrawing:", self);

    }
  }
  +[PKReplicaManager sharedReplicaManager](PKReplicaManager, "sharedReplicaManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistIfNeeded");

  return v5;
}

- (PKDrawingConcrete)initWithV1Data:(id)a3 loadNonInkingStrokes:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  const unsigned __int8 *v9;
  PKDrawingConcrete *v10;
  PKDrawingConcrete *v11;
  NSObject *v12;
  void (**v14)(drawingV1::Drawing *__hidden);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[28];
  uint8_t buf[32];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v10 = -[PKDrawingConcrete init](self, "init");
    goto LABEL_5;
  }
  v14 = &off_1E7774BB0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  memset(v21, 0, sizeof(v21));
  v8 = objc_retainAutorelease(v6);
  v9 = (const unsigned __int8 *)objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  PB::Reader::Reader((PB::Reader *)buf, v9);
  LODWORD(v9) = drawingV1::Drawing::readFrom((drawingV1::Drawing *)&v14, (PB::Reader *)buf);

  if ((_DWORD)v9)
  {
    v10 = -[PKDrawingConcrete initWithV1Archive:loadNonInkingStrokes:](self, "initWithV1Archive:loadNonInkingStrokes:", &v14, v4);
    drawingV1::Drawing::~Drawing((void ***)&v14);
LABEL_5:
    self = v10;
    v11 = self;
    goto LABEL_9;
  }
  v12 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "PKDrawing protobuf corrupt.", buf, 2u);
  }

  drawingV1::Drawing::~Drawing((void ***)&v14);
  v11 = 0;
LABEL_9:

  return v11;
}

- (PKDrawingConcrete)initWithLegacyData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const unsigned __int8 *v7;
  PKDrawingConcrete *v8;
  PKDrawingConcrete *v9;
  NSObject *v10;
  _QWORD v12[8];
  int v13;
  uint8_t buf[32];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = -[PKDrawingConcrete init](self, "init");
    goto LABEL_5;
  }
  v12[0] = &off_1E7774788;
  memset(&v12[1], 0, 24);
  v13 = 0;
  v12[5] = 0;
  v12[6] = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = (const unsigned __int8 *)objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  PB::Reader::Reader((PB::Reader *)buf, v7);
  LODWORD(v7) = legacy_drawing::Drawing::readFrom((legacy_drawing::Drawing *)v12, (PB::Reader *)buf);

  if ((_DWORD)v7)
  {
    v8 = -[PKDrawingConcrete initWithLegacyArchive:](self, "initWithLegacyArchive:", v12);
    legacy_drawing::Drawing::~Drawing((legacy_drawing::Drawing *)v12);
LABEL_5:
    self = v8;
    v9 = self;
    goto LABEL_9;
  }
  v10 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "PKDrawing protobuf corrupt.", buf, 2u);
  }

  legacy_drawing::Drawing::~Drawing((legacy_drawing::Drawing *)v12);
  v9 = 0;
LABEL_9:

  return v9;
}

- (PKDrawingConcrete)initWithArchive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  PKVectorTimestamp *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  PKInk *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _PKStrokeConcrete *v32;
  _PKStrokeConcrete *v33;
  void *v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  uint64_t v45;
  void *v46;
  std::__shared_weak_count *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  PKDrawingConcrete *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  PKVectorTimestamp *v55;
  uint64_t v57;
  void *v58;
  uint64_t v60;
  std::__shared_weak_count *v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v57 = *((_QWORD *)a3 + 12);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6)) >> 4, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6);
  if (v7)
  {
    v8 = 0;
    v9 = v7 >> 4;
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    do
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)(*((_QWORD *)a3 + 6) + v8));
      objc_msgSend(v6, "addObject:", v11);

      v8 += 16;
      --v10;
    }
    while (v10);
  }
  v12 = objc_alloc_init(PKVectorTimestamp);
  v13 = *((_QWORD *)a3 + 14) - *((_QWORD *)a3 + 13);
  if (v13)
  {
    v14 = 0;
    v15 = v13 >> 3;
    if (v15 <= 1)
      v16 = 1;
    else
      v16 = v15;
    do
    {
      v17 = *(_QWORD **)(*((_QWORD *)a3 + 13) + 8 * v14);
      v18 = v17[1];
      v19 = v17[3];
      objc_msgSend(v6, "objectAtIndex:", v17[2]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVectorTimestamp setClock:subclock:forUUID:](v12, "setClock:subclock:forUUID:", v18, v19, v20);

      ++v14;
    }
    while (v16 != v14);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3)) >> 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3);
  if (v22)
  {
    v23 = 0;
    v24 = v22 >> 3;
    if (v24 <= 1)
      v25 = 1;
    else
      v25 = v24;
    do
    {
      v26 = -[PKInk initWithArchive:]([PKInk alloc], "initWithArchive:", *(_QWORD *)(*((_QWORD *)a3 + 3) + 8 * v23));
      if (v26)
        objc_msgSend(v21, "addObject:", v26);

      ++v23;
    }
    while (v25 != v23);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9)) >> 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v12;
  if (v57)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9)) >> 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = *((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9);
  if (v28)
  {
    v29 = 0;
    v30 = v28 >> 3;
    if (v30 <= 1)
      v31 = 1;
    else
      v31 = v30;
    do
    {
      v32 = -[_PKStrokeConcrete initWithArchive:sortedUUIDs:inks:transientArchiveDictionary:]([_PKStrokeConcrete alloc], "initWithArchive:sortedUUIDs:inks:transientArchiveDictionary:", *(_QWORD *)(*((_QWORD *)a3 + 9) + 8 * v29), v6, v21, v27);
      v33 = v32;
      if (!v32 || a4)
      {
        if (v32)
        {
LABEL_30:
          if (!v57)
            -[PKStroke _setIsPastedStroke:](v33, "_setIsPastedStroke:", 1);
          objc_msgSend(v58, "addObject:", v33);
        }
      }
      else
      {
        -[_PKStrokeConcrete ink](v32, "ink");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = +[PKTool _inkIsInkingTool:](PKTool, "_inkIsInkingTool:", v34);

        if (v35)
          goto LABEL_30;
      }

      ++v29;
    }
    while (v31 != v29);
  }
  v36 = *MEMORY[0x1E0C9D648];
  v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v64 = 0uLL;
  v65 = 0;
  v40 = (float *)*((_QWORD *)a3 + 1);
  if (v40)
  {
    v36 = v40[3];
    v37 = v40[4];
    v38 = v40[5];
    v39 = v40[2];
    v41 = *((_QWORD *)a3 + 2);
    if (v41)
    {
      v42 = *(_QWORD *)(v41 + 16);
      LODWORD(v64) = *(_QWORD *)(v41 + 8);
      if (v42 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uuid_clear((unsigned __int8 *)&v64 + 4);
      }
      else
      {
        objc_msgSend(v6, "objectAtIndex:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "getUUIDBytes:", (char *)&v64 + 4);

      }
      HIDWORD(v65) = *(_QWORD *)(*((_QWORD *)a3 + 2) + 24);
    }
  }
  v44 = (_QWORD *)*((_QWORD *)a3 + 12);
  if (v44)
  {
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *v44);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v45;
  v62 = v64;
  v63 = v65;
  v47 = (std::__shared_weak_count *)*((_QWORD *)a3 + 17);
  v60 = *((_QWORD *)a3 + 16);
  v61 = v47;
  if (v47)
  {
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      v49 = __ldxr(p_shared_owners);
    while (__stxr(v49 + 1, p_shared_owners));
  }
  v50 = -[PKDrawingConcrete initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:](self, "initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:", v45, v58, v55, &v62, &v60, v36, v37, v38, v39);
  v51 = v61;
  if (v61)
  {
    v52 = (unint64_t *)&v61->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }

  return v50;
}

- (PKDrawingConcrete)initWithV1Archive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  PKInk *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _PKStrokeConcrete *v31;
  _PKStrokeConcrete *v32;
  void *v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  PKDrawingConcrete *v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  std::__shared_weak_count *v48;
  unint64_t *p_shared_owners;
  unint64_t v50;
  uint64_t v52;
  void *v54;
  PKVectorTimestamp *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  __int128 v58;
  uint64_t v59;
  uint8_t buf[24];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)a3 + 136) & 1) != 0 && *((_QWORD *)a3 + 9) == 10)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6)) >> 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6);
    if (v8)
    {
      v9 = 0;
      v10 = v8 >> 4;
      if (v10 <= 1)
        v11 = 1;
      else
        v11 = v10;
      do
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)(*((_QWORD *)a3 + 6) + v9));
        objc_msgSend(v7, "addObject:", v12);

        v9 += 16;
        --v11;
      }
      while (v11);
    }
    v55 = objc_alloc_init(PKVectorTimestamp);
    v13 = *((_QWORD *)a3 + 15) - *((_QWORD *)a3 + 14);
    if (v13)
    {
      v14 = 0;
      v15 = v13 >> 3;
      if (v15 <= 1)
        v16 = 1;
      else
        v16 = v15;
      do
      {
        v17 = *(_QWORD **)(*((_QWORD *)a3 + 14) + 8 * v14);
        v18 = v17[1];
        v19 = v17[3];
        objc_msgSend(v7, "objectAtIndex:", v17[2]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKVectorTimestamp setClock:subclock:forUUID:](v55, "setClock:subclock:forUUID:", v18, v19, v20);

        ++v14;
      }
      while (v16 != v14);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3)) >> 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3);
    if (v22)
    {
      v23 = 0;
      v24 = v22 >> 3;
      if (v24 <= 1)
        v25 = 1;
      else
        v25 = v24;
      do
      {
        v26 = -[PKInk initWithV1Archive:serializationVersion:]([PKInk alloc], "initWithV1Archive:serializationVersion:", *(_QWORD *)(*((_QWORD *)a3 + 3) + 8 * v23), *((_QWORD *)a3 + 9));
        if (v26)
          objc_msgSend(v21, "addObject:", v26);

        ++v23;
      }
      while (v25 != v23);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 11) - *((_QWORD *)a3 + 10)) >> 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *((_QWORD *)a3 + 11) - *((_QWORD *)a3 + 10);
    if (v27)
    {
      v28 = 0;
      v29 = v27 >> 3;
      if (v29 <= 1)
        v30 = 1;
      else
        v30 = v29;
      while (1)
      {
        v31 = -[_PKStrokeConcrete initWithV1Archive:sortedUUIDs:inks:]([_PKStrokeConcrete alloc], "initWithV1Archive:sortedUUIDs:inks:", *(_QWORD *)(*((_QWORD *)a3 + 10) + 8 * v28), v7, v21);
        v32 = v31;
        if (v31)
        {
          if (!a4)
            break;
        }
        if (v31)
          goto LABEL_29;
LABEL_30:

        if (v30 == ++v28)
          goto LABEL_31;
      }
      -[_PKStrokeConcrete ink](v31, "ink");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = +[PKTool _inkIsInkingTool:](PKTool, "_inkIsInkingTool:", v33);

      if (!v34)
        goto LABEL_30;
LABEL_29:
      objc_msgSend(v54, "addObject:", v32);
      goto LABEL_30;
    }
LABEL_31:
    v35 = *MEMORY[0x1E0C9D648];
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    memset(buf, 0, sizeof(buf));
    v39 = (float *)*((_QWORD *)a3 + 1);
    if (v39)
    {
      v35 = v39[3];
      v36 = v39[4];
      v37 = v39[5];
      v38 = v39[2];
      v40 = *((_QWORD *)a3 + 2);
      if (v40)
      {
        v41 = *(_QWORD *)(v40 + 16);
        *(_DWORD *)buf = *(_QWORD *)(v40 + 8);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uuid_clear(&buf[4]);
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "getUUIDBytes:", &buf[4]);

        }
        *(_DWORD *)&buf[20] = *(_QWORD *)(*((_QWORD *)a3 + 2) + 24);
      }
    }
    v45 = (_QWORD *)*((_QWORD *)a3 + 13);
    if (v45)
    {
      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *v45);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v46 = objc_claimAutoreleasedReturnValue();
    }
    v47 = (void *)v46;
    v58 = *(_OWORD *)buf;
    v59 = *(_QWORD *)&buf[16];
    v56 = 0;
    v57 = 0;
    v43 = -[PKDrawingConcrete initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:](self, "initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:", v46, v54, v55, &v58, &v56, v35, v36, v37, v38);
    v48 = v57;
    if (v57)
    {
      p_shared_owners = (unint64_t *)&v57->__shared_owners_;
      do
        v50 = __ldaxr(p_shared_owners);
      while (__stlxr(v50 - 1, p_shared_owners));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }

  }
  else
  {
    v42 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v52 = *((_QWORD *)a3 + 9);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 10;
      _os_log_error_impl(&dword_1BE213000, v42, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%llu != %d).", buf, 0x12u);
    }

    v43 = -[PKDrawingConcrete init](self, "init");
  }

  return v43;
}

- (PKDrawingConcrete)initWithLegacyArchive:(const void *)a3
{
  PKDrawingConcrete *v5;
  PKVectorMultiTimestamp *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _PKStrokeConcrete *v21;
  void *v22;
  float *v23;
  NSObject *v24;
  PKDrawingConcrete *v25;
  int v27;
  _DWORD v28[2];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)a3 + 64) & 4) != 0 && *((_DWORD *)a3 + 15) == 6)
  {
    v5 = -[PKDrawingConcrete init](self, "init");
    if (v5)
    {
      v6 = -[PKVectorMultiTimestamp initWithArchive:andCapacity:]([PKVectorMultiTimestamp alloc], "initWithArchive:andCapacity:", *((_QWORD *)a3 + 5), 2);
      -[PKVectorMultiTimestamp sortedUUIDs](v6, "sortedUUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVectorMultiTimestamp timestamps](v6, "timestamps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete setVersion:](v5, "setVersion:", v9);

      -[PKVectorMultiTimestamp timestamps](v6, "timestamps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 >= 2)
      {
        for (i = 1; i != v11; ++i)
        {
          -[PKDrawingConcrete version](v5, "version");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKVectorMultiTimestamp timestamps](v6, "timestamps");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mergeWithTimestamp:", v15);

        }
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingConcrete _setAllStrokes:](v5, "_setAllStrokes:", v16);

      v17 = *((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1);
      if (v17)
      {
        v18 = 0;
        v19 = v17 >> 3;
        if (v19 <= 1)
          v20 = 1;
        else
          v20 = v19;
        do
        {
          v21 = -[_PKStrokeConcrete initWithLegacyArchive:sortedUUIDs:]([_PKStrokeConcrete alloc], "initWithLegacyArchive:sortedUUIDs:", *(_QWORD *)(*((_QWORD *)a3 + 1) + 8 * v18), v7);
          if (v21)
          {
            -[PKDrawingConcrete _allStrokes](v5, "_allStrokes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v21);

          }
          ++v18;
        }
        while (v20 != v18);
      }
      if ((~*((unsigned __int8 *)a3 + 64) & 3) == 0)
        -[PKDrawingConcrete set_orientation:](v5, "set_orientation:", *((unsigned int *)a3 + 14));
      v23 = (float *)*((_QWORD *)a3 + 6);
      if (v23)
        -[PKDrawingConcrete set_canvasBounds:](v5, "set_canvasBounds:", v23[3], v23[4], v23[5], v23[2]);

    }
  }
  else
  {
    v24 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = *((_DWORD *)a3 + 15);
      v28[0] = 67109376;
      v28[1] = v27;
      v29 = 1024;
      v30 = 6;
      _os_log_error_impl(&dword_1BE213000, v24, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%d != %d).", (uint8_t *)v28, 0xEu);
    }

    v5 = -[PKDrawingConcrete init](self, "init");
  }
  v25 = v5;

  return v25;
}

- (int64_t)saveToArchive:(void *)a3 withPathData:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  unint64_t v13;
  int64x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t k;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  int64x2_t v61;
  char *v62;
  unsigned __int8 *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  double x;
  double y;
  double width;
  double height;
  uint64_t v80;
  float v81;
  char v82;
  float v83;
  float v84;
  float v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  _BOOL4 v102;
  unsigned __int8 *v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  unsigned __int8 v124[128];
  unsigned __int8 v125[8];
  int64x2_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  CGRect v130;

  v102 = a4;
  v129 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E10];
  -[PKDrawingConcrete version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v7);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v118 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "saveUUIDsTo:", v104);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
    }
    while (v9);
  }

  objc_msgSend(v104, "sortWithOptions:usingComparator:", 1, &__block_literal_global_73);
  v12 = (char *)a3 + 48;
  std::vector<PB::Data>::reserve((uint64_t *)a3 + 6, objc_msgSend(v104, "count"));
  v13 = objc_msgSend(v104, "count");
  v14 = (int64x2_t *)((char *)a3 + 104);
  v15 = *((_QWORD *)a3 + 13);
  if (v13 > (*((_QWORD *)a3 + 15) - v15) >> 3)
  {
    if (v13 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v16 = *((_QWORD *)a3 + 14);
    v128 = (char *)a3 + 120;
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 120, v13);
    v20 = (_QWORD *)*((_QWORD *)a3 + 13);
    v19 = (_QWORD *)*((_QWORD *)a3 + 14);
    if (v19 == v20)
    {
      v23 = vdupq_n_s64((unint64_t)v19);
      v21 = &v17[(v16 - v15) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v21 = &v17[(v16 - v15) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v22 = *--v19;
        *v19 = 0;
        *((_QWORD *)v21 - 1) = v22;
        v21 -= 8;
      }
      while (v19 != v20);
      v23 = *v14;
    }
    *((_QWORD *)a3 + 13) = v21;
    *((_QWORD *)a3 + 14) = &v17[(v16 - v15) & 0xFFFFFFFFFFFFFFF8];
    v126 = v23;
    v24 = (char *)*((_QWORD *)a3 + 15);
    *((_QWORD *)a3 + 15) = &v17[8 * v18];
    v127 = v24;
    *(_QWORD *)v125 = v23.i64[0];
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)v125);
  }
  v25 = objc_msgSend(v104, "count");
  if (v25)
  {
    v26 = 0;
    for (j = 0; j != v25; ++j)
    {
      objc_msgSend(v104, "objectAtIndex:", j);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (_QWORD *)*((_QWORD *)a3 + 7);
      v29 = *((_QWORD *)a3 + 8);
      if ((unint64_t)v30 >= v29)
      {
        v32 = ((uint64_t)v30 - *v12) >> 4;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v34 = v29 - *v12;
        if (v34 >> 3 > v33)
          v33 = v34 >> 3;
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
          v35 = 0xFFFFFFFFFFFFFFFLL;
        else
          v35 = v33;
        v128 = (char *)a3 + 64;
        if (v35)
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 64, v35);
        else
          v36 = 0;
        v37 = &v36[16 * v32];
        *(_QWORD *)v125 = v36;
        v126.i64[0] = (uint64_t)v37;
        v127 = &v36[16 * v35];
        *(_QWORD *)v37 = 0;
        *((_QWORD *)v37 + 1) = 0;
        v126.i64[1] = (uint64_t)(v37 + 16);
        std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 6, v125);
        v31 = (_QWORD *)*((_QWORD *)a3 + 7);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v125);
      }
      else
      {
        *v30 = 0;
        v30[1] = 0;
        v31 = v30 + 2;
        *((_QWORD *)a3 + 7) = v30 + 2;
      }
      *((_QWORD *)a3 + 7) = v31;
      *(_QWORD *)v125 = 0;
      v126.i64[0] = 0;
      objc_msgSend(v28, "getUUIDBytes:", v125);
      PB::Data::assign((PB::Data *)(*v12 + v26), v125, &v126.u8[8]);
      -[PKDrawingConcrete version](self, "version");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "clockElementForUUID:", v28);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      PB::PtrVector<drawing::StrokeID>::emplace_back<>((uint64_t **)a3 + 13);
      v40 = *(_QWORD *)(v14->i64[0] + 8 * j);
      v41 = objc_msgSend(v39, "clock");
      *(_BYTE *)(v40 + 32) |= 1u;
      *(_QWORD *)(v40 + 8) = v41;
      v42 = *(_QWORD *)(v14->i64[0] + 8 * j);
      v43 = objc_msgSend(v39, "subclock");
      *(_BYTE *)(v42 + 32) |= 4u;
      *(_QWORD *)(v42 + 24) = v43;
      v44 = *(_QWORD *)(v14->i64[0] + 8 * j);
      *(_BYTE *)(v44 + 32) |= 2u;
      *(_QWORD *)(v44 + 16) = j;

      v26 += 16;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v103 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v114;
    v48 = 1;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v114 != v47)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
        objc_msgSend(v50, "saveInksTo:", v103);
        v51 = objc_msgSend(v50, "requiredContentVersion");
        if (v48 <= v51)
          v48 = v51;
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
    }
    while (v46);
  }
  else
  {
    v48 = 1;
  }

  v52 = objc_msgSend(v103, "count");
  v53 = *((_QWORD *)a3 + 3);
  if (v52 > (*((_QWORD *)a3 + 5) - v53) >> 3)
  {
    if (v52 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v54 = *((_QWORD *)a3 + 4);
    v128 = (char *)a3 + 40;
    v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 40, v52);
    v58 = (_QWORD *)*((_QWORD *)a3 + 3);
    v57 = (_QWORD *)*((_QWORD *)a3 + 4);
    if (v57 == v58)
    {
      v61 = vdupq_n_s64((unint64_t)v57);
      v59 = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v59 = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v60 = *--v57;
        *v57 = 0;
        *((_QWORD *)v59 - 1) = v60;
        v59 -= 8;
      }
      while (v57 != v58);
      v61 = *(int64x2_t *)((char *)a3 + 24);
    }
    *((_QWORD *)a3 + 3) = v59;
    *((_QWORD *)a3 + 4) = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
    v126 = v61;
    v62 = (char *)*((_QWORD *)a3 + 5);
    *((_QWORD *)a3 + 5) = &v55[8 * v56];
    v127 = v62;
    *(_QWORD *)v125 = v61.i64[0];
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)v125);
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v63 = v103;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v110;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v110 != v65)
          objc_enumerationMutation(v63);
        v67 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * m);
        PB::PtrVector<drawing::Ink>::emplace_back<>((uint64_t **)a3 + 3);
        objc_msgSend(v67, "saveToArchive:", *(_QWORD *)(*((_QWORD *)a3 + 4) - 8));
        v68 = objc_msgSend(v67, "requiredContentVersion");
        if (v48 <= v68)
          v48 = v68;
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    }
    while (v64);
  }

  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<std::unique_ptr<drawing::Stroke>>::reserve((char **)a3 + 9, objc_msgSend(v69, "count"));

  -[PKDrawingConcrete uuid](self, "uuid");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v106;
    do
    {
      for (n = 0; n != v72; ++n)
      {
        if (*(_QWORD *)v106 != v73)
          objc_enumerationMutation(v71);
        v75 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * n);
        PB::PtrVector<drawing::Stroke>::emplace_back<>((uint64_t **)a3 + 9);
        objc_msgSend(v75, "saveToArchive:sortedUUIDs:inks:withPathData:transient:", *(_QWORD *)(*((_QWORD *)a3 + 10) - 8), v104, v63, v102, v70 == 0);
      }
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    }
    while (v72);
  }

  -[PKDrawingConcrete _canvasBounds](self, "_canvasBounds");
  x = v130.origin.x;
  y = v130.origin.y;
  width = v130.size.width;
  height = v130.size.height;
  if (!CGRectIsNull(v130))
  {
    drawing::Drawing::makeBounds(a3);
    v80 = *((_QWORD *)a3 + 1);
    v81 = x;
    v82 = *(_BYTE *)(v80 + 24);
    v83 = y;
    v84 = width;
    *(float *)(v80 + 16) = v83;
    *(float *)(v80 + 20) = v84;
    v85 = height;
    *(_BYTE *)(v80 + 24) = v82 | 0xF;
    *(float *)(v80 + 8) = v85;
    *(float *)(v80 + 12) = v81;
  }
  drawing::Drawing::makeBoundsVersion(a3);
  v86 = *((_QWORD *)a3 + 2);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v87 = *(unsigned int *)v125;
  *(_BYTE *)(v86 + 32) |= 1u;
  *(_QWORD *)(v86 + 8) = v87;
  v88 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v89 = (void *)objc_msgSend(v88, "initWithUUIDBytes:", &v125[4]);
  v90 = objc_msgSend(v104, "indexOfObject:", v89);
  v91 = *((_QWORD *)a3 + 2);
  *(_BYTE *)(v91 + 32) |= 2u;
  *(_QWORD *)(v91 + 16) = v90;
  v92 = *((_QWORD *)a3 + 2);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v93 = v126.u32[3];
  *(_BYTE *)(v92 + 32) |= 4u;
  *(_QWORD *)(v92 + 24) = v93;
  -[PKDrawingConcrete nsuuid](self, "nsuuid");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v92) = v94 == 0;

  if ((v92 & 1) == 0)
  {
    if (!*((_QWORD *)a3 + 12))
    {
      v95 = operator new();
      *(_QWORD *)v95 = 0;
      *(_QWORD *)(v95 + 8) = 0;
      *(_QWORD *)v125 = 0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 12, (void **)v95);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)v125, 0);
    }
    *(_QWORD *)v125 = 0;
    v126.i64[0] = 0;
    -[PKDrawingConcrete nsuuid](self, "nsuuid");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "getUUIDBytes:", v125);

    PB::Data::assign(*((PB::Data **)a3 + 12), v125, &v126.u8[8]);
  }
  -[PKDrawingConcrete _unknownFields](self, "_unknownFields");
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)a3 + 128, (__int128 *)v125);
  v97 = (std::__shared_weak_count *)v126.i64[0];
  if (v126.i64[0])
  {
    v98 = (unint64_t *)(v126.i64[0] + 8);
    do
      v99 = __ldaxr(v98);
    while (__stlxr(v99 - 1, v98));
    if (!v99)
    {
      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
      std::__shared_weak_count::__release_weak(v97);
    }
  }

  return v48;
}

uint64_t __79__PKDrawingConcrete_PKDrawingPersistenceAdditions__saveToArchive_withPathData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "PK_compare:");
}

- (unsigned)saveToV1Archive:(void *)a3 withPathData:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  unint64_t v13;
  int64x2_t *v14;
  uint64_t v15;
  PKDrawingConcrete *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  int64x2_t v61;
  char *v62;
  unsigned __int8 *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  char *v77;
  uint64_t v78;
  int64x2_t v79;
  char *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t n;
  void *v86;
  unsigned int v87;
  double x;
  double y;
  double width;
  double height;
  uint64_t v92;
  float v93;
  char v94;
  float v95;
  float v96;
  float v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void ***v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  _BOOL4 v113;
  unsigned __int8 *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  unsigned __int8 v135[128];
  unsigned __int8 v136[8];
  int64x2_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  CGRect v141;

  v113 = a4;
  v140 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E10];
  -[PKDrawingConcrete version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v7);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v128, v135, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v129 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * i), "saveUUIDsTo:", v115);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v128, v135, 16);
    }
    while (v9);
  }

  *((_BYTE *)a3 + 136) |= 1u;
  *((_QWORD *)a3 + 9) = 10;
  v12 = (char *)a3 + 48;
  std::vector<PB::Data>::reserve((uint64_t *)a3 + 6, objc_msgSend(v115, "count"));
  v13 = objc_msgSend(v115, "count");
  v14 = (int64x2_t *)((char *)a3 + 112);
  v15 = *((_QWORD *)a3 + 14);
  v16 = self;
  if (v13 > (*((_QWORD *)a3 + 16) - v15) >> 3)
  {
    if (v13 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v17 = *((_QWORD *)a3 + 15);
    v139 = (char *)a3 + 128;
    v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 128, v13);
    v20 = &v18[(v17 - v15) & 0xFFFFFFFFFFFFFFF8];
    v22 = (_QWORD *)*((_QWORD *)a3 + 14);
    v21 = (_QWORD *)*((_QWORD *)a3 + 15);
    if (v21 == v22)
    {
      v25 = vdupq_n_s64((unint64_t)v21);
      v23 = &v18[(v17 - v15) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v23 = &v18[(v17 - v15) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v24 = *--v21;
        *v21 = 0;
        *((_QWORD *)v23 - 1) = v24;
        v23 -= 8;
      }
      while (v21 != v22);
      v25 = *v14;
    }
    v16 = self;
    *((_QWORD *)a3 + 14) = v23;
    *((_QWORD *)a3 + 15) = v20;
    v137 = v25;
    v26 = (char *)*((_QWORD *)a3 + 16);
    *((_QWORD *)a3 + 16) = &v18[8 * v19];
    v138 = v26;
    *(_QWORD *)v136 = v25.i64[0];
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)v136);
  }
  v27 = objc_msgSend(v115, "count");
  if (v27)
  {
    v28 = 0;
    for (j = 0; j != v27; ++j)
    {
      objc_msgSend(v115, "objectAtIndex:", j);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (_QWORD *)*((_QWORD *)a3 + 7);
      v31 = *((_QWORD *)a3 + 8);
      if ((unint64_t)v32 >= v31)
      {
        v34 = ((uint64_t)v32 - *v12) >> 4;
        v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v36 = v31 - *v12;
        if (v36 >> 3 > v35)
          v35 = v36 >> 3;
        if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v35;
        v139 = (char *)a3 + 64;
        if (v37)
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 64, v37);
        else
          v38 = 0;
        v39 = &v38[16 * v34];
        *(_QWORD *)v136 = v38;
        v137.i64[0] = (uint64_t)v39;
        v138 = &v38[16 * v37];
        *(_QWORD *)v39 = 0;
        *((_QWORD *)v39 + 1) = 0;
        v137.i64[1] = (uint64_t)(v39 + 16);
        std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 6, v136);
        v33 = (_QWORD *)*((_QWORD *)a3 + 7);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v136);
      }
      else
      {
        *v32 = 0;
        v32[1] = 0;
        v33 = v32 + 2;
        *((_QWORD *)a3 + 7) = v32 + 2;
      }
      *((_QWORD *)a3 + 7) = v33;
      *(_QWORD *)v136 = 0;
      v137.i64[0] = 0;
      objc_msgSend(v30, "getUUIDBytes:", v136);
      PB::Data::assign((PB::Data *)(*v12 + v28), v136, &v137.u8[8]);
      -[PKDrawingConcrete version](v16, "version");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "clockElementForUUID:", v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      PB::PtrVector<drawingV1::StrokeID>::emplace_back<>((uint64_t **)a3 + 14);
      v42 = *(_QWORD *)(v14->i64[0] + 8 * j);
      v43 = objc_msgSend(v41, "clock");
      *(_BYTE *)(v42 + 32) |= 1u;
      *(_QWORD *)(v42 + 8) = v43;
      v44 = *(_QWORD *)(v14->i64[0] + 8 * j);
      v45 = objc_msgSend(v41, "subclock");
      *(_BYTE *)(v44 + 32) |= 4u;
      *(_QWORD *)(v44 + 24) = v45;
      v46 = *(_QWORD *)(v14->i64[0] + 8 * j);
      *(_BYTE *)(v46 + 32) |= 2u;
      *(_QWORD *)(v46 + 16) = j;

      v28 += 16;
      v16 = self;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v114 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  -[PKDrawingConcrete _allStrokes](v16, "_allStrokes");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v125;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v125 != v49)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * k), "ink");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "addObject:", v51);

      }
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
    }
    while (v48);
  }

  v52 = objc_msgSend(v114, "count");
  v53 = *((_QWORD *)a3 + 3);
  if (v52 > (*((_QWORD *)a3 + 5) - v53) >> 3)
  {
    if (v52 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v54 = *((_QWORD *)a3 + 4);
    v139 = (char *)a3 + 40;
    v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 40, v52);
    v58 = (_QWORD *)*((_QWORD *)a3 + 3);
    v57 = (_QWORD *)*((_QWORD *)a3 + 4);
    if (v57 == v58)
    {
      v61 = vdupq_n_s64((unint64_t)v57);
      v59 = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v59 = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v60 = *--v57;
        *v57 = 0;
        *((_QWORD *)v59 - 1) = v60;
        v59 -= 8;
      }
      while (v57 != v58);
      v61 = *(int64x2_t *)((char *)a3 + 24);
    }
    *((_QWORD *)a3 + 3) = v59;
    *((_QWORD *)a3 + 4) = &v55[(v54 - v53) & 0xFFFFFFFFFFFFFFF8];
    v137 = v61;
    v62 = (char *)*((_QWORD *)a3 + 5);
    *((_QWORD *)a3 + 5) = &v55[8 * v56];
    v138 = v62;
    *(_QWORD *)v136 = v61.i64[0];
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)v136);
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v63 = v114;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v121;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v121 != v65)
          objc_enumerationMutation(v63);
        v67 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * m);
        PB::PtrVector<drawingV1::Ink>::emplace_back<>((uint64_t **)a3 + 3);
        objc_msgSend(v67, "saveToV1Archive:", *(_QWORD *)(*((_QWORD *)a3 + 4) - 8));
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
    }
    while (v64);
  }

  -[PKDrawingConcrete uuid](self, "uuid");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");
  v71 = *((_QWORD *)a3 + 10);
  if (v70 > (*((_QWORD *)a3 + 12) - v71) >> 3)
  {
    if (v70 >> 61)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v72 = *((_QWORD *)a3 + 11);
    v139 = (char *)a3 + 96;
    v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 96, v70);
    v76 = (_QWORD *)*((_QWORD *)a3 + 10);
    v75 = (_QWORD *)*((_QWORD *)a3 + 11);
    if (v75 == v76)
    {
      v79 = vdupq_n_s64((unint64_t)v75);
      v77 = &v73[(v72 - v71) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v77 = &v73[(v72 - v71) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v78 = *--v75;
        *v75 = 0;
        *((_QWORD *)v77 - 1) = v78;
        v77 -= 8;
      }
      while (v75 != v76);
      v79 = *((int64x2_t *)a3 + 5);
    }
    *((_QWORD *)a3 + 10) = v77;
    *((_QWORD *)a3 + 11) = &v73[(v72 - v71) & 0xFFFFFFFFFFFFFFF8];
    v137 = v79;
    v80 = (char *)*((_QWORD *)a3 + 12);
    *((_QWORD *)a3 + 12) = &v73[8 * v74];
    v138 = v80;
    *(_QWORD *)v136 = v79.i64[0];
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((uint64_t)v136);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  -[PKDrawingConcrete _allStrokes](self, "_allStrokes");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v117;
    v84 = 10;
    do
    {
      for (n = 0; n != v82; ++n)
      {
        if (*(_QWORD *)v117 != v83)
          objc_enumerationMutation(v81);
        v86 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
        PB::PtrVector<drawingV1::Stroke>::emplace_back<>((uint64_t **)a3 + 10);
        v87 = objc_msgSend(v86, "saveToV1Archive:sortedUUIDs:inks:withPathData:transient:", *(_QWORD *)(*((_QWORD *)a3 + 11) - 8), v115, v63, v113, v68 == 0);
        if (v84 <= v87)
          v84 = v87;
      }
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
    }
    while (v82);
  }
  else
  {
    v84 = 10;
  }

  -[PKDrawingConcrete _canvasBounds](self, "_canvasBounds");
  x = v141.origin.x;
  y = v141.origin.y;
  width = v141.size.width;
  height = v141.size.height;
  if (!CGRectIsNull(v141))
  {
    drawingV1::Drawing::makeBounds(a3);
    v92 = *((_QWORD *)a3 + 1);
    v93 = x;
    v94 = *(_BYTE *)(v92 + 24);
    v95 = y;
    v96 = width;
    *(float *)(v92 + 16) = v95;
    *(float *)(v92 + 20) = v96;
    v97 = height;
    *(_BYTE *)(v92 + 24) = v94 | 0xF;
    *(float *)(v92 + 8) = v97;
    *(float *)(v92 + 12) = v93;
  }
  drawingV1::Drawing::makeBoundsVersion(a3);
  v98 = *((_QWORD *)a3 + 2);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v99 = *(unsigned int *)v136;
  *(_BYTE *)(v98 + 32) |= 1u;
  *(_QWORD *)(v98 + 8) = v99;
  v100 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v101 = (void *)objc_msgSend(v100, "initWithUUIDBytes:", &v136[4]);
  v102 = objc_msgSend(v115, "indexOfObject:", v101);
  v103 = *((_QWORD *)a3 + 2);
  *(_BYTE *)(v103 + 32) |= 2u;
  *(_QWORD *)(v103 + 16) = v102;
  v104 = *((_QWORD *)a3 + 2);
  -[PKDrawingConcrete boundsVersion](self, "boundsVersion");
  v105 = v137.u32[3];
  *(_BYTE *)(v104 + 32) |= 4u;
  *(_QWORD *)(v104 + 24) = v105;
  -[PKDrawingConcrete nsuuid](self, "nsuuid");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v104) = v106 == 0;

  if ((v104 & 1) == 0)
  {
    v108 = *((_QWORD *)a3 + 13);
    v107 = (void ***)((char *)a3 + 104);
    if (!v108)
    {
      v109 = operator new();
      *(_QWORD *)v109 = 0;
      *(_QWORD *)(v109 + 8) = 0;
      *(_QWORD *)v136 = 0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100](v107, (void **)v109);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)v136, 0);
    }
    *(_QWORD *)v136 = 0;
    v137.i64[0] = 0;
    -[PKDrawingConcrete nsuuid](self, "nsuuid");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "getUUIDBytes:", v136);

    PB::Data::assign((PB::Data *)*v107, v136, &v137.u8[8]);
  }

  return v84;
}

- (id)v1SerializeWithPathData:(BOOL)a3
{
  int v4;

  v4 = 0;
  -[PKDrawingConcrete v1SerializeWithPathData:toVersion:](self, "v1SerializeWithPathData:toVersion:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)v1SerializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4
{
  id v4;
  void *v5;
  void (**v7)(drawingV1::Drawing *__hidden);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[28];
  uint64_t v15;
  uint64_t v16;

  v7 = &off_1E7774BB0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v14, 0, sizeof(v14));
  *a4 = -[PKDrawingConcrete saveToV1Archive:withPathData:](self, "saveToV1Archive:withPathData:", &v7, a3);
  PB::Writer::Writer((PB::Writer *)&v15);
  ((void (*)(uint64_t, PB::Writer *))v7[3])((uint64_t)&v7, (PB::Writer *)&v15);
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  v5 = (void *)objc_msgSend(v4, "initWithBytes:length:", v16, v15 - v16);
  PB::Writer::~Writer((PB::Writer *)&v15);
  drawingV1::Drawing::~Drawing((void ***)&v7);
  return v5;
}

@end
