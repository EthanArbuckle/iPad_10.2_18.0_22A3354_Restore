@implementation NTKArgonExtractorOperation

- (NTKArgonExtractorOperation)initWithKeyDescriptor:(id)a3 operationType:(int64_t)a4
{
  id v6;
  NTKArgonExtractorOperation *v7;
  uint64_t v8;
  NTKArgonKeyDescriptor *keyDescriptor;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKArgonExtractorOperation;
  v7 = -[NTKArgonExtractorOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    keyDescriptor = v7->_keyDescriptor;
    v7->_keyDescriptor = (NTKArgonKeyDescriptor *)v8;

    v7->_operationType = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[NTKArgonExtractorOperation keyDescriptor](self, "keyDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NTKArgonExtractorOperation operationType](self, "operationType") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  uint64_t v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "keyDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKArgonExtractorOperation keyDescriptor](self, "keyDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);
    if ((v9 & 1) != 0
      || (objc_msgSend(v6, "keyDescriptor"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NTKArgonExtractorOperation keyDescriptor](self, "keyDescriptor"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 == v10))
    {
      v12 = objc_msgSend(v6, "operationType");
      v11 = v12 == -[NTKArgonExtractorOperation operationType](self, "operationType");
      v10 = v3;
      if ((v9 & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (NTKArgonKeyDescriptor)keyDescriptor
{
  return self->_keyDescriptor;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDescriptor, 0);
}

@end
