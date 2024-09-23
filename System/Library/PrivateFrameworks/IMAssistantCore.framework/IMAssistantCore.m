id sub_21ED9197C(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conversationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("INMessage %@\nConversation identifier: %@\nGroup name: %@\nSender: %@\nRecipients (%@): %@"), v3, v4, v5, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t sub_21ED92700(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21ED92710(uint64_t a1)
{

}

void sub_21ED92718(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "messageHandlerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationManagerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*v2, "canSendLocationMessageWithLocationManager:withError:", v4, &v14) & 1) == 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDDA0B0]);
    v6 = objc_msgSend(v5, "initWithCode:userActivity:", v14, 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Completing confirmSendMessage with %@", buf, 0xCu);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v12, OS_SIGNPOST_INTERVAL_END, v13, "confirmSendMessageIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_21ED92AA8(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  IMAssistantURLWithMetadata *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  IMAssistantURLWithMetadata *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  char v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  IMAssistantURLWithMetadata *v83;
  NSObject *v84;
  id v85;
  IMAssistantURLWithMetadata *v86;
  NSObject *v87;
  void *v88;
  id v89;
  NSObject *v90;
  IMAssistantURLWithMetadata *v91;
  IMAssistantURLWithMetadata *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  IMAssistantURLWithMetadata *v96;
  void *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t ii;
  void *v103;
  void *v104;
  char v105;
  NSObject *v106;
  NSObject *v107;
  IMAssistantURLWithMetadata *v108;
  void *v109;
  id v110;
  IMAssistantURLWithMetadata *v111;
  void *v112;
  void *v113;
  IMAssistantURLWithMetadata *v114;
  NSObject *v115;
  NSObject *v116;
  int v117;
  NSObject *v118;
  NSObject *v119;
  IMAssistantURLWithMetadata *v120;
  IMAssistantURLWithMetadata *v121;
  IMAssistantURLWithMetadata *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t jj;
  IMAssistantURLWithMetadata *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  uint64_t v130;
  int v131;
  NSObject *v132;
  NSObject *v133;
  void *v134;
  NSObject *v135;
  void *v136;
  void *v137;
  char v138;
  uint64_t v139;
  uint64_t kk;
  IMAssistantURLWithMetadata *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  IMAssistantURLWithMetadata *v146;
  NSObject *v147;
  NSObject *v148;
  void *v149;
  NSObject *v150;
  IMAssistantURLWithMetadata *obj;
  IMAssistantURLWithMetadata *obja;
  unsigned int v153;
  uint64_t v154;
  IMAssistantURLWithMetadata *v155;
  id v156;
  uint64_t v157;
  IMAssistantURLWithMetadata *v158;
  id v159;
  void *v160;
  void *v161;
  void (**v162)(_QWORD, _QWORD);
  id v163;
  id v164;
  void *v165;
  IMAssistantURLWithMetadata *v166;
  IMAssistantURLWithMetadata *v167;
  void *v169;
  IMAssistantURLWithMetadata *v170;
  id v171;
  void *v172;
  IMAssistantURLWithMetadata *v173;
  void *v174;
  id v175;
  id v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _QWORD v185[4];
  id v186;
  uint64_t v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  uint8_t v194[128];
  uint8_t v195[16];
  uint8_t buf[4];
  IMAssistantURLWithMetadata *v197;
  __int16 v198;
  void *v199;
  uint64_t v200;

  v200 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "content");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "speakableGroupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenPhrase");
  v155 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "recipients");
  v158 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "_metadata");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v165, "hasOriginatingDeviceIdsIdentifier"))
  {
    objc_msgSend(v165, "originatingDeviceIdsIdentifier");
    v159 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v159 = 0;
  }
  +[IMAssistantINMessageConverter expressiveSendIdFromMessageEffectType:](IMAssistantINMessageConverter, "expressiveSendIdFromMessageEffectType:", objc_msgSend(*(id *)(a1 + 32), "effect"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend(*(id *)(a1 + 32), "_executionContext");
  v185[0] = MEMORY[0x24BDAC760];
  v185[1] = 3221225472;
  v185[2] = sub_21ED94B64;
  v185[3] = &unk_24E395970;
  v3 = *(void **)(a1 + 48);
  v187 = *(_QWORD *)(a1 + 56);
  v186 = v3;
  v162 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](v185);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v155;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Send Message Intent: GroupName: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v158;
      _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Send Message Intent: Recipients: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "conversationIdentifier");
      v7 = (IMAssistantURLWithMetadata *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v197 = v7;
      _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Send Message Intent: Conversation Identifier: %@", buf, 0xCu);

    }
  }
  v8 = *(id *)(a1 + 32);
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  objc_msgSend(v8, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  if (!v10)
  {

LABEL_36:
    v153 = 0;
    goto LABEL_37;
  }
  v11 = 0;
  v12 = *(_QWORD *)v190;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v190 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * i);
      if (objc_msgSend(v14, "currentLocation"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v195 = 138412290;
            *(_QWORD *)&v195[4] = v14;
            _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Intent contains an current location attachment: %@", v195, 0xCu);
          }

        }
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_36;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Will try to send a current location message.", buf, 2u);
    }

  }
  v153 = 1;
LABEL_37:
  v171 = *(id *)(a1 + 32);
  if (objc_msgSend(v171, "outgoingMessageType") == 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Intent contains an audio message request, looking for the attachment", buf, 2u);
      }

    }
    v191 = 0u;
    v192 = 0u;
    v189 = 0u;
    v190 = 0u;
    objc_msgSend(v171, "attachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v190;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v190 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * j), "audioMessageFile");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fileURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v195 = 138412290;
                *(_QWORD *)&v195[4] = v24;
                _os_log_impl(&dword_21ED90000, v25, OS_LOG_TYPE_INFO, "Intent contains a audioFileAttachment: %@", v195, 0xCu);
              }

            }
            v26 = v24;

            v19 = v26;
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
      }
      while (v20);
    }

  }
  else
  {
    v19 = 0;
  }
  v166 = v19;

  if (v166 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v166;
      _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Will try to send a Audio Message with attachment: %@", buf, 0xCu);
    }

  }
  v163 = *(id *)(a1 + 32);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Checking the intent for a shared link.", buf, 2u);
    }

  }
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  objc_msgSend(v163, "attachments");
  v29 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  v30 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  if (v30)
  {
    v172 = 0;
    v174 = 0;
    v31 = *(_QWORD *)v190;
    v169 = (void *)*MEMORY[0x24BDF8350];
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v190 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v33, "sharedLink");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v33, "sharedLink");
            v35 = objc_claimAutoreleasedReturnValue();

            v174 = (void *)v35;
          }
          else
          {
            objc_msgSend(v33, "file");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "typeIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v38, "isEqualToString:", v39);

            if (v40)
            {
              v41 = (void *)MEMORY[0x24BDD1620];
              v42 = objc_opt_class();
              objc_msgSend(v33, "file");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "data");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v188 = 0;
              objc_msgSend(v41, "unarchivedObjectOfClass:fromData:error:", v42, v44, &v188);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v188;

              if (!v45 || v46)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v195 = 138412290;
                    *(_QWORD *)&v195[4] = v46;
                    _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "There was an error unarchiving the attachment to LPLinkMetadata: %@", v195, 0xCu);
                  }

                }
                v172 = 0;
              }
              else
              {
                v172 = v45;
              }

            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v195 = 0;
            _os_log_impl(&dword_21ED90000, v36, OS_LOG_TYPE_INFO, "SDK doesn't support API.", v195, 2u);
          }

        }
      }
      v30 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
    }
    while (v30);

    if (v174 && v172)
    {
      objc_msgSend(v172, "originalURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v174, "isEqual:", v48);

      if ((v49 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v195 = 0;
            _os_log_impl(&dword_21ED90000, v50, OS_LOG_TYPE_INFO, "We have a shared link and metadata, but there is a URL mismatch. Clearing out the metadata to avoid attaching the wrong metadata.", v195, 2u);
          }

        }
        v172 = 0;
      }
    }
    else if (!v174)
    {
      v170 = 0;
      v174 = 0;
      goto LABEL_102;
    }
    v29 = -[IMAssistantURLWithMetadata initWithURL:metadata:]([IMAssistantURLWithMetadata alloc], "initWithURL:metadata:", v174, v172);
    v170 = v29;
  }
  else
  {
    v170 = 0;
    v172 = 0;
    v174 = 0;
  }

LABEL_102:
  if (v170 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v170;
      _os_log_impl(&dword_21ED90000, v51, OS_LOG_TYPE_INFO, "Will try to send a shared link for the URL at: %@", buf, 0xCu);
    }

  }
  v52 = *(id *)(a1 + 32);
  v53 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v52, "attachments");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v53, "initWithCapacity:", objc_msgSend(v54, "count"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v56, OS_LOG_TYPE_INFO, "Checking the intent for a file attachment.", buf, 2u);
    }

  }
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  objc_msgSend(v52, "attachments");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v190;
    do
    {
      for (m = 0; m != v58; ++m)
      {
        if (*(_QWORD *)v190 != v59)
          objc_enumerationMutation(v57);
        v61 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * m);
        objc_msgSend(v61, "file");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "fileURL");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend(v61, "file");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "fileURL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v65);

        }
      }
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
    }
    while (v58);
  }

  v173 = v55;
  if (-[IMAssistantURLWithMetadata count](v173, "count") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v173;
      _os_log_impl(&dword_21ED90000, v66, OS_LOG_TYPE_INFO, "Will try to send files at the following locations: %@", buf, 0xCu);
    }

  }
  v175 = *(id *)(a1 + 32);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v67, OS_LOG_TYPE_INFO, "Checking the intent for a PHAsset attachment.", buf, 2u);
    }

  }
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  objc_msgSend(v175, "attachments");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  if (v69)
  {
    v70 = *(_QWORD *)v190;
    while (2)
    {
      for (n = 0; n != v69; ++n)
      {
        if (*(_QWORD *)v190 != v70)
          objc_enumerationMutation(v68);
        v72 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * n);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v72, "phAssetId");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            v74 = objc_alloc_init(MEMORY[0x24BDE3570]);
            objc_msgSend(v74, "setIncludeGuestAssets:", 1);
            objc_msgSend(v74, "setIncludeHiddenAssets:", 1);
            v75 = (void *)MEMORY[0x24BDE3488];
            objc_msgSend(v72, "phAssetId");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v195 = v76;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v195, 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "fetchAssetsWithLocalIdentifiers:options:", v77, v74);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "firstObject");
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            if (v79)
            {
              v164 = v79;

              goto LABEL_142;
            }

          }
        }
      }
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
      if (v69)
        continue;
      break;
    }
  }
  v164 = 0;
LABEL_142:

  objc_msgSend(*(id *)(a1 + 40), "messageHandlerDataSource");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "chatDataSource");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = *(void **)(a1 + 32);
  v176 = v81;
  v156 = v82;
  objc_msgSend(v156, "conversationIdentifier");
  v83 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  if (!-[IMAssistantURLWithMetadata length](v83, "length"))
    goto LABEL_162;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v83;
      _os_log_impl(&dword_21ED90000, v84, OS_LOG_TYPE_INFO, "Intent contains a conversation identifier. Using that to find an existing chat. conversationIdentifier=%@", buf, 0xCu);
    }

  }
  v85 = v176;
  v86 = v83;
  if (-[IMAssistantURLWithMetadata length](v86, "length"))
  {
    IMAssistantChatIdentifierFromConversationIdentifier(v86);
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "existingChatWithChatIdentifier:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88)
    {
      v89 = v88;

      goto LABEL_160;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v86;
        _os_log_impl(&dword_21ED90000, v90, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
      }

    }
    goto LABEL_158;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v87, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
    }
LABEL_158:

  }
  v89 = 0;
LABEL_160:

  if (v89)
  {
    v91 = (IMAssistantURLWithMetadata *)v89;
    v167 = v91;
    goto LABEL_196;
  }
LABEL_162:
  objc_msgSend(v156, "speakableGroupName");
  v92 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  v91 = v92;
  if (!v92)
  {
    v167 = 0;
    goto LABEL_196;
  }
  -[IMAssistantURLWithMetadata vocabularyIdentifier](v92, "vocabularyIdentifier");
  obj = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  if (-[IMAssistantURLWithMetadata length](obj, "length"))
  {
    IMAssistantChatIdentifierFromConversationIdentifier(obj);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v197 = obj;
        v198 = 2112;
        v199 = v93;
        _os_log_impl(&dword_21ED90000, v94, OS_LOG_TYPE_INFO, "Intent contains a group name vocabulary identifier. Using that to find an existing chat. vocabularyIdentifier=%@ chatIdentifier=%@", buf, 0x16u);
      }

    }
    objc_msgSend(v176, "existingChatWithChatIdentifier:", v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      v96 = v95;
      v97 = v96;
LABEL_192:
      v167 = v96;
      goto LABEL_193;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v197 = obj;
        v198 = 2112;
        v199 = v93;
        _os_log_impl(&dword_21ED90000, v99, OS_LOG_TYPE_INFO, "Could not find a chat with the vocabularyIdentifier %@ chatIdentifier %@, ignoring", buf, 0x16u);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v197 = v91;
      _os_log_impl(&dword_21ED90000, v98, OS_LOG_TYPE_INFO, "speakableGroupName does not contain a vocabularyIdentifier. speakableGroupName=%@", buf, 0xCu);
    }

  }
  -[IMAssistantURLWithMetadata spokenPhrase](v91, "spokenPhrase");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v93, "length"))
  {
    v167 = 0;
    goto LABEL_195;
  }
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  objc_msgSend(v176, "allExistingChats");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
  if (v100)
  {
    v101 = *(_QWORD *)v190;
    while (2)
    {
      for (ii = 0; ii != v100; ++ii)
      {
        if (*(_QWORD *)v190 != v101)
          objc_enumerationMutation(v97);
        v103 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * ii);
        objc_msgSend(v103, "displayName");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v104, "isEqualToString:", v93);

        if ((v105 & 1) != 0)
        {
          v96 = v103;
          goto LABEL_192;
        }
      }
      v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v189, buf, 16);
      if (v100)
        continue;
      break;
    }
  }
  v167 = 0;
LABEL_193:

LABEL_195:
LABEL_196:

  if (v167)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v167;
        _os_log_impl(&dword_21ED90000, v106, OS_LOG_TYPE_INFO, "Sending message to chat with identifier specified in intent. chat=%@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "sendMessagesWithText:currentLocation:sharedLinkURL:audioMessageAttachment:photoLibraryAttachment:fileAttachments:expressiveSendStyleID:idsIdentifier:executionContext:toChat:completion:", v161, v153, v170, v166, v164, v173, v160, v159, v154, v167, v162);
    goto LABEL_256;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "length"))
    goto LABEL_230;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      v108 = *(IMAssistantURLWithMetadata **)(*(_QWORD *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      v197 = v108;
      _os_log_impl(&dword_21ED90000, v107, OS_LOG_TYPE_INFO, "Using stored conversation identifier that was resolved during recipient resolution. conversationIdentifier=%@", buf, 0xCu);
    }

  }
  v109 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v110 = v176;
  v111 = v109;
  if (!-[IMAssistantURLWithMetadata length](v111, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v115, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
      }

    }
    goto LABEL_219;
  }
  IMAssistantChatIdentifierFromConversationIdentifier(v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "existingChatWithChatIdentifier:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v113)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v111;
        _os_log_impl(&dword_21ED90000, v116, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
      }

    }
LABEL_219:
    v114 = 0;
    goto LABEL_220;
  }
  v114 = v113;

LABEL_220:
  v117 = IMOSLoggingEnabled();
  if (v114)
  {
    if (v117)
    {
      OSLogHandleForIMFoundationCategory();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v114;
        _os_log_impl(&dword_21ED90000, v118, OS_LOG_TYPE_INFO, "Sending message to chat that has already been resolved. chat=%@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "sendMessagesWithText:currentLocation:sharedLinkURL:audioMessageAttachment:photoLibraryAttachment:fileAttachments:expressiveSendStyleID:idsIdentifier:executionContext:toChat:completion:", v161, v153, v170, v166, v164, v173, v160, v159, v154, v114, v162);

    goto LABEL_256;
  }
  if (v117)
  {
    OSLogHandleForIMFoundationCategory();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
    {
      v120 = *(IMAssistantURLWithMetadata **)(*(_QWORD *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412290;
      v197 = v120;
      _os_log_impl(&dword_21ED90000, v119, OS_LOG_TYPE_INFO, "Could not find IMChat matching conversation identifier resolved during recipient resolution. Ignoring. conversationIdentifier=%@", buf, 0xCu);
    }

  }
LABEL_230:
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[IMAssistantURLWithMetadata count](v158, "count"));
  v121 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v122 = v158;
  v123 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](v122, "countByEnumeratingWithState:objects:count:", &v181, v194, 16);
  if (v123)
  {
    v124 = *(_QWORD *)v182;
    while (2)
    {
      for (jj = 0; jj != v123; ++jj)
      {
        if (*(_QWORD *)v182 != v124)
          objc_enumerationMutation(v122);
        v126 = *(IMAssistantURLWithMetadata **)(*((_QWORD *)&v181 + 1) + 8 * jj);
        -[IMAssistantURLWithMetadata customIdentifier](v126, "customIdentifier");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v127, "length"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v197 = v126;
              _os_log_impl(&dword_21ED90000, v128, OS_LOG_TYPE_INFO, "Custom identifier not set, falling back to personHandle.value: %@", buf, 0xCu);
            }

          }
          -[IMAssistantURLWithMetadata personHandle](v126, "personHandle");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "value");
          v130 = objc_claimAutoreleasedReturnValue();

          v127 = (void *)v130;
        }
        if (!objc_msgSend(v127, "length"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v133 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v197 = v126;
              _os_log_impl(&dword_21ED90000, v133, OS_LOG_TYPE_INFO, "Could not send message; recipient had no usable handle: %@",
                buf,
                0xCu);
            }

          }
          v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", 4, 0);
          ((void (**)(_QWORD, void *))v162)[2](v162, v134);

          goto LABEL_255;
        }
        -[IMAssistantURLWithMetadata addObject:](v121, "addObject:", v127);

      }
      v123 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](v122, "countByEnumeratingWithState:objects:count:", &v181, v194, 16);
      if (v123)
        continue;
      break;
    }
  }

  objc_msgSend(v176, "existingChatForAddresses:allowRetargeting:bestHandles:", v121, 0, 0);
  v122 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
  v131 = IMOSLoggingEnabled();
  if (v122)
  {
    if (v131)
    {
      OSLogHandleForIMFoundationCategory();
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v132, OS_LOG_TYPE_INFO, "Found existing chat with the recipients; sending",
          buf,
          2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "sendMessagesWithText:currentLocation:sharedLinkURL:audioMessageAttachment:photoLibraryAttachment:fileAttachments:expressiveSendStyleID:idsIdentifier:executionContext:toChat:completion:", v161, v153, v170, v166, v164, v173, v160, v159, v154, v122, v162);
    objc_msgSend(MEMORY[0x24BE51310], "sharedInstance");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "sendINSendMessageIntentEvent");
  }
  else
  {
    if (v131)
    {
      OSLogHandleForIMFoundationCategory();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v197 = v121;
        _os_log_impl(&dword_21ED90000, v135, OS_LOG_TYPE_INFO, "Could not find any existing chat matching addresses. Creating new chat. Addresses: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "messageHandlerDataSource");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "accountDataSource");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v137, "hasMessagingAccount");

    if ((v138 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[IMAssistantURLWithMetadata count](v121, "count"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = 0u;
      v180 = 0u;
      v177 = 0u;
      v178 = 0u;
      obja = v121;
      v139 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v177, v193, 16);
      if (v139)
      {
        v157 = *(_QWORD *)v178;
        while (2)
        {
          for (kk = 0; kk != v139; ++kk)
          {
            if (*(_QWORD *)v178 != v157)
              objc_enumerationMutation(obja);
            v141 = *(IMAssistantURLWithMetadata **)(*((_QWORD *)&v177 + 1) + 8 * kk);
            objc_msgSend(*(id *)(a1 + 40), "messageHandlerDataSource");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "accountDataSource");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            IMStripFormattingFromAddress();
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "imHandleWithID:", v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v145)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v148 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v197 = v141;
                  _os_log_impl(&dword_21ED90000, v148, OS_LOG_TYPE_INFO, "Could not send message; an address could not be resolved to an IMHandle: %@",
                    buf,
                    0xCu);
                }

              }
              v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", 4, 0);
              ((void (**)(_QWORD, void *))v162)[2](v162, v149);
              goto LABEL_290;
            }
            objc_msgSend(v127, "addObject:", v145);

          }
          v139 = -[IMAssistantURLWithMetadata countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v177, v193, 16);
          if (v139)
            continue;
          break;
        }
      }

      if (objc_msgSend(v127, "count") == 1)
      {
        objc_msgSend(v127, "firstObject");
        v146 = (IMAssistantURLWithMetadata *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "chatForIMHandle:", v146);
        obja = (IMAssistantURLWithMetadata *)(id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v176, "chatForIMHandles:", v127);
        v146 = (IMAssistantURLWithMetadata *)(id)objc_claimAutoreleasedReturnValue();
        obja = v146;
      }

      if ((objc_msgSend(*(id *)(a1 + 40), "updateSenderIdentityForNewlyCreatedChat:", obja) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "sendMessagesWithText:currentLocation:sharedLinkURL:audioMessageAttachment:photoLibraryAttachment:fileAttachments:expressiveSendStyleID:idsIdentifier:executionContext:toChat:completion:", v161, v153, v170, v166, v164, v173, v160, v159, v154, obja, v162);
        objc_msgSend(MEMORY[0x24BE51310], "sharedInstance");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "sendINSendMessageIntentEvent");
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v150 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v150, OS_LOG_TYPE_INFO, "Failed to determine the prefferred sender identity, returning failure requiring app launch so the user can use the sim selection UI", buf, 2u);
          }

        }
        v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", 5, 0);
        ((void (**)(_QWORD, void *))v162)[2](v162, v149);
      }
LABEL_290:

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v147, OS_LOG_TYPE_INFO, "Could not send message; no messaging accounts available",
            buf,
            2u);
        }

      }
      v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", 6, 0);
      ((void (**)(_QWORD, void *))v162)[2](v162, v127);
    }
  }
LABEL_255:

LABEL_256:
}

void sub_21ED94B64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "handleSendMessageIntent", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_21ED94E6C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

void sub_21ED94FFC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21ED94F94);
  }
  _Unwind_Resume(a1);
}

void sub_21ED951C8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Resolve recipients with legacy resolution results: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v6, OS_SIGNPOST_INTERVAL_END, v7, "resolveRecipientsForSendMessage", (const char *)&unk_21EDC1733, (uint8_t *)&v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21ED95CAC(id *a1)
{
  id *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void (**v12)(id, __CFString *);
  __CFString *v13;
  unint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  id v59;
  int v60;
  int v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  const __CFString *v70;
  const __CFString *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  id v78;
  int v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  const __CFString *v89;
  const __CFString *v90;
  int v91;
  NSObject *v92;
  void *v93;
  char v94;
  int v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  os_signpost_id_t v99;
  void (**v100)(id, void *);
  void *v101;
  _BOOL4 v102;
  int v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  _BOOL4 v107;
  int v108;
  id *v109;
  NSObject *v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t n;
  void *v118;
  void *v119;
  int v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  os_signpost_id_t v124;
  void (**v125)(id, __CFString *);
  __CFString *v126;
  int v127;
  int v128;
  int v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  _BOOL4 v136;
  int v137;
  __CFString *v138;
  NSObject *v139;
  uint64_t v140;
  __CFString *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t ii;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  NSObject *v151;
  const __CFString *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t jj;
  void *v158;
  void *v159;
  void *v160;
  NSObject *v161;
  uint64_t v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t kk;
  id v170;
  int v171;
  int v172;
  int v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *v180;
  const __CFString *v181;
  const __CFString *v182;
  void *v183;
  __CFString *v184;
  void *v185;
  NSObject *v186;
  void *v187;
  NSObject *v188;
  const __CFString *v189;
  const __CFString *v190;
  int v191;
  NSObject *v192;
  void *v193;
  char v194;
  int v195;
  NSObject *v196;
  uint64_t v197;
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  NSObject *v201;
  os_signpost_id_t v202;
  void (**v203)(id, void *);
  NSObject *v204;
  NSObject *v205;
  NSObject *v206;
  NSObject *v207;
  os_signpost_id_t v208;
  NSObject *v209;
  NSObject *v210;
  _BOOL4 v211;
  int v212;
  NSObject *v213;
  uint64_t v214;
  uint64_t v215;
  NSObject *v216;
  NSObject *v217;
  NSObject *v218;
  NSObject *v219;
  os_signpost_id_t v220;
  id *v221;
  id v222;
  id v223;
  id obj;
  __CFString *obja;
  __CFString *v226;
  id v227;
  id v228;
  id v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  uint8_t v246[128];
  uint8_t v247[4];
  uint64_t v248;
  __int16 v249;
  id v250;
  __int16 v251;
  void *v252;
  uint8_t v253[32];
  __int128 v254;
  __int128 v255;
  uint8_t v256[4];
  id v257;
  __int16 v258;
  const __CFString *v259;
  __int16 v260;
  const __CFString *v261;
  __int16 v262;
  void *v263;
  uint8_t buf[4];
  uint64_t v265;
  __int16 v266;
  const __CFString *v267;
  __int16 v268;
  const __CFString *v269;
  __int16 v270;
  void *v271;
  uint64_t v272;

  v1 = a1;
  v272 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1[4], "count");
  v3 = v1[4];
  v221 = v1;
  if (v2 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v229 = (id)objc_claimAutoreleasedReturnValue();
    IMAssistantChatIdentifierFromConversationIdentifier(v229);
    v226 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v265 = (uint64_t)v229;
        v266 = 2112;
        v267 = v226;
        _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Intent contains one unique conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v1[5], "messageHandlerDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithChatIdentifier:", v226);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v7, "isBusinessChat") && -[__CFString length](v226, "length"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Chat resolved via conversation identifier is a business chat. Not resolving speakableGroupName to the business name, because the business name will be included in the recipients. Returning notRequired for speakableGroupName.", buf, 2u);
          }

        }
        _IMAssistantCoreSendMessageSignpostLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = (os_signpost_id_t)v221[8];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_END, v11, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
        }

        v12 = (void (**)(id, __CFString *))v221[7];
        objc_msgSend(MEMORY[0x24BDDA1A8], "notRequired");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v13);
LABEL_273:

        goto LABEL_320;
      }
      v78 = v7;
      v79 = objc_msgSend(v78, "isGroupChat");
      v80 = objc_msgSend(v78, "isBusinessChat");
      v81 = objc_msgSend(v78, "isStewieChat");
      objc_msgSend(v78, "displayName");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82;
      if (v79 | v80 | v81 && objc_msgSend(v82, "length"))
      {
        v84 = objc_alloc(MEMORY[0x24BDDA1A0]);
        objc_msgSend(v78, "chatIdentifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "displayName");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (__CFString *)objc_msgSend(v84, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v85, v86, 0);

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            v89 = CFSTR("NO");
            *(_DWORD *)buf = 138413058;
            v265 = (uint64_t)v78;
            if (v79)
              v90 = CFSTR("YES");
            else
              v90 = CFSTR("NO");
            v266 = 2112;
            v267 = v90;
            if (v80)
              v89 = CFSTR("YES");
            v268 = 2112;
            v269 = v89;
            v270 = 2112;
            v271 = v83;
            _os_log_impl(&dword_21ED90000, v88, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", buf, 0x2Au);
          }

        }
        v13 = 0;
      }

      v91 = IMOSLoggingEnabled();
      if (v13)
      {
        if (v91)
        {
          OSLogHandleForIMFoundationCategory();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v265 = (uint64_t)v226;
            v266 = 2112;
            v267 = v13;
            _os_log_impl(&dword_21ED90000, v92, OS_LOG_TYPE_INFO, "Found a named chat matching chatIdentifier, %@ with name \"%@\".", buf, 0x16u);
          }

        }
        objc_msgSend(v221[5], "messageHandlerDataSource");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "screentimeAllowedToShowChat:error:", v78, 0);

        v95 = IMOSLoggingEnabled();
        if ((v94 & 1) != 0)
        {
          if (v95)
          {
            OSLogHandleForIMFoundationCategory();
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v265 = (uint64_t)v13;
              _os_log_impl(&dword_21ED90000, v96, OS_LOG_TYPE_INFO, "Returning success with name \"%@\".", buf, 0xCu);
            }

          }
          _IMAssistantCoreSendMessageSignpostLogHandle();
          v97 = objc_claimAutoreleasedReturnValue();
          v98 = v97;
          v99 = (os_signpost_id_t)v221[8];
          if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ED90000, v98, OS_SIGNPOST_INTERVAL_END, v99, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
          }

          v100 = (void (**)(id, void *))v221[7];
          objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v13);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v100[2](v100, v101);
        }
        else
        {
          if (v95)
          {
            OSLogHandleForIMFoundationCategory();
            v199 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v265 = (uint64_t)v13;
              _os_log_impl(&dword_21ED90000, v199, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group (%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
            }

          }
          _IMAssistantCoreSendMessageSignpostLogHandle();
          v200 = objc_claimAutoreleasedReturnValue();
          v201 = v200;
          v202 = (os_signpost_id_t)v221[8];
          if (v202 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v200))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ED90000, v201, OS_SIGNPOST_INTERVAL_END, v202, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
          }

          v203 = (void (**)(id, void *))v221[7];
          objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v203[2](v203, v101);
        }

        goto LABEL_273;
      }
      if (!v91)
        goto LABEL_143;
      OSLogHandleForIMFoundationCategory();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v226;
        _os_log_impl(&dword_21ED90000, v87, OS_LOG_TYPE_INFO, "Could not find a name for the chat with the chatIdentifier %@, ignoring.", buf, 0xCu);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_143:

LABEL_144:
        v1 = v221;
        goto LABEL_145;
      }
      OSLogHandleForIMFoundationCategory();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v226;
        _os_log_impl(&dword_21ED90000, v87, OS_LOG_TYPE_INFO, "Could not find chat with the chatIdentifier %@, ignoring", buf, 0xCu);
      }
    }

    goto LABEL_143;
  }
  v14 = objc_msgSend(v3, "count");
  v15 = IMOSLoggingEnabled();
  if (v14 >= 2)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v1[4], "count");
        v18 = (const __CFString *)v1[4];
        *(_DWORD *)buf = 134218242;
        v265 = v17;
        v266 = 2112;
        v267 = v18;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Intent contains %ld unique conversationIdentifiers: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v1[5], "messageHandlerDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chatDataSource");
    v229 = (id)objc_claimAutoreleasedReturnValue();

    v226 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v20 = v1[4];
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v230, v246, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v231;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v231 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * i);
          IMAssistantChatIdentifierFromConversationIdentifier(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "existingChatWithChatIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            -[__CFString addObject:](v226, "addObject:", v26);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v265 = (uint64_t)v24;
              _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Could not find chat with chatIdentifier %@, ignoring", buf, 0xCu);
            }

          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v230, v246, 16);
      }
      while (v21);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = -[__CFString count](v226, "count");
        *(_DWORD *)buf = 134218242;
        v265 = v29;
        v266 = 2112;
        v267 = v226;
        _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "%ld chats match chatIdentifiers. Chats: %@", buf, 0x16u);
      }

    }
    -[__CFString array](v226, "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v222 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v244 = 0u;
    v245 = 0u;
    v242 = 0u;
    v243 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, buf, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v243;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v243 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * j);
          v35 = objc_msgSend(v34, "isGroupChat");
          objc_msgSend(v34, "displayName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v35 && objc_msgSend(v36, "length"))
          {
            objc_msgSend(v222, "objectForKey:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              objc_msgSend(v38, "addObject:", v34);
            }
            else
            {
              v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v34, 0);
              objc_msgSend(v222, "setObject:forKey:", v42, v37);

            }
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v253 = 138412802;
              v41 = CFSTR("NO");
              if (v35)
                v41 = CFSTR("YES");
              *(_QWORD *)&v253[4] = v34;
              *(_WORD *)&v253[12] = 2112;
              *(_QWORD *)&v253[14] = v41;
              *(_WORD *)&v253[22] = 2112;
              *(_QWORD *)&v253[24] = v37;
              _os_log_impl(&dword_21ED90000, v40, OS_LOG_TYPE_INFO, "Could not construct disambiguation option for chat: %@, isGroupChat: %@, displayName: %@. Ignoring.", v253, 0x20u);
            }

          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, buf, 16);
      }
      while (v31);
    }

    v227 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    objc_msgSend(v222, "allValues");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v239;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v239 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * k);
          objc_msgSend(v47, "sortedArrayUsingComparator:", &unk_24E395D20);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v227, "addObject:", v49);
          if ((unint64_t)objc_msgSend(v47, "count") >= 2 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v51 = objc_msgSend(v47, "count");
              objc_msgSend(v49, "displayName");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v247 = 134218498;
              v248 = v51;
              v249 = 2112;
              v250 = v52;
              v251 = 2112;
              v252 = v49;
              _os_log_impl(&dword_21ED90000, v50, OS_LOG_TYPE_INFO, "%ld chats have the name \"%@\". Presenting disambiguation of chats with the same name is confusing, so using the most recent one, %@.", v247, 0x20u);

            }
          }

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
      }
      while (v44);
    }

    objc_msgSend(v227, "sortedArrayUsingComparator:", &unk_24E395D20);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v236 = 0u;
    v237 = 0u;
    v234 = 0u;
    v235 = 0u;
    v55 = v53;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v234, v247, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v235;
      do
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v235 != v57)
            objc_enumerationMutation(v55);
          v59 = *(id *)(*((_QWORD *)&v234 + 1) + 8 * m);
          v60 = objc_msgSend(v59, "isGroupChat");
          v61 = objc_msgSend(v59, "isBusinessChat");
          v62 = objc_msgSend(v59, "isStewieChat");
          objc_msgSend(v59, "displayName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v63;
          if (v60 | v61 | v62 && objc_msgSend(v63, "length"))
          {
            v65 = objc_alloc(MEMORY[0x24BDDA1A0]);
            objc_msgSend(v59, "chatIdentifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "displayName");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (void *)objc_msgSend(v65, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v66, v67, 0);

          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v256 = 138413058;
                v70 = CFSTR("NO");
                if (v60)
                  v71 = CFSTR("YES");
                else
                  v71 = CFSTR("NO");
                v257 = v59;
                if (v61)
                  v70 = CFSTR("YES");
                v258 = 2112;
                v259 = v71;
                v260 = 2112;
                v261 = v70;
                v262 = 2112;
                v263 = v64;
                _os_log_impl(&dword_21ED90000, v69, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", v256, 0x2Au);
              }

            }
            v68 = 0;
          }

          if (v68)
            objc_msgSend(v54, "addObject:", v68);

        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v234, v247, 16);
      }
      while (v56);
    }

    v72 = (void *)objc_msgSend(v54, "copy");
    v73 = v72;
    if (-[__CFString count](v73, "count") == 1)
    {
      -[__CFString firstObject](v73, "firstObject");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v265 = (uint64_t)v74;
          _os_log_impl(&dword_21ED90000, v75, OS_LOG_TYPE_INFO, "Only one disambiguation option remains, returning success with resolved name: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v102 = (unint64_t)-[__CFString count](v73, "count") > 1;
      v103 = IMOSLoggingEnabled();
      if (v102)
      {
        if (v103)
        {
          OSLogHandleForIMFoundationCategory();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            v105 = -[__CFString count](v73, "count");
            *(_DWORD *)buf = 134218242;
            v265 = v105;
            v266 = 2112;
            v267 = v73;
            _os_log_impl(&dword_21ED90000, v104, OS_LOG_TYPE_INFO, "Asking user to disambiguate among %ld disambiguation options: %@", buf, 0x16u);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA1A8], "disambiguationWithStringsToDisambiguate:", v73);
        v106 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v103)
        {
          OSLogHandleForIMFoundationCategory();
          v204 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v204, OS_LOG_TYPE_INFO, "No disambiguation options remain. Returning unsupported (a.k.a. notFound)", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
        v106 = objc_claimAutoreleasedReturnValue();
      }
      v76 = (void *)v106;
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v205 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v76;
        _os_log_impl(&dword_21ED90000, v205, OS_LOG_TYPE_INFO, "Returning speakableGroupName resolution result: %@", buf, 0xCu);
      }

    }
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v206 = objc_claimAutoreleasedReturnValue();
    v207 = v206;
    v208 = (os_signpost_id_t)v221[8];
    if (v208 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v206))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v207, OS_SIGNPOST_INTERVAL_END, v208, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
    }

    (*((void (**)(void))v221[7] + 2))();
    goto LABEL_320;
  }
  if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v77, OS_LOG_TYPE_INFO, "Intent contains no chat guids.", buf, 2u);
    }

    goto LABEL_144;
  }
LABEL_145:
  objc_msgSend(v1[6], "spokenPhrase");
  v229 = (id)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v229, "length") == 0;
  v108 = IMOSLoggingEnabled();
  if (!v107)
  {
    v109 = v221;
    if (v108)
    {
      OSLogHandleForIMFoundationCategory();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v229;
        _os_log_impl(&dword_21ED90000, v110, OS_LOG_TYPE_INFO, "Attempting to resolve via speakableGroupName.spokenPhrase = \"%@\"", buf, 0xCu);
      }

      v109 = v221;
    }
    objc_msgSend(v109[5], "messageHandlerDataSource");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "chatDataSource");
    v112 = (id)objc_claimAutoreleasedReturnValue();
    v229 = v229;
    if (objc_msgSend(v229, "length"))
    {
      v113 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
      v254 = 0u;
      v255 = 0u;
      memset(v253, 0, sizeof(v253));
      objc_msgSend(v112, "allExistingChats");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", v253, buf, 16);
      if (v115)
      {
        v116 = **(_QWORD **)&v253[16];
        do
        {
          for (n = 0; n != v115; ++n)
          {
            if (**(_QWORD **)&v253[16] != v116)
              objc_enumerationMutation(v114);
            v118 = *(void **)(*(_QWORD *)&v253[8] + 8 * n);
            objc_msgSend(v118, "displayName");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = objc_msgSend(v119, "isEqualToString:", v229);

            if (v120)
              objc_msgSend(v113, "addObject:", v118);
          }
          v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", v253, buf, 16);
        }
        while (v115);
      }

      objc_msgSend(v113, "array");
      v226 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v226 = (__CFString *)MEMORY[0x24BDBD1A8];
    }

    if (-[__CFString count](v226, "count") != 1)
    {
      v136 = (unint64_t)-[__CFString count](v226, "count") > 1;
      v137 = IMOSLoggingEnabled();
      if (v136)
      {
        v138 = v226;
        if (v137)
        {
          OSLogHandleForIMFoundationCategory();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
          {
            v140 = -[__CFString count](v226, "count");
            *(_DWORD *)buf = 134218242;
            v265 = v140;
            v266 = 2112;
            v267 = v226;
            _os_log_impl(&dword_21ED90000, v139, OS_LOG_TYPE_INFO, "Found %ld chats matching requested spoken phrase. Producing disambiguation options. matchingChats: %@", buf, 0x16u);
          }

          v138 = v226;
        }
        v141 = v138;
        v223 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v244 = 0u;
        v245 = 0u;
        v242 = 0u;
        v243 = 0u;
        obja = v141;
        v142 = -[__CFString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v242, buf, 16);
        if (v142)
        {
          v143 = *(_QWORD *)v243;
          do
          {
            for (ii = 0; ii != v142; ++ii)
            {
              if (*(_QWORD *)v243 != v143)
                objc_enumerationMutation(obja);
              v145 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * ii);
              v146 = objc_msgSend(v145, "isGroupChat");
              objc_msgSend(v145, "displayName");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = v147;
              if (v146 && objc_msgSend(v147, "length"))
              {
                objc_msgSend(v223, "objectForKey:", v148);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                v150 = v149;
                if (v149)
                {
                  objc_msgSend(v149, "addObject:", v145);
                }
                else
                {
                  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v145, 0);
                  objc_msgSend(v223, "setObject:forKey:", v153, v148);

                }
              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v151 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v253 = 138412802;
                  v152 = CFSTR("NO");
                  if (v146)
                    v152 = CFSTR("YES");
                  *(_QWORD *)&v253[4] = v145;
                  *(_WORD *)&v253[12] = 2112;
                  *(_QWORD *)&v253[14] = v152;
                  *(_WORD *)&v253[22] = 2112;
                  *(_QWORD *)&v253[24] = v148;
                  _os_log_impl(&dword_21ED90000, v151, OS_LOG_TYPE_INFO, "Could not construct disambiguation option for chat: %@, isGroupChat: %@, displayName: %@. Ignoring.", v253, 0x20u);
                }

              }
            }
            v142 = -[__CFString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v242, buf, 16);
          }
          while (v142);
        }

        v228 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v240 = 0u;
        v241 = 0u;
        v238 = 0u;
        v239 = 0u;
        objc_msgSend(v223, "allValues");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
        if (v155)
        {
          v156 = *(_QWORD *)v239;
          do
          {
            for (jj = 0; jj != v155; ++jj)
            {
              if (*(_QWORD *)v239 != v156)
                objc_enumerationMutation(v154);
              v158 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * jj);
              objc_msgSend(v158, "sortedArrayUsingComparator:", &unk_24E395D20);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "firstObject");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v228, "addObject:", v160);
              if ((unint64_t)objc_msgSend(v158, "count") >= 2 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v161 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
                {
                  v162 = objc_msgSend(v158, "count");
                  objc_msgSend(v160, "displayName");
                  v163 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v247 = 134218498;
                  v248 = v162;
                  v249 = 2112;
                  v250 = v163;
                  v251 = 2112;
                  v252 = v160;
                  _os_log_impl(&dword_21ED90000, v161, OS_LOG_TYPE_INFO, "%ld chats have the name \"%@\". Presenting disambiguation of chats with the same name is confusing, so using the most recent one, %@.", v247, 0x20u);

                }
              }

            }
            v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
          }
          while (v155);
        }

        objc_msgSend(v228, "sortedArrayUsingComparator:", &unk_24E395D20);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v236 = 0u;
        v237 = 0u;
        v234 = 0u;
        v235 = 0u;
        v166 = v164;
        v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v234, v247, 16);
        if (v167)
        {
          v168 = *(_QWORD *)v235;
          do
          {
            for (kk = 0; kk != v167; ++kk)
            {
              if (*(_QWORD *)v235 != v168)
                objc_enumerationMutation(v166);
              v170 = *(id *)(*((_QWORD *)&v234 + 1) + 8 * kk);
              v171 = objc_msgSend(v170, "isGroupChat");
              v172 = objc_msgSend(v170, "isBusinessChat");
              v173 = objc_msgSend(v170, "isStewieChat");
              objc_msgSend(v170, "displayName");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = v174;
              if (v171 | v172 | v173 && objc_msgSend(v174, "length"))
              {
                v176 = objc_alloc(MEMORY[0x24BDDA1A0]);
                objc_msgSend(v170, "chatIdentifier");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "displayName");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v179 = (void *)objc_msgSend(v176, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v177, v178, 0);

              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v180 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v256 = 138413058;
                    v181 = CFSTR("NO");
                    if (v171)
                      v182 = CFSTR("YES");
                    else
                      v182 = CFSTR("NO");
                    v257 = v170;
                    if (v172)
                      v181 = CFSTR("YES");
                    v258 = 2112;
                    v259 = v182;
                    v260 = 2112;
                    v261 = v181;
                    v262 = 2112;
                    v263 = v175;
                    _os_log_impl(&dword_21ED90000, v180, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", v256, 0x2Au);
                  }

                }
                v179 = 0;
              }

              if (v179)
                objc_msgSend(v165, "addObject:", v179);

            }
            v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v234, v247, 16);
          }
          while (v167);
        }

        v183 = (void *)objc_msgSend(v165, "copy");
        v184 = v183;
        if (-[__CFString count](v184, "count") == 1)
        {
          -[__CFString firstObject](v184, "firstObject");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v186 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v265 = (uint64_t)v185;
              _os_log_impl(&dword_21ED90000, v186, OS_LOG_TYPE_INFO, "Only one disambiguation option remains, returning success with resolved name: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v185);
          v187 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v211 = (unint64_t)-[__CFString count](v184, "count") > 1;
          v212 = IMOSLoggingEnabled();
          if (v211)
          {
            if (v212)
            {
              OSLogHandleForIMFoundationCategory();
              v213 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
              {
                v214 = -[__CFString count](v184, "count");
                *(_DWORD *)buf = 134218242;
                v265 = v214;
                v266 = 2112;
                v267 = v184;
                _os_log_impl(&dword_21ED90000, v213, OS_LOG_TYPE_INFO, "Asking user to disambiguate among %ld disambiguation options: %@", buf, 0x16u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA1A8], "disambiguationWithStringsToDisambiguate:", v184);
            v215 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v212)
            {
              OSLogHandleForIMFoundationCategory();
              v216 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v216, OS_LOG_TYPE_INFO, "No disambiguation options remain. Returning unsupported (a.k.a. notFound)", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
            v215 = objc_claimAutoreleasedReturnValue();
          }
          v187 = (void *)v215;
        }

      }
      else
      {
        if (v137)
        {
          OSLogHandleForIMFoundationCategory();
          v198 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v198, OS_LOG_TYPE_INFO, "Could not find any chats matching requested spokenPhrase. Returning unsupported (a.k.a. notFound)", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_312;
    }
    -[__CFString firstObject](v226, "firstObject");
    v126 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v127 = -[__CFString isGroupChat](v126, "isGroupChat");
    v128 = -[__CFString isBusinessChat](v126, "isBusinessChat");
    v129 = -[__CFString isStewieChat](v126, "isStewieChat");
    -[__CFString displayName](v126, "displayName");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v130;
    if (v127 | v128 | v129 && objc_msgSend(v130, "length"))
    {
      v132 = objc_alloc(MEMORY[0x24BDDA1A0]);
      -[__CFString chatIdentifier](v126, "chatIdentifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString displayName](v126, "displayName");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = (void *)objc_msgSend(v132, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v133, v134, 0);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v188 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
        {
          v189 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          v265 = (uint64_t)v126;
          if (v127)
            v190 = CFSTR("YES");
          else
            v190 = CFSTR("NO");
          v266 = 2112;
          v267 = v190;
          if (v128)
            v189 = CFSTR("YES");
          v268 = 2112;
          v269 = v189;
          v270 = 2112;
          v271 = v131;
          _os_log_impl(&dword_21ED90000, v188, OS_LOG_TYPE_INFO, "Could not find a name for chat, ignoring. chat: %@, isGroupChat: %@, isBusinessChat: %@, displayName: %@", buf, 0x2Au);
        }

      }
      v135 = 0;
    }

    v191 = IMOSLoggingEnabled();
    if (v135)
    {
      if (v191)
      {
        OSLogHandleForIMFoundationCategory();
        v192 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v265 = (uint64_t)v135;
          v266 = 2112;
          v267 = v126;
          _os_log_impl(&dword_21ED90000, v192, OS_LOG_TYPE_INFO, "Found chat name \"%@\" matching chat: %@", buf, 0x16u);
        }

      }
      objc_msgSend(v221[5], "messageHandlerDataSource");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = objc_msgSend(v193, "screentimeAllowedToShowChat:error:", v126, 0);

      v195 = IMOSLoggingEnabled();
      if ((v194 & 1) != 0)
      {
        if (v195)
        {
          OSLogHandleForIMFoundationCategory();
          v196 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v265 = (uint64_t)v135;
            v266 = 2112;
            v267 = v126;
            _os_log_impl(&dword_21ED90000, v196, OS_LOG_TYPE_INFO, "Using chat name \"%@\" resolved from matching chat: %@", buf, 0x16u);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA1A8], "successWithResolvedString:", v135);
        v197 = objc_claimAutoreleasedReturnValue();
        goto LABEL_298;
      }
      if (v195)
      {
        OSLogHandleForIMFoundationCategory();
        v210 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v210, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group contains non-allowlisted participants and isn't allowed by downtime.", buf, 2u);
        }

      }
    }
    else if (v191)
    {
      OSLogHandleForIMFoundationCategory();
      v209 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v126;
        _os_log_impl(&dword_21ED90000, v209, OS_LOG_TYPE_INFO, "Could not determine chat name from only matching chat. Returning unsupported/notFound. Matching chat: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDDA1A8], "unsupported");
    v197 = objc_claimAutoreleasedReturnValue();
LABEL_298:
    v187 = (void *)v197;

LABEL_312:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v265 = (uint64_t)v187;
        _os_log_impl(&dword_21ED90000, v217, OS_LOG_TYPE_INFO, "Resolved group name result: %@", buf, 0xCu);
      }

    }
    _IMAssistantCoreSendMessageSignpostLogHandle();
    v218 = objc_claimAutoreleasedReturnValue();
    v219 = v218;
    v220 = (os_signpost_id_t)v221[8];
    if (v220 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v218))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v219, OS_SIGNPOST_INTERVAL_END, v220, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
    }

    (*((void (**)(void))v221[7] + 2))();
    goto LABEL_320;
  }
  if (v108)
  {
    OSLogHandleForIMFoundationCategory();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v121, OS_LOG_TYPE_INFO, "Intent does not contain a spoken group name. Returning notRequired for resolveSpeakableGroupName.", buf, 2u);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v122 = objc_claimAutoreleasedReturnValue();
  v123 = v122;
  v124 = (os_signpost_id_t)v221[8];
  if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v123, OS_SIGNPOST_INTERVAL_END, v124, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v125 = (void (**)(id, __CFString *))v221[7];
  objc_msgSend(MEMORY[0x24BDDA1A8], "notRequired");
  v226 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v125[2](v125, v226);
LABEL_320:

}

void sub_21ED98D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_21ED98D9C(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Image sensitivity analysis error: '%@'", (uint8_t *)&v10, 0xCu);

      }
    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 67109120;
        LODWORD(v11) = a2;
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Image sensisitivty %d.", (uint8_t *)&v10, 8u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "lock");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= a2;
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t sub_21ED98F3C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t sub_21ED998C8(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "sendLocalFileAttachmentURLs:chat:executionContext:expressiveSendStyleID:idsIdentifier:sourceApplicationID:sentMessages:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

void sub_21ED99C44(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", a2, *(_QWORD *)(a1 + 32), 13, *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void sub_21ED9A928(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  v3 = a2;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v9 = 0;
        v6 = "Unable to build a PHAsset message as requested. Returning failure.";
        v7 = (uint8_t *)&v9;
LABEL_10:
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      }
LABEL_11:

    }
LABEL_12:
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80));
    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "sendMessageWithDraft:expressiveSendStyleID:idsIdentifier:executionContext:sourceApplicationID:toChat:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 0;
        v6 = "Unable to send a PHAsset message as requested. Returning failure.";
        v7 = (uint8_t *)&v8;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:toChat:messageType:personProvider:](IMAssistantINMessageConverter, "INMessageForOutgoingIMMessage:toChat:messageType:personProvider:", v3, *(_QWORD *)(a1 + 64), 15, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

LABEL_13:
}

void sub_21ED9B67C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA0B0]), "initWithCode:userActivity:", a2, 0);
  v7 = v6;
  if (a2 == 3)
    objc_msgSend(v6, "setSentMessages:", v5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Returning %@ response.", (uint8_t *)&v12, 0xCu);
    }

  }
  _IMAssistantCoreSendMessageSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_END, v11, "sendMessageWithText", (const char *)&unk_21EDC1733, (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21ED9BD60(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

void sub_21ED9D12C(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resolveRecipientsWithGroupNameOrConversationIdentifier:forIntent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v28 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v28;
  if (!v28)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v2, OS_LOG_TYPE_INFO, "Neither a group name nor a conversation identifier were provided, attempting to resolve by recipients.", buf, 2u);
      }

    }
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (!v5)
    {
LABEL_58:

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v1 = (void *)v28;
      goto LABEL_59;
    }
    v6 = *(_QWORD *)v31;
LABEL_9:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
      objc_msgSend(v8, "contactIdentifier", v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(v8, "personHandle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (!v12)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v8;
              _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "This recipient is already fully resolved: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);
          goto LABEL_56;
        }
      }
      else
      {

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v8;
          _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Resolving %@", buf, 0xCu);
        }

      }
      objc_msgSend(v8, "scoredAlternatives");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v8;
            _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "CRR offered no suggestions for %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA0B8], "unsupported");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v17);
        goto LABEL_55;
      }
      objc_msgSend(v14, "person");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Error extracting a scoredPerson from %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA0B8], "unsupported");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v20);
        goto LABEL_54;
      }
      v18 = objc_msgSend(v14, "recommendation");
      if (v18 == 2)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "siriMatches");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v24;
            _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "CRR resolved to needs disambiguation: %@", buf, 0xCu);

          }
        }
        v25 = (void *)MEMORY[0x24BDDA0B8];
        objc_msgSend(v8, "siriMatches");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "disambiguationWithPeopleToDisambiguate:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v26);

        goto LABEL_54;
      }
      if (v18 == 1)
        break;
      if (!v18)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v17;
            _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "CRR resolved to a confident match: %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v20);
LABEL_54:

      }
LABEL_55:

LABEL_56:
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (!v5)
          goto LABEL_58;
        goto LABEL_9;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v17;
        _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "CRR resolved to needs confirmation: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDDA0B8], "confirmationRequiredWithPersonToConfirm:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);
    goto LABEL_54;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_59:

}

void sub_21ED9D978(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  IMAssistantHandleFromContact *v33;
  IMAssistantHandleFromContact *v34;
  void *v35;
  IMAssistantHandleFromContact *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  char v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  int v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  NSObject *v84;
  int v85;
  NSObject *v86;
  NSObject *v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  int v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  __int128 v112;
  void *v113;
  char v114;
  id obj;
  uint64_t v116;
  id v117;
  uint64_t v118;
  id v119;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  _QWORD v126[4];
  id v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  _QWORD v132[4];
  id v133;
  id v134;
  uint64_t v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  id v149;
  void *v150;
  void *v151;
  uint8_t v152[128];
  uint8_t buf[4];
  uint64_t v154;
  __int16 v155;
  id v156;
  __int16 v157;
  void *v158;
  _BYTE v159[128];
  _BYTE v160[128];
  _QWORD v161[4];

  v161[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resolveRecipientsWithGroupNameOrConversationIdentifier:forIntent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_181;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v2, OS_LOG_TYPE_INFO, "Neither a group name nor a conversation identifier were provided, attempting to resolve by recipients.", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "__imArrayByApplyingBlock:", &unk_24E395BA8);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x24BDD9F40], "__imcore__containsNonSuccess:", v113) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v43, OS_LOG_TYPE_INFO, "All recipients already have a resolved handle, validating screentime status.", buf, 2u);
      }

    }
    v44 = *(void **)(a1 + 32);
    v149 = 0;
    v45 = objc_msgSend(v44, "recipientHandleResolutionResultsAllowedByScreentime:error:", v113, &v149);
    v119 = v149;
    v46 = IMOSLoggingEnabled();
    if ((v45 & 1) != 0)
    {
      if (v46)
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "Returning success with pre-resolved handles.", buf, 2u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v54 = v119;
      if (v46)
      {
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v55, OS_LOG_TYPE_INFO, "Returning unsupported because the preresolved handles contain a non-screentime allowlisted recipient.", buf, 2u);
        }

        v54 = v119;
      }
      if (v54)
        v56 = objc_msgSend(v54, "code");
      else
        v56 = *MEMORY[0x24BDDA4A8];
      v81 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", v56);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v161[0] = v82;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v161, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v81 + 16))(v81, v83);

    }
    goto LABEL_180;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v117 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  obj = *(id *)(a1 + 40);
  v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
  if (!v118)
  {
    v114 = 1;
    goto LABEL_104;
  }
  v114 = 1;
  v116 = *(_QWORD *)v146;
  *(_QWORD *)&v3 = 134218242;
  v112 = v3;
  while (2)
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)v146 != v116)
      {
        v5 = v4;
        objc_enumerationMutation(obj);
        v4 = v5;
      }
      v121 = v4;
      v123 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v4);
      objc_msgSend(v123, "personHandle", v112);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "__im_assistant_handleType");

      objc_msgSend(*(id *)(a1 + 32), "contactsMatchingINPerson:", v123);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(objc_msgSend(v122, "count") | v7))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = (uint64_t)v123;
            _os_log_impl(&dword_21ED90000, v48, OS_LOG_TYPE_INFO, "Recipient contains neither siriMatches nor a personHandle.value, returning unsupported/notFound for recipient: %@", buf, 0xCu);
          }

        }
        v49 = *(_QWORD *)(a1 + 56);
        v50 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDDA0B8], "unsupported");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "recipientsResolutionFailureResultWithResult:forRecipient:amongRecipients:", v51, v123, *(_QWORD *)(a1 + 40));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v49 + 16))(v49, v52);

        v53 = obj;
        goto LABEL_179;
      }
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v122, v123);
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if ((unint64_t)(v7 - 1) < 2)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = (uint64_t)v123;
            _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Recipient contains both an explicit personHandle.value and contact identifiers, attempting to extract mathcing handle from contacts. Recipient: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v123, "personHandle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "value");
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        v139 = 0u;
        v140 = 0u;
        v137 = 0u;
        v138 = 0u;
        v23 = v122;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v138;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v138 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
              objc_msgSend(v27, "__im_assistant_handlesMatchingHandleID:", v124);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  v30 = objc_msgSend(v28, "count");
                  *(_DWORD *)buf = 134218498;
                  v154 = v30;
                  v155 = 2112;
                  v156 = v27;
                  v157 = 2112;
                  v158 = v123;
                  _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "Found %ld matching handles on contact %@ for recipient: %@", buf, 0x20u);
                }

              }
              objc_msgSend(v8, "addObjectsFromArray:", v28);

            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
          }
          while (v24);
        }

        if (objc_msgSend(v8, "count"))
          goto LABEL_68;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = (uint64_t)v124;
            _os_log_impl(&dword_21ED90000, v31, OS_LOG_TYPE_INFO, "Handle %@ was not found on any of the contacts, using handle without a contact", buf, 0xCu);
          }

        }
        if (v7 == 2)
        {
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD38]), "initWithLabel:value:", 0, v124);
          v33 = -[IMAssistantHandleFromContact initWithCNLabeledEmailAddress:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledEmailAddress:contact:", v32, 0);
          if (v33)
            objc_msgSend(v8, "addObject:", v33);
        }
        else
        {
          if (v7 != 1)
            goto LABEL_68;
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v124);
          v33 = (IMAssistantHandleFromContact *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD38]), "initWithLabel:value:", 0, v32);
          v34 = -[IMAssistantHandleFromContact initWithCNLabeledPhoneNumber:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledPhoneNumber:contact:", v33, 0);
          if (v34)
            objc_msgSend(v8, "addObject:", v34);

        }
LABEL_68:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = v112;
            v154 = v40;
            v155 = 2112;
            v156 = v8;
            _os_log_impl(&dword_21ED90000, v39, OS_LOG_TYPE_INFO, "Using %ld matching manually dictated handles: %@", buf, 0x16u);
          }

        }
        goto LABEL_72;
      }
      if (v7 == 3)
      {
        objc_msgSend(v123, "personHandle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "value");
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = -[IMAssistantHandleFromContact initWithBusinessID:]([IMAssistantHandleFromContact alloc], "initWithBusinessID:", v124);
        if (v36)
          objc_msgSend(v8, "addObject:", v36);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = v112;
            v154 = v38;
            v155 = 2112;
            v156 = v8;
            _os_log_impl(&dword_21ED90000, v37, OS_LOG_TYPE_INFO, "Using %ld matching business chat handle: %@", buf, 0x16u);
          }

        }
      }
      else
      {
        if (v7)
          goto LABEL_73;
        objc_msgSend(v123, "personHandle");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v124, "type");
        objc_msgSend(v124, "label");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = 0u;
        v144 = 0u;
        v141 = 0u;
        v142 = 0u;
        v11 = v122;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v142;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v142 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * j);
              objc_msgSend(v15, "__im_assistant_handlesMatchingRequestedHandleType:requestedHandleLabel:", v9, v10);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  v18 = objc_msgSend(v16, "count");
                  *(_DWORD *)buf = 134218498;
                  v154 = v18;
                  v155 = 2112;
                  v156 = v15;
                  v157 = 2112;
                  v158 = v123;
                  _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Found %ld matching handles on contact %@ for recipient: %@", buf, 0x20u);
                }

              }
              objc_msgSend(v8, "addObjectsFromArray:", v16);

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
          }
          while (v12);
        }

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = v112;
            v154 = v20;
            v155 = 2112;
            v156 = v8;
            _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Using %ld matching handles from contacts: %@", buf, 0x16u);
          }

        }
      }
LABEL_72:

LABEL_73:
      if (!objc_msgSend(v8, "count"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = (uint64_t)v123;
            _os_log_impl(&dword_21ED90000, v41, OS_LOG_TYPE_INFO, "Found no handles matching recipient: %@", buf, 0xCu);
          }

        }
        v114 = 0;
      }
      v42 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v117, "setObject:forKey:", v42, v123);

      v4 = v121 + 1;
    }
    while (v121 + 1 != v118);
    v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
    if (v118)
      continue;
    break;
  }
LABEL_104:

  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "scoredAlternatives");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 != 0;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = objc_msgSend(v60, "arePreResolvedSiriMatchesEnabled");

  v61 = IMOSLoggingEnabled();
  if ((v59 & v57) != 0)
  {
    if (v61)
    {
      OSLogHandleForIMFoundationCategory();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v62, OS_LOG_TYPE_INFO, "Skipping existing chat search because we have pre resolved siriMatch results.", buf, 2u);
      }
      goto LABEL_108;
    }
    goto LABEL_153;
  }
  if ((v114 & 1) == 0)
  {
    if (v61)
    {
      OSLogHandleForIMFoundationCategory();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v62, OS_LOG_TYPE_INFO, "Skipping existing chat search as at least one of the recipients has no valid handles.", buf, 2u);
      }
LABEL_108:

    }
LABEL_153:
    v91 = *(void **)(a1 + 40);
    v92 = MEMORY[0x24BDAC760];
    v132[0] = MEMORY[0x24BDAC760];
    v132[1] = 3221225472;
    v132[2] = sub_21ED9F0CC;
    v132[3] = &unk_24E395BF0;
    v93 = v113;
    v133 = v93;
    v94 = v119;
    v95 = *(_QWORD *)(a1 + 32);
    v134 = v94;
    v135 = v95;
    objc_msgSend(v91, "__im_assistant_arrayByApplyingBlockWithIndex:", v132);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD9F40], "__imcore__containsNonSuccess:", v96))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v154 = (uint64_t)v96;
          _os_log_impl(&dword_21ED90000, v97, OS_LOG_TYPE_INFO, "Could not resolve a single contact for each recipient, returning resolution result: %@", buf, 0xCu);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v98 = *(void **)(a1 + 40);
      v126[0] = v92;
      v126[1] = 3221225472;
      v126[2] = sub_21ED9F54C;
      v126[3] = &unk_24E395C18;
      v127 = v93;
      v128 = v96;
      v129 = v117;
      v99 = v94;
      v100 = *(_QWORD *)(a1 + 32);
      v130 = v99;
      v131 = v100;
      objc_msgSend(v98, "__im_assistant_arrayByApplyingBlockWithIndex:", v126);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = *(void **)(a1 + 32);
      v125 = 0;
      LOBYTE(v98) = objc_msgSend(v102, "recipientHandleResolutionResultsAllowedByScreentime:error:", v101, &v125);
      v103 = v125;
      v104 = IMOSLoggingEnabled();
      if ((v98 & 1) != 0)
      {
        if (v104)
        {
          OSLogHandleForIMFoundationCategory();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = (uint64_t)v101;
            _os_log_impl(&dword_21ED90000, v105, OS_LOG_TYPE_INFO, "Completed handle resolution with results: %@", buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        if (v104)
        {
          OSLogHandleForIMFoundationCategory();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v106, OS_LOG_TYPE_INFO, "Returning unsupported because chat is blocked for downtime.", buf, 2u);
          }

        }
        if (v103)
          v107 = objc_msgSend(v103, "code");
        else
          v107 = *MEMORY[0x24BDDA4A8];
        v109 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", v107);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = v110;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v150, 1);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v109 + 16))(v109, v111);

      }
    }

    v53 = v133;
    goto LABEL_179;
  }
  if (v61)
  {
    OSLogHandleForIMFoundationCategory();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v63, OS_LOG_TYPE_INFO, "Attempting to find an existing chat with the desired recipients", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "messageHandlerDataSource");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "chatDataSource");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "allExistingChats");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "__imArrayByFilteringWithBlock:", &unk_24E395DD8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sortedArrayUsingSelector:", sel_compareChatByDate_);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resolveRecipientsByFindingExistingRelevantChatsForRecipients:withMatchingHandlesByRecipient:fromChats:", *(_QWORD *)(a1 + 40), v117, v53);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "count") == 1)
  {
    objc_msgSend(v68, "firstObject");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "chat");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messageHandlerDataSource");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0;
    v72 = objc_msgSend(v71, "screentimeAllowedToShowChat:error:", v70, &v136);
    v73 = v136;

    if ((v72 & 1) != 0)
    {
      objc_msgSend(v69, "resolvedPersons");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "__imArrayByApplyingBlock:", &unk_24E395BC8);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "chatIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v154 = (uint64_t)v76;
          _os_log_impl(&dword_21ED90000, v77, OS_LOG_TYPE_INFO, "Found an existing chat matching recipients. Storing conversationIdentifier=%@", buf, 0xCu);
        }

      }
      v78 = *(_QWORD *)(a1 + 32);
      v79 = *(void **)(v78 + 32);
      *(_QWORD *)(v78 + 32) = v76;
      v80 = v76;

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v87, OS_LOG_TYPE_INFO, "Returning unsupported because one of the intended recipient handles is not allowed by downtime.", buf, 2u);
        }

      }
      if (v73)
        v88 = objc_msgSend(v73, "code");
      else
        v88 = *MEMORY[0x24BDDA4A8];
      v108 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDDA0B8], "unsupportedForReason:", v88);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v74;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v151, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v108 + 16))(v108, v75);
    }

    goto LABEL_174;
  }
  if ((unint64_t)objc_msgSend(v68, "count") < 2)
  {
LABEL_148:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v90, OS_LOG_TYPE_INFO, "Did not find any existing chat matching request.", buf, 2u);
      }

    }
    goto LABEL_153;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v84, OS_LOG_TYPE_INFO, "Multiple existing recent chats match the requested participant(s).", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "recipientDisambiguationResultsFromMultipleRelevantChats:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = IMOSLoggingEnabled();
  if (!v69)
  {
    if (v85)
    {
      OSLogHandleForIMFoundationCategory();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v89, OS_LOG_TYPE_INFO, "Could not construct disambiguation result. Ignoring relevant chats.", buf, 2u);
      }

    }
    goto LABEL_148;
  }
  if (v85)
  {
    OSLogHandleForIMFoundationCategory();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v154 = (uint64_t)v69;
      _os_log_impl(&dword_21ED90000, v86, OS_LOG_TYPE_INFO, "Returning disambiguation result: %@", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_174:

LABEL_179:
LABEL_180:

  v1 = 0;
LABEL_181:

}

id sub_21ED9F04C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "customIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", v2);
  else
    objc_msgSend(MEMORY[0x24BDDA0B8], "needsValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t sub_21ED9F0BC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDDA0B8], "successWithResolvedPerson:", a2);
}

id sub_21ED9F0CC(id *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v5;
      _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Beginning contact resolution for recipient: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "arePreResolvedSiriMatchesEnabled");

  if (!v8)
    goto LABEL_29;
  -[NSObject siriMatches](v5, "siriMatches");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[NSObject count](v9, "count");
  if (v10 >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v9;
        _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "found multiple resolved siri matches. disambiguating: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD9F40], "disambiguationWithPeopleToDisambiguate:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v20 = v12;
    goto LABEL_37;
  }
  if (v10 != 1)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_28:

LABEL_29:
      objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject __imcore__isSuccess](v9, "__imcore__isSuccess"))
      {
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "contactResolutionResultForContacts:matchingRecipient:", v23, v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v25 = 138412290;
          v26 = v9;
          _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Already have a resolved contact and handle for this recipient. Returning success: %@", (uint8_t *)&v25, 0xCu);
        }

      }
      v12 = v9;
      v9 = v12;
      goto LABEL_35;
    }
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "did not find any siri matches. falling back to legacy contact resolution.", (uint8_t *)&v25, 2u);
    }
LABEL_27:

    goto LABEL_28;
  }
  -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
  v13 = objc_claimAutoreleasedReturnValue();
  -[NSObject personHandle](v13, "personHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length") == 0;

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "found one resolved siri match, but no handle. falling back to legacy contact resolution.", (uint8_t *)&v25, 2u);
      }

    }
    goto LABEL_27;
  }
  -[NSObject personHandle](v13, "personHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setCustomIdentifier:](v13, "setCustomIdentifier:", v18);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v13;
      _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "found one resolved siri match with a valid handle. picking it: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD9F40], "successWithResolvedPerson:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
  return v20;
}

id sub_21ED9F54C(id *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Beginning handle resolution for recipient: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "__imcore__isSuccess"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v7;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Intent already has a resolved handle for this recipient. Returning success: %@", (uint8_t *)&v20, 0xCu);
      }

    }
    v9 = v7;
  }
  else
  {
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") == 0;

    if (v13)
    {
      objc_msgSend(a1[6], "objectForKeyedSubscript:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "objectForKeyedSubscript:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "count") >= 2 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = v16;
          _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "More than one matching contact exists after person resolution. Person resolution should have resolved the recipients down to a single contact. Something has gone horribly wrong. Picking the first one and continuing with handle resolution.\nContacts: %@", (uint8_t *)&v20, 0xCu);
        }

      }
      objc_msgSend(a1[8], "handleResolutionResultForHandles:resolvedContactForAlternatives:recipient:", v15, v17, v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = v10;
          _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "A handle was already resolved as part of contact resolution (e.g. contacts with duplicate names that only contain one valid handle). Returning success with the resolved handle: %@", (uint8_t *)&v20, 0xCu);
        }

      }
      v9 = v10;
    }

  }
  return v9;
}

void sub_21EDA03A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 134218498;
        v9 = objc_msgSend(v6, "count");
        v10 = 2112;
        v11 = v5;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "%ld contacts have the name \"%@\". Will use handles for these contacts, rather than just name, when disambiguating. Contacts: %@", (uint8_t *)&v8, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  }

}

void sub_21EDA0FB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  IMAssistantChatParticipant *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a4;
  v8 = a3;
  v9 = -[IMAssistantChatParticipant initWithIMHandle:handleFromContact:]([IMAssistantChatParticipant alloc], "initWithIMHandle:handleFromContact:", v8, v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "addObject:", v9);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v9, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v12);
  }

}

id sub_21EDA1090(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFromContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contact");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "contactIdentifiersMatchingHandle:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "contactWithIdentifier:", v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v15 = 134219010;
          v16 = objc_msgSend(v10, "count");
          v17 = 2112;
          v18 = v5;
          v19 = 2112;
          v20 = v11;
          v21 = 2112;
          v22 = v10;
          v23 = 2112;
          v24 = v7;
          _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Found %ld contacts matching handle: %@. Using contact identifier %@ from list %@. Contact: %@", (uint8_t *)&v15, 0x34u);
        }

      }
      if (v7)
        goto LABEL_2;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = (uint64_t)v5;
          _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Did not find any contacts matching manually requested handle: %@", (uint8_t *)&v15, 0xCu);
        }

      }
    }
    v7 = objc_alloc(MEMORY[0x24BDD9F30]);
    objc_msgSend(v7, "__im_assistant_initAnonymousRecipientWithIMHandle:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_2:
  v8 = objc_alloc(MEMORY[0x24BDD9F30]);
  objc_msgSend(v8, "__im_assistant_initWithContact:imHandle:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v9;
}

uint64_t sub_21EDA1F84(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "imHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

id sub_21EDA3758(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD9F30];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v5, "__im_assistant_initWithHandleFromContact:accountDataSource:", v4, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_21EDA3868(uint64_t a1, uint64_t a2)
{
  id v2;

  if (*(_QWORD *)(a1 + 32) == a2)
  {
    v2 = *(id *)(a1 + 40);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA0B8], "notRequired");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t sub_21EDA38FC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastFinishedMessageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastFinishedMessageDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void sub_21EDA3968(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Live photo photo write completed.", (uint8_t *)&v9, 2u);
    }

  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Failed to write the photo (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_21EDA3AF0(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Live photo video write completed.", (uint8_t *)&v9, 2u);
    }

  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Failed to write the live photo video compliment (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_21EDA3C78(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        v14 = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_21ED90000, v2, OS_LOG_TYPE_INFO, "Attempting to transfer a live photo with photo URL %@ and video URL %@", (uint8_t *)&v14, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "createNewOutgoingTransferWithLocalFileURL:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setAuxImageForTransfer:value:", v5, 1);
    objc_msgSend(MEMORY[0x24BE511F8], "AuxGUIDFromFileTransferGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "registerGUID:forNewOutgoingTransferWithLocalURL:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setAuxVideoForTransfer:value:", v6, 1);
    objc_msgSend(*(id *)(a1 + 48), "registerTransferWithDaemon:", v6);
    objc_msgSend(*(id *)(a1 + 48), "registerTransferWithDaemon:", v5);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 56);
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v9 = (_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1458], "__im_attributedStringWithFileTransfers:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__im_attributedStringByAssigningMessagePartNumbers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v11, 0, *v9, 5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void sub_21EDA3F24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Photo write completed.", (uint8_t *)&v23, 2u);
    }

  }
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v23 = 138412546;
        v24 = v6;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Failed to write the photo (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v23, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = v8;
    v13 = v10;
    v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v23 = 138412290;
          v24 = v13;
          _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", (uint8_t *)&v23, 0xCu);
        }

      }
      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v12, "createNewOutgoingTransferWithLocalFileURL:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerTransferWithDaemon:", v17);
      objc_msgSend(v16, "addObject:", v17);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v23 = 138412290;
          v24 = v16;
          _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v23, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BDD1458], "__im_attributedStringWithFileTransfers:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v20, 0, v16, 5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", (uint8_t *)&v23, 2u);
        }

      }
      v21 = 0;
    }

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v21);
  }

}

void sub_21EDA42EC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Video write completed.", (uint8_t *)&v23, 2u);
    }

  }
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(void **)(a1 + 32);
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v23 = 138412546;
        v24 = v6;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Failed to write the video (%@) into the MessagesAssistantExtension Sandbox. Error: %@", (uint8_t *)&v23, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = v8;
    v13 = v10;
    v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v23 = 138412290;
          v24 = v13;
          _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", (uint8_t *)&v23, 0xCu);
        }

      }
      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v12, "createNewOutgoingTransferWithLocalFileURL:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerTransferWithDaemon:", v17);
      objc_msgSend(v16, "addObject:", v17);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v23 = 138412290;
          v24 = v16;
          _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", (uint8_t *)&v23, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BDD1458], "__im_attributedStringWithFileTransfers:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE50320], "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v20, 0, v16, 5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", (uint8_t *)&v23, 2u);
        }

      }
      v21 = 0;
    }

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v21);
  }

}

uint64_t sub_21EDA46B4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOperational");

  return v3;
}

id sub_21EDA46EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v28 = v5;
  if (MEMORY[0x2207BE180]())
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v6);
    if (v7)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v5, "phoneNumbers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v34 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isLikePhoneNumber:", v7);

            if (v14)
            {
              INPersonHandleLabelForCNLabeledValue();
              v15 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v15;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v10);
      }

    }
    else
    {
      v9 = 0;
    }

    v24 = 2;
  }
  else if (IMStringIsEmail())
  {
    IMNormalizeFormattedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v5, "emailAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          IMNormalizeFormattedString();
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "isEqual:", v16))
          {
            INPersonHandleLabelForCNLabeledValue();
            v23 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v23;
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v18);
    }

    v24 = 1;
  }
  else
  {
    if ((MEMORY[0x2207BE168](v6) & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v6;
        _os_log_impl(&dword_21ED90000, v25, OS_LOG_TYPE_INFO, "Could not determine person handle label or type because [IMHandle normalizedID] was neither a phone number nor an email address: %@", buf, 0xCu);
      }

    }
    v24 = 0;
    v9 = 0;
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F38]), "initWithValue:type:label:", v6, v24, v9);

  return v26;
}

uint64_t sub_21EDA4A40(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if ((MEMORY[0x2207BE180](v3) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((IMStringIsEmail() & 1) != 0)
    {
      v4 = 2;
    }
    else if ((MEMORY[0x2207BE168](v3) & 1) != 0)
    {
      v4 = 3;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v7 = 138412290;
          v8 = v3;
          _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "%@ is an invalid personHandle.value.", (uint8_t *)&v7, 0xCu);
        }

      }
      v4 = 4;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t sub_21EDA4B64(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(MEMORY[0x24BDD9F38], "__im_assistant_handleTypeForString:", v1);

  return v2;
}

id _IMAssistantCoreGeneralSignpostLogHandle()
{
  if (qword_25548B9C8 != -1)
    dispatch_once(&qword_25548B9C8, &unk_24E395E18);
  return (id)qword_25548B9C0;
}

void sub_21EDA4BE4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "IMAssistantCore");
  v1 = (void *)qword_25548B9C0;
  qword_25548B9C0 = (uint64_t)v0;

}

id _IMAssistantCoreSendMessageSignpostLogHandle()
{
  if (qword_25548B9D8 != -1)
    dispatch_once(&qword_25548B9D8, &unk_24E395E38);
  return (id)qword_25548B9D0;
}

void sub_21EDA4C54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "SendMessageIntent");
  v1 = (void *)qword_25548B9D0;
  qword_25548B9D0 = (uint64_t)v0;

}

id _IMAssistantCoreSearchForMessageSignpostLogHandle()
{
  if (qword_25548B9E8 != -1)
    dispatch_once(&qword_25548B9E8, &unk_24E395E58);
  return (id)qword_25548B9E0;
}

void sub_21EDA4CC4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "SearchForMessageIntent");
  v1 = (void *)qword_25548B9E0;
  qword_25548B9E0 = (uint64_t)v0;

}

id sub_21EDA4CF4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "handleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imHandleWithID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "normalizedID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v13 = v12;

  objc_msgSend(v9, "displayID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v8;
  v17 = v16;

  objc_msgSend(v7, "contact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "personHandleType");
  objc_msgSend(v7, "personHandleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v18, v17, v13, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id sub_21EDA4E20(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imHandleWithID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v9, "type");
    objc_msgSend(v9, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "__im_assistant_initWithContact:imHandle:type:label:", v8, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id sub_21EDA4EF4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "normalizedID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD9F38], "__im_assistant_extractIntentHandleLabelAndTypeFromContact:forNormalizedID:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");
  objc_msgSend(v9, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__im_assistant_initWithContact:imHandle:type:label:", v7, v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_21EDA4FB8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "displayID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "normalizedID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v12, v13, v14, a5, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t sub_21EDA506C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", a3, 0, 0, a4, a5);
}

id sub_21EDA5080(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1730], "componentsForContact:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F38]), "initWithValue:type:label:", v12, a6, v14);
  objc_msgSend(MEMORY[0x24BDD9F30], "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F30]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v16, v15, v17, 0, v18, v13);
  objc_msgSend(v11, "phonemeData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPhonemeData:", v20);

  return v19;
}

id sub_21EDA51EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t IsEmail;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MEMORY[0x2207BE180](v4) & 1) != 0)
    IsEmail = 2;
  else
    IsEmail = IMStringIsEmail();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F38]), "initWithValue:type:", v5, IsEmail);
  objc_msgSend(MEMORY[0x24BDD9F30], "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", 0, v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F30]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v7, 0, v8, 0, 0, v4);

  return v9;
}

id sub_21EDA52D4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  dispatch_semaphore_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  intptr_t (*v40)(uint64_t, void *);
  void *v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "stewieEnabled");

  if (!v11 || !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE51058]))
  {
    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isTranscriptSharingEnabled");

    if (!v13
      || (objc_msgSend((id)*MEMORY[0x24BE50D20], "lowercaseString"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v9, "hasSuffix:", v14),
          v14,
          !v15))
    {
      v18 = MEMORY[0x2207BE168](v9);
      v19 = v9;
      if ((v18 & 1) != 0 || (v20 = MEMORY[0x2207BE168](v8), v19 = v8, v20))
        v21 = v19;
      else
        v21 = 0;
      if (!objc_msgSend(v21, "length"))
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v7, 0);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
LABEL_40:

            goto LABEL_41;
          }

        }
        if (objc_msgSend(v8, "length"))
          v30 = v8;
        else
          v30 = v9;
        v17 = v30;
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BE511A8], "placeholderNameForBrandURI:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = dispatch_semaphore_create(0);
      v44 = 0;
      v45 = &v44;
      v46 = 0x3032000000;
      v47 = sub_21EDA5834;
      v48 = sub_21EDA5844;
      v49 = 0;
      objc_msgSend(MEMORY[0x24BE502F0], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = MEMORY[0x24BDAC760];
      v39 = 3221225472;
      v40 = sub_21EDA584C;
      v41 = &unk_24E395E80;
      v43 = &v44;
      v25 = v23;
      v42 = v25;
      objc_msgSend(v24, "businessNameForUID:updateHandler:", v21, &v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "length", v38, v39, v40, v41))
      {
        v27 = IMOSLoggingEnabled();
        v28 = v26;
        if (v27)
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v26;
            _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "Using cached business name: %@", buf, 0xCu);
          }

          v28 = v26;
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v31, OS_LOG_TYPE_INFO, "Business name lookup beginning.", buf, 2u);
          }

        }
        v32 = dispatch_time(0, 3000000000);
        if (dispatch_semaphore_wait(v25, v32) && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Business name lookup timed out", buf, 2u);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = (void *)v45[5];
            *(_DWORD *)buf = 138412290;
            v51 = v35;
            _os_log_impl(&dword_21ED90000, v34, OS_LOG_TYPE_INFO, "Business name lookup completed with name: %@", buf, 0xCu);
          }

        }
        if (!objc_msgSend((id)v45[5], "length"))
          goto LABEL_37;
        v28 = (void *)v45[5];
      }
      v36 = v28;

      v22 = v36;
LABEL_37:
      v17 = v22;

      _Block_object_dispose(&v44, 8);
      goto LABEL_40;
    }
  }
  IMSharedUtilitiesFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME"), &stru_24E396530, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
  return v17;
}

uint64_t sub_21EDA5834(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21EDA5844(uint64_t a1)
{

}

intptr_t sub_21EDA584C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_21EDA5888(void *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  objc_msgSend(a1, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(a1, "siriMatches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v2, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  objc_msgSend(v2, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id sub_21EDA59F0(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stripFZIDPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "im_stripCategoryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)IDSCopyRawAddressForDestination();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Normalized handle %@", (uint8_t *)&v20, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD9F38], "__im_assistant_extractIntentHandleLabelAndTypeFromContact:forNormalizedID:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD9F30]);
    v16 = objc_msgSend(v14, "type");
    objc_msgSend(v14, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "__im_assistant_initWithContact:displayFormattedHandle:normalizedHandle:type:label:", v7, v12, v12, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "__im_assistant_displayNameForContact:displayFormattedHandle:normalizedHandle:", 0, 0, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F30]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v14, 0, v15, 0, 0, v12);
  }

  objc_msgSend(v18, "setIsMe:", objc_msgSend(v6, "isMe"));
  return v18;
}

void sub_21EDA61C4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "messageIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_21EDA6498;
      v14[3] = &unk_24E395EA8;
      v18 = *(id *)(a1 + 48);
      v15 = v8;
      v12 = *(id *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v16 = v12;
      v17 = v13;
      v5 = v8;
      objc_msgSend(v9, "chatsForMessageIdentifiers:completion:", v11, v14);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Message identifier has more than one message item associated with it, requiring app launch", buf, 2u);
        }

      }
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 5, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "messageIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "No messages found that match the provided identifier %@", buf, 0xCu);

      }
    }
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDA6498(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "allowedByScreenTime") & 1) != 0)
    {
      if ((objc_msgSend(v4, "isMemberOfChat") & 1) != 0)
      {
        if ((objc_msgSend(v4, "supportsCapabilities:", 1) & 1) != 0)
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "isAudioMessage") & 1) != 0
            || objc_msgSend(*(id *)(a1 + 32), "isFileAttachment"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v5 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Message type does not support editing", buf, 2u);
              }

            }
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 8, 0);
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "body");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "__im_messagePartIndexes");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v33, "count");
            v13 = IMOSLoggingEnabled();
            if (v12 == 1)
            {
              if (v13)
              {
                OSLogHandleForIMFoundationCategory();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  v35 = objc_msgSend(v33, "firstIndex");
                  _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Determining edit eligiblity of message part with index %lu", buf, 0xCu);
                }

              }
              switch(objc_msgSend(*(id *)(a1 + 32), "eligibilityForEditType:messagePartIndex:", 1, objc_msgSend(v33, "firstIndex")))
              {
                case 0:
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v15 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Messages is eligible for editing", buf, 2u);
                    }

                  }
                  goto LABEL_47;
                case 1:
                  if (!IMOSLoggingEnabled())
                    goto LABEL_88;
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Messages from different senders cannot be edited", buf, 2u);
                  }
                  break;
                case 2:
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Message service does not support editing", buf, 2u);
                    }

                  }
                  v16 = 0;
                  v17 = 9;
                  goto LABEL_89;
                case 3:
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21ED90000, v21, OS_LOG_TYPE_INFO, "Message is too old to be edited", buf, 2u);
                    }

                  }
                  v16 = 0;
                  v17 = 7;
                  goto LABEL_89;
                case 4:
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Plugin message types do not support editing", buf, 2u);
                    }

                  }
                  v16 = 0;
                  v17 = 8;
                  goto LABEL_89;
                case 5:
                  if (!IMOSLoggingEnabled())
                    goto LABEL_88;
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Messages has been edited too many times", buf, 2u);
                  }
                  break;
                case 6:
                  if (!IMOSLoggingEnabled())
                    goto LABEL_88;
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Messages is currently sending", buf, 2u);
                  }
                  break;
                case 7:
                  if (!IMOSLoggingEnabled())
                    goto LABEL_88;
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Scheduled Messages is assumed to be sent but not yet received ack from server for sending", buf, 2u);
                  }
                  break;
                case 8:
                  if (!IMOSLoggingEnabled())
                    goto LABEL_88;
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "Scheduled message is in a failed state and can't be edited.", buf, 2u);
                  }
                  break;
                default:
LABEL_47:
                  v16 = 1;
                  v17 = 3;
                  goto LABEL_89;
              }

LABEL_88:
              v16 = 0;
              v17 = 4;
LABEL_89:
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", v17, 0);
              if (v16)
              {
                v30 = (void *)MEMORY[0x24BE51230];
                v24 = *(void **)(a1 + 32);
                objc_msgSend(v24, "body");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "__im_messagePartIndexes");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v31, "firstIndex");
                v26 = objc_alloc(MEMORY[0x24BDD1458]);
                objc_msgSend(*(id *)(a1 + 40), "editedContent");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)objc_msgSend(v26, "initWithString:", v27);
                objc_msgSend(v30, "editedMessageItemWithOriginalMessageItem:editedPartIndex:newPartText:", v24, v25, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 48), "sendEditedMessageItem:originalMessageItem:chat:backwardCompatabilityText:", v29, *(_QWORD *)(a1 + 32), v4, 0);
              }
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            }
            else
            {
              if (v13)
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Message has more than one part, requiring app launch", buf, 2u);
                }

              }
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 5, 0);
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            }

          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "capability does not support editing", buf, 2u);
            }

          }
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 9, 0);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v4;
            _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Will not send to chat in Un-Joined state: %@", buf, 0xCu);
          }

        }
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 11, 0);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
    }
    else
    {
      if (objc_msgSend(v4, "allowedToShowConversationSync"))
        v8 = 12;
      else
        v8 = 13;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "ScreenTime or DownTime restriction is in-place, returning", buf, 2u);
        }

      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", v8, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "No chats found for message identifiers", buf, 2u);
      }

    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9CF8]), "initWithCode:userActivity:", 4, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_21EDA6DB4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21EDA6CA8);
  }
  _Unwind_Resume(a1);
}

void sub_21EDA70B0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "chatIdentifier", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Searching for chat corresponding to conversation identifiers %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "chatsWithConversationIdentifiers:", v4, (_QWORD)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifiers %@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id sub_21EDA7318(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[4];

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_21EDA73E0;
  v8[3] = &unk_24E395EF8;
  v5 = v4;
  v9 = v5;
  v10 = v11;
  objc_msgSend(a1, "__imArrayByApplyingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v11, 8);
  return v6;
}

void sub_21EDA73C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21EDA73E0(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void sub_21EDA76D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Calling resolveRecipients completion handler with result: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v9, OS_SIGNPOST_INTERVAL_END, v10, "resolveRecipientsForSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v11, 2u);
  }

}

void sub_21EDA7A08(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Calling resolveSenders completion handler with result: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v9, OS_SIGNPOST_INTERVAL_END, v10, "resolveSendersForSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDA829C(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 5;
  v3 = (void *)a1[4];
  objc_msgSend((id)a1[5], "speakableGroupNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveSpeakableGroupNames:forIntent:", v4, *v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_21ED90000, v6, OS_LOG_TYPE_INFO, "Calling resolveSpeakableGroupNames completion handler with results: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_END, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v10, 2u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t sub_21EDA8414(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDA85B0(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t v45[4];
  int v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_21ED90000, v3, OS_LOG_TYPE_INFO, "Performing intent: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "messageHandlerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasMessagingAccount");

  if ((v7 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3032000000;
    v49 = sub_21EDA8B94;
    v50 = sub_21EDA8BA4;
    v51 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_21EDA8B94;
    v43 = sub_21EDA8BA4;
    v44 = 0;
    objc_msgSend(*(id *)(a1 + 32), "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count") == 0;

      if (v25)
      {
        v30 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(a1 + 40);
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = sub_21EDA8BAC;
        v38[3] = &unk_24E395F98;
        v38[4] = &buf;
        v38[5] = &v39;
        objc_msgSend(v29, "resolveRecipientsAndSender:withCompletion:", v30, v38);
        objc_msgSend(*(id *)(a1 + 32), "contents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "speakableGroupNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "conversationIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dateTimeRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(*(id *)(a1 + 32), "attributes");
        v13 = 0;
        v15 = 0;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "notificationIdentifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");
            *(_DWORD *)v45 = 67109120;
            v46 = v28;
            _os_log_impl(&dword_21ED90000, v26, OS_LOG_TYPE_INFO, "Intent with %u notificationIdentifiers, looking at only unread messages from those threads", v45, 8u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "notificationIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v13 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 2;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");
          *(_DWORD *)v45 = 67109120;
          v46 = v12;
          _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Intent with %u identifiers, looking at both unread and read messages", v45, 8u);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 3;
    }
    v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v32 = v40[5];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_21EDA8C38;
    v35[3] = &unk_24E395A00;
    v33 = a1;
    v37 = *(_QWORD *)(a1 + 56);
    v34 = *(void **)(a1 + 40);
    v36 = *(id *)(v33 + 48);
    objc_msgSend(v34, "searchMessagesWithContents:messageIdentifiers:notificationIdentifiers:chatNames:conversationIdentifiers:recipients:senders:dateTimeRange:attributes:completion:", v14, v13, v15, v16, v17, v31, v32, v18, v19, v35);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Could not search for messages; no messaging accounts available",
          (uint8_t *)&buf,
          2u);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA088]), "initWithCode:userActivity:", 6, 0);
    _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 56);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v22, OS_SIGNPOST_INTERVAL_END, v23, "handleSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDA8AE0(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  uint64_t v25;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x21EDA8914);
  }
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v25 - 144), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_21EDA8B94(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21EDA8BA4(uint64_t a1)
{

}

void sub_21EDA8BAC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (objc_msgSend(v8, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (objc_msgSend(v7, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);

}

void sub_21EDA8C38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA088]), "initWithCode:userActivity:", 3, 0);
    objc_msgSend(v4, "setMessages:", v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v12 = 134217984;
        v13 = objc_msgSend(v3, "count");
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Returning success response with %ld messages", (uint8_t *)&v12, 0xCu);
      }

    }
    _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_END, v8, "handleSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Message search returned nil results (e.g. an exception was caught). Returning intent failure response.", (uint8_t *)&v12, 2u);
      }

    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA088]), "initWithCode:userActivity:", 4, 0);
    _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = *(_QWORD *)(a1 + 40);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_END, v11, "handleSearchForMessages", (const char *)&unk_21EDC1733, (uint8_t *)&v12, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_21EDA8EBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDA8F8C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "senders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_21EDA9164;
    v12[3] = &unk_24E395FC0;
    v13 = v9;
    v15 = *(id *)(a1 + 48);
    v14 = v6;
    objc_msgSend(v7, "resolvePersons:forIntent:completionHandler:", v8, v13, v12);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "recipients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "IMAssistantMessageSearchHandler: Failed to resolve recipients: %@", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDA9164(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "senders");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "IMAssistantMessageSearchHandler: Failed to resolve senders: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id sub_21EDA98A4(void *a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (!objc_msgSend(MEMORY[0x24BE50370], "iMessageEnabledForSenderLastAddressedHandle:simID:", 0, 0)
    || (objc_msgSend(MEMORY[0x24BE50368], "iMessageService"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "bestAccountForService:", v2),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    if (objc_msgSend(MEMORY[0x24BE50370], "smsEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE50368], "smsService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "bestAccountForService:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

void sub_21EDA9BA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "messageIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_21EDA9D8C;
    v11[3] = &unk_24E395FE8;
    v12 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 40);
    v13 = v6;
    v14 = v7;
    objc_msgSend(v4, "chatsForMessageIdentifiers:completion:", v5, v11);

    v8 = v12;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifier %@", buf, 0xCu);

      }
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDA9D8C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v40 = a2;
  v3 = objc_msgSend(v40, "count");
  objc_msgSend(*(id *)(a1 + 32), "messageIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "No chats found for message identifiers", buf, 2u);
      }

    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 4, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_36;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v40;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (!v7)
    goto LABEL_11;
  v8 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      if ((objc_msgSend(v10, "allowedByScreenTime") & 1) == 0)
      {
        if (objc_msgSend(v10, "allowedToShowConversationSync"))
          v16 = 12;
        else
          v16 = 13;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "ScreenTime or DownTime restriction is in-place, returning", buf, 2u);
          }

        }
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", v16, 0);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        goto LABEL_35;
      }
      if ((objc_msgSend(v10, "isMemberOfChat") & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v10;
            _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "Will not send to chat in Un-Joined state: %@", buf, 0xCu);
          }

        }
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 11, 0);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_35:

        v14 = v6;
        goto LABEL_36;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v7)
      continue;
    break;
  }
LABEL_11:

  objc_msgSend(MEMORY[0x24BE502B0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSatelliteConnectionActive");

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Message satellite service does not support retraction", buf, 2u);
      }

    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 9, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v14 = *(id *)(a1 + 40);
    v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v38)
    {
      v36 = *(_QWORD *)v42;
      v37 = 0;
      *(_QWORD *)&v20 = 138412290;
      v35 = v20;
LABEL_39:
      v21 = 0;
      while (2)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v21);
        objc_msgSend(v22, "body", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "__im_messagePartIndexes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count") == 1)
        {
          v24 = objc_msgSend(v23, "firstIndex");
          switch(objc_msgSend(v22, "eligibilityForEditType:messagePartIndex:", 2, v37 + v21))
          {
            case 1:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v31, OS_LOG_TYPE_INFO, "Messages from different senders cannot be retracted", buf, 2u);
                }

              }
              goto LABEL_81;
            case 2:
            case 4:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Message type does not support retraction", buf, 2u);
                }

              }
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 8, 0);
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
              goto LABEL_82;
            case 3:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v32, OS_LOG_TYPE_INFO, "Message is too old to be retracted", buf, 2u);
                }

              }
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 7, 0);
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
              goto LABEL_82;
            case 5:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Messages has been edited too many times", buf, 2u);
                }

              }
              goto LABEL_81;
            case 6:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21ED90000, v34, OS_LOG_TYPE_INFO, "Messages is currently sending", buf, 2u);
                }

              }
LABEL_81:
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 4, 0);
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
              goto LABEL_82;
            default:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v22, "guid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v35;
                  v51 = v26;
                  _os_log_impl(&dword_21ED90000, v25, OS_LOG_TYPE_INFO, "Retracting message with identifier %@", buf, 0xCu);

                }
              }
              objc_msgSend(v6, "objectAtIndexedSubscript:", v37 + v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "retractPartIndex:fromMessageItem:chat:backwardCompatabilityText:", v24, v22, v27, 0);

              if (v38 != ++v21)
                continue;
              v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              v37 += v21;
              if (!v38)
                goto LABEL_50;
              goto LABEL_39;
          }
        }
        break;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Message has more than one part, requiring app launch", buf, 2u);
        }

      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 5, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_82:

    }
    else
    {
LABEL_50:

      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA288]), "initWithCode:userActivity:", 3, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
LABEL_36:

}

void sub_21EDAA814(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "chatIdentifier", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Searching for chat corresponding to conversation identifiers %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "chatsWithConversationIdentifiers:", v4, (_QWORD)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Exptected at least one message matching the message identifiers %@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDAAE98(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v3;
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Play audioURL: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "messageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "createAudioPlayerWithIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v11 && objc_msgSend(v11, "startPlayingAudioURL:", v3))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Started playing audio", (uint8_t *)&v18, 2u);
        }

      }
      v13 = objc_msgSend(*(id *)(a1 + 48), "copy");
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Failed to play audio", (uint8_t *)&v18, 2u);
        }

      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F58]), "initWithCode:userActivity:", 5, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Could not find audioURL", (uint8_t *)&v18, 2u);
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F58]), "initWithCode:userActivity:", 6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_21EDAB2E0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Confirm intent completion audioURL: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (v3)
    v5 = 1;
  else
    v5 = 6;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F58]), "initWithCode:userActivity:", v5, 0);
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void sub_21EDAB504(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

}

uint64_t sub_21EDABF18(void *a1)
{
  unint64_t v2;

  v2 = objc_msgSend(a1, "joinState");
  if (v2 < 2)
    return objc_msgSend(a1, "isGroupChat") ^ 1;
  else
    return v2 - 2 <= 1;
}

void sub_21EDADFB0()
{
  NSObject *v0;
  os_signpost_id_t v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _IMAssistantCoreGeneralSignpostLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_signpost_id_generate(v0);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "imDaemonControllerConnection", (const char *)&unk_21EDC1733, (uint8_t *)&v19, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Connecting to IMDaemonController", (uint8_t *)&v19, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addListenerID:capabilities:", CFSTR("IMAssistantCore"), *MEMORY[0x24BE50430] | *MEMORY[0x24BE50420] | *MEMORY[0x24BE50408] | *MEMORY[0x24BE50428] | (*MEMORY[0x24BE50438] | *MEMORY[0x24BE50410]) | *MEMORY[0x24BE50440] | *MEMORY[0x24BE50418]);

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockUntilConnected");

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setBlocksConnectionAtResume:", 1);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_25548B9F8;
  qword_25548B9F8 = v9;

  objc_msgSend((id)qword_25548B9F8, "timeIntervalSinceDate:", v5);
  v12 = v11;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isConnected");
      v16 = CFSTR("NO");
      if (v15)
        v16 = CFSTR("YES");
      v19 = 134218242;
      v20 = v12;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "IMDaemonController blockUntilConnected completed in %.4f seconds. Connected: %@", (uint8_t *)&v19, 0x16u);

    }
  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v1 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v18, OS_SIGNPOST_INTERVAL_END, v1, "imDaemonControllerConnection", (const char *)&unk_21EDC1733, (uint8_t *)&v19, 2u);
  }

}

void sub_21EDAE3E0()
{
  void *v0;
  double v1;
  double v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "connectToIMDaemonController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSinceNow");
  v2 = fabs(v1);
  if (v2 >= 5.0)
  {
    _IMAssistantCoreGeneralSignpostLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    _IMAssistantCoreGeneralSignpostLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "imSystemMonitorSuspendAndResume", (const char *)&unk_21EDC1733, (uint8_t *)&v14, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Calling IMSystemMonitor _forceSuspended and _forceResumed", (uint8_t *)&v14, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BE50380], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_forceSuspended");

    objc_msgSend(MEMORY[0x24BE50380], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_forceResumed");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "IMSystemMonitor _forceResumed completed", (uint8_t *)&v14, 2u);
      }

    }
    _IMAssistantCoreGeneralSignpostLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v13, OS_SIGNPOST_INTERVAL_END, v5, "imSystemMonitorSuspendAndResume", (const char *)&unk_21EDC1733, (uint8_t *)&v14, 2u);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = v2;
      _os_log_impl(&dword_21ED90000, v3, OS_LOG_TYPE_INFO, "Not triggering IMDaemonController reconnect. Connection was established %.4f seconds ago.", (uint8_t *)&v14, 0xCu);
    }

  }
}

uint64_t sub_21EDAE6C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDAE8B0()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_25548BA00;
  qword_25548BA00 = (uint64_t)v0;

}

void sub_21EDAE94C()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_25548BA10;
  qword_25548BA10 = (uint64_t)v0;

}

void sub_21EDAEDBC()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_25548BA20;
  qword_25548BA20 = (uint64_t)v0;

}

void sub_21EDAEE38()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_25548BA30;
  qword_25548BA30 = (uint64_t)v0;

}

void sub_21EDAEEB4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_25548BA40;
  qword_25548BA40 = (uint64_t)v0;

}

void sub_21EDAF3DC()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_25548BA50;
  qword_25548BA50 = (uint64_t)v0;

}

id IMAssistantChatIdentifierFromConversationIdentifier(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR(";"));
  v3 = v1;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    IMComponentsFromChatGUID();
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

void sub_21EDAF994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[13];
  _QWORD v9[14];

  v9[13] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE510F0];
  v8[0] = *MEMORY[0x24BE510E0];
  v8[1] = v0;
  v9[0] = &unk_24E39B008;
  v9[1] = &unk_24E39B020;
  v1 = *MEMORY[0x24BE51100];
  v8[2] = *MEMORY[0x24BE51118];
  v8[3] = v1;
  v9[2] = &unk_24E39B038;
  v9[3] = &unk_24E39B050;
  v2 = *MEMORY[0x24BE510E8];
  v8[4] = *MEMORY[0x24BE51130];
  v8[5] = v2;
  v9[4] = &unk_24E39B068;
  v9[5] = &unk_24E39B080;
  v3 = *MEMORY[0x24BE51138];
  v8[6] = *MEMORY[0x24BE51128];
  v8[7] = v3;
  v9[6] = &unk_24E39B098;
  v9[7] = &unk_24E39B0B0;
  v4 = *MEMORY[0x24BE51108];
  v8[8] = *MEMORY[0x24BE51120];
  v8[9] = v4;
  v9[8] = &unk_24E39B0C8;
  v9[9] = &unk_24E39B0E0;
  v5 = *MEMORY[0x24BE510F8];
  v8[10] = *MEMORY[0x24BE51110];
  v8[11] = v5;
  v9[10] = &unk_24E39B0F8;
  v9[11] = &unk_24E39B110;
  v8[12] = *MEMORY[0x24BE51140];
  v9[12] = &unk_24E39B128;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_25548BA60;
  qword_25548BA60 = v6;

}

id sub_21EDB0F14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_21EDB0F50(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t sub_21EDB12EC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "personFromSPIHandle:", a2);
}

void sub_21EDB2698(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint8_t buf[4];
  unint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v50 = objc_msgSend(v5, "messagePartIndex");
  objc_msgSend(v5, "messagePartBody");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = sub_21EDB3428;
  v57[3] = &unk_24E396230;
  v58 = *(id *)(a1 + 32);
  v55 = (void *)MEMORY[0x2207BE4D4](v57);
  v56 = 0;
  objc_msgSend(v53, "__imspi_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingAttachmentProvider:replacementTextProvider:removedTransferGUIDsOut:", v55, &unk_24E396270, &v56);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v56;
  objc_msgSend(v54, "string");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "_stringByRemovingMessagesControlCharactersFromString:", v52);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "messageType");
  objc_msgSend(*(id *)(a1 + 40), "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = objc_msgSend(v7, "length");
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAdaptiveImageGlyph");

    if (v11)
      goto LABEL_3;
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v13 = 0;
  if (!v11)
    goto LABEL_7;
LABEL_3:
  if (v10)
    v14 = 0;
  else
    v14 = v13 ^ 1;
LABEL_8:
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSiriReactionReadingEnabled");

  if (v16)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v60 = v18;
          _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "This reaction has a reference to message %@", buf, 0xCu);
        }

      }
LABEL_14:
      v19 = 0;
      v20 = 26;
      goto LABEL_131;
    }
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v26;
      if (!v26)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 138412802;
            v60 = (unint64_t)v7;
            v61 = 2048;
            v62 = v50;
            v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Could not find attachment matching attachmentGUID %@ for messagePart %ld of message %@", buf, 0x20u);
          }

        }
        v19 = 0;
        v20 = 0;
        goto LABEL_130;
      }
      objc_msgSend(v26, "uti");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isSticker") & 1) != 0)
      {
        v20 = 5;
      }
      else if ((IMUTTypeIsSupportedAnimatedImage() & 1) != 0)
      {
        v20 = 27;
      }
      else if ((IMUTTypeIsImage() & 1) != 0)
      {
        v20 = 15;
      }
      else if ((IMUTTypeIsMovie() & 1) != 0)
      {
        v20 = 16;
      }
      else if ((IMUTTypeIsVCard() & 1) != 0)
      {
        v20 = 14;
      }
      else if ((IMUTTypeIsCalendar() & 1) != 0)
      {
        v20 = 12;
      }
      else if ((IMUTTypeIsPass() & 1) != 0)
      {
        v20 = 17;
      }
      else if ((IMUTTypeIsAudio() & 1) != 0)
      {
        v20 = 2;
      }
      else if ((IMUTTypeIsMap() & 1) != 0)
      {
        v20 = 13;
      }
      else if ((IMUTTypeIsWatchface() & 1) != 0)
      {
        v20 = 24;
      }
      else if (IMUTTypeIsWorkout())
      {
        v20 = 24;
      }
      else
      {
        v20 = 0;
      }
LABEL_129:

      v19 = 1;
LABEL_130:

      goto LABEL_131;
    }
    if (a3 < 2 || v11)
    {
      switch(v8)
      {
        case 200:
          goto LABEL_48;
        case 201:
          goto LABEL_74;
        case 202:
          goto LABEL_75;
        case 203:
          goto LABEL_76;
        case 204:
          goto LABEL_77;
        case 205:
          goto LABEL_78;
        case 206:
          goto LABEL_79;
        case 207:
          goto LABEL_80;
        case 208:
          goto LABEL_81;
        case 209:
          goto LABEL_82;
        case 210:
          goto LABEL_83;
        case 211:
          goto LABEL_84;
        case 212:
          goto LABEL_85;
        case 213:
          goto LABEL_86;
        case 214:
          if (!IMOSLoggingEnabled())
            goto LABEL_108;
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Cannot map IMSPIMessageTypeBalloonExtensionValue to INMessageType. Using unspecified.", buf, 2u);
          }
          goto LABEL_107;
        case 215:
          goto LABEL_87;
        case 216:
          goto LABEL_88;
        case 217:
          goto LABEL_89;
        case 218:
          goto LABEL_90;
        case 219:
          goto LABEL_91;
        case 220:
          goto LABEL_97;
        case 221:
          goto LABEL_92;
        case 222:
          goto LABEL_93;
        default:
          v19 = 0;
          v20 = 1;
          switch(v8)
          {
            case 'd':
              goto LABEL_131;
            case 'e':
              goto LABEL_61;
            case 'f':
              goto LABEL_94;
            case 'g':
              goto LABEL_95;
            case 'h':
              goto LABEL_96;
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
              goto LABEL_14;
            default:
              goto LABEL_108;
          }
          goto LABEL_131;
      }
    }
    if (objc_msgSend(v6, "length"))
      goto LABEL_38;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v32 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        v60 = v50;
        v61 = 2112;
        v62 = v32;
        _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Skipping empty text message part %ld of %@", buf, 0x16u);
      }
      goto LABEL_163;
    }
  }
  else
  {
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v21)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 138412802;
            v60 = (unint64_t)v7;
            v61 = 2048;
            v62 = v50;
            v63 = 2112;
            v64 = v29;
            _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Could not find attachment matching attachmentGUID %@ for messagePart %ld of message %@", buf, 0x20u);
          }

        }
        v19 = 0;
        v20 = 0;
        goto LABEL_130;
      }
      objc_msgSend(v21, "uti");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isSticker") & 1) != 0)
      {
        v20 = 5;
      }
      else if ((IMUTTypeIsSupportedAnimatedImage() & 1) != 0)
      {
        v20 = 27;
      }
      else if ((IMUTTypeIsImage() & 1) != 0)
      {
        v20 = 15;
      }
      else if ((IMUTTypeIsMovie() & 1) != 0)
      {
        v20 = 16;
      }
      else if ((IMUTTypeIsVCard() & 1) != 0)
      {
        v20 = 14;
      }
      else if ((IMUTTypeIsCalendar() & 1) != 0)
      {
        v20 = 12;
      }
      else if ((IMUTTypeIsPass() & 1) != 0)
      {
        v20 = 17;
      }
      else if ((IMUTTypeIsAudio() & 1) != 0)
      {
        v20 = 2;
      }
      else if ((IMUTTypeIsMap() & 1) != 0)
      {
        v20 = 13;
      }
      else if ((IMUTTypeIsWatchface() & 1) != 0)
      {
        v20 = 24;
      }
      else if (IMUTTypeIsWorkout())
      {
        v20 = 24;
      }
      else
      {
        v20 = 0;
      }
      goto LABEL_129;
    }
    if (a3 < 2 || v11)
    {
      switch(v8)
      {
        case 200:
LABEL_48:
          v19 = 0;
          v20 = 15;
          break;
        case 201:
LABEL_74:
          v19 = 0;
          v20 = 16;
          break;
        case 202:
LABEL_75:
          v19 = 0;
          v20 = 18;
          break;
        case 203:
LABEL_76:
          v19 = 0;
          v20 = 12;
          break;
        case 204:
LABEL_77:
          v19 = 0;
          v20 = 14;
          break;
        case 205:
LABEL_78:
          v19 = 0;
          v20 = 17;
          break;
        case 206:
LABEL_79:
          v19 = 0;
          v20 = 24;
          break;
        case 207:
LABEL_80:
          v19 = 0;
          v20 = 22;
          break;
        case 208:
LABEL_81:
          v19 = 0;
          v20 = 13;
          break;
        case 209:
LABEL_82:
          v19 = 0;
          v20 = 19;
          break;
        case 210:
LABEL_83:
          v19 = 0;
          v20 = 20;
          break;
        case 211:
LABEL_84:
          v19 = 0;
          v20 = 21;
          break;
        case 212:
LABEL_85:
          v19 = 0;
          v20 = 23;
          break;
        case 213:
LABEL_86:
          v19 = 0;
          v20 = 25;
          break;
        case 214:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Cannot map IMSPIMessageTypeBalloonExtensionValue to INMessageType. Using unspecified.", buf, 2u);
            }
LABEL_107:

          }
LABEL_108:
          v19 = 0;
          v20 = 0;
          break;
        case 215:
LABEL_87:
          v19 = 0;
          v20 = 1000;
          break;
        case 216:
LABEL_88:
          v19 = 0;
          v20 = 1004;
          break;
        case 217:
LABEL_89:
          v19 = 0;
          v20 = 1005;
          break;
        case 218:
LABEL_90:
          v19 = 0;
          v20 = 1001;
          break;
        case 219:
LABEL_91:
          v19 = 0;
          v20 = 1002;
          break;
        case 220:
LABEL_97:
          v19 = 0;
          v20 = 1003;
          break;
        case 221:
LABEL_92:
          v19 = 0;
          v20 = 27;
          break;
        case 222:
LABEL_93:
          v19 = 0;
          v20 = 28;
          break;
        default:
          v19 = 0;
          v20 = 1;
          switch(v8)
          {
            case 'd':
              goto LABEL_131;
            case 'e':
LABEL_61:
              v19 = 0;
              v20 = 2;
              break;
            case 'f':
LABEL_94:
              v19 = 0;
              v20 = 3;
              break;
            case 'g':
LABEL_95:
              v19 = 0;
              v20 = 4;
              break;
            case 'h':
LABEL_96:
              v19 = 0;
              v20 = 5;
              break;
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
              goto LABEL_14;
            default:
              goto LABEL_108;
          }
          break;
      }
LABEL_131:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v60 = v20;
          _os_log_impl(&dword_21ED90000, v33, OS_LOG_TYPE_INFO, "Message is type INMessageType %ld", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isSiriReactionReadingEnabled");

      if (v35)
      {
        if (v20 == 26)
        {
          v36 = objc_msgSend(*(id *)(a1 + 88), "INMessageReactionTypeForIMSPIMessageType:", objc_msgSend(*(id *)(a1 + 40), "messageType"));
          if (v36 == 1)
          {
            objc_msgSend(*(id *)(a1 + 40), "associatedMessageEmoji");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v37 = 0;
          }
          if (v36 == *MEMORY[0x24BDDA450] || v36 == *MEMORY[0x24BDDA410])
          {
            v40 = *(void **)(a1 + 88);
            objc_msgSend(*(id *)(a1 + 40), "attachments");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "INStickerForIMSPIAttachment:", v41);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v39 = 0;
          }
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9E98]), "initWithReactionType:reactionDescription:emoji:sticker:", v36, 0, v37, v39);

        }
        else
        {
          v38 = 0;
        }
        objc_msgSend(*(id *)(a1 + 88), "makeINMessage:message:numberOfAttachments:personProvider:referencedINMessage:content:reaction:", v20, *(_QWORD *)(a1 + 40), v19, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), v6, v38);
        v24 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 88), "makeINMessage:message:numberOfAttachments:personProvider:referencedINMessage:content:reaction:", v20, *(_QWORD *)(a1 + 40), v19, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), v6, 0);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 80), "lastObject");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v19 && v20 <= 0x18 && ((1 << v20) & 0x1C3F038) != 0 && v20 == -[NSObject messageType](v42, "messageType"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = *(_QWORD *)(a1 + 64);
              *(_DWORD *)buf = 134218242;
              v60 = v50;
              v61 = 2112;
              v62 = v45;
              _os_log_impl(&dword_21ED90000, v44, OS_LOG_TYPE_INFO, "Aggregating message part %ld of %@ to previous INMessage", buf, 0x16u);
            }

          }
          -[NSObject numberOfAttachments](v43, "numberOfAttachments");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "intValue");

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v47 + 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forKey:](v43, "setValue:forKey:", v48, CFSTR("numberOfAttachments"));

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 80), "addObject:", v24);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_163:

          goto LABEL_164;
        }
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v49 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 134218242;
          v60 = v50;
          v61 = 2112;
          v62 = v49;
          _os_log_impl(&dword_21ED90000, v43, OS_LOG_TYPE_INFO, "Unable to convert message part %ld of %@ to INMessage", buf, 0x16u);
        }
      }

      goto LABEL_163;
    }
    if (objc_msgSend(v6, "length"))
    {
LABEL_38:
      v19 = 0;
      v20 = 1;
      goto LABEL_131;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        v60 = v50;
        v61 = 2112;
        v62 = v25;
        _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Skipping empty text message part %ld of %@", buf, 0x16u);
      }
      goto LABEL_163;
    }
  }
LABEL_164:

}

uint64_t sub_21EDB3428(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

__CFString *sub_21EDB3434(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;

  objc_msgSend(a2, "adaptiveImageGlyphContentDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("\uFFFD");
  }

  return v3;
}

uint64_t sub_21EDB3F0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "__imcore__isSuccess", (_QWORD)v8))
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

BOOL sub_21EDB4008(void *a1)
{
  return objc_msgSend(a1, "resolutionResultCode") == 0;
}

void sub_21EDB41EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  id obj;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v17;
    v3 = MEMORY[0x24BDAC760];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v17 != v2)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x24BE502D0], "sharedController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "synchronousRemoteDaemon");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v3;
        v15[1] = 3221225472;
        v15[2] = sub_21EDB4470;
        v15[3] = &unk_24E3962C0;
        v15[4] = v5;
        objc_msgSend(v7, "markMessageAsReadWithGUID:callerOrigin:reply:", v5, 1, v15);

        ++v4;
      }
      while (v1 != v4);
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v1);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA108]), "initWithCode:userActivity:", 3, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Calling completion with response: %@", buf, 0xCu);
    }

  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v11, OS_SIGNPOST_INTERVAL_END, v12, "handleSetMessageAttributeIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_21EDB4470(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      v6 = *(_QWORD *)(a1 + 32);
      if (a2)
        v5 = CFSTR("YES");
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Message marked as read: %@ success: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

id sub_21EDB4B6C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IMAssistantHandleFromContact *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  IMAssistantHandleFromContact *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 > 102)
  {
    if ((unint64_t)(a3 - 103) >= 2)
      goto LABEL_30;
  }
  else if (a3)
  {
    if (a3 == 1)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
LABEL_20:
      objc_msgSend(a1, "__im_assistant_emailAddressesMatchingLabel:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            v20 = -[IMAssistantHandleFromContact initWithCNLabeledEmailAddress:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledEmailAddress:contact:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), a1);
            if (v20)
              objc_msgSend(v8, "addObject:", v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v17);
      }

      goto LABEL_31;
    }
    if (a3 == 2)
    {
      v7 = 0;
      goto LABEL_8;
    }
LABEL_30:
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    goto LABEL_31;
  }
  v7 = 1;
LABEL_8:
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "__im_assistant_phoneNumbersMatchingLabel:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = -[IMAssistantHandleFromContact initWithCNLabeledPhoneNumber:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledPhoneNumber:contact:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13), a1);
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  if ((v7 & 1) != 0)
    goto LABEL_20;
LABEL_31:
  v21 = (void *)objc_msgSend(v8, "copy");

  return v21;
}

id sub_21EDB4DF0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (!objc_msgSend(v4, "length") || INPersonHandleLabelEqualsCNLabeledValue())
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

id sub_21EDB4F3C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (!objc_msgSend(v4, "length") || INPersonHandleLabelEqualsCNLabeledValue())
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

id sub_21EDB5088(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  IMAssistantHandleFromContact *v12;
  IMAssistantHandleFromContact *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  IMAssistantHandleFromContact *v18;
  IMAssistantHandleFromContact *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend(MEMORY[0x24BDD9F38], "__im_assistant_handleTypeForString:", v4);
  if (v6 == 2)
  {
    objc_msgSend(a1, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v7);
          v18 = -[IMAssistantHandleFromContact initWithCNLabeledEmailAddress:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledEmailAddress:contact:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), a1);
          v19 = v18;
          if (v18 && -[IMAssistantHandleFromContact matchesHandleID:](v18, "matchesHandleID:", v4))
            objc_msgSend(v5, "addObject:", v19);

        }
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }
    goto LABEL_24;
  }
  if (v6 == 1)
  {
    objc_msgSend(a1, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = -[IMAssistantHandleFromContact initWithCNLabeledPhoneNumber:contact:]([IMAssistantHandleFromContact alloc], "initWithCNLabeledPhoneNumber:contact:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), a1);
          v13 = v12;
          if (v12 && -[IMAssistantHandleFromContact matchesHandleID:](v12, "matchesHandleID:", v4))
            objc_msgSend(v5, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }
LABEL_24:

  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

id sub_21EDB52E0(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v35 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v31 = a3;
    v32 = a1;
    v33 = v8;
    objc_msgSend(a1, "__im_assistant_phoneNumbersMatchingLabel:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          IMInternationalForPhoneNumberWithOptions();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            INPersonHandleLabelForCNLabeledValue();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F38]), "initWithValue:type:label:", v17, 2, v18);
            objc_msgSend(v9, "addObject:", v19);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v12);
    }

    a1 = v32;
    v8 = v33;
    a3 = v31;
  }
  if (a3 <= 1)
  {
    v34 = v8;
    objc_msgSend(a1, "__im_assistant_emailAddressesMatchingLabel:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v24), "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          IMCanonicalFormForEmail();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "length"))
          {
            INPersonHandleLabelForCNLabeledValue();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F38]), "initWithValue:type:label:", v26, 1, v27);
            objc_msgSend(v9, "addObject:", v28);

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v22);
    }

    v8 = v34;
  }
  objc_msgSend(v9, "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

id sub_21EDB55DC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  id obj;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v33 = a1;
  objc_msgSend(a1, "phoneNumbers");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 138412546;
    v29 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "value", v29);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "imHandleWithID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          INPersonHandleLabelForCNLabeledValue();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc(MEMORY[0x24BDD9F30]);
          objc_msgSend(v13, "__im_assistant_initWithContact:imHandle:type:label:", v33, v11, 2, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v29;
            v44 = v9;
            v45 = 2112;
            v46 = v33;
            _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Could not create IMHandle with phone number: %@ from contact: %@", buf, 0x16u);
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v5);
  }

  objc_msgSend(v33, "emailAddresses");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v17)
  {
    v19 = *(_QWORD *)v35;
    *(_QWORD *)&v18 = 138412546;
    v30 = v18;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "value", v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "imHandleWithID:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          INPersonHandleLabelForCNLabeledValue();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_alloc(MEMORY[0x24BDD9F30]);
          objc_msgSend(v24, "__im_assistant_initWithContact:imHandle:type:label:", v33, v22, 1, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v25);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v30;
            v44 = v21;
            v45 = 2112;
            v46 = v33;
            _os_log_impl(&dword_21ED90000, v26, OS_LOG_TYPE_INFO, "Could not create IMHandle with email address: %@ from contact: %@", buf, 0x16u);
          }

        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v17);
  }

  objc_msgSend(v32, "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id sub_21EDB5A00(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v1 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v39;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v39 != v26)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v28 = v3;
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v3);
        objc_msgSend(a1, "phoneNumbers", obj);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v35 != v9)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "value");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "stringValue");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "imHandleWithID:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                objc_msgSend(v1, "addObject:", v13);
              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v44 = v11;
                  v45 = 2112;
                  v46 = v5;
                  v47 = 2112;
                  v48 = a1;
                  _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Could not create IMHandle with phone number: %@ account: %@ from contact: %@ ", buf, 0x20u);
                }

              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
          }
          while (v8);
        }

        objc_msgSend(a1, "emailAddresses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v31 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "imHandleWithID:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v1, "addObject:", v21);
              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v44 = v20;
                  v45 = 2112;
                  v46 = v5;
                  v47 = 2112;
                  v48 = a1;
                  _os_log_impl(&dword_21ED90000, v22, OS_LOG_TYPE_INFO, "Could not create IMHandle with email address: %@ account: %@ from contact: %@", buf, 0x20u);
                }

              }
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v17);
        }

        v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v27);
  }

  objc_msgSend(v1, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void sub_21EDB6958()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("IMAssistantIMSPIQueue", v2);
  v1 = (void *)qword_25548BA70;
  qword_25548BA70 = (uint64_t)v0;

}

void sub_21EDB70E8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithChatIdentifiers", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDB7464(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138412546;
    v16 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "account", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "service");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "ID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length") && objc_msgSend(v11, "length"))
        {
          v13 = (void *)IMCopyGUIDForChat();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v16;
              v22 = v12;
              v23 = 2112;
              v24 = v11;
              _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Could not construct chat GUID from handleID: %@ service: %@", buf, 0x16u);
            }

          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v22 = v12;
            v23 = 2112;
            v24 = v11;
            v25 = 2112;
            v26 = v8;
            _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Could not extract handleID: %@ or service: %@ from IMHandle %@", buf, 0x20u);
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v4);
  }

}

void sub_21EDB7C44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithIDs", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDB7EA0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryUnreadMessages", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDB810C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithGUIDs", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EDB8378(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v5, OS_SIGNPOST_INTERVAL_END, v6, "queryMessagesWithRowIDs", (const char *)&unk_21EDC1733, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_21EDB85D8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (1)
    {
      v6 = 0;
LABEL_4:
      if (*(_QWORD *)v23 != v5)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v6);
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v17;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (!v10)
        break;
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "matchesPerson:withUnifiedContactIdentifiers:", v7, v8) & 1) != 0)break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
            goto LABEL_8;
          goto LABEL_18;
        }
      }

      if (++v6 != v4)
        goto LABEL_4;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v14 = 1;
      if (!v4)
        goto LABEL_20;
    }
LABEL_18:

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
LABEL_20:

  return v14;
}

uint64_t sub_21EDB8970(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v3, "matchesPerson:withUnifiedContactIdentifiers:", v9, v10);

        if ((v9 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id sub_21EDB9910(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "normalizedID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x2207BE180]() || IMStringIsEmail())
  {
    IMCanonicalizeFormattedString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!MEMORY[0x2207BE168](v3) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", (uint8_t *)&v8, 0xCu);
      }

    }
    v4 = v3;
  }
  v6 = v4;

  return v6;
}

id sub_21EDB9FC4(uint64_t a1, void *a2)
{
  return IMAssistantChatIdentifierFromConversationIdentifier(a2);
}

id sub_21EDBAC9C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  os_signpost_id_t spid;
  NSObject *log;
  id v65;
  void *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v74 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Filter block executed with %ld messages.", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v5);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "filterMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v69;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v69 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v10);
        _IMAssistantCoreSearchForMessageSignpostLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_signpost_id_generate(v12);

        _IMAssistantCoreSearchForMessageSignpostLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = v13 - 1;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "filterIndividualMessage", (const char *)&unk_21EDC1733, buf, 2u);
        }

        _IMAssistantCoreSearchForMessageSignpostLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_signpost_id_generate(v17);

        _IMAssistantCoreSearchForMessageSignpostLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = v18 - 1;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ED90000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "filterMessageScreentimeCheck", (const char *)&unk_21EDC1733, buf, 2u);
        }

        if ((objc_msgSend(v11, "allowedByScreenTime") & 1) != 0)
        {
          _IMAssistantCoreSearchForMessageSignpostLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ED90000, v23, OS_SIGNPOST_INTERVAL_END, v18, "filterMessageScreentimeCheck", (const char *)&unk_21EDC1733, buf, 2u);
          }

          if (*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "messageIsFromBlackholedChat:", v11))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v74 = (uint64_t)v11;
                _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Message filtered because it is from a blackholed chat: %@", buf, 0xCu);
              }

            }
            _IMAssistantCoreSearchForMessageSignpostLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
              goto LABEL_41;
          }
          else
          {
            v31 = *(void **)(a1 + 40);
            if (v31
              && (objc_msgSend(v11, "date"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  v33 = objc_msgSend(v31, "containsDate:", v32),
                  v32,
                  (v33 & 1) == 0))
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v74 = (uint64_t)v11;
                  _os_log_impl(&dword_21ED90000, v46, OS_LOG_TYPE_INFO, "Message filtered because it did not fall within the specified date interval: %@", buf, 0xCu);
                }

              }
              _IMAssistantCoreSearchForMessageSignpostLogHandle();
              v47 = objc_claimAutoreleasedReturnValue();
              v26 = v47;
              if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v47))
                goto LABEL_41;
            }
            else
            {
              if ((objc_msgSend(v11, "isRead") & 1) != 0)
                v34 = 1;
              else
                v34 = objc_msgSend(v11, "isOutgoing");
              if (*(_BYTE *)(a1 + 73) && v34)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v74 = (uint64_t)v11;
                    _os_log_impl(&dword_21ED90000, v35, OS_LOG_TYPE_INFO, "Message filtered due to not being an unread message: %@", buf, 0xCu);
                  }

                }
                _IMAssistantCoreSearchForMessageSignpostLogHandle();
                v36 = objc_claimAutoreleasedReturnValue();
                v26 = v36;
                if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
                  goto LABEL_41;
              }
              else
              {
                if (*(_BYTE *)(a1 + 74))
                  v37 = v34;
                else
                  v37 = 1;
                if ((v37 & 1) != 0)
                {
                  v38 = *(void **)(a1 + 48);
                  if (v38
                    && (objc_msgSend(v11, "body"),
                        v39 = (void *)objc_claimAutoreleasedReturnValue(),
                        v40 = objc_msgSend(v38, "evaluateWithObject:", v39),
                        v39,
                        (v40 & 1) == 0))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v50 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v74 = (uint64_t)v11;
                        _os_log_impl(&dword_21ED90000, v50, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the contents predicate: %@", buf, 0xCu);
                      }

                    }
                    _IMAssistantCoreSearchForMessageSignpostLogHandle();
                    v51 = objc_claimAutoreleasedReturnValue();
                    v26 = v51;
                    if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v51))
                      goto LABEL_41;
                  }
                  else
                  {
                    if (*(_QWORD *)(a1 + 56))
                    {
                      objc_msgSend(v11, "sender");
                      v26 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(a1 + 32), "chatParticipantForSPIHandle:", v26);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(*(id *)(a1 + 56), "evaluateWithObject:", v41) & 1) == 0)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          OSLogHandleForIMFoundationCategory();
                          v52 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            v74 = (uint64_t)v11;
                            _os_log_impl(&dword_21ED90000, v52, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the senders predicate: %@", buf, 0xCu);
                          }

                        }
                        _IMAssistantCoreSearchForMessageSignpostLogHandle();
                        v53 = objc_claimAutoreleasedReturnValue();
                        v54 = v53;
                        if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_21ED90000, v54, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_21EDC1733, buf, 2u);
                        }

                        goto LABEL_42;
                      }

                    }
                    if (*(_QWORD *)(a1 + 64))
                    {
                      v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                      objc_msgSend(v11, "recipients");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v66)
                        -[NSObject addObjectsFromArray:](v26, "addObjectsFromArray:", v66);
                      objc_msgSend(v11, "sender");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v42)
                        -[NSObject addObject:](v26, "addObject:", v42);
                      objc_msgSend(*(id *)(a1 + 32), "chatParticipantsForSPIHandles:", v26);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(*(id *)(a1 + 64), "evaluateWithObject:", v43) & 1) == 0)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          OSLogHandleForIMFoundationCategory();
                          log = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            v74 = (uint64_t)v11;
                            _os_log_impl(&dword_21ED90000, log, OS_LOG_TYPE_INFO, "Message filtered because it did not pass the recipients predicate: %@", buf, 0xCu);
                          }

                        }
                        _IMAssistantCoreSearchForMessageSignpostLogHandle();
                        v55 = objc_claimAutoreleasedReturnValue();
                        v56 = v55;
                        if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_21ED90000, v56, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_21EDC1733, buf, 2u);
                        }

                        goto LABEL_42;
                      }

                    }
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v44 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v74 = (uint64_t)v11;
                        _os_log_impl(&dword_21ED90000, v44, OS_LOG_TYPE_INFO, "Message passed filter: %@", buf, 0xCu);
                      }

                    }
                    objc_msgSend(v65, "addObject:", v11);
                    _IMAssistantCoreSearchForMessageSignpostLogHandle();
                    v45 = objc_claimAutoreleasedReturnValue();
                    v26 = v45;
                    if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v45))
                      goto LABEL_41;
                  }
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v48 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v74 = (uint64_t)v11;
                      _os_log_impl(&dword_21ED90000, v48, OS_LOG_TYPE_INFO, "Message filtered due to not being a read message: %@", buf, 0xCu);
                    }

                  }
                  _IMAssistantCoreSearchForMessageSignpostLogHandle();
                  v49 = objc_claimAutoreleasedReturnValue();
                  v26 = v49;
                  if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
                    goto LABEL_41;
                }
              }
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v74 = (uint64_t)v11;
              _os_log_impl(&dword_21ED90000, v27, OS_LOG_TYPE_INFO, "Message filtered because it did not pass downtime allowlist check: %@", buf, 0xCu);
            }

          }
          _IMAssistantCoreSearchForMessageSignpostLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ED90000, v29, OS_SIGNPOST_INTERVAL_END, v18, "filterMessageScreentimeCheck", (const char *)&unk_21EDC1733, buf, 2u);
          }

          _IMAssistantCoreSearchForMessageSignpostLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v26 = v30;
          if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
          {
LABEL_41:
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ED90000, v26, OS_SIGNPOST_INTERVAL_END, v13, "filterIndividualMessage", (const char *)&unk_21EDC1733, buf, 2u);
          }
        }
LABEL_42:

        ++v10;
      }
      while (v8 != v10);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      v8 = v57;
    }
    while (v57);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = objc_msgSend(v65, "count");
      *(_DWORD *)buf = 134217984;
      v74 = v59;
      _os_log_impl(&dword_21ED90000, v58, OS_LOG_TYPE_INFO, "Filter block completed with %ld messages.", buf, 0xCu);
    }

  }
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v61, OS_SIGNPOST_INTERVAL_END, spid, "filterMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v65;
}

void sub_21EDBBA00(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21EDBB958);
  }
  _Unwind_Resume(a1);
}

id sub_21EDBBA34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v19;
  os_signpost_id_t spid;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v19 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "convertMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134217984;
      v27 = v8;
      _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Conversion block executed with %ld messages.", buf, 0xCu);
    }

  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        +[IMAssistantINMessageConverter INMessagesForSPIMessage:personProvider:](IMAssistantINMessageConverter, "INMessagesForSPIMessage:personProvider:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), *(_QWORD *)(a1 + 32), v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v27 = (uint64_t)v14;
            _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Finished converting message: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v9, "addObjectsFromArray:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v19 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v17, OS_SIGNPOST_INTERVAL_END, spid, "convertMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v9;
}

void sub_21EDBBD5C(_QWORD *a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(a1[4] + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_21EDBC198(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21EDBC14CLL);
  }
  _Unwind_Resume(a1);
}

id sub_21EDBC1CC(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("x-apple-sms:guid=")))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("x-apple-sms:guid="), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_21EDBC268(void *a1)
{

  objc_end_catch();
}

void sub_21EDBC288(void *a1)
{

  objc_end_catch();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x24BE4F9B0]();
}

uint64_t IMCanonicalFormForEmail()
{
  return MEMORY[0x24BE500D8]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x24BE500E0]();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return MEMORY[0x24BE50BA8]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x24BE50100]();
}

uint64_t IMCopyGUIDForChat()
{
  return MEMORY[0x24BE50108]();
}

uint64_t IMCopyGUIDForChatOnAccount()
{
  return MEMORY[0x24BE50110]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x24BE50140]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x24BE50158]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x24BE50E48]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x24BE50198]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE501A0]();
}

uint64_t IMSPIQueryIMMessageItemsWithGUIDsAndQOS()
{
  return MEMORY[0x24BE501E8]();
}

uint64_t IMSPIQueryMessagesWithChatIdentifiersAndQOS()
{
  return MEMORY[0x24BE501F0]();
}

uint64_t IMSPIQueryMessagesWithGUIDsAndQOS()
{
  return MEMORY[0x24BE501F8]();
}

uint64_t IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS()
{
  return MEMORY[0x24BE50200]();
}

uint64_t IMSPIQueryMessagesWithRowIDsAndQOS()
{
  return MEMORY[0x24BE50208]();
}

uint64_t IMSPIQueryUnreadMessagesWithQOS()
{
  return MEMORY[0x24BE50210]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x24BE50228]();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return MEMORY[0x24BE51020]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x24BE51038]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x24BE51050]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x24BE50248]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x24BE50250]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x24BE50258]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x24BE50260]();
}

uint64_t IMUTTypeIsAudio()
{
  return MEMORY[0x24BE51148]();
}

uint64_t IMUTTypeIsCalendar()
{
  return MEMORY[0x24BE51150]();
}

uint64_t IMUTTypeIsImage()
{
  return MEMORY[0x24BE51158]();
}

uint64_t IMUTTypeIsMap()
{
  return MEMORY[0x24BE51160]();
}

uint64_t IMUTTypeIsMovie()
{
  return MEMORY[0x24BE51168]();
}

uint64_t IMUTTypeIsPass()
{
  return MEMORY[0x24BE51170]();
}

uint64_t IMUTTypeIsSupportedAnimatedImage()
{
  return MEMORY[0x24BE51178]();
}

uint64_t IMUTTypeIsVCard()
{
  return MEMORY[0x24BE51180]();
}

uint64_t IMUTTypeIsWatchface()
{
  return MEMORY[0x24BE51188]();
}

uint64_t IMUTTypeIsWorkout()
{
  return MEMORY[0x24BE51190]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50270]();
}

uint64_t INPersonHandleLabelEqualsCNLabeledValue()
{
  return MEMORY[0x24BDD99A0]();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return MEMORY[0x24BDD99A8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE503A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

