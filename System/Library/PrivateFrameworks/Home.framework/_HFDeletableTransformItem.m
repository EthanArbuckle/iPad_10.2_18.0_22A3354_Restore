@implementation _HFDeletableTransformItem

- (BOOL)hf_canDeleteItem
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F04199C8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "hf_canDeleteItem");
  return v5;
}

- (id)hf_deleteItem
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_1F04199C8;
  v4 = v2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "hf_deleteItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
