@implementation MTRServerCluster

- (MTRServerCluster)initWithClusterID:(id)a3 revision:(id)a4
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
  MTRServerCluster *v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  v13 = v10;
  if (HIDWORD(v10))
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v13;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRServerCluster provided too-large cluster ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_20;
    goto LABEL_19;
  }
  if (WORD1(v10) > 0xFFF4u
    || ((__int16)v10 < 0 || WORD1(v10)) && (!WORD1(v10) || (unsigned __int16)(v10 + 1024) >= 0x3FFu))
  {
    sub_234117B80(0, "NotSpecified");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v13;
      _os_log_impl(&dword_233BF3000, v16, OS_LOG_TYPE_ERROR, "MTRServerCluster provided invalid cluster ID: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_20;
    goto LABEL_19;
  }
  if ((_DWORD)v10 == 29)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "Should be using newDescriptorCluster to initialize an MTRServerCluster for Descriptor", buf, 2u);
    }

    if (!sub_234114844(1u))
      goto LABEL_20;
    goto LABEL_19;
  }
  v21 = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  if ((unint64_t)(v21 - 0x10000) > 0xFFFFFFFFFFFF0000)
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = (MTRServerCluster *)sub_233C02254(self, v6, v7, v23, MEMORY[0x24BDBD1A8]);

    v17 = self;
    goto LABEL_21;
  }
  sub_234117B80(0, "NotSpecified");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v21;
    _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "MTRServerCluster provided invalid cluster revision: 0x%llx", buf, 0xCu);
  }

  if (sub_234114844(1u))
LABEL_19:
    sub_2341147D0(0, 1);
LABEL_20:
  v17 = 0;
LABEL_21:

  return v17;
}

+ (id)newDescriptorCluster
{
  MTRServerCluster *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = [MTRServerCluster alloc];
  objc_msgSend_set(MEMORY[0x24BDBCF20], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_233C02254(v2, &unk_250591938, &unk_250591950, v5, MEMORY[0x24BDBD1A8]);

  return v6;
}

- (void)addAccessGrant:(id)a3
{
  const char *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_addObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_233C025AC((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeAccessGrant:(id)a3
{
  const char *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_233C025AC((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)matterAccessGrants
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_allObjects(self->_matterAccessGrants, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (BOOL)addAttribute:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  id WeakRetained;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int isEqual;
  int v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  uint64_t v36;
  _BOOL4 v37;
  unsigned __int16 parentEndpoint;
  const char *v39;
  uint64_t v40;
  int v41;
  const char *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSMutableArray *obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  unint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (!WeakRetained)
  {
    objc_msgSend_attributeID(v4, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_unsignedLongLongValue(v16, v17, v18);

    if (v19 - 65528 <= 5 && ((1 << (v19 + 8)) & 0x2B) != 0)
    {
      sub_234117B80(0, "NotSpecified");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v22, v23);
        *(_DWORD *)buf = 134218240;
        v58 = v19;
        v59 = 2048;
        v60 = v24;
        _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "Cannot add global attribute %llx on cluster %llx", buf, 0x16u);
      }

      if (sub_234114844(1u))
        goto LABEL_5;
    }
    else
    {
      isEqual = objc_msgSend_isEqual_(self->_clusterID, v20, (uint64_t)&unk_250591938);
      if (v19 < 4)
        v26 = isEqual;
      else
        v26 = 0;
      if (v26 == 1)
      {
        sub_234117B80(0, "NotSpecified");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v58 = v19;
          _os_log_impl(&dword_233BF3000, v27, OS_LOG_TYPE_ERROR, "Cannot add attribute with id %llx on descriptor cluster", buf, 0xCu);
        }

        if (sub_234114844(1u))
        {
          sub_2341147D0(0, 1);
          v15 = 0;
          goto LABEL_36;
        }
      }
      else
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        obj = self->_attributes;
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v52, v56, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v53 != v32)
                objc_enumerationMutation(obj);
              objc_msgSend_attributeID(*(void **)(*((_QWORD *)&v52 + 1) + 8 * i), v29, v30);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend_unsignedLongLongValue(v34, v35, v36) == v19;

              if (v37)
              {
                sub_234117B80(0, "NotSpecified");
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  v47 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v45, v46);
                  *(_DWORD *)buf = 134218240;
                  v58 = v19;
                  v59 = 2048;
                  v60 = v47;
                  _os_log_impl(&dword_233BF3000, v44, OS_LOG_TYPE_ERROR, "Cannot add second attribute with ID %llx on cluster %llx", buf, 0x16u);
                }

                if (sub_234114844(1u))
                {
                  objc_msgSend_unsignedLongLongValue(self->_clusterID, v48, v49);
                  sub_2341147D0(0, 1);
                }

                goto LABEL_35;
              }
            }
            v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v52, v56, 16);
            if (v31)
              continue;
            break;
          }
        }

        parentEndpoint = self->_parentEndpoint;
        v41 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v39, v40);
        *(_WORD *)buf = parentEndpoint;
        LODWORD(v58) = v41;
        if ((objc_msgSend_addToCluster_(v4, v42, (uint64_t)buf) & 1) != 0)
        {
          objc_msgSend_addObject_(self->_attributes, v43, (uint64_t)v4);
          v15 = 1;
          goto LABEL_36;
        }
      }
    }
LABEL_35:
    v15 = 0;
    goto LABEL_36;
  }
  sub_234117B80(0, "NotSpecified");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v10, v11);
    *(_DWORD *)buf = 134217984;
    v58 = v12;
    _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "Cannot add attribute on cluster %llx which is already in use", buf, 0xCu);
  }

  if (!sub_234114844(1u))
    goto LABEL_35;
LABEL_5:
  objc_msgSend_unsignedLongLongValue(self->_clusterID, v13, v14);
  sub_2341147D0(0, 1);
  v15 = 0;
LABEL_36:

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (BOOL)associateWithController:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSSet *v25;
  NSSet *matterAccessGrants;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  const char *v38;
  char isEqual;
  const char *v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  vector<EmberAfAttributeMetadata, std::allocator<EmberAfAttributeMetadata>> *p_matterAttributeMetadata;
  __compressed_pair<EmberAfAttributeMetadata *, std::allocator<EmberAfAttributeMetadata>> *p_end_cap;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  int v57;
  EmberAfAttributeMetadata *end;
  EmberAfAttributeMetadata *value;
  EmberAfAttributeMetadata *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  EmberAfAttributeMetadata *v67;
  EmberAfAttributeMetadata *begin;
  EmberAfAttributeMetadata *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  unsigned __int16 v73;
  const char *v74;
  uint64_t v75;
  unsigned __int16 v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  EmberAfAttributeMetadata *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  EmberAfAttributeMetadata *v88;
  EmberAfAttributeMetadata *v89;
  EmberAfAttributeMetadata *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  EmberAfAttributeMetadata *v97;
  EmberAfAttributeMetadata *v98;
  EmberAfAttributeMetadata *v99;
  EmberAfAttributeMetadata *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  EmberAfAttributeMetadata *v106;
  EmberAfAttributeMetadata *v107;
  EmberAfAttributeMetadata *v108;
  int v109;
  uint64_t v110;
  unsigned __int16 parentEndpoint;
  NSNumber *clusterRevision;
  NSMutableArray *v113;
  NSNumber *v114;
  MTRServerAttributeAccessInterface *v115;
  unsigned int *v116;
  unsigned int *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  unsigned int v123;
  os_unfair_lock_t lock;
  id WeakRetained;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE buf[12];
  __int16 v135;
  _BYTE v136[10];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (!WeakRetained)
  {
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v14 = self->_attributes;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v130, v138, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v131;
LABEL_10:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v131 != v21)
          objc_enumerationMutation(v14);
        if ((objc_msgSend_associateWithController_(*(void **)(*((_QWORD *)&v130 + 1) + 8 * v22), v19, (uint64_t)v4) & 1) == 0)
          goto LABEL_6;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v19, (uint64_t)&v130, v138, 16);
          if (v20)
            goto LABEL_10;
          break;
        }
      }
    }

    v25 = (NSSet *)objc_msgSend_copy(self->_accessGrants, v23, v24);
    matterAccessGrants = self->_matterAccessGrants;
    self->_matterAccessGrants = v25;

    v29 = objc_msgSend_count(self->_attributes, v27, v28);
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v30 = self->_attributes;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v126, v137, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v127;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v127 != v35)
            objc_enumerationMutation(v30);
          objc_msgSend_attributeID(*(void **)(*((_QWORD *)&v126 + 1) + 8 * i), v32, v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v37, v38, (uint64_t)&unk_250591968);

          if ((isEqual & 1) != 0)
          {
            v123 = 0;
            goto LABEL_26;
          }
        }
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v126, v137, 16);
        if (v34)
          continue;
        break;
      }
    }
    v123 = 1;
LABEL_26:

    v41 = objc_msgSend_isEqual_(self->_clusterID, v40, (uint64_t)&unk_250591938);
    v44 = v29 + v123;
    if (v41)
      v44 += 4;
    v122 = v44 + 1;
    if ((unint64_t)(v44 + 1) <= 0xFFFE)
    {
      v121 = v41;
      v45 = 0;
      p_matterAttributeMetadata = &self->_matterAttributeMetadata;
      p_end_cap = &self->_matterAttributeMetadata.__end_cap_;
      while (v45 < objc_msgSend_count(self->_attributes, v42, v43))
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_attributes, (const char *)v48, v45);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_attributeID(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend_unsignedLongLongValue(v53, v54, v55);
        v57 = v56;
        end = self->_matterAttributeMetadata.__end_;
        value = self->_matterAttributeMetadata.__end_cap_.__value_;
        if (end >= value)
        {
          v61 = (end - p_matterAttributeMetadata->__begin_) >> 4;
          v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 60)
            sub_233C04968();
          v63 = value - p_matterAttributeMetadata->__begin_;
          if (v63 >> 3 > v62)
            v62 = v63 >> 3;
          if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF0)
            v64 = 0xFFFFFFFFFFFFFFFLL;
          else
            v64 = v62;
          if (v64)
            v65 = (char *)sub_233C049F0((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v64);
          else
            v65 = 0;
          v66 = &v65[16 * v61];
          *(_DWORD *)v66 = 0;
          *((_DWORD *)v66 + 2) = v57;
          *((_DWORD *)v66 + 3) = 273154048;
          begin = self->_matterAttributeMetadata.__begin_;
          v67 = self->_matterAttributeMetadata.__end_;
          v69 = (EmberAfAttributeMetadata *)v66;
          if (v67 != begin)
          {
            do
            {
              *((_OWORD *)v69 - 1) = *((_OWORD *)v67 - 1);
              v69 = (EmberAfAttributeMetadata *)((char *)v69 - 16);
              v67 = (EmberAfAttributeMetadata *)((char *)v67 - 16);
            }
            while (v67 != begin);
            v67 = p_matterAttributeMetadata->__begin_;
          }
          v60 = (EmberAfAttributeMetadata *)(v66 + 16);
          self->_matterAttributeMetadata.__begin_ = v69;
          self->_matterAttributeMetadata.__end_ = (EmberAfAttributeMetadata *)(v66 + 16);
          self->_matterAttributeMetadata.__end_cap_.__value_ = (EmberAfAttributeMetadata *)&v65[16 * v64];
          if (v67)
            operator delete(v67);
        }
        else
        {
          *(_DWORD *)end = 0;
          v60 = (EmberAfAttributeMetadata *)((char *)end + 16);
          *((_DWORD *)end + 2) = v56;
          *((_DWORD *)end + 3) = 273154048;
        }
        self->_matterAttributeMetadata.__end_ = v60;

        ++v45;
      }
      v82 = self->_matterAttributeMetadata.__end_;
      if (v123)
      {
        if (v82 >= p_end_cap->__value_)
        {
          v83 = (v82 - p_matterAttributeMetadata->__begin_) >> 4;
          if ((unint64_t)(v83 + 1) >> 60)
            sub_233C04968();
          v84 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
          v85 = v84 >> 3;
          if (v84 >> 3 <= (unint64_t)(v83 + 1))
            v85 = v83 + 1;
          if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0)
            v48 = 0xFFFFFFFFFFFFFFFLL;
          else
            v48 = v85;
          if (v48)
            v86 = (char *)sub_233C049F0((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v48);
          else
            v86 = 0;
          v87 = &v86[16 * v83];
          v88 = (EmberAfAttributeMetadata *)&v86[16 * v48];
          *(_DWORD *)v87 = 0;
          *((_QWORD *)v87 + 1) = 0x101B00040000FFFCLL;
          v82 = (EmberAfAttributeMetadata *)(v87 + 16);
          v90 = self->_matterAttributeMetadata.__begin_;
          v89 = self->_matterAttributeMetadata.__end_;
          if (v89 != v90)
          {
            do
            {
              *((_OWORD *)v87 - 1) = *((_OWORD *)v89 - 1);
              v87 -= 16;
              v89 = (EmberAfAttributeMetadata *)((char *)v89 - 16);
            }
            while (v89 != v90);
            v89 = p_matterAttributeMetadata->__begin_;
          }
          self->_matterAttributeMetadata.__begin_ = (EmberAfAttributeMetadata *)v87;
          self->_matterAttributeMetadata.__end_ = v82;
          self->_matterAttributeMetadata.__end_cap_.__value_ = v88;
          if (v89)
            operator delete(v89);
        }
        else
        {
          *(_DWORD *)v82 = 0;
          *((_QWORD *)v82 + 1) = 0x101B00040000FFFCLL;
          v82 = (EmberAfAttributeMetadata *)((char *)v82 + 16);
        }
        self->_matterAttributeMetadata.__end_ = v82;
      }
      if (v121)
      {
        v91 = (uint64_t *)&xmmword_2342A9388;
        do
        {
          if (v82 >= p_end_cap->__value_)
          {
            v92 = (v82 - p_matterAttributeMetadata->__begin_) >> 4;
            if ((unint64_t)(v92 + 1) >> 60)
              sub_233C04968();
            v93 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
            v94 = v93 >> 3;
            if (v93 >> 3 <= (unint64_t)(v92 + 1))
              v94 = v92 + 1;
            if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0)
              v48 = 0xFFFFFFFFFFFFFFFLL;
            else
              v48 = v94;
            if (v48)
              v95 = (char *)sub_233C049F0((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v48);
            else
              v95 = 0;
            v96 = &v95[16 * v92];
            *(_OWORD *)v96 = *(_OWORD *)v91;
            v98 = self->_matterAttributeMetadata.__begin_;
            v97 = self->_matterAttributeMetadata.__end_;
            v99 = (EmberAfAttributeMetadata *)v96;
            if (v97 != v98)
            {
              do
              {
                *((_OWORD *)v99 - 1) = *((_OWORD *)v97 - 1);
                v99 = (EmberAfAttributeMetadata *)((char *)v99 - 16);
                v97 = (EmberAfAttributeMetadata *)((char *)v97 - 16);
              }
              while (v97 != v98);
              v97 = p_matterAttributeMetadata->__begin_;
            }
            v82 = (EmberAfAttributeMetadata *)(v96 + 16);
            self->_matterAttributeMetadata.__begin_ = v99;
            self->_matterAttributeMetadata.__end_ = (EmberAfAttributeMetadata *)(v96 + 16);
            self->_matterAttributeMetadata.__end_cap_.__value_ = (EmberAfAttributeMetadata *)&v95[16 * v48];
            if (v97)
              operator delete(v97);
          }
          else
          {
            *(_OWORD *)v82 = *(_OWORD *)v91;
            v82 = (EmberAfAttributeMetadata *)((char *)v82 + 16);
          }
          self->_matterAttributeMetadata.__end_ = v82;
          v91 += 2;
        }
        while (v91 != &qword_2342A93C8);
      }
      if (v82 >= p_end_cap->__value_)
      {
        v101 = (v82 - p_matterAttributeMetadata->__begin_) >> 4;
        if ((unint64_t)(v101 + 1) >> 60)
          sub_233C04968();
        v102 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
        v103 = v102 >> 3;
        if (v102 >> 3 <= (unint64_t)(v101 + 1))
          v103 = v101 + 1;
        if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFF0)
          v48 = 0xFFFFFFFFFFFFFFFLL;
        else
          v48 = v103;
        if (v48)
          v104 = (char *)sub_233C049F0((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v48);
        else
          v104 = 0;
        v105 = &v104[16 * v101];
        v106 = (EmberAfAttributeMetadata *)&v104[16 * v48];
        *(_DWORD *)v105 = 0;
        *((_QWORD *)v105 + 1) = 0x102100020000FFFDLL;
        v100 = (EmberAfAttributeMetadata *)(v105 + 16);
        v108 = self->_matterAttributeMetadata.__begin_;
        v107 = self->_matterAttributeMetadata.__end_;
        if (v107 != v108)
        {
          do
          {
            *((_OWORD *)v105 - 1) = *((_OWORD *)v107 - 1);
            v105 -= 16;
            v107 = (EmberAfAttributeMetadata *)((char *)v107 - 16);
          }
          while (v107 != v108);
          v107 = p_matterAttributeMetadata->__begin_;
        }
        self->_matterAttributeMetadata.__begin_ = (EmberAfAttributeMetadata *)v105;
        self->_matterAttributeMetadata.__end_ = v100;
        self->_matterAttributeMetadata.__end_cap_.__value_ = v106;
        if (v107)
          operator delete(v107);
      }
      else
      {
        *(_DWORD *)v82 = 0;
        *((_QWORD *)v82 + 1) = 0x102100020000FFFDLL;
        v100 = (EmberAfAttributeMetadata *)((char *)v82 + 16);
      }
      self->_matterAttributeMetadata.__end_ = v100;
      v109 = objc_msgSend_unsignedLongLongValue(self->_clusterID, (const char *)v48, v49);
      v110 = operator new();
      parentEndpoint = self->_parentEndpoint;
      clusterRevision = self->_clusterRevision;
      v113 = self->_attributes;
      v114 = clusterRevision;
      *(_BYTE *)(v110 + 8) = 1;
      *(_WORD *)(v110 + 10) = parentEndpoint;
      *(_DWORD *)(v110 + 12) = v109;
      *(_QWORD *)v110 = &off_2504EE798;
      *(_QWORD *)(v110 + 16) = 0;
      *(_QWORD *)(v110 + 24) = v113;
      *(_QWORD *)(v110 + 32) = v114;
      v115 = self->_attributeAccessInterface.__ptr_.__value_;
      self->_attributeAccessInterface.__ptr_.__value_ = (MTRServerAttributeAccessInterface *)v110;
      if (v115)
        (*(void (**)(MTRServerAttributeAccessInterface *))(*(_QWORD *)v115 + 8))(v115);
      sub_233C037C0(self->_acceptedCommands, buf);
      v116 = self->_matterAcceptedCommandList.__ptr_.__value_;
      self->_matterAcceptedCommandList.__ptr_.__value_ = *(unsigned int **)buf;
      if (v116)
        MEMORY[0x23493E6EC](v116, 0x1000C8052888210);
      sub_233C037C0(self->_generatedCommands, buf);
      v117 = self->_matterGeneratedCommandList.__ptr_.__value_;
      self->_matterGeneratedCommandList.__ptr_.__value_ = *(unsigned int **)buf;
      if (v117)
        MEMORY[0x23493E6EC](v117, 0x1000C8052888210);
      objc_storeWeak((id *)&self->_deviceController, v4);
      sub_234117B80(0, "NotSpecified");
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        sub_233C038F0((os_unfair_lock *)self);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v119;
        v135 = 2048;
        *(_QWORD *)v136 = v122;
        _os_log_impl(&dword_233BF3000, v118, OS_LOG_TYPE_DEFAULT, "Associated %@, attribute count %llu, with controller", buf, 0x16u);

      }
      if (!sub_234114844(2u))
      {
        v17 = 1;
        goto LABEL_53;
      }
      sub_233C038F0((os_unfair_lock *)self);
      v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      sub_2341147D0(0, 2);
      v17 = 1;
      goto LABEL_7;
    }
    sub_234117B80(0, "NotSpecified");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v73 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v71, v72) >> 16;
      v76 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v74, v75);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v122;
      v135 = 1024;
      *(_DWORD *)v136 = v73;
      *(_WORD *)&v136[4] = 1024;
      *(_DWORD *)&v136[6] = v76;
      _os_log_impl(&dword_233BF3000, v70, OS_LOG_TYPE_ERROR, "Unable to have %llu attributes in a single cluster (clusterID: 0x%04X_%04X)", buf, 0x18u);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v77, v78);
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v79, v80);
      sub_2341147D0(0, 1);
      v17 = 0;
      goto LABEL_53;
    }
LABEL_52:
    v17 = 0;
    goto LABEL_53;
  }
  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_uniqueIdentifier(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueIdentifier(WeakRetained, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    v135 = 2112;
    *(_QWORD *)v136 = v11;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerCluster with controller %@; already associated with controller %@",
      buf,
      0x16u);

  }
  if (!sub_234114844(1u))
    goto LABEL_52;
  objc_msgSend_uniqueIdentifier(v4, v12, v13);
  v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(WeakRetained, v15, v16);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2341147D0(0, 1);

LABEL_6:
  v17 = 0;
LABEL_7:

LABEL_53:
  os_unfair_lock_unlock(lock);

  return v17;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSSet *v13;
  NSSet *matterAccessGrants;
  MTRServerAttributeAccessInterface *value;
  unsigned int *v16;
  unsigned int *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_attributes;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend_invalidate(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v10++), v6, v7, (_QWORD)v18);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend_set(MEMORY[0x24BDBCF20], v11, v12);
  v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
  matterAccessGrants = self->_matterAccessGrants;
  self->_matterAccessGrants = v13;

  value = self->_attributeAccessInterface.__ptr_.__value_;
  self->_matterAttributeMetadata.__end_ = self->_matterAttributeMetadata.__begin_;
  self->_attributeAccessInterface.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(MTRServerAttributeAccessInterface *))(*(_QWORD *)value + 8))(value);
  v16 = self->_matterAcceptedCommandList.__ptr_.__value_;
  self->_matterAcceptedCommandList.__ptr_.__value_ = 0;
  if (v16)
    MEMORY[0x23493E6EC](v16, 0x1000C8052888210);
  v17 = self->_matterGeneratedCommandList.__ptr_.__value_;
  self->_matterGeneratedCommandList.__ptr_.__value_ = 0;
  if (v17)
    MEMORY[0x23493E6EC](v17, 0x1000C8052888210);
  objc_storeWeak((id *)&self->_deviceController, 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)registerMatterCluster
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int parentEndpoint;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerCluster.mm", 378);
  os_unfair_lock_lock(&self->_lock);
  if (!sub_23410320C((uint64_t)self->_attributeAccessInterface.__ptr_.__value_))
  {
    sub_234117B80(0, "NotSpecified");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      parentEndpoint = self->_parentEndpoint;
      v7 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v4, v5);
      *(_DWORD *)buf = 67109376;
      v11 = parentEndpoint;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_ERROR, "Could not register AttributeAccessInterface for endpoint %u, cluster 0x%llx", buf, 0x12u);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v8, v9);
      sub_2341147D0(0, 1);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterMatterCluster
{
  MTRServerAttributeAccessInterface *value;

  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerCluster.mm", 392);
  os_unfair_lock_lock(&self->_lock);
  value = self->_attributeAccessInterface.__ptr_.__value_;
  if (value)
    sub_234103104((uint64_t)value);
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)accessGrants
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_allObjects(self->_accessGrants, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (NSArray)attributes
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend_copy(self->_attributes, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (BOOL)addToEndpoint:(unsigned __int16)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int parentEndpoint;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  unsigned __int16 v10;
  const char *v11;
  uint64_t v12;
  unsigned __int16 v13;
  int v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSMutableArray *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  const char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  parentEndpoint = self->_parentEndpoint;
  if (parentEndpoint == 0xFFFF)
  {
    self->_parentEndpoint = v3;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = self->_attributes;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v30, v34, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v27 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v21, v22);
          *(_WORD *)buf = v3;
          v36 = v27;
          objc_msgSend_updateParentCluster_(v26, v28, (uint64_t)buf);
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v30, v34, 16);
      }
      while (v23);
    }

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v8, v9) >> 16;
      v13 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v11, v12);
      v14 = self->_parentEndpoint;
      *(_DWORD *)buf = 67109888;
      v36 = v10;
      v37 = 1024;
      v38 = v13;
      v39 = 1024;
      v40 = v3;
      v41 = 1024;
      v42 = v14;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "Cannot add cluster 0x%04X_%04X to endpoint %u; already added to endpoint %u",
        buf,
        0x1Au);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v15, v16);
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v17, v18);
      sub_2341147D0(0, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return parentEndpoint == 0xFFFF;
}

- (unsigned)parentEndpoint
{
  MTRServerCluster *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOWORD(v2) = v2->_parentEndpoint;
  os_unfair_lock_unlock(p_lock);
  return (unsigned __int16)v2;
}

- (Span<const)matterAttributeMetadata
{
  os_unfair_lock_s *p_lock;
  EmberAfAttributeMetadata *v4;
  unint64_t v5;
  _QWORD v6[2];
  Span<const EmberAfAttributeMetadata> result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sub_233C04A4C(v6, (uint64_t)self->_matterAttributeMetadata.__begin_, (self->_matterAttributeMetadata.__end_ - self->_matterAttributeMetadata.__begin_) >> 4);
  os_unfair_lock_unlock(p_lock);
  v4 = (EmberAfAttributeMetadata *)v6[0];
  v5 = v6[1];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)setAcceptedCommands:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *acceptedCommands;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend_copy(v8, v4, v5);
  acceptedCommands = self->_acceptedCommands;
  self->_acceptedCommands = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)acceptedCommands
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend_copy(self->_acceptedCommands, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (void)setGeneratedCommands:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *generatedCommands;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend_copy(v8, v4, v5);
  generatedCommands = self->_generatedCommands;
  self->_generatedCommands = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)generatedCommands
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend_copy(self->_generatedCommands, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v6;
}

- (unsigned)matterAcceptedCommands
{
  os_unfair_lock_s *p_lock;
  unsigned int *value;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  value = self->_matterAcceptedCommandList.__ptr_.__value_;
  os_unfair_lock_unlock(p_lock);
  return value;
}

- (unsigned)matterGeneratedCommands
{
  os_unfair_lock_s *p_lock;
  unsigned int *value;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  value = self->_matterGeneratedCommandList.__ptr_.__value_;
  os_unfair_lock_unlock(p_lock);
  return value;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sub_233C038F0((os_unfair_lock *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)clusterID
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)clusterRevision
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  unsigned int *value;
  unsigned int *v4;
  EmberAfAttributeMetadata *begin;
  MTRServerAttributeAccessInterface *v6;

  objc_storeStrong((id *)&self->_clusterRevision, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_generatedCommands, 0);
  objc_storeStrong((id *)&self->_acceptedCommands, 0);
  objc_storeStrong((id *)&self->_matterAccessGrants, 0);
  value = self->_matterGeneratedCommandList.__ptr_.__value_;
  self->_matterGeneratedCommandList.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x23493E6EC](value, 0x1000C8052888210);
  v4 = self->_matterAcceptedCommandList.__ptr_.__value_;
  self->_matterAcceptedCommandList.__ptr_.__value_ = 0;
  if (v4)
    MEMORY[0x23493E6EC](v4, 0x1000C8052888210);
  begin = self->_matterAttributeMetadata.__begin_;
  if (begin)
  {
    self->_matterAttributeMetadata.__end_ = begin;
    operator delete(begin);
  }
  v6 = self->_attributeAccessInterface.__ptr_.__value_;
  self->_attributeAccessInterface.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(MTRServerAttributeAccessInterface *))(*(_QWORD *)v6 + 8))(v6);
  objc_destroyWeak((id *)&self->_deviceController);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_accessGrants, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
