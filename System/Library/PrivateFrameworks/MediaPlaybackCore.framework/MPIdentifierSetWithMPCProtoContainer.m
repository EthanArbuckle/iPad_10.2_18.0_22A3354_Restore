@implementation MPIdentifierSetWithMPCProtoContainer

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t quot;
  lldiv_t v21;
  uint64_t v22;
  const UInt8 *v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[3];

  v45[0] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[2];
  v5 = v4;
  v6 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_2;
  v38[3] = &unk_24CAB89F0;
  v7 = v5;
  v39 = v7;
  objc_msgSend(v3, "setUniversalStoreIdentifiersWithBlock:", v38);
  v36[0] = v6;
  v36[1] = 3221225472;
  v36[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_3;
  v36[3] = &unk_24CAB8A18;
  v8 = v7;
  v37 = v8;
  objc_msgSend(v3, "setRadioIdentifiersWithBlock:", v36);
  if (v8)
    v9 = v8[2];
  else
    v9 = 0;
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  if (v10)
    v12 = (void *)*((_QWORD *)v10 + 1);
  else
    v12 = 0;
  v13 = v12;
  v14 = (__CFString *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v14)
    goto LABEL_29;
  v15 = *(_QWORD *)v41;
LABEL_9:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v15)
      objc_enumerationMutation(v13);
    v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
    if (!v17)
    {
      if (!v9)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (*(_QWORD *)(v17 + 40) == v9)
      break;
LABEL_14:
    if (v14 == (__CFString *)++v16)
    {
      v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v14 = (__CFString *)v18;
      if (!v18)
      {
        v6 = MEMORY[0x24BDAC760];
        goto LABEL_29;
      }
      goto LABEL_9;
    }
  }
  v9 = *(_QWORD *)(v17 + 32);
LABEL_21:
  v19 = (char *)v45 + 1;
  quot = v9;
  v6 = MEMORY[0x24BDAC760];
  do
  {
    v21 = lldiv(quot, 10);
    quot = v21.quot;
    if (v21.rem >= 0)
      LOBYTE(v22) = v21.rem;
    else
      v22 = -v21.rem;
    *(v19 - 2) = v22 + 48;
    v23 = (const UInt8 *)(v19 - 2);
    --v19;
  }
  while (v21.quot);
  if (v9 < 0)
  {
    *(v19 - 2) = 45;
    v23 = (const UInt8 *)(v19 - 2);
  }
  v14 = (__CFString *)CFStringCreateWithBytes(0, v23, (char *)v45 - (char *)v23, 0x8000100u, 0);
LABEL_29:

  v24 = (__CFString *)*(id *)(a1 + 48);
  if (v14 == v24)
  {

  }
  else
  {
    v25 = v24;
    v26 = -[__CFString isEqual:](v14, "isEqual:", v24);

    if (!v26)
      goto LABEL_42;
  }
  if (v8)
    v27 = (void *)v8[4];
  else
    v27 = 0;
  v28 = v27;
  if (!objc_msgSend(v28, "length"))
  {
    if (v8)
    {
      v29 = v8[1];

      if (v29)
        goto LABEL_39;
      goto LABEL_43;
    }

    goto LABEL_49;
  }

LABEL_39:
  if (!-[__CFString length](v14, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MPIdentifierSet *__MPIdentifierSetWithMPCProtoContainer(_MPCProtoContainer *__strong, _MPCProtoTracklist *__strong, NSString *__strong)_block_invoke");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("MPRemotePlaybackQueue+MPCAdditions.m"), 445, CFSTR("Attempted to decode container identifier set without personID"));

  }
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_4;
  v34[3] = &unk_24CAB89A8;
  v35 = v8;
  objc_msgSend(v3, "setPersonalStoreIdentifiersWithPersonID:block:", v14, v34);

LABEL_42:
  if (!v8)
  {
LABEL_49:
    v30 = 0;
    goto LABEL_44;
  }
LABEL_43:
  v30 = (void *)v8[8];
LABEL_44:
  v31 = v30;
  objc_msgSend(v3, "setVersionHash:", v31);

}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (v3)
    v5 = *(void **)(v3 + 56);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setGlobalPlaylistID:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(_QWORD *)(v7 + 24);
  else
    v8 = 0;
  objc_msgSend(v4, "setAdamID:", v8);
  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
    v9 = (_QWORD *)v9[5];
  v10 = v9;
  objc_msgSend(v4, "setUniversalCloudLibraryID:", v10);

}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
    v4 = *(void **)(v2 + 48);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "setStationStringID:", v5);

}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v8, "setCloudAlbumID:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 8);
  else
    v7 = 0;
  objc_msgSend(v8, "setCloudID:", v7);

}

@end
