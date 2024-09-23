@implementation GRCPerFrameDataClass

- (GRCPerFrameDataClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GRCPerFrameDataClass;
  return -[GRCPerFrameDataClass init](&v3, "init");
}

- (void).cxx_destruct
{
  std::unique_ptr<GRCPerFrameData>::reset[abi:nn180100]((uint64_t *)&self->_grcFrameData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
