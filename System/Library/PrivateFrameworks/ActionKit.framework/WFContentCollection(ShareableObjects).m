@implementation WFContentCollection(ShareableObjects)

- (void)getShareableObjectsOfTypes:()ShareableObjects options:completionHandler:
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a5;
  v9 = (void *)objc_opt_new();
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v9, "addObject:", objc_opt_class());
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v9, "addObject:", objc_opt_class());
      if ((a3 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v9, "addObject:", objc_opt_class());
  if ((a3 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a3 & 8) != 0)
LABEL_5:
    objc_msgSend(v9, "addObject:", objc_opt_class());
LABEL_6:
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke;
  v11[3] = &unk_24F8B1B48;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  objc_msgSend(a1, "generateCollectionByCoercingToItemClasses:completionHandler:", v9, v11);

}

@end
