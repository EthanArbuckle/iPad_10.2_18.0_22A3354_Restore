@implementation FetchResourceObjectBatch

void __FetchResourceObjectBatch_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  id Attributes;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  unsigned int **v32;
  unsigned int **v33;
  uint64_t v34;
  id *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  int v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  void *v57;
  id v58;
  id v59;
  id obj;
  id obja;
  id v62;
  uint64_t v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  uint64_t v73;
  int v74;
  void *v75;
  unsigned int **v76[3];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[2];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  char v93;
  _BYTE v94[128];

  v2 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 8 * *(_QWORD *)(a1 + 56));
  v62 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v59 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v58 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v53 = objc_retainAutorelease(v2);
  v56 = objc_msgSend(v53, "mutableBytes");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 288), "waitUntilDownloadCapacity");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  objc_msgSend(*(id *)(v3 + 24), "releaseBuffer");
  objc_msgSend(*(id *)(v3 + 16), "waitUntilCapacity");
  v63 = a1;
  v64 = objc_alloc_init((Class)NSMutableDictionary);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v88 != v6)
          objc_enumerationMutation(obj);
        Attributes = GetAttributes(*(_QWORD *)(v63 + 64), *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(Attributes);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("functionIndex")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "unsignedIntValue")));
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", v11));
        if (!v12)
        {
          v12 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v12, v11);
        }
        v13 = objc_msgSend(v9, "mutableCopy");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)i + v5));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("requestStreamIndex"));

        objc_msgSend(v12, "addObject:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v62, "addObject:", v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      v5 += (uint64_t)i;
    }
    while (v4);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allKeys"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingSelector:", "compare:"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v63 + 64) + 8) + 22480)));
  v19 = objc_msgSend(v17, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, objc_msgSend(v17, "count"), 1024, &__block_literal_global_6096);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", v19, (_BYTE *)objc_msgSend(v17, "count") - v19));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v20));

  v85[0] = &v93;
  v85[1] = 1024;
  v86 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 4096);
  v55 = *(id *)(*(_QWORD *)(*(_QWORD *)(v63 + 64) + 8) + 24);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v54 = v22;
  v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v82;
    v50 = *(_QWORD *)v82;
    do
    {
      v25 = 0;
      v51 = v23;
      do
      {
        if (*(_QWORD *)v82 != v24)
          objc_enumerationMutation(v54);
        v52 = v25;
        v57 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:"));
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        obja = v26;
        v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v78;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(_QWORD *)v78 != v28)
                objc_enumerationMutation(obja);
              v30 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
              v31 = objc_autoreleasePoolPush();
              objc_msgSend(v86, "setLength:", 0);
              v76[0] = (unsigned int **)v85;
              v32 = (unsigned int **)v59;
              v76[1] = v32;
              v33 = (unsigned int **)v58;
              v76[2] = v33;
              v34 = *(_QWORD *)(v63 + 64);
              v35 = *(id **)(v34 + 8);
              v75 = 0;
              v36 = HarvestResourceObject(v35, (apr_pool_t *)(v34 + 96), v30, v76, &v75);
              v37 = v75;
              if ((v36 & 1) == 0
                && objc_msgSend(obja, "count") == (char *)&dword_0 + 1
                && (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("object"))),
                    v39 = objc_msgSend(v38, "unsignedLongLongValue") == (id)-1026,
                    v38,
                    v39))
              {
                (*(void (**)(void))(*(_QWORD *)(v63 + 48) + 16))();
                v40 = 0;
              }
              else
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("requestStreamIndex")));
                v42 = objc_msgSend(v41, "unsignedIntegerValue");

                v43 = objc_msgSend(v86, "copy");
                objc_msgSend(v62, "setObject:atIndexedSubscript:", v43, v42);

                v56[(_QWORD)v42] = objc_msgSend(v57, "unsignedLongLongValue");
                v40 = 1;
              }

              objc_autoreleasePoolPop(v31);
              if (!v40)
              {

                v49 = v54;
                goto LABEL_32;
              }
            }
            v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
            if (v27)
              continue;
            break;
          }
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.gputools.replay"), CFSTR("FetchResourceObjectBatch")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "commandBuffer"));
        objc_msgSend(v45, "setLabel:", v44);

        objc_msgSend(v55, "commitCommandBuffer");
        v25 = v52 + 1;
        v24 = v50;
      }
      while ((id)(v52 + 1) != v51);
      v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    }
    while (v23);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "commandBuffer"));
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = __FetchResourceObjectBatch_block_invoke_3;
  v65[3] = &unk_726438;
  v72 = *(_OWORD *)(v63 + 64);
  v74 = *(_DWORD *)(v63 + 80);
  v73 = *(_QWORD *)(v63 + 56);
  v66 = v59;
  v67 = v62;
  v68 = v53;
  v69 = v58;
  v70 = *(id *)(v63 + 40);
  v71 = *(id *)(v63 + 48);
  objc_msgSend(v46, "addCompletedHandler:", v65);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.gputools.replay"), CFSTR("FetchResourceObjectBatchFinish")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "commandBuffer"));
  objc_msgSend(v48, "setLabel:", v47);

  objc_msgSend(v55, "commitCommandBuffer");
  v49 = v66;
LABEL_32:

}

void __FetchResourceObjectBatch_block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  int v25;

  v1 = *(void **)(a1 + 72);
  v2 = *(void **)(*(_QWORD *)(a1 + 80) + 264);
  v3 = *(_DWORD *)(a1 + 104);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v16 = *(_OWORD *)(a1 + 88);
  v8 = *(id *)(a1 + 32);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __FetchResourceObjectBatchReplyOperation_block_invoke;
  v17[3] = &unk_7264B0;
  v25 = v3;
  v24 = v16;
  v18 = v8;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  v23 = v1;
  v9 = v8;
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  v14 = v23;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v17));

  objc_msgSend(v2, "addOperation:", v15);
}

int64_t __FetchResourceObjectBatch_block_invoke_2(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a2, "compare:", a3);
}

@end
