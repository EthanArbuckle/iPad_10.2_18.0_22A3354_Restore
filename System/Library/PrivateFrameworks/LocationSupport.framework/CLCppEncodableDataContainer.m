@implementation CLCppEncodableDataContainer

+ (id)containerWithObject:(void *)a3 cppDataEncoder:(id)a4 destructor:(id)a5 binaryVersion:(unint64_t)a6 typeSize:(unint64_t)a7
{
  id v11;
  id v12;
  CLCppEncodableDataContainer *v13;

  v11 = a5;
  v12 = a4;
  v13 = -[CLCppEncodableDataContainer initWithObject:cppDataEncoder:destructor:binaryVersion:typeSize:]([CLCppEncodableDataContainer alloc], "initWithObject:cppDataEncoder:destructor:binaryVersion:typeSize:", a3, v12, v11, a6, a7);

  return v13;
}

- (CLCppEncodableDataContainer)initWithObject:(void *)a3 cppDataEncoder:(id)a4 destructor:(id)a5 binaryVersion:(unint64_t)a6 typeSize:(unint64_t)a7
{
  id v12;
  CLCppEncodableDataContainer *v13;
  CLCppEncodableDataContainer *v14;
  objc_super v16;

  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLCppEncodableDataContainer;
  v13 = -[CLCppContainer initWithObject:destructor:binaryVersion:typeSize:](&v16, sel_initWithObject_destructor_binaryVersion_typeSize_, a3, a5, a6, a7);
  v14 = v13;
  if (v13)
    -[CLCppEncodableDataContainer setEncoder:](v13, "setEncoder:", v12);

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[CLCppEncodableDataContainer setSerialized:](self, "setSerialized:", 0);
  -[CLCppEncodableDataContainer setCompatibilityInfo:](self, "setCompatibilityInfo:", 0);
  -[CLCppEncodableDataContainer setEncoder:](self, "setEncoder:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLCppEncodableDataContainer;
  -[CLCppContainer dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[CLCppEncodableDataContainer encoder](self, "encoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLCppEncodableDataContainer encoder](self, "encoder");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (CLCppEncodableDataContainer)initWithCoder:(id)a3
{
  id v4;
  CLCppEncodableDataContainer *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLCppEncodableDataContainer;
  v5 = -[CLCppContainer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("serialized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLCppEncodableDataContainer setSerialized:](v5, "setSerialized:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("compatibilityInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLCppEncodableDataContainer setCompatibilityInfo:](v5, "setCompatibilityInfo:", v7);

  }
  return v5;
}

- (NSData)serialized
{
  return self->_serialized;
}

- (void)setSerialized:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)compatibilityInfo
{
  return self->_compatibilityInfo;
}

- (void)setCompatibilityInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_encoder, 0);
  objc_storeStrong(&self->_compatibilityInfo, 0);
  objc_storeStrong((id *)&self->_serialized, 0);
}

@end
