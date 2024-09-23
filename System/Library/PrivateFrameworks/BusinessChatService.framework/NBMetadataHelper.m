@implementation NBMetadataHelper

void __39___NBMetadataHelper_phoneNumberDataMap__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "jsonObjectFromZippedDataWithBytes:compressedLength:expandedLength:", &kPhoneNumberMetaData, 47081, 315645);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v1;

}

void __32___NBMetadataHelper_CCode2CNMap__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "CN2CCodeMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)qword_253EC0A00;
  qword_253EC0A00 = (uint64_t)v2;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend((id)qword_253EC0A00, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

}

@end
