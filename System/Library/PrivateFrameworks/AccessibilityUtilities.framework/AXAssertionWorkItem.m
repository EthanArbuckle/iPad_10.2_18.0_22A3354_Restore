@implementation AXAssertionWorkItem

- (AXAssertionWorkItem)initWithType:(id)a3 identifier:(id)a4 isAcquisition:(BOOL)a5
{
  id v8;
  id v9;
  AXAssertionWorkItem *v10;
  uint64_t v11;
  NSString *type;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXAssertionWorkItem;
  v10 = -[AXAssertionWorkItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    type = v10->_type;
    v10->_type = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;

    v10->_acquire = a5;
    v10->_retries = 0;
  }

  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)acquire
{
  return self->_acquire;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
