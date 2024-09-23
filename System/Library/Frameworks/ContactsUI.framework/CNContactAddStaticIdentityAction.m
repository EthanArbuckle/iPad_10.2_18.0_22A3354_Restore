@implementation CNContactAddStaticIdentityAction

+ (BOOL)stringIsValidIdentity:(id)a3
{
  return 1;
}

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_1_48345 != -1)
    dispatch_once(&supportedPasteboardTypes_cn_once_token_1_48345, &__block_literal_global_48346);
  return (id)supportedPasteboardTypes_cn_once_object_1_48347;
}

void __60__CNContactAddStaticIdentityAction_supportedPasteboardTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA5C88];
  v3[0] = *MEMORY[0x1E0CA5C20];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1_48347;
  supportedPasteboardTypes_cn_once_object_1_48347 = v1;

}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsPasteboardTypes:", v15))
    goto LABEL_17;
  v5 = objc_msgSend(v15, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForPasteboardType:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v6 == ++v7)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);

    v9 = (void *)v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend((id)objc_opt_class(), "stringIsValidIdentity:", v9) & 1) == 0)
  {

LABEL_17:
    -[CNContactAddStaticIdentityAction setChosenIdentity:](self, "setChosenIdentity:", CFSTR(" "));
    goto LABEL_18;
  }
  objc_opt_class();
  v11 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    goto LABEL_17;
  -[CNContactAddStaticIdentityAction setChosenIdentity:](self, "setChosenIdentity:", v13);

LABEL_18:
  -[CNContactAction delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionDidFinish:", self);

}

- (NSString)chosenIdentity
{
  return self->_chosenIdentity;
}

- (void)setChosenIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_chosenIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenIdentity, 0);
}

@end
