@implementation HUIntrinsicSizeDescriptor

+ (id)noIntrinsicSizeDescriptor
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithIntrinsicSize:flexType:aspectRatio:", 0, 0, *MEMORY[0x1E0CEBDE0], *MEMORY[0x1E0CEBDE0]);
}

+ (HUIntrinsicSizeDescriptor)descriptorWithAspectRatio:(double)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)a1);
  v5 = *MEMORY[0x1E0CEBDE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIntrinsicSize:flexType:aspectRatio:", 4, v6, v5, v5);

  return (HUIntrinsicSizeDescriptor *)v7;
}

+ (HUIntrinsicSizeDescriptor)descriptorWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc((Class)a1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke;
  v11[3] = &__block_descriptor_48_e15___NSNumber_8__0l;
  *(double *)&v11[4] = width;
  *(double *)&v11[5] = height;
  __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke((uint64_t)v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIntrinsicSize:flexType:aspectRatio:", a4, v8, width, height);

  return (HUIntrinsicSizeDescriptor *)v9;
}

id __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke(uint64_t a1)
{
  double v1;
  void *v3;
  double v4;

  v1 = *(double *)(a1 + 32);
  if (v1 == *MEMORY[0x1E0CEBDE0])
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v4 = *(double *)(a1 + 40);
    if (v4 != *MEMORY[0x1E0CEBDE0] && v4 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v1 / v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (HUIntrinsicSizeDescriptor)initWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4 aspectRatio:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  HUIntrinsicSizeDescriptor *v11;
  HUIntrinsicSizeDescriptor *v12;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUIntrinsicSizeDescriptor;
  v11 = -[HUIntrinsicSizeDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_intrinsicSize.width = width;
    v11->_intrinsicSize.height = height;
    v11->_flexType = a4;
    objc_storeStrong((id *)&v11->_aspectRatio, a5);
  }

  return v12;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_623 != -1)
    dispatch_once(&_MergedGlobals_623, &__block_literal_global_3);
  return (NAIdentity *)(id)qword_1ED580B10;
}

void __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCGRectCharacteristic:", &__block_literal_global_8_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_0);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_11);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED580B10;
  qword_1ED580B10 = v4;

}

double __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  double v2;

  v2 = *MEMORY[0x1E0C9D538];
  objc_msgSend(a2, "intrinsicSize");
  return v2;
}

uint64_t __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "flexType"));
}

uint64_t __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aspectRatio");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (CGSize)intrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)flexType
{
  return self->_flexType;
}

- (NSNumber)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatio, 0);
}

@end
