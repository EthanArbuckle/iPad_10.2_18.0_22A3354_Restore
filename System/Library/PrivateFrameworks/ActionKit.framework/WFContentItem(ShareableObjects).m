@implementation WFContentItem(ShareableObjects)

- (void)getShareableObjectOfTypes:()ShareableObjects options:completionHandler:
{
  id v8;
  Class v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  if ((a4 & 1) != 0)
  {
    v9 = NSClassFromString(CFSTR("UIImage"));
    if (v9)
    {
      v10 = v9;
      if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_255DE0628) & 1) == 0)
        class_addProtocol(v10, (Protocol *)&unk_255DE0628);
    }
  }
  if ((a3 & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke;
      v17[3] = &unk_24F8B1B70;
      v18 = v8;
      objc_msgSend(a1, "getObjectRepresentation:forClass:", v17, objc_opt_class());
      v11 = v18;
LABEL_16:

      goto LABEL_22;
    }
  }
  if ((a3 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v12, 0);

  }
  else
  {
    if ((a3 & 4) != 0 && (a4 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_msgSend(a1, "asset"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "mediaType"),
            v13,
            v14 == 1))
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke_2;
        v15[3] = &unk_24F8BADB8;
        v16 = v8;
        objc_msgSend(a1, "getObjectRepresentation:forClass:", v15, objc_opt_class());
        v11 = v16;
        goto LABEL_16;
      }
    }
    if ((a3 & 8) != 0)
      objc_msgSend(a1, "getFileRepresentation:forType:", v8, 0);
    else
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
LABEL_22:

}

@end
