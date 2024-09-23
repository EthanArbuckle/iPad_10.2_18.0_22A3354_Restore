@implementation CATTaskMessageProgressUpdate

- (CATTaskMessageProgressUpdate)initWithTaskUUID:(id)a3 progress:(id)a4
{
  id v6;
  CATTaskMessageProgressUpdate *v7;
  uint64_t v8;
  CATTaskProgress *progress;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CATTaskMessageProgressUpdate;
  v7 = -[CATTaskMessage initWithTaskUUID:](&v11, sel_initWithTaskUUID_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    progress = v7->_progress;
    v7->_progress = (CATTaskProgress *)v8;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageProgressUpdate)initWithCoder:(id)a3
{
  id v4;
  CATTaskMessageProgressUpdate *v5;
  void *v6;
  uint64_t v7;
  CATTaskProgress *progress;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageProgressUpdate;
  v5 = -[CATTaskMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("progress"));
    v7 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (CATTaskProgress *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageProgressUpdate;
  v4 = a3;
  -[CATTaskMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CATTaskMessageProgressUpdate progress](self, "progress", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("progress"));

}

- (CATTaskProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
