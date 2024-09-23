@implementation FCAVAssetKeyFetchRequest

- (id)initWithContentKeySession:(void *)a3 keyURIs:(char)a4 forceRefresh:(void *)a5 completionHandler:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v10 = a2;
  v11 = a3;
  v12 = a5;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)FCAVAssetKeyFetchRequest;
    v13 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 2, a2);
      v14 = objc_msgSend(v11, "mutableCopy");
      v15 = a1[3];
      a1[3] = (id)v14;

      *((_BYTE *)a1 + 8) = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = a1[4];
      a1[4] = (id)v16;

      v18 = objc_msgSend(v12, "copy");
      v19 = a1[5];
      a1[5] = (id)v18;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_errorsEncountered, 0);
  objc_storeStrong((id *)&self->_remainingKeyURIs, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
}

@end
