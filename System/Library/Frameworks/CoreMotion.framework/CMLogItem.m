@implementation CMLogItem

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMLogItemCodingKeyTimestamp"), v3, v4, *((double *)self->_internalLogItem + 1));
}

- (CMLogItem)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_decodeDoubleForKey_(a3, a2, (uint64_t)CFSTR("kCMLogItemCodingKeyTimestamp"), v3, v4);
  return (CMLogItem *)objc_msgSend_initWithTimestamp_(self, v6, v7, v8, v9);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMLogItem;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (CMLogItem)initWithTimestamp:(double)a3
{
  CMLogItem *v4;
  CMLogItemInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMLogItem;
  v4 = -[CMLogItem init](&v11, sel_init);
  if (v4)
  {
    v5 = [CMLogItemInternal alloc];
    v4->_internalLogItem = (id)objc_msgSend_initWithTimestamp_(v5, v6, v7, v8, v9, a3);
  }
  return v4;
}

- (NSTimeInterval)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  objc_msgSend_timestamp(self, v10, v11, v12, v13);
  return (id)objc_msgSend_initWithTimestamp_(v9, v14, v15, v16, v17);
}

@end
