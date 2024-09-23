@implementation IDSCKModifySubscriptionsOperation

+ (Class)__class
{
  if (qword_1EE40B1C0 != -1)
    dispatch_once(&qword_1EE40B1C0, &unk_1E3C1BE10);
  return (Class)(id)qword_1EE40B1B8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (id)modifySubscriptionsCompletionBlock
{
  return self->_modifySubscriptionsCompletionBlock;
}

- (void)setModifySubscriptionsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock, 0);
}

@end
