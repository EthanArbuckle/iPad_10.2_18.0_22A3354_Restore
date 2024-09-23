@implementation CHDrawingContext

- (CHDrawingContext)initWithEdgeIndex:(unint64_t)a3 numberOfSubstrokes:(int64_t)a4 numberOfSegments:(int64_t)a5 classifiableDrawing:(id)a6 strokeGroup:()set<long
{
  id v13;
  CHDrawingContext *v14;
  CHDrawingContext *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CHDrawingContext;
  v14 = -[CHDrawingContext init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_edgeIndex = a3;
    v14->_numberOfSubstrokes = a4;
    v14->_numberOfSegments = a5;
    objc_storeStrong((id *)&v14->_classifiableDrawing, a6);
    if (&v15->_strokeGroup != a7)
      sub_1BE66D27C((uint64_t)&v15->_strokeGroup, a7->__tree_.__begin_node_, &a7->__tree_.__pair1_.__value_.__left_);
  }

  return v15;
}

- (unint64_t)edgeIndex
{
  return self->_edgeIndex;
}

- (int64_t)numberOfSubstrokes
{
  return self->_numberOfSubstrokes;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (CHClassifiableDrawing)classifiableDrawing
{
  return self->_classifiableDrawing;
}

- (set<long,)strokeGroup
{
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  return (set<long, std::less<long>, std::allocator<long>> *)sub_1BE670B3C(retstr, (_QWORD *)self->_strokeGroup.__tree_.__begin_node_, &self->_strokeGroup.__tree_.__pair1_.__value_.__left_);
}

- (void).cxx_destruct
{
  sub_1BE62033C((uint64_t)&self->_strokeGroup, (_QWORD *)self->_strokeGroup.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_classifiableDrawing, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  return self;
}

@end
