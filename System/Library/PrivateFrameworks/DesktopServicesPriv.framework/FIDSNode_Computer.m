@implementation FIDSNode_Computer

+ (id)makeWithCoder:(id)a3
{
  TNode *v3;
  void *v4;
  void *v5;
  FINode *v7;

  TGlobalNodes::RootNode((uint64_t *)&v7);
  v3 = (TNode *)TNodeFromFINode(v7);
  FIDSNodeFromTNode(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
