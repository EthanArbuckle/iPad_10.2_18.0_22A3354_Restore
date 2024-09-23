@implementation FCPseudoOperation

- (FCPseudoOperation)init
{
  return -[FCPseudoOperation initWithCancelBlock:priorityBlock:shortDescription:longDescription:](self, "initWithCancelBlock:priorityBlock:shortDescription:longDescription:", 0, 0, 0, 0);
}

- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4 shortDescription:(id)a5 longDescription:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCPseudoOperation *v14;
  uint64_t v15;
  id cancelBlock;
  uint64_t v17;
  id priorityBlock;
  uint64_t v19;
  NSString *shortOperationDescription;
  uint64_t v21;
  NSString *longOperationDescription;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FCPseudoOperation;
  v14 = -[FCPseudoOperation init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    cancelBlock = v14->_cancelBlock;
    v14->_cancelBlock = (id)v15;

    v17 = objc_msgSend(v11, "copy");
    priorityBlock = v14->_priorityBlock;
    v14->_priorityBlock = (id)v17;

    v19 = objc_msgSend(v12, "copy");
    shortOperationDescription = v14->_shortOperationDescription;
    v14->_shortOperationDescription = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    longOperationDescription = v14->_longOperationDescription;
    v14->_longOperationDescription = (NSString *)v21;

  }
  return v14;
}

- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4
{
  return -[FCPseudoOperation initWithCancelBlock:priorityBlock:shortDescription:longDescription:](self, "initWithCancelBlock:priorityBlock:shortDescription:longDescription:", a3, a4, 0, 0);
}

- (void)cancel
{
  void *v3;
  void (**v4)(void);

  -[FCPseudoOperation cancelBlock](self, "cancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCPseudoOperation cancelBlock](self, "cancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    -[FCPseudoOperation priorityBlock](self, "priorityBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCPseudoOperation priorityBlock](self, "priorityBlock");
      v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
      v6[2](v6, a3);

    }
  }
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)shortOperationDescription
{
  return self->_shortOperationDescription;
}

- (void)setShortOperationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)longOperationDescription
{
  return self->_longOperationDescription;
}

- (void)setLongOperationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)priorityBlock
{
  return self->_priorityBlock;
}

- (void)setPriorityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_priorityBlock, 0);
  objc_storeStrong((id *)&self->_longOperationDescription, 0);
  objc_storeStrong((id *)&self->_shortOperationDescription, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
