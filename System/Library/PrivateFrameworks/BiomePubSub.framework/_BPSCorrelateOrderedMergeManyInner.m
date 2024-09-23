@implementation _BPSCorrelateOrderedMergeManyInner

- (_BPSCorrelateOrderedMergeManyInner)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4 comparator:(id)a5
{
  id v8;
  _BPSCorrelateOrderedMergeManyInner *v9;
  void *v10;
  id comparator;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_BPSCorrelateOrderedMergeManyInner;
  v9 = -[_BPSAbstractCorrelateOrderedMerge initWithDownstream:upstreamCount:](&v13, sel_initWithDownstream_upstreamCount_, a3, a4);
  if (v9)
  {
    v10 = _Block_copy(v8);
    comparator = v9->_comparator;
    v9->_comparator = v10;

  }
  return v9;
}

- (int64_t)compareFirst:(id)a3 withSecond:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[_BPSCorrelateOrderedMergeManyInner comparator](self, "comparator");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
}

@end
