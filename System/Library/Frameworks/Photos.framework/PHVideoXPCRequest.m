@implementation PHVideoXPCRequest

- (PHVideoXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 size:(CGSize)a5 behavior:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  PHVideoXPCRequest *v13;
  PHVideoXPCRequest *v14;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PHVideoXPCRequest;
  v13 = -[PLResourceXPCRequest initWithTaskIdentifier:assetObjectID:](&v16, sel_initWithTaskIdentifier_assetObjectID_, a3, a4);
  v14 = v13;
  if (v13)
  {
    v13->_size.width = width;
    v13->_size.height = height;
    objc_storeStrong((id *)&v13->_behaviorSpec, a6);
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHVideoXPCRequest;
  v4 = a3;
  -[PLResourceXPCRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("width"), self->_size.width, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("height"), self->_size.height);
  objc_msgSend(v4, "encodeObject:forKey:", self->_behaviorSpec, CFSTR("behaviorSpec"));

}

- (PHVideoXPCRequest)initWithCoder:(id)a3
{
  id v4;
  PHVideoXPCRequest *v5;
  PHVideoXPCRequest *v6;
  CGSize *p_size;
  objc_class *v8;
  objc_class *v9;
  CGFloat v10;
  uint64_t v11;
  PHVideoRequestBehaviorSpec *behaviorSpec;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHVideoXPCRequest;
  v5 = -[PLResourceXPCRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_size = &v5->_size;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    *(_QWORD *)&p_size->width = v9;
    v6->_size.height = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behaviorSpec"));
    v11 = objc_claimAutoreleasedReturnValue();
    behaviorSpec = v6->_behaviorSpec;
    v6->_behaviorSpec = (PHVideoRequestBehaviorSpec *)v11;

    if (!v6->_behaviorSpec)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("behavior spec is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v15);

      v6 = 0;
    }
  }

  return v6;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PHVideoRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
