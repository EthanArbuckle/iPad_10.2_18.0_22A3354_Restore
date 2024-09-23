@implementation GKLoadSystemImageResourceOperation

- (GKLoadSystemImageResourceOperation)initWithSystemImageName:(id)a3
{
  id v4;
  GKLoadSystemImageResourceOperation *v5;
  uint64_t v6;
  NSString *systemImageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLoadSystemImageResourceOperation;
  v5 = -[GKLoadSystemImageResourceOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;

  }
  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((-[GKLoadSystemImageResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    -[GKLoadSystemImageResourceOperation systemImageName](self, "systemImageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_systemImageNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[GKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", v5, 0);
    }
    else if ((-[GKLoadSystemImageResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[GKLoadSystemImageResourceOperation systemImageName](self, "systemImageName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("No system image found for %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("GKLoadSystemImageResourceOperation"), 560557415, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, v11);
    }

  }
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end
