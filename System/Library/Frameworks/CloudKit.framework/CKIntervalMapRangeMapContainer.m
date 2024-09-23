@implementation CKIntervalMapRangeMapContainer

- (void).cxx_destruct
{
  RangeDataVector<unsigned long, unsigned long, id, 0U, std::less<id>> *p_rangeMap;

  p_rangeMap = &self->rangeMap;
  sub_18A706600((void ***)&p_rangeMap);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
