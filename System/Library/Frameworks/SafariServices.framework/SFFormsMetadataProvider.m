@implementation SFFormsMetadataProvider

- (SFFormsMetadataProvider)initWithFrameHandleToFormsDictionary:(id)a3
{
  id v4;
  SFFormsMetadataProvider *v5;
  uint64_t v6;
  NSDictionary *frameHandleToForms;
  SFFormsMetadataProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormsMetadataProvider;
  v5 = -[SFFormsMetadataProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    frameHandleToForms = v5->_frameHandleToForms;
    v5->_frameHandleToForms = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)formCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSDictionary allValues](self->_frameHandleToForms, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)enumerateFormsUsingBlock:(id)a3
{
  id v4;
  NSDictionary *frameHandleToForms;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  frameHandleToForms = self->_frameHandleToForms;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SFFormsMetadataProvider_enumerateFormsUsingBlock___block_invoke;
  v7[3] = &unk_1E4ABFF48;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](frameHandleToForms, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __52__SFFormsMetadataProvider_enumerateFormsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      if (*a4)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameHandleToForms, 0);
}

@end
