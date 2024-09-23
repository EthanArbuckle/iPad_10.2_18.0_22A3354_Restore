@implementation ProfileFrameWithCounterListsForProfileInfo

void __ProfileFrameWithCounterListsForProfileInfo_block_invoke(uint64_t a1)
{
  void *v2;
  os_signpost_id_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  id v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  const CATransform3D **v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  unint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  os_signpost_id_t spid;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  id v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "defaultCommandQueue"));
  v3 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, *(const void **)(a1 + 32));
  v4 = g_signpostLog;
  v5 = v4;
  v49 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Replayer-4-parallel", "FormatSampleData", buf, 2u);
  }
  spid = v3;

  v6 = *(void **)(a1 + 40);
  v50 = v2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "counterInfo"));
  v8 = *(void **)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = v10;
  v13 = v11;
  v14 = v8;
  v52 = v9;
  v15 = (unint64_t)objc_msgSend(v12, "count");
  v16 = v14;
  v17 = (unint64_t)objc_msgSend(v14, "length");
  v59 = 0u;
  v60 = 0u;
  *(_OWORD *)buf = 0u;
  v58 = 0u;
  v55 = v15;
  v56 = v15;
  v51 = v17 / (8 * v15);
  if (v15)
  {
    v18 = 0;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type")));
      v22 = (char *)objc_msgSend(v21, "unsignedIntegerValue");

      *(_QWORD *)&buf[(v18 >> 3) & 0x1FFFFFFFFFFFFFF8] |= (unint64_t)(v22 == (_BYTE *)&dword_0 + 1) << v18;
      v15 = v56;
      ++v18;
    }
    while (v56 != v18);
  }
  v48 = v13;
  v23 = objc_retainAutorelease(v16);
  v24 = objc_msgSend(v23, "bytes");
  v25 = v50;
  if (v51 >= 2)
  {
    v26 = v24;
    v46 = v23;
    v27 = 0;
    v28 = 0;
    v29 = v15 - 3;
    v30 = 1;
    v31 = &CATransform3DIdentity_ptr;
    while (1)
    {
      v32 = v26;
      v26 = (_QWORD *)((char *)v26 + v55 * 8);
      if (*v26 == *v32)
        break;

      v27 = 0;
      v28 = 0;
      if (v26[2])
        goto LABEL_16;
LABEL_27:
      if (++v30 == v51)
      {

        v25 = v50;
        v23 = v46;
        goto LABEL_29;
      }
    }
    if (v26[1] != v32[1])
    {

      v27 = 0;
    }
    if (!v26[2])
      goto LABEL_27;
    if (!v28)
    {
LABEL_16:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D array]((id)v31[281], "array"));
      objc_msgSend(v52, "addObject:", v28);
    }
    v53 = v26;
    if (!v27)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D array]((id)v31[281], "array"));
      objc_msgSend(v28, "addObject:", v27);
    }
    v33 = v27;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D arrayWithCapacity:]((id)v31[281], "arrayWithCapacity:", v15));
    objc_msgSend(v33, "addObject:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v52, "count") - 1));
    objc_msgSend(v34, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v28, "count") - 1));
    objc_msgSend(v34, "addObject:", v36);

    v54 = v33;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v33, "count") - 1));
    objc_msgSend(v34, "addObject:", v37);

    v26 = v53;
    if (v15 >= 4)
    {
      v38 = 0;
      do
      {
        v39 = v32[v55 + 3 + v38];
        if (((*(_QWORD *)&buf[((unint64_t)(v38 + 3) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v38 + 3)) & 1) != 0)
        {
          v40 = v32[v38 + 3];
          v41 = v39 >= v40;
          v42 = v39 - v40;
          if (v41)
            v39 = v42;
          else
            v39 = 0;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v39));
        objc_msgSend(v34, "addObject:", v43);

        ++v38;
      }
      while (v29 != v38);
    }

    v15 = v56;
    v27 = v54;
    v31 = &CATransform3DIdentity_ptr;
    goto LABEL_27;
  }
LABEL_29:

  v44 = g_signpostLog;
  v45 = v44;
  if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v45, OS_SIGNPOST_INTERVAL_END, spid, "Replayer-4-parallel", (const char *)&unk_4AAB5F, buf, 2u);
  }

}

@end
