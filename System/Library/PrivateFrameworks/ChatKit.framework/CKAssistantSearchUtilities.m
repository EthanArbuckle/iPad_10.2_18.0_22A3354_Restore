@implementation CKAssistantSearchUtilities

+ (__CFString)canonicalizeNumber:(__CFString *)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const void *v7;

  if (!a3)
    return 0;
  if (!CFStringHasPrefix(a3, CFSTR("+")))
  {
    v6 = a3;
    if (-[__CFString _appearsToBePhoneNumber](v6, "_appearsToBePhoneNumber"))
    {
      v7 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
      v5 = (__CFString *)IMNormalizedPhoneNumberForCFPhoneNumberRef();
      if (v7)
        CFRelease(v7);
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      -[__CFString _appearsToBeEmail](v6, "_appearsToBeEmail");
      v5 = (__CFString *)IMNormalizeFormattedString();
      if (!v5)
        goto LABEL_11;
    }
    CFRetain(v5);
LABEL_11:

    return v5;
  }
  v4 = (__CFString *)IMCanonicalizeFormattedString();
  v5 = v4;
  if (v4)
    CFRetain(v4);
  return v5;
}

+ (id)getAddressesFromPeople:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  __CFString *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  __int128 v46;
  id v47;
  uint64_t v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE buf[24];
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v3;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v51)
  {
    v48 = *(_QWORD *)v73;
    *(_QWORD *)&v5 = 138412802;
    v46 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v73 != v48)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v50 = v6;
        v8 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v6);
        objc_msgSend(v8, "internalGUID", v46);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isAddressBookLabel"))
        {
          objc_msgSend(v8, "label");
          v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v46;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2112;
            v81 = v10;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Trying to find address for person %@ with internalGUID %@ and desiredLabel %@", buf, 0x20u);
          }

        }
        if (v52)
        {
          objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fetchCNContactWithIdentifier:", v52);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v15 = CFSTR("YES");
              if (!v13)
                v15 = CFSTR("NO");
              *(_QWORD *)&buf[4] = v52;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v15;
              _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Found record for internalGUID %@: %@", buf, 0x16u);
            }

          }
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v53 = v13;
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
          if (v55)
          {
            v54 = *(_QWORD *)v69;
            do
            {
              for (i = 0; i != v55; ++i)
              {
                if (*(_QWORD *)v69 != v54)
                  objc_enumerationMutation(v53);
                v57 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                objc_msgSend(v57, "phoneNumbers");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v59, "count"))
                {
                  v66 = 0u;
                  v67 = 0u;
                  v64 = 0u;
                  v65 = 0u;
                  v16 = v59;
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
                  if (v17)
                  {
                    v18 = *(_QWORD *)v65;
                    do
                    {
                      for (j = 0; j != v17; ++j)
                      {
                        if (*(_QWORD *)v65 != v18)
                          objc_enumerationMutation(v16);
                        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                        objc_msgSend(v20, "value");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "stringValue");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v20, "label");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!objc_msgSend(v10, "length") || objc_msgSend(v10, "isEqualToString:", v23))
                        {
                          if (IMOSLoggingEnabled())
                          {
                            OSLogHandleForIMFoundationCategory();
                            v24 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(_QWORD *)&buf[4] = v22;
                              *(_WORD *)&buf[12] = 2112;
                              *(_QWORD *)&buf[14] = v23;
                              _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Found number %@ for label %@", buf, 0x16u);
                            }

                          }
                          if (v22)
                          {
                            v25 = +[CKAssistantSearchUtilities canonicalizeNumber:](CKAssistantSearchUtilities, "canonicalizeNumber:", v22);
                            if (v25)
                              objc_msgSend(v4, "addObject:", v25);

                          }
                        }

                      }
                      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
                    }
                    while (v17);
                  }

                }
                objc_msgSend(v57, "emailAddresses");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v58, "count"))
                {
                  v62 = 0u;
                  v63 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  v26 = v58;
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
                  if (v27)
                  {
                    v28 = *(_QWORD *)v61;
                    do
                    {
                      for (k = 0; k != v27; ++k)
                      {
                        if (*(_QWORD *)v61 != v28)
                          objc_enumerationMutation(v26);
                        v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
                        objc_msgSend(v30, "value");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "label");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!objc_msgSend(v10, "length") || objc_msgSend(v10, "isEqualToString:", v32))
                        {
                          if (IMOSLoggingEnabled())
                          {
                            OSLogHandleForIMFoundationCategory();
                            v33 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(_QWORD *)&buf[4] = v31;
                              *(_WORD *)&buf[12] = 2112;
                              *(_QWORD *)&buf[14] = v32;
                              _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Found email %@ for label %@", buf, 0x16u);
                            }

                          }
                          if (v31)
                          {
                            v34 = +[CKAssistantSearchUtilities canonicalizeNumber:](CKAssistantSearchUtilities, "canonicalizeNumber:", v31);
                            if (v34)
                              objc_msgSend(v4, "addObject:", v34);

                          }
                        }

                      }
                      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
                    }
                    while (v27);
                  }

                }
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
            }
            while (v55);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v81 = __Block_byref_object_copy__45;
          v82 = __Block_byref_object_dispose__45;
          v83 = 0;
          v35 = v4;
          IMDPersistencePerformBlock();
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_DWORD *)v76 = 138412546;
                v77 = v37;
                v78 = 2112;
                v79 = v38;
                _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_INFO, "Found %@ addresses for recipients, selecting most recent address %@", v76, 0x16u);

              }
            }
            objc_msgSend(v47, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          }
          else if (objc_msgSend(v35, "count"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "firstObject");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v76 = 138412546;
                v77 = v41;
                v78 = 2112;
                v79 = v42;
                _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, "Found %@ addresses for recipients, but no recent address, selecting first address %@", v76, 0x16u);

              }
            }
            objc_msgSend(v35, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v43);

          }
          objc_msgSend(v35, "removeAllObjects");

          _Block_object_dispose(buf, 8);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Internal guid of person was nil, could not find address for that person.", buf, 2u);
          }

        }
        v6 = v50 + 1;
      }
      while (v50 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v51);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v47;
      _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "getAddressesFromPeople returning addresses: %@", buf, 0xCu);
    }

  }
  return v47;
}

void __53__CKAssistantSearchUtilities_getAddressesFromPeople___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)IMDMessageRecordCopyMostRecentUseageOfAddresses();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
