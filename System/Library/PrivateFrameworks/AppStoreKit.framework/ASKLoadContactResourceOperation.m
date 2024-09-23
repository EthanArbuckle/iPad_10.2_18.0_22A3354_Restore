@implementation ASKLoadContactResourceOperation

+ (id)supportedScheme
{
  return CFSTR("contactimage");
}

- (ASKLoadContactResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  ASKLoadContactResourceOperation *v8;

  objc_msgSend(a3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingPercentEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ASKLoadContactResourceOperation initWithContactId:](self, "initWithContactId:", v7);
  return v8;
}

- (ASKLoadContactResourceOperation)initWithContactId:(id)a3
{
  id v4;
  ASKLoadContactResourceOperation *v5;
  uint64_t v6;
  NSString *contactId;
  CNAvatarImageRenderer *v8;
  CNAvatarImageRenderer *monogrammer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASKLoadContactResourceOperation;
  v5 = -[ASKLoadContactResourceOperation init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactId = v5->_contactId;
    v5->_contactId = (NSString *)v6;

    v8 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x1E0C97450]);
    monogrammer = v5->_monogrammer;
    v5->_monogrammer = v8;

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
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((-[ASKLoadContactResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C96708];
    v23[0] = v3;
    v23[1] = v4;
    v5 = *MEMORY[0x1E0C96700];
    v24 = *MEMORY[0x1E0C96890];
    v25 = v5;
    v6 = *MEMORY[0x1E0C966D0];
    v26 = v24;
    v27 = v6;
    v7 = *MEMORY[0x1E0C96898];
    v28 = *MEMORY[0x1E0C966C0];
    v29 = v7;
    v8 = *MEMORY[0x1E0C967C0];
    v30 = *MEMORY[0x1E0C966A8];
    v31 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[ASKLoadContactResourceOperation contactId](self, "contactId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v11, v9, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    if (v13 || !v12)
    {
      -[ASKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, v13);
    }
    else
    {
      objc_msgSend(v12, "imageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0DC3870]);
        objc_msgSend(v12, "imageData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithData:", v16);

        -[ASKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", v17, 0);
      }
      else
      {
        -[ASKLoadContactResourceOperation monogrammer](self, "monogrammer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __39__ASKLoadContactResourceOperation_main__block_invoke;
        v20[3] = &unk_1E9DB1D98;
        v20[4] = self;
        v19 = (id)objc_msgSend(v17, "renderAvatarsForContacts:handler:", v18, v20);

      }
    }

  }
}

void __39__ASKLoadContactResourceOperation_main__block_invoke(uint64_t a1, void *a2)
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
    +[ASKLoadContactResourceOperation mainScreenScale](ASKLoadContactResourceOperation, "mainScreenScale");
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
  -[ASKLoadContactResourceOperation contactId](self, "contactId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unable to contact photo with Id: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ASKLoadContactResourceOperationErrorDomain"), 560557415, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makePlatformUnsupportedError
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
  -[ASKLoadContactResourceOperation contactId](self, "contactId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unable to contact photo with Id: %@. This platform is not currently supported, see code comments in ASKLoadContactResourceOperation for more information"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ASKLoadContactResourceOperationErrorDomain"), 560557415, v6);
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
  v5[2] = __50__ASKLoadContactResourceOperation_mainScreenScale__block_invoke;
  v5[3] = &unk_1E9DB1DC0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__ASKLoadContactResourceOperation_mainScreenScale__block_invoke(uint64_t a1, void *a2)
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
