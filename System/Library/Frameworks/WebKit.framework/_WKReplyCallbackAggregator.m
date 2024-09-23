@implementation _WKReplyCallbackAggregator

- (_WKReplyCallbackAggregator)initWithAggregator:(void *)a3
{
  _WKReplyCallbackAggregator *v4;
  _WKReplyCallbackAggregator *v5;
  uint64_t m_ptr;
  _WKReplyCallbackAggregator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKReplyCallbackAggregator;
  v4 = -[_WKReplyCallbackAggregator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    ++*(_DWORD *)a3;
    m_ptr = (uint64_t)v4->_aggregator.m_ptr;
    v5->_aggregator.m_ptr = a3;
    if (m_ptr)
      WTF::RefCounted<WTF::EagerCallbackAggregator<void ()(objc_object *,WebKit::IsDefaultReply)>>::deref(m_ptr);
    v7 = v5;
  }

  return v5;
}

- (void)aggregator
{
  return self->_aggregator.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_aggregator.m_ptr;
  self->_aggregator.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<WTF::EagerCallbackAggregator<void ()(objc_object *,WebKit::IsDefaultReply)>>::deref((uint64_t)m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
