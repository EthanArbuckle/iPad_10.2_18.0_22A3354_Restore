@implementation _GEOConfigDBOperationBase

- (_GEOConfigDBOperationBase)init
{
  _GEOConfigDBOperationBase *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  id transaction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GEOConfigDBOperationBase;
  v2 = -[_GEOConfigDBOperationBase init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "UTF8String");
    _GEOCreateTransaction();
    v5 = objc_claimAutoreleasedReturnValue();
    transaction = v2->_transaction;
    v2->_transaction = (id)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transaction, 0);
}

@end
