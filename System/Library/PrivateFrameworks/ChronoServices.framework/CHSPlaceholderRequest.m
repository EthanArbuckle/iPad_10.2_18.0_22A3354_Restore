@implementation CHSPlaceholderRequest

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSPlaceholderRequest.m"), 16, CFSTR("use initWithMetrics:family:fileHandle:"));

  return 0;
}

- (CHSPlaceholderRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSPlaceholderRequest.m"), 21, CFSTR("use initWithMetrics:family:fileHandle:"));

  return 0;
}

- (CHSPlaceholderRequest)initWithMetrics:(id)a3 family:(int64_t)a4 fileHandle:(id)a5
{
  id v9;
  id v10;
  CHSPlaceholderRequest *v11;
  CHSPlaceholderRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CHSPlaceholderRequest;
  v11 = -[CHSPlaceholderRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metrics, a3);
    v12->_family = a4;
    objc_storeStrong((id *)&v12->_fileHandle, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_family, CFSTR("_family"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metrics, CFSTR("_metrics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileHandle, CFSTR("_fileHandle"));

}

- (CHSPlaceholderRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  CHSPlaceholderRequest *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_family"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileHandle"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v7)
  {
    if (CHSWidgetFamilyIsValid(v6))
    {
      self = -[CHSPlaceholderRequest initWithMetrics:family:fileHandle:](self, "initWithMetrics:family:fileHandle:", v5, v6, v8);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (int64_t)family
{
  return self->_family;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
