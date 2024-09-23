@implementation FIDSNode_FPProvider

+ (id)makeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  TString *v7;
  TNode *v8;
  void *v9;
  void *v10;
  TString v12;
  FINode *v13;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI Domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
    v12.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v12, v7);

    TNode::RootNodeForFPDomain((TNode *)&v12, 0, (TNodePtr *)&v13);
    v8 = (TNode *)TNodeFromFINode(v13);
    FIDSNodeFromTNode(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    static_objc_cast<NSString,objc_object * {__strong}>(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v12.fString.fRef);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FIDSNode_FPProvider;
  -[FIDSNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[FIDSNode fpDomain](self, "fpDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FI Domain"));

}

- (BOOL)isUsingFPFS
{
  void *v2;
  char v3;

  -[FIDSNode fiDomain](self, "fiDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingFPFS");

  return v3;
}

- (BOOL)isFPv2
{
  void *v2;
  char v3;

  -[FIDSNode fiDomain](self, "fiDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFPv2");

  return v3;
}

@end
