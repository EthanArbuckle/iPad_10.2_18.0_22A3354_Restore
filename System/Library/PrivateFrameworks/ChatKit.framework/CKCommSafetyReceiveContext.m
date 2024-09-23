@implementation CKCommSafetyReceiveContext

+ (NSString)contextKey
{
  return (NSString *)CFSTR("CKCommSafetyContextKeyReceive");
}

+ (id)contextWithIndexPath:(id)a3
{
  id v3;
  CKCommSafetyReceiveContext *v4;

  v3 = a3;
  v4 = -[CKCommSafetyReceiveContext initWithIndexPath:shouldTargetAssociatedMessages:]([CKCommSafetyReceiveContext alloc], "initWithIndexPath:shouldTargetAssociatedMessages:", v3, 0);

  return v4;
}

+ (id)contextWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CKCommSafetyReceiveContext *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CKCommSafetyReceiveContext initWithIndexPath:shouldTargetAssociatedMessages:]([CKCommSafetyReceiveContext alloc], "initWithIndexPath:shouldTargetAssociatedMessages:", v5, v4);

  return v6;
}

- (CKCommSafetyReceiveContext)initWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4
{
  id v7;
  CKCommSafetyReceiveContext *v8;
  CKCommSafetyReceiveContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKCommSafetyReceiveContext;
  v8 = -[CKCommSafetyReceiveContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_indexPath, a3);
    v9->_shouldTargetAssociatedMessages = a4;
  }

  return v9;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (BOOL)shouldTargetAssociatedMessages
{
  return self->_shouldTargetAssociatedMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
