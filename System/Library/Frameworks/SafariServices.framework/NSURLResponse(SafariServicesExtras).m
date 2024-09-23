@implementation NSURLResponse(SafariServicesExtras)

- (uint64_t)sf_hasXMLAttachment
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (!objc_msgSend(a1, "safari_hasAttachment"))
    return 0;
  objc_msgSend(a1, "MIMEType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", CFSTR("application/xml")) & 1) != 0
    || (objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", CFSTR("text/xml")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "suggestedFilename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_lastPathComponentWithoutZipExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", CFSTR("xml"));

  }
  return v3;
}

- (uint64_t)sf_shouldDownloadDueToContentDisposition:()SafariServicesExtras
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "sf_hasXMLAttachment") & 1) == 0)
  {
    if (!objc_msgSend(a1, "safari_hasAttachment"))
      return 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((a3 & 1) != 0 || !objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D4F448]))
    {
      v13 = objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0D4F438]);
      v14 = WBS_LOG_CHANNEL_PREFIXDownloads();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (!v13)
      {
        if (v15)
        {
          v16 = v14;
          objc_msgSend(a1, "URL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "MIMEType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138740227;
          v21 = v17;
          v22 = 2117;
          v23 = v18;
          _os_log_impl(&dword_1A3B2D000, v16, OS_LOG_TYPE_INFO, "Ignoring Content-Disposition header for %{sensitive}@, MIME Type: %{sensitive}@", (uint8_t *)&v20, 0x16u);

        }
        v5 = 0;
        goto LABEL_17;
      }
      if (!v15)
      {
        v5 = 1;
        goto LABEL_17;
      }
      v9 = v14;
      objc_msgSend(a1, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "MIMEType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138740227;
      v21 = v10;
      v22 = 2117;
      v23 = v11;
      v12 = "Starting download due to Content-Disposition header for %{sensitive}@, MIME Type: %{sensitive}@";
      v5 = 1;
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      v5 = 1;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        return v5;
      }
      v9 = v8;
      objc_msgSend(a1, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "MIMEType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138740227;
      v21 = v10;
      v22 = 2117;
      v23 = v11;
      v12 = "Starting download due to Content-Disposition header in subframe for %{sensitive}@, MIME Type: %{sensitive}@";
    }
    _os_log_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, 0x16u);

    goto LABEL_17;
  }
  return 1;
}

- (uint64_t)_sf_allowedToOverrideContentDispositionAttachment
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a1, "MIMEType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("application/x-webarchive")) & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v2, "safari_stringByTrimmingWhitespace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("/"));
  if (!v5 || (v6 = v5, v5 == 0x7FFFFFFFFFFFFFFFLL) || v5 == objc_msgSend(v4, "length") - 1)
  {
LABEL_6:

    v3 = objc_msgSend(a1, "sf_hasXMLAttachment") ^ 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "substringToIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", v6 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(";"));
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "substringToIndex:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v4 = v9;
  if ((!objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", CFSTR("text"))
     || (objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", CFSTR("html")) & 1) == 0)
    && (objc_msgSend(v4, "safari_hasCaseInsensitiveSuffix:", CFSTR("+xml")) & 1) == 0
    && (!objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", CFSTR("xml"))
     || (objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", CFSTR("application")) & 1) == 0
     && !objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", CFSTR("text"))))
  {

    goto LABEL_6;
  }

LABEL_2:
  v3 = 0;
LABEL_7:

  return v3;
}

- (BOOL)_sf_hasAttachmentWithFilename
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "safari_hasAttachment"))
    return 0;
  objc_msgSend(a1, "allHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", CFSTR("Content-Disposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(";"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("="));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = v10;
            objc_msgSend(v9, "substringToIndex:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "safari_stringByTrimmingWhitespace");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v13, "safari_isCaseInsensitiveEqualToString:", CFSTR("filename")) & 1) != 0)
            {
              objc_msgSend(v9, "substringFromIndex:", v11 + 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "safari_stringByTrimmingWhitespace");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v15) = objc_msgSend(v16, "hasPrefix:", CFSTR("\"));
              v17 = objc_msgSend(v16, "length");
              if ((_DWORD)v15)
                v14 = v17 > 2;
              else
                v14 = v17 != 0;

              goto LABEL_21;
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          continue;
        break;
      }
      v14 = 0;
    }
    else
    {
      v14 = 0;
    }
LABEL_21:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
