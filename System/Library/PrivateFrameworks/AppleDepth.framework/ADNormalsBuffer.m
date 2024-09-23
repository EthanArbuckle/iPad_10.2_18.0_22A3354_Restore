@implementation ADNormalsBuffer

- (void).cxx_destruct
{
  objc_class *isa;

  isa = self[1].super.isa;
  if (isa)
  {
    self[2].super.isa = isa;
    operator delete(isa);
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
