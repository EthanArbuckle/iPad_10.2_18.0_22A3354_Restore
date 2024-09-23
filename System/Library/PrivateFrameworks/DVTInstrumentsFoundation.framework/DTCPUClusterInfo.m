@implementation DTCPUClusterInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTCPUClusterInfo.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.allowsKeyedCoding"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_clusterID, CFSTR("_clusterID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_clusterFlags, CFSTR("_clusterFlags"));

}

- (DTCPUClusterInfo)initWithCoder:(id)a3
{
  id v5;
  DTCPUClusterInfo *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTCPUClusterInfo.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.allowsKeyedCoding"));

  }
  v9.receiver = self;
  v9.super_class = (Class)DTCPUClusterInfo;
  v6 = -[DTCPUClusterInfo init](&v9, sel_init);
  if (v6)
  {
    v6->_clusterID = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_clusterID"));
    v6->_clusterFlags = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_clusterFlags"));
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> cluster id: %lu, flags: 0x%lx"), v5, self, self->_clusterID, self->_clusterFlags);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (DTCPUClusterInfo)initWithClusterID:(unint64_t)a3 flags:(unint64_t)a4
{
  DTCPUClusterInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTCPUClusterInfo;
  result = -[DTCPUClusterInfo init](&v7, sel_init);
  if (result)
  {
    result->_clusterID = a3;
    result->_clusterFlags = a4;
  }
  return result;
}

- (BOOL)isEfficiencyCore
{
  return self->_clusterFlags & 1;
}

- (BOOL)isPerformanceCore
{
  return (LOBYTE(self->_clusterFlags) >> 1) & 1;
}

- (unint64_t)clusterID
{
  return self->_clusterID;
}

- (unint64_t)clusterFlags
{
  return self->_clusterFlags;
}

@end
