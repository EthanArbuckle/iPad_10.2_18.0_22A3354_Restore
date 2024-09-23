@implementation GKLoadContactResourceOperation

- (GKLoadContactResourceOperation)initWithContactId:(id)a3
{
  id v4;
  GKLoadContactResourceOperation *v5;
  uint64_t v6;
  NSString *contactId;
  id v8;
  void *v9;
  uint64_t v10;
  CNAvatarImageRenderer *monogrammer;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLoadContactResourceOperation;
  v5 = -[GKLoadContactResourceOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactId = v5->_contactId;
    v5->_contactId = (NSString *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithSettings:", v9);
    monogrammer = v5->_monogrammer;
    v5->_monogrammer = (CNAvatarImageRenderer *)v10;

  }
  return v5;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  void *v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((-[GKLoadContactResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C96708];
    v21[0] = v3;
    v21[1] = v4;
    v5 = *MEMORY[0x1E0C96700];
    v22 = *MEMORY[0x1E0C96890];
    v23 = v5;
    v6 = *MEMORY[0x1E0C966D0];
    v24 = v22;
    v25 = v6;
    v7 = *MEMORY[0x1E0C96898];
    v26 = *MEMORY[0x1E0C966C0];
    v27 = v7;
    v8 = *MEMORY[0x1E0C967C0];
    v28 = *MEMORY[0x1E0C966A8];
    v29 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[GKLoadContactResourceOperation contactId](self, "contactId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v12, "imageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_gkImageWithCheckedData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[GKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", v16, 0);
LABEL_8:

        return;
      }
      -[GKLoadContactResourceOperation imageCreationError](self, "imageCreationError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, v17);
    }
    else
    {
      -[GKLoadContactResourceOperation monogrammer](self, "monogrammer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __38__GKLoadContactResourceOperation_main__block_invoke;
      v19[3] = &unk_1E59C4170;
      v19[4] = self;
      v18 = (id)objc_msgSend(v16, "renderAvatarsForContacts:handler:", v17, v19);
    }

    goto LABEL_8;
  }
}

void __38__GKLoadContactResourceOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLoadContactResourceOperation mainScreenScale](GKLoadContactResourceOperation, "mainScreenScale");
    objc_msgSend(v4, "imageForSize:scale:", 300.0, 300.0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didCompleteWithResource:error:", v6, 0);

  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "makeFetchError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCompleteWithResource:error:", 0, v4);
  }

}

- (id)imageCreationError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[GKLoadContactResourceOperation contactId](self, "contactId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unable to create photo with Id: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("GKLoadContactResourceOperationErrorDomain"), 560557415, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeFetchError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[GKLoadContactResourceOperation contactId](self, "contactId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unable to contact photo with Id: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("GKLoadContactResourceOperationErrorDomain"), 560557415, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)mainScreenScale
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "screens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__GKLoadContactResourceOperation_mainScreenScale__block_invoke;
  v5[3] = &unk_1E59C4198;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__GKLoadContactResourceOperation_mainScreenScale__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(a2, "scale");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24))
    *(double *)(v5 + 24) = v4;
  return result;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (CNAvatarImageRenderer)monogrammer
{
  return self->_monogrammer;
}

- (void)setMonogrammer:(id)a3
{
  objc_storeStrong((id *)&self->_monogrammer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
}

@end
