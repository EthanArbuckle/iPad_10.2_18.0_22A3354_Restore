@implementation GenerateThumbnails

void __GenerateThumbnails_block_invoke(uint64_t a1)
{
  void *i;
  void *v3;
  unint64_t v4;
  id v5;
  unsigned int *v6;
  unsigned int v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _OWORD v29[4];
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v3, "length") >= 9)
        {
          v4 = 8;
          do
          {
            v5 = objc_retainAutorelease(v3);
            v6 = (unsigned int *)((char *)objc_msgSend(v5, "bytes") + v4);
            v7 = v6[1];
            if (v7 == -10236 || v7 == -16236)
            {
              v32 = 0;
              v30 = 0u;
              v31 = 0u;
              memset(v29, 0, sizeof(v29));
              DYTraceDecode_MTLTexture_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage((uint64_t)v29, (uint64_t)v6, *v6 - 36, 0);
              v9 = *(void **)(a1 + 40);
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)&v29[0]));
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

              v12 = *(void **)(a1 + 48);
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *((_QWORD *)&v30 + 1)));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

              v15 = *(void **)(*(_QWORD *)(a1 + 64) + 8);
              v24[0] = _NSConcreteStackBlock;
              v24[1] = 3221225472;
              v24[2] = __GenerateThumbnails_block_invoke_2;
              v24[3] = &unk_726308;
              v25 = *(id *)(a1 + 48);
              v16 = *(id *)(a1 + 56);
              v27 = v11;
              v28 = v16;
              v26 = v14;
              v17 = v11;
              v18 = v14;
              objc_msgSend(v15, "addOperationWithBlock:", v24);

            }
            v19 = *v6;
            if ((*((_BYTE *)v6 + 33) & 0x10) != 0)
            {
              v20 = *v6;
              do
              {
                v6 = (unsigned int *)((char *)v6 + v19);
                v19 = *v6;
                v20 += v19;
              }
              while ((*((_BYTE *)v6 + 33) & 0x20) == 0);
            }
            else
            {
              v20 = *v6;
            }
            v4 += v20;
          }
          while (v4 < (unint64_t)objc_msgSend(v5, "length"));
        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v23);
  }

}

void __GenerateThumbnails_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "count");
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 1));
  (*(void (**)(uint64_t, uint64_t, id, void *))(v2 + 16))(v2, v3, v5, v4);

}

@end
