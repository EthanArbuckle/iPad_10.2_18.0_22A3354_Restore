@implementation PHPTPUtilities

+ (BOOL)shouldExpungeAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "shouldExpungeAsset:withFileManager:", v5, v6);

  return (char)a1;
}

+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  __CFString *v37;
  NSObject *v38;
  __CFString *v39;
  NSObject *v40;
  __CFString *v41;
  NSObject *v42;
  __CFString *v43;
  NSObject *v44;
  __CFString *v45;
  NSObject *v46;
  __CFString *v47;
  NSObject *v48;
  __CFString *v49;
  NSObject *v50;
  __CFString *v51;
  NSObject *v52;
  __CFString *v53;
  NSObject *v54;
  __CFString *v55;
  NSObject *v56;
  __CFString *v57;
  NSObject *v58;
  __CFString *v59;
  NSObject *v60;
  __CFString *v61;
  NSObject *v62;
  __CFString *v63;
  NSObject *v64;
  __CFString *v65;
  uint64_t v66;
  NSObject *v67;
  __CFString *v68;
  __CFString *v69;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  __CFString *v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[128];
  uint8_t buf[4];
  const __CFString *v96;
  __int16 v97;
  __CFString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ptpProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ptpTrashedState");

  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_shortURI");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = v9;
    v97 = 2048;
    v98 = (__CFString *)v6;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Asset %{public}@ trashed state: 0x%llx", buf, 0x16u);

  }
  v10 = 1;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v4, 0, 0, 1);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
  if (v12)
  {
    v13 = v12;
    if ((v6 & 0x10000) != 0)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = *(_QWORD *)v91;
    if ((v6 & 0x8000) != 0)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v75 = (__CFString *)v16;
    v76 = (__CFString *)v14;
    if ((v6 & 0x4000) != 0)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    if ((v6 & 0x100) != 0)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v87 = (__CFString *)v18;
    v88 = (__CFString *)v17;
    if ((v6 & 0x80) != 0)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    if ((v6 & 2) != 0)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v85 = (__CFString *)v20;
    v86 = (__CFString *)v19;
    if ((v6 & 0x2000) != 0)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    if ((v6 & 0x40) != 0)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v83 = (__CFString *)v22;
    v84 = (__CFString *)v21;
    if ((v6 & 0x1000) != 0)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    if ((v6 & 0x800) != 0)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v81 = (__CFString *)v24;
    v82 = (__CFString *)v23;
    if ((v6 & 0x400) != 0)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    if ((v6 & 0x200) != 0)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v79 = (__CFString *)v26;
    v80 = (__CFString *)v25;
    if ((v6 & 8) != 0)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    if ((v6 & 4) != 0)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    v77 = (__CFString *)v28;
    v78 = (__CFString *)v27;
    if ((v6 & 1) != 0)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    v89 = (__CFString *)v29;
    while (1)
    {
      v30 = 0;
      while (2)
      {
        if (*(_QWORD *)v91 != v15)
          objc_enumerationMutation(v11);
        v31 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v30);
        v32 = objc_msgSend(v31, "type");
        v33 = 1;
        switch(v32)
        {
          case 1:
          case 2:
            PLPTPGetLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("OriginalTrashed");
              v97 = 2112;
              v98 = v89;
              v39 = v89;
              _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 1) != 0)
              goto LABEL_115;
            goto LABEL_122;
          case 3:
            PLPTPGetLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AudioTrashed");
              v97 = 2112;
              v98 = v79;
              v41 = v79;
              _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x200) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 4:
            PLPTPGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AlternateImageTrashed");
              v97 = 2112;
              v98 = v81;
              v43 = v81;
              _os_log_impl(&dword_1991EC000, v42, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x800) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 5:
            PLPTPGetLog();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustedImageTrashed");
              v97 = 2112;
              v98 = v77;
              v45 = v77;
              _os_log_impl(&dword_1991EC000, v44, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 4) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 6:
            PLPTPGetLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustedVideoTrashed");
              v97 = 2112;
              v98 = v78;
              v47 = v78;
              _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 8) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 7:
            PLPTPGetLog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjutmentDataTrashed");
              v97 = 2112;
              v98 = v85;
              v49 = v85;
              _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 2) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 8:
            PLPTPGetLog();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustmentBasePhotoTrashed");
              v97 = 2112;
              v98 = v86;
              v51 = v86;
              _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x80) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 9:
            PLPTPGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("PairedVideoTrashed");
              v97 = 2112;
              v98 = v82;
              v53 = v82;
              _os_log_impl(&dword_1991EC000, v52, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x1000) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 10:
            PLPTPGetLog();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustedPairedVideoTrashed");
              v97 = 2112;
              v98 = v80;
              v55 = v80;
              _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x400) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 11:
            PLPTPGetLog();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustmentBasePairedVideoTrashed");
              v97 = 2112;
              v98 = v88;
              v57 = v88;
              _os_log_impl(&dword_1991EC000, v56, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x4000) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 12:
            PLPTPGetLog();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("AdjustmentBaseVideoTrashed");
              v97 = 2112;
              v98 = v87;
              v59 = v87;
              _os_log_impl(&dword_1991EC000, v58, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x100) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 13:
          case 14:
          case 15:
          case 19:
          case 20:
            goto LABEL_54;
          case 16:
            PLPTPGetLog();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("OriginalAdjustmentDataTrashed");
              v97 = 2112;
              v98 = v83;
              v61 = v83;
              _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x40) == 0)
              goto LABEL_122;
            goto LABEL_115;
          case 17:
            PLPTPGetLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v96 = CFSTR("XMPTrashed");
              v97 = 2112;
              v98 = v84;
              v63 = v84;
              _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

            }
            if ((v6 & 0x2000) != 0)
              goto LABEL_115;
            goto LABEL_122;
          case 18:
            goto LABEL_129;
          default:
            if (v32 == 110)
            {
              PLPTPGetLog();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v96 = CFSTR("AdjutmentSecondaryDataTrashed");
                v97 = 2112;
                v98 = v76;
                v65 = v76;
                _os_log_impl(&dword_1991EC000, v64, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

              }
              v33 = (v6 & 0x10000) >> 16;
LABEL_54:
              PLPTPGetLog();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v35 = objc_msgSend(v31, "type");
                *(_DWORD *)buf = 134217984;
                v96 = (const __CFString *)v35;
                _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
              }

              if ((v33 & 1) == 0)
              {
LABEL_122:
                v10 = 0;
                goto LABEL_123;
              }
            }
            else
            {
              if (v32 != 113)
              {
LABEL_129:
                PLPTPGetLog();
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
                {
                  v72 = objc_msgSend(v31, "type");
                  objc_msgSend(v4, "objectID");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "pl_shortURI");
                  v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218242;
                  v96 = (const __CFString *)v72;
                  v97 = 2114;
                  v98 = v74;
                  _os_log_impl(&dword_1991EC000, v71, OS_LOG_TYPE_FAULT, "Unhandled resource type (%lu). Not expunging asset %{public}@.", buf, 0x16u);

                }
                v10 = 0;
                goto LABEL_123;
              }
              PLPTPGetLog();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v96 = CFSTR("DiagnosticFileTrashed");
                v97 = 2112;
                v98 = v75;
                v37 = v75;
                _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

              }
              if ((v6 & 0x8000) == 0)
                goto LABEL_122;
            }
LABEL_115:
            if (v13 != ++v30)
              continue;
            v66 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
            v13 = v66;
            if (!v66)
            {
              v10 = 1;
              goto LABEL_123;
            }
            break;
        }
        break;
      }
    }
  }
LABEL_123:

  PLPTPGetLog();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    if (v10)
      v68 = CFSTR("YES");
    else
      v68 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v96 = v68;
    v69 = v68;
    _os_log_impl(&dword_1991EC000, v67, OS_LOG_TYPE_DEBUG, "shouldExpunge: %@", buf, 0xCu);

  }
  return v10;
}

@end
