@implementation CRTTMergeableStringRange

- (CRTTMergeableStringRange)initWithTopoIDRange:(TopoIDRange *)a3 renameGeneration:(int64_t)a4 maxCounter:(int64_t)a5
{
  char *v8;
  __int128 v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRTTMergeableStringRange;
  v8 = -[CRTTMergeableStringRange init](&v12, sel_init);
  v9 = *(_OWORD *)&a3->charID.replica.uuid[12];
  *(_OWORD *)(v8 + 24) = *(_OWORD *)a3->charID.replica.uuid;
  *(_OWORD *)(v8 + 36) = v9;
  *((_QWORD *)v8 + 1) = a4;
  *((_QWORD *)v8 + 2) = a5;
  objc_msgSend(v8, "_objCRenameSequence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:", v10);

  return (CRTTMergeableStringRange *)v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRTTMergeableStringRange _objCRenameSequence](self, "_objCRenameSequence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    +[CRGlobalContextObjC releaseObjCSequence:](CRGlobalContextObjC, "releaseObjCSequence:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableStringRange;
  -[CRTTMergeableStringRange dealloc](&v4, sel_dealloc);
}

- (id)_objCRenameSequence
{
  ObjCRenameSequence *v4;
  void *v5;
  int v6;

  -[CRTTMergeableStringRange range](self, "range");
  if (v6)
    return 0;
  v4 = objc_alloc_init(ObjCRenameSequence);
  TopoReplica::objc(&self->_range.charID.replica);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjCRenameSequence addWithReplica:range:](v4, "addWithReplica:range:", v5, self->_range.charID.clock, self->_range.length);

  return v4;
}

- (id)subrangeFrom:(_NSRange)a3
{
  int length;
  int location;
  CRTTMergeableStringRange *v6;
  int v7;
  __int128 v9;
  unsigned int index;
  int v11;
  int v12;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = [CRTTMergeableStringRange alloc];
  v9 = *(_OWORD *)self->_range.charID.replica.uuid;
  v7 = self->_range.charID.clock + location;
  index = self->_range.charID.replica.index;
  v11 = v7;
  v12 = length;
  return -[CRTTMergeableStringRange initWithTopoIDRange:renameGeneration:maxCounter:](v6, "initWithTopoIDRange:renameGeneration:maxCounter:", &v9, self->_renameGeneration, self->_maxCounter);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  _QWORD v8[2];
  uint64_t v9;
  int v10;
  unsigned __int8 uu1[16];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRTTMergeableStringRange range](self, "range");
    if (v5)
    {
      objc_msgSend(v5, "range");
      if ((v12 != 0) != ((_DWORD)v9 == 0))
      {
LABEL_4:
        -[CRTTMergeableStringRange range](self, "range");
        if (v5)
        {
          objc_msgSend(v5, "range");
        }
        else
        {
          v8[0] = 0;
          v8[1] = 0;
          v10 = 0;
          v9 = 0;
        }
        v6 = TopoIDRange::operator==(uu1, (unsigned __int8 *)v8);
        goto LABEL_11;
      }
    }
    else if (!v12)
    {
      goto LABEL_4;
    }
    v6 = 1;
LABEL_11:

    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  TopoID::toString(&self->_range.charID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CRTTMergeableStringRange %p %@,%d>"), self, v4, self->_range.length);
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

- (void)setMaxCounter:(int64_t)a3
{
  self->_maxCounter = a3;
}

- (TopoIDRange)range
{
  *(_OWORD *)retstr->charID.replica.uuid = *(_OWORD *)&self->length;
  *(_OWORD *)&retstr->charID.replica.uuid[12] = *(_OWORD *)&self[1].charID.replica.uuid[8];
  return self;
}

- (id).cxx_construct
{
  self->_range.charID.replica.index = 0;
  uuid_clear(self->_range.charID.replica.uuid);
  self->_range.charID.clock = 0;
  return self;
}

@end
