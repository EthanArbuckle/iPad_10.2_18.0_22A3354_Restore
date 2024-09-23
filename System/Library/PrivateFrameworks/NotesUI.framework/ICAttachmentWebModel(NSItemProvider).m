@implementation ICAttachmentWebModel(NSItemProvider)

- (id)itemProvider
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synapseData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
    goto LABEL_10;
  v12 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0700]), "initWithData:error:", v3, &v12);
  v5 = v12;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICAttachmentWebModel(NSItemProvider) itemProvider].cold.1((uint64_t)v5, v6);

  }
  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v4);
    objc_msgSend(a1, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "registerObject:visibility:", v9, 0);

  }
  else
  {
LABEL_10:
    v11.receiver = a1;
    v11.super_class = (Class)&off_1EED462C0;
    objc_msgSendSuper2(&v11, sel_itemProvider);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)itemProvider
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Encountered error while trying to deserialize synapse content item: %@", (uint8_t *)&v2, 0xCu);
}

@end
