@implementation Image_Estimator_HEIFOutput

- (Image_Estimator_HEIFOutput)initWithTarget_Quality_Factor:(double)a3
{
  Image_Estimator_HEIFOutput *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)Image_Estimator_HEIFOutput;
  result = -[Image_Estimator_HEIFOutput init](&v5, sel_init);
  if (result)
    result->_Target_Quality_Factor = a3;
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)((uint64_t (*)(_QWORD, char *, void *))MEMORY[0x24BEDD108])(MEMORY[0x24BDBCF20], sel_setWithArray_, &unk_24E202C98);
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("Target Quality Factor"), v3, v4, v5, v6))
  {
    v14 = (void *)MEMORY[0x24BDBFF98];
    objc_msgSend_Target_Quality_Factor(self, v8, v9, v10, v11, v12, v13);
    objc_msgSend_featureValueWithDouble_(v14, v15, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (double)Target_Quality_Factor
{
  return self->_Target_Quality_Factor;
}

- (void)setTarget_Quality_Factor:(double)a3
{
  self->_Target_Quality_Factor = a3;
}

@end
