@implementation IMiMessageAppPayloadDecoder

+ (id)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 outAttachmentURLs:(id *)a6 error:(id *)a7
{
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFURL *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const __CFURL *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  CGImage *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  CGImageDestination *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v46;
  void *v47;
  id v49;
  void *v50;
  id v51;
  id obj;
  id v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[7];
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[8];
  uint8_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint8_t v80[128];
  uint8_t v81[4];
  const __CFURL *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v49 = a4;
  v51 = a5;
  v11 = IMOSLoggingEnabled();
  v50 = v10;
  if (v10 && v51 && a6 && a7)
  {
    if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Invoking Blastdoor for payload data", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    v75 = buf;
    v76 = 0x3032000000;
    v77 = sub_19E24761C;
    v78 = sub_19E2474F4;
    v79 = 0;
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = sub_19E24761C;
    v72 = sub_19E2474F4;
    v73 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_19E24761C;
    v66 = sub_19E2474F4;
    v67 = 0;
    v61 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 1, &v61);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v61;
    objc_msgSend(v13, "_FTOptionallyDecompressData");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v47, "length"))
    {
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = sub_19E2AB198;
      v60[3] = &unk_1E3FB7010;
      v60[4] = &v62;
      v60[5] = buf;
      v60[6] = &v68;
      +[IMAttachmentBlastdoor sendBalloonPluginPayloadData:senderContext:withBundleIdentifier:completionBlock:](IMAttachmentBlastdoor, "sendBalloonPluginPayloadData:senderContext:withBundleIdentifier:completionBlock:", v47, v49, v51, v60);
      v14 = (void *)*((_QWORD *)v75 + 5);
      if (v14 && !v63[5])
      {
        v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend((id)v69[5], "contents");
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
        if (v19)
        {
          v54 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v57 != v54)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringByAppendingPathExtension:", CFSTR("pluginPayloadAttachment"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "im_randomTemporaryFileURLWithFileName:", v23);
              v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "content");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "type");

              if (v27)
              {
                if (v27 == 1)
                {
                  objc_msgSend(v21, "content");
                  v28 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v28, "other");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "data");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  v55 = 0;
                  LOBYTE(v28) = objc_msgSend(v30, "writeToURL:options:error:", v25, 1, &v55);
                  v31 = (const __CFURL *)v55;
                  if ((v28 & 1) == 0 && IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v81 = 138412290;
                      v82 = v31;
                      _os_log_impl(&dword_19E239000, v32, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed writing attachment to disk on incoming: %@", v81, 0xCu);
                    }

                  }
                  objc_msgSend(v53, "addObject:", v25);

                }
                else
                {
                  v31 = 0;
                }
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v81 = 0;
                    _os_log_impl(&dword_19E239000, v33, OS_LOG_TYPE_INFO, "Writing image plugin payload attachment to disk.", v81, 2u);
                  }

                }
                objc_msgSend(v21, "content");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "astc");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "image");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (CGImage *)objc_msgSend(v36, "cgImage");

                objc_msgSend(v21, "content");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "astc");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "originalUTIType");
                v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v41 = CGImageDestinationCreateWithURL(v25, v40, 1uLL, 0);

                if (v41)
                {
                  CGImageDestinationAddImage(v41, v37, 0);
                  if (CGImageDestinationFinalize(v41))
                  {
                    v31 = 0;
                  }
                  else
                  {
                    v31 = (const __CFURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v43 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v81 = 138412290;
                        v82 = v31;
                        _os_log_impl(&dword_19E239000, v43, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed writing astc encoded image attachment to disk on incoming:%@", v81, 0xCu);
                      }

                    }
                  }
                  CFRelease(v41);
                }
                else
                {
                  v31 = (const __CFURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v81 = 138412290;
                      v82 = v25;
                      _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed to create CGImageDestination for %@", v81, 0xCu);
                    }

                  }
                }
                objc_msgSend(v53, "addObject:", v25);
              }

            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
          }
          while (v19);
        }

        v44 = objc_retainAutorelease(v53);
        *a6 = v44;

      }
      else
      {
        *((_QWORD *)v75 + 5) = 0;

        v15 = (void *)v63[5];
        if (v15)
          *a7 = objc_retainAutorelease(v15);
      }
      v17 = *((id *)v75 + 5);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v81 = 138412546;
          v82 = (const __CFURL *)v10;
          v83 = 2112;
          v84 = v46;
          _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Data loaded from sourceURL was nil: %@ with error: %@", v81, 0x16u);
        }

      }
      v17 = 0;
      *a7 = objc_retainAutorelease(v46);
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

@end
