@implementation REMeshSkeletonDescriptor

- (REMeshSkeletonDescriptor)initWithMeshAssetSkeleton:(const void *)a3
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  REMeshSkeletonDescriptor *v15;
  REMeshSkeletonDescriptor *result;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *((_QWORD *)a3 + 3);
  if (v4 != *((_QWORD *)a3 + 6))
  {
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.parentIndices.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1731);
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  if (v4 != *((_QWORD *)a3 + 9))
  {
LABEL_23:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.localBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1732);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  if (v4 != *((_QWORD *)a3 + 12))
  {
LABEL_24:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.inverseBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1733);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  if (v4 != v19)
  {
LABEL_25:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.scales.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1736);
    _os_crash();
    __break(1u);
    goto LABEL_26;
  }
  if (v4 != v22)
  {
LABEL_26:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.rotations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1737);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  if (v4 != v25)
  {
LABEL_27:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.translations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshAssetSkeleton:]", 1738);
    result = (REMeshSkeletonDescriptor *)_os_crash();
    __break(1u);
    return result;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)a3 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (char *)a3 + 88;
  v11 = v20;
  v12 = v23;
  v13 = v26;
  v15 = -[REMeshSkeletonDescriptor initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:](self, "initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:", v7, v8, v9, v11, v12, v13, v14, v17[2]);
  if (v17[0] && v17[1])
    (*(void (**)(void))(*(_QWORD *)v17[0] + 40))();

  if (v24)
  {
    if (v25)
    {
      (*(void (**)(void))(*(_QWORD *)v24 + 40))();
      v25 = 0;
      v26 = 0;
    }
    v24 = 0;
  }
  if (v21)
  {
    if (v22)
    {
      (*(void (**)(void))(*(_QWORD *)v21 + 40))();
      v22 = 0;
      v23 = 0;
    }
    v21 = 0;
  }
  if (v18)
  {
    if (v19)
      (*(void (**)(void))(*(_QWORD *)v18 + 40))();
  }

  return v15;
}

- (REMeshSkeletonDescriptor)initWithMeshSkeletonDefinition:(const void *)a3
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  REMeshSkeletonDescriptor *v15;
  REMeshSkeletonDescriptor *result;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *((_QWORD *)a3 + 6);
  if (v4 != *((_QWORD *)a3 + 9))
  {
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.parentIndices.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1752);
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  if (v4 != *((_QWORD *)a3 + 12))
  {
LABEL_23:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.localRestPose.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1753);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  if (v4 != *((_QWORD *)a3 + 15))
  {
LABEL_24:
    re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "jointCount == skeleton.inverseBindPoses.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1754);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  if (v4 != v19)
  {
LABEL_25:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.scales.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1757);
    _os_crash();
    __break(1u);
    goto LABEL_26;
  }
  if (v4 != v22)
  {
LABEL_26:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.rotations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1758);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  if (v4 != v25)
  {
LABEL_27:
    re::internal::assertLog((re::internal *)4, v6, "assertion failure: '%s' (%s:line %i) ", "jointCount == localRestPose.translations.size()", "-[REMeshSkeletonDescriptor(REMeshAssetRuntime) initWithMeshSkeletonDefinition:]", 1759);
    result = (REMeshSkeletonDescriptor *)_os_crash();
    __break(1u);
    return result;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)a3 + 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (char *)a3 + 112;
  v11 = v20;
  v12 = v23;
  v13 = v26;
  v15 = -[REMeshSkeletonDescriptor initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:](self, "initWithName:jointNames:parentIndices:localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:", v7, v8, v9, v11, v12, v13, v14, v17[2]);
  if (v17[0] && v17[1])
    (*(void (**)(void))(*(_QWORD *)v17[0] + 40))();

  if (v24)
  {
    if (v25)
    {
      (*(void (**)(void))(*(_QWORD *)v24 + 40))();
      v25 = 0;
      v26 = 0;
    }
    v24 = 0;
  }
  if (v21)
  {
    if (v22)
    {
      (*(void (**)(void))(*(_QWORD *)v21 + 40))();
      v22 = 0;
      v23 = 0;
    }
    v21 = 0;
  }
  if (v18)
  {
    if (v19)
      (*(void (**)(void))(*(_QWORD *)v18 + 40))();
  }

  return v15;
}

- (MeshAssetSkeleton)meshAssetSkeleton
{
  void *v3;
  _anonymous_namespace_ *v4;
  id v5;
  _anonymous_namespace_ *v6;
  uint64_t v7;
  unint64_t i;
  FixedArray<re::Matrix4x4<float>> *p_var4;
  uint64_t v10;
  unint64_t v11;
  _anonymous_namespace_ *v12;
  unint64_t var1;
  StringID *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  id v19;
  _anonymous_namespace_ *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  _anonymous_namespace_ *v28;
  uint64_t v29;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  unint64_t v33;
  uint64_t v34;
  __int128 *v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  MeshAssetSkeleton *result;
  id v42;
  id v43;
  unint64_t v45;
  id obj;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  FixedArray<re::Matrix4x4<float>> *v67;
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  -[REMeshSkeletonDescriptor jointNames](self, "jointNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v3, "count");

  -[REMeshSkeletonDescriptor name](self, "name");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (_anonymous_namespace_ *)objc_msgSend(v42, "UTF8String");
  *(_QWORD *)&retstr->var0.var0 = 0;
  retstr->var0.var1 = (char *)&str_110;
  -[REMeshSkeletonDescriptor jointNames](self, "jointNames");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var1.var1 = 0;
  retstr->var1.var2 = 0;
  retstr->var1.var0 = 0;
  v43 = v5;
  v6 = (_anonymous_namespace_ *)objc_msgSend(v5, "count");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v43;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
  if (v7)
  {
    i = 0;
    p_var4 = *(FixedArray<re::Matrix4x4<float>> **)v52;
    do
    {
      v10 = 0;
      v11 = i;
      do
      {
        if (*(FixedArray<re::Matrix4x4<float>> **)v52 != p_var4)
          objc_enumerationMutation(obj);
        v12 = (_anonymous_namespace_ *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v10)), "UTF8String");
        v48 = 0;
        v49 = (char *)&str_110;
        var1 = retstr->var1.var1;
        if (var1 <= i + v10)
        {
          v50 = 0;
          v23 = (unint64_t)&v55;
          v69 = 0u;
          v70 = 0u;
          memset(v68, 0, sizeof(v68));
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          v60 = 136315906;
          v61 = "operator[]";
          v62 = 1024;
          v63 = 468;
          v64 = 2048;
          v65 = i + v10;
          v66 = 2048;
          v67 = (FixedArray<re::Matrix4x4<float>> *)var1;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_29:
          v48 = 0;
          v35 = &v55;
          v69 = 0u;
          v70 = 0u;
          memset(v68, 0, sizeof(v68));
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          v60 = 136315906;
          v61 = "operator[]";
          v62 = 1024;
          v63 = 468;
          v64 = 2048;
          v65 = v23;
          v66 = 2048;
          v67 = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_30:
          *(_QWORD *)&v51 = 0;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v55 = 0u;
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(_QWORD *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(_QWORD *)((char *)&v68[2] + 4) = v35;
          WORD2(v68[3]) = 2048;
          *(_QWORD *)((char *)&v68[3] + 6) = v23;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_31:
          *(_QWORD *)&v51 = 0;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v55 = 0u;
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(_QWORD *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(_QWORD *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(_QWORD *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_32:
          *(_QWORD *)&v51 = 0;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v55 = 0u;
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(_QWORD *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(_QWORD *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(_QWORD *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_33:
          *(_QWORD *)&v51 = 0;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v55 = 0u;
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          LODWORD(v68[0]) = 136315906;
          *(_QWORD *)((char *)v68 + 4) = "operator[]";
          WORD2(v68[1]) = 1024;
          *(_DWORD *)((char *)&v68[1] + 6) = 468;
          WORD1(v68[2]) = 2048;
          *(_QWORD *)((char *)&v68[2] + 4) = i;
          WORD2(v68[3]) = 2048;
          *(_QWORD *)((char *)&v68[3] + 6) = p_var4;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
        }
        v14 = &retstr->var1.var2[v11];
        v15 = v48;
        v16 = v49;
        v48 = 0;
        v49 = (char *)&str_110;
        v17 = v14->var1;
        v18 = v15 & 0xFFFFFFFFFFFFFFFELL | *(_QWORD *)&v14->var0 & 1;
        v14->var1 = v16;
        v68[0] = v18;
        v68[1] = v17;
        *(_QWORD *)&v14->var0 = v15;
        re::StringID::destroyString((re::StringID *)v68);
        re::StringID::destroyString((re::StringID *)&v48);
        ++v10;
        ++v11;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
      i += v10;
    }
    while (v7);
  }

  -[REMeshSkeletonDescriptor parentIndices](self, "parentIndices");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var2.var1 = 0;
  retstr->var2.var2 = 0;
  retstr->var2.var0 = 0;
  v20 = (_anonymous_namespace_ *)objc_msgSend(v19, "count");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
  if (v22)
  {
    v23 = 0;
    v24 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v52 != v24)
          objc_enumerationMutation(v21);
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "unsignedIntValue");
        p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var2.var1;
        if ((unint64_t)p_var4 <= v23)
          goto LABEL_29;
        retstr->var2.var2[v23++] = v25;
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, &v55, 16);
    }
    while (v22);
  }

  v26 = -[REMeshSkeletonDescriptor localRestPoseScales](self, "localRestPoseScales");
  v27 = -[REMeshSkeletonDescriptor localRestPoseRotations](self, "localRestPoseRotations");
  v28 = -[REMeshSkeletonDescriptor localRestPoseTranslations](self, "localRestPoseTranslations");
  retstr->var3.var0 = 0;
  retstr->var3.var1 = 0;
  retstr->var3.var2 = 0;
  i = v45;
  if (v45)
  {
    v29 = 0;
    i = 0;
    do
    {
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i)
        goto LABEL_31;
      *(_OWORD *)((char *)retstr->var3.var2 + v29) = *(_OWORD *)(v26 + 16 * i);
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i)
        goto LABEL_32;
      *(_OWORD *)((char *)retstr->var3.var2 + v29 + 16) = *((_OWORD *)v27 + i);
      p_var4 = (FixedArray<re::Matrix4x4<float>> *)retstr->var3.var1;
      if ((unint64_t)p_var4 <= i)
        goto LABEL_33;
      *(_OWORD *)((char *)retstr->var3.var2 + v29 + 32) = *((_OWORD *)v28 + i++);
      v29 += 48;
    }
    while (v45 != i);
  }
  v30 = -[REMeshSkeletonDescriptor inverseBindPose](self, "inverseBindPose");
  v31 = -[REMeshSkeletonDescriptor inverseBindPose](self, "inverseBindPose");
  p_var4 = &retstr->var4;
  v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + 64 * v45);
  v33 = (v32 - v30) >> 6;
  retstr->var4.var0 = 0;
  retstr->var4.var1 = 0;
  retstr->var4.var2 = 0;
  if (v32 != v30)
  {
    v34 = 0;
    v35 = 0;
    v36 = (char *)v30 + 48;
    do
    {
      v23 = retstr->var4.var1;
      if (v23 <= (unint64_t)v35)
        goto LABEL_30;
      v38 = *(_OWORD *)&v36[v34 - 16];
      v37 = *(_OWORD *)&v36[v34];
      v39 = *(_OWORD *)&v36[v34 - 32];
      v40 = (char *)retstr->var4.var2 + v34;
      *v40 = *(_OWORD *)&v36[v34 - 48];
      v40[1] = v39;
      v40[2] = v38;
      v40[3] = v37;
      v35 = (__int128 *)((char *)v35 + 1);
      v34 += 64;
    }
    while ((__int128 *)v33 != v35);
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkeletonDescriptor)initWithName:(id)a3 jointNames:(id)a4 parentIndices:(id)a5 localRestPoseScales:localRestPoseRotations:localRestPoseTranslations:inverseBindPose:
{
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  const void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  const void *v56;
  const void *v57;
  BOOL v58;
  const void *v60;
  const void *v61;
  objc_super v62;
  const void *v63;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v62.receiver = self;
  v62.super_class = (Class)REMeshSkeletonDescriptor;
  v17 = -[REMeshSkeletonDescriptor init](&v62, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    v61 = v9;
    v19 = v8;
    v20 = (void *)*((_QWORD *)v17 + 13);
    *((_QWORD *)v17 + 13) = v18;

    objc_storeStrong((id *)v17 + 14, a4);
    objc_storeStrong((id *)v17 + 15, a5);
    v21 = objc_msgSend(v15, "count");
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((_QWORD *)v17 + 1, v21);
    v22 = *((_QWORD *)v17 + 4);
    v23 = *((_QWORD *)v17 + 5);
    v24 = (v23 - v22) >> 4;
    if (v21 <= v24)
    {
      if (v21 >= v24)
        goto LABEL_19;
      v37 = v22 + 16 * v21;
    }
    else
    {
      v25 = v21 - v24;
      v26 = *((_QWORD *)v17 + 6);
      if (v21 - v24 > (v26 - v23) >> 4)
      {
        if (v21 >> 60)
          goto LABEL_37;
        v27 = v26 - v22;
        v28 = v27 >> 3;
        if (v27 >> 3 <= v21)
          v28 = v21;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
          v29 = 0xFFFFFFFFFFFFFFFLL;
        else
          v29 = v28;
        v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_quatf>>(v29);
        v31 = &v30[16 * v24];
        v33 = &v30[16 * v32];
        bzero(v31, 16 * v25);
        v34 = &v31[16 * v25];
        v36 = (char *)*((_QWORD *)v17 + 4);
        v35 = (char *)*((_QWORD *)v17 + 5);
        if (v35 != v36)
        {
          do
          {
            *((_OWORD *)v31 - 1) = *((_OWORD *)v35 - 1);
            v31 -= 16;
            v35 -= 16;
          }
          while (v35 != v36);
          v35 = (char *)*((_QWORD *)v17 + 4);
        }
        *((_QWORD *)v17 + 4) = v31;
        *((_QWORD *)v17 + 5) = v34;
        *((_QWORD *)v17 + 6) = v33;
        if (v35)
          operator delete(v35);
LABEL_19:
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((_QWORD *)v17 + 7, v21);
        v38 = *((_QWORD *)v17 + 10);
        v39 = *((_QWORD *)v17 + 11);
        v40 = (v39 - v38) >> 6;
        if (v21 <= v40)
        {
          v58 = v21 >= v40;
          v56 = v19;
          v57 = v61;
          if (!v58)
            *((_QWORD *)v17 + 11) = v38 + (v21 << 6);
          goto LABEL_35;
        }
        v41 = v21 - v40;
        v42 = *((_QWORD *)v17 + 12);
        if (v21 - v40 <= (v42 - v39) >> 6)
        {
          bzero(*((void **)v17 + 11), v41 << 6);
          *((_QWORD *)v17 + 11) = v39 + (v41 << 6);
          v56 = v19;
          v57 = v61;
LABEL_35:
          memcpy(*((void **)v17 + 1), v10, 16 * v21);
          memcpy(*((void **)v17 + 4), v57, 16 * v21);
          memcpy(*((void **)v17 + 7), v56, 16 * v21);
          memcpy(*((void **)v17 + 10), v63, v21 << 6);
          goto LABEL_36;
        }
        if (!(v21 >> 58))
        {
          v43 = v42 - v38;
          v44 = v43 >> 5;
          if (v43 >> 5 <= v21)
            v44 = v21;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFC0)
            v45 = 0x3FFFFFFFFFFFFFFLL;
          else
            v45 = v44;
          v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_float4x4>>(v45);
          v60 = v10;
          v47 = &v46[64 * v40];
          v49 = &v46[64 * v48];
          bzero(v47, v41 << 6);
          v50 = &v47[64 * v41];
          v52 = (char *)*((_QWORD *)v17 + 10);
          v51 = (char *)*((_QWORD *)v17 + 11);
          if (v51 != v52)
          {
            do
            {
              v53 = *((_OWORD *)v51 - 4);
              v54 = *((_OWORD *)v51 - 3);
              v55 = *((_OWORD *)v51 - 1);
              *((_OWORD *)v47 - 2) = *((_OWORD *)v51 - 2);
              *((_OWORD *)v47 - 1) = v55;
              *((_OWORD *)v47 - 4) = v53;
              *((_OWORD *)v47 - 3) = v54;
              v47 -= 64;
              v51 -= 64;
            }
            while (v51 != v52);
            v51 = (char *)*((_QWORD *)v17 + 10);
          }
          v56 = v19;
          *((_QWORD *)v17 + 10) = v47;
          *((_QWORD *)v17 + 11) = v50;
          *((_QWORD *)v17 + 12) = v49;
          v10 = v60;
          v57 = v61;
          if (v51)
            operator delete(v51);
          goto LABEL_35;
        }
LABEL_37:
        abort();
      }
      bzero(*((void **)v17 + 5), 16 * v25);
      v37 = v23 + 16 * v25;
    }
    *((_QWORD *)v17 + 5) = v37;
    goto LABEL_19;
  }
LABEL_36:

  return (REMeshSkeletonDescriptor *)v17;
}

- (REMeshSkeletonDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSArray *v7;
  NSArray *jointNames;
  NSArray *v9;
  NSArray *parentIndices;
  unint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  float32x4_t v24;
  int v25;
  int v26;
  int8x16_t v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  float v31;
  BOOL v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v34;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  id v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  NSString *v41;
  size_t v42;
  const void *v43;
  uint64_t v44;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v45;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v46;
  void *v47;
  REMeshSkeletonDescriptor *v48;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v49;
  size_t v51;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("jointNames"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  jointNames = self->_jointNames;
  self->_jointNames = v7;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("parentIndices"));
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  parentIndices = self->_parentIndices;
  self->_parentIndices = v9;

  v11 = -[NSArray count](self->_jointNames, "count");
  v51 = 0;
  v12 = objc_retainAutorelease(v4);
  v13 = objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("localRestPose.scale"), &v51);
  v14 = validateLocalRestPoseFloat3(v11, v13, v51, self->_anon_8);
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v15, "decodeBytesForKey:returnedLength:", CFSTR("localRestPose.rotation"), &v51);
  if (!v14)
    goto LABEL_26;
  v17 = v51;
  if (v51 != 16 * v11)
    goto LABEL_25;
  if (!v11)
  {
    v19 = 0;
    v34 = 0;
    v33 = 0;
    goto LABEL_21;
  }
  if (v11 >> 60)
    goto LABEL_40;
  v18 = v16;
  v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_quatf>>(v11);
  v21 = v20;
  bzero(v19, v17);
  v22 = 0;
  v23 = 1;
  do
  {
    v24 = *(float32x4_t *)(v18 + 16 * v22);
    v25 = HIDWORD(*(_QWORD *)(v18 + 16 * v22));
    v26 = *(_QWORD *)(v18 + 16 * v22 + 8);
    *((float32x4_t *)v19 + v22) = v24;
    v27 = (int8x16_t)vmulq_f32(v24, v24);
    v28 = (v26 & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v24.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    v29 = (v25 & 0x7FFFFFFFu) <= 0x7F7FFFFF && v28;
    v30 = (v24.i32[0] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v29;
    v31 = vaddv_f32(vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL)));
    v32 = v31 == 1.0;
    if (fabsf(v31 + -1.0) <= 0.00001)
      v32 = 1;
    v23 &= v32 && v30;
    ++v22;
  }
  while (v11 != v22);
  if ((v23 & 1) == 0)
  {
    self->_localRestPoseRotations.__end_ = self->_localRestPoseRotations.__begin_;
    operator delete(v19);
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v19 + 16 * v21);
  v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v19 + v17);
LABEL_21:
  begin = self->_localRestPoseRotations.__begin_;
  if (begin)
  {
    self->_localRestPoseRotations.__end_ = begin;
    operator delete(begin);
  }
  self->_localRestPoseRotations.__begin_ = v19;
  self->_localRestPoseRotations.__end_ = v34;
  v14 = 1;
  self->_localRestPoseRotations.__end_cap_.__value_ = v33;
LABEL_26:
  v36 = objc_retainAutorelease(v15);
  v37 = objc_msgSend(v36, "decodeBytesForKey:returnedLength:", CFSTR("localRestPose.translation"), &v51);
  if (v14)
    v38 = validateLocalRestPoseFloat3(v11, v37, v51, self->_anon_38);
  else
    v38 = 0;
  v39 = objc_retainAutorelease(v36);
  v40 = objc_msgSend(v39, "decodeBytesForKey:returnedLength:", CFSTR("inverseBindPose"), &v51);
  if (!v38 || (v42 = v51, v51 != v11 << 6))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "failWithError:", v47);

    v48 = 0;
    goto LABEL_39;
  }
  v43 = (const void *)v40;
  if (!v11)
  {
    v46 = 0;
    v45 = 0;
    goto LABEL_36;
  }
  if (v11 >> 58)
LABEL_40:
    abort();
  v11 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<simd_float4x4>>(v11);
  v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + (v44 << 6));
  bzero((void *)v11, v42);
  v46 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + v42);
LABEL_36:
  memcpy((void *)v11, v43, v42);
  v49 = self->_inverseBindPose.__begin_;
  if (v49)
  {
    self->_inverseBindPose.__end_ = v49;
    operator delete(v49);
  }
  self->_inverseBindPose.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11;
  self->_inverseBindPose.__end_ = v46;
  self->_inverseBindPose.__end_cap_.__value_ = v45;
  v48 = self;
LABEL_39:

  return v48;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_jointNames, CFSTR("jointNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentIndices, CFSTR("parentIndices"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", *(_QWORD *)self->_anon_8, *(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8, CFSTR("localRestPose.scale"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_localRestPoseRotations.__begin_, self->_localRestPoseRotations.__end_ - self->_localRestPoseRotations.__begin_, CFSTR("localRestPose.rotation"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", *(_QWORD *)self->_anon_38, *(_QWORD *)&self->_anon_38[8] - *(_QWORD *)self->_anon_38, CFSTR("localRestPose.translation"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_inverseBindPose.__begin_, self->_inverseBindPose.__end_ - self->_inverseBindPose.__begin_, CFSTR("inverseBindPose"));

}

- (BOOL)validateWithError:(id *)a3
{
  NSUInteger v5;

  v5 = -[NSArray count](self->_jointNames, "count");
  if (-[NSArray count](self->_parentIndices, "count") == v5
    && v5 == (uint64_t)(*(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8) >> 4
    && v5 == (self->_localRestPoseRotations.__end_ - self->_localRestPoseRotations.__begin_) >> 4
    && v5 == (uint64_t)(*(_QWORD *)&self->_anon_38[8] - *(_QWORD *)self->_anon_38) >> 4
    && v5 == (self->_inverseBindPose.__end_ - self->_inverseBindPose.__begin_) >> 6)
  {
    return 1;
  }
  return 0;
}

- (uint64_t)localRestPoseScales
{
  return *(_QWORD *)(a1 + 8);
}

- (const)localRestPoseRotations
{
  return self->_localRestPoseRotations.__begin_;
}

- (uint64_t)localRestPoseTranslations
{
  return *(_QWORD *)(a1 + 56);
}

- (const)inverseBindPose
{
  return self->_inverseBindPose.__begin_;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  objc_class *v5;
  size_t v6;
  NSString *name;
  size_t v8;
  uint64_t v9;
  objc_class *v10;
  size_t v11;
  NSArray *jointNames;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  size_t v20;
  uint64_t v21;
  objc_class *v22;
  size_t v23;
  NSArray *parentIndices;
  uint64_t v25;
  objc_class *v26;
  size_t v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  v5 = (objc_class *)objc_opt_class();
  v6 = class_getInstanceSize(v5);
  name = self->_name;
  if (name)
    v8 = v6;
  else
    v8 = 0;
  if (name)
    v9 = -[NSString lengthOfBytesUsingEncoding:](name, "lengthOfBytesUsingEncoding:", 4) + 1;
  else
    v9 = 0;
  if (self->_jointNames)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = class_getInstanceSize(v10);
    jointNames = self->_jointNames;
  }
  else
  {
    jointNames = 0;
    v11 = 0;
  }
  v13 = -[NSArray count](jointNames, "count");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = self->_jointNames;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v16 = v8 + InstanceSize + v9 + v11 + 8 * v13;
  if (v15)
  {
    v17 = *(_QWORD *)v40;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
        if (v19)
          v20 = v6;
        else
          v20 = 0;
        if (v19)
          v21 = objc_msgSend(v19, "lengthOfBytesUsingEncoding:", 4) + 1;
        else
          v21 = 0;
        v16 += v20 + v21;
        ++v18;
      }
      while (v15 != v18);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v15);
  }

  if (self->_parentIndices)
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = class_getInstanceSize(v22);
    parentIndices = self->_parentIndices;
  }
  else
  {
    parentIndices = 0;
    v23 = 0;
  }
  v25 = -[NSArray count](parentIndices, "count");
  v26 = (objc_class *)objc_opt_class();
  v27 = class_getInstanceSize(v26);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_parentIndices;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  v30 = v23 + v16 + 8 * v25;
  if (v29)
  {
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        if (*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v32))
          v33 = v27;
        else
          v33 = 0;
        v30 += v33;
        ++v32;
      }
      while (v29 != v32);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v29);
  }

  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_localRestPoseRotations.__end_cap_.__value_
                                             + *(_QWORD *)&self->_anon_8[16]
                                             + *(_QWORD *)&self->_anon_38[16]
                                             + (unint64_t)self->_inverseBindPose.__end_cap_.__value_
                                             + v30)
       - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_localRestPoseRotations.__begin_
                                             + *(_QWORD *)self->_anon_8
                                             + (unint64_t)self->_inverseBindPose.__begin_
                                             + *(_QWORD *)self->_anon_38);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)jointNames
{
  return self->_jointNames;
}

- (NSArray)parentIndices
{
  return self->_parentIndices;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  void *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;
  void *v6;

  objc_storeStrong((id *)&self->_parentIndices, 0);
  objc_storeStrong((id *)&self->_jointNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_inverseBindPose.__begin_;
  if (begin)
  {
    self->_inverseBindPose.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_38;
  if (v4)
  {
    *(_QWORD *)&self->_anon_38[8] = v4;
    operator delete(v4);
  }
  v5 = self->_localRestPoseRotations.__begin_;
  if (v5)
  {
    self->_localRestPoseRotations.__end_ = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(_QWORD *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
