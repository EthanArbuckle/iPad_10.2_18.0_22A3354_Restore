@implementation CRTTMergeableStringSelection

- (void)selectionRanges
{
  return &self->_selectionRanges;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  TopoID *begin;
  TopoID *i;
  __int128 v8;
  __int128 v9;
  TopoID v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  begin = (TopoID *)self->_selectionRanges.__begin_;
  for (i = (TopoID *)self->_selectionRanges.__end_; begin != i; begin += 2)
  {
    updateTopoID(begin, a3, a4, &v10);
    v8 = *(_OWORD *)v10.replica.uuid;
    *(_QWORD *)&begin->replica.index = *(_QWORD *)&v10.replica.index;
    *(_OWORD *)begin->replica.uuid = v8;
    updateTopoID(begin + 1, a3, a4, &v10);
    v9 = *(_OWORD *)v10.replica.uuid;
    *(_QWORD *)&begin[1].replica.index = *(_QWORD *)&v10.replica.index;
    *(_OWORD *)begin[1].replica.uuid = v9;
  }
}

- (BOOL)hasTopoIDsThatCanChange
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  _BYTE *end;
  _BYTE *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  BOOL v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (uint64_t *)objc_msgSend(v5, "selectionRanges");
    v7 = v6;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 4);
    begin = self->_selectionRanges.__begin_;
    end = self->_selectionRanges.__end_;
    if (v8 == 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4))
    {
      if (end == begin)
      {
LABEL_14:
        v19 = -[CRTTMergeableStringSelection selectionAffinity](self, "selectionAffinity");
        v20 = v19 == objc_msgSend(v5, "selectionAffinity");
LABEL_17:

        goto LABEL_18;
      }
      v11 = 0;
      if (v8 <= 1)
        v12 = 1;
      else
        v12 = 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 4);
      while (1)
      {
        v13 = *v7;
        v14 = *v7 + v11;
        v15 = (char *)self->_selectionRanges.__begin_;
        v16 = &v15[v11];
        if (*(_DWORD *)(v14 + 20) != *(_DWORD *)&v15[v11 + 20])
          break;
        if (*(_DWORD *)(v14 + 16) != *((_DWORD *)v16 + 4))
          break;
        if (uuid_compare((const unsigned __int8 *)v14, (const unsigned __int8 *)v16))
          break;
        v17 = v13 + v11;
        v18 = &v15[v11];
        if (*(_DWORD *)(v13 + v11 + 44) != *(_DWORD *)&v15[v11 + 44]
          || *(_DWORD *)(v17 + 40) != *((_DWORD *)v18 + 10)
          || uuid_compare((const unsigned __int8 *)(v17 + 24), (const unsigned __int8 *)v18 + 24))
        {
          break;
        }
        v11 += 48;
        if (!--v12)
          goto LABEL_14;
      }
    }
    v20 = 0;
    goto LABEL_17;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (unint64_t)hash
{
  int64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (char *)self->_selectionRanges.__end_ - (char *)self->_selectionRanges.__begin_;
  if (!v2)
    return 0;
  v4 = 0;
  v5 = 0;
  v6 = v2 / 48;
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  do
  {
    v8 = CFHashBytes();
    v9 = *(unsigned int *)((char *)self->_selectionRanges.__begin_ + v4 + 20);
    v5 ^= v8 ^ CFHashBytes() ^ v9 ^ *(unsigned int *)((char *)self->_selectionRanges.__begin_ + v4 + 44);
    v4 += 48;
    --v7;
  }
  while (v7);
  return v5;
}

- (id)description
{
  id v3;
  char *begin;
  char *end;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<CRTTMergeableStringSelection %p "), self);
  begin = (char *)self->_selectionRanges.__begin_;
  end = (char *)self->_selectionRanges.__end_;
  if (begin != end)
  {
    v6 = begin + 24;
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6 - 24);
      objc_msgSend(v7, "CRTTShortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" %@.%d:%d"), v8, *((unsigned int *)v6 - 2), *((unsigned int *)v6 - 1));

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
      objc_msgSend(MEMORY[0x1E0CB3A28], "CRTTZero");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = *((_DWORD *)v6 + 5);

        if (!v11)
          goto LABEL_8;
      }
      else
      {

      }
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
      objc_msgSend(v12, "CRTTShortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("-%@.%d:%d"), v13, *((unsigned int *)v6 + 4), *((unsigned int *)v6 + 5));

LABEL_8:
      v14 = v6 + 24;
      v6 += 48;
    }
    while (v14 != end);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(unint64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_selectionRanges.__begin_;
  if (begin)
  {
    self->_selectionRanges.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
