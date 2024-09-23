@implementation IMTranscoder_Image

- (BOOL)_isWideGamutImage:(CGImageSource *)a3
{
  int IsColorOptimizedForSharing;
  char v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    IsColorOptimizedForSharing = CGImageSourceIsColorOptimizedForSharing();
    v4 = IsColorOptimizedForSharing ^ 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("YES");
        if (IsColorOptimizedForSharing)
          v6 = CFSTR("NO");
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_21DFB1000, v5, OS_LOG_TYPE_INFO, "_isWideGamut %@ ", (uint8_t *)&v9, 0xCu);
      }

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
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21DFB1000, v7, OS_LOG_TYPE_INFO, "Transcoding _isWideGamut nil sourceRef", (uint8_t *)&v9, 2u);
      }

    }
    return 0;
  }
  return v4;
}

- (BOOL)_isHEIFImageFormat:(__CFString *)a3
{
  return UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x24BE51360]) != 0;
}

- (BOOL)_isWebPImageFormat:(__CFString *)a3
{
  return UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x24BE51368]) != 0;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  const __CFURL *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  int64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const __CFDictionary *v46;
  NSObject *v47;
  const __CFString *v48;
  NSObject *v49;
  CFStringRef Type;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char isHighQualityPhotosEnabled;
  NSObject *v71;
  NSObject *v72;
  CFStringRef v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const __CFDictionary *v84;
  NSObject *v86;
  int v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  int v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  NSObject *v138;
  id v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  int v146;
  int v147;
  NSObject *v148;
  const __CFString *v149;
  const __CFDictionary *v150;
  CGImageSource *isrc;
  CGImageSourceRef isrca;
  id v153;
  uint8_t buf[4];
  id v155;
  __int16 v156;
  CGImageSourceRef v157;
  uint64_t v158;
  _QWORD v159[2];

  v159[1] = *MEMORY[0x24BDAC8D0];
  v15 = (const __CFURL *)a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v23 = a9;
  if (!v15)
  {
    v29 = 0;
    goto LABEL_90;
  }
  if (!objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v19, (uint64_t)v16, *MEMORY[0x24BE50DC8], v20, v21, v22))
  {
    if (objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v24, (uint64_t)v16, *MEMORY[0x24BE50DC0], v25, v26, v27))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v34, OS_LOG_TYPE_INFO, "This is a genmoji, skip transcoding", buf, 2u);
        }
LABEL_19:

        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v35 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v30, (uint64_t)v16, (uint64_t)CFSTR("isSticker"), v31, v32, v33);
    if (a5 != 1 && v35)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v34, OS_LOG_TYPE_INFO, "This is a sticker, skip transcoding", buf, 2u);
        }
        goto LABEL_19;
      }
LABEL_20:
      v29 = 1;
      goto LABEL_90;
    }
    v40 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v36, (uint64_t)v16, (uint64_t)CFSTR("preserveHEIF"), v37, v38, v39);
    if (a5)
      v41 = 0;
    else
      v41 = v40;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v155 = v15;
        _os_log_impl(&dword_21DFB1000, v45, OS_LOG_TYPE_INFO, "Creating CGImageSource from url: %@", buf, 0xCu);
      }

    }
    if (v17)
    {
      v158 = *MEMORY[0x24BDD9810];
      v159[0] = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v159, (uint64_t)&v158, 1, v43, v44);
      v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    v150 = v46;
    isrc = CGImageSourceCreateWithURL(v15, v46);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = CFSTR("good");
        if (!isrc)
          v48 = CFSTR("NULL");
        *(_DWORD *)buf = 138412290;
        v155 = (id)v48;
        _os_log_impl(&dword_21DFB1000, v47, OS_LOG_TYPE_INFO, "Source ref is %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v155 = v15;
        _os_log_impl(&dword_21DFB1000, v49, OS_LOG_TYPE_INFO, "Checking uti from source ref at url: %@", buf, 0xCu);
      }

    }
    Type = CGImageSourceGetType(isrc);
    if (objc_msgSend__isHEIFImageFormat_(self, v51, (uint64_t)Type, v52, v53, v54, v55))
    {
      if ((v41 & 1) == 0)
      {
        if (isrc)
          CFRelease(isrc);
        if (!IMOSLoggingEnabled())
          goto LABEL_87;
        OSLogHandleForIMFoundationCategory();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "Needs transcode, the image was HEIF but preserveHEIF was NO", buf, 2u);
        }
        goto LABEL_86;
      }
      if (IMImageSourceHasStereoPair())
      {
        if (isrc)
          CFRelease(isrc);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v62, OS_LOG_TYPE_INFO, "Image is HEIF standard-compliant, recipients prefer it, and it has a stereo pair. Not transcoding", buf, 2u);
          }

        }
        v29 = 1;
        goto LABEL_88;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v71, OS_LOG_TYPE_INFO, "Image is HEIF standard-compliant. Proceeding with other checks", buf, 2u);
        }
LABEL_66:

      }
    }
    else
    {
      if (v41)
      {
        objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v56, v57, v58, v59, v60, v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        isHighQualityPhotosEnabled = objc_msgSend_isHighQualityPhotosEnabled(v63, v64, v65, v66, v67, v68, v69);

        if ((isHighQualityPhotosEnabled & 1) == 0)
        {
          if (isrc)
            CFRelease(isrc);
          if (!IMOSLoggingEnabled())
            goto LABEL_87;
          OSLogHandleForIMFoundationCategory();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v155 = v17;
            _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "Needs transcode as all recipients support heif (source uti %@)", buf, 0xCu);
          }
          goto LABEL_86;
        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v71, OS_LOG_TYPE_INFO, "Image is not HEIF-standard compliant. Proceeding with other checks", buf, 2u);
        }
        goto LABEL_66;
      }
    }
    v73 = CGImageSourceGetType(isrc);
    if (objc_msgSend__isWebPImageFormat_(self, v74, (uint64_t)v73, v75, v76, v77, v78))
    {
      if (isrc)
        CFRelease(isrc);
      if (!IMOSLoggingEnabled())
        goto LABEL_87;
      OSLogHandleForIMFoundationCategory();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "Needs transcode as WebP is not supported", buf, 2u);
      }
      goto LABEL_86;
    }
    if (objc_msgSend__isWideGamutImage_(self, v79, (uint64_t)isrc, v80, v81, v82, v83))
    {
      if (isrc)
        CFRelease(isrc);
      if (!IMOSLoggingEnabled())
        goto LABEL_87;
      OSLogHandleForIMFoundationCategory();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "Needs transcode as image is wide-gamut", buf, 2u);
      }
      goto LABEL_86;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v86, OS_LOG_TYPE_INFO, "Not wide gamut image. Proceeding with other checks", buf, 2u);
      }

    }
    if (isrc)
      CFRelease(isrc);
    v87 = IMOSLoggingEnabled();
    if (v17)
    {
      if (v87)
      {
        OSLogHandleForIMFoundationCategory();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v155 = v17;
          _os_log_impl(&dword_21DFB1000, v88, OS_LOG_TYPE_INFO, "shouldTranscodeTransfer with uti: %@ ?", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v89, OS_LOG_TYPE_INFO, "Trying to discriminate based on type alone:", buf, 2u);
        }

      }
      v90 = (void *)objc_opt_class();
      objc_msgSend_supportedUTIs(v90, v91, v92, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend_containsObject_(v97, v98, (uint64_t)v17, v99, v100, v101, v102);

      if ((v103 & 1) != 0)
      {
        if (objc_msgSend_isEqualToIgnoringCase_(v17, v104, (uint64_t)CFSTR("________WBMP_________"), v105, v106, v107, v108))
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_87;
          OSLogHandleForIMFoundationCategory();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "This appears to be a WBMP, this requires a transcode", buf, 2u);
          }
        }
        else
        {
          v110 = IMOSLoggingEnabled();
          if (a5 != 1)
          {
            if (v110)
            {
              OSLogHandleForIMFoundationCategory();
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v117, OS_LOG_TYPE_INFO, "That wasn't enough, let's look at filesize too:", buf, 2u);
              }

            }
            objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v111, v112, v113, v114, v115, v116);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_path(v15, v119, v120, v121, v122, v123, v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = 0;
            objc_msgSend_attributesOfItemAtPath_error_(v118, v126, (uint64_t)v125, (uint64_t)&v153, v127, v128, v129);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            isrca = (CGImageSourceRef)v153;
            v137 = objc_msgSend_fileSize(v130, v131, v132, v133, v134, v135, v136);

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v138 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v155 = v15;
                v156 = 2112;
                v157 = isrca;
                _os_log_impl(&dword_21DFB1000, v138, OS_LOG_TYPE_INFO, "Checked size of file %@ with error %@", buf, 0x16u);
              }

            }
            v139 = v18;
            v145 = v139;
            if (v139)
              LODWORD(v139) = objc_msgSend_containsObject_(v139, v140, (uint64_t)v17, v141, v142, v143, v144);
            if (isrca)
              v146 = 0;
            else
              v146 = (int)v139;
            if (v137 < a8)
              v147 = v146;
            else
              v147 = 0;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v148 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
              {
                v149 = CFSTR("NO");
                if (v147)
                  v149 = CFSTR("YES");
                *(_DWORD *)buf = 138412290;
                v155 = (id)v149;
                _os_log_impl(&dword_21DFB1000, v148, OS_LOG_TYPE_INFO, "Is the original sendable without transcode? %@", buf, 0xCu);
              }

            }
            if (v147)
              v29 = 1;
            else
              v29 = 2;

            goto LABEL_88;
          }
          v84 = v150;
          if (!v110)
          {
            v29 = 2;
            goto LABEL_89;
          }
          OSLogHandleForIMFoundationCategory();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v72, OS_LOG_TYPE_INFO, "This is MMS, we should always transcode", buf, 2u);
          }
        }
LABEL_86:

LABEL_87:
        v29 = 2;
LABEL_88:
        v84 = v150;
LABEL_89:

        goto LABEL_90;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v109, OS_LOG_TYPE_INFO, "Uti is not contained in supportedUTIs", buf, 2u);
        }
LABEL_119:

      }
    }
    else if (v87)
    {
      OSLogHandleForIMFoundationCategory();
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v109, OS_LOG_TYPE_INFO, "No UTI supplied", buf, 2u);
      }
      goto LABEL_119;
    }
    v29 = 0;
    goto LABEL_88;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFB1000, v28, OS_LOG_TYPE_INFO, "Genmoji heic needs fallback to png", buf, 2u);
    }

  }
  v29 = 2;
LABEL_90:

  return v29;
}

- (id)copyImagePropertiesFrom:(CGImageSource *)a3 frameCount:(unint64_t)a4 withProps:(id)a5 inFormat:(__CFString *)a6 outFormat:(__CFString *)a7
{
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  void **v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CFDictionaryRef v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFDictionaryRef v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id *v44;
  id *v45;
  id *v46;
  id *v47;
  id *v48;
  CFMutableDictionaryRef v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  CFMutableDictionaryRef Mutable;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v77;
  id v78;
  __CFString *inUTIa;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (const __CFString *)*MEMORY[0x24BDC1820];
  v81 = v10;
  if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x24BDC1820]))
  {
    v12 = (id)*MEMORY[0x24BDD96B0];
    v82 = (id)*MEMORY[0x24BDD9290];
    v13 = (id)*MEMORY[0x24BDD9280];
    v14 = (id)*MEMORY[0x24BDD9298];
    v15 = (void **)MEMORY[0x24BDD9288];
LABEL_5:
    v16 = *v15;
    v17 = v16;
    goto LABEL_6;
  }
  if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x24BE51358]))
  {
    v12 = (id)*MEMORY[0x24BDD9608];
    v82 = (id)*MEMORY[0x24BDD9618];
    v13 = (id)*MEMORY[0x24BDD9600];
    v14 = (id)*MEMORY[0x24BDD9620];
    v15 = (void **)MEMORY[0x24BDD9610];
    goto LABEL_5;
  }
  if (!UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x24BE51360]))
  {
    if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x24BDC1780]))
    {
      v12 = (id)*MEMORY[0x24BDD9598];
      v82 = (id)*MEMORY[0x24BDD95B0];
      v13 = (id)*MEMORY[0x24BDD9590];
      v14 = (id)*MEMORY[0x24BDD95B8];
      v15 = (void **)MEMORY[0x24BDD95A0];
    }
    else
    {
      if (!UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x24BE51368]))
      {
        v26 = 0;
        v12 = 0;
        v82 = 0;
        v83 = 0;
        v84 = 0;
        v17 = 0;
        goto LABEL_11;
      }
      v12 = (id)*MEMORY[0x24BDD9740];
      v82 = (id)*MEMORY[0x24BDD9750];
      v13 = (id)*MEMORY[0x24BDD9738];
      v14 = (id)*MEMORY[0x24BDD9758];
      v15 = (void **)MEMORY[0x24BDD9748];
    }
    goto LABEL_5;
  }
  v82 = 0;
  v13 = 0;
  v14 = 0;
  v17 = 0;
  v16 = (void *)*MEMORY[0x24BDD9628];
  v12 = (id)*MEMORY[0x24BDD9628];
LABEL_6:
  v83 = v13;
  v84 = v14;
  v18 = v16;
  if (!v12)
  {
    v26 = 0;
    goto LABEL_11;
  }
  objc_msgSend_objectForKey_(v10, v19, (uint64_t)v12, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
LABEL_11:
    v27 = 0;
    v28 = 0;
    v86 = 0;
    goto LABEL_12;
  }
  if (v82)
  {
    objc_msgSend_objectForKey_(v25, v19, (uint64_t)v82, v21, v22, v23, v24);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
  }
  if (v13)
  {
    objc_msgSend_objectForKey_(v26, v19, (uint64_t)v13, v21, v22, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v20 = (uint64_t)v84;
  if (v84)
  {
    objc_msgSend_objectForKey_(v26, v19, (uint64_t)v84, v21, v22, v23, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_12;
LABEL_21:
    objc_msgSend_objectForKey_(v26, v19, (uint64_t)v17, v21, v22, v23, v24);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v28 = 0;
  if (v17)
    goto LABEL_21;
LABEL_12:
  v85 = 0;
LABEL_22:
  if (a4 < 2)
    goto LABEL_40;
  if (!v27 || !v28)
  {
    v29 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    v35 = v29;
    if (v29)
    {
      objc_msgSend_objectForKey_(v29, v30, (uint64_t)v12, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v36;
      if (v36)
      {
        if (!v27)
        {
          objc_msgSend_objectForKey_(v36, v37, (uint64_t)v83, v38, v39, v40, v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!v28)
        {
          objc_msgSend_objectForKey_(v42, v37, (uint64_t)v84, v38, v39, v40, v41);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

    }
  }
  if (!objc_msgSend_count(v26, v19, v20, v21, v22, v23, v24))
  {
LABEL_40:
    v49 = 0;
    goto LABEL_84;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v88 = v27;
      v89 = 2112;
      v90 = v28;
      v91 = 2112;
      v92 = v86;
      v93 = 2112;
      v94 = v85;
      _os_log_impl(&dword_21DFB1000, v43, OS_LOG_TYPE_INFO, "Found delay %@ unclampedDelay %@ loopCount %@ FrameInfo %@. copying to destination", buf, 0x2Au);
    }

  }
  if (UTTypeConformsTo(a7, v11))
  {
    v44 = (id *)MEMORY[0x24BDD9288];
    v45 = (id *)MEMORY[0x24BDD9298];
    v46 = (id *)MEMORY[0x24BDD9280];
    v47 = (id *)MEMORY[0x24BDD9290];
    v48 = (id *)MEMORY[0x24BDD96B0];
  }
  else if (UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x24BE51358]))
  {
    v44 = (id *)MEMORY[0x24BDD9610];
    v45 = (id *)MEMORY[0x24BDD9620];
    v46 = (id *)MEMORY[0x24BDD9600];
    v47 = (id *)MEMORY[0x24BDD9618];
    v48 = (id *)MEMORY[0x24BDD9608];
  }
  else if (UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x24BDC1780]))
  {
    v44 = (id *)MEMORY[0x24BDD95A0];
    v45 = (id *)MEMORY[0x24BDD95B8];
    v46 = (id *)MEMORY[0x24BDD9590];
    v47 = (id *)MEMORY[0x24BDD95B0];
    v48 = (id *)MEMORY[0x24BDD9598];
  }
  else
  {
    if (!UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x24BE51368]))
    {
      v77 = 0;
      v78 = 0;
      inUTIa = 0;
      v57 = 0;
      v65 = 0;
      Mutable = 0;
      v71 = objc_msgSend_count(0, v50, v51, v52, v53, v54, v55);
      goto LABEL_80;
    }
    v44 = (id *)MEMORY[0x24BDD9748];
    v45 = (id *)MEMORY[0x24BDD9758];
    v46 = (id *)MEMORY[0x24BDD9738];
    v47 = (id *)MEMORY[0x24BDD9750];
    v48 = (id *)MEMORY[0x24BDD9740];
  }
  v78 = *v48;
  v56 = *v47;
  inUTIa = (__CFString *)*v46;
  v57 = *v45;
  v58 = *v44;
  v65 = v58;
  v77 = v56;
  if (!v86 || !v56)
  {
    if (!v27 || !inUTIa)
    {
      if (!v28 || !v57)
      {
        Mutable = 0;
        if (!v85 || !v58)
          goto LABEL_79;
LABEL_77:
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        goto LABEL_78;
      }
      goto LABEL_69;
    }
    goto LABEL_61;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  objc_msgSend_setObject_forKey_(Mutable, v67, (uint64_t)v86, (uint64_t)v56, v68, v69, v70);
  if (v27 && inUTIa)
  {
    if (Mutable)
    {
LABEL_62:
      objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v27, (uint64_t)inUTIa, v62, v63, v64);
      goto LABEL_63;
    }
LABEL_61:
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    goto LABEL_62;
  }
LABEL_63:
  if (v28 && v57)
  {
    if (Mutable)
    {
LABEL_70:
      objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v28, (uint64_t)v57, v62, v63, v64);
      goto LABEL_71;
    }
LABEL_69:
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    goto LABEL_70;
  }
LABEL_71:
  if (!v85 || !v65)
    goto LABEL_79;
  if (!Mutable)
    goto LABEL_77;
LABEL_78:
  objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v85, (uint64_t)v65, v62, v63, v64);
LABEL_79:
  v71 = objc_msgSend_count(Mutable, v59, v60, v61, v62, v63, v64);
LABEL_80:
  if (v71)
  {
    v49 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    objc_msgSend_setObject_forKey_(v49, v72, (uint64_t)Mutable, (uint64_t)v78, v73, v74, v75);
  }
  else
  {
    v49 = 0;
  }

LABEL_84:
  return v49;
}

- (id)copyFramePropertiesFrom:(CGImageSource *)a3 index:(unint64_t)a4 inFormat:(__CFString *)a5 outFormat:(__CFString *)a6
{
  CFDictionaryRef v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef *v18;
  CFStringRef *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __CFDictionary *Mutable;
  id v55;
  __CFDictionary *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __CFDictionary *v64;
  NSObject *v65;
  __CFDictionary *v66;
  id v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  __CFDictionary *v76;
  id v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  int v87;
  unint64_t v88;
  __int16 v89;
  CFDictionaryRef v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v9 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v87 = 134218242;
      v88 = a4;
      v89 = 2112;
      v90 = v9;
      _os_log_impl(&dword_21DFB1000, v10, OS_LOG_TYPE_INFO, "Got image properties for image at index %zu: %@", (uint8_t *)&v87, 0x16u);
    }

  }
  v11 = (const __CFString *)*MEMORY[0x24BDC1820];
  v12 = UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x24BDC1820]);
  v18 = (CFStringRef *)MEMORY[0x24BE51358];
  v19 = (CFStringRef *)MEMORY[0x24BE51368];
  if (v12)
  {
    objc_msgSend_objectForKey_(v9, v13, *MEMORY[0x24BDD96B0], v14, v15, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v87 = 138412290;
        v88 = (unint64_t)v20;
        _os_log_impl(&dword_21DFB1000, v26, OS_LOG_TYPE_INFO, "Checking for PNG Properties: %@", (uint8_t *)&v87, 0xCu);
      }

    }
    v27 = (uint64_t *)MEMORY[0x24BDD9298];
    v28 = (uint64_t *)MEMORY[0x24BDD9280];
LABEL_29:
    objc_msgSend_objectForKey_(v20, v21, *v28, v22, v23, v24, v25);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v20, v48, *v27, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x24BE51358]))
  {
    objc_msgSend_objectForKey_(v9, v29, *MEMORY[0x24BDD9608], v30, v31, v32, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v87 = 138412290;
        v88 = (unint64_t)v20;
        _os_log_impl(&dword_21DFB1000, v34, OS_LOG_TYPE_INFO, "Checking for HEICS Properties: %@", (uint8_t *)&v87, 0xCu);
      }

    }
    v27 = (uint64_t *)MEMORY[0x24BDD9620];
    v28 = (uint64_t *)MEMORY[0x24BDD9600];
    goto LABEL_29;
  }
  if (UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x24BDC1780]))
  {
    objc_msgSend_objectForKey_(v9, v35, *MEMORY[0x24BDD9598], v36, v37, v38, v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v87 = 138412290;
        v88 = (unint64_t)v20;
        _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "Checking for GIF Properties: %@", (uint8_t *)&v87, 0xCu);
      }

    }
    v27 = (uint64_t *)MEMORY[0x24BDD95B8];
    v28 = (uint64_t *)MEMORY[0x24BDD9590];
    goto LABEL_29;
  }
  if (UTTypeConformsTo(a5, *v19))
  {
    objc_msgSend_objectForKey_(v9, v41, *MEMORY[0x24BDD9740], v42, v43, v44, v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v87 = 138412290;
        v88 = (unint64_t)v20;
        _os_log_impl(&dword_21DFB1000, v46, OS_LOG_TYPE_INFO, "Checking for WebP Properties: %@", (uint8_t *)&v87, 0xCu);
      }

    }
    v27 = (uint64_t *)MEMORY[0x24BDD9758];
    v28 = (uint64_t *)MEMORY[0x24BDD9738];
    goto LABEL_29;
  }
  v47 = 0;
  v53 = 0;
  v20 = 0;
LABEL_30:
  if (UTTypeConformsTo(a6, v11))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v55 = v47;
    if (v55)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD9280], v55);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF6AC();
    }

    v57 = v53;
    if (v57)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD9298], v57);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF62C();
    }

    if (objc_msgSend_count(Mutable, v58, v59, v60, v61, v62, v63))
    {
      v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v64 = Mutable;
      if (v64)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x24BDD96B0], v64);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sub_21DFCF5AC();
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          LOWORD(v87) = 0;
          _os_log_impl(&dword_21DFB1000, v65, OS_LOG_TYPE_INFO, "No png property dictionary to add", (uint8_t *)&v87, 2u);
        }

      }
      v56 = 0;
    }

  }
  else
  {
    v56 = 0;
  }
  if (UTTypeConformsTo(a6, *v18))
  {
    v66 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v67 = v47;
    if (v67)
    {
      CFDictionarySetValue(v66, (const void *)*MEMORY[0x24BDD9600], v67);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF52C();
    }

    v68 = v53;
    if (v68)
    {
      CFDictionarySetValue(v66, (const void *)*MEMORY[0x24BDD9620], v68);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF4AC();
    }

    if (objc_msgSend_count(v66, v69, v70, v71, v72, v73, v74))
    {
      if (!v56)
        v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v75 = v66;
      if (v75)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x24BDD9608], v75);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sub_21DFCF42C();
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_73:

        goto LABEL_74;
      }
      OSLogHandleForIMFoundationCategory();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        LOWORD(v87) = 0;
        _os_log_impl(&dword_21DFB1000, v75, OS_LOG_TYPE_INFO, "No HEICS property dictionary to add", (uint8_t *)&v87, 2u);
      }
    }

    goto LABEL_73;
  }
LABEL_74:
  if (UTTypeConformsTo(a6, *v19))
  {
    v76 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v77 = v47;
    if (v77)
    {
      CFDictionarySetValue(v76, (const void *)*MEMORY[0x24BDD9738], v77);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF3AC();
    }

    v78 = v53;
    if (v78)
    {
      CFDictionarySetValue(v76, (const void *)*MEMORY[0x24BDD9758], v78);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21DFCF32C();
    }

    if (objc_msgSend_count(v76, v79, v80, v81, v82, v83, v84))
    {
      if (!v56)
        v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v85 = v76;
      if (v85)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x24BDD9740], v85);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sub_21DFCF2AC();
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_95:

        goto LABEL_96;
      }
      OSLogHandleForIMFoundationCategory();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        LOWORD(v87) = 0;
        _os_log_impl(&dword_21DFB1000, v85, OS_LOG_TYPE_INFO, "No WebP property dictionary to add", (uint8_t *)&v87, 2u);
      }
    }

    goto LABEL_95;
  }
LABEL_96:

  return v56;
}

+ (id)findOrientationFromProperties:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDD9698];
  objc_msgSend_objectForKey_(v3, v5, *MEMORY[0x24BDD9698], v6, v7, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v15;
        _os_log_impl(&dword_21DFB1000, v16, OS_LOG_TYPE_INFO, "Orientation data found in default location: %@", (uint8_t *)&v24, 0xCu);
      }
LABEL_9:

    }
  }
  else
  {
    objc_msgSend_objectForKey_(v3, v10, *MEMORY[0x24BDD96E8], v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v17, v18, v4, v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v15;
        _os_log_impl(&dword_21DFB1000, v16, OS_LOG_TYPE_INFO, "Orientation data NOT found in default location, checked TIFF location: %@", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_9;
    }
  }

  return v15;
}

+ (unint64_t)findLargerDimensionFromImage:(CGImageSource *)a3 withProperties:(id)a4 toWidth:(id *)a5 toHeight:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  CFDictionaryRef v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFDictionaryRef v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  unint64_t v58;
  uint8_t v60[16];

  v9 = a4;
  v15 = v9;
  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_21DFB1000, v57, OS_LOG_TYPE_INFO, "Couldn't find props for image to find source height and width", v60, 2u);
      }

    }
    v17 = 0;
    v31 = 0;
    goto LABEL_30;
  }
  v16 = *MEMORY[0x24BDD96C8];
  objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x24BDD96C8], v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD96C0];
  objc_msgSend_objectForKey_(v15, v19, *MEMORY[0x24BDD96C0], v20, v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v24;
  if (v17)
    v32 = v24 == 0;
  else
    v32 = 1;
  if (v32 && CGImageSourceGetCount(a3))
  {
    v33 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    v39 = v33;
    if (v33)
    {
      objc_msgSend_objectForKey_(v33, v34, v16, v35, v36, v37, v38);
      v40 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKey_(v39, v41, v18, v42, v43, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v46;
      v17 = (void *)v40;
    }

  }
  if (a5 && v17)
    *a5 = objc_retainAutorelease(v17);
  if (a6 && v31)
    *a6 = objc_retainAutorelease(v31);
  if (v17)
    v47 = v31 == 0;
  else
    v47 = 1;
  if (v47)
  {
LABEL_30:
    v49 = 0;
    v56 = objc_msgSend_unsignedIntegerValue(0, v25, v26, v27, v28, v29, v30);
    goto LABEL_31;
  }
  if (objc_msgSend_compare_(v17, v25, (uint64_t)v31, v27, v28, v29, v30) >= 0)
    v48 = v17;
  else
    v48 = v31;
  v49 = v48;
  v56 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52, v53, v54, v55);
LABEL_31:
  v58 = v56;

  return v58;
}

- (id)_newGeneratedImage:(CGImageSource *)a3 sourceWidth:(id)a4 sourceHeight:(id)a5 sourceLength:(unint64_t)a6 sourceProps:(id)a7 target:(int64_t)a8 hardwareEncoder:(id)a9 inFormat:(__CFString *)a10 fromFormat:(__CFString *)a11 withMaxLength:(unint64_t)a12 withMaxCount:(unint64_t)a13 withCompressionQuality:(double)a14 enforceMaxes:(BOOL)a15 subsampling:(int)a16 shouldSkipAuxillaryData:(BOOL)a17
{
  id v22;
  void *v23;
  size_t v24;
  NSObject *v25;
  __CFData *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  NSObject *v46;
  int isWideGamutImage;
  CFStringRef Type;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int isHEIFImageFormat;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  const __CFString *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  NSObject *v76;
  NSObject *v77;
  const char *v78;
  __int128 v79;
  const __CFDictionary *v80;
  NSObject *v81;
  size_t v82;
  _BOOL4 v84;
  float v85;
  void *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  CGImageRef ImageAtIndex;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  CGImage *ThumbnailAtIndex;
  NSObject *v152;
  NSObject *v153;
  CGImage *v154;
  int v155;
  NSObject *v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  CFMutableDictionaryRef Mutable;
  double v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  id v170;
  CFDictionaryRef v171;
  NSObject *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  const char *v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  NSObject *v207;
  id v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  NSObject *v219;
  NSObject *v220;
  int v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  NSObject *v225;
  NSObject *v226;
  NSObject *v227;
  _BOOL4 v228;
  NSObject *v229;
  const __CFString *v230;
  __CFData *v231;
  NSObject *v232;
  __int128 v233;
  uint64_t v234;
  __CFData *data;
  const __CFString *v236;
  void *key;
  uint64_t v238;
  void *v239;
  _BOOL4 v240;
  const __CFString *inConformsToUTI;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  CGImageDestination *idst;
  uint64_t v246;
  CFDictionaryRef v247;
  void *v248;
  size_t count;
  id v250;
  id v251;
  id v252;
  id v255;
  uint8_t buf[4];
  _BYTE v257[10];
  const char *v258;
  __int16 v259;
  unint64_t v260;
  __int16 v261;
  size_t v262;
  uint64_t v263;

  v263 = *MEMORY[0x24BDAC8D0];
  v251 = a4;
  v250 = a5;
  v252 = a7;
  v22 = a9;
  v23 = v22;
  if (a3)
  {
    v248 = v22;
    if (!a10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v27, OS_LOG_TYPE_INFO, "Cannot generate image because format is NULL", buf, 2u);
        }

      }
      v26 = 0;
      goto LABEL_31;
    }
    v24 = CGImageSourceGetCount(a3);
    if (v24)
      v247 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    else
      v247 = 0;
    if (!v251 || !v250)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v29, OS_LOG_TYPE_INFO, "No source width and height", buf, 2u);
        }

      }
      goto LABEL_29;
    }
    if (a12 > a6 && a15 && v24 < a13)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218752;
          *(_QWORD *)v257 = a12;
          *(_WORD *)&v257[8] = 2048;
          v258 = (const char *)a13;
          v259 = 2048;
          v260 = a6;
          v261 = 2048;
          v262 = v24;
          _os_log_impl(&dword_21DFB1000, v28, OS_LOG_TYPE_INFO, "Not considering resizing to %lu or reducing to %zd images, it's larger than the current image dimension (%zd) and the current image count (%zd)", buf, 0x2Au);
        }

      }
LABEL_29:
      v26 = 0;
LABEL_30:

LABEL_31:
      v23 = v248;
      goto LABEL_32;
    }
    if (v24 >= a13)
      v31 = a13;
    else
      v31 = v24;
    count = v31;
    if (a12 >= a6)
      v32 = a6;
    else
      v32 = a12;
    v246 = v32;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = count;
        _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "    Image count = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = v24;
        _os_log_impl(&dword_21DFB1000, v34, OS_LOG_TYPE_INFO, " Original count = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = a13;
        _os_log_impl(&dword_21DFB1000, v35, OS_LOG_TYPE_INFO, "      Max count = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = v246;
        _os_log_impl(&dword_21DFB1000, v36, OS_LOG_TYPE_INFO, "         Length = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = a12;
        _os_log_impl(&dword_21DFB1000, v37, OS_LOG_TYPE_INFO, "     Max length = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v257 = a6;
        _os_log_impl(&dword_21DFB1000, v38, OS_LOG_TYPE_INFO, "Original Length = %lu", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v257 = a16;
        _os_log_impl(&dword_21DFB1000, v39, OS_LOG_TYPE_INFO, "    subsampling = %d", buf, 8u);
      }

    }
    v45 = (double)(unint64_t)v246 / (double)a6;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v257 = v45;
        _os_log_impl(&dword_21DFB1000, v46, OS_LOG_TYPE_INFO, "   scale factor = %f", buf, 0xCu);
      }

    }
    isWideGamutImage = objc_msgSend__isWideGamutImage_(self, v40, (uint64_t)a3, v41, v42, v43, v44);
    Type = CGImageSourceGetType(a3);
    isHEIFImageFormat = objc_msgSend__isHEIFImageFormat_(self, v49, (uint64_t)Type, v50, v51, v52, v53);
    if (v248)
      v61 = isWideGamutImage;
    else
      v61 = 1;
    if (((v61 | isHEIFImageFormat) & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = CFSTR("NO");
          if (isWideGamutImage)
            v63 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v257 = v248;
          *(_WORD *)&v257[8] = 2112;
          v258 = (const char *)v63;
          _os_log_impl(&dword_21DFB1000, v62, OS_LOG_TYPE_INFO, "Not using hardware encoding. encoder %@  isWideGamut %@", buf, 0x16u);
        }

      }
    }
    else
    {
      objc_msgSend_setTargetJPEGCompressionValue_(v248, v55, v56, v57, v58, v59, v60, a14);
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v64, v246, v65, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v255 = 0;
      v74 = objc_msgSend_scaleImageToFitLargestDimension_outputData_(v248, v70, (uint64_t)v69, (uint64_t)&v255, v71, v72, v73);
      v26 = (__CFData *)v255;

      v75 = IMOSLoggingEnabled();
      if (v74)
      {
        if (v75)
        {
          OSLogHandleForIMFoundationCategory();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v76, OS_LOG_TYPE_INFO, "Successfully used hardware encoding", buf, 2u);
          }

        }
        goto LABEL_30;
      }
      if (v75)
      {
        OSLogHandleForIMFoundationCategory();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v77, OS_LOG_TYPE_INFO, "Failed using hardware encoding", buf, 2u);
        }

      }
    }
    data = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    idst = CGImageDestinationCreateWithData(data, a10, count, 0);
    if (idst)
    {
      if (v252)
      {
        v80 = (const __CFDictionary *)objc_msgSend_copyImagePropertiesFrom_frameCount_withProps_inFormat_outFormat_(self, v78, (uint64_t)a3, v24, (uint64_t)v252, (uint64_t)a11, (uint64_t)a10);
        if (v80)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v257 = v80;
              _os_log_impl(&dword_21DFB1000, v81, OS_LOG_TYPE_INFO, "Setting output props: %@", buf, 0xCu);
            }

          }
          CGImageDestinationSetProperties(idst, v80);
        }

      }
      if (count)
      {
        v82 = 0;
        v84 = a8 != 1 && v247 != 0;
        v240 = v84;
        v238 = *MEMORY[0x24BDD97F8];
        v244 = *MEMORY[0x24BDD9778];
        v243 = *MEMORY[0x24BDD9808];
        inConformsToUTI = (const __CFString *)*MEMORY[0x24BDC17C0];
        v242 = *MEMORY[0x24BDD9788];
        v236 = (const __CFString *)*MEMORY[0x24BE51360];
        v85 = a14;
        key = (void *)*MEMORY[0x24BDD9220];
        v234 = *MEMORY[0x24BDD9698];
        v239 = (void *)*MEMORY[0x24BDD9238];
        *(_QWORD *)&v79 = 134218242;
        v233 = v79;
        do
        {
          v86 = (void *)MEMORY[0x2207A8200]();
          v87 = objc_alloc(MEMORY[0x24BDBCED8]);
          v93 = (void *)objc_msgSend_initWithCapacity_(v87, v88, 4, v89, v90, v91, v92);
          v99 = v93;
          if (a16 == -1)
          {
            objc_msgSend_setObject_forKey_(v93, v94, MEMORY[0x24BDBD1C8], v244, v96, v97, v98);
            objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v131, v246, v132, v133, v134, v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v99, v137, (uint64_t)v136, v243, v138, v139, v140);

            objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v141, a8 == 1, v142, v143, v144, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v99, v147, (uint64_t)v146, v242, v148, v149, v150);

            ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v152 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v257 = ThumbnailAtIndex;
                _os_log_impl(&dword_21DFB1000, v152, OS_LOG_TYPE_INFO, "Used thumbnail path %@", buf, 0xCu);
              }

            }
          }
          else
          {
            objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v94, a16, v95, v96, v97, v98);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v99, v101, (uint64_t)v100, v238, v102, v103, v104);

            objc_msgSend_setObject_forKey_(v99, v105, MEMORY[0x24BDBD1C8], v244, v106, v107, v108);
            objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v109, v246, v110, v111, v112, v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v99, v115, (uint64_t)v114, v243, v116, v117, v118);

            objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v119, a8 == 1, v120, v121, v122, v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v99, v125, (uint64_t)v124, v242, v126, v127, v128);

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v129 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v257 = a16;
                *(_WORD *)&v257[4] = 1024;
                *(_DWORD *)&v257[6] = v82;
                _os_log_impl(&dword_21DFB1000, v129, OS_LOG_TYPE_INFO, "Using subsamping with: %d  (index: %d)", buf, 0xEu);
              }

            }
            if (count == 1)
            {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, v82, (CFDictionaryRef)v99);
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v153 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v233;
                  *(_QWORD *)v257 = v82;
                  *(_WORD *)&v257[8] = 2112;
                  v258 = (const char *)a3;
                  _os_log_impl(&dword_21DFB1000, v153, OS_LOG_TYPE_INFO, "Getting thumbnail at index %zu from %@", buf, 0x16u);
                }

              }
              ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            }
            v154 = ImageAtIndex;
            if (a8 != 1)
              goto LABEL_136;
            ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            v155 = IMOSLoggingEnabled();
            if (!ThumbnailAtIndex)
            {
              if (v155)
              {
                OSLogHandleForIMFoundationCategory();
                v157 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v157, OS_LOG_TYPE_INFO, "Failed to create a a rotated image for MMS", buf, 2u);
                }

              }
LABEL_136:
              ThumbnailAtIndex = v154;
              goto LABEL_137;
            }
            if (v155)
            {
              OSLogHandleForIMFoundationCategory();
              v156 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v257 = ThumbnailAtIndex;
                _os_log_impl(&dword_21DFB1000, v156, OS_LOG_TYPE_INFO, "Created a rotated image for MMS: %@", buf, 0xCu);
              }

            }
            if (v154)
              CFRelease(v154);
          }
LABEL_137:
          if (!UTTypeConformsTo(a10, inConformsToUTI) && !UTTypeConformsTo(a10, v236))
          {
            v205 = (void *)objc_msgSend_copyFramePropertiesFrom_index_inFormat_outFormat_(self, v158, (uint64_t)a3, v82, (uint64_t)a11, (uint64_t)a10, v159);
            if (!v205)
              goto LABEL_174;
LABEL_171:
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
LABEL_172:
            objc_msgSend_addEntriesFromDictionary_(Mutable, v200, (uint64_t)v205, v201, v202, v203, v204, v233);
            goto LABEL_173;
          }
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          *(float *)&v161 = v85;
          objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v162, v163, v164, v165, v166, v167, v161);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          if (v168)
          {
            CFDictionarySetValue(Mutable, key, v168);
          }
          else
          {
            v169 = MEMORY[0x24BDACB70];
            v170 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v257 = key;
              *(_WORD *)&v257[8] = 2080;
              v258 = "properties";
              _os_log_error_impl(&dword_21DFB1000, v169, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
            }

          }
          v171 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v172 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v257 = v171;
              _os_log_impl(&dword_21DFB1000, v172, OS_LOG_TYPE_INFO, "Checking for properties: %@", buf, 0xCu);
            }

          }
          if (v171)
          {
            if (a8 == 1)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v179 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v179, OS_LOG_TYPE_INFO, " ...this is MMS, we don't want orientation appended, it's all pre-rotated", buf, 2u);
                }

              }
              if (objc_msgSend_count(v252, v173, v174, v175, v176, v177, v178, v233))
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v185 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21DFB1000, v185, OS_LOG_TYPE_INFO, " ... * Adding original properties to the set", buf, 2u);
                  }

                }
                objc_msgSend_addEntriesFromDictionary_(Mutable, v180, (uint64_t)v252, v181, v182, v183, v184);
              }
            }
            else
            {
              v186 = (void *)objc_opt_class();
              objc_msgSend_findOrientationFromProperties_(v186, v187, (uint64_t)v171, v188, v189, v190, v191);
              v192 = (char *)objc_claimAutoreleasedReturnValue();
              if (v192)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v197 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v257 = v234;
                    *(_WORD *)&v257[8] = 2112;
                    v258 = v192;
                    _os_log_impl(&dword_21DFB1000, v197, OS_LOG_TYPE_INFO, "Setting the image orientation (key=%@) to (%@)", buf, 0x16u);
                  }

                }
                objc_msgSend_setValue_forKey_(Mutable, v193, (uint64_t)v192, v234, v194, v195, v196, v233);
              }

            }
          }

          v205 = (void *)objc_msgSend_copyFramePropertiesFrom_index_inFormat_outFormat_(self, v198, (uint64_t)a3, v82, (uint64_t)a11, (uint64_t)a10, v199);
          if (v205)
          {
            if (!Mutable)
              goto LABEL_171;
            goto LABEL_172;
          }
LABEL_173:
          if (!Mutable)
LABEL_174:
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v200, 1, v201, v202, v203, v204, v233);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          if (v206)
          {
            CFDictionarySetValue(Mutable, v239, v206);
          }
          else
          {
            v207 = MEMORY[0x24BDACB70];
            v208 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v257 = v239;
              *(_WORD *)&v257[8] = 2080;
              v258 = "properties";
              _os_log_error_impl(&dword_21DFB1000, v207, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
            }

          }
          if (v240)
            objc_msgSend_addEntriesFromDictionary_(Mutable, v209, (uint64_t)v247, v210, v211, v212, v213);
          if ((objc_msgSend__isHEIFImageFormat_(self, v209, (uint64_t)a10, v210, v211, v212, v213) & 1) == 0)
            objc_msgSend__setWideGamutProperties_scaledImage_(self, v214, (uint64_t)Mutable, (uint64_t)ThumbnailAtIndex, v215, v216, v217);
          v218 = IMOSLoggingEnabled();
          if (ThumbnailAtIndex)
          {
            if (v218)
            {
              OSLogHandleForIMFoundationCategory();
              v219 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)v257 = v82;
                _os_log_impl(&dword_21DFB1000, v219, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
              }

            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v220 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v257 = Mutable;
                _os_log_impl(&dword_21DFB1000, v220, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
              }

            }
            CGImageDestinationAddImage(idst, ThumbnailAtIndex, Mutable);
            v221 = IMOSLoggingEnabled();
            if (a17)
            {
              if (v221)
              {
                OSLogHandleForIMFoundationCategory();
                v225 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v225, OS_LOG_TYPE_INFO, "Skipping Aux data addition for new quality estimator based transcoding for LQM", buf, 2u);
                }

              }
            }
            else
            {
              if (v221)
              {
                OSLogHandleForIMFoundationCategory();
                v227 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v227, OS_LOG_TYPE_INFO, "Adding Aux data", buf, 2u);
                }

              }
              objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v222, (uint64_t)a3, (uint64_t)idst, v82, v223, v224, v45);
            }
            CGImageRelease(ThumbnailAtIndex);
          }
          else if (v218)
          {
            OSLogHandleForIMFoundationCategory();
            v226 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v257 = v82;
              _os_log_impl(&dword_21DFB1000, v226, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v86);
          ++v82;
        }
        while (count != v82);
      }
      v228 = CGImageDestinationFinalize(idst);
      if ((IMOSLoggingEnabled() & 1) != 0)
      {
        OSLogHandleForIMFoundationCategory();
        v229 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
        {
          v230 = CFSTR("NO");
          if (v228)
            v230 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v257 = v230;
          _os_log_impl(&dword_21DFB1000, v229, OS_LOG_TYPE_INFO, "Success finalizing image: %@", buf, 0xCu);
        }

      }
      if (!v228)
      {

        data = 0;
      }
      CFRelease(idst);
      v231 = data;
      v26 = v231;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v232 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v232, OS_LOG_TYPE_INFO, "Cannot generate image because imageDestination is NULL", buf, 2u);
        }

      }
      v26 = 0;
      v231 = data;
    }

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFB1000, v25, OS_LOG_TYPE_INFO, "Cannot generate image because source is NULL", buf, 2u);
    }

  }
  v26 = 0;
LABEL_32:

  return v26;
}

- (void)_setWideGamutProperties:(id)a3 scaledImage:(CGImage *)a4
{
  id v5;
  NSObject *v6;
  size_t Width;
  size_t Height;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  v5 = a3;
  if (a4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_21DFB1000, v6, OS_LOG_TYPE_INFO, "Adding backward compatible color profile for non-heif-destination wide-gamut image", v23, 2u);
      }

    }
    Width = CGImageGetWidth(a4);
    Height = CGImageGetHeight(a4);
    if (Width <= Height)
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v9, Height, v10, v11, v12, v13);
    else
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v9, Width, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, *MEMORY[0x24BDD9218], v16, v17, v18);

    objc_msgSend_setObject_forKey_(v5, v19, MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD9238], v20, v21, v22);
  }

}

- (id)_checkAndSaveImageData:(id)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 actualSize:(unint64_t *)a7 usedLengthIndex:(int *)a8 currentIndex:(int)a9
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  int v34;
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v23 = objc_msgSend_length(v15, v17, v18, v19, v20, v21, v22);
  v24 = IMOSLoggingEnabled();
  if (!v15 || !v23)
  {
    if (v24)
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_21DFB1000, v32, OS_LOG_TYPE_INFO, "No image generated for this iteration, we got no image data.", (uint8_t *)&v34, 2u);
      }

    }
    goto LABEL_25;
  }
  if (v24)
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v34 = 67109376;
      v35[0] = v23;
      LOWORD(v35[1]) = 1024;
      *(_DWORD *)((char *)&v35[1] + 2) = a6;
      _os_log_impl(&dword_21DFB1000, v25, OS_LOG_TYPE_INFO, "Successfully generated image! Comparing data length (%d) to maxByteSize (%d)", (uint8_t *)&v34, 0xEu);
    }

  }
  if (a7)
    *a7 = v23;
  if (v23 > a6)
  {
LABEL_25:
    v30 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_21DFB1000, v29, OS_LOG_TYPE_INFO, "This image is a keeper, writing it out to url!", (uint8_t *)&v34, 2u);
    }

  }
  objc_msgSend__writeImageData_inFormat_sourceURL_(self, v26, (uint64_t)v15, (uint64_t)a5, (uint64_t)v16, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        *(_QWORD *)v35 = v30;
        _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "Saving %@ and breaking out of transcode loop", (uint8_t *)&v34, 0xCu);
      }

    }
    if (a8)
      *a8 = a9;
  }
LABEL_26:

  return v30;
}

- (void)copyAuxiliaryImagesFromImageSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 fromImageAtIndex:(unint64_t)a5 scaleFactor:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[5];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_auxiliaryImagesToPreserveForDerivativesFromImageSource_imageIndex_(MEMORY[0x24BE723F0], a2, (uint64_t)a3, a5, a5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v11, v12, v13, v14, v15, v16, v17);
  if (v11)
    v23 = v18 == 0;
  else
    v23 = 1;
  if (!v23)
  {
    v24 = v18;
    objc_msgSend_transformAuxiliaryImages_scaleFactor_applyingOrientation_(MEMORY[0x24BE723F0], v19, (uint64_t)v11, 1, v20, v21, v22, a6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219266;
        v34 = v24;
        v35 = 2048;
        v36 = a5;
        v37 = 2048;
        v38 = a6;
        v39 = 1024;
        v40 = 1;
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v25;
        _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "Copying %zd aux images (index %zd scaleFactor %f orientation %d) from input %@, to output %@", buf, 0x3Au);
      }

    }
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_21DFBC4D8;
    v32[3] = &unk_24E1FF7D0;
    v32[4] = a4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v25, v26, (uint64_t)v32, v27, v28, v29, v30);

  }
}

- (id)_writeImageData:(id)a3 inFormat:(__CFString *)a4 sourceURL:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __CFString *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  int v69;
  __CFString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (v7)
  {
    if (a4)
    {
      v9 = (__CFString *)UTTypeCopyPreferredTagWithClass(a4, (CFStringRef)*MEMORY[0x24BDC1658]);
      v10 = IMOSLoggingEnabled();
      if (!v9)
      {
        if (v10)
        {
          OSLogHandleForIMFoundationCategory();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            LOWORD(v69) = 0;
            _os_log_impl(&dword_21DFB1000, v66, OS_LOG_TYPE_INFO, "Nil file extension, aborting writing of image", (uint8_t *)&v69, 2u);
          }

        }
        v58 = 0;
        goto LABEL_37;
      }
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v69 = 138412290;
          v70 = v9;
          _os_log_impl(&dword_21DFB1000, v17, OS_LOG_TYPE_INFO, "Using file extension: %@", (uint8_t *)&v69, 0xCu);
        }

      }
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v11, v12, v13, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v8, v19, v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByDeletingPathExtension(v25, v26, v27, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathExtension_(v32, v33, (uint64_t)v9, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_im_randomTemporaryFileURLWithFileName_(v18, v39, (uint64_t)v38, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v44, v45, v46, v47, v48, v49, v50);
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v69 = 138412290;
          v70 = v51;
          _os_log_impl(&dword_21DFB1000, v57, OS_LOG_TYPE_INFO, "creating destination with output path: %@", (uint8_t *)&v69, 0xCu);
        }

      }
      if (v51)
      {
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v52, (uint64_t)v51, v53, v54, v55, v56);
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          v59 = (void *)MEMORY[0x2207A8200]();
          v64 = objc_msgSend_writeToURL_atomically_(v7, v60, (uint64_t)v58, 1, v61, v62, v63);
          objc_autoreleasePoolPop(v59);
          if ((v64 & 1) != 0)
          {
LABEL_36:

LABEL_37:
            goto LABEL_38;
          }
        }
      }
      else
      {
        v58 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v69 = 138412290;
          v70 = v58;
          _os_log_impl(&dword_21DFB1000, v67, OS_LOG_TYPE_INFO, "Writing to url %@ failed", (uint8_t *)&v69, 0xCu);
        }

      }
      v58 = 0;
      goto LABEL_36;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        LOWORD(v69) = 0;
        _os_log_impl(&dword_21DFB1000, v65, OS_LOG_TYPE_INFO, "Cannot write out image because format is NULL", (uint8_t *)&v69, 2u);
      }
LABEL_23:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      LOWORD(v69) = 0;
      _os_log_impl(&dword_21DFB1000, v65, OS_LOG_TYPE_INFO, "Cannot write out image because data is nil", (uint8_t *)&v69, 2u);
    }
    goto LABEL_23;
  }
  v58 = 0;
LABEL_38:

  return v58;
}

- (id)_writeImage:(CGImageSource *)a3 sourceURL:(id)a4 target:(int64_t)a5 hardwareEncoder:(id)a6 inFormat:(__CFString *)a7 fromFormat:(__CFString *)a8 withMaxByteSize:(unint64_t)a9 maxDimension:(unint64_t)a10 actualSize:(unint64_t *)a11 startingLengthIndex:(int)a12 usedLengthIndex:(int *)a13 estimator:(id)a14 isLQMEnabled:(BOOL)a15 telemetry:(id)a16
{
  NSObject *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  char v40;
  double v41;
  NSObject *v42;
  void *v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  float v53;
  char v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int isLQMImageQualityEstimatorEnabled;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  unint64_t v83;
  BOOL v84;
  BOOL v85;
  BOOL v86;
  NSObject *v87;
  int v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  float *v97;
  float v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  double v138;
  NSObject *v139;
  const char *v140;
  NSObject *v141;
  unint64_t v142;
  NSObject *shouldSkipAuxillaryData;
  unint64_t v144;
  NSObject *v145;
  const char *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  _BOOL4 v174;
  uint64_t v175;
  NSObject *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  _BOOL4 v198;
  NSObject *v199;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unsigned __int8 v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  NSObject *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const __CFString *inConformsToUTI;
  const __CFString *v236;
  void *context;
  void *v238;
  id v239;
  size_t Count;
  id v242;
  id v243;
  CFDictionaryRef v244;
  int v245;
  id v246;
  id v247;
  CGImageSource *v249;
  unint64_t LargerDimensionFromImage_withProperties_toWidth_toHeight;
  id v251;
  __CFString *v252;
  id v253;
  id v254;
  uint8_t buf[4];
  double v256;
  __int16 v257;
  _BYTE v258[24];
  __int16 v259;
  id v260;
  uint64_t v261;

  v261 = *MEMORY[0x24BDAC8D0];
  v247 = a4;
  v246 = a6;
  v251 = a14;
  v239 = a16;
  v249 = a3;
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v42, OS_LOG_TYPE_INFO, "Invalid image source given to writeImage!", buf, 2u);
      }
      goto LABEL_32;
    }
LABEL_33:
    v43 = 0;
    goto LABEL_152;
  }
  if (*(double *)&a7 == 0.0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v42, OS_LOG_TYPE_INFO, "Invalid destination format provided to writeImage", buf, 2u);
      }
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  v252 = a7;
  Count = CGImageSourceGetCount(a3);
  *(double *)&v244 = COERCE_DOUBLE(CGImageSourceCopyProperties(a3, 0));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v256 = *(double *)&v244;
      _os_log_impl(&dword_21DFB1000, v20, OS_LOG_TYPE_INFO, "Original image properties: %@", buf, 0xCu);
    }

  }
  v21 = (void *)objc_opt_class();
  v253 = 0;
  v254 = 0;
  LargerDimensionFromImage_withProperties_toWidth_toHeight = objc_msgSend_findLargerDimensionFromImage_withProperties_toWidth_toHeight_(v21, v22, (uint64_t)a3, (uint64_t)v244, (uint64_t)&v254, (uint64_t)&v253, v23);
  v242 = v254;
  v243 = v253;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v256 = *(double *)&a7;
      v257 = 1024;
      *(_DWORD *)v258 = a9;
      *(_WORD *)&v258[4] = 2048;
      *(_QWORD *)&v258[6] = a10;
      *(_WORD *)&v258[14] = 2112;
      *(_QWORD *)&v258[16] = v242;
      v259 = 2112;
      v260 = v243;
      _os_log_impl(&dword_21DFB1000, v24, OS_LOG_TYPE_INFO, "Beginning transcode loop for image format %@ with maxByteSize %d maxDimension %zd width %@ height %@", buf, 0x30u);
    }

  }
  if (a13)
    *a13 = -1;
  v25 = (const __CFString *)*MEMORY[0x24BDC1780];
  if (!UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x24BDC1780]) || !UTTypeConformsTo(a8, v25))
    goto LABEL_47;
  objc_msgSend_objectForKey_(v244, v26, *MEMORY[0x24BDD9588], v28, v29, v30, v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v242)
    v39 = v243 == 0;
  else
    v39 = 1;
  v40 = v39;
  if (v39)
  {
    v45 = 1.79769313e308;
    v41 = 1.79769313e308;
    if (!v38)
      goto LABEL_43;
  }
  else
  {
    objc_msgSend_doubleValue(v242, v32, v33, v34, v35, v36, v37);
    v45 = v44;
    objc_msgSend_doubleValue(v243, v46, v47, v48, v49, v50, v51);
    v41 = v52;
    if (!v38)
      goto LABEL_43;
  }
  v53 = (float)(unint64_t)objc_msgSend_longValue(v38, v32, v33, v34, v35, v36, v37) / (float)a9;
  if (v53 <= 2.0)
    v54 = 1;
  else
    v54 = v40;
  if ((v54 & 1) == 0)
  {
    v45 = v45 * 0.8;
    v41 = v41 * 0.8;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        v256 = v53;
        v257 = 2048;
        *(double *)v258 = v45;
        *(_WORD *)&v258[8] = 2048;
        *(double *)&v258[10] = v41;
        _os_log_impl(&dword_21DFB1000, v55, OS_LOG_TYPE_INFO, "Compressed input size is %.02f times larger than target output size, using initial scaled res of %.02f %.02f", buf, 0x20u);
      }

    }
  }
LABEL_43:
  sub_21DFBD880(v249, a9, v45, v41);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v56, v57, v58, v59, v60, v61, v62) >= a9)
  {

  }
  else
  {
    objc_msgSend__writeImageData_inFormat_sourceURL_(self, v63, (uint64_t)v56, (uint64_t)a7, (uint64_t)v247, v64, v65);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      goto LABEL_151;
  }
LABEL_47:
  objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v26, v27, v28, v29, v30, v31);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  isLQMImageQualityEstimatorEnabled = objc_msgSend_isLQMImageQualityEstimatorEnabled(v66, v67, v68, v69, v70, v71, v72);

  if (isLQMImageQualityEstimatorEnabled)
  {
    v238 = 0;
    v79 = 0;
    v80 = -1;
    if (UTTypeConformsTo(a8, CFSTR("public.heic")) && a15)
    {
      objc_msgSend_getInputImageFeatures_(IMTranscoderImageQualityEstimator, v74, (uint64_t)v249, v75, v76, v77, v78);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      if (v238)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v81, OS_LOG_TYPE_INFO, "Use image quality estimator model for getting low quality image.", buf, 2u);
          }

        }
        v80 = 0;
        v79 = 1;
      }
      else
      {
        v79 = 0;
        v238 = 0;
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v82, OS_LOG_TYPE_INFO, "Legacy iMessage estimator to be used for getting low quality image.", buf, 2u);
      }

    }
    v79 = 0;
    v238 = 0;
    v80 = -1;
  }
  inConformsToUTI = (const __CFString *)*MEMORY[0x24BDC1820];
  v236 = (const __CFString *)*MEMORY[0x24BDC17C0];
  while (1)
  {
    context = (void *)MEMORY[0x2207A8200]();
    v83 = LargerDimensionFromImage_withProperties_toWidth_toHeight;
    if (v80 < 0)
      break;
    v83 = dword_21DFD0AA0[v80];
    v84 = !LargerDimensionFromImage_withProperties_toWidth_toHeight
       || LargerDimensionFromImage_withProperties_toWidth_toHeight >= v83;
    v85 = !v84;
    v86 = v83 <= a10 || a10 == 0;
    if (v86 && !v85)
      break;
LABEL_146:
    objc_autoreleasePoolPop(context);
    if (v80++ >= 25)
    {

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v231 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v231, OS_LOG_TYPE_INFO, "Warning! Did not find a valid size for this image given the filesize constraint!", buf, 2u);
        }

      }
      v43 = 0;
      goto LABEL_151;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v256 = *(double *)&v83;
      v257 = 1024;
      *(_DWORD *)v258 = v80;
      *(_WORD *)&v258[4] = 1024;
      *(_DWORD *)&v258[6] = 26;
      _os_log_impl(&dword_21DFB1000, v87, OS_LOG_TYPE_INFO, "Trying maxSize = %lu  (index: %d/%d)", buf, 0x18u);
    }

  }
  if (v80 > 2)
    v88 = -1;
  else
    v88 = 2;
  v245 = v88;
  if (CGImageSourceGetCount(v249) >= 2 && UTTypeConformsTo(a8, inConformsToUTI))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v256) = 8;
        _os_log_impl(&dword_21DFB1000, v89, OS_LOG_TYPE_INFO, "Overrriding subsampling to %d for APNG", buf, 8u);
      }

    }
    v245 = 8;
  }
  if (UTTypeConformsTo(v252, v236))
  {
    if (UTTypeConformsTo(a8, v236))
      v96 = 2;
    else
      v96 = 1;
  }
  else
  {
    v96 = 1;
  }
  v97 = (float *)&dword_21DFD0B08;
  while (1)
  {
    v98 = *v97;
    objc_msgSend_overrideJPEGCompressionQuality(self, v90, v91, v92, v93, v94, v95);
    if (v105 == 0.0)
    {
      v107 = v98;
    }
    else
    {
      objc_msgSend_overrideJPEGCompressionQuality(self, v99, v100, v101, v102, v103, v104);
      v107 = v106;
    }
    objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v99, v100, v101, v102, v103, v104);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v108, v109, v110, v111, v112, v113, v114);

    if (v115)
      break;
    *(double *)&v142 = COERCE_DOUBLE(objc_msgSend_estimatedSizeForOutputUTI_maximumDimension_quality_(v251, v116, (uint64_t)v252, v83, v118, v119, v120, v107));
    if (v142 <= a9)
    {
      LOBYTE(v127) = 0;
      goto LABEL_121;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      shouldSkipAuxillaryData = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(shouldSkipAuxillaryData, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v256 = *(double *)&v142;
        v257 = 2048;
        *(_QWORD *)v258 = a9;
        _os_log_impl(&dword_21DFB1000, shouldSkipAuxillaryData, OS_LOG_TYPE_INFO, "Estimated size %lu is larger than required size %lu, skipping", buf, 0x16u);
      }
      goto LABEL_132;
    }
LABEL_133:
    ++v97;
    if (!--v96)
      goto LABEL_146;
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v116, v83, v117, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend_containsObject_(&unk_24E202C68, v122, (uint64_t)v121, v123, v124, v125, v126);

  if ((v79 & v127) == 1)
  {
    v132 = CACurrentMediaTime();
    objc_msgSend_predictQualityFactor_suggestedMaxLength_(IMTranscoderImageQualityEstimator, v133, (uint64_t)v238, v83, v134, v135, v136);
    v107 = v137;
    v138 = CACurrentMediaTime();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v139 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v256 = v138 - v132;
        _os_log_impl(&dword_21DFB1000, v139, OS_LOG_TYPE_INFO, "Prediction Time taken by image quality estimator: %f", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v141 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v256 = v107;
        _os_log_impl(&dword_21DFB1000, v141, OS_LOG_TYPE_INFO, "[v5.1]Estimated quality factor for image when LQM is enabled: %lf", buf, 0xCu);
      }

    }
    if (v107 < 0.45)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v190 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v256 = v107;
          _os_log_impl(&dword_21DFB1000, v190, OS_LOG_TYPE_INFO, "Estimated quality factor is less than pivot : %lf, try for lower dimension.", buf, 0xCu);
        }

      }
      objc_msgSend_lastObject(&unk_24E202C68, v184, v185, v186, v187, v188, v189);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = v83 == objc_msgSend_integerValue(v191, v192, v193, v194, v195, v196, v197);

      if (v198)
      {
        v80 -= objc_msgSend_count(&unk_24E202C68, v90, v91, v92, v93, v94, v95);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v199 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v256 = v107;
            _os_log_impl(&dword_21DFB1000, v199, OS_LOG_TYPE_INFO, "Estimated quality factor is less than pivot : %lf for the lowest model supported dimension. Fallback to iMessage estimator.", buf, 0xCu);
          }

        }
        v79 = 0;
      }
      else
      {
        v79 = 1;
      }
      goto LABEL_133;
    }
    LOBYTE(v127) = 1;
  }
  else
  {
    *(double *)&v144 = COERCE_DOUBLE(objc_msgSend_estimatedSizeForOutputUTI_maximumDimension_quality_(v251, v128, (uint64_t)v252, v83, v129, v130, v131, v107));
    if (v144 > a9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v256 = *(double *)&v144;
          v257 = 2048;
          *(_QWORD *)v258 = a9;
          _os_log_impl(&dword_21DFB1000, v145, OS_LOG_TYPE_INFO, "Estimated size %lu is larger than required size %lu, skipping", buf, 0x16u);
        }

      }
      goto LABEL_133;
    }
  }
LABEL_121:
  LOBYTE(v234) = v79 & v127;
  HIDWORD(v233) = v245;
  LOBYTE(v233) = v80 < 0x19;
  shouldSkipAuxillaryData = objc_msgSend__newGeneratedImage_sourceWidth_sourceHeight_sourceLength_sourceProps_target_hardwareEncoder_inFormat_fromFormat_withMaxLength_withMaxCount_withCompressionQuality_enforceMaxes_subsampling_shouldSkipAuxillaryData_(self, v140, (uint64_t)v249, (uint64_t)v242, (uint64_t)v243, LargerDimensionFromImage_withProperties_toWidth_toHeight, (uint64_t)v244, a5, v107, v246, v252, a8, v83, Count, v233, v234);
  LODWORD(v232) = v80;
  objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v146, (uint64_t)shouldSkipAuxillaryData, (uint64_t)v247, (uint64_t)v252, a9, (uint64_t)a11, a13, v232);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v147, v148, v149, v150, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v153, v154, v155, v156, v157, v158, v159);

  if ((v160 & v79) == 1 && !v43)
  {
    objc_msgSend_lastObject(&unk_24E202C68, v161, v162, v163, v164, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v83 == objc_msgSend_integerValue(v167, v168, v169, v170, v171, v172, v173);

    if (v174)
    {
      v80 -= objc_msgSend_count(&unk_24E202C68, v161, v175, v163, v164, v165, v166);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v176 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
        {
          *(double *)&v183 = COERCE_DOUBLE(objc_msgSend_length(shouldSkipAuxillaryData, v177, v178, v179, v180, v181, v182));
          *(_DWORD *)buf = 134217984;
          v256 = *(double *)&v183;
          _os_log_impl(&dword_21DFB1000, v176, OS_LOG_TYPE_INFO, "Transcoded Image size of %lu is greater than the LQM maxLimit using image quality estimator model. Fallback to iMessage legacy estimator.", buf, 0xCu);
        }

      }
      v79 = 0;
LABEL_132:

      goto LABEL_133;
    }
LABEL_130:
    if (shouldSkipAuxillaryData)
      objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v239, v161, (uint64_t)v252, v163, v164, v165, v166);
    goto LABEL_132;
  }
  if (!v43)
    goto LABEL_130;
  objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v239, v161, (uint64_t)v252, v163, v164, v165, v166);

  objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v201, v202, v203, v204, v205, v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v207, v208, v209, v210, v211, v212, v213);

  if ((v214 & a15 & 1) != 0)
  {
    objc_msgSend__imMetricsCollectorForLQMQualityEstimatorModel_suggestedMaxLength_shouldUseQualityEstimatorModel_inputImageFeatures_(self, v215, (uint64_t)a8, v83, v79 & 1, (uint64_t)v238, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(MEMORY[0x24BE51238], v218, v219, v220, v221, v222, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trackEvent_withDictionary_(v224, v225, *MEMORY[0x24BE50F00], (uint64_t)v217, v226, v227, v228);

  }
  objc_autoreleasePoolPop(context);

LABEL_151:
LABEL_152:

  return v43;
}

- (id)_writeRepresentationsForImage:(CGImageSource *)a3 target:(int64_t)a4 sourceURL:(id)a5 sizes:(id)a6 maxDimension:(unint64_t)a7 srcUTI:(__CFString *)a8 inFormat:(__CFString *)a9 downgradingMultiFrameImageToSingleFrame:(BOOL)a10 estimator:(id)a11 isLQMEnabled:(BOOL)a12 telemetry:(id)a13
{
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  const __CFString *v24;
  int v25;
  NSObject *v26;
  __CFArray *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  int isWideGamutImage;
  unint64_t v73;
  int v74;
  const char *v75;
  NSObject *v76;
  __CFString *v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  char v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  IMEmbeddedHardwareJPEGTranscoder *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  unsigned int v105;
  BOOL v106;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _BOOL4 v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  void *v148;
  int v149;
  const char *v150;
  NSObject *v151;
  CFStringRef Type;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  CFStringRef v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSObject *v169;
  __CFString *v170;
  NSObject *v171;
  int v172;
  int v173;
  NSObject *v174;
  NSObject *v175;
  int v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v179;
  NSObject *v180;
  NSObject *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  __CFArray *v189;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  int v195;
  void *v197;
  id v198;
  __CFString *inUTI;
  id v200;
  unint64_t v201;
  id v204;
  unsigned int v205;
  __CFString *v206;
  id v207;
  uint8_t buf[4];
  __CFString *v209;
  __int16 v210;
  _BYTE v211[10];
  __CFString *v212;
  uint64_t v213;

  v213 = *MEMORY[0x24BDAC8D0];
  v204 = a5;
  v16 = (__CFString *)a6;
  v198 = a11;
  inUTI = a8;
  v200 = a13;
  v23 = 0;
  if (a8 && a9)
  {
    v24 = (const __CFString *)*MEMORY[0x24BDC17C0];
    if (CFEqual(a9, (CFTypeRef)*MEMORY[0x24BDC17C0]))
    {
      v25 = UTTypeConformsTo(a8, v24);
      v23 = 0;
      if (a4 != 1 && v25)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v26, OS_LOG_TYPE_INFO, "Will use hardware JPEG encoding", buf, 2u);
          }

        }
        v23 = 1;
      }
    }
    else
    {
      v23 = 0;
    }
  }
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v17, v18, v19, v20, v21, v22);
  v27 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v28, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v204, v35, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = 0;
  objc_msgSend_attributesOfItemAtPath_error_(v34, v42, (uint64_t)v41, (uint64_t)&v207, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v207;
  v201 = objc_msgSend_fileSize(v46, v47, v48, v49, v50, v51, v52);

  v206 = (__CFString *)v201;
  objc_msgSend_objectAtIndexedSubscript_(v16, v53, 0, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_unsignedLongValue(v58, v59, v60, v61, v62, v63, v64);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v209 = (__CFString *)v201;
      v210 = 2112;
      *(_QWORD *)v211 = v194;
      *(_WORD *)&v211[8] = 2112;
      v212 = v16;
      _os_log_impl(&dword_21DFB1000, v71, OS_LOG_TYPE_INFO, "Generating the representations, originalSize %ld (err %@) sizes %@", buf, 0x20u);
    }

  }
  isWideGamutImage = objc_msgSend__isWideGamutImage_(self, v66, (uint64_t)a3, v67, v68, v69, v70);
  v73 = 0;
  if (v194)
    v74 = 0;
  else
    v74 = isWideGamutImage;
  if (v74 == 1 && v201 < v65)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v209 = (__CFString *)v201;
        v210 = 2048;
        *(_QWORD *)v211 = v65;
        _os_log_impl(&dword_21DFB1000, v76, OS_LOG_TYPE_INFO, "Attempting copy+add props for size %lu (reason: the source is wide gamut and smaller than the limit %lu)", buf, 0x16u);
      }

    }
    objc_msgSend__wideGamutImage_sourceURL_inFormat_withMaxByteSize_maxDimension_actualSize_telemetry_(self, v75, (uint64_t)a3, (uint64_t)v204, (uint64_t)a9, v65, a7, &v206, v200);
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v78 = IMOSLoggingEnabled();
    if (v77)
    {
      if (v78)
      {
        OSLogHandleForIMFoundationCategory();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v209 = v77;
          _os_log_impl(&dword_21DFB1000, v79, OS_LOG_TYPE_INFO, "Using original wide-gamut image with added properties answerImageURL: %@", buf, 0xCu);
        }

      }
      if (v27)
        CFArrayAppendValue(v27, v77);
      v73 = 1;
    }
    else
    {
      if (v78)
      {
        OSLogHandleForIMFoundationCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v209 = v206;
          v210 = 2048;
          *(_QWORD *)v211 = v65;
          _os_log_impl(&dword_21DFB1000, v80, OS_LOG_TYPE_INFO, "Couldn't use copy of wide-gamut image with added properties (size %ld max %ld), transcoding", buf, 0x16u);
        }

      }
      v73 = 0;
      v201 = (unint64_t)v206;
    }

  }
  v81 = v23 ^ 1;
  if (!v204)
    v81 = 1;
  if ((v81 & 1) != 0)
  {
    v197 = 0;
  }
  else
  {
    v82 = objc_alloc(MEMORY[0x24BDBCE50]);
    v86 = (void *)objc_msgSend_initWithContentsOfURL_options_error_(v82, v83, (uint64_t)v204, 1, 0, v84, v85);
    if (objc_msgSend_length(v86, v87, v88, v89, v90, v91, v92))
    {
      v93 = [IMEmbeddedHardwareJPEGTranscoder alloc];
      v197 = (void *)objc_msgSend_initWithImageData_imageSource_(v93, v94, (uint64_t)v86, (uint64_t)a3, v95, v96, v97);
    }
    else
    {
      v197 = 0;
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v209 = v16;
      v210 = 2048;
      *(_QWORD *)v211 = v201;
      _os_log_impl(&dword_21DFB1000, v104, OS_LOG_TYPE_INFO, "Beginning to transcode images with size limits: %@ originalFileSize %lu", buf, 0x16u);
    }

  }
  if (v73 < objc_msgSend_count(v16, v98, v99, v100, v101, v102, v103))
  {
    v105 = 0;
    if (v194)
      v106 = 1;
    else
      v106 = v201 == 0;
    v107 = !v106;
    v195 = v107;
    while (1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_objectAtIndexedSubscript_(v16, v114, v73, v115, v116, v117, v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v209 = (__CFString *)v73;
          v210 = 2112;
          *(_QWORD *)v211 = v119;
          _os_log_impl(&dword_21DFB1000, v113, OS_LOG_TYPE_INFO, "Trying to transcode to target size index %lu size limit %@", buf, 0x16u);

        }
      }
      if (v105 >= 0x1A)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v180 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v209) = v105;
            _os_log_impl(&dword_21DFB1000, v180, OS_LOG_TYPE_INFO, "Transcoding: Aborting further transcoding attempts: current image resize index is %d.", buf, 8u);
          }

        }
        goto LABEL_151;
      }
      objc_msgSend_objectAtIndexedSubscript_(v16, v108, v73, v109, v110, v111, v112);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend_unsignedLongValue(v120, v121, v122, v123, v124, v125, v126);

      if (!v73)
        break;
      objc_msgSend_objectAtIndexedSubscript_(v16, v128, v73 - 1, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend_unsignedLongValue(v133, v134, v135, v136, v137, v138, v139) == v127;

      if (!v140)
      {
        v148 = (void *)MEMORY[0x2207A8200]();
        if ((unint64_t)v206 > v127)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v151 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              v209 = (__CFString *)v127;
              v210 = 2048;
              *(_QWORD *)v211 = v206;
              _os_log_impl(&dword_21DFB1000, v151, OS_LOG_TYPE_INFO, "Transcoding at size %tu (the previous size is %tu)", buf, 0x16u);
            }
            goto LABEL_122;
          }
LABEL_132:
          v205 = v105;
          LOBYTE(v193) = a12;
          LODWORD(v192) = v105;
          objc_msgSend__writeImage_sourceURL_target_hardwareEncoder_inFormat_fromFormat_withMaxByteSize_maxDimension_actualSize_startingLengthIndex_usedLengthIndex_estimator_isLQMEnabled_telemetry_(self, v150, (uint64_t)a3, (uint64_t)v204, a4, (uint64_t)v197, (uint64_t)a9, inUTI, v127, a7, &v206, v192, &v205, v198, v193, v200);
          v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v178 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v209 = v170;
              v210 = 1024;
              *(_DWORD *)v211 = v105;
              *(_WORD *)&v211[4] = 1024;
              *(_DWORD *)&v211[6] = v205;
              _os_log_impl(&dword_21DFB1000, v178, OS_LOG_TYPE_INFO, "Transcoding result URL: %@ (start/stop length index: %d => %d)", buf, 0x18u);
            }

          }
          v105 = v205 + 1;
LABEL_137:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v179 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v209 = (__CFString *)v27;
              v210 = 2112;
              *(_QWORD *)v211 = v170;
              _os_log_impl(&dword_21DFB1000, v179, OS_LOG_TYPE_INFO, "answer: %@ answerImageURL: %@", buf, 0x16u);
            }

          }
          if (v27 && v170)
            CFArrayAppendValue(v27, v170);

          objc_autoreleasePoolPop(v148);
          goto LABEL_145;
        }
LABEL_123:
        v170 = 0;
LABEL_124:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v177 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v209 = (__CFString *)v127;
            _os_log_impl(&dword_21DFB1000, v177, OS_LOG_TYPE_INFO, "Not transcoding an image for size: %tu", buf, 0xCu);
          }

        }
        goto LABEL_137;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v209 = (__CFString *)v127;
          _os_log_impl(&dword_21DFB1000, v147, OS_LOG_TYPE_INFO, "Aborting transcoding attempt: current size limit %tu is the same as the previous size.", buf, 0xCu);
        }

      }
LABEL_145:
      if (++v73 >= objc_msgSend_count(v16, v141, v142, v143, v144, v145, v146))
        goto LABEL_151;
    }
    v148 = (void *)MEMORY[0x2207A8200]();
    if (v201 <= v127)
      v149 = v195;
    else
      v149 = 0;
    if (a4 == 1)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_132;
      OSLogHandleForIMFoundationCategory();
      v151 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v209 = (__CFString *)v127;
        _os_log_impl(&dword_21DFB1000, v151, OS_LOG_TYPE_INFO, "Transcoding large size %tu (reason: the target is MMS).", buf, 0xCu);
      }
      goto LABEL_122;
    }
    Type = CGImageSourceGetType(a3);
    if (objc_msgSend__isHEIFImageFormat_(self, v153, (uint64_t)Type, v154, v155, v156, v157)
      && (objc_msgSend__isHEIFImageFormat_(self, v158, (uint64_t)a9, v159, v160, v161, v162) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v209 = (__CFString *)v127;
          _os_log_impl(&dword_21DFB1000, v171, OS_LOG_TYPE_INFO, "Transcoding to size %tu (reason: the source is HEIF).", buf, 0xCu);
        }

      }
      if ((double)v201 * 2.5 <= (double)v127)
        v172 = v195;
      else
        v172 = 0;
      v173 = IMOSLoggingEnabled();
      if (v172)
      {
        if (v173)
        {
          OSLogHandleForIMFoundationCategory();
          v174 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v174, OS_LOG_TYPE_INFO, "Transcoded size fits within the max limit so only writing URL for wide gamut properties", buf, 2u);
          }

        }
        *(_DWORD *)buf = v105;
        LODWORD(v191) = v105;
        objc_msgSend__writeHEIFImage_sourceURL_inFormat_withMaxByteSize_maxDimension_downgradingMultiFrameImageToSingleFrame_actualSize_startingLengthIndex_usedLengthIndex_telemetry_(self, v150, (uint64_t)a3, (uint64_t)v204, (uint64_t)a9, v127, a7, a10, &v206, v191, buf, v200);
        v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v105 = *(_DWORD *)buf + 1;
        if (!v170)
          goto LABEL_132;
        goto LABEL_124;
      }
      if (!v173)
        goto LABEL_132;
      OSLogHandleForIMFoundationCategory();
      v175 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v175, OS_LOG_TYPE_INFO, "Original size is larger than max limit so needs transcoding", buf, 2u);
      }
    }
    else
    {
      if (!objc_msgSend__isHEIFImageFormat_(self, v158, (uint64_t)a9, v159, v160, v161, v162)
        || (v163 = CGImageSourceGetType(a3),
            (objc_msgSend__isHEIFImageFormat_(self, v164, (uint64_t)v163, v165, v166, v167, v168) & 1) != 0))
      {
        if (UTTypeEqual(a9, inUTI))
        {
          if (v149)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v169 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                v209 = (__CFString *)v127;
                v210 = 2048;
                *(_QWORD *)v211 = v201;
                _os_log_impl(&dword_21DFB1000, v169, OS_LOG_TYPE_INFO, "Given size limit %lu is already greater than the original file size %lu.", buf, 0x16u);
              }

            }
            v170 = (__CFString *)v204;
            goto LABEL_124;
          }
          v176 = v195;
          if (v201 <= v127)
            v176 = 0;
          if (v176 != 1)
            goto LABEL_123;
          if (!IMOSLoggingEnabled())
            goto LABEL_132;
          OSLogHandleForIMFoundationCategory();
          v151 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v209 = (__CFString *)v201;
            v210 = 2048;
            *(_QWORD *)v211 = v127;
            _os_log_impl(&dword_21DFB1000, v151, OS_LOG_TYPE_INFO, "Original file size limit %lu is bigger than target size %lu", buf, 0x16u);
          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_132;
          OSLogHandleForIMFoundationCategory();
          v151 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v209 = a9;
            v210 = 2112;
            *(_QWORD *)v211 = inUTI;
            _os_log_impl(&dword_21DFB1000, v151, OS_LOG_TYPE_INFO, "Destination (%@) and source (%@) UTIs do not match, so transcoding", buf, 0x16u);
          }
        }
LABEL_122:

        goto LABEL_132;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_132;
      OSLogHandleForIMFoundationCategory();
      v175 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v175, OS_LOG_TYPE_INFO, "Original is not HEIF, we want to send HEIF, so transcoding", buf, 2u);
      }
    }

    goto LABEL_132;
  }
LABEL_151:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
    {
      v188 = objc_msgSend_count(v27, v182, v183, v184, v185, v186, v187);
      *(_DWORD *)buf = 134218242;
      v209 = (__CFString *)v188;
      v210 = 2112;
      *(_QWORD *)v211 = v27;
      _os_log_impl(&dword_21DFB1000, v181, OS_LOG_TYPE_INFO, "Finished transcoding images with %tu results: %@", buf, 0x16u);
    }

  }
  v189 = v27;

  return v189;
}

- (id)_wideGamutImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 actualSize:(unint64_t *)a8 telemetry:(id)a9
{
  size_t Count;
  NSObject *v13;
  CGImageDestination *v14;
  int v15;
  NSObject *v16;
  size_t i;
  void *v18;
  CFDictionaryRef v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  CGImage *ImageAtIndex;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v61;
  void *context;
  id v65;
  id v66;
  __CFData *data;
  uint8_t buf[4];
  size_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v65 = a4;
  v66 = a9;
  Count = CGImageSourceGetCount(a3);
  context = (void *)MEMORY[0x2207A8200]();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v69 = Count;
      _os_log_impl(&dword_21DFB1000, v13, OS_LOG_TYPE_INFO, "Trying to copy wide gamut properties with original image count = %zu", buf, 0xCu);
    }

  }
  data = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v14 = CGImageDestinationCreateWithData(data, a5, Count, 0);
  v15 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v46, OS_LOG_TYPE_INFO, "Cannot set gamut properties because imageDestination is NULL", buf, 2u);
      }

    }
    goto LABEL_48;
  }
  if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v69 = Count;
      _os_log_impl(&dword_21DFB1000, v16, OS_LOG_TYPE_INFO, " ==> Image Count = %zu", buf, 0xCu);
    }

  }
  if (Count)
  {
    for (i = 0; i != Count; ++i)
    {
      v18 = (void *)MEMORY[0x2207A8200]();
      v19 = CGImageSourceCopyPropertiesAtIndex(a3, i, 0);
      v26 = (const __CFDictionary *)objc_msgSend_mutableCopy(v19, v20, v21, v22, v23, v24, v25);

      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, i, 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = CFSTR("YES");
          if (!ImageAtIndex)
            v34 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v69 = (size_t)v34;
          _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "adding image properties for wide gamut properties only. Created scaled image: %@", buf, 0xCu);
        }

      }
      if ((objc_msgSend__isHEIFImageFormat_(self, v28, (uint64_t)a5, v29, v30, v31, v32) & 1) == 0)
        objc_msgSend__setWideGamutProperties_scaledImage_(self, v35, (uint64_t)v26, (uint64_t)ImageAtIndex, v36, v37, v38);
      v39 = IMOSLoggingEnabled();
      if (ImageAtIndex)
      {
        if (v39)
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v69 = i;
            _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v69 = (size_t)v26;
            _os_log_impl(&dword_21DFB1000, v41, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
          }

        }
        CGImageDestinationAddImage(v14, ImageAtIndex, v26);
        objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v42, (uint64_t)a3, (uint64_t)v14, i, v43, v44, 1.0);
        CGImageRelease(ImageAtIndex);
      }
      else if (v39)
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v69 = i;
          _os_log_impl(&dword_21DFB1000, v45, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
        }

      }
      objc_autoreleasePoolPop(v18);
    }
  }
  if (!CGImageDestinationFinalize(v14))
  {
    CFRelease(v14);
LABEL_48:

    objc_autoreleasePoolPop(context);
    v53 = 0;
    goto LABEL_49;
  }
  objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v47, (uint64_t)data, (uint64_t)v65, (uint64_t)a5, a6, (uint64_t)a8, 0, -1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v69 = (size_t)v53;
        _os_log_impl(&dword_21DFB1000, v59, OS_LOG_TYPE_INFO, "Success copying wide gamut image w/ props to url: %@", buf, 0xCu);
      }

    }
    objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v66, v54, (uint64_t)a5, v55, v56, v57, v58);
    CFRelease(v14);

    objc_autoreleasePoolPop(context);
  }
  else
  {
    objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v66, v48, (uint64_t)a5, v49, v50, v51, v52);
    CFRelease(v14);

    objc_autoreleasePoolPop(context);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v61, OS_LOG_TYPE_INFO, "Failed to copy an image url for a wide gamut transformation", buf, 2u);
      }

    }
  }
LABEL_49:

  return v53;
}

- (id)_writeHEIFImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 downgradingMultiFrameImageToSingleFrame:(BOOL)a8 actualSize:(unint64_t *)a9 startingLengthIndex:(int)a10 usedLengthIndex:(int *)a11 telemetry:(id)a12
{
  unsigned int v15;
  int *v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  size_t v20;
  double v21;
  uint64_t v22;
  size_t v23;
  NSObject *v24;
  CGImageDestination *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  CFDictionaryRef v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFDictionary *v50;
  CGImageRef ThumbnailAtIndex;
  CGImage *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const __CFString *v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v86;
  id v87;
  size_t Count;
  unint64_t v89;
  void *context;
  _BOOL4 v91;
  __CFData *v93;
  uint64_t v94;
  const __CFDictionary *v95;
  _QWORD v96[2];
  _QWORD v97[2];
  uint8_t buf[4];
  size_t v99;
  __int16 v100;
  _QWORD v101[4];

  v91 = a8;
  v15 = a10;
  *(_QWORD *)((char *)&v101[2] + 2) = *MEMORY[0x24BDAC8D0];
  v87 = a4;
  v86 = a12;
  if (a10 >= 0x1A)
    v15 = 0;
  Count = CGImageSourceGetCount(a3);
  if (!a7)
    goto LABEL_7;
  v16 = &dword_21DFD0AA0[v15--];
  do
  {
    v17 = *v16++;
    ++v15;
  }
  while (v17 > a7);
  if (v15 > 0x19)
  {
LABEL_57:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v73, OS_LOG_TYPE_INFO, "Failed to generate an image url for a wide gamut transformation", buf, 2u);
      }

    }
  }
  else
  {
LABEL_7:
    v94 = v15;
    v18 = (double)a7;
    v83 = *MEMORY[0x24BDD9808];
    v84 = *MEMORY[0x24BDD9778];
    v89 = a7;
    while (1)
    {
      context = (void *)MEMORY[0x2207A8200]();
      v19 = dword_21DFD0AA0[v94];
      v20 = dword_21DFD0B10[v94];
      if (a7)
        v21 = (double)(unint64_t)v19 / v18;
      else
        v21 = 1.0;
      if (Count >= v20)
        v22 = dword_21DFD0B10[v94];
      else
        v22 = Count;
      if (v91)
        v23 = 1;
      else
        v23 = v22;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          v99 = v20;
          v100 = 1024;
          LODWORD(v101[0]) = v94;
          WORD2(v101[0]) = 2048;
          *(_QWORD *)((char *)v101 + 6) = Count;
          _os_log_impl(&dword_21DFB1000, v24, OS_LOG_TYPE_INFO, "Trying to copy wide gamut properties for index maxSize = %lu (index: %d) with original image count = %zu", buf, 0x1Cu);
        }

      }
      v93 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v25 = CGImageDestinationCreateWithData(v93, a5, v23, 0);
      v26 = IMOSLoggingEnabled();
      if (!v25)
        break;
      if (v26)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v99 = v23;
          v100 = 2048;
          v101[0] = v19;
          _os_log_impl(&dword_21DFB1000, v32, OS_LOG_TYPE_INFO, " ==> Image Count = %zu, suggestedMaxLength = %zu", buf, 0x16u);
        }

      }
      v96[0] = v84;
      v96[1] = v83;
      v97[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v27, v19, v28, v29, v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v33;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)v97, (uint64_t)v96, 2, v35, v36);
      v95 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      if (v91)
      {
        v41 = objc_msgSend__determineFrameIndexForDowngradeFromMultiFrameToSingleFrameWithMaxDimension_fromImageSource_(self, v37, v89, (uint64_t)a3, v38, v39, v40);
        v22 = 1;
      }
      else
      {
        v41 = 0;
      }
      if (v41 < v22 + v41)
      {
        do
        {
          v42 = (void *)MEMORY[0x2207A8200]();
          v43 = CGImageSourceCopyPropertiesAtIndex(a3, v41, 0);
          v50 = (const __CFDictionary *)objc_msgSend_mutableCopy(v43, v44, v45, v46, v47, v48, v49);

          if (v23 >= 2)
            ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v41, v95);
          else
            ThumbnailAtIndex = CGImageSourceCreateImageAtIndex(a3, v41, 0);
          v52 = ThumbnailAtIndex;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              v58 = CFSTR("YES");
              if (!v52)
                v58 = CFSTR("NO");
              *(_DWORD *)buf = 138412290;
              v99 = (size_t)v58;
              _os_log_impl(&dword_21DFB1000, v57, OS_LOG_TYPE_INFO, "adding image properties for HEIF Images only. Created scaled image: %@", buf, 0xCu);
            }

          }
          objc_msgSend__setWideGamutProperties_scaledImage_(self, v53, (uint64_t)v50, (uint64_t)v52, v54, v55, v56);
          v59 = IMOSLoggingEnabled();
          if (v52)
          {
            if (v59)
            {
              OSLogHandleForIMFoundationCategory();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                v99 = v41;
                _os_log_impl(&dword_21DFB1000, v60, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
              }

            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v99 = (size_t)v50;
                _os_log_impl(&dword_21DFB1000, v61, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
              }

            }
            CGImageDestinationAddImage(v25, v52, v50);
            objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v62, (uint64_t)a3, (uint64_t)v25, v41, v63, v64, v21);
            CGImageRelease(v52);
          }
          else if (v59)
          {
            OSLogHandleForIMFoundationCategory();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v99 = v41;
              _os_log_impl(&dword_21DFB1000, v65, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v42);
          ++v41;
          --v22;
        }
        while (v22);
      }
      if (!CGImageDestinationFinalize(v25))
      {
        CFRelease(v25);

        objc_autoreleasePoolPop(context);
        goto LABEL_67;
      }
      LODWORD(v82) = v94;
      objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v66, (uint64_t)v93, (uint64_t)v87, (uint64_t)a5, a6, (uint64_t)a9, a11, v82);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v99 = (size_t)v72;
            _os_log_impl(&dword_21DFB1000, v81, OS_LOG_TYPE_INFO, "Success writing wide gamut image out, breaking from loop with url: %@", buf, 0xCu);
          }

        }
        objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v86, v76, (uint64_t)a5, v77, v78, v79, v80);
        CFRelease(v25);

        objc_autoreleasePoolPop(context);
        goto LABEL_68;
      }
      objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v86, v67, (uint64_t)a5, v68, v69, v70, v71);
      CFRelease(v25);

      objc_autoreleasePoolPop(context);
      ++v94;
      a7 = v89;
      if (v94 == 26)
        goto LABEL_57;
    }
    if (v26)
    {
      OSLogHandleForIMFoundationCategory();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v74, OS_LOG_TYPE_INFO, "Cannot set gamut properties because imageDestination is NULL", buf, 2u);
      }

    }
    objc_autoreleasePoolPop(context);
  }
LABEL_67:
  v72 = 0;
LABEL_68:

  return v72;
}

- (unint64_t)_determineFrameIndexForDowngradeFromMultiFrameToSingleFrameWithMaxDimension:(unint64_t)a3 fromImageSource:(CGImageSource *)a4
{
  CGImageSource *v4;
  size_t Count;
  size_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  uint64_t v12;
  CFDictionaryRef v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CGImageSource *v39;
  size_t v40;
  unint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  unint64_t v44;
  _BOOL4 v45;
  BOOL v46;
  size_t v47;
  unint64_t v48;
  unint64_t v49;
  BOOL v50;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  size_t v62;
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  Count = CGImageSourceGetCount(a4);
  v7 = Count;
  if (!Count)
  {
    v53 = 0;
    v54 = -1;
    v10 = 0;
LABEL_22:
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218752;
      v9 = v54;
      v56 = v54;
      v57 = 2048;
      v58 = v10;
      v59 = 2048;
      v60 = v53;
      v61 = 2048;
      v62 = v7;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "Using frame index %ld with dimensions (%ld x %ld) for downgrade from %ld frame image to single frame.", buf, 0x2Au);
    }
    else
    {
      v9 = v54;
    }
    goto LABEL_25;
  }
  if (Count != 1)
  {
    v11 = 0;
    v53 = 0;
    v10 = 0;
    v12 = *MEMORY[0x24BDD96C8];
    v52 = *MEMORY[0x24BDD96C0];
    v54 = -1;
    do
    {
      v13 = CGImageSourceCopyPropertiesAtIndex(v4, v11, 0);
      objc_msgSend_objectForKeyedSubscript_(v13, v14, v12, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23, v24, v25);

      if (v26 <= a3)
      {
        objc_msgSend_objectForKeyedSubscript_(v13, v27, v52, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v4;
        v40 = v7;
        v41 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35, v36, v37, v38);

        v42 = v10 < v26;
        v44 = v53;
        v43 = v54;
        v45 = v53 < v41;
        v46 = !v42 || !v45;
        if (v42 && v45)
          v47 = v11;
        else
          v47 = v54;
        if (v46)
          v48 = v10;
        else
          v48 = v26;
        if (v46)
          v49 = v53;
        else
          v49 = v41;
        v50 = v41 > a3;
        v7 = v40;
        v4 = v39;
        if (!v50)
        {
          v43 = v47;
          v10 = v48;
          v44 = v49;
        }
        v53 = v44;
        v54 = v43;
      }

      ++v11;
    }
    while (v7 != v11);
    goto LABEL_22;
  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "Image only contains one frame, no need to choose a best frame for downgrade from multiframe to single frame.", buf, 2u);
  }
  v9 = 0;
LABEL_25:

  return v9;
}

- (unint64_t)_getImageWidth:(CGImageSource *)a3
{
  CFDictionaryRef v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  if (!a3 || !CGImageSourceGetCount(a3))
    return 0;
  v4 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x24BDD96C8], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13, v14, v15, v16);

  return v17;
}

- (id)_getScaleFactorArray:(id)a3 transferURL:(id)a4 outputURLs:(id)a5
{
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ImageWidth;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  CGImageSourceRef v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  BOOL v38;
  float v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  void *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  CGImageSourceRef cf;
  const __CFURL *url;
  const __CFURL *v92;
  __CFString *inUTI;
  const __CFURL *obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  const __CFURL *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  inUTI = (__CFString *)a3;
  url = (const __CFURL *)a4;
  v92 = (const __CFURL *)a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v101 = (uint64_t)inUTI;
      v102 = 2112;
      v103 = url;
      v104 = 2112;
      v105 = v92;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "_getScaleFactorArray uti %@ transferURL %@ outputURLs %@", buf, 0x20u);
    }

  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x24BDC1820])
     || UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x24BDC1780])
     || UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x24BDC17C0]))
    && (v16 = objc_msgSend_count(v92, v10, v11, v12, v13, v14, v15), url)
    && v16)
  {
    cf = CGImageSourceCreateWithURL(url, 0);
    ImageWidth = objc_msgSend__getImageWidth_(self, v17, (uint64_t)cf, v18, v19, v20, v21);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v101 = ImageWidth;
        _os_log_impl(&dword_21DFB1000, v23, OS_LOG_TYPE_INFO, "_getScaleFactor inImageWidth = %lu", buf, 0xCu);
      }

    }
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v92;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v95, (uint64_t)v99, 16, v25, v26);
    if (v27)
    {
      v28 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v96 != v28)
            objc_enumerationMutation(obj);
          v30 = CGImageSourceCreateWithURL(*(CFURLRef *)(*((_QWORD *)&v95 + 1) + 8 * i), 0);
          v36 = objc_msgSend__getImageWidth_(self, v31, (uint64_t)v30, v32, v33, v34, v35);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v101 = v36;
              _os_log_impl(&dword_21DFB1000, v37, OS_LOG_TYPE_INFO, "_getScaleFactor outImageWidth = %lu", buf, 0xCu);
            }

          }
          if (v36)
            v38 = ImageWidth == 0;
          else
            v38 = 1;
          if (v38)
          {
            v39 = 1.0;
            if (!IMOSLoggingEnabled())
              goto LABEL_36;
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              LODWORD(v47) = 1.0;
              objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v41, v42, v43, v44, v45, v46, v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v101 = (uint64_t)v48;
              _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "_getScaleFactorArray resorting to default scale factor for outPutURL %@", buf, 0xCu);

            }
            goto LABEL_35;
          }
          v49 = IMOSLoggingEnabled();
          v39 = (float)(unint64_t)ImageWidth / (float)(unint64_t)v36;
          if (v49)
          {
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(float *)&v63 = v39;
              objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v57, v58, v59, v60, v61, v62, v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v101 = (uint64_t)v64;
              _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "_getScaleFactorArray scale factor for outPutURL %@", buf, 0xCu);

            }
LABEL_35:

          }
LABEL_36:
          if (v30)
            CFRelease(v30);
          *(float *)&v56 = v39;
          objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v50, v51, v52, v53, v54, v55, v56);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v9, v66, (uint64_t)v65, v67, v68, v69, v70);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v95, (uint64_t)v99, 16, v72, v73);
      }
      while (v27);
    }

    if (cf)
      CFRelease(cf);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v81 = (void *)MEMORY[0x24BDD16E0];
      v82 = objc_msgSend_count(v92, v75, v76, v77, v78, v79, v80);
      objc_msgSend_numberWithUnsignedInteger_(v81, v83, v82, v84, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v101 = (uint64_t)v88;
      v102 = 2112;
      v103 = inUTI;
      v104 = 2112;
      v105 = url;
      _os_log_impl(&dword_21DFB1000, v74, OS_LOG_TYPE_INFO, "Did not compute sticker scale. [outputURLs count] %@, uti %@, transferURL %@", buf, 0x20u);

    }
  }

  return v9;
}

- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  const __CFURL *v18;
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char isEqualToValue;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int isEqualToIgnoringCase;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  const __CFString *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  id v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  NSObject *v140;
  NSObject *v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSObject *v153;
  NSObject *v154;
  id v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  CGImage *v169;
  uint64_t v170;
  size_t Width;
  size_t Height;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const __CFDictionary *v179;
  uint64_t v180;
  unint64_t v181;
  __CFData *v182;
  __CFData *v183;
  CGImageDestination *v184;
  CGImageDestination *v185;
  CGImage *v186;
  NSObject *v187;
  CGImageSource *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  NSObject *v195;
  void *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  NSObject *v203;
  char v204;
  NSObject *v205;
  NSObject *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  _BOOL4 v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  NSObject *v220;
  id v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  NSObject *v225;
  char v226;
  NSObject *v227;
  const __CFString *v228;
  NSObject *v229;
  unint64_t v230;
  _BOOL4 v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  NSObject *v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  _BOOL4 v265;
  CFDictionaryRef v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  NSObject *v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int v280;
  NSObject *v281;
  NSObject *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  NSObject *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  NSObject *v292;
  NSObject *v293;
  const __CFString *v294;
  const char *v295;
  NSObject *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  NSObject *v315;
  const __CFString *v316;
  const __CFString *v317;
  void *v318;
  NSObject *v319;
  size_t Count;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  int isHighQualityPhotosEnabled;
  int v335;
  NSObject *v336;
  id *v337;
  id v338;
  const char *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  NSObject *v346;
  uint64_t v347;
  const char *v348;
  CGImageRef ImageAtIndex;
  void *v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  int v356;
  NSObject *v357;
  uint64_t v358;
  const char *v359;
  NSObject *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  NSObject *v367;
  NSObject *v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  NSObject *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  NSObject *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  NSObject *v391;
  NSObject *v392;
  void *v393;
  NSObject *v394;
  __CFDictionary *v395;
  id v396;
  uint64_t v397;
  const char *v398;
  NSObject *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  id v408;
  BOOL v409;
  int shouldPreserveHEIFEncoding_target_sourceUTI;
  NSObject *log;
  os_log_t loga;
  unint64_t v413;
  id v414;
  unsigned int v415;
  id v416;
  void *v417;
  IMTranscoderTelemetry *v418;
  id v419;
  id v421;
  _QWORD v422[4];
  id v423;
  int v424;
  uint8_t v425[8];
  uint64_t valuePtr;
  uint64_t v427;
  __CFString *v428;
  void *values[4];
  _BYTE buf[24];
  unint64_t v431;
  uint64_t v432;

  v432 = *MEMORY[0x24BDAC8D0];
  v18 = (const __CFURL *)a3;
  v19 = (__CFString *)a4;
  v414 = a5;
  v20 = a7;
  v419 = a8;
  v21 = a10;
  v416 = a13;
  v22 = v20;
  if ((unint64_t)objc_msgSend_count(v22, v23, v24, v25, v26, v27, v28) < 2)
  {
LABEL_5:
    v34 = 0;
  }
  else
  {
    v34 = 1;
    v35 = 1;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v22, v29, v35, v30, v31, v32, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v35 - 1;
      objc_msgSend_objectAtIndexedSubscript_(v22, v38, v37, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToValue = objc_msgSend_isEqualToValue_(v36, v44, (uint64_t)v43, v45, v46, v47, v48);

      if ((isEqualToValue & 1) == 0)
        break;
      v35 = v37 + 2;
      if (v35 >= objc_msgSend_count(v22, v50, v51, v52, v53, v54, v55))
        goto LABEL_5;
    }
  }

  if (v34 != a11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a11;
      _os_log_impl(&dword_21DFB1000, v59, OS_LOG_TYPE_INFO, "Warning - sizes %@ do not match the number of reps requested (%d)", buf, 0x12u);
    }

  }
  shouldPreserveHEIFEncoding_target_sourceUTI = objc_msgSend_shouldPreserveHEIFEncoding_target_sourceUTI_(IMTranscoder, v56, (uint64_t)v419, a6, (uint64_t)v19, v57, v58);
  objc_msgSend_lastObject(v22, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_longValue(v66, v67, v68, v69, v70, v71, v72);
  shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(self, v74, (uint64_t)v18, (uint64_t)v21, a6, (uint64_t)v19, (uint64_t)v414, v73, v419);

  v76 = shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities == 2;
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v19, v77, (uint64_t)CFSTR("________WBMP_________"), v78, v79, v80, v81);
  objc_msgSend_objectForKey_(v21, v83, (uint64_t)CFSTR("ImageQuality"), v84, v85, v86, v87);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  if (v417)
  {
    objc_msgSend_floatValue(v417, v88, v89, v90, v91, v92, v93);
    objc_msgSend_setOverrideJPEGCompressionQuality_(self, v95, v96, v97, v98, v99, v100, v94);
  }
  v415 = isEqualToIgnoringCase | v76;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      v107 = CFSTR("NO");
      if (v415)
        v107 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v107;
      _os_log_impl(&dword_21DFB1000, v106, OS_LOG_TYPE_INFO, "Transfer: %@   needsTranscode? %@", buf, 0x16u);
    }

  }
  if (a6 == 1)
  {
    objc_msgSend_objectForKey_(v21, v101, *MEMORY[0x24BE510D0], v102, v103, v104, v105);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v21, v109, *MEMORY[0x24BE510D8], v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (int)((double)(int)objc_msgSend_IMMMSMaximumMessageByteCountForPhoneNumber_simID_(MEMORY[0x24BE511B0], v115, (uint64_t)v108, (uint64_t)v114, v116, v117, v118)* 0.92);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v119;
        _os_log_impl(&dword_21DFB1000, v120, OS_LOG_TYPE_INFO, "       Max byte size is: %d", buf, 8u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_21DFB1000, v126, OS_LOG_TYPE_INFO, "         Supplied sizes: %@", buf, 0xCu);
      }

    }
    objc_msgSend_numberWithLong_(MEMORY[0x24BDD16E0], v121, v119, v122, v123, v124, v125);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v422[0] = MEMORY[0x24BDAC760];
    v422[1] = 3221225472;
    v422[2] = sub_21DFC2F1C;
    v422[3] = &unk_24E1FF7F8;
    v424 = v119;
    v128 = v127;
    v423 = v128;
    objc_msgSend___imArrayByApplyingBlock_(v22, v129, (uint64_t)v422, v130, v131, v132, v133);
    v134 = objc_claimAutoreleasedReturnValue();

    v139 = objc_msgSend_IMMMSMaxImageDimensionForPhoneNumber_simID_(MEMORY[0x24BE511B0], v135, (uint64_t)v108, (uint64_t)v114, v136, v137, v138);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v140 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v140, OS_LOG_TYPE_INFO, " Always transcoding MMS, setting transcoding to YES", buf, 2u);
      }

    }
    v413 = v139;
    v415 = 1;
    v22 = (id)v134;
  }
  else
  {
    v413 = a9;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v413;
      _os_log_impl(&dword_21DFB1000, v141, OS_LOG_TYPE_INFO, " Max image dimension is: %zd", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v142 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_21DFB1000, v142, OS_LOG_TYPE_INFO, "              Max sizes: %@", buf, 0xCu);
    }

  }
  v418 = objc_alloc_init(IMTranscoderTelemetry);
  if (v415)
  {
    objc_msgSend_emitTranscodeBeginFromUTI_(v418, v143, (uint64_t)v19, v144, v145, v146, v147);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v153 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v153, OS_LOG_TYPE_INFO, "This image needs to be transcoded!", buf, 2u);
      }

    }
    if (!objc_msgSend_isEqualToIgnoringCase_(v19, v148, (uint64_t)CFSTR("________WBMP_________"), v149, v150, v151, v152))
    {
      if (v18)
      {
LABEL_107:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v220 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v18;
            _os_log_impl(&dword_21DFB1000, v220, OS_LOG_TYPE_INFO, "Creating CGImageSource from url: %@", buf, 0xCu);
          }

        }
        if (v19)
        {
          v427 = *MEMORY[0x24BDD9810];
          v428 = v19;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v217, (uint64_t)&v428, (uint64_t)&v427, 1, v218, v219);
          v221 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v221 = 0;
        }
        v188 = CGImageSourceCreateWithURL(v18, (CFDictionaryRef)v221);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v227 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
          {
            v228 = CFSTR("good");
            if (!v188)
              v228 = CFSTR("NULL");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v228;
            _os_log_impl(&dword_21DFB1000, v227, OS_LOG_TYPE_INFO, "Source ref is %@", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v229 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v229, OS_LOG_TYPE_INFO, "Source image properties unavailable (sourceRef is NULL)", buf, 2u);
          }

        }
        v226 = 0;
        goto LABEL_130;
      }
      v188 = 0;
LABEL_113:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v225 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v225, OS_LOG_TYPE_INFO, "transferURL is nil, no image to transcode...", buf, 2u);
        }

      }
      v226 = 1;
LABEL_130:
      v409 = v188 == 0;
      if (!v188 && !IMIsRunningInUnitTesting())
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v286 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v286, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v286, OS_LOG_TYPE_INFO, "The imageSource was NULL when trying to load original attachment file", buf, 2u);
          }

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v283, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -2, 0, v284, v285);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v202 = 0;
        v197 = 0;
        goto LABEL_281;
      }
      loga = (os_log_t)objc_msgSend_newEstimatorWithURL_uti_imageSource_(IMTranscoderImageSizeEstimator, v222, (uint64_t)v18, (uint64_t)v19, (uint64_t)v188, v223, v224);
      if (a6 != 1)
      {
        v231 = 0;
        v216 = 1;
        goto LABEL_177;
      }
      if ((v226 & 1) != 0)
      {
        v230 = 0;
        v408 = 0;
LABEL_137:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v257 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v408;
            *(_WORD *)&buf[22] = 2048;
            v431 = v230;
            _os_log_impl(&dword_21DFB1000, v257, OS_LOG_TYPE_INFO, " File size of file %@ with error %@   (%llu bytes)", buf, 0x20u);
          }

        }
        objc_msgSend_firstObject(v22, v251, v252, v253, v254, v255, v256);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        v265 = v230 < objc_msgSend_longValue(v258, v259, v260, v261, v262, v263, v264);

        if (v265)
        {
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BDC17C0]))
          {
            v266 = CGImageSourceCopyPropertiesAtIndex(v188, 0, 0);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v272 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v266;
                _os_log_impl(&dword_21DFB1000, v272, OS_LOG_TYPE_INFO, "  This is a JPEG, checking properties: %@", buf, 0xCu);
              }

            }
            objc_msgSend_objectForKey_(v266, v267, *MEMORY[0x24BDD9698], v268, v269, v270, v271);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            v280 = objc_msgSend_intValue(v273, v274, v275, v276, v277, v278, v279);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v281 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v281, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v280;
                *(_WORD *)&buf[8] = 2112;
                *(_QWORD *)&buf[10] = v273;
                _os_log_impl(&dword_21DFB1000, v281, OS_LOG_TYPE_INFO, "  Image orientation is: %d  (%@)", buf, 0x12u);
              }

            }
            v216 = v280 != 0;

          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v292 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v292, OS_LOG_TYPE_INFO, "  Image still might requiree transcoding", buf, 2u);
              }

            }
            v216 = 1;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v293 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v293, OS_LOG_TYPE_INFO))
            {
              v294 = CFSTR("NO");
              if (v216)
                v294 = CFSTR("YES");
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v294;
              _os_log_impl(&dword_21DFB1000, v293, OS_LOG_TYPE_INFO, " File still requires transcoding: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v282 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21DFB1000, v282, OS_LOG_TYPE_INFO, " File is too large, we'll need to transcode it", buf, 2u);
            }

          }
          v216 = 1;
        }

        if (!IMMMSRestrictedModeEnabled())
        {
LABEL_176:
          v231 = 0;
          if (!v216)
            goto LABEL_186;
          goto LABEL_177;
        }
        v231 = UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BDC1780]) != 0;
        if (!v216)
          goto LABEL_186;
LABEL_177:
        if (!v231)
        {
          if (objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v210, (uint64_t)v21, *MEMORY[0x24BE50DC8], v213, v214, v215))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v296 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v19;
                _os_log_impl(&dword_21DFB1000, v296, OS_LOG_TYPE_INFO, "Transcoding Genmoji to single frame PNG, original uti: %@", buf, 0xCu);
              }

            }
            objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v295, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, *MEMORY[0x24BDC1820], 1, loga, a12, v418);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v197, v297, v298, v299, v300, v301, v302))
            {
              if (v197)
                goto LABEL_259;
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v319 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v319, OS_LOG_TYPE_INFO, "Couldn't fit genmoji image into any size of PNG", buf, 2u);
                }

              }
            }
          }
          if (a6 == 1 && (IMMMSRestrictedModeEnabled() & 1) != 0)
            goto LABEL_254;
          Count = CGImageSourceGetCount(v188);
          objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v321, v322, v323, v324, v325, v326);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          isHighQualityPhotosEnabled = objc_msgSend_isHighQualityPhotosEnabled(v327, v328, v329, v330, v331, v332, v333);

          if (shouldPreserveHEIFEncoding_target_sourceUTI)
          {
            v335 = Count > 1 ? 1 : isHighQualityPhotosEnabled;
            if (v335 != 1 || UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BE51360]))
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v336 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v336, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v19;
                  _os_log_impl(&dword_21DFB1000, v336, OS_LOG_TYPE_INFO, "Transcoding to HEIF, original uti: %@", buf, 0xCu);
                }

              }
              v337 = (id *)MEMORY[0x24BE51358];
              if (Count <= 1)
                v337 = (id *)MEMORY[0x24BE51350];
              v338 = *v337;
              LOBYTE(v407) = a12;
              LOBYTE(v406) = 0;
              objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v339, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v338, v406, loga, v407, v418);
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_count(v197, v340, v341, v342, v343, v344, v345))
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v346 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21DFB1000, v346, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of HEIF", buf, 2u);
                  }

                }
                v197 = 0;
              }

              goto LABEL_247;
            }
          }
          v347 = *MEMORY[0x24BDC1820];
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BDC1820]))
          {
            if (a12)
            {
              if (CGImageSourceGetCount(v188) == 1)
              {
                ImageAtIndex = CGImageSourceCreateImageAtIndex(v188, 0, 0);
                v350 = (void *)objc_opt_class();
                if (objc_msgSend__canConvertPNGToJPEG_(v350, v351, (uint64_t)ImageAtIndex, v352, v353, v354, v355))
                {
                  v356 = IMOSLoggingEnabled();
                  v347 = *MEMORY[0x24BDC17C0];
                  if (v356)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v357 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v357, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21DFB1000, v357, OS_LOG_TYPE_INFO, "We've got an opaque PNG, try to reencode as a JPEG", buf, 2u);
                    }

                  }
                }
                if (ImageAtIndex)
                  CFRelease(ImageAtIndex);
              }
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v368 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v368, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v368, OS_LOG_TYPE_INFO, "We've got a PNG, we'll try to preserve it since LQM is not enabled.", buf, 2u);
              }

            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v348, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v347, v406, loga, v407, v418);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v197, v369, v370, v371, v372, v373, v374))
              goto LABEL_247;
            if (!IMOSLoggingEnabled())
              goto LABEL_253;
            OSLogHandleForIMFoundationCategory();
            v367 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21DFB1000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of PNG", buf, 2u);
            }
            goto LABEL_252;
          }
          v358 = *MEMORY[0x24BDC1780];
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BDC1780]))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v360 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v360, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v360, OS_LOG_TYPE_INFO, "We've got a GIF, try to reencode as a GIF", buf, 2u);
              }

            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v359, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v358, v406, loga, v407, v418);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_count(v197, v361, v362, v363, v364, v365, v366))
            {
              if (!IMOSLoggingEnabled())
              {
LABEL_253:

                goto LABEL_254;
              }
              OSLogHandleForIMFoundationCategory();
              v367 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of GIF", buf, 2u);
              }
LABEL_252:

              goto LABEL_253;
            }
          }
          else
          {
            if (!UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x24BE51368]))
            {
LABEL_254:
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v376 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21DFB1000, v376, OS_LOG_TYPE_INFO, "Ok, let's see if we can fit this image into a JPEG", buf, 2u);
                }

              }
              LOBYTE(v407) = a12;
              LOBYTE(v406) = 0;
              objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v375, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, *MEMORY[0x24BDC17C0], v406, loga, v407, v418);
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v197)
              {
LABEL_260:
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v383 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v383, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21DFB1000, v383, OS_LOG_TYPE_INFO, "Image failed to transcode; falling back to original",
                      buf,
                      2u);
                  }

                }
                _IMTranscoderLinkFile(v18, v377, v378, v379, v380, v381, v382);
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                IMSingleObjectArray();
                v384 = objc_claimAutoreleasedReturnValue();

                v197 = (void *)v384;
LABEL_265:

                goto LABEL_266;
              }
LABEL_259:
              if (objc_msgSend_count(v197, v303, v304, v305, v306, v307, v308))
              {
LABEL_266:
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v391 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v391, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v197;
                    _os_log_impl(&dword_21DFB1000, v391, OS_LOG_TYPE_INFO, "We've reached the end of the image transcode attempt. outputURL = %@", buf, 0xCu);
                  }

                }
                if (v197 && objc_msgSend_count(v197, v385, v386, v387, v388, v389, v390))
                {
                  v201 = 0;
                  v202 = 1;
                }
                else
                {
                  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v385, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -7, 0, v389, v390);
                  v201 = (void *)objc_claimAutoreleasedReturnValue();
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v392 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v392, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v201;
                      _os_log_impl(&dword_21DFB1000, v392, OS_LOG_TYPE_INFO, "Failed to re-encode: %@", buf, 0xCu);
                    }

                  }
                  v202 = 0;
                }
                if (!v409)
                  CFRelease(v188);

LABEL_281:
                objc_msgSend_emitTranscodeEndFromUTI_(v418, v287, (uint64_t)v19, v288, v289, v290, v291);
                goto LABEL_282;
              }
              goto LABEL_260;
            }
            if (Count <= 1)
              v397 = *MEMORY[0x24BDC17C0];
            else
              v397 = v358;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v399 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v399, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v397;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = Count;
                _os_log_impl(&dword_21DFB1000, v399, OS_LOG_TYPE_INFO, "We've got a WebP, try to reencode as a %@ (frame count %zu)", buf, 0x16u);
              }

            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v398, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v397, v406, loga, v407, v418);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_count(v197, v400, v401, v402, v403, v404, v405))
            {
              if (!IMOSLoggingEnabled())
                goto LABEL_253;
              OSLogHandleForIMFoundationCategory();
              v367 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v397;
                _os_log_impl(&dword_21DFB1000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of %@", buf, 0xCu);
              }
              goto LABEL_252;
            }
          }
LABEL_247:
          if (v197)
            goto LABEL_259;
          goto LABEL_254;
        }
LABEL_186:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v315 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v315, OS_LOG_TYPE_INFO))
          {
            v316 = CFSTR("NO");
            if (v231)
              v317 = CFSTR("YES");
            else
              v317 = CFSTR("NO");
            if (v216)
              v316 = CFSTR("YES");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v317;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v316;
            _os_log_impl(&dword_21DFB1000, v315, OS_LOG_TYPE_INFO, "Didn't require transcode, defaulting to the original image MMSGIFCarrierTesting %@, needsTrancode %@", buf, 0x16u);
          }

        }
        _IMTranscoderLinkFile(v18, v309, v310, v311, v312, v313, v314);
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        IMSingleObjectArray();
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_265;
      }
LABEL_136:
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v210, v211, v212, v213, v214, v215);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v18, v233, v234, v235, v236, v237, v238);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v421 = 0;
      objc_msgSend_attributesOfItemAtPath_error_(v232, v240, (uint64_t)v239, (uint64_t)&v421, v241, v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v408 = v421;
      v230 = objc_msgSend_fileSize(v244, v245, v246, v247, v248, v249, v250);

      goto LABEL_137;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v154 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v154, OS_LOG_TYPE_INFO, "This is a WBMP, converting to JPEG first", buf, 2u);
      }

    }
    v155 = objc_alloc(MEMORY[0x24BDBCE50]);
    v161 = (void *)objc_msgSend_initWithContentsOfURL_(v155, v156, (uint64_t)v18, v157, v158, v159, v160);
    if (!objc_msgSend_length(v161, v162, v163, v164, v165, v166, v167) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v168 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_21DFB1000, v168, OS_LOG_TYPE_INFO, "Failing, Empty data created from URL: %@", buf, 0xCu);
      }

    }
    if (v161 && (v169 = (CGImage *)CGImageCreateWithWBMPData()) != 0)
    {
      values[3] = 0;
      valuePtr = 0x3FF0000000000000;
      v170 = *MEMORY[0x24BDD9220];
      v431 = 0;
      *(_QWORD *)buf = v170;
      values[0] = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      *(_QWORD *)&buf[8] = *MEMORY[0x24BDD9218];
      Width = CGImageGetWidth(v169);
      Height = CGImageGetHeight(v169);
      if (Width <= Height)
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v173, Height, v174, v175, v176, v177);
      else
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v173, Width, v174, v175, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      values[1] = (void *)CFRetain(v178);

      *(_QWORD *)&buf[16] = *MEMORY[0x24BDD9238];
      values[2] = (void *)CFRetain(MEMORY[0x24BDBD1C8]);
      v179 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v180 = 2;
      do
      {
        CFRelease(values[v180]);
        v181 = v180-- + 1;
      }
      while (v181 > 1);
      v182 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v183 = v182;
      if (v182)
      {
        v184 = CGImageDestinationCreateWithData(v182, CFSTR("public.jpeg"), 1uLL, 0);
        v185 = v184;
        if (v184)
        {
          CGImageDestinationAddImage(v184, v169, v179);
          if (CGImageDestinationFinalize(v185))
          {
            CFRelease(v185);
            CFRelease(v179);
            v186 = v183;

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v187 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21DFB1000, v187, OS_LOG_TYPE_INFO, "Created source from JPEG converted data", buf, 2u);
              }

            }
            v188 = CGImageSourceCreateWithData(v186, 0);
            CFRelease(v169);
            goto LABEL_102;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v425 = 0;
              _os_log_impl(&dword_21DFB1000, log, OS_LOG_TYPE_INFO, "Failed finalizing image destination from WBMP", v425, 2u);
            }

          }
          CFRelease(v185);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v205 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v425 = 0;
            _os_log_impl(&dword_21DFB1000, v205, OS_LOG_TYPE_INFO, "Failed creating image destination with data", v425, 2u);
          }

        }
      }
      CFRelease(v179);

      if (!IMOSLoggingEnabled())
      {
        v188 = 0;
        v186 = v169;
        goto LABEL_102;
      }
      v204 = 0;
      v186 = v169;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v203 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v203, OS_LOG_TYPE_INFO, "Failing to create jpeg from WBMP, no image ref passed in", buf, 2u);
        }

      }
      v186 = 0;
      if ((IMOSLoggingEnabled() & 1) == 0)
      {
        v188 = 0;
        goto LABEL_103;
      }
      v204 = 1;
    }
    OSLogHandleForIMFoundationCategory();
    v206 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v206, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFB1000, v206, OS_LOG_TYPE_INFO, "Failed converting WBMP to JPEG", buf, 2u);
    }

    v188 = 0;
    if ((v204 & 1) != 0)
    {
LABEL_103:

      if (v18)
      {
        if (v188)
        {
          loga = (os_log_t)objc_msgSend_newEstimatorWithURL_uti_imageSource_(IMTranscoderImageSizeEstimator, v207, (uint64_t)v18, (uint64_t)v19, (uint64_t)v188, v208, v209);
          v409 = 0;
          if (a6 != 1)
          {
            v216 = 1;
            goto LABEL_176;
          }
          goto LABEL_136;
        }
        goto LABEL_107;
      }
      goto LABEL_113;
    }
LABEL_102:
    CFRelease(v186);
    goto LABEL_103;
  }
  objc_msgSend_emitSignpostTranscodeSkipSourceUTI_(v418, v143, (uint64_t)v19, v144, v145, v146, v147);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v195 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFB1000, v195, OS_LOG_TYPE_INFO, "Image ended up not needing a transcode operation", buf, 2u);
    }

  }
  _IMTranscoderLinkFile(v18, v189, v190, v191, v192, v193, v194);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  v201 = 0;
  v202 = 1;
LABEL_282:
  objc_msgSend__getScaleFactorArray_transferURL_outputURLs_(self, v198, (uint64_t)v19, (uint64_t)v18, (uint64_t)v197, v199, v200);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v394 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v394, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v393;
      _os_log_impl(&dword_21DFB1000, v394, OS_LOG_TYPE_INFO, "scaleFactorArray = %@", buf, 0xCu);
    }

  }
  v395 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v396 = v393;
  if (v396)
    CFDictionarySetValue(v395, (const void *)*MEMORY[0x24BE510C8], v396);

  if (v416)
    (*((void (**)(id, const __CFURL *, void *, _QWORD, void *, uint64_t, _QWORD, __CFDictionary *))v416 + 2))(v416, v18, v197, 0, v201, v202, v415, v395);

}

- (id)_imMetricsCollectorForLQMQualityEstimatorModel:(__CFString *)a3 suggestedMaxLength:(unint64_t)a4 shouldUseQualityEstimatorModel:(BOOL)a5 inputImageFeatures:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v6 = a5;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (UTTypeConformsTo(a3, CFSTR("public.heic")))
  {
    objc_msgSend__imMetricsCollectorForLQMQualityEstimatorModeImageTypeHEIC_shouldUseQualityEstimatorModel_inputImageFeatures_metricsDict_(self, v12, a4, v6, (uint64_t)v10, (uint64_t)v11, v13);
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v14, 1, v15, v16, v17, v18);
  }
  else if (UTTypeConformsTo(a3, CFSTR("public.png")))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v19, 2, v20, v21, v22, v23);
  }
  else if (UTTypeConformsTo(a3, CFSTR("public.jpeg")))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v24, 3, v25, v26, v27, v28);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x24BDC1780]))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v29, 4, v30, v31, v32, v33);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x24BDC1858]))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v34, 6, v35, v36, v37, v38);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x24BE51368]))
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v39, 5, v40, v41, v42, v43);
  }
  else
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v39, 7, v40, v41, v42, v43);
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v11, v45, (uint64_t)v44, *MEMORY[0x24BE50EF0], v46, v47, v48);

  return v11;
}

- (void)_imMetricsCollectorForLQMQualityEstimatorModeImageTypeHEIC:(unint64_t)a3 shouldUseQualityEstimatorModel:(BOOL)a4 inputImageFeatures:(id)a5 metricsDict:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  int v104;
  unint64_t v105;
  uint64_t v106;

  v7 = a4;
  v106 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, a3, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_containsObject_(&unk_24E202C68, v17, (uint64_t)v16, v18, v19, v20, v21);

  if (v22)
    v23 = !v7;
  else
    v23 = 1;
  if (!v23)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        v104 = 134217984;
        v105 = a3;
        _os_log_impl(&dword_21DFB1000, v97, OS_LOG_TYPE_INFO, "Quality estimator model used, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
      }

    }
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v92, 3, v93, v94, v95, v96);
    v98 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v86 = (void *)v98;
    objc_msgSend_setObject_forKey_(v10, v99, v98, *MEMORY[0x24BE50EF8], v100, v101, v102);
    goto LABEL_26;
  }
  v24 = IMOSLoggingEnabled();
  if (!v9 || ((v22 | !v7) & 1) == 0)
  {
    if (v24)
    {
      OSLogHandleForIMFoundationCategory();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        v104 = 134217984;
        v105 = a3;
        _os_log_impl(&dword_21DFB1000, v103, OS_LOG_TYPE_INFO, "Legacy model used without fallback, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
      }

    }
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v25, 1, v26, v27, v28, v29);
    v98 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (v24)
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v104 = 134217984;
      v105 = a3;
      _os_log_impl(&dword_21DFB1000, v30, OS_LOG_TYPE_INFO, "Legacy model used with fallback, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
    }

  }
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v25, 2, v26, v27, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v32, (uint64_t)v31, *MEMORY[0x24BE50EF8], v33, v34, v35);

  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectForKey_(v9, v37, (uint64_t)CFSTR("Input File Size"), v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_intValue(v42, v43, v44, v45, v46, v47, v48);
  v55 = v49 + 0xFFFFF;
  if (v49 >= 0)
    v55 = v49;
  objc_msgSend_numberWithInteger_(v36, v50, (uint64_t)v55 >> 20, v51, v52, v53, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v57, (uint64_t)v56, *MEMORY[0x24BE50EE8], v58, v59, v60);

  objc_msgSend_objectForKey_(v9, v61, (uint64_t)CFSTR("Input Entropy"), v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v67, (uint64_t)v66, *MEMORY[0x24BE50EE0], v68, v69, v70);

  objc_msgSend_objectForKey_(v9, v71, (uint64_t)CFSTR("Input Height"), v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v77, (uint64_t)v76, *MEMORY[0x24BE50ED8], v78, v79, v80);

  objc_msgSend_objectForKey_(v9, v81, (uint64_t)CFSTR("Aspect Ratio"), v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v87, (uint64_t)v86, *MEMORY[0x24BE50ED0], v88, v89, v90);
LABEL_26:

}

+ (BOOL)_canConvertPNGToJPEG:(CGImage *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend__imageContainsTranslucentPixels_(a1, a2, (uint64_t)a3, v3, v4, v5, v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("YES");
      if (v7)
        v9 = CFSTR("NO");
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "PNG can be converted to JPG: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v7 ^ 1;
}

+ (BOOL)_imageContainsTranslucentPixels:(CGImage *)a3
{
  CGImageAlphaInfo AlphaInfo;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  size_t BitsPerComponent;
  size_t v9;
  NSObject *v10;
  size_t Width;
  size_t Height;
  size_t v13;
  unint64_t v14;
  char v15;
  size_t v16;
  NSObject *v17;
  unint64_t v19;
  int v20;
  NSObject *v21;
  __int16 *v22;
  CGColorSpace *DeviceRGB;
  uint32_t v24;
  CGContext *v25;
  CGContext *v26;
  size_t v27;
  __int16 *v28;
  unsigned __int8 *v29;
  unsigned __int8 *v30;
  __int16 *v31;
  size_t v32;
  NSObject *v33;
  const __CFString *v34;
  NSObject *v35;
  int v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;
  CGRect v41;

  v40 = *MEMORY[0x24BDAC8D0];
  AlphaInfo = CGImageGetAlphaInfo(a3);
  if (AlphaInfo > kCGImageAlphaOnly)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_21DFB1000, v5, OS_LOG_TYPE_INFO, "Image alpha channel unknown, translucency check may fail", (uint8_t *)&v36, 2u);
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (((1 << AlphaInfo) & 0x61) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_21DFB1000, v6, OS_LOG_TYPE_INFO, "Image has no alpha channel, assuming opaque", (uint8_t *)&v36, 2u);
        }

      }
      return 0;
    }
    if (((1 << AlphaInfo) & 0x98) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_21DFB1000, v5, OS_LOG_TYPE_INFO, "Image has alpha channel, checking for translucent pixels", (uint8_t *)&v36, 2u);
        }
LABEL_20:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_21DFB1000, v5, OS_LOG_TYPE_INFO, "Image has premultiplied alpha channel, checking for translucent pixels", (uint8_t *)&v36, 2u);
      }
      goto LABEL_20;
    }
  }
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (BitsPerComponent >= 9)
    v9 = 16;
  else
    v9 = 8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v36 = 134218240;
      v37 = BitsPerComponent;
      v38 = 2048;
      v39 = v9;
      _os_log_impl(&dword_21DFB1000, v10, OS_LOG_TYPE_INFO, " ==> Image has %ld bits per component, using %ld bpc for test", (uint8_t *)&v36, 0x16u);
    }

  }
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v13 = Height;
  if (BitsPerComponent < 9)
    v14 = 1;
  else
    v14 = 8;
  if (BitsPerComponent >= 9)
    v15 = 3;
  else
    v15 = 0;
  if (!is_mul_ok(Width, Height) || (v16 = Width * Height, !is_mul_ok(Width * Height, v14)))
  {
    if (!IMOSLoggingEnabled())
      return 1;
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v36 = 134218240;
      v37 = Width;
      v38 = 2048;
      v39 = v13;
      _os_log_impl(&dword_21DFB1000, v17, OS_LOG_TYPE_INFO, "_imageContainsTranslucentPixels overflowed with %ld width and %ld height", (uint8_t *)&v36, 0x16u);
    }
LABEL_39:

    return 1;
  }
  v19 = v16 * v14;
  v20 = IMOSLoggingEnabled();
  if (v16 * v14 > 0x2FAF080)
  {
    if (!v20)
      return 1;
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v36 = 134217984;
      v37 = v19 / 0xF4240;
      _os_log_impl(&dword_21DFB1000, v17, OS_LOG_TYPE_INFO, "Translucency buffer size (%ld MB) exceeds maximum, cannot test pixels, assuming YES", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_39;
  }
  if (v20)
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v36 = 134218240;
      v37 = v19 / 0xF4240uLL;
      v38 = 2048;
      v39 = v19 / 0x3E8uLL;
      _os_log_impl(&dword_21DFB1000, v21, OS_LOG_TYPE_INFO, " ==> Attempting to allocate opacity test buffer of size %ld MB (%ld KB)", (uint8_t *)&v36, 0x16u);
    }

  }
  v22 = (__int16 *)malloc_type_calloc(Width * v13, v14, 0x53E85CFDuLL);
  if (!v22)
  {
    if (!IMOSLoggingEnabled())
      return 1;
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_21DFB1000, v17, OS_LOG_TYPE_INFO, "Failed to allocate buffer for image translucency test", (uint8_t *)&v36, 2u);
    }
    goto LABEL_39;
  }
  if (BitsPerComponent >= 9)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v24 = 1;
  }
  else
  {
    DeviceRGB = 0;
    v24 = 7;
  }
  v25 = CGBitmapContextCreate(v22, Width, v13, v9, Width << v15, DeviceRGB, v24);
  v26 = v25;
  if (!v25)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_21DFB1000, v35, OS_LOG_TYPE_INFO, "Failed to create bitmap context while checking translucency of image, returning YES", (uint8_t *)&v36, 2u);
      }

    }
    if (DeviceRGB)
      CFRelease(DeviceRGB);
    return 1;
  }
  v41.size.width = (double)Width;
  v41.size.height = (double)v13;
  v41.origin.x = 0.0;
  v41.origin.y = 0.0;
  CGContextDrawImage(v25, v41, a3);
  if (v13)
  {
    v27 = 0;
    v28 = v22 + 3;
    v7 = 1;
    v29 = (unsigned __int8 *)v22;
    do
    {
      if (Width)
      {
        v30 = v29;
        v31 = v28;
        v32 = Width;
        do
        {
          if (BitsPerComponent > 8)
          {
            if (*v31 != -1)
              goto LABEL_71;
          }
          else if (*v30 != 255)
          {
            goto LABEL_71;
          }
          v31 += 4;
          ++v30;
          --v32;
        }
        while (v32);
      }
      ++v27;
      v28 += 4 * Width;
      v29 += Width;
      v7 = v27 < v13;
    }
    while (v27 != v13);
  }
  v7 = 0;
LABEL_71:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = CFSTR("NO");
      if (v7)
        v34 = CFSTR("YES");
      v36 = 138412290;
      v37 = (unint64_t)v34;
      _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "Found translucent pixel(s) in image: %@", (uint8_t *)&v36, 0xCu);
    }

  }
  CFRelease(v26);
  if (DeviceRGB)
    CFRelease(DeviceRGB);
  free(v22);
  return v7;
}

- (double)overrideJPEGCompressionQuality
{
  return self->_overrideJPEGCompressionQuality;
}

- (void)setOverrideJPEGCompressionQuality:(double)a3
{
  self->_overrideJPEGCompressionQuality = a3;
}

@end
