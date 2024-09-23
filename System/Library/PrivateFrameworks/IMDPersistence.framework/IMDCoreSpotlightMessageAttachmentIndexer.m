@implementation IMDCoreSpotlightMessageAttachmentIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v38 = a4;
  v40 = a6;
  v39 = a7;
  v47 = v11;
  objc_msgSend(v11, "objectForKey:", CFSTR("hasAttachments"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v12, "BOOLValue");

  v13 = objc_msgSend(a1, "messageSupportsIndexingForItem:", v11);
  if ((_DWORD)a6 && v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attachments"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    if (objc_msgSend(v37, "count"))
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = v37;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v15)
      {
        v45 = *MEMORY[0x1E0D37FB8];
        v46 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v49 != v46)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("name"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "containsString:", v45) & 1) == 0)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("path"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "length");
              if (v19)
                v21 = v20 == 0;
              else
                v21 = 1;
              if (!v21)
                objc_msgSend(v41, "addObject:", v19);
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("guid"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKey:", CFSTR("guid"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKey:", CFSTR("attributedBody"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMDAttachmentSyndicationUtilities _syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:](IMDAttachmentSyndicationUtilities, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v22, v23, v24, objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "length") == 0;
              v27 = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              if (v26)
              {
                if (v27 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Failed to determine attachment name!", buf, 2u);
                  }

                }
              }
              else
              {
                if (v27 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v25;
                    _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Adding attachment name %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v43, "addObject:", v25);
              }
              IMUTITypeForFilename();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              if (v30)
              {
                if (v31 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v30;
                    _os_log_impl(&dword_1ABB60000, v32, OS_LOG_TYPE_INFO, "Adding attachment UTI type to %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v42, "addObject:", v30);
              }
              else if (v31 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Failed to determine attachment UTI type!", buf, 2u);
                }

              }
            }

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v41, "count"))
      {
        objc_msgSend(v40, "setAttachmentPaths:", v41);
      }
      else if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
             && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "No attachment Paths to add", buf, 2u);
        }

      }
      if (objc_msgSend(v43, "count"))
      {
        objc_msgSend(v40, "setAttachmentNames:", v43);
      }
      else if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
             && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "No attachment names to add", buf, 2u);
        }

      }
      if (objc_msgSend(v42, "count"))
      {
        objc_msgSend(v40, "setAttachmentTypes:", v42);
      }
      else if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
             && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v36, OS_LOG_TYPE_INFO, "No attachment types to add", buf, 2u);
        }

      }
      v14 = v37;
    }

  }
}

+ (id)auxiliaryItemsForPrimaryAttributes:(id)a3 withItem:(id)a4 chat:(id)a5 isReindexing:(BOOL)a6 timingProfiler:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  BOOL v29;
  int v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  NSObject *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  IMDSharedWithYouMetadataManager *v80;
  void *v81;
  NSObject *v82;
  id v83;
  _BOOL8 v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  id v106;
  uint64_t v108;
  id v109;
  uint64_t v111;
  uint64_t v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id obj;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  unsigned int v127;
  void *v128;
  void *v129;
  void *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  id v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  void *v147;
  void *v148;
  void *v149;
  uint8_t buf[4];
  unint64_t v151;
  __int16 v152;
  unint64_t v153;
  __int16 v154;
  void *v155;
  __int16 v156;
  void *v157;
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v115 = a3;
  v10 = a4;
  v123 = a5;
  v109 = a7;
  _IMDCoreRecentsApiInit();
  v137 = v10;
  objc_msgSend(v10, "objectForKey:", CFSTR("hasAttachments"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v11, "BOOLValue");

  LODWORD(v11) = objc_msgSend(a1, "messageSupportsIndexingForItem:", v10);
  objc_msgSend(v123, "objectForKey:", CFSTR("groupName"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("messageSummaryInfo"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "objectForKey:", *MEMORY[0x1E0D38348]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v12, "unsignedIntegerValue");

  v116 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0x1E0D39000;
  if ((a7 & v11) == 1)
  {
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("attachments"));
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v158, 16);
    if (!v124)
      goto LABEL_148;
    v118 = *MEMORY[0x1E0D38340];
    v120 = *MEMORY[0x1E0D37F60];
    v121 = *(_QWORD *)v144;
    v111 = *MEMORY[0x1E0D37F40];
    v112 = *MEMORY[0x1E0D37F38];
    while (1)
    {
      for (i = 0; i != v124; ++i)
      {
        if (*(_QWORD *)v144 != v121)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("guid"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "objectForKey:", CFSTR("guid"));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "objectForKey:", CFSTR("attributedBody"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDAttachmentSyndicationUtilities _syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:](IMDAttachmentSyndicationUtilities, "_syndicationIdentifierForAttachmentGUID:messageGUID:attributedBody:verbose:", v136, v138, v135, objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v125
          || (v16 = IMCMMAssetIndexFromIMFileTransferGUID(),
              objc_msgSend(v119, "objectForKey:", v118),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "unsignedIntegerValue"),
              v17,
              v16 >= v18))
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributionInfo"));
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "objectForKey:", v120);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          if (v133 && (objc_msgSend(v133, "BOOLValue") & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v151 = (unint64_t)v136;
                _os_log_impl(&dword_1ABB60000, v27, OS_LOG_TYPE_INFO, "Not donating attachment to CoreSpotlight because preview generation failed. attachmentGUID: %@", buf, 0xCu);
              }

            }
          }
          else
          {
            v20 = (void *)objc_msgSend(v115, "copy");
            v21 = IMCMMAssetIndexFromIMFileTransferGUID();
            v22 = objc_alloc(MEMORY[0x1E0D39930]);
            objc_msgSend(MEMORY[0x1E0D39928], "defaultPrefix");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = (void *)objc_msgSend(v22, "initWithMessageGUID:prefix:partNumber:", v138, v23, v21);

            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("path"));
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v132, "length"))
            {
              if (v132)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v132, 0);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                if (v122)
                {
                  objc_msgSend(v20, "setContentURL:", v122);
                  objc_msgSend(a1, "videoComplementPathForResourceURL:", v122);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v24)
                  {
                    objc_msgSend(a1, "livePhotoComplementKey");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setValue:forCustomKey:", v24, v25);

                  }
                }
                v149 = v132;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAttachmentPaths:", v26);

              }
              else
              {
                v122 = 0;
              }
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v129, "length"))
              {
                objc_msgSend(v20, "setTextContent:", v129);
                if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"))
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v151 = (unint64_t)v129;
                      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "setting text content %@", buf, 0xCu);
                    }

                  }
                }
              }
              v29 = objc_msgSend(v139, "length") == 0;
              v30 = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              if (v29)
              {
                if (v30 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Failed to determine attachment name!", buf, 2u);
                  }

                }
              }
              else
              {
                if (v30 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v151 = (unint64_t)v139;
                    _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "setting attachment name %@", buf, 0xCu);
                  }

                }
                v148 = v139;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAttachmentNames:", v32);

              }
              objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("knownSender"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = objc_msgSend(v34, "BOOLValue");

              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isCommSafetySensitive"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "BOOLValue");

              objc_msgSend(a1, "attachmentIndexTypeForPath:filename:isSticker:isCommSafetySensitive:knownSender:", v132, v129, objc_msgSend(a1, "_attachmentIsSticker:", v15), v36, v127);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              if (v130)
              {
                if (v37 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v151 = (unint64_t)v130;
                    _os_log_impl(&dword_1ABB60000, v38, OS_LOG_TYPE_INFO, "Setting attachment index type to %@", buf, 0xCu);
                  }

                }
                objc_msgSend(a1, "indexTypeCustomKey");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValue:forCustomKey:", v130, v39);

                objc_msgSend(v20, "setMessageType:", v130);
              }
              else if (v37 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1ABB60000, v40, OS_LOG_TYPE_INFO, "Failed to determine attachment index type!", buf, 2u);
                }

              }
              IMUTITypeForFilename();
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              if (v126)
              {
                if (v41 && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v151 = (unint64_t)v126;
                    _os_log_impl(&dword_1ABB60000, v42, OS_LOG_TYPE_INFO, "Setting attachment UTI type to %@", buf, 0xCu);
                  }

                }
                v147 = v126;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAttachmentTypes:", v43);

              }
              else if (v41 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, "Failed to determine attachment UTI type!", buf, 2u);
                }

              }
              if ((objc_msgSend(v130, "isEqualToString:", CFSTR("pa")) & v127) == 1)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v132);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_alloc(MEMORY[0x1E0D66EC8]);
                v142 = 0;
                v47 = (void *)objc_msgSend(v46, "initWithData:error:", v45, &v142);
                v113 = v142;
                if (v47)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "localizedName");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "localizedDescription");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "organizationName");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v49)
                    objc_msgSend(v48, "addObject:", v49);
                  if (v50)
                    objc_msgSend(v48, "addObject:", v50);
                  if (v51)
                    objc_msgSend(v48, "addObject:", v51);
                  objc_msgSend(v48, "componentsJoinedByString:", CFSTR(" "));
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setTextContent:", v52);

                }
                else if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
                       && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v20, "attributeDictionary");
                    v54 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v151 = (unint64_t)v54;
                    v152 = 2112;
                    v153 = (unint64_t)v113;
                    _os_log_impl(&dword_1ABB60000, v53, OS_LOG_TYPE_INFO, "Indexing .pkpass with attributes %@ error %@", buf, 0x16u);

                  }
                }

              }
              if ((objc_msgSend(v130, "isEqualToString:", CFSTR("ct")) & 1) != 0)
              {
                if (!v127)
                  goto LABEL_108;
              }
              else if ((objc_msgSend(v130, "isEqualToString:", CFSTR("loc")) & v127 & 1) == 0)
              {
                goto LABEL_108;
              }
              objc_msgSend(v137, "objectForKey:", CFSTR("flags"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "unsignedLongLongValue");

              if (!((v56 >> 2) & 1 | a6))
              {
                objc_msgSend(v137, "objectForKey:", CFSTR("time"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "objectForKey:", CFSTR("lalh"));
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "_stripFZIDPrefix");
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v137, "objectForKey:", CFSTR("handle"));
                v60 = (id)objc_claimAutoreleasedReturnValue();

                v141 = 0;
                _AddLocationsFromVCFToCoreRecents(v132, v138, v60, v57, &v141);
                v61 = v141;
                if (v61)
                {
                  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
                    && IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v151 = (unint64_t)v61;
                      _os_log_impl(&dword_1ABB60000, v62, OS_LOG_TYPE_INFO, "Got address to index %@", buf, 0xCu);
                    }

                  }
                  objc_msgSend(v20, "setFullyFormattedAddress:", v61);
                  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
                    && IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v151 = (unint64_t)v61;
                      _os_log_impl(&dword_1ABB60000, v63, OS_LOG_TYPE_INFO, "Setting address to %@", buf, 0xCu);
                    }

                  }
                }

              }
              if (objc_msgSend(v130, "isEqualToString:", CFSTR("loc")))
              {
                +[IMDContactCache contactsForVCardAtPath:](IMDContactCache, "contactsForVCardAtPath:", v132);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "firstObject");
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                +[IMDContactCache vCardNameForContact:](IMDContactCache, "vCardNameForContact:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                +[IMDContactCache vCardMapURLForContact:](IMDContactCache, "vCardMapURLForContact:", v65);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = 0;
                +[IMDContactCache vCardCoordinateForMapURL:outLatitude:outLongitude:](IMDContactCache, "vCardCoordinateForMapURL:outLatitude:outLongitude:", v67, (char *)&v140 + 4, &v140);
                objc_msgSend(v20, "setTextContent:", v66);
                objc_msgSend(v20, "setFullyFormattedAddress:", 0);
                +[IMDContactCache updateAttributes:withAddressFromContact:](IMDContactCache, "updateAttributes:withAddressFromContact:", v20, v65);
                LODWORD(v68) = HIDWORD(v140);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setLatitude:", v69);

                LODWORD(v70) = v140;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setLongitude:", v71);

                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v67);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setURL:", v72);

                if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
                  && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v73 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v20, "attributeDictionary");
                    v74 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v151 = (unint64_t)v74;
                    _os_log_impl(&dword_1ABB60000, v73, OS_LOG_TYPE_INFO, "Indexing .loc.vcf with attributes %@", buf, 0xCu);

                  }
                }

              }
LABEL_108:

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("uti"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (v75)
              objc_msgSend(v20, "setContentType:", v75);
            objc_msgSend(v137, "objectForKey:", CFSTR("syndicationRanges"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isCommSafetySensitive"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "BOOLValue");

            if ((objc_msgSend(a1, "_attachmentIsSticker:", v15) & 1) == 0)
            {
              LOBYTE(v108) = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
              v79 = +[IMDAttachmentSyndicationUtilities _attachmentSyndicationTypeForAttachmentGUID:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCommSafetySensitive:verbose:](IMDAttachmentSyndicationUtilities, "_attachmentSyndicationTypeForAttachmentGUID:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCommSafetySensitive:verbose:", v136, v139, v75, v135, v76, v78, v108, v109);
              if (v79 == 1)
              {
                LOBYTE(v108) = objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled");
                v84 = +[IMDAttachmentSyndicationUtilities _attachmentGUIDIsSyndicatable:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCMM:verbose:](IMDAttachmentSyndicationUtilities, "_attachmentGUIDIsSyndicatable:syndicationIdentifier:attachmentUTI:attributedBody:encodedSyndicationRanges:isCMM:verbose:", v136, v139, v75, v135, v76, v125 != 0, v108);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "attachmentIsSyndicatableMediaKey");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValue:forCustomKey:", v85, v86);

                if (objc_msgSend(v139, "hasPrefix:", CFSTR("at_")))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setEligibleForPhotosProcessing:", v87);

                }
                else if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v88 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v151 = (unint64_t)v139;
                    _os_log_impl(&dword_1ABB60000, v88, OS_LOG_TYPE_INFO, "Not marking item as Syndicatable. identifier: %@", buf, 0xCu);
                  }

                }
              }
              else if (!v79)
              {
                v80 = objc_alloc_init(IMDSharedWithYouMetadataManager);
                -[IMDSharedWithYouMetadataManager updateAttributesWithSharedWithYouMetadata:withItem:chat:](v80, "updateAttributesWithSharedWithYouMetadata:withItem:chat:", v20, v137, v123);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                if (v81)
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v82 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1ABB60000, v82, OS_LOG_TYPE_INFO, "Appended Shared with You meta-data", buf, 2u);
                    }

                  }
                  v83 = v81;

                  v20 = v83;
                }

              }
            }
            if (v134)
            {
              objc_msgSend(v134, "objectForKey:", v112);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              if (v89)
              {
                objc_msgSend(a1, "momentShareURLKey");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValue:forCustomKey:", v89, v90);

              }
              objc_msgSend(v134, "objectForKey:", v111);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              if (v91)
              {
                objc_msgSend(a1, "assetUUIDKey");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setValue:forCustomKey:", v91, v92);

              }
            }
            objc_msgSend(v123, "objectForKey:", CFSTR("guid"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
              && IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v94 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v151 = (unint64_t)v138;
                v152 = 2112;
                v153 = (unint64_t)v93;
                _os_log_impl(&dword_1ABB60000, v94, OS_LOG_TYPE_INFO, "Creating new attribute set with messageGUID %@ chatGUID %@", buf, 0x16u);
              }

            }
            _IMDCoreSpotlightChatUIDForChatDictionary(v123);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            if (v95)
            {
              objc_msgSend(a1, "chatUniqueIdentifierKey");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setValue:forCustomKey:", v95, v96);

            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1ABB60000, v97, OS_LOG_TYPE_INFO, "Not donating the chat's unique identifier to spotlight because it was nil.", buf, 2u);
              }

            }
            objc_msgSend(v20, "setAccountIdentifier:", v93);
            objc_msgSend(v20, "setOwnerIdentifier:", v138);
            objc_msgSend(v20, "setRelatedUniqueIdentifier:", v138);
            objc_msgSend(v128, "encodedMessagePartGUID");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "textContent");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "objectForKey:", CFSTR("time"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "associateMessageEntityWithIdentifier:displayTitle:displaySubtitle:date:", v98, v99, v114, v100);

            v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v139, CFSTR("attachmentDomain"), v20);
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "setExpirationDate:", v102);

            objc_msgSend(v116, "addObject:", v101);
          }

          goto LABEL_146;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218754;
            v151 = v16;
            v152 = 2048;
            v153 = v18;
            v154 = 2112;
            v155 = v136;
            v156 = 2112;
            v157 = v139;
            _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Not donating CMM preview attachment to CoreSpotlight. attachmentIndex: %lu, cmmOffset: %lu, attachmentGUID: %@, syndicationIdentifier: %@", buf, 0x2Au);
          }

        }
LABEL_146:

      }
      v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v158, 16);
      if (!v124)
      {
LABEL_148:

        v13 = 0x1E0D39000uLL;
        break;
      }
    }
  }
  if (objc_msgSend(*(id *)(v13 + 1992), "verboseLoggingEnabled"))
  {
    objc_msgSend(v137, "objectForKey:", CFSTR("guid"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        v105 = objc_msgSend(v116, "count");
        *(_DWORD *)buf = 134218242;
        v151 = v105;
        v152 = 2112;
        v153 = (unint64_t)v103;
        _os_log_impl(&dword_1ABB60000, v104, OS_LOG_TYPE_INFO, "Generated %lu aux items for message guid %@", buf, 0x16u);
      }

    }
  }
  v106 = v116;

  return v106;
}

+ (id)attachmentIndexTypeForPath:(id)a3 filename:(id)a4 isSticker:(BOOL)a5 isCommSafetySensitive:(BOOL)a6 knownSender:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  char v17;
  int v18;
  int v19;
  char v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  const __CFString *v30;
  BOOL v31;
  int v32;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("vcf"));
  v16 = objc_msgSend(v14, "im_isAudioMessageExtension");
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("pluginpayload")) & 1) != 0)
    v17 = 1;
  else
    v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("pluginpayloadattachment"));
  v18 = objc_msgSend(v14, "isEqualToString:", CFSTR("pkpass"));
  v19 = objc_msgSend(v14, "isEqualToString:", CFSTR("order"));
  v20 = v16 | v17;
  if (v16)
    v21 = CFSTR("ad");
  else
    v21 = CFSTR("pp");
  if ((v20 & 1) == 0)
  {
    if (((v18 | v19) & 1) != 0)
    {
      v21 = CFSTR("pa");
    }
    else if (v15)
    {
      objc_msgSend(v12, "stringByDeletingPathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pathExtension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("loc"));

      if (v24)
        v21 = CFSTR("loc");
      else
        v21 = CFSTR("ct");
    }
    else
    {
      IMUTITypeForFilename();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D399C0], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "previewGeneratorClassForUTIType:", v25);

      if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
        && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v34 = 138412546;
          v35 = v25;
          v36 = 2112;
          v37 = v27;
          _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "UTI Type is %@ generator class is %@", (uint8_t *)&v34, 0x16u);
        }

      }
      if (objc_msgSend(v27, "isEqual:", objc_opt_class()))
      {
        if (v9)
        {
          v29 = CFSTR("st");
        }
        else if (v7 && (IMDCoreSpotlightPhotoAtPathIsScreenshot(v11) & 1) != 0)
        {
          v29 = CFSTR("scr");
        }
        else
        {
          v29 = CFSTR("pto");
        }
      }
      else
      {
        if (objc_msgSend(v27, "isEqual:", objc_opt_class()))
        {
          v29 = CFSTR("apto");
          v30 = CFSTR("st");
          v31 = !v9;
        }
        else
        {
          v32 = objc_msgSend(v27, "isEqual:", objc_opt_class());
          v29 = CFSTR("at");
          v30 = CFSTR("mov");
          v31 = v32 == 0;
        }
        if (!v31)
          v29 = v30;
      }
      if (v8)
        v21 = CFSTR("csspto");
      else
        v21 = v29;

    }
  }

  return (id)v21;
}

+ (BOOL)_attachmentIsSticker:(id)a3
{
  void *v4;
  char v5;

  if (IMDCoreSpotlightMessageAttachmentIndexer_TestOverrideIsSticker)
    return 1;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isSticker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)messageSupportsIndexingForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("balloonBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("hasAttachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("messageSummaryInfo"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKey:](v7, "objectForKey:", *MEMORY[0x1E0D38348]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = v9 == 4 || v4 == 0;
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "messageSummaryInfo: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        if (v6)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        if (v4)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v18 = 138413058;
        v19 = v14;
        if (v9)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        if (v10)
          v13 = CFSTR("YES");
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "messageHasAttachments %@ isPlugin %@ isCMM %@ messageSupportsIndexing %@", (uint8_t *)&v18, 0x2Au);
      }

    }
  }

  return v10;
}

+ (id)_possibleVideoComplementExtensions
{
  return &unk_1E5ADC2D0;
}

+ (id)videoComplementPathForResourceURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_possibleVideoComplementExtensions");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v20 = v5;
    v10 = 0;
    v11 = *(_QWORD *)v23;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      if ((objc_msgSend(v21, "isEqualToString:", v13) & 1) != 0)
        goto LABEL_11;
      objc_msgSend(v6, "stringByAppendingPathExtension:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v13, "uppercaseString");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathExtension:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = objc_msgSend(v18, "fileExistsAtPath:", v10);

      if ((v17 & 1) != 0)
        break;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          goto LABEL_3;
LABEL_11:

        v14 = 0;
        goto LABEL_14;
      }
    }
    v14 = v10;
LABEL_14:
    v5 = v20;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)attachmentRecordsFromAttachments:(id)a3
{
  return a3;
}

+ (id)attachmentIsSyndicatableMediaKey
{
  if (qword_1ED0D38E0 != -1)
    dispatch_once(&qword_1ED0D38E0, &unk_1E5AB75F8);
  return (id)qword_1ED0D38F8;
}

+ (id)livePhotoComplementKey
{
  if (qword_1ED0D38F0 != -1)
    dispatch_once(&qword_1ED0D38F0, &unk_1E5AAE658);
  return (id)qword_1ED0D38E8;
}

+ (id)momentShareURLKey
{
  if (qword_1EEC40458 != -1)
    dispatch_once(&qword_1EEC40458, &unk_1E5AB7618);
  return (id)qword_1EEC40450;
}

+ (id)assetUUIDKey
{
  if (qword_1EEC40468 != -1)
    dispatch_once(&qword_1EEC40468, &unk_1E5AAE678);
  return (id)qword_1EEC40460;
}

@end
