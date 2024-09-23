@implementation CNContactBufferDecoderFactory

+ (id)decoderForFetchRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  CNContactBufferDecoder *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "effectiveKeysToFetch", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "_cn_requiredKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionKeyVector:", v11);

        objc_msgSend(v10, "_cn_optionalKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionKeyVector:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  +[CNAccessAuthorization removeUnavailableKeysFromContactKeyVector:](CNAccessAuthorization, "removeUnavailableKeysFromContactKeyVector:", v4);
  v13 = -[CNContactBufferDecoder initWithKeyDescriptorToMakeAvailable:mutableResults:]([CNContactBufferDecoder alloc], "initWithKeyDescriptorToMakeAvailable:mutableResults:", v4, objc_msgSend(v3, "mutableObjects"));

  return v13;
}

@end
