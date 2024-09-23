@implementation AGXA10FamilySampler

- (AGXA10FamilySampler)initWithDevice:(id)a3 samplerDescriptor:(id)a4 driverDescriptor:(const void *)a5 initialQOSOverride:(unsigned int)a6
{
  AGXA10FamilySampler *v10;
  uint64_t v11;
  Sampler *p_impl;
  void **p_label;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  std::string v18;
  unint64_t v19;
  char v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AGXA10FamilySampler;
  v10 = -[_MTLSamplerState initWithDevice:samplerDescriptor:](&v21, sel_initWithDevice_samplerDescriptor_, a3);
  if (v10)
  {
    v15 = *(_OWORD *)a5;
    v16 = *((_OWORD *)a5 + 1);
    v17 = *((_OWORD *)a5 + 2);
    if (*((char *)a5 + 71) < 0)
      std::string::__init_copy_ctor_external(&v18, *((const std::string::value_type **)a5 + 6), *((_QWORD *)a5 + 7));
    else
      v18 = *(std::string *)((_BYTE *)a5 + 2);
    AGX::SamplerStateEncoderGen2<kAGXRevG9>::SamplerStateFields::SamplerStateFields(&v19, (float *)a5);
    v11 = 0xFE780000000000;
    if (!a6)
      v11 = 0xC0000000000000;
    v19 = v19 & 0xFF0007FFFFFFFFFFLL | v11;
    if ((*((_BYTE *)a5 + 6) & 0x10) != 0)
      objc_msgSend(a4, "resourceIndex");
    p_impl = &self->_impl;
    *(_OWORD *)&p_impl->desc.ss.var0 = v15;
    *(_OWORD *)&p_impl->desc.lod_bias = v16;
    *(_OWORD *)&p_impl->desc.custom_border_color[3] = v17;
    p_label = (void **)&p_impl->desc.label;
    if (*((char *)&p_impl->desc.label.__r_.__value_.var0.__l + 23) < 0)
      operator delete(*p_label);
    *(_OWORD *)p_label = *(_OWORD *)&v18.__r_.__value_.__l.__data_;
    *((_QWORD *)&p_impl->desc.label.__r_.__value_.var0.__l + 2) = *((_QWORD *)&v18.__r_.__value_.__l + 2);
    *(_QWORD *)&p_impl->desc.label.__r_.var0 = v19;
    LOBYTE(p_impl->desc.label.var0) = v20;
  }
  return v10;
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)&self->_impl;
}

- (unint64_t)resourceIndex
{
  return 0;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_impl.desc.label.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_impl.desc.label.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *((_WORD *)self + 24) = 0;
  *(_OWORD *)((char *)self + 104) = 0uLL;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
