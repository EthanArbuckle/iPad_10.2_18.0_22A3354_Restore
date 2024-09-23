@implementation HMBModelFieldOptionQueryable

- (HMBModelFieldOptionQueryable)initWithEncodingBlock:(id)a3 decodingBlock:(id)a4 descriptionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMBModelFieldOptionQueryable *v11;
  uint64_t v12;
  id encodingBlock;
  uint64_t v14;
  id decodingBlock;
  uint64_t v16;
  id descriptionBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMBModelFieldOptionQueryable;
  v11 = -[HMBModelFieldOptionQueryable init](&v19, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x1D17B63A4](v8);
    encodingBlock = v11->_encodingBlock;
    v11->_encodingBlock = (id)v12;

    v14 = MEMORY[0x1D17B63A4](v9);
    decodingBlock = v11->_decodingBlock;
    v11->_decodingBlock = (id)v14;

    v16 = MEMORY[0x1D17B63A4](v10);
    descriptionBlock = v11->_descriptionBlock;
    v11->_descriptionBlock = (id)v16;

  }
  return v11;
}

- (void)applyTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  -[HMBModelFieldOptionQueryable encodingBlock](self, "encodingBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMBModelFieldOptionQueryable encodingBlock](self, "encodingBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEncodeBlock:", v6);

    -[HMBModelFieldOptionQueryable decodingBlock](self, "decodingBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDecodeBlock:", v7);

    -[HMBModelFieldOptionQueryable descriptionBlock](self, "descriptionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptionBlock:", v8);

  }
  else
  {
    v9 = objc_msgSend(v4, "classObj");
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke;
    v14[3] = &__block_descriptor_40_e16___NSData_16__0_8lu32l8;
    v14[4] = v9;
    objc_msgSend(v4, "setEncodeBlock:", v14);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_2;
    v13[3] = &__block_descriptor_40_e16__16__0__NSData_8lu32l8;
    v13[4] = v9;
    objc_msgSend(v4, "setDecodeBlock:", v13);
    objc_msgSend(v4, "classObj");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_3;
      v12[3] = &__block_descriptor_40_e26___NSString_16__0__NSData_8lu32l8;
      v12[4] = v9;
      v11 = v12;
    }
    else
    {
      v11 = &__block_literal_global_7526;
    }
    objc_msgSend(v4, "setDescriptionBlock:", v11);
  }

}

- (id)encodingBlock
{
  return self->_encodingBlock;
}

- (void)setEncodingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)decodingBlock
{
  return self->_decodingBlock;
}

- (void)setDecodingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)descriptionBlock
{
  return self->_descriptionBlock;
}

- (void)setDescriptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_decodingBlock, 0);
  objc_storeStrong(&self->_encodingBlock, 0);
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmbEncodeQueryableParameter:", a2);
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmbDecodeQueryableParameter:", a2);
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmbDescriptionForEncodedQueryableVariable:", a2);
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbDescription");
}

@end
