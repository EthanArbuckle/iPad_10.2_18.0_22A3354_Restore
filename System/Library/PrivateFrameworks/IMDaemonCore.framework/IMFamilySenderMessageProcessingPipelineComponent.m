@implementation IMFamilySenderMessageProcessingPipelineComponent

- (id)_fromFamilyMember:(id)a3
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  void *obj;
  void *v76;
  _QWORD v77[5];
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint8_t v104[128];
  __int128 buf;
  Class (*v106)(uint64_t);
  void *v107;
  uint64_t *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v71 = objc_alloc_init(MEMORY[0x1E0D35A10]);
  v97 = 0;
  v98 = &v97;
  v99 = 0x2050000000;
  v3 = (void *)qword_1EFC63D68;
  v100 = qword_1EFC63D68;
  if (!qword_1EFC63D68)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v106 = sub_1D14C22E8;
    v107 = &unk_1E922B000;
    v108 = &v97;
    sub_1D14C22E8((uint64_t)&buf);
    v3 = (void *)v98[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v97, 8);
  v74 = objc_alloc_init(v4);
  objc_msgSend(v74, "setCachePolicy:", 1);
  v96 = 0;
  objc_msgSend(v74, "fetchFamilyCircleWithError:", &v96);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v96;
  v70 = v5;
  if (v73)
  {
    objc_msgSend(v72, "fromIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_stripFZIDPrefix");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend(v73, "members");
    obj = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v67)
    {
      v7 = *(_QWORD *)v93;
      v66 = *(_QWORD *)v93;
      while (2)
      {
        for (i = 0; i != v67; ++i)
        {
          if (*(_QWORD *)v93 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          objc_msgSend(v9, "appleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            if ((objc_msgSend(v9, "isMe") & 1) == 0)
            {
              objc_msgSend(v9, "appleID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "addObject:", v12);

            }
            objc_msgSend(v9, "appleID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v76, "isEqualToString:", v13);

            if (v14)
            {
              if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v64 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v9, "appleID");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v65;
                  _os_log_impl(&dword_1D1413000, v64, OS_LOG_TYPE_INFO, "Apple ID matches Family member %@", (uint8_t *)&buf, 0xCu);

                }
              }
LABEL_83:

              if (IMOSLoggingEnabled(v55))
              {
                OSLogHandleForIMFoundationCategory();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v72, "fromIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v57;
                  _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "Found family member relation using raw handles! %@", (uint8_t *)&buf, 0xCu);

                }
              }
              objc_msgSend(v71, "fullfillWithValue:", v72);
              goto LABEL_98;
            }
          }
          objc_msgSend(v9, "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("member-appleID-aliases"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if ((objc_msgSend(v9, "isMe") & 1) == 0)
              objc_msgSend(v69, "addObjectsFromArray:", v17);
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v89;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v89 != v20)
                    objc_enumerationMutation(v18);
                  v22 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
                  v23 = objc_msgSend(v76, "isEqualToString:", v22);
                  if ((_DWORD)v23)
                  {
                    if (IMOSLoggingEnabled(v23))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v53 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(buf) = 138412290;
                        *(_QWORD *)((char *)&buf + 4) = v22;
                        _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Alias matches Family member %@", (uint8_t *)&buf, 0xCu);
                      }

                    }
                    goto LABEL_83;
                  }
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
                if (v19)
                  continue;
                break;
              }
            }

          }
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v76);
          if (v24)
          {
            objc_msgSend(v9, "memberPhoneNumbers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(","));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v9, "isMe") & 1) == 0)
              objc_msgSend(v69, "addObjectsFromArray:", v26);
            v86 = 0u;
            v87 = 0u;
            v85 = 0u;
            v84 = 0u;
            v27 = v26;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            if (v28)
            {
              v29 = *(_QWORD *)v85;
              while (2)
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v85 != v29)
                    objc_enumerationMutation(v27);
                  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v24, "isLikePhoneNumber:", v31);
                  if ((_DWORD)v32)
                  {
                    if (IMOSLoggingEnabled(v32))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v54 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(buf) = 138412290;
                        *(_QWORD *)((char *)&buf + 4) = v24;
                        _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_INFO, "Phone number matches Family member %@", (uint8_t *)&buf, 0xCu);
                      }

                    }
                    goto LABEL_83;
                  }

                }
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
                if (v28)
                  continue;
                break;
              }
            }

          }
          v7 = v66;
        }
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
        v7 = v66;
        if (v67)
          continue;
        break;
      }
    }

    -[IMFamilySenderMessageProcessingPipelineComponent idsTrustedData](self, "idsTrustedData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "senderCorrelationIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 == 0;

    if (v35)
    {
      IMLogHandleForCategory();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_1D1668CA0(v72);

      -[IMFamilySenderMessageProcessingPipelineComponent _generateError:](self, "_generateError:", CFSTR("IDS data had no sender correlation identifier"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "failWithError:", v59);

    }
    else
    {
      if (IMOSLoggingEnabled(v36))
      {
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Didn't find family member relation using raw handles. Attempting to lookup using SCIs.", (uint8_t *)&buf, 2u);
        }

      }
      v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v39 = v69;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v81;
        do
        {
          for (m = 0; m != v40; ++m)
          {
            if (*(_QWORD *)v81 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * m);
            if (objc_msgSend(v43, "length"))
            {
              v44 = (void *)IDSCopyBestGuessIDForID();
              if (v44)
              {
                objc_msgSend(v38, "addObject:", v44);
              }
              else if (IMOSLoggingEnabled(0))
              {
                OSLogHandleForIMFoundationCategory();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v43;
                  _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "handle could not be normalized for IDS lookup: %@", (uint8_t *)&buf, 0xCu);
                }

              }
            }
            else if (IMOSLoggingEnabled(0))
            {
              OSLogHandleForIMFoundationCategory();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Skipping normalization of empty handle in allFamilyMemberHandles", (uint8_t *)&buf, 2u);
              }

            }
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
        }
        while (v40);
      }

      if (IMOSLoggingEnabled(v47))
      {
        OSLogHandleForIMFoundationCategory();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v38;
          _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "normalizedFamilyMemberHandles: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      if (objc_msgSend(v38, "count"))
      {
        v49 = (void *)MEMORY[0x1E0D39880];
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = sub_1D14C195C;
        v77[3] = &unk_1E922B3E8;
        v77[4] = self;
        v78 = v71;
        v79 = v72;
        objc_msgSend(v49, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v38, CFSTR("com.apple.madrid"), CFSTR("IMFamilySenderMessageProcessingPipelineComponent"), MEMORY[0x1E0C80D38], v77);

      }
      else
      {
        IMLogHandleForCategory();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          sub_1D1668D1C(v72);

        -[IMFamilySenderMessageProcessingPipelineComponent _generateError:](self, "_generateError:", CFSTR("Family IDS handles were empty"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "failWithError:", v61);

      }
    }
LABEL_98:

  }
  else
  {
    v50 = v5 == 0;
    IMLogHandleForCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (v50)
    {
      if (v52)
        sub_1D1668BF0(v51);

      -[IMFamilySenderMessageProcessingPipelineComponent _generateError:](self, "_generateError:", CFSTR("Unknown FamilyCircle fetch error"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "failWithError:", v76);
    }
    else
    {
      if (v52)
        sub_1D1668C30();

      -[IMFamilySenderMessageProcessingPipelineComponent _generateError:](self, "_generateError:", CFSTR("FamilyCircle fetch failed with specific error"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "failWithError:", v76);
    }
  }

  v62 = v71;
  return v62;
}

- (id)_generateError:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99D80];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E0CB2938], 0);

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 21, v6);

  return v8;
}

- (IMFamilySenderMessageProcessingPipelineComponent)initWithAccount:(id)a3 idsTrustedData:(id)a4
{
  id v7;
  id v8;
  IMFamilySenderMessageProcessingPipelineComponent *v9;
  IMFamilySenderMessageProcessingPipelineComponent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFamilySenderMessageProcessingPipelineComponent;
  v9 = -[IMFamilySenderMessageProcessingPipelineComponent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_idsTrustedData, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  _QWORD v31[5];

  v31[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D374F8];
  v31[0] = *MEMORY[0x1E0D374F0];
  v31[1] = v4;
  v31[2] = *MEMORY[0x1E0D374C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "<IMFamilySenderMessageProcessingPipelineComponent> Started processing", buf, 2u);
    }

  }
  v7 = objc_msgSend(v3, "isFromMe");
  if ((_DWORD)v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "fromIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Message is a message from me: %@", buf, 0xCu);

      }
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);
  }
  else
  {
    v11 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EFC8D600);
    if ((_DWORD)v11)
    {
      v12 = v3;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v5;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = 0;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            if ((v15 & 1) != 0)
            {
              v15 = 1;
            }
            else
            {
              objc_msgSend(v12, "balloonPluginBundleID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              IMBalloonExtensionIDWithSuffix();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v18, "isEqualToString:", v19);

            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v14);

        if ((v15 & 1) != 0)
        {
          -[IMFamilySenderMessageProcessingPipelineComponent _fromFamilyMember:](self, "_fromFamilyMember:", v12);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
      }
      else
      {

      }
    }
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message is not family extension", buf, 2u);
      }

    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);
  }
LABEL_30:
  v21 = (void *)v10;

  return v21;
}

- (IMDAccount)account
{
  return self->_account;
}

- (IMDiMessageIDSTrustedData)idsTrustedData
{
  return self->_idsTrustedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
