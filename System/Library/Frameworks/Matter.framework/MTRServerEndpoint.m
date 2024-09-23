@implementation MTRServerEndpoint

- (MTRServerEndpoint)initWithEndpointID:(id)a3 deviceTypes:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  MTRServerEndpoint *v17;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  v13 = v10;
  if (v10 >= 0x10000)
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v13;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided too-large endpoint ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_16;
    goto LABEL_15;
  }
  if (!v10)
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided invalid endpoint ID: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v10 == 0xFFFF)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0xFFFF;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "MTRServerEndpoint provided invalid endpoint ID: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_16;
    goto LABEL_15;
  }
  if (objc_msgSend_count(v7, v11, v12))
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    self = sub_2340DC68C(self, v6, v7, v21, MEMORY[0x24BDBD1A8]);

    v17 = self;
    goto LABEL_17;
  }
  sub_234117B80(0, "NotSpecified");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "MTRServerEndpoint needs a non-empty list of device types", buf, 2u);
  }

  if (sub_234114844(1u))
LABEL_15:
    sub_2341147D0(0, 1);
LABEL_16:
  v17 = 0;
LABEL_17:

  return v17;
}

+ (id)rootNodeEndpoint
{
  MTRServerEndpoint *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = [MTRServerEndpoint alloc];
  objc_msgSend_set(MEMORY[0x24BDBCF20], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_2340DC68C(v2, &unk_250596D38, MEMORY[0x24BDBD1A8], v5, MEMORY[0x24BDBD1A8]);

  return v6;
}

- (void)addAccessGrant:(id)a3
{
  const char *v4;
  id v5;

  v5 = a3;
  objc_msgSend_addObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_2340DCA0C((uint64_t)self);

}

- (void)removeAccessGrant:(id)a3
{
  const char *v4;
  id v5;

  v5 = a3;
  objc_msgSend_removeObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_2340DCA0C((uint64_t)self);

}

- (BOOL)addServerCluster:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  NSMutableArray *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int isEqual;
  const char *v26;
  uint64_t v27;
  unsigned __int16 v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unsigned __int16 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  unsigned __int16 v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  _BYTE v65[10];
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (!WeakRetained)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v13 = self->_serverClusters;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v60, v68, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v61 != v18)
            objc_enumerationMutation(v13);
          objc_msgSend_clusterID(*(void **)(*((_QWORD *)&v60 + 1) + 8 * i), v15, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clusterID(v4, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v20, v24, (uint64_t)v23);

          if (isEqual)
          {
            sub_234117B80(0, "NotSpecified");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_clusterID(v4, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend_unsignedLongLongValue(v34, v35, v36) >> 16;
              objc_msgSend_clusterID(v4, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend_unsignedLongLongValue(v40, v41, v42);
              v46 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v44, v45);
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v65 = v37;
              *(_WORD *)&v65[4] = 1024;
              *(_DWORD *)&v65[6] = v43;
              v66 = 2048;
              v67 = v46;
              _os_log_impl(&dword_233BF3000, v31, OS_LOG_TYPE_ERROR, "Cannot add second cluster with ID 0x%04X_%04X on endpoint %llu", buf, 0x18u);

            }
            if (sub_234114844(1u))
            {
              objc_msgSend_clusterID(v4, v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unsignedLongLongValue(v49, v50, v51);
              objc_msgSend_clusterID(v4, v52, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unsignedLongLongValue(v54, v55, v56);
              objc_msgSend_unsignedLongLongValue(self->_endpointID, v57, v58);
              sub_2341147D0(0, 1);

            }
            goto LABEL_21;
          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v60, v68, 16);
        if (v17)
          continue;
        break;
      }
    }

    v28 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v26, v27);
    if ((objc_msgSend_addToEndpoint_(v4, v29, v28) & 1) != 0)
    {
      objc_msgSend_addObject_(self->_serverClusters, v30, (uint64_t)v4);
      v12 = 1;
      goto LABEL_22;
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v7, v8);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v65 = v9;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "Cannot add cluster on endpoint %llu which is already in use", buf, 0xCu);
  }

  if (!sub_234114844(1u))
    goto LABEL_21;
  objc_msgSend_unsignedLongLongValue(self->_endpointID, v10, v11);
  sub_2341147D0(0, 1);
  v12 = 0;
LABEL_22:

  return v12;
}

- (BOOL)associateWithController:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (WeakRetained)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_uniqueIdentifier(v4, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(WeakRetained, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerEndpoint with controller %@; already associated with controller %@",
        buf,
        0x16u);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_uniqueIdentifier(v4, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(WeakRetained, v16, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2341147D0(0, 1);

    }
    goto LABEL_9;
  }
  if ((sub_2340DD14C((uint64_t)self, v4) & 1) == 0)
  {
    objc_msgSend_invalidate(self, v18, v19);
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v20 = 1;
LABEL_10:

  return v20;
}

- (void)registerMatterEndpoint
{
  unsigned __int16 i;
  unsigned int v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int16 v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableArray *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25[2];
  uint64_t v26[2];
  uint8_t v27[16];
  uint8_t buf[8];
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 322);
  for (i = 0; ; ++i)
  {
    v4 = i;
    if (sub_233D54EC4(i) == 0xFFFF)
      break;
    if (v4 >= 0xFD)
    {
      sub_234117B80(0, "NotSpecified");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "We somehow ran out of endpoint slots.", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      return;
    }
  }
  *(_QWORD *)buf = 0;
  v29 = 0;
  v30 = 0;
  v8 = objc_msgSend_unsignedLongLongValue(self->_endpointID, v5, v6);
  sub_233CAF22C(v27, (uint64_t)self->_matterDataVersions.__ptr_.__value_, self->_matterEndpointMetadata.clusterCount);
  value = self->_matterDeviceTypes.__ptr_.__value_;
  v12 = objc_msgSend_count(self->_deviceTypes, v10, v11);
  sub_233CAF22C(v25, (uint64_t)value, v12);
  sub_233CAF22C(v26, v25[0], v25[1]);
  sub_233D5430C(i, v8, (unsigned __int8 *)&self->_matterEndpointMetadata, (uint64_t)v27, v26[0], v26[1], 0xFFFF, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    sub_234117B80(0, "NotSpecified");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_ERROR, "Unexpected failure to define our Matter endpoint", v27, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  self->_endpointIndex.var0.__val_ = i;
  self->_endpointIndex.__engaged_ = 1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_serverClusters;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v31, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend_registerMatterCluster(*(void **)(*((_QWORD *)&v21 + 1) + 8 * j), v16, v17, (_QWORD)v21);
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v21, v31, 16);
    }
    while (v18);
  }

}

- (void)unregisterMatterEndpoint
{
  NSMutableArray *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 360);
  if (self->_endpointIndex.__engaged_)
  {
    sub_233D54608(self->_endpointIndex.var0.__val_);
    if (self->_endpointIndex.__engaged_)
      self->_endpointIndex.__engaged_ = 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_serverClusters;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend_unregisterMatterCluster(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++), v5, v6, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v10, v14, 16);
    }
    while (v7);
  }

}

- (void)invalidate
{
  NSMutableArray *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSSet *v12;
  NSSet *matterAccessGrants;
  EmberAfCluster *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  unsigned int *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_serverClusters;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend_invalidate(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v9++), v5, v6, (_QWORD)v17);
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend_set(MEMORY[0x24BDBCF20], v10, v11);
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  matterAccessGrants = self->_matterAccessGrants;
  self->_matterAccessGrants = v12;

  self->_matterEndpointMetadata.clusterCount = 0;
  value = self->_matterClusterMetadata.__ptr_.__value_;
  self->_matterClusterMetadata.__ptr_.__value_ = 0;
  self->_matterEndpointMetadata.cluster = 0;
  if (value)
    MEMORY[0x23493E6EC](value, 0x10F0C80AC0EDF25);
  v15 = self->_matterDeviceTypes.__ptr_.__value_;
  self->_matterDeviceTypes.__ptr_.__value_ = 0;
  if (v15)
    MEMORY[0x23493E6EC](v15, 0x1000C8090D0E795);
  v16 = self->_matterDataVersions.__ptr_.__value_;
  self->_matterDataVersions.__ptr_.__value_ = 0;
  if (v16)
    MEMORY[0x23493E6EC](v16, 0x1000C8052888210);
  objc_storeWeak((id *)&self->_deviceController, 0);
}

- (id)matterAccessGrantsForCluster:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  int isEqual;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerEndpoint.mm", 393);
  objc_msgSend_allObjects(self->_matterAccessGrants, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_mutableCopy(v7, v8, v9);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_serverClusters;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v28, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend_clusterID(v18, v13, v14, (_QWORD)v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)v4);

        if (isEqual)
        {
          objc_msgSend_matterAccessGrants(v18, v13, v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v10, v23, (uint64_t)v22);

        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v28, v32, 16);
    }
    while (v15);
  }

  v26 = (void *)objc_msgSend_copy(v10, v24, v25);
  return v26;
}

- (NSArray)accessGrants
{
  uint64_t v2;

  return (NSArray *)objc_msgSend_allObjects(self->_accessGrants, a2, v2);
}

- (NSArray)serverClusters
{
  uint64_t v2;

  return (NSArray *)(id)objc_msgSend_copy(self->_serverClusters, a2, v2);
}

- (id)description
{
  uint64_t v2;
  void *v3;
  unsigned __int16 v4;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend_unsignedLongLongValue(self->_endpointID, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<MTRServerEndpoint id %u>"), v4);
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (NSArray)deviceTypes
{
  return self->_deviceTypes;
}

- (NSSet)matterAccessGrants
{
  return self->_matterAccessGrants;
}

- (void).cxx_destruct
{
  unsigned int *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  EmberAfCluster *v5;

  objc_storeStrong((id *)&self->_matterAccessGrants, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  value = self->_matterDataVersions.__ptr_.__value_;
  self->_matterDataVersions.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x23493E6EC](value, 0x1000C8052888210);
  v4 = self->_matterDeviceTypes.__ptr_.__value_;
  self->_matterDeviceTypes.__ptr_.__value_ = 0;
  if (v4)
    MEMORY[0x23493E6EC](v4, 0x1000C8090D0E795);
  v5 = self->_matterClusterMetadata.__ptr_.__value_;
  self->_matterClusterMetadata.__ptr_.__value_ = 0;
  if (v5)
    MEMORY[0x23493E6EC](v5, 0x10F0C80AC0EDF25);
  objc_destroyWeak((id *)&self->_deviceController);
  objc_storeStrong((id *)&self->_serverClusters, 0);
  objc_storeStrong((id *)&self->_accessGrants, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_BYTE *)self + 74) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_BYTE *)self + 72) = 0;
  return self;
}

@end
