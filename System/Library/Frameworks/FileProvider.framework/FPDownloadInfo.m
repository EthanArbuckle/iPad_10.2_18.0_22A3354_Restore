@implementation FPDownloadInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPDownloadInfo;
  v4 = a3;
  -[FPActionOperationInfo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_recursively, CFSTR("_recursively"), v5.receiver, v5.super_class);

}

- (FPDownloadInfo)initWithCoder:(id)a3
{
  id v4;
  FPDownloadInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDownloadInfo;
  v5 = -[FPActionOperationInfo initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_recursively = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_recursively"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{ "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("download "));
  -[FPActionOperationInfo roots](self, "roots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("roots:%@ "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("qos:%2.0x "), -[FPActionOperationInfo qos](self, "qos"));
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (BOOL)recursively
{
  return self->_recursively;
}

- (void)setRecursively:(BOOL)a3
{
  self->_recursively = a3;
}

@end
