@implementation LPMetadataProviderSpecialization

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 7);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      v9 = objc_msgSend(v3, "allowedSpecializations", (_QWORD)v12);
      if ((objc_msgSend(v8, "specialization") & v9) != 0)
      {
        objc_msgSend(v8, "specializedMetadataProviderForURLWithContext:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      v9 = objc_msgSend(v3, "allowedSpecializations", (_QWORD)v12);
      if ((objc_msgSend(v8, "specialization") & v9) != 0)
      {
        objc_msgSend(v8, "specializedMetadataProviderForResourceWithContext:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

+ (id)specializedMetadataProviderForMetadata:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = objc_msgSend(v6, "allowedSpecializations", (_QWORD)v15);
      if ((objc_msgSend(v11, "specialization") & v12) != 0)
      {
        objc_msgSend(v11, "specializedMetadataProviderForMetadata:withContext:", v5, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v13 = 0;
  }

  return v13;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = objc_msgSend(v8, "allowedSpecializations", (_QWORD)v17);
        if ((objc_msgSend(v14, "specialization") & v15) != 0
          && (objc_msgSend(v14, "generateSpecializedMetadataForCompleteMetadata:withContext:completionHandler:", v7, v8, v9) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  return v11;
}

+ (unint64_t)specialization
{
  return 0;
}

- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (NSURL)URL
{
  return -[LPMetadataProviderSpecializationContext URL](self->_context, "URL");
}

- (LPMetadataProviderSpecializationDelegate)delegate
{
  return (LPMetadataProviderSpecializationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LPMetadataProviderSpecializationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (LPMetadataProviderSpecialization)initWithContext:(id)a3
{
  id v5;
  LPMetadataProviderSpecialization *v6;
  LPMetadataProviderSpecialization *v7;
  LPMetadataProviderSpecialization *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPMetadataProviderSpecialization;
  v6 = -[LPMetadataProviderSpecialization init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

@end
