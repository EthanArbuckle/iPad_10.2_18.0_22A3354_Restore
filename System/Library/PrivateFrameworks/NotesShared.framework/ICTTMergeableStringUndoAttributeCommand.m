@implementation ICTTMergeableStringUndoAttributeCommand

- (ICTTMergeableStringUndoAttributeCommand)init
{
  ICTTMergeableStringUndoAttributeCommand *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTTMergeableStringUndoAttributeCommand;
  v2 = -[ICTTMergeableStringUndoAttributeCommand init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_attributeRanges = v3;
  }
  return v2;
}

- (void)dealloc
{
  void *attributeRanges;
  objc_super v4;
  void **v5;

  attributeRanges = self->_attributeRanges;
  if (attributeRanges)
  {
    v5 = (void **)self->_attributeRanges;
    std::vector<std::pair<TopoIDRange,NSAttributedString * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1C3B7A848](attributeRanges, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICTTMergeableStringUndoAttributeCommand;
  -[ICTTMergeableStringUndoAttributeCommand dealloc](&v4, sel_dealloc);
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t *attributeRanges;
  TopoIDRange *v8;
  TopoIDRange *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  void **v15;
  ICTTMergeableStringUndoAttributeCommand *v16;
  void **v17;
  int v18;
  int v19;
  NSUUID *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = 0;
  v25 = 0;
  v26 = 0;
  attributeRanges = (uint64_t *)self->_attributeRanges;
  v8 = (TopoIDRange *)*attributeRanges;
  v9 = (TopoIDRange *)attributeRanges[1];
  if ((TopoIDRange *)*attributeRanges != v9)
  {
    v16 = self;
    do
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      updateTopoIDRange(v8, a3, (uint64_t)a4, &v21);
      v10 = v21;
      v11 = v22;
      while (v10 != v11)
      {
        v12 = *(id *)v10;
        v13 = *(_DWORD *)(v10 + 8);
        v14 = *(_DWORD *)(v10 + 16);
        v15 = (void **)v12;
        v17 = v15;
        v18 = v13;
        v19 = v14;
        v20 = v8[1].var0.replicaID;
        std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::push_back[abi:ne180100](&v24, (uint64_t *)&v17);

        v10 += 24;
      }
      v17 = (void **)&v21;
      std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v17);
      v8 = (TopoIDRange *)((char *)v8 + 32);
    }
    while (v8 != v9);
    attributeRanges = (uint64_t *)v16->_attributeRanges;
  }
  if (attributeRanges != &v24)
    std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__assign_with_size[abi:ne180100]<std::pair<TopoIDRange,NSDictionary * {__strong}>*,std::pair<TopoIDRange,NSDictionary * {__strong}>*>(attributeRanges, v24, v25, (v25 - v24) >> 5);
  v17 = (void **)&v24;
  std::vector<std::pair<TopoIDRange,NSAttributedString * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);

}

- (BOOL)hasTopoIDsThatCanChange
{
  _QWORD *attributeRanges;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL result;
  BOOL v8;

  attributeRanges = self->_attributeRanges;
  v3 = attributeRanges[1];
  if (*attributeRanges == v3)
    return 0;
  v4 = *attributeRanges + 32;
  do
  {
    v5 = *(void **)(v4 - 32);
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    result = v5 == v6;
    v8 = v5 == v6 || v4 == v3;
    v4 += 32;
  }
  while (!v8);
  return result;
}

- (void)applyToString:(id)a3
{
  id v4;
  uint64_t *attributeRanges;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "beginEditing");
  attributeRanges = (uint64_t *)self->_attributeRanges;
  v6 = *attributeRanges;
  v7 = attributeRanges[1];
  while (v6 != v7)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v8 = *(id *)v6;
    v12 = v8;
    v9 = *(_DWORD *)(v6 + 16);
    LODWORD(v13) = *(_DWORD *)(v6 + 8);
    LODWORD(v14) = v9;
    if (v4)
      objc_msgSend(v4, "getSubstrings:forTopoIDRange:", &v15, &v12);
    else

    v10 = v15;
    v11 = v16;
    if (v15 != v16)
    {
      do
        objc_msgSend(v4, "setAttributes:substring:", *(_QWORD *)(v6 + 24), *v10++, v12, v13, v14);
      while (v10 != v11);
      v10 = v15;
    }
    if (v10)
    {
      v16 = v10;
      operator delete(v10);
    }
    v6 += 32;
  }
  objc_msgSend(v4, "endEditing");

}

- (BOOL)addToGroup:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  int v10;
  id v12;
  int v13;
  int v14;

  v4 = a3;
  v5 = -[ICTTMergeableStringUndoAttributeCommand attributeRanges](self, "attributeRanges");
  v6 = *v5;
  v7 = v5[1];
  if (*v5 == v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = *(id *)v6;
      v12 = v9;
      v10 = *(_DWORD *)(v6 + 16);
      v13 = *(_DWORD *)(v6 + 8);
      v14 = v10;
      if (v4)
        v8 |= objc_msgSend(v4, "addSeenRange:", &v12);
      else

      v6 += 32;
    }
    while (v6 != v7);
  }

  return v8 & 1;
}

- (NSString)description
{
  id v3;
  uint64_t *attributeRanges;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<ICTTMergeableStringUndoAttributeCommand %p "), self);
  attributeRanges = (uint64_t *)self->_attributeRanges;
  v5 = *attributeRanges;
  v6 = attributeRanges[1];
  if (*attributeRanges != v6)
  {
    do
    {
      objc_msgSend(*(id *)v5, "TTShortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@:%d-%u => %@ "), v7, *(unsigned int *)(v5 + 8), (*(_DWORD *)(v5 + 8) + *(_DWORD *)(v5 + 16) - 1), *(_QWORD *)(v5 + 24));

      v5 += 32;
    }
    while (v5 != v6);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)attributeRanges
{
  return self->_attributeRanges;
}

@end
