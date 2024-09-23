@implementation ProfileFrame

void __ProfileFrame_block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *i;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  os_signpost_id_t spid;
  id v41;
  void *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint8_t buf[8];
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v2 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, *(const void **)(a1 + 32));
  v3 = g_signpostLog;
  v4 = v3;
  v44 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Replayer-4-parallel", "ProcessFrameData", buf, 2u);
  }
  spid = v2;

  v5 = *(void **)(a1 + 40);
  v43 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v7 = objc_msgSend(*(id *)(a1 + 56), "count");
  v8 = v5;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)objc_msgSend(v8, "length") >> 3));
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  v42 = v13;
  v15 = (char *)objc_msgSend(v13, "length") + (_QWORD)v14;
  v41 = objc_retainAutorelease(v9);
  v16 = (char *)objc_msgSend(v41, "bytes");
  v47 = (unint64_t)v15;
  if (&v12[2 * (_QWORD)v7] <= (_QWORD *)v15)
  {
    v17 = 0;
    v18 = 0;
    v45 = 2 * (_QWORD)v7;
    v46 = v7;
    v19 = 8 * (_QWORD)v7;
    v20 = -1;
    v51 = 8 * (_QWORD)v7;
    v55 = v10;
    do
    {
      v21 = 0;
      v22 = 0;
      for (i = v12;
            *(_QWORD *)((char *)i + v19) == *i && *(_QWORD *)((char *)i + v19 + 8) == i[1];
            i = (_QWORD *)((char *)i + v19))
      {
        v21 = *(_QWORD *)((char *)i + v19 + 24) + v21 - i[3];
        ++v22;
      }
      if (v20 == *v12)
        v25 = v18;
      else
        v25 = 0;
      if (v20 != *v12)
        ++v17;
      v49 = *v12;
      v50 = v17;
      v48 = &v16[8 * (_QWORD)v7];
      if (v22)
      {
        v26 = 0;
        v27 = (double)v21;
        v28 = (double)(unint64_t)(*(_QWORD *)&v16[8 * (_QWORD)v7 + 24] - *((_QWORD *)v16 + 3));
        v52 = v17 - 1;
        v53 = v25;
        v54 = v22;
        do
        {
          v29 = (_QWORD *)((char *)v12 + v19);
          v30 = (double)(unint64_t)(*(_QWORD *)((char *)v12 + v19 + 24) - v12[3]) / v27 * v28;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v52, spid));
          *(_QWORD *)buf = v31;
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v25));
          v57 = v32;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
          v58 = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v30));
          v59 = v34;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v29[4]));
          v60 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v29[5]));
          v61 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 6));
          objc_msgSend(v55, "addObjectsFromArray:", v37);

          v25 = v53;
          v19 = v51;
          ++v26;
          v12 = v29;
        }
        while (v54 != v26);
      }
      else
      {
        v29 = v12;
      }
      v7 = v46;
      v16 = &v48[8 * (_QWORD)v46];
      v18 = v25 + 1;
      v12 = &v29[(_QWORD)v46];
      v20 = v49;
      v17 = v50;
      v10 = v55;
    }
    while ((unint64_t)&v12[v45] <= v47);
  }

  objc_msgSend(v43, "setArray:", v10);
  v38 = g_signpostLog;
  v39 = v38;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v39, OS_SIGNPOST_INTERVAL_END, spid, "Replayer-4-parallel", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

@end
