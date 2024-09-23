@implementation INGetOnScreenContentForwardingActionResponse

- (INGetOnScreenContentForwardingActionResponse)initWithNode:(id)a3 error:(id)a4
{
  id v7;
  INGetOnScreenContentForwardingActionResponse *v8;
  INGetOnScreenContentForwardingActionResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetOnScreenContentForwardingActionResponse;
  v8 = -[INIntentForwardingActionResponse initWithError:](&v11, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_node, a3);

  return v9;
}

- (INGetOnScreenContentForwardingActionResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  INGetOnScreenContentForwardingActionResponse *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getWFOnScreenContentNodeClass_softClass;
  v23 = getWFOnScreenContentNodeClass_softClass;
  if (!getWFOnScreenContentNodeClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getWFOnScreenContentNodeClass_block_invoke;
    v19[3] = &unk_1E22953C0;
    v19[4] = &v20;
    __getWFOnScreenContentNodeClass_block_invoke((uint64_t)v19);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("node"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("error"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[INGetOnScreenContentForwardingActionResponse initWithNode:error:](self, "initWithNode:error:", v7, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetOnScreenContentForwardingActionResponse;
  v4 = a3;
  -[INIntentForwardingActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_node, CFSTR("node"), v5.receiver, v5.super_class);

}

- (WFOnScreenContentNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
