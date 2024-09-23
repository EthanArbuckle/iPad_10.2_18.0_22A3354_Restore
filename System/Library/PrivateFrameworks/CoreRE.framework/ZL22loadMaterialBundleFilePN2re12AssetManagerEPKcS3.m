@implementation ZL22loadMaterialBundleFilePN2re12AssetManagerEPKcS3

re::DynamicString *___ZL22loadMaterialBundleFilePN2re12AssetManagerEPKcS3_S3_22MaterialBundleFileType_block_invoke(re::DynamicString *result, uint64_t a2)
{
  re::AssetPath *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  const re::MaterialTextureParam *v28;
  _anonymous_namespace_ *v29;
  _anonymous_namespace_ *v30;
  _anonymous_namespace_ *v31;
  os_unfair_lock_s *v32;
  unsigned int v33;
  _BOOL4 v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  char *v38;
  NSObject *v39;
  char *v40;
  char *v41;
  char *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  const re::MaterialTextureParam *v51;
  _anonymous_namespace_ *v52;
  _anonymous_namespace_ *v53;
  _anonymous_namespace_ *v54;
  _BOOL8 TextureAssetPaths;
  NSObject *v56;
  NSObject *v57;
  char *v58;
  char *v59;
  char *v60;
  int v61;
  int v62;
  int v63;
  _anonymous_namespace_ *v64;
  _QWORD *v65;
  int v66;
  re::AssetPath *v67;
  const re::AssetPath *v68;
  os_unfair_lock_s *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  int v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  char *v81;
  uint64_t v82;
  uint8_t v83[4];
  char *v84;
  __int16 v85;
  char *v86;
  uint8_t v87[4];
  _BYTE v88[18];
  uint8_t buf[4];
  _BYTE v90[20];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v65 = result;
  v3 = (re::AssetPath *)*((_QWORD *)result + 5);
  if (v3)
  {
    result = (re::DynamicString *)isAssetPathCustom((const re::AssetHandle *)(a2 + 104));
    if ((_DWORD)result)
    {
      v4 = *re::assetsLogObjects(result);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(_BYTE *)(a2 + 16) & 1) != 0)
          v5 = *(_QWORD *)(a2 + 24);
        else
          v5 = a2 + 17;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v5;
        _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, "Changing library path for material definition %s", buf, 0xCu);
      }
    }
    v6 = *(_QWORD *)(a2 + 408);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)(a2 + 424);
      v9 = 664 * v6;
      do
      {
        v10 = v8 + v7;
        v11 = isAssetPathCustom((const re::AssetHandle *)(v8 + v7 + 64));
        if (v11)
        {
          v12 = *re::assetsLogObjects((re *)v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v8 + v7;
            if ((*(_BYTE *)(v8 + v7 + 8) & 1) != 0)
              v14 = *(_QWORD *)(v13 + 16);
            else
              v14 = v13 + 9;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v90 = v14;
            _os_log_impl(&dword_224FE9000, v12, OS_LOG_TYPE_DEFAULT, "Changing library path for technique %s", buf, 0xCu);
          }
        }
        v15 = isAssetPathCustom((const re::AssetHandle *)(v10 + 88));
        if (v15)
        {
          v16 = *re::assetsLogObjects((re *)v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v8 + v7;
            if ((*(_BYTE *)(v8 + v7 + 8) & 1) != 0)
              v18 = *(_QWORD *)(v17 + 16);
            else
              v18 = v17 + 9;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v90 = v18;
            _os_log_impl(&dword_224FE9000, v16, OS_LOG_TYPE_DEFAULT, "Changing library path for technique %s vertex shader", buf, 0xCu);
          }
        }
        result = (re::DynamicString *)isAssetPathCustom((const re::AssetHandle *)(v8 + v7 + 144));
        if ((_DWORD)result)
        {
          v19 = *re::assetsLogObjects(result);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v8 + v7;
            if ((*(_BYTE *)(v8 + v7 + 8) & 1) != 0)
              v21 = *(_QWORD *)(v20 + 16);
            else
              v21 = v20 + 9;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v90 = v21;
            _os_log_impl(&dword_224FE9000, v19, OS_LOG_TYPE_DEFAULT, "Changing library path for technique %s pixel shader", buf, 0xCu);
          }
        }
        v7 += 664;
      }
      while (v9 != v7);
    }
  }
  v68 = (const re::AssetPath *)v65[7];
  v69 = (os_unfair_lock_s *)v65[6];
  v67 = (re::AssetPath *)v65[8];
  v64 = (_anonymous_namespace_ *)(*(_QWORD *)(v65[4] + 8) + 48);
  v22 = *(unsigned int *)(a2 + 280);
  if ((_DWORD)v22)
  {
    v23 = 0;
    v24 = (int *)(*(_QWORD *)(a2 + 264) + 8);
    while (1)
    {
      v25 = *v24;
      v24 += 22;
      if (v25 < 0)
        break;
      if (v22 == ++v23)
      {
        LODWORD(v23) = *(_DWORD *)(a2 + 280);
        break;
      }
    }
  }
  else
  {
    LODWORD(v23) = 0;
  }
  if ((_DWORD)v22 != (_DWORD)v23)
  {
    v26 = v23;
    v66 = *(_DWORD *)(a2 + 280);
    do
    {
      v27 = *(_QWORD *)(a2 + 264);
      *(_DWORD *)buf = 0;
      v28 = (const re::MaterialTextureParam *)(v27 + 88 * v26 + 48);
      *(_OWORD *)&v90[4] = 0u;
      v91 = 0u;
      v29 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v90[4], 0);
      v92 = 0u;
      v93 = 0u;
      v30 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v92, 0);
      v94 = 0;
      v74 = 0;
      v75 = 0u;
      v76 = 0u;
      v31 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v75, 0);
      v77 = 0u;
      v78 = 0u;
      re::DynamicString::setCapacity(&v77, 0);
      v79 = 0;
      if (generateTextureAssetPaths((re::AssetManager *)v69, v28, v68, v67, (re::AssetPath *)buf, (re::AssetPath *)&v74))
      {
        v32 = re::AssetManager::assetHandle(v69, (const re::AssetPath *)&v74, 1, (uint64_t *)v87);
        if (*(_QWORD *)&v88[4])
        {
          v33 = atomic_load((unsigned int *)(*(_QWORD *)&v88[4] + 704));
          v34 = v33 == 2;
        }
        else
        {
          v34 = 0;
        }
        v35 = *re::assetsLogObjects((re *)v32);
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v34)
        {
          LODWORD(v22) = v66;
          if (v36)
          {
            v37 = v35;
            v72 = 0;
            v73 = 0;
            v71 = 0;
            v70 = v75;
            re::DynamicString::setCapacity(&v70, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)&v74, (re::DynamicString *)&v70);
            v38 = (char *)&v71 + 1;
            if ((v71 & 1) != 0)
              v38 = v72;
            LODWORD(v80) = 136315138;
            *(_QWORD *)((char *)&v80 + 4) = v38;
            _os_log_impl(&dword_224FE9000, v37, OS_LOG_TYPE_DEFAULT, "Texture at %s already loaded", (uint8_t *)&v80, 0xCu);

            if (v70 && (v71 & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)v70 + 40))();
          }
        }
        else
        {
          if (v36)
          {
            v39 = v35;
            v72 = 0;
            v73 = 0;
            v71 = 0;
            v70 = *(_QWORD *)&v90[4];
            re::DynamicString::setCapacity(&v70, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)buf, (re::DynamicString *)&v70);
            if ((v71 & 1) != 0)
              v40 = v72;
            else
              v40 = (char *)&v71 + 1;
            v81 = 0;
            v82 = 0;
            v80 = (unint64_t)v75;
            re::DynamicString::setCapacity(&v80, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)&v74, (re::DynamicString *)&v80);
            v41 = (char *)&v80 + 9;
            if ((BYTE8(v80) & 1) != 0)
              v41 = v81;
            *(_DWORD *)v83 = 136315394;
            v84 = v40;
            v85 = 2080;
            v86 = v41;
            _os_log_impl(&dword_224FE9000, v39, OS_LOG_TYPE_DEFAULT, "Preloading texture as %s into %s", v83, 0x16u);

            if ((_QWORD)v80 && (BYTE8(v80) & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)v80 + 40))();
            if (v70 && (v71 & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)v70 + 40))();
          }
          if ((BYTE8(v92) & 1) != 0)
            v42 = (char *)v93;
          else
            v42 = (char *)&v92 + 9;
          createAssetHandleAtPathFromFile((uint64_t)&v70, (uint64_t)v69, (const re::AssetHandle *)v87, (uint64_t)v42, 0);
          LODWORD(v22) = v66;
          if ((_BYTE)v70)
          {
            LOBYTE(v80) = 1;
            re::AssetHandle::AssetHandle((re::AssetHandle *)((char *)&v80 + 8), (const re::AssetHandle *)&v71);
            re::DynamicArray<re::Optional<re::AssetHandle>>::add(v64, &v80);
            if ((_BYTE)v80)
              re::AssetHandle::~AssetHandle((re::AssetHandle *)((char *)&v80 + 8));
          }
          re::Result<re::AssetHandle,re::DetailedError>::~Result((uint64_t)&v70);
        }
        re::AssetHandle::~AssetHandle((re::AssetHandle *)v87);
      }
      if ((_QWORD)v77)
      {
        if ((BYTE8(v77) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v77 + 40))();
        v77 = 0u;
        v78 = 0u;
      }
      if ((_QWORD)v75 && (BYTE8(v75) & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v75 + 40))();
      if ((_QWORD)v92)
      {
        if ((BYTE8(v92) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v92 + 40))();
        v92 = 0u;
        v93 = 0u;
      }
      result = *(re::DynamicString **)&v90[4];
      if (*(_QWORD *)&v90[4] && (v90[12] & 1) != 0)
        result = (re::DynamicString *)(*(uint64_t (**)(void))(**(_QWORD **)&v90[4] + 40))();
      if (*(_DWORD *)(a2 + 280) <= (v23 + 1))
        v43 = v23 + 1;
      else
        v43 = *(_DWORD *)(a2 + 280);
      while (1)
      {
        v26 = (v23 + 1);
        if (v43 - 1 == (_DWORD)v23)
          break;
        LODWORD(v23) = v23 + 1;
        v44 = v26;
        if ((*(_DWORD *)(*(_QWORD *)(a2 + 264) + 88 * v26 + 8) & 0x80000000) != 0)
          goto LABEL_93;
      }
      v44 = v43;
LABEL_93:
      LODWORD(v23) = v44;
    }
    while ((_DWORD)v22 != v44);
  }
  v45 = *(unsigned int *)(a2 + 328);
  if ((_DWORD)v45)
  {
    v46 = 0;
    v47 = (int *)(*(_QWORD *)(a2 + 312) + 8);
    while (1)
    {
      v48 = *v47;
      v47 += 40;
      if (v48 < 0)
        break;
      if (v45 == ++v46)
      {
        LODWORD(v46) = *(_DWORD *)(a2 + 328);
        break;
      }
    }
  }
  else
  {
    LODWORD(v46) = 0;
  }
  if ((_DWORD)v45 != (_DWORD)v46)
  {
    v49 = v46;
    v63 = *(_DWORD *)(a2 + 328);
    do
    {
      v50 = *(_QWORD *)(a2 + 312);
      *(_DWORD *)buf = 0;
      v51 = (const re::MaterialTextureParam *)(v50 + 160 * v49 + 48);
      *(_OWORD *)&v90[4] = 0u;
      v91 = 0u;
      v52 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v90[4], 0);
      v92 = 0u;
      v93 = 0u;
      v53 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v92, 0);
      v94 = 0;
      v74 = 0;
      v75 = 0u;
      v76 = 0u;
      v54 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v75, 0);
      v77 = 0u;
      v78 = 0u;
      re::DynamicString::setCapacity(&v77, 0);
      v79 = 0;
      TextureAssetPaths = generateTextureAssetPaths((re::AssetManager *)v69, v51, v68, v67, (re::AssetPath *)buf, (re::AssetPath *)&v74);
      if (TextureAssetPaths)
      {
        v56 = *re::assetsLogObjects((re *)TextureAssetPaths);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = v56;
          v72 = 0;
          v73 = 0;
          v71 = 0;
          v70 = *(_QWORD *)&v90[4];
          re::DynamicString::setCapacity(&v70, 0);
          re::AssetPath::fullAssetPath((re::DynamicString *)buf, (re::DynamicString *)&v70);
          if ((v71 & 1) != 0)
            v58 = v72;
          else
            v58 = (char *)&v71 + 1;
          v81 = 0;
          v82 = 0;
          v80 = (unint64_t)v75;
          re::DynamicString::setCapacity(&v80, 0);
          re::AssetPath::fullAssetPath((re::DynamicString *)&v74, (re::DynamicString *)&v80);
          v59 = (char *)&v80 + 9;
          if ((BYTE8(v80) & 1) != 0)
            v59 = v81;
          *(_DWORD *)v87 = 136315394;
          *(_QWORD *)v88 = v58;
          *(_WORD *)&v88[8] = 2080;
          *(_QWORD *)&v88[10] = v59;
          _os_log_impl(&dword_224FE9000, v57, OS_LOG_TYPE_DEFAULT, "Preloading texture block texture as %s into %s", v87, 0x16u);

          if ((_QWORD)v80 && (BYTE8(v80) & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v80 + 40))();
          if (v70 && (v71 & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v70 + 40))();
        }
        re::AssetManager::assetHandle(v69, (const re::AssetPath *)&v74, 1, (uint64_t *)v87);
        if ((BYTE8(v92) & 1) != 0)
          v60 = (char *)v93;
        else
          v60 = (char *)&v92 + 9;
        createAssetHandleAtPathFromFile((uint64_t)&v70, (uint64_t)v69, (const re::AssetHandle *)v87, (uint64_t)v60, 0);
        LODWORD(v45) = v63;
        if ((_BYTE)v70)
        {
          LOBYTE(v80) = 1;
          re::AssetHandle::AssetHandle((re::AssetHandle *)((char *)&v80 + 8), (const re::AssetHandle *)&v71);
          re::DynamicArray<re::Optional<re::AssetHandle>>::add(v64, &v80);
          if ((_BYTE)v80)
            re::AssetHandle::~AssetHandle((re::AssetHandle *)((char *)&v80 + 8));
        }
        re::Result<re::AssetHandle,re::DetailedError>::~Result((uint64_t)&v70);
        re::AssetHandle::~AssetHandle((re::AssetHandle *)v87);
      }
      if ((_QWORD)v77)
      {
        if ((BYTE8(v77) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v77 + 40))();
        v77 = 0u;
        v78 = 0u;
      }
      if ((_QWORD)v75 && (BYTE8(v75) & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v75 + 40))();
      if ((_QWORD)v92)
      {
        if ((BYTE8(v92) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v92 + 40))();
        v92 = 0u;
        v93 = 0u;
      }
      result = *(re::DynamicString **)&v90[4];
      if (*(_QWORD *)&v90[4] && (v90[12] & 1) != 0)
        result = (re::DynamicString *)(*(uint64_t (**)(void))(**(_QWORD **)&v90[4] + 40))();
      if (*(_DWORD *)(a2 + 328) <= (v46 + 1))
        v61 = v46 + 1;
      else
        v61 = *(_DWORD *)(a2 + 328);
      while (1)
      {
        v49 = (v46 + 1);
        if (v61 - 1 == (_DWORD)v46)
          break;
        LODWORD(v46) = v46 + 1;
        v62 = v49;
        if ((*(_DWORD *)(*(_QWORD *)(a2 + 312) + 160 * v49 + 8) & 0x80000000) != 0)
          goto LABEL_143;
      }
      v62 = v61;
LABEL_143:
      LODWORD(v46) = v62;
    }
    while ((_DWORD)v45 != v62);
  }
  return result;
}

_anonymous_namespace_ *___ZL22loadMaterialBundleFilePN2re12AssetManagerEPKcS3_S3_22MaterialBundleFileType_block_invoke_2(_anonymous_namespace_ *result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  const re::MaterialTextureParam *v9;
  _anonymous_namespace_ *v10;
  _anonymous_namespace_ *v11;
  _anonymous_namespace_ *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  unsigned int v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  const re::MaterialTextureParam *v33;
  _anonymous_namespace_ *v34;
  _anonymous_namespace_ *v35;
  _anonymous_namespace_ *v36;
  _BOOL8 TextureAssetPaths;
  NSObject *v38;
  NSObject *v39;
  char *v40;
  char *v41;
  char *v42;
  int v43;
  int v44;
  int v45;
  _anonymous_namespace_ *v46;
  re::AssetPath *v47;
  const re::AssetPath *v48;
  os_unfair_lock_s *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 buf;
  char *v67;
  uint64_t v68;
  uint8_t v69[4];
  char *v70;
  __int16 v71;
  char *v72;
  uint8_t v73[4];
  _BYTE v74[18];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v47 = (re::AssetPath *)*((_QWORD *)result + 7);
  v48 = (const re::AssetPath *)*((_QWORD *)result + 6);
  v49 = (os_unfair_lock_s *)*((_QWORD *)result + 5);
  v46 = (_anonymous_namespace_ *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 48);
  v3 = *(unsigned int *)(a2 + 192);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = (int *)(*(_QWORD *)(a2 + 176) + 8);
    while (1)
    {
      v6 = *v5;
      v5 += 22;
      if (v6 < 0)
        break;
      if (v3 == ++v4)
      {
        LODWORD(v4) = *(_DWORD *)(a2 + 192);
        break;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  if ((_DWORD)v3 != (_DWORD)v4)
  {
    v7 = v4;
    do
    {
      v8 = *(_QWORD *)(a2 + 176);
      v60 = 0;
      v9 = (const re::MaterialTextureParam *)(v8 + 88 * v7 + 48);
      v61 = 0u;
      v62 = 0u;
      v10 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v61, 0);
      v63 = 0u;
      v64 = 0u;
      v11 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v63, 0);
      v65 = 0;
      v54 = 0;
      v55 = 0u;
      v56 = 0u;
      v12 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v55, 0);
      v57 = 0u;
      v58 = 0u;
      re::DynamicString::setCapacity(&v57, 0);
      v59 = 0;
      if (generateTextureAssetPaths((re::AssetManager *)v49, v9, v48, v47, (re::AssetPath *)&v60, (re::AssetPath *)&v54))
      {
        v13 = v3;
        v14 = re::AssetManager::assetHandle(v49, (const re::AssetPath *)&v54, 1, (uint64_t *)v73);
        if (*(_QWORD *)&v74[4])
        {
          v15 = atomic_load((unsigned int *)(*(_QWORD *)&v74[4] + 704));
          v16 = v15 == 2;
        }
        else
        {
          v16 = 0;
        }
        v17 = *re::assetsLogObjects((re *)v14);
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          v3 = v13;
          if (v18)
          {
            v19 = v17;
            v52 = 0;
            v53 = 0;
            v51 = 0;
            v50 = v55;
            re::DynamicString::setCapacity(&v50, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)&v54, (re::DynamicString *)&v50);
            v20 = (char *)&v51 + 1;
            if ((v51 & 1) != 0)
              v20 = v52;
            LODWORD(buf) = 136315138;
            *(_QWORD *)((char *)&buf + 4) = v20;
            _os_log_impl(&dword_224FE9000, v19, OS_LOG_TYPE_DEFAULT, "Texture at %s already loaded", (uint8_t *)&buf, 0xCu);

            if (v50 && (v51 & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)v50 + 40))();
          }
        }
        else
        {
          if (v18)
          {
            v21 = v17;
            v52 = 0;
            v53 = 0;
            v51 = 0;
            v50 = v61;
            re::DynamicString::setCapacity(&v50, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)&v60, (re::DynamicString *)&v50);
            if ((v51 & 1) != 0)
              v22 = v52;
            else
              v22 = (char *)&v51 + 1;
            v67 = 0;
            v68 = 0;
            buf = (unint64_t)v55;
            re::DynamicString::setCapacity(&buf, 0);
            re::AssetPath::fullAssetPath((re::DynamicString *)&v54, (re::DynamicString *)&buf);
            v23 = (char *)&buf + 9;
            if ((BYTE8(buf) & 1) != 0)
              v23 = v67;
            *(_DWORD *)v69 = 136315394;
            v70 = v22;
            v71 = 2080;
            v72 = v23;
            _os_log_impl(&dword_224FE9000, v21, OS_LOG_TYPE_DEFAULT, "Preloading texture as %s into %s", v69, 0x16u);

            if ((_QWORD)buf && (BYTE8(buf) & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)buf + 40))();
            if (v50 && (v51 & 1) != 0)
              (*(void (**)(void))(*(_QWORD *)v50 + 40))();
          }
          if ((BYTE8(v63) & 1) != 0)
            v24 = (char *)v64;
          else
            v24 = (char *)&v63 + 9;
          createAssetHandleAtPathFromFile((uint64_t)&v50, (uint64_t)v49, (const re::AssetHandle *)v73, (uint64_t)v24, 0);
          v3 = v13;
          if ((_BYTE)v50)
          {
            LOBYTE(buf) = 1;
            re::AssetHandle::AssetHandle((re::AssetHandle *)((char *)&buf + 8), (const re::AssetHandle *)&v51);
            re::DynamicArray<re::Optional<re::AssetHandle>>::add(v46, &buf);
            if ((_BYTE)buf)
              re::AssetHandle::~AssetHandle((re::AssetHandle *)((char *)&buf + 8));
          }
          re::Result<re::AssetHandle,re::DetailedError>::~Result((uint64_t)&v50);
        }
        re::AssetHandle::~AssetHandle((re::AssetHandle *)v73);
      }
      if ((_QWORD)v57)
      {
        if ((BYTE8(v57) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v57 + 40))();
        v57 = 0u;
        v58 = 0u;
      }
      if ((_QWORD)v55 && (BYTE8(v55) & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v55 + 40))();
      if ((_QWORD)v63)
      {
        if ((BYTE8(v63) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v63 + 40))();
        v63 = 0u;
        v64 = 0u;
      }
      result = (_anonymous_namespace_ *)v61;
      if ((_QWORD)v61 && (BYTE8(v61) & 1) != 0)
        result = (_anonymous_namespace_ *)(*(uint64_t (**)(void))(*(_QWORD *)v61 + 40))();
      if (*(_DWORD *)(a2 + 192) <= (v4 + 1))
        v25 = v4 + 1;
      else
        v25 = *(_DWORD *)(a2 + 192);
      while (1)
      {
        v7 = (v4 + 1);
        if (v25 - 1 == (_DWORD)v4)
          break;
        LODWORD(v4) = v4 + 1;
        v26 = v7;
        if ((*(_DWORD *)(*(_QWORD *)(a2 + 176) + 88 * v7 + 8) & 0x80000000) != 0)
          goto LABEL_61;
      }
      v26 = v25;
LABEL_61:
      LODWORD(v4) = v26;
    }
    while ((_DWORD)v3 != v26);
  }
  v27 = *(unsigned int *)(a2 + 240);
  if ((_DWORD)v27)
  {
    v28 = 0;
    v29 = (int *)(*(_QWORD *)(a2 + 224) + 8);
    while (1)
    {
      v30 = *v29;
      v29 += 40;
      if (v30 < 0)
        break;
      if (v27 == ++v28)
      {
        LODWORD(v28) = *(_DWORD *)(a2 + 240);
        break;
      }
    }
  }
  else
  {
    LODWORD(v28) = 0;
  }
  if ((_DWORD)v27 != (_DWORD)v28)
  {
    v31 = v28;
    v45 = *(_DWORD *)(a2 + 240);
    do
    {
      v32 = *(_QWORD *)(a2 + 224);
      v60 = 0;
      v33 = (const re::MaterialTextureParam *)(v32 + 160 * v31 + 48);
      v61 = 0u;
      v62 = 0u;
      v34 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v61, 0);
      v63 = 0u;
      v64 = 0u;
      v35 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v63, 0);
      v65 = 0;
      v54 = 0;
      v55 = 0u;
      v56 = 0u;
      v36 = (_anonymous_namespace_ *)re::DynamicString::setCapacity(&v55, 0);
      v57 = 0u;
      v58 = 0u;
      re::DynamicString::setCapacity(&v57, 0);
      v59 = 0;
      TextureAssetPaths = generateTextureAssetPaths((re::AssetManager *)v49, v33, v48, v47, (re::AssetPath *)&v60, (re::AssetPath *)&v54);
      if (TextureAssetPaths)
      {
        v38 = *re::assetsLogObjects((re *)TextureAssetPaths);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = v38;
          v52 = 0;
          v53 = 0;
          v51 = 0;
          v50 = v61;
          re::DynamicString::setCapacity(&v50, 0);
          re::AssetPath::fullAssetPath((re::DynamicString *)&v60, (re::DynamicString *)&v50);
          if ((v51 & 1) != 0)
            v40 = v52;
          else
            v40 = (char *)&v51 + 1;
          v67 = 0;
          v68 = 0;
          buf = (unint64_t)v55;
          re::DynamicString::setCapacity(&buf, 0);
          re::AssetPath::fullAssetPath((re::DynamicString *)&v54, (re::DynamicString *)&buf);
          v41 = (char *)&buf + 9;
          if ((BYTE8(buf) & 1) != 0)
            v41 = v67;
          *(_DWORD *)v73 = 136315394;
          *(_QWORD *)v74 = v40;
          *(_WORD *)&v74[8] = 2080;
          *(_QWORD *)&v74[10] = v41;
          _os_log_impl(&dword_224FE9000, v39, OS_LOG_TYPE_DEFAULT, "Preloading texture block texture as %s into %s", v73, 0x16u);

          if ((_QWORD)buf && (BYTE8(buf) & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)buf + 40))();
          if (v50 && (v51 & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v50 + 40))();
          LODWORD(v27) = v45;
        }
        re::AssetManager::assetHandle(v49, (const re::AssetPath *)&v54, 1, (uint64_t *)v73);
        if ((BYTE8(v63) & 1) != 0)
          v42 = (char *)v64;
        else
          v42 = (char *)&v63 + 9;
        createAssetHandleAtPathFromFile((uint64_t)&v50, (uint64_t)v49, (const re::AssetHandle *)v73, (uint64_t)v42, 0);
        if ((_BYTE)v50)
        {
          LOBYTE(buf) = 1;
          re::AssetHandle::AssetHandle((re::AssetHandle *)((char *)&buf + 8), (const re::AssetHandle *)&v51);
          re::DynamicArray<re::Optional<re::AssetHandle>>::add(v46, &buf);
          if ((_BYTE)buf)
            re::AssetHandle::~AssetHandle((re::AssetHandle *)((char *)&buf + 8));
        }
        re::Result<re::AssetHandle,re::DetailedError>::~Result((uint64_t)&v50);
        re::AssetHandle::~AssetHandle((re::AssetHandle *)v73);
      }
      if ((_QWORD)v57)
      {
        if ((BYTE8(v57) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v57 + 40))();
        v57 = 0u;
        v58 = 0u;
      }
      if ((_QWORD)v55 && (BYTE8(v55) & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v55 + 40))();
      if ((_QWORD)v63)
      {
        if ((BYTE8(v63) & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)v63 + 40))();
        v63 = 0u;
        v64 = 0u;
      }
      result = (_anonymous_namespace_ *)v61;
      if ((_QWORD)v61 && (BYTE8(v61) & 1) != 0)
        result = (_anonymous_namespace_ *)(*(uint64_t (**)(void))(*(_QWORD *)v61 + 40))();
      if (*(_DWORD *)(a2 + 240) <= (v28 + 1))
        v43 = v28 + 1;
      else
        v43 = *(_DWORD *)(a2 + 240);
      while (1)
      {
        v31 = (v28 + 1);
        if (v43 - 1 == (_DWORD)v28)
          break;
        LODWORD(v28) = v28 + 1;
        v44 = v31;
        if ((*(_DWORD *)(*(_QWORD *)(a2 + 224) + 160 * v31 + 8) & 0x80000000) != 0)
          goto LABEL_112;
      }
      v44 = v43;
LABEL_112:
      LODWORD(v28) = v44;
    }
    while ((_DWORD)v27 != v44);
  }
  return result;
}

@end
