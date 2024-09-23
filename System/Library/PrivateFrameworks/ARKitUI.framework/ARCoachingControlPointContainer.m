@implementation ARCoachingControlPointContainer

- ($3BA783FF50B239963188BE194EBFFEBA)controlPoints
{
  if (self->_controlPoints.__begin_ == self->_controlPoints.__end_)
    return 0;
  else
    return ($3BA783FF50B239963188BE194EBFFEBA *)self->_controlPoints.__begin_;
}

- (unsigned)numControlPoints
{
  return (unint64_t)(self->_controlPoints.__end_ - self->_controlPoints.__begin_) >> 5;
}

- (ARCoachingControlPointContainer)initWithControlPoints:(id *)a3 numControlPoints:(int)a4
{
  uint64_t v4;
  ARCoachingControlPointContainer *v6;
  ARCoachingControlPointContainer *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingControlPointContainer;
  v6 = -[ARCoachingControlPointContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[ARCoachingControlPointContainer overwriteWithControlPoints:numControlPoints:](v6, "overwriteWithControlPoints:numControlPoints:", a3, v4);
  return v7;
}

- (void)overwriteWithControlPoints:(id *)a3 numControlPoints:(int)a4
{
  vector<ARCoachingControlPoint, std::allocator<ARCoachingControlPoint>> *p_controlPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_controlPoints.__begin_;
  p_controlPoints = &self->_controlPoints;
  p_controlPoints->__end_ = begin;
  std::vector<ARCoachingControlPoint>::__assign_with_size[abi:ne180100]<ARCoachingControlPoint*,ARCoachingControlPoint*>((char *)p_controlPoints, (char *)a3, (uint64_t)&a3[8 * a4], a4);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_controlPoints.__begin_;
  if (begin)
  {
    self->_controlPoints.__end_ = begin;
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
