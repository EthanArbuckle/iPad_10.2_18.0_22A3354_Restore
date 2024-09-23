@implementation IXPromisedTransferToPathSeed

- (IXPromisedTransferToPathSeed)initWithCoder:(id)a3
{
  id v4;
  IXPromisedTransferToPathSeed *v5;
  uint64_t v6;
  NSURL *transferPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXPromisedTransferToPathSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferPath = v5->_transferPath;
    v5->_transferPath = (NSURL *)v6;

    v5->_shouldCopy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCopy"));
    v5->_tryDeltaCopy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tryDeltaCopy"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IXPromisedTransferToPathSeed;
  v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[IXPromisedTransferToPathSeed transferPath](self, "transferPath", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transferPath"));

  objc_msgSend(v4, "encodeBool:forKey:", -[IXPromisedTransferToPathSeed shouldCopy](self, "shouldCopy"), CFSTR("shouldCopy"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPromisedTransferToPathSeed tryDeltaCopy](self, "tryDeltaCopy"), CFSTR("tryDeltaCopy"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IXPromisedTransferToPathSeed;
  v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[IXPromisedTransferToPathSeed transferPath](self, "transferPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransferPath:", v5);

  objc_msgSend(v4, "setShouldCopy:", -[IXPromisedTransferToPathSeed shouldCopy](self, "shouldCopy"));
  objc_msgSend(v4, "setTryDeltaCopy:", -[IXPromisedTransferToPathSeed tryDeltaCopy](self, "tryDeltaCopy"));
  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (NSURL)transferPath
{
  return self->_transferPath;
}

- (void)setTransferPath:(id)a3
{
  objc_storeStrong((id *)&self->_transferPath, a3);
}

- (BOOL)shouldCopy
{
  return self->_shouldCopy;
}

- (void)setShouldCopy:(BOOL)a3
{
  self->_shouldCopy = a3;
}

- (BOOL)tryDeltaCopy
{
  return self->_tryDeltaCopy;
}

- (void)setTryDeltaCopy:(BOOL)a3
{
  self->_tryDeltaCopy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPath, 0);
}

@end
