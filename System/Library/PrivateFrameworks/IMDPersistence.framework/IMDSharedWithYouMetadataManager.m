@implementation IMDSharedWithYouMetadataManager

+ (Class)LPSharedObjectMetadataClass
{
  if (qword_1EEC40608 != -1)
    dispatch_once(&qword_1EEC40608, &unk_1E5AAF348);
  return (Class)(id)qword_1EEC40600;
}

+ (Class)LPSpecializationMetadataClass
{
  if (qword_1EEC40618 != -1)
    dispatch_once(&qword_1EEC40618, &unk_1E5AAE778);
  return (Class)(id)qword_1EEC40610;
}

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  void *v11;
  CC_SHA256_CTX v13;
  unsigned __int8 md[16];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  memset(&v13, 0, sizeof(v13));
  v6 = a3;
  CC_SHA256_Init(&v13);
  v7 = objc_retainAutorelease(v6);
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(_QWORD *)&v13.wbuf[14]);
  v9 = objc_msgSend(v7, "length");

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    v10 = objc_retainAutorelease(v5);
    CC_SHA256_Update(&v13, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  }
  *(_OWORD *)md = 0u;
  v15 = 0u;
  CC_SHA256_Final(md, &v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

  return v11;
}

- (id)updateAttributesWithSharedWithYouMetadata:(id)a3 withItem:(id)a4 chat:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  BOOL v51;
  void *v53;
  uint64_t v54;
  void *v55;
  _BOOL4 v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  _BOOL4 v60;
  _BOOL4 v61;
  _BOOL4 v62;
  NSObject *v63;
  id v64;
  __CFString *v65;
  int v66;
  int v67;
  int v68;
  int v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id obj;
  void *v91;
  __CFString *v92;
  __CFString *v93;
  void *v94;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  __CFString *v109;
  __int16 v110;
  const __CFString *v111;
  __int16 v112;
  const __CFString *v113;
  __int16 v114;
  const __CFString *v115;
  __int16 v116;
  const __CFString *v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v99 = a4;
  v8 = a5;
  v98 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1ABC632C4();

  }
  v91 = v8;
  objc_msgSend(v8, "objectForKey:", CFSTR("lalh"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_stripFZIDPrefix");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v99, "objectForKey:", CFSTR("flags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  v88 = (v13 >> 2) & 1;
  if ((_DWORD)v88)
  {
    v14 = v94;
  }
  else
  {
    objc_msgSend(v99, "objectForKey:", CFSTR("handle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_stripFZIDPrefix");
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v16;
  }
  v92 = v14;
  v17 = MEMORY[0x1AF434F1C]();
  objc_msgSend(v99, "objectForKey:", CFSTR("guid"));
  v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v17 & 1) != 0)
  {
    v18 = v98;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v109 = v93;
        v110 = 2112;
        v111 = v92;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata Message: %@ shared by business chat with ID: %@", buf, 0x16u);
      }

      v18 = v98;
    }
    goto LABEL_134;
  }
  objc_msgSend(v98, "URL");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dataDetectedLink");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setValue:forCustomKey:", v20, v21);
  }
  else
  {
    objc_msgSend(v99, "objectForKey:", CFSTR("attributedBody"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    IMDCoreSpotlightURLFromAttributedMessageBody(v20);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v96)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isDataDetectedLinkAllowedForSWY:", v96);

    if (!v26)
      goto LABEL_17;
    objc_msgSend(v98, "setURL:", v96);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dataDetectedLink");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setValue:forCustomKey:", v21, v27);

  }
LABEL_17:

  if (-[IMDSharedWithYouMetadataManager _isLNKTypeMessage:](self, "_isLNKTypeMessage:", v98))
  {
    -[IMDSharedWithYouMetadataManager _pluginPayloadAttachmentPathsForItem:](self, "_pluginPayloadAttachmentPathsForItem:", v99);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDSharedWithYouMetadataManager _lpLinkMetadataForItem:attachmentPaths:originalURL:](self, "_lpLinkMetadataForItem:attachmentPaths:originalURL:", v99, v89, v96);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89 = 0;
    v22 = 0;
  }
  v87 = (void *)v22;
  v23 = -[IMDSharedWithYouMetadataManager _shouldDonateToSharedWithYou:lpLinkMetadata:](self, "_shouldDonateToSharedWithYou:lpLinkMetadata:", v96);
  if (v96)
  {
    if (!v23)
      goto LABEL_22;
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v93;
        _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "Appending highlight metadata Message: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("hasAttachments"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if (v32)
    {
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("attachments"));
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v105;
        v36 = 1;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v105 != v35)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("isCommSafetySensitive"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "BOOLValue");

            if (v39)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v109 = v93;
                  _os_log_impl(&dword_1ABB60000, v40, OS_LOG_TYPE_INFO, "Setting highlight metadata for Message: %@ to be hidden because flagged as CommSafety sensitive.", buf, 0xCu);
                }

              }
              v36 = 4;
              goto LABEL_51;
            }
          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
          if (v34)
            continue;
          break;
        }
      }
      else
      {
        v36 = 1;
      }
LABEL_51:

    }
    else
    {
      v36 = 1;
    }
    objc_msgSend(v99, "objectForKey:", CFSTR("syndicationRanges"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "objectForKey:", CFSTR("time"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(MEMORY[0x1E0D39948], "rangesFromSerializedString:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v41;
      if (v41)
      {
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        obj = v41;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v101;
          while (2)
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v101 != v43)
                objc_enumerationMutation(obj);
              v45 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
              if (objc_msgSend(v45, "syndicationStatus") == 2)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v109 = v93;
                    _os_log_impl(&dword_1ABB60000, v63, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata for Message: %@ since its been marked as Do not donate", buf, 0xCu);
                  }

                }
                v64 = v98;

                goto LABEL_135;
              }
              v46 = objc_msgSend(v45, "syndicationType");
              v47 = objc_msgSend(v45, "syndicationType") & 1;
              v48 = v46 & 4;
              v49 = objc_msgSend(v45, "syndicationType") & 8;
              v50 = 4;
              if ((v46 & 4) == 0)
                v50 = v36;
              if (v47)
                v51 = 1;
              else
                v51 = v49 == 0;
              if (!v51 && v48 == 0)
                v50 = 8;
              if (((v47 == 0) | (v46 >> 2) & 1) == 1)
                v36 = v50;
              else
                v36 = 2;
              objc_msgSend(v45, "syndicationStartDate");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                objc_msgSend(v45, "syndicationStartDate");
                v54 = objc_claimAutoreleasedReturnValue();
                v55 = (void *)v54;
                if (v97)
                {
                  v56 = objc_msgSend(v97, "compare:", v54) == -1;

                  if (v56)
                  {
                    objc_msgSend(v45, "syndicationStartDate");
                    v57 = objc_claimAutoreleasedReturnValue();

                    v97 = (void *)v57;
                  }
                }
                else
                {
                  v97 = (void *)v54;
                }
              }
            }
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
            if (v42)
              continue;
            break;
          }
          v58 = v48 >> 2;
          v59 = v47;
          v42 = v49 >> 3;
        }
        else
        {
          LODWORD(v58) = 0;
          v59 = 0;
        }

      }
      else
      {
        LODWORD(v58) = 0;
        v59 = 0;
        LODWORD(v42) = 0;
      }

      v60 = v58 != 0;
      v61 = v59 != 0;
      v62 = v42 != 0;
    }
    else
    {
      v60 = 0;
      v61 = 0;
      v62 = 0;
    }
    _IMDCoreSpotlightCNContactForAddress(v92);
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v65);
    v67 = v66;
    if (((v66 | v60) & 1) != 0)
      v68 = v66 ^ 1;
    else
      v68 = v61 || v62;
    v69 = IMOSLoggingEnabled();
    if (v67 | v68 | v88)
    {
      if (v69)
      {
        OSLogHandleForIMFoundationCategory();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v109 = v93;
          _os_log_impl(&dword_1ABB60000, v70, OS_LOG_TYPE_INFO, "Appending highlight metadata for Message: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setSyndicationStatus:", v71);

      if (v97)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v93;
            _os_log_impl(&dword_1ABB60000, v72, OS_LOG_TYPE_INFO, "Appending highlight server date for Message: %@", buf, 0xCu);
          }

        }
        -[IMDSharedWithYouMetadataManager _highlightedContentServerDateKey](self, "_highlightedContentServerDateKey");
        v73 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setValue:forCustomKey:", v97, v73);
      }
      else
      {
        IMLogHandleForCategory();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          sub_1ABC63298();
      }

      objc_msgSend(v99, "objectForKey:", CFSTR("time"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDSharedWithYouMetadataManager _updateAttributesWithCollaborationMetadata:forMessageWithGUID:withURL:lpLinkMetadata:messageDate:](self, "_updateAttributesWithCollaborationMetadata:forMessageWithGUID:withURL:lpLinkMetadata:messageDate:", v98, v93, v96, v87, v75);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        -[IMDSharedWithYouMetadataManager updateConversationManagerWithItem:chat:attributes:](self, "updateConversationManagerWithItem:chat:attributes:", v99, v91, v18);

    }
    else
    {
      v18 = v98;
      if (v69)
      {
        OSLogHandleForIMFoundationCategory();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v109 = v92;
          v110 = 2112;
          v111 = v65;
          _os_log_impl(&dword_1ABB60000, v74, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata for Message since sender %@ is not known. Contact: %@", buf, 0x16u);
        }

        v18 = v98;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        v77 = CFSTR("YES");
        if ((v36 & 1) != 0)
          v78 = CFSTR("YES");
        else
          v78 = CFSTR("NO");
        *(_DWORD *)buf = 138413314;
        v109 = v93;
        if ((v36 & 2) != 0)
          v79 = CFSTR("YES");
        else
          v79 = CFSTR("NO");
        v110 = 2112;
        v111 = v78;
        if ((v36 & 4) != 0)
          v80 = CFSTR("YES");
        else
          v80 = CFSTR("NO");
        v112 = 2112;
        v113 = v79;
        if ((v36 & 8) == 0)
          v77 = CFSTR("NO");
        v114 = 2112;
        v115 = v80;
        v116 = 2112;
        v117 = v77;
        _os_log_impl(&dword_1ABB60000, v76, OS_LOG_TYPE_INFO, "Highlight type for Message: %@. automatic %@ starred %@ hidden %@ userInteracted %@", buf, 0x34u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocal:", v81);

    objc_msgSend(v18, "isShared");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (v83)
      objc_msgSend(v18, "setShared:", MEMORY[0x1E0C9AAA0]);

    goto LABEL_133;
  }
  objc_msgSend(v98, "attachmentNames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count") == 0;

  if (!v29)
    goto LABEL_30;
LABEL_22:
  v18 = v98;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v109 = v93;
      _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "NOT Appending highlight metadata Message: %@ since LP recommended that we do not.", buf, 0xCu);
    }

    v18 = v98;
  }
LABEL_133:

LABEL_134:
  v64 = v18;
LABEL_135:

  return v64;
}

- (id)_updateAttributesWithCollaborationMetadata:(id)a3 forMessageWithGUID:(id)a4 withURL:(id)a5 lpLinkMetadata:(id)a6 messageDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char isKindOfClass;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  id v78;
  NSObject *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  const __CFString *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v88 = a4;
  v87 = a5;
  v13 = a6;
  v14 = a7;
  if (v12)
  {
    v15 = v12;
    if (!-[IMDSharedWithYouMetadataManager _isLNKTypeMessage:](self, "_isLNKTypeMessage:", v15))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v91 = (uint64_t)v15;
          _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Message was not detected as a link, skipping adding collaboration metadata. attributes: %@", buf, 0xCu);
        }

      }
      goto LABEL_88;
    }
    v85 = objc_alloc_init(MEMORY[0x1E0D39B30]);
    objc_msgSend(v13, "collaborationMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "collaborationMetadata");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = CFSTR("YES");
        if (!v16)
          v20 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v91 = (uint64_t)v20;
        v92 = 2112;
        v93 = v18;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "hasCollaborationMetadata: %@ CollaborationMetadata: %@", buf, 0x16u);

      }
    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "urlMinusFragment:onlyCKURL:", v21, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setURL:", v83);
      objc_msgSend(v13, "collaborationMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "collaborationIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v86, "length");
      if (v23)
      {
        v24 = 1;
      }
      else
      {
        IMLogHandleForCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1ABC6343C();

        v24 = 2;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v91 = v24;
          v92 = 2112;
          v93 = (uint64_t)v88;
          v94 = 2112;
          v95 = CFSTR("YES");
          _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Setting share status to %lu for MessageGUID: %@. hasCollaborationMetadata: %@", buf, 0x20u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShared:", v29);

      -[IMDSharedWithYouMetadataManager _syndicationContentTypeKey](self, "_syndicationContentTypeKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forCustomKey:", &unk_1E5ADC120, v30);

      if (v23)
        objc_msgSend(v15, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FPIsTopLevelSharedItem"));
      -[IMDSharedWithYouMetadataManager titleFromLPLinkMetadata:](self, "titleFromLPLinkMetadata:", v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "length"))
      {
        v32 = v31;
      }
      else
      {
        -[IMDSharedWithYouMetadataManager _lpTitleCustomKey](self, "_lpTitleCustomKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForCustomKey:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v34;
      }
      if (objc_msgSend(v32, "length", v32))
      {
        objc_msgSend(v15, "setFilename:", v82);
      }
      else
      {
        objc_msgSend(v15, "filename");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v15, "setFilename:", v35);

      }
      objc_msgSend(v13, "collaborationMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "contentType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v38, "length"))
      {
        objc_msgSend(v13, "specialization");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDSharedWithYouMetadataManager LPSharedObjectMetadataClass](IMDSharedWithYouMetadataManager, "LPSharedObjectMetadataClass");
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "specialization");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "specialization");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDSharedWithYouMetadataManager LPSpecializationMetadataClass](IMDSharedWithYouMetadataManager, "LPSpecializationMetadataClass");
          v43 = objc_opt_isKindOfClass();

          if ((v43 & 1) != 0)
          {
            objc_msgSend(v41, "specialization");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v44, "performSelector:", sel_type);
              v45 = objc_claimAutoreleasedReturnValue();

              v38 = (void *)v45;
            }

          }
        }
      }
      if (objc_msgSend(v38, "length"))
      {
        v46 = v38;
      }
      else
      {
        objc_msgSend(v85, "UTITypeForURL:", v87);
        v47 = objc_claimAutoreleasedReturnValue();

        v46 = (void *)v47;
      }
      v48 = v46;
      if (objc_msgSend(v46, "length"))
        objc_msgSend(v15, "setContentType:", v48);
      objc_msgSend(v13, "collaborationMetadata");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "creationDate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v50, "isEqualToDate:", v51);

      if (v52)
      {
        IMLogHandleForCategory();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_1ABC63410();

      }
      else if (v50)
      {
        objc_msgSend(v15, "setContentCreationDate:", v50);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v91 = (uint64_t)v86;
          v92 = 2112;
          v93 = (uint64_t)v88;
          _os_log_impl(&dword_1ABB60000, v54, OS_LOG_TYPE_INFO, "Setting collaborationIdentifier to %@ for messageGUID: %@", buf, 0x16u);
        }

      }
      -[IMDSharedWithYouMetadataManager _collaborationIdentifierKey](self, "_collaborationIdentifierKey");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forCustomKey:", v86, v55);

      objc_msgSend(v15, "setAttribute:forKey:", v86, CFSTR("FPCollaborationIdentifier"));
      objc_msgSend(v15, "setAttribute:forKey:", CFSTR("NSFileProviderRootContainerItemIdentifier"), CFSTR("FPParentFileItemID"));
      objc_msgSend(v13, "collaborationMetadata");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "ckAppBundleIDs");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v57, "count"))
      {
        IMLogHandleForCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          sub_1ABC6339C((uint64_t)v88, v58);

      }
      -[IMDSharedWithYouMetadataManager _ckBundleIDsKey](self, "_ckBundleIDsKey");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forCustomKey:", v57, v59);

      v60 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v13, "collaborationMetadata");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 0;
      objc_msgSend(v60, "archivedDataWithRootObject:requiringSecureCoding:error:", v61, 1, &v89);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v89;

      if (v62)
      {
        objc_msgSend((id)objc_opt_class(), "collaborationMetadataKey");
        v64 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setValue:forCustomKey:", v62, v64);
      }
      else
      {
        IMLogHandleForCategory();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          sub_1ABC6331C((uint64_t)v63, v64);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserOwned:", v65);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrashed:", v66);

      objc_msgSend(v15, "setAttribute:forKey:", &unk_1E5ADC120, CFSTR("FPCapabilities"));
      objc_msgSend(v15, "authors");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "count"))
      {
        objc_msgSend(v67, "firstObject");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "displayName");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setOwnerName:", v69);

        if (!objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
          || !IMOSLoggingEnabled())
        {
          goto LABEL_77;
        }
        OSLogHandleForIMFoundationCategory();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "ownerName");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = (uint64_t)v71;
          _os_log_impl(&dword_1ABB60000, v70, OS_LOG_TYPE_INFO, "Owner name set to %@", buf, 0xCu);

        }
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
          || !IMOSLoggingEnabled())
        {
          goto LABEL_77;
        }
        OSLogHandleForIMFoundationCategory();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "identifier");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = (uint64_t)v72;
          _os_log_impl(&dword_1ABB60000, v70, OS_LOG_TYPE_INFO, "No authors found to derive the Owner name from for message guid:%@", buf, 0xCu);

        }
      }

LABEL_77:
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v14, "isEqualToDate:", v73);

      if (v74)
      {
        IMLogHandleForCategory();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          sub_1ABC632F0();

      }
      else if (v14)
      {
        objc_msgSend(v15, "setContentCreationDate:", v14);
        objc_msgSend(v15, "setLastUsedDate:", v14);
        if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "contentCreationDate");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v91 = (uint64_t)v77;
              _os_log_impl(&dword_1ABB60000, v76, OS_LOG_TYPE_INFO, "Setting the creation & last used date to %@", buf, 0xCu);

            }
          }
        }
      }

LABEL_88:
      v78 = v15;
      goto LABEL_89;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v80, OS_LOG_TYPE_INFO, "Skipping adding additional collaboration related meta-data since the message is non-collaborative", buf, 2u);
      }

    }
    v81 = v15;

  }
  else
  {
    IMLogHandleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1ABC632C4();

  }
LABEL_89:

  return v12;
}

- (BOOL)chatDictionary:(id)a3 matchesFaceTimeConversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "state") == 3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v30 = v5;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("participants"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedHandleWithDestinationID:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v16);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v6, "remoteMembers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v25, "handle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "type");

            if (v27 != 1)
            {
              objc_msgSend(v25, "handle");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v28);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v22);
      }

      v11 = objc_msgSend(v12, "isEqualToSet:", v13);
      v5 = v30;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateConversationManagerWithItem:(id)a3 chat:(id)a4 attributes:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  id v24;
  void *v25;
  id obj;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  v24 = a5;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v25, "activeConversations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v33;
    *(_QWORD *)&v11 = 138412290;
    v23 = v11;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (-[IMDSharedWithYouMetadataManager chatDictionary:matchesFaceTimeConversation:](self, "chatDictionary:matchesFaceTimeConversation:", v8, v14, v23))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v37 = v14;
              _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "TUConversation matches chatRecord for conversation: %@", buf, 0xCu);
            }

          }
          -[IMDSharedWithYouMetadataManager highlightDictionaryFromAttributes:withItem:chat:](self, "highlightDictionaryFromAttributes:withItem:chat:", v24, v27, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v37 = v16;
              _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Going to update Conversation Manager with highlightDictionary: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("flags"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedLongLongValue");

          objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "queue");
          v21 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1ABC27D88;
          block[3] = &unk_1E5ABF370;
          block[4] = v14;
          v29 = v16;
          v30 = v25;
          v31 = (v19 & 4) != 0;
          v22 = v16;
          dispatch_async(v21, block);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v10);
  }

}

- (id)highlightDictionaryFromAttributes:(id)a3 withItem:(id)a4 chat:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v33 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Generating highlight dictionary", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "filename");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
      objc_msgSend(v10, "setObject:forKey:", v32, CFSTR("fn"));
    objc_msgSend(v8, "contentCreationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      objc_msgSend(v10, "setObject:forKey:", v31, CFSTR("cd"));
    objc_msgSend(v35, "objectForKey:", CFSTR("time"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v10, "setObject:forKey:", v30, CFSTR("md"));
    objc_msgSend(v8, "contentType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
      objc_msgSend(v10, "setObject:forKey:", v29, CFSTR("ct"));
    objc_msgSend(v8, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v34, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("ru"));

      -[IMDSharedWithYouMetadataManager _uniqueIdentifierForResourceURL:](self, "_uniqueIdentifierForResourceURL:", v34);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("i"));

    }
    objc_msgSend(v8, "customAttributeDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("com_apple_mobilesms_collaborationIdentifier"));
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v28 == v14)
    {

    }
    else
    {
      v15 = objc_msgSend(v28, "length") == 0;

      if (!v15)
        objc_msgSend(v10, "setObject:forKey:", v28, CFSTR("ci"));
    }
    objc_msgSend(v8, "customAttributeDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("com_apple_mobilesms_ckBundleIDs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        v18 = (void *)MEMORY[0x1E0C9AA60];
      }
      objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("ckAppBundleIDs"));
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("guid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("cid"));
    objc_msgSend(v35, "objectForKey:", CFSTR("guid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("uid"));
    objc_msgSend(v19, "setObject:forKey:", CFSTR("Messages"), CFSTR("sa"));
    objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("l"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", CFSTR("handle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
      objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("h"));
    objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("s"));
    v24 = (void *)objc_msgSend(v19, "copy");
    v36 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v25, CFSTR("a"));

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v10;
        _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Returning highlight dictionary: %@", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = 0;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Nil attributes: %@ passed in. Skipping generating highlight dictionary ", buf, 0xCu);
    }

  }
  return v10;
}

- (id)_uniqueIdentifierForResourceURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "Sha256ForData:withSalt:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isLNKTypeMessage:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "messageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqual:", CFSTR("lnk"));
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isAttachmentType:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "messageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqual:", CFSTR("at"));
  else
    v5 = 0;

  return v5;
}

- (id)titleFromLPLinkMetadata:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;

  v3 = a3;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v3, "collaborationMetadata"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_opt_respondsToSelector(),
          v4,
          (v5 & 1) != 0))
    {
      objc_msgSend(v3, "collaborationMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    if (!objc_msgSend(v7, "length"))
    {
      if (MEMORY[0x1AF434FF4](CFSTR("LPSharedObjectMetadata"), CFSTR("LinkPresentation")))
      {
        objc_msgSend(v3, "specialization");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v3, "specialization");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v11, "length"))
          {
            MEMORY[0x1AF434FF4](CFSTR("LPFileMetadata"), CFSTR("LinkPresentation"));
            MEMORY[0x1AF434FF4](CFSTR("LPiCloudSharingMetadata"), CFSTR("LinkPresentation"));
            objc_msgSend(v10, "specialization");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_opt_isKindOfClass();

            objc_msgSend(v10, "specialization");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if ((v13 & 1) != 0)
            {
              objc_msgSend(v14, "name");
              v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
              v20 = (void *)v16;

              v11 = v20;
              goto LABEL_18;
            }
            v19 = objc_opt_isKindOfClass();

            if ((v19 & 1) != 0)
            {
              objc_msgSend(v10, "specialization");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "title");
              v16 = objc_claimAutoreleasedReturnValue();
              goto LABEL_17;
            }
          }
LABEL_18:

          v7 = v11;
        }
      }
      else
      {
        objc_msgSend(v3, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (!v18)
        {
          objc_msgSend(v3, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v7;
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_pluginPayloadAttachmentPathsForItem:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "objectForKeyedSubscript:", CFSTR("path"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_lpLinkMetadataForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (MEMORY[0x1AF434FF4](CFSTR("LPLinkMetadataPresentationTransformer"), CFSTR("LinkPresentation")))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D397E0]);
    objc_msgSend(v7, "objectForKey:", CFSTR("payloadData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperPayloadFromCombinedPluginPayloadData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setData:", v13);
    objc_msgSend(v7, "objectForKey:", CFSTR("guid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMessageGUID:", v14);
    objc_msgSend(v7, "objectForKey:", CFSTR("flags"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = ((unint64_t)objc_msgSend(v15, "unsignedLongLongValue") >> 2) & 1;

    objc_msgSend(v10, "setIsFromMe:", v16);
    objc_msgSend(v10, "setUrl:", v9);
    objc_msgSend(v10, "setAttachments:", v8);
    objc_msgSend(MEMORY[0x1E0D39A68], "linkMetadataForPluginPayload:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_shouldDonateToSharedWithYou:(id)a3 lpLinkMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)qword_1EEC40680;
    v19 = qword_1EEC40680;
    if (!qword_1EEC40680)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v21 = sub_1ABC291D0;
      v22 = &unk_1E5AB0C88;
      v23 = &v16;
      sub_1ABC291D0((uint64_t)&buf);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    v9 = [v8 alloc];
    v10 = (void *)objc_msgSend(v9, "initWithMetadata:URL:", v6, v5, v16);
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "shouldDonateToSharedWithYou");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = CFSTR("NO");
          if (v11)
            v13 = CFSTR("YES");
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v13;
          _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "LP's recommendation is %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Since we failed to get LPLinkMetadata, not asking LP's recommendation here.", (uint8_t *)&buf, 2u);
      }

    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)_highlightedContentServerDateKey
{
  if (qword_1ED0D3800 != -1)
    dispatch_once(&qword_1ED0D3800, &unk_1E5ABF390);
  return (id)qword_1ED0D37F8;
}

- (id)_syndicationContentTypeKey
{
  if (qword_1EEC40628 != -1)
    dispatch_once(&qword_1EEC40628, &unk_1E5ABF3B0);
  return (id)qword_1EEC40620;
}

- (id)_collaborationIdentifierKey
{
  if (qword_1EEC40638 != -1)
    dispatch_once(&qword_1EEC40638, &unk_1E5AAE818);
  return (id)qword_1EEC40630;
}

- (id)_ckBundleIDsKey
{
  if (qword_1EEC40648 != -1)
    dispatch_once(&qword_1EEC40648, &unk_1E5AAE838);
  return (id)qword_1EEC40640;
}

- (id)_lpTitleCustomKey
{
  if (qword_1EEC40658 != -1)
    dispatch_once(&qword_1EEC40658, &unk_1E5ABF3D0);
  return (id)qword_1EEC40650;
}

+ (id)collaborationMetadataKey
{
  if (qword_1EEC40668 != -1)
    dispatch_once(&qword_1EEC40668, &unk_1E5AAE5B8);
  return (id)qword_1EEC40660;
}

+ (id)dataDetectedLink
{
  if (qword_1EEC40678 != -1)
    dispatch_once(&qword_1EEC40678, &unk_1E5ABF3F0);
  return (id)qword_1EEC40670;
}

@end
