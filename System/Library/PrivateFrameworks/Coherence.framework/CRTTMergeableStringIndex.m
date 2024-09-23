@implementation CRTTMergeableStringIndex

- (CRTTMergeableStringIndex)initWithTopoID:(TopoID *)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5 maxCounter:(int64_t)a6
{
  CRTTMergeableStringIndex *v10;
  CRTTMergeableStringIndex *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRTTMergeableStringIndex;
  v10 = -[CRTTMergeableStringIndex init](&v16, sel_init);
  v11 = v10;
  v12 = *(_OWORD *)a3->replica.uuid;
  v13 = *(_QWORD *)&a3->replica.index;
  *(_QWORD *)&v10->_index.replica.index = v13;
  *(_OWORD *)v10->_index.replica.uuid = v12;
  v10->_maxCounter = a6;
  v10->_affinity = a4;
  v10->_renameGeneration = a5;
  if ((_DWORD)v13)
  {
    -[CRTTMergeableStringIndex _objCRenameSequence](v10, "_objCRenameSequence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:", v14);

  }
  return v11;
}

- (CRTTMergeableStringIndex)initWithTimestamp:(id)a3 affinity:(unint64_t)a4 renameGeneration:(int64_t)a5
{
  ObjCTimestamp *v8;
  CRTTMergeableStringIndex *v9;
  void *v10;
  objc_super v12;
  TopoID v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = (ObjCTimestamp *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CRTTMergeableStringIndex;
  v9 = -[CRTTMergeableStringIndex init](&v12, sel_init);
  TopoID::TopoID(&v13, v8);
  v9->_index = v13;
  v9->_renameGeneration = a5;
  v9->_maxCounter = -1;
  v9->_affinity = a4;
  if (v9->_index.replica.index)
  {
    -[CRTTMergeableStringIndex _objCRenameSequence](v9, "_objCRenameSequence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:", v10);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[CRTTMergeableStringIndex index](self, "index");
  if (v5)
  {
    -[CRTTMergeableStringIndex _objCRenameSequence](self, "_objCRenameSequence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC releaseObjCSequence:](CRGlobalContextObjC, "releaseObjCSequence:", v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableStringIndex;
  -[CRTTMergeableStringIndex dealloc](&v4, sel_dealloc);
}

- (BOOL)needToFinalizeTimestamps
{
  int v3;

  -[CRTTMergeableStringIndex index](self, "index");
  return v3 != 0;
}

- (id)finalizedInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRTTMergeableStringIndex *v7;

  v4 = a3;
  if (-[CRTTMergeableStringIndex needToFinalizeTimestamps](self, "needToFinalizeTimestamps"))
  {
    -[CRTTMergeableStringIndex _objCRenameSequence](self, "_objCRenameSequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRGlobalContextObjC renameObjCSequence:after:in:](CRGlobalContextObjC, "renameObjCSequence:after:in:", v5, self->_maxCounter, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableStringIndex renamed:](self, "renamed:", v6);
    v7 = (CRTTMergeableStringIndex *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)renamed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  ObjCTimestamp *v7;
  CRTTMergeableStringIndex *v8;
  CRTTMergeableStringIndex *v9;
  CRTTMergeableStringIndex *v10;
  TopoID v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CRTTMergeableStringIndex needToFinalizeTimestamps](self, "needToFinalizeTimestamps")
    && ((v5 = -[CRTTMergeableStringIndex renameGeneration](self, "renameGeneration"), v5 < objc_msgSend(v4, "generation"))|| (objc_msgSend(v4, "hasLocalRenames") & 1) != 0))
  {
    TopoID::objc(&self->_index);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renamed:", v6);
    v7 = (ObjCTimestamp *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [CRTTMergeableStringIndex alloc];
      TopoID::TopoID(&v12, v7);
      v9 = -[CRTTMergeableStringIndex initWithTopoID:affinity:renameGeneration:maxCounter:](v8, "initWithTopoID:affinity:renameGeneration:maxCounter:", &v12, self->_affinity, objc_msgSend(v4, "generation"), self->_maxCounter);
    }
    else
    {
      v9 = self;
    }
    v10 = v9;

  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)timestamp
{
  return TopoID::objc(&self->_index);
}

- (id)_objCRenameSequence
{
  ObjCRenameSequence *v3;
  void *v4;

  v3 = objc_alloc_init(ObjCRenameSequence);
  TopoReplica::objc(&self->_index.replica);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v4, self->_index.clock, 1);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 uu2[8];
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 uu1[8];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRTTMergeableStringIndex index](self, "index");
    if (v5)
    {
      objc_msgSend(v5, "index");
      if (((_DWORD)v19 != 0) != ((_DWORD)v16 == 0))
      {
LABEL_4:
        -[CRTTMergeableStringIndex index](self, "index");
        if (v5)
        {
          objc_msgSend(v5, "index");
          v6 = HIDWORD(v16);
        }
        else
        {
          v6 = 0;
          *(_QWORD *)uu2 = 0;
          v15 = 0;
          v16 = 0;
        }
        v7 = v19 == __PAIR64__(v6, v16) && uuid_compare(uu1, uu2) == 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!(_DWORD)v19)
    {
      goto LABEL_4;
    }
    +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableStringIndex renamed:](self, "renamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renamed:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      objc_msgSend(v9, "index");
      if (v11)
      {
LABEL_10:
        objc_msgSend(v11, "index");
        v12 = HIDWORD(v16);
LABEL_13:
        v7 = v19 == __PAIR64__(v12, v16) && uuid_compare(uu1, uu2) == 0;

        goto LABEL_21;
      }
    }
    else
    {
      *(_QWORD *)uu1 = 0;
      v18 = 0;
      v19 = 0;
      if (v10)
        goto LABEL_10;
    }
    v12 = 0;
    *(_QWORD *)uu2 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  TopoID::toString(&self->_index);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CRTTMergeableStringIndex: %p %@ %@>"), self, v4, -[CRTTMergeableStringIndex description]::affinityNames[self->_affinity]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (int64_t)maxCounter
{
  return self->_maxCounter;
}

- (unint64_t)affinity
{
  return self->_affinity;
}

- (TopoID)index
{
  *retstr = *(TopoID *)((char *)self + 32);
  return self;
}

- (id).cxx_construct
{
  self->_index.replica.index = 0;
  uuid_clear(self->_index.replica.uuid);
  self->_index.clock = 0;
  return self;
}

@end
