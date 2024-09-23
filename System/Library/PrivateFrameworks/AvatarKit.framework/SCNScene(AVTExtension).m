@implementation SCNScene(AVTExtension)

- (void)avt_fixQuirksOfNewUSDSchemaWithOptions:()AVTExtension handler:
{
  id v6;

  v6 = a4;
  objc_msgSend(a1, "avt_setInitialValuesExportedAsAnimationsWithWithOptions:handler:", a3, v6);
  objc_msgSend(a1, "avt_removeDuplicateSkeletonRootWithHandler:", v6);
  objc_msgSend(a1, "avt_removeFaceSetsExportedAsDummyNodesWithHandler:", v6);

}

- (void)avt_setInitialValuesExportedAsAnimationsWithWithOptions:()AVTExtension handler:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a1, "rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__SCNScene_AVTExtension__avt_setInitialValuesExportedAsAnimationsWithWithOptions_handler___block_invoke;
  v9[3] = &unk_1EA61FB88;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "enumerateHierarchyUsingBlock:", v9);

  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
}

- (void)avt_removeDuplicateSkeletonRootWithHandler:()AVTExtension
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  void *v42;
  void *v43;
  id obj;
  _QWORD v45[5];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = a1;
  objc_msgSend(a1, "rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childNodeWithName:recursively:", CFSTR("skeleton_GRP"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v6, "childNodes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (!v7)
      goto LABEL_10;
    v8 = v7;
    v9 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("mindBlown_"));

        if ((v12 & 1) != 0)
        {
LABEL_33:

          goto LABEL_34;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v8);
LABEL_10:

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v6, "childNodes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (!v13)
      goto LABEL_33;
    v14 = v13;
    v42 = v6;
    v15 = *(_QWORD *)v48;
    v40 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v41 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v38 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v39 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
      objc_msgSend(v17, "name");
      v18 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v18, "isEqualToString:", CFSTR("root_JNT")) & 1) != 0)
        goto LABEL_21;
      objc_msgSend(v17, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("bodyRoot_JNT")))
        break;
      objc_msgSend(v17, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("spineFk0_JNT"));

      if ((v21 & 1) == 0)
      {
        avt_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v58 = "[rootJoint.name isEqualToString:AVT_SKINNER_ROOT_NAME] || [rootJoint.name isEqualToString:AVT_SKINNER_ME"
                "MOJI_FLATTENED_BODY_ROOT_NAME] || [rootJoint.name isEqualToString:AVT_SKINNER_MEMOJI_HIERARCHICAL_BODY_ROOT_NAME]";
          v59 = 2112;
          v60 = v37;
          _os_log_error_impl(&dword_1DD1FA000, v18, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Skeleton group has unknown root joint \"%@\", buf, 0x16u);

        }
        goto LABEL_21;
      }
LABEL_22:
      objc_msgSend(v17, "childNodes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v26)
      {
        objc_msgSend(v17, "simdTransform");
        if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v27, v41), (int8x16_t)vceqq_f32(v28, v40)), vandq_s8((int8x16_t)vceqq_f32(v29, v39), (int8x16_t)vceqq_f32(v30, v38)))) & 0x80000000) == 0)
        {
          avt_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[SCNScene(AVTExtension) avt_removeDuplicateSkeletonRootWithHandler:].cold.1(v55, &v56, v31);

        }
        if (v4)
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v17, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "childNodes");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("Removed duplicate node \"%@\" (%ld child joints)"), v33, objc_msgSend(v34, "count"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v35);

        }
        objc_msgSend(v17, "removeFromParentNode");
        objc_msgSend(v23, "removeFromParentNode");
        objc_msgSend(v42, "addChildNode:", v23);
        objc_msgSend(v43, "rootNode");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke;
        v45[3] = &unk_1EA61DAC8;
        v45[4] = v17;
        v46 = v23;
        objc_msgSend(v36, "enumerateHierarchyUsingBlock:", v45);

      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        if (!v14)
        {
          v6 = v42;
          goto LABEL_33;
        }
        goto LABEL_12;
      }
    }

LABEL_21:
    goto LABEL_22;
  }
LABEL_34:

}

- (void)avt_removeFaceSetsExportedAsDummyNodesWithHandler:()AVTExtension
{
  void (**v4)(id, void *);
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "rootNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__SCNScene_AVTExtension__avt_removeFaceSetsExportedAsDummyNodesWithHandler___block_invoke;
  v23[3] = &unk_1EA61D7A8;
  v7 = v5;
  v24 = v7;
  objc_msgSend(v6, "enumerateHierarchyUsingBlock:", v23);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        if (v4)
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "parentNode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("Removed face set dummy node \"%@\" from \"%@\"), v15, v17, (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v18);

        }
        objc_msgSend(v13, "removeFromParentNode");
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

}

- (void)avt_removeDuplicateSkeletonRootWithHandler:()AVTExtension .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "simd_equal(rootJoint.simdTransform, matrix_identity_float4x4)";
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Root joint shouldn't have any transform", buf, 0xCu);
}

@end
