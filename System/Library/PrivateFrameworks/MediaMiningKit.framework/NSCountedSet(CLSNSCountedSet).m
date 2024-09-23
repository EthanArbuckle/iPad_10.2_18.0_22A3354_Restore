@implementation NSCountedSet(CLSNSCountedSet)

- (void)enumerateObjectsSortedByCountUsingBlock:()CLSNSCountedSet ascending:
{
  void (**v6)(id, void *, _BYTE *, uint64_t);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__NSCountedSet_CLSNSCountedSet__enumerateObjectsSortedByCountUsingBlock_ascending___block_invoke;
  v25[3] = &unk_1E84F7F68;
  v8 = v7;
  v26 = v8;
  v27 = a1;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v25);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("count"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("object"), (_QWORD)v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v18, &v24, objc_msgSend(v19, "unsignedIntegerValue"));

      if (v24)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
