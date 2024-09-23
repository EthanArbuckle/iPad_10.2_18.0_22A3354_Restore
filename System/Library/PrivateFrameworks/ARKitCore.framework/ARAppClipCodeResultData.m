@implementation ARAppClipCodeResultData

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  ARAppClipCodeAnchor *v42;
  ARAppClipCodeAnchor *v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  id v76;
  uint64_t v77;
  id obj;
  void *v79;
  uint64_t v80;
  id v85;
  __int128 v86;
  __int128 v87;
  id v88[2];
  void *v89;
  __int128 v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t buf[32];
  float32x4_t v117;
  float32x4_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v13 = a11;
  v76 = a12;
  v14 = (void *)objc_opt_new();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v105 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v20;
          objc_msgSend(v21, "instanceID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v21, v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
    }
    while (v17);
  }
  v74 = v15;

  v85 = (id)objc_opt_new();
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v23 = a1;
  objc_msgSend(*(id *)(a1 + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  v79 = v14;
  if (v24)
  {
    v25 = v24;
    v80 = *(_QWORD *)v101;
    do
    {
      v26 = 0;
      v77 = v25;
      do
      {
        if (*(_QWORD *)v101 != v80)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v26);
        objc_msgSend(*(id *)(v23 + 8), "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v29, "url");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = (void *)v31;
            objc_msgSend(v28, "url");
            v33 = objc_claimAutoreleasedReturnValue();
            if (v33)
            {
              v34 = (void *)v33;
              objc_msgSend(v30, "url");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "url");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = v35 == v36;
              v23 = a1;
              v14 = v79;
              v25 = v77;
              if (!v37)
              {
                if (_ARLogGeneral_onceToken_40 != -1)
                  dispatch_once(&_ARLogGeneral_onceToken_40, &__block_literal_global_94);
                v38 = (void *)_ARLogGeneral_logObj_40;
                if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_40, OS_LOG_TYPE_ERROR))
                {
                  v39 = v38;
                  objc_msgSend(v30, "url");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "url");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v40;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v41;
                  _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "ARAppClipCodeResultData: URL of app clip code instance changed from %@ to %@. This should not happen.", buf, 0x16u);

                  v23 = a1;
                  v25 = v77;

                }
              }
            }
            else
            {

              v25 = v77;
            }
          }
          v42 = (ARAppClipCodeAnchor *)objc_msgSend(v30, "copyWithAppClipCodeResult:isTracked:", v28, 1);
        }
        else
        {
          v42 = -[ARAppClipCodeAnchor initWithAppClipCodeResult:instanceID:]([ARAppClipCodeAnchor alloc], "initWithAppClipCodeResult:instanceID:", v28, v27);
        }
        v43 = v42;
        objc_msgSend(v28, "codeToWorldVisionTransform");
        v48 = 0;
        v108 = xmmword_1B3C0B420;
        v109 = xmmword_1B3C0B430;
        v110 = xmmword_1B3C0B440;
        v111 = xmmword_1B3BDFD50;
        memset(buf, 0, sizeof(buf));
        v117 = 0u;
        v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v48] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(__int128 *)((char *)&v108 + v48))), v45, *(float32x2_t *)((char *)&v108 + v48), 1), v46, *(float32x4_t *)((char *)&v108 + v48), 2), v47, *(float32x4_t *)((char *)&v108 + v48), 3);
          v48 += 16;
        }
        while (v48 != 64);
        *(_OWORD *)v88 = *(_OWORD *)&buf[16];
        v90 = *(_OWORD *)buf;
        v86 = (__int128)v118;
        v87 = (__int128)v117;
        *(double *)&v49 = ARVisionToRenderingCoordinateTransform();
        v50 = 0;
        v108 = v49;
        v109 = v51;
        v110 = v52;
        v111 = v53;
        memset(buf, 0, sizeof(buf));
        v117 = 0u;
        v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v50] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(__int128 *)((char *)&v108 + v50))), a7, *(float32x2_t *)((char *)&v108 + v50), 1), a8, *(float32x4_t *)((char *)&v108 + v50), 2), a9, *(float32x4_t *)((char *)&v108 + v50), 3);
          v50 += 16;
        }
        while (v50 != 64);
        v54 = 0;
        v55 = *(float32x4_t *)buf;
        v56 = *(float32x4_t *)&buf[16];
        v57 = v117;
        v58 = v118;
        v108 = v90;
        v109 = *(_OWORD *)v88;
        v110 = v87;
        v111 = v86;
        memset(buf, 0, sizeof(buf));
        v117 = 0u;
        v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v54] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, COERCE_FLOAT(*(__int128 *)((char *)&v108 + v54))), v56, *(float32x2_t *)((char *)&v108 + v54), 1), v57, *(float32x4_t *)((char *)&v108 + v54), 2), v58, *(float32x4_t *)((char *)&v108 + v54), 3);
          v54 += 16;
        }
        while (v54 != 64);
        -[ARAnchor setTransform:](v43, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v117.i64, *(double *)v118.i64);
        if (v43)
        {
          objc_msgSend(v85, "addObject:", v43);
          objc_msgSend(v14, "removeObjectForKey:", v27);
        }

        ++v26;
      }
      while (v26 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    }
    while (v25);
  }

  v91 = (void *)objc_msgSend(v85, "copy");
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(v14, "allValues");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v97 != v61)
          objc_enumerationMutation(v89);
        v63 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
        objc_msgSend(v63, "url");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          v65 = v91;
          v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
          if (v66)
          {
            v67 = v66;
            v68 = *(_QWORD *)v93;
            while (2)
            {
              for (k = 0; k != v67; ++k)
              {
                if (*(_QWORD *)v93 != v68)
                  objc_enumerationMutation(v65);
                objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "url");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "url");
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                if (v70 == v71)
                {

                  objc_msgSend(v76, "addObject:", v63);
                  v14 = v79;
                  goto LABEL_53;
                }
              }
              v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
              if (v67)
                continue;
              break;
            }
          }

          v14 = v79;
        }
        v72 = (void *)objc_msgSend(v63, "copyWithTrackedState:", 0);
        objc_msgSend(v85, "addObject:", v72);

LABEL_53:
        ;
      }
      v60 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
    }
    while (v60);
  }

  return v85;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_trackedAppClipCodes, CFSTR("trackedAppClipCodes"));
}

- (ARAppClipCodeResultData)initWithCoder:(id)a3
{
  id v4;
  ARAppClipCodeResultData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *trackedAppClipCodes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeResultData;
  v5 = -[ARAppClipCodeResultData init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("trackedAppClipCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    trackedAppClipCodes = v5->_trackedAppClipCodes;
    v5->_trackedAppClipCodes = (NSDictionary *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_trackedAppClipCodes, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "trackedAppClipCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARAppClipCodeResultData trackedAppClipCodes](self, "trackedAppClipCodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)trackedAppClipCodes
{
  return self->_trackedAppClipCodes;
}

- (void)setTrackedAppClipCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAppClipCodes, 0);
}

@end
