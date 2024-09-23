@implementation MTRScenesManagementClusterAttributeValuePairStruct

- (MTRScenesManagementClusterAttributeValuePairStruct)init
{
  MTRScenesManagementClusterAttributeValuePairStruct *v2;
  MTRScenesManagementClusterAttributeValuePairStruct *v3;
  NSNumber *attributeID;
  NSNumber *valueUnsigned8;
  NSNumber *valueSigned8;
  NSNumber *valueUnsigned16;
  NSNumber *valueSigned16;
  NSNumber *valueUnsigned32;
  NSNumber *valueSigned32;
  NSNumber *valueUnsigned64;
  NSNumber *valueSigned64;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRScenesManagementClusterAttributeValuePairStruct;
  v2 = -[MTRScenesManagementClusterAttributeValuePairStruct init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    attributeID = v2->_attributeID;
    v2->_attributeID = (NSNumber *)&unk_250591B18;

    valueUnsigned8 = v3->_valueUnsigned8;
    v3->_valueUnsigned8 = 0;

    valueSigned8 = v3->_valueSigned8;
    v3->_valueSigned8 = 0;

    valueUnsigned16 = v3->_valueUnsigned16;
    v3->_valueUnsigned16 = 0;

    valueSigned16 = v3->_valueSigned16;
    v3->_valueSigned16 = 0;

    valueUnsigned32 = v3->_valueUnsigned32;
    v3->_valueUnsigned32 = 0;

    valueSigned32 = v3->_valueSigned32;
    v3->_valueSigned32 = 0;

    valueUnsigned64 = v3->_valueUnsigned64;
    v3->_valueUnsigned64 = 0;

    valueSigned64 = v3->_valueSigned64;
    v3->_valueSigned64 = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterAttributeValuePairStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTRScenesManagementClusterAttributeValuePairStruct);
  objc_msgSend_attributeID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttributeID_(v4, v8, (uint64_t)v7);

  objc_msgSend_valueUnsigned8(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueUnsigned8_(v4, v12, (uint64_t)v11);

  objc_msgSend_valueSigned8(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueSigned8_(v4, v16, (uint64_t)v15);

  objc_msgSend_valueUnsigned16(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueUnsigned16_(v4, v20, (uint64_t)v19);

  objc_msgSend_valueSigned16(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueSigned16_(v4, v24, (uint64_t)v23);

  objc_msgSend_valueUnsigned32(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueUnsigned32_(v4, v28, (uint64_t)v27);

  objc_msgSend_valueSigned32(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueSigned32_(v4, v32, (uint64_t)v31);

  objc_msgSend_valueUnsigned64(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueUnsigned64_(v4, v36, (uint64_t)v35);

  objc_msgSend_valueSigned64(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValueSigned64_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: attributeID:%@; valueUnsigned8:%@; valueSigned8:%@; valueUnsigned16:%@; valueSigned16:%@; valueUnsigned32:%@; valueSigned32:%@; valueUnsigned64:%@; valueSigned64:%@; >"),
    v5,
    self->_attributeID,
    self->_valueUnsigned8,
    self->_valueSigned8,
    self->_valueUnsigned16,
    self->_valueSigned16,
    self->_valueUnsigned32,
    self->_valueSigned32,
    self->_valueUnsigned64,
    self->_valueSigned64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (void)setAttributeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)valueUnsigned8
{
  return self->_valueUnsigned8;
}

- (void)setValueUnsigned8:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)valueSigned8
{
  return self->_valueSigned8;
}

- (void)setValueSigned8:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)valueUnsigned16
{
  return self->_valueUnsigned16;
}

- (void)setValueUnsigned16:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)valueSigned16
{
  return self->_valueSigned16;
}

- (void)setValueSigned16:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)valueUnsigned32
{
  return self->_valueUnsigned32;
}

- (void)setValueUnsigned32:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)valueSigned32
{
  return self->_valueSigned32;
}

- (void)setValueSigned32:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)valueUnsigned64
{
  return self->_valueUnsigned64;
}

- (void)setValueUnsigned64:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)valueSigned64
{
  return self->_valueSigned64;
}

- (void)setValueSigned64:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSigned64, 0);
  objc_storeStrong((id *)&self->_valueUnsigned64, 0);
  objc_storeStrong((id *)&self->_valueSigned32, 0);
  objc_storeStrong((id *)&self->_valueUnsigned32, 0);
  objc_storeStrong((id *)&self->_valueSigned16, 0);
  objc_storeStrong((id *)&self->_valueUnsigned16, 0);
  objc_storeStrong((id *)&self->_valueSigned8, 0);
  objc_storeStrong((id *)&self->_valueUnsigned8, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);
}

@end
