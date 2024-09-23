@implementation MPIdentifierSetWithMPCProtoItem

void ____MPIdentifierSetWithMPCProtoItem_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t quot;
  lldiv_t v20;
  uint64_t v21;
  const UInt8 *v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[2];

  v37[0] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[1];
  v5 = v4;
  v6 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke_2;
  v30[3] = &unk_24CAB89F0;
  v7 = v5;
  v31 = v7;
  objc_msgSend(v3, "setUniversalStoreIdentifiersWithBlock:", v30);
  if (v7)
    v8 = v7[2];
  else
    v8 = 0;
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  if (v9)
    v11 = (void *)*((_QWORD *)v9 + 1);
  else
    v11 = 0;
  v12 = v11;
  v13 = (__CFString *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v13)
    goto LABEL_29;
  v14 = *(_QWORD *)v33;
LABEL_9:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v14)
      objc_enumerationMutation(v12);
    v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v15);
    if (!v16)
    {
      if (!v8)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (*(_QWORD *)(v16 + 40) == v8)
      break;
LABEL_14:
    if (v13 == (__CFString *)++v15)
    {
      v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v13 = (__CFString *)v17;
      if (!v17)
      {
        v6 = MEMORY[0x24BDAC760];
        goto LABEL_29;
      }
      goto LABEL_9;
    }
  }
  v8 = *(_QWORD *)(v16 + 32);
LABEL_21:
  v18 = (char *)v37 + 1;
  quot = v8;
  v6 = MEMORY[0x24BDAC760];
  do
  {
    v20 = lldiv(quot, 10);
    quot = v20.quot;
    if (v20.rem >= 0)
      LOBYTE(v21) = v20.rem;
    else
      v21 = -v20.rem;
    *(v18 - 2) = v21 + 48;
    v22 = (const UInt8 *)(v18 - 2);
    --v18;
  }
  while (v20.quot);
  if (v8 < 0)
  {
    *(v18 - 2) = 45;
    v22 = (const UInt8 *)(v18 - 2);
  }
  v13 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)v37 - (char *)v22, 0x8000100u, 0);
LABEL_29:

  v23 = (__CFString *)*(id *)(a1 + 48);
  if (v13 == v23)
  {

    if (!v7)
      goto LABEL_38;
  }
  else
  {
    v24 = v23;
    v25 = -[__CFString isEqual:](v13, "isEqual:", v23);

    if (!v7 || !v25)
      goto LABEL_38;
  }
  if (v7[1])
  {
    if (!-[__CFString length](v13, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MPIdentifierSet *__MPIdentifierSetWithMPCProtoItem(_MPCProtoItem *__strong, _MPCProtoTracklist *__strong, NSString *__strong)_block_invoke");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MPRemotePlaybackQueue+MPCAdditions.m"), 478, CFSTR("Attempted to decode container identifier set without personID"));

    }
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke_3;
    v28[3] = &unk_24CAB89A8;
    v29 = v7;
    objc_msgSend(v3, "setPersonalStoreIdentifiersWithPersonID:block:", v13, v28);

  }
LABEL_38:

}

void ____MPIdentifierSetWithMPCProtoItem_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = v4;
  if (!v3 || (v6 = *(_QWORD *)(v3 + 32)) == 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v6 = *(_QWORD *)(v7 + 40);
      if (!v6)
        v6 = *(_QWORD *)(v7 + 24);
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v4, "setAdamID:", v6);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 24);
  else
    v9 = 0;
  objc_msgSend(v5, "setPurchasedAdamID:", v9);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(_QWORD *)(v10 + 40);
  else
    v11 = 0;
  objc_msgSend(v5, "setSubscriptionAdamID:", v11);
  v12 = *(_QWORD **)(a1 + 32);
  if (v12)
    v12 = (_QWORD *)v12[6];
  v13 = v12;
  objc_msgSend(v5, "setUniversalCloudLibraryID:", v13);

}

void ____MPIdentifierSetWithMPCProtoItem_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
    v4 = *(_QWORD *)(v2 + 8);
  else
    v4 = 0;
  v5 = v3;
  objc_msgSend(v3, "setCloudID:", v4);

}

@end
