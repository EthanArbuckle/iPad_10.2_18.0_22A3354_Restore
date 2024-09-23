@implementation CKLStreamLogStatsObserver

- (CKLStreamLogStatsObserver)initWithLogTypes:(unint64_t)a3
{
  CKLStreamLogStatsObserver *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *totalSizeByLine;
  NSMutableDictionary *v6;
  NSMutableDictionary *totalCountByLine;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKLStreamLogStatsObserver;
  v3 = -[CKLStreamObserver initWithLogTypes:](&v9, sel_initWithLogTypes_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    totalSizeByLine = v3->_totalSizeByLine;
    v3->_totalSizeByLine = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    totalCountByLine = v3->_totalCountByLine;
    v3->_totalCountByLine = v6;

  }
  return v3;
}

- (void)eventMatched:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v43;

  objc_msgSend_composedMessage(a3, a2, (uint64_t)a3);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v43, v4, (uint64_t)CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v5, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_intValue(v9, v10, v11);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_totalSizeByLine(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_intValue(v18, v19, v20);
  objc_msgSend_numberWithInt_(v13, v22, (v21 + v12));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_totalSizeByLine(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v27, (uint64_t)v23, v7);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_totalCountByLine(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_intValue(v33, v34, v35);
  objc_msgSend_numberWithInt_(v28, v37, (v36 + 1));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_totalCountByLine(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v38, v7);

}

- (void)finish
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  id v39;
  const char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  unint64_t i;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  unint64_t v55;
  const char *v56;
  uint64_t v57;
  unint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  id v67;
  const char *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  unint64_t j;
  const char *v76;
  void *v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  id obj;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend_totalSizeByLine(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v94, v98, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v95;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v95 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v16);
        objc_msgSend_totalCountByLine(self, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (int)objc_msgSend_intValue(v20, v21, v22);

        objc_msgSend_totalSizeByLine(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v26, v27, v17);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (int)objc_msgSend_intValue(v28, v29, v30);

        v32 = (void *)objc_opt_new();
        objc_msgSend_setFileAndLine_(v32, v33, v17);
        objc_msgSend_setCount_(v32, v34, v23);
        objc_msgSend_setSize_(v32, v35, v31);
        objc_msgSend_addObject_(v3, v36, (uint64_t)v32);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v94, v98, 16);
    }
    while (v14);
  }

  v37 = v3;
  objc_msgSend_sortUsingComparator_(v3, v38, (uint64_t)&unk_1E7830A58);
  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  v41 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v39, v40, (uint64_t)CFSTR("Biggest logging call sites by size:\nTotal Size\tAvg Size\tCallsite\n")));
  v44 = (const char *)objc_msgSend_UTF8String(v41, v42, v43);
  puts(v44);

  for (i = 0; i != 30; ++i)
  {
    if (i >= objc_msgSend_count(v37, v45, v46))
      break;
    objc_msgSend_objectAtIndexedSubscript_(v37, v45, i);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc(MEMORY[0x1E0CB3940]);
    v52 = objc_msgSend_size(v48, v50, v51);
    v55 = objc_msgSend_size(v48, v53, v54);
    v58 = v55 / objc_msgSend_count(v48, v56, v57);
    objc_msgSend_fileAndLine(v48, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v49, v62, (uint64_t)CFSTR("%ld\t%ld\t%@"), v52, v58, v61));
    v66 = (const char *)objc_msgSend_UTF8String(v63, v64, v65);
    puts(v66);

  }
  objc_msgSend_sortUsingComparator_(v37, v45, (uint64_t)&unk_1E7830A78);
  v67 = objc_alloc(MEMORY[0x1E0CB3940]);
  v69 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v67, v68, (uint64_t)CFSTR("Most frequent logging call sites:\nTotal Count\tTotal Size\tCallsite\n")));
  v72 = (const char *)objc_msgSend_UTF8String(v69, v70, v71);
  puts(v72);

  for (j = 0; j != 30; ++j)
  {
    if (j >= objc_msgSend_count(v37, v73, v74))
      break;
    objc_msgSend_objectAtIndexedSubscript_(v37, v76, j);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_alloc(MEMORY[0x1E0CB3940]);
    v81 = objc_msgSend_count(v77, v79, v80);
    v84 = objc_msgSend_size(v77, v82, v83);
    objc_msgSend_fileAndLine(v77, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v78, v88, (uint64_t)CFSTR("%ld\t%ld\t%@"), v81, v84, v87));
    v92 = (const char *)objc_msgSend_UTF8String(v89, v90, v91);
    puts(v92);

  }
}

- (NSMutableDictionary)totalSizeByLine
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTotalSizeByLine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)totalCountByLine
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTotalCountByLine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountByLine, 0);
  objc_storeStrong((id *)&self->_totalSizeByLine, 0);
}

@end
