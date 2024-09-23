@implementation _MSPContainerEdit

- (void)ifAddition:(id)a3 ifRemoval:(id)a4 ifReplacement:(id)a5 ifContentUpdate:(id)a6 ifReplacedEntirely:(id)a7
{
  void (**v12)(id, _MSPContainerEdit *);
  void (**v13)(id, _MSPContainerEdit *);
  void (**v14)(id, _MSPContainerEdit *);
  void (**v15)(id, _MSPContainerEdit *);
  void (**v16)(id, _MSPContainerEdit *);
  char isKindOfClass;
  char v18;
  void (**v19)(id, _MSPContainerEdit *);

  v19 = (void (**)(id, _MSPContainerEdit *))a3;
  v12 = (void (**)(id, _MSPContainerEdit *))a4;
  v13 = (void (**)(id, _MSPContainerEdit *))a5;
  v14 = (void (**)(id, _MSPContainerEdit *))a6;
  v15 = (void (**)(id, _MSPContainerEdit *))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v19;
    if (!v19)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v12;
    if (!v12)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v13;
    if (!v13)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v14;
    if (!v14)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v15)
  {
    v18 = isKindOfClass;
    v16 = v15;
    if ((v18 & 1) != 0)
LABEL_15:
      v16[2](v16, self);
  }
LABEL_16:

}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  -[_MSPContainerEdit methodForSelector:](self, "methodForSelector:", a2, a4);
  +[_MSPContainerEdit instanceMethodForSelector:](_MSPContainerEdit, "instanceMethodForSelector:", a2);
}

@end
