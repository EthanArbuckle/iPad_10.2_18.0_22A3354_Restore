@implementation MLPInferenceResult

- (void).cxx_destruct
{
  sub_19C252F64((uint64_t)&self->confusionMatrix, (_QWORD *)self->confusionMatrix.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
