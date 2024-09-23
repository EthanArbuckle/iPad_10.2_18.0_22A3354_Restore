@implementation MRPlaybackQueueCreateFromCache

uint64_t __MRPlaybackQueueCreateFromCache_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  void *v40;
  double v41;
  uint64_t v42;
  double v43;
  void *v45;
  double v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  double v53;
  uint64_t ArtworkDataWidth;
  double v55;
  uint64_t ArtworkDataHeight;
  double v57;
  int v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  int v86;
  int v87;
  uint64_t v88;
  id obj;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  const __CFString *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  NSObject *v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (MRContentItemIsEmpty(v5) && objc_msgSend(v6, "shouldRequestItem"))
  {
    v7 = (__CFString *)MRContentItemCopyMinimalReadableDescription(v5);
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("Cached ContentItem is empty"));
    v8 = objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v101 = CFSTR("playbackQueue");
      v102 = 2114;
      v103 = v6;
      v104 = 2112;
      v105 = v8;
      v106 = 2112;
      v107 = v10;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }
LABEL_95:

    v20 = 0;
    goto LABEL_96;
  }
  if (objc_msgSend(v6, "includeRemoteArtwork"))
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v6, "requestedRemoteArtworkFormats");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    if (v12)
    {
      v13 = v12;
      v14 = a1;
      v15 = *(_QWORD *)v95;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v95 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v5, "remoteArtworks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No remote artwork for requested format: %@"), v17);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v20 = 0;
            goto LABEL_17;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
        if (v13)
          continue;
        break;
      }
      v7 = 0;
      v20 = 1;
LABEL_17:
      a1 = v14;
    }
    else
    {
      v7 = 0;
      v20 = 1;
    }

  }
  else
  {
    v7 = 0;
    v20 = 1;
  }
  if (objc_msgSend(v6, "includeArtwork"))
  {
    objc_msgSend(v6, "requestedArtworkFormats");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      objc_msgSend(v6, "artworkHeight");
      v88 = a1;
      if (v23 == -1.0 && (objc_msgSend(v6, "artworkWidth"), v24 == -1.0))
      {

        v25 = 0;
        v7 = CFSTR("artwork dimensions both -1");
      }
      else
      {
        v25 = 1;
      }
      v86 = v20;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      objc_msgSend(v6, "requestedArtworkFormats");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v91;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v91 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
            objc_msgSend(v5, "artworks");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              if (!objc_msgSend(v30, "isEqualToString:", CFSTR("MRContentItemArtworkFormatStandard"))
                || (objc_msgSend(v5, "artwork"),
                    v33 = (void *)objc_claimAutoreleasedReturnValue(),
                    v33,
                    !v33))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No artwork for requested format: %@"), v30);
                v49 = objc_claimAutoreleasedReturnValue();

                v7 = (__CFString *)v49;
                a1 = v88;
                goto LABEL_70;
              }
            }
            objc_msgSend(v32, "dimensions");
            v35 = v34;
            objc_msgSend(v32, "dimensions");
            v37 = (uint64_t)v36;
            objc_msgSend(v6, "artworkWidth");
            if ((uint64_t)v38 > v37 && v37 >= 1)
            {
              v40 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v6, "artworkWidth");
              objc_msgSend(v40, "stringWithFormat:", CFSTR("RequestedWidth %ld > ArtworkWidth %ld"), (uint64_t)v41, v37);
              v42 = objc_claimAutoreleasedReturnValue();

              v25 = 0;
              v7 = (__CFString *)v42;
            }
            objc_msgSend(v6, "artworkHeight");
            if ((uint64_t)v35 >= 1 && (uint64_t)v43 > (uint64_t)v35)
            {
              v45 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v6, "artworkHeight");
              objc_msgSend(v45, "stringWithFormat:", CFSTR("RequestedHeight %ld > ArtworkHeight %ld"), (uint64_t)v46, (uint64_t)v35);
              v47 = objc_claimAutoreleasedReturnValue();

              v25 = 0;
              v7 = (__CFString *)v47;
            }

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
          if (v27)
            continue;
          break;
        }
      }

      v48 = v25 & 1;
      a1 = v88;
      LODWORD(v20) = v86;
    }
    else
    {
      objc_msgSend(v5, "artworks");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("MRContentItemArtworkFormatStandard"));
      v51 = objc_claimAutoreleasedReturnValue();

      if ((MRContentItemGetHasArtworkData(v5) & 1) != 0 || v51)
      {
        if ((unint64_t)MRContentItemGetArtworkData(v5) | v51)
        {
          v52 = v7;
          v87 = v20;
          if (v51)
          {
            objc_msgSend((id)v51, "dimensions");
            ArtworkDataWidth = (uint64_t)v53;
            objc_msgSend((id)v51, "dimensions");
            ArtworkDataHeight = (uint64_t)v55;
          }
          else
          {
            ArtworkDataWidth = MRContentItemGetArtworkDataWidth(v5);
            ArtworkDataHeight = MRContentItemGetArtworkDataHeight(v5);
          }
          objc_msgSend(v6, "artworkWidth");
          v58 = 1;
          if (ArtworkDataWidth < 1 || ArtworkDataWidth >= (uint64_t)v57)
          {
            v7 = v52;
          }
          else
          {
            v59 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "artworkWidth");
            objc_msgSend(v59, "stringWithFormat:", CFSTR("RequestedWidth %ld > ArtworkWidth %ld"), (uint64_t)v60, ArtworkDataWidth);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v58 = 0;
          }
          objc_msgSend(v6, "artworkHeight");
          if (ArtworkDataHeight >= 1 && ArtworkDataHeight < (uint64_t)v61)
          {
            v62 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "artworkHeight");
            objc_msgSend(v62, "stringWithFormat:", CFSTR("RequestedHeight %ld > ArtworkHeight %ld"), (uint64_t)v63, ArtworkDataHeight);
            v64 = objc_claimAutoreleasedReturnValue();

            v58 = 0;
            v7 = (__CFString *)v64;
          }
          objc_msgSend(v6, "artworkHeight");
          if (v65 == -1.0)
          {
            objc_msgSend(v6, "artworkWidth");
            if (v66 == -1.0)
            {

              v58 = 0;
              v7 = CFSTR("artwork dimensions both -1");
            }
          }
          v48 = v58 != 0;
          LODWORD(v20) = v87;
        }
        else
        {

          v48 = 0;
          v7 = CFSTR("no artwork in item");
        }
      }
      else
      {
        v48 = 1;
      }

    }
    if ((v20 & v48 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
LABEL_70:
      v67 = MRContentItemCopyMinimalReadableDescription(v5);
      objc_msgSend(v67, "stringByAppendingFormat:", CFSTR(" %@"), v7);
      v68 = objc_claimAutoreleasedReturnValue();
      _MRLogForCategory(0xAuLL);
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v101 = CFSTR("playbackQueue");
        v102 = 2114;
        v103 = v6;
        v104 = 2112;
        v105 = v68;
        v106 = 2112;
        v107 = v70;
        _os_log_impl(&dword_193827000, v69, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
      }

      v20 = 0;
    }
  }
  if (objc_msgSend(v6, "includeInfo")
    && MRContentItemGetHasInfo(v5)
    && !MRContentItemGetInfo(v5))
  {
    v71 = MRContentItemCopyMinimalReadableDescription(v5);
    objc_msgSend(v71, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("has no info"));
    v72 = objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v101 = CFSTR("playbackQueue");
      v102 = 2114;
      v103 = v6;
      v104 = 2112;
      v105 = v72;
      v106 = 2112;
      v107 = v74;
      _os_log_impl(&dword_193827000, v73, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    v20 = 0;
  }
  if (objc_msgSend(v6, "includeLyrics"))
  {
    v75 = MRContentItemCopyMinimalReadableDescription(v5);
    objc_msgSend(v75, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("has no lyrics"));
    v76 = objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v101 = CFSTR("playbackQueue");
      v102 = 2114;
      v103 = v6;
      v104 = 2112;
      v105 = v76;
      v106 = 2112;
      v107 = v78;
      _os_log_impl(&dword_193827000, v77, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    v20 = 0;
  }
  if (objc_msgSend(v6, "includeLanguageOptions")
    && MRContentItemGetHasLanguageOptions(v5)
    && (!MRContentItemGetCurrentLanguageOptions(v5) || !MRContentItemGetAvailableLanguageOptions(v5)))
  {
    v79 = MRContentItemCopyMinimalReadableDescription(v5);
    objc_msgSend(v79, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("has no languageOptions"));
    v80 = objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v101 = CFSTR("playbackQueue");
      v102 = 2114;
      v103 = v6;
      v104 = 2112;
      v105 = v80;
      v106 = 2112;
      v107 = v82;
      _os_log_impl(&dword_193827000, v81, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    v20 = 0;
  }
  if (objc_msgSend(v6, "includeSections") && MRContentItemGetNumberOfSections(v5) >= 1)
  {
    v8 = MRContentItemCopyMinimalReadableDescription(v5);
    -[NSObject stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("has no sections"));
    v9 = objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0xAuLL);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v101 = CFSTR("playbackQueue");
      v102 = 2114;
      v103 = v6;
      v104 = 2112;
      v105 = v9;
      v106 = 2112;
      v107 = v84;
      _os_log_impl(&dword_193827000, v83, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    goto LABEL_95;
  }
LABEL_96:

  return v20;
}

@end
