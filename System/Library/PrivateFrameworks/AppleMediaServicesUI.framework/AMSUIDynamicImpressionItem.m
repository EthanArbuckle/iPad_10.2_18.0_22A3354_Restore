@implementation AMSUIDynamicImpressionItem

- (AMSUIDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  objc_class *v11;
  AMSUIDynamicImpressionItem *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v10 = (void *)getAMSUIDDynamicImpressionItemClass_softClass;
  v18 = getAMSUIDDynamicImpressionItemClass_softClass;
  if (!getAMSUIDDynamicImpressionItemClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getAMSUIDDynamicImpressionItemClass_block_invoke;
    v14[3] = &unk_24CB4F3E8;
    v14[4] = &v15;
    __getAMSUIDDynamicImpressionItemClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v15, 8);
  v12 = (AMSUIDynamicImpressionItem *)objc_msgSend([v11 alloc], "initWithFrame:impressionMetrics:", v9, x, y, width, height);

  return v12;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (AMSUIDynamicImpressionMetrics)impressionMetrics
{
  return self->_impressionMetrics;
}

- (void)setImpressionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_impressionMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionMetrics, 0);
}

@end
