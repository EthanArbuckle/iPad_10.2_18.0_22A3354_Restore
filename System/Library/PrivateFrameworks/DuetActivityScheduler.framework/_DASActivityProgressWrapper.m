@implementation _DASActivityProgressWrapper

- (_DASActivityProgressWrapper)initWithProgress:(id)a3
{
  id v5;
  _DASActivityProgressWrapper *v6;
  _DASActivityProgressWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityProgressWrapper;
  v6 = -[_DASActivityProgressWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_progress, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityProgressWrapper)initWithCoder:(id)a3
{
  id v4;
  _DASActivityProgressWrapper *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSProgress *v14;
  NSProgress *progress;
  NSProgress *v16;
  _QWORD v18[4];
  NSProgress *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_DASActivityProgressWrapper;
  v5 = -[_DASActivityProgressWrapper init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    objc_msgSend(v6, "setTotalUnitCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("total")));
    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("completed")));
    if (objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cancelled")))
      objc_msgSend(v6, "cancel");
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45___DASActivityProgressWrapper_initWithCoder___block_invoke;
    v18[3] = &unk_1E624B860;
    v14 = (NSProgress *)v6;
    v19 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
    progress = v5->_progress;
    v5->_progress = v14;
    v16 = v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSProgress *progress;
  id v5;
  id v6;

  progress = self->_progress;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[NSProgress completedUnitCount](progress, "completedUnitCount"), CFSTR("completed"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"), CFSTR("total"));
  objc_msgSend(v5, "encodeBool:forKey:", -[NSProgress isCancelled](self->_progress, "isCancelled"), CFSTR("cancelled"));
  -[NSProgress userInfo](self->_progress, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("userInfo"));

}

- (id)description
{
  void *v2;
  void *v3;

  -[_DASActivityProgressWrapper progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
