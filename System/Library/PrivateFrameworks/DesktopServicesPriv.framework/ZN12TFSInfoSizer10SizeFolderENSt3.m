@implementation ZN12TFSInfoSizer10SizeFolderENSt3

TChildrenList *___ZN12TFSInfoSizer10SizeFolderENSt3__110shared_ptrIS_EEy_block_invoke(uint64_t a1)
{
  TTime *v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v5;
  TTime *v6;
  TChildrenList *result;
  uint64_t v8;
  int v9;
  uint64_t v10;
  TNode *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (TTime *)TNodeFromFINode(**(FINode ***)(a1 + 48));
  v3 = (unsigned int *)(*((_QWORD *)v2 + 7) + 196);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  v5 = TTime::MicrosecondsSinceStartup(v2);
  v6 = (TTime *)TOperationSizer::ResumeSizing(*(TOperationSizer **)(a1 + 32), 0);
  result = (TChildrenList *)TTime::MicrosecondsSinceStartup(v6);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 40);
  *(_DWORD *)(*(_QWORD *)(a1 + 88) + 64) = v9;
  if (!v9)
  {
    v10 = (uint64_t)result + v8 - v5;
    v11 = (TNode *)TNodeFromFINode(*(FINode **)(a1 + 80));
    v12 = *(_QWORD *)(a1 + 64);
    TNode::SetSizeProperties(v11, *(_QWORD *)(v12 + 104), *(_QWORD *)(v12 + 128), *(_QWORD *)(v12 + 96), *(_QWORD *)(v12 + 88), *(_DWORD *)(*(_QWORD *)(a1 + 88) + 48), *(unsigned __int8 *)(v12 + 167));
    v13 = TNodeFromFINode(*(FINode **)(a1 + 80));
    return TChildrenList::SetLastResizeDuration(*(TChildrenList **)(v13 + 56), v10);
  }
  return result;
}

@end
