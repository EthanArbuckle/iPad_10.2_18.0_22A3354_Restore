@implementation UIPasteboard(MFAttachmentsPasteboardSupport)

- (void)mf_addPasteboardRepresentationsForAttachments:()MFAttachmentsPasteboardSupport
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;

  v11 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __94__UIPasteboard_MFAttachmentsPasteboardSupport__mf_addPasteboardRepresentationsForAttachments___block_invoke;
  v16 = &unk_1E5A659E0;
  v5 = v4;
  v17 = v5;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v13);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("mf_attachmentsData"), v11, v13, v14, v15, v16);
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, 0);
  objc_msgSend(a1, "setItems:", v8);

}

- (id)mf_getAttachmentsPasteboardRepresentations
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataForPasteboardType:inItemSet:", CFSTR("mf_attachmentsData"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v6, v2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
