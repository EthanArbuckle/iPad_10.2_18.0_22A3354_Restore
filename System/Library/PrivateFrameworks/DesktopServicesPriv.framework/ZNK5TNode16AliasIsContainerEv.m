@implementation ZNK5TNode16AliasIsContainerEv

TNodeRequest **___ZNK5TNode16AliasIsContainerEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  char *buffer;
  unint64_t *v3;
  unint64_t v4;
  TPropertyValue v6;
  TNodeRequest *v7;

  v1 = TNodeFromFINode(*(FINode **)(a1 + 32));
  v6.fData.__impl_.__data = 0uLL;
  TNodeRequest::Make((uint64_t)&v6, (uint64_t *)&v7);
  buffer = v6.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer;
  if (v6.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer)
  {
    v3 = (unint64_t *)(v6.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer
                            + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(char *))(*(_QWORD *)buffer + 16))(buffer);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)buffer);
    }
  }
  memset(&v6, 0, sizeof(v6));
  TNode::RequestTask(v1, 1, 1769170540, &v6, &v7, 0);
  TPropertyValue::~TPropertyValue(&v6);
  return TRef<TNodeRequest *,TRetainReleasePolicy<TNodeRequest *>>::~TRef(&v7);
}

@end
