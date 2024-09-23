@implementation POPodcastSyncHandler

- (POPodcastSyncHandler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  POPodcastSyncHandler *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)POPodcastSyncHandler;
  v6 = -[POPodcastSyncHandler init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnchorToRevision_(v6, v8, (uint64_t)v7, v9, v10);

  }
  return v6;
}

- (id)validity
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(PODataSource, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_validity(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  POLogInitIfNeeded();
  if (POLogContextSync)
    v11 = POLogContextSync;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_217352000, v11, OS_LOG_TYPE_INFO, "Data source's validity is %@", (uint8_t *)&v13, 0xCu);
  }
  return v10;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char isPodcastsInstalled;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char isEqual;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  id v98;
  unint64_t v99;
  __CFString *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[128];
  uint8_t buf[4];
  unint64_t v107;
  __int16 v108;
  unint64_t v109;
  __int16 v110;
  id v111;
  __int16 v112;
  id v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend_isEqual_(v13, v15, (uint64_t)CFSTR("com.apple.media.podcasts"), v16, v17)
    && (v11 | v12
     || (objc_msgSend_sharedInstance(PODataSource, v18, v19, v20, v21),
         v22 = (void *)objc_claimAutoreleasedReturnValue(),
         isPodcastsInstalled = objc_msgSend_isPodcastsInstalled(v22, v23, v24, v25, v26),
         v22,
         (isPodcastsInstalled & 1) != 0)))
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v28 = POLogContextSync;
    else
      v28 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v107 = v11;
      v108 = 2112;
      v109 = v12;
      v110 = 2112;
      v111 = v13;
      v112 = 2112;
      v113 = v14;
      _os_log_impl(&dword_217352000, v28, OS_LOG_TYPE_INFO, "Begin sync with anchor getting called, anchor is %@, validity is %@, key is %@ and beginInfo is %@", buf, 0x2Au);
    }
    objc_msgSend_validity(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_((void *)v12, v34, (uint64_t)v33, v35, v36);

    v99 = v12;
    v98 = v14;
    if ((isEqual & 1) == 0)
    {
      POLogInitIfNeeded();
      if (POLogContextSync)
        v42 = POLogContextSync;
      else
        v42 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v47 = v42;
        objc_msgSend_validity(self, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v107 = (unint64_t)v52;
        _os_log_impl(&dword_217352000, v47, OS_LOG_TYPE_INFO, "Podcasts are resetting with validity %@", buf, 0xCu);

      }
      objc_msgSend_validity(self, v43, v44, v45, v46);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resetWithValidity_(v14, v54, (uint64_t)v53, v55, v56);

      v11 = (unint64_t)CFSTR("0");
    }
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    objc_msgSend_sharedInstance(PODataSource, v38, v39, v40, v41);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (__CFString *)v11;
    v62 = objc_msgSend_longLongValue((void *)v11, v58, v59, v60, v61);
    objc_msgSend_podcastRevisionsSinceAnchor_(v57, v63, v62, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v101, (uint64_t)v105, 16);
    if (v68)
    {
      v73 = v68;
      v74 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v73; ++i)
        {
          if (*(_QWORD *)v102 != v74)
            objc_enumerationMutation(v66);
          v76 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          v77 = (void *)MEMORY[0x24BDD17C8];
          v78 = objc_msgSend_revisionID(v76, v69, v70, v71, v72);
          objc_msgSend_stringWithFormat_(v77, v79, (uint64_t)CFSTR("%lu"), v80, v81, v78);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anchorToRevision(self, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v87, v88, (uint64_t)v76, (uint64_t)v82, v89);

        }
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v101, (uint64_t)v105, 16);
      }
      while (v73);
    }

    POLogInitIfNeeded();
    if (POLogContextSync)
      v90 = POLogContextSync;
    else
      v90 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = v90;
      objc_msgSend_anchorToRevision(self, v92, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v107 = (unint64_t)v96;
      _os_log_impl(&dword_217352000, v91, OS_LOG_TYPE_INFO, "Anchors to revisions are %@", buf, 0xCu);

    }
    v12 = v99;
    v11 = (unint64_t)v100;
    v14 = v98;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v97 = POLogContextSync;
    else
      v97 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217352000, v97, OS_LOG_TYPE_INFO, "Nil anchor, nil validity, and podcasts isn't installed.  Nothing to sync.", buf, 2u);
    }
  }

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  uint8_t buf[4];
  __CFString *v103;
  __int16 v104;
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v11 = a4;
  if (!v6)
    v6 = CFSTR("0");
  objc_msgSend_anchorToRevision(self, v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = objc_msgSend_revisionID(v16, v17, v18, v19, v20);
    objc_msgSend_stringWithFormat_(v21, v23, (uint64_t)CFSTR("%lu"), v24, v25, v22 + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPostAnchor_(v11, v27, (uint64_t)v26, v28, v29);

    v34 = objc_msgSend_revisionType(v16, v30, v31, v32, v33) == 2;
    objc_msgSend_setIsDelete_(v11, v35, v34, v36, v37);
    if ((objc_msgSend_isDelete(v11, v38, v39, v40, v41) & 1) != 0)
    {
      objc_msgSend_deletedModelObject(v16, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SAMPCollection(v46, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_(v11, v52, (uint64_t)v51, v53, v54);
      goto LABEL_11;
    }
    objc_msgSend_sharedInstance(PODataSource, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectID(v16, v91, v92, v93, v94);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_domainObjectWithUUID_(v46, v95, (uint64_t)v51, v96, v97);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_(v11, v98, (uint64_t)v87, v99, v100);
  }
  else
  {
    objc_msgSend_anchorToRevision(self, v17, v18, v19, v20);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sortedArrayUsingComparator_(v60, v61, (uint64_t)&unk_24D744FC0, v62, v63);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lastObject(v46, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v68;
    if (!v68)
      goto LABEL_11;
    v73 = objc_msgSend_longLongValue(v68, v69, v70, v71, v72);
    if (v73 <= objc_msgSend_longLongValue(v6, v74, v75, v76, v77))
      goto LABEL_11;
    v82 = (void *)MEMORY[0x24BDD17C8];
    v83 = objc_msgSend_longLongValue(v6, v78, v79, v80, v81);
    objc_msgSend_stringWithFormat_(v82, v84, (uint64_t)CFSTR("%lli"), v85, v86, v83 + 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPostAnchor_(v11, v88, (uint64_t)v87, v89, v90);
  }

LABEL_11:
  POLogInitIfNeeded();
  if (POLogContextSync)
    v101 = POLogContextSync;
  else
    v101 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v103 = v6;
    v104 = 2112;
    v105 = v11;
    _os_log_impl(&dword_217352000, v101, OS_LOG_TYPE_INFO, "Get change getting called with anchor %@, changeInfo %@", buf, 0x16u);
  }

}

- (void)syncDidEnd
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  POLogInitIfNeeded();
  if (POLogContextSync)
    v3 = POLogContextSync;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_217352000, v3, OS_LOG_TYPE_INFO, "syncDidEnd getting called", v7, 2u);
  }
  objc_msgSend_setAnchorToRevision_(self, v4, 0, v5, v6);
}

- (NSMutableDictionary)anchorToRevision
{
  return self->_anchorToRevision;
}

- (void)setAnchorToRevision:(id)a3
{
  objc_storeStrong((id *)&self->_anchorToRevision, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorToRevision, 0);
}

@end
