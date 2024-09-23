@implementation NSTextContainer(CKBalloonTextView)

- (CGFloat)sizeThatFits:()CKBalloonTextView textAlignmentInsets:isSingleLine:
{
  void *v7;
  void *v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double MaxY;
  double v28;
  double v29;
  NSObject *v30;
  id v31;
  CGFloat v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat height;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  NSObject *v59;
  id v60;
  CGFloat v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  int v66;
  NSObject *v67;
  void *v68;
  CGSize size;
  uint64_t v71;
  _QWORD v72[2];
  uint8_t buf[4];
  double v74;
  __int16 v75;
  id v76;
  __int16 v77;
  CGFloat v78;
  __int16 v79;
  double v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;
  CGSize v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ensureLayoutForTextContainer:", a1);
  objc_msgSend(v7, "glyphRangeForTextContainer:", a1);
  objc_msgSend(v7, "usedRectForTextContainer:", a1);
  size.width = v9;
  v11 = v10;
  if (!objc_msgSend(v8, "length") || !(a3 | a4))
    goto LABEL_42;
  v72[0] = 0;
  v72[1] = 0;
  objc_msgSend(v7, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", 0, v72);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0DC1348], "sharedSystemTypesetter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "baselineOffsetInLayoutManager:glyphIndex:", v7, 0);
  v22 = v21;

  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1170], 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  v85.origin.x = v13;
  v85.origin.y = v15;
  v85.size.width = v17;
  v85.size.height = v19;
  MaxY = CGRectGetMaxY(v85);
  objc_msgSend(v26, "capHeight");
  v29 = MaxY - v22 - v28;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v86.origin.x = v13;
      v86.origin.y = v15;
      v86.size.width = v17;
      v86.size.height = v19;
      NSStringFromCGRect(v86);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v87.origin.x = v13;
      v87.origin.y = v15;
      v87.size.width = v17;
      v87.size.height = v19;
      v32 = CGRectGetMaxY(v87);
      objc_msgSend(v26, "capHeight");
      *(_DWORD *)buf = 134219010;
      v74 = v29;
      v75 = 2112;
      v76 = v31;
      v77 = 2048;
      v78 = v32;
      v79 = 2048;
      v80 = v22;
      v81 = 2048;
      v82 = v33;
      _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "capOffsetFromBoundsTop (%f) = (CGRectGetMaxY(firstLine (%@)) (%f) - firstLineBaselineOffset (%f) - [font capHeight] (%f))", buf, 0x34u);

    }
  }
  v34 = objc_msgSend(v7, "numberOfGlyphs");
  if (v34)
  {
    size.height = 0.0;
    v71 = 0;
    v35 = objc_msgSend(a1, "maximumNumberOfLines");
    if (v35)
    {
      v36 = 0;
      v37 = *MEMORY[0x1E0C9D648];
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v41 = *MEMORY[0x1E0C9D820];
      v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v43 = 1;
      do
      {
        objc_msgSend(v7, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v36, &size.height);
        if (v46 != v41 || v47 != v42)
        {
          v37 = v44;
          v38 = v45;
          v39 = v46;
          v40 = v47;
        }
        height = size.height;
        v36 = v71 + *(_QWORD *)&size.height;
      }
      while (v71 + *(_QWORD *)&size.height < v34 && v43++ < v35);
    }
    else
    {
      *(_QWORD *)&height = v34 - 1;
      objc_msgSend(v7, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v34 - 1, &size.height);
      v37 = v52;
      v38 = v53;
      v39 = v54;
      v40 = v55;
    }
    objc_msgSend(MEMORY[0x1E0DC1348], "sharedSystemTypesetter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "baselineOffsetInLayoutManager:glyphIndex:", v7, *(_QWORD *)&height);
    v58 = v57;

    v88.origin.x = v37;
    v88.origin.y = v38;
    v88.size.width = v39;
    v88.size.height = v40;
    v51 = CGRectGetMaxY(v88) - v58;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v89.origin.x = v37;
        v89.origin.y = v38;
        v89.size.width = v39;
        v89.size.height = v40;
        NSStringFromCGRect(v89);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v90.origin.x = v37;
        v90.origin.y = v38;
        v90.size.width = v39;
        v90.size.height = v40;
        v61 = CGRectGetMaxY(v90);
        *(_DWORD *)buf = 134218754;
        v74 = v51;
        v75 = 2112;
        v76 = v60;
        v77 = 2048;
        v78 = v61;
        v79 = 2048;
        v80 = v58;
        _os_log_impl(&dword_18DFCD000, v59, OS_LOG_TYPE_INFO, "lastLineBaselineOffsetFromBoundsTop (%f) = (CGRectGetMaxY(lastLine (%@)) (%f) - lastLineBaselineOffset (%f))", buf, 0x2Au);

      }
    }
    LOBYTE(v34) = v71 == v34;
    if (!a3)
      goto LABEL_36;
    goto LABEL_32;
  }
  v51 = 0.0;
  if (a3)
  {
LABEL_32:
    objc_msgSend(a1, "lineFragmentPadding");
    *(double *)a3 = v29;
    *(_QWORD *)(a3 + 8) = v62;
    *(double *)(a3 + 16) = v11 - v51;
    *(_QWORD *)(a3 + 24) = v62;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        NSStringFromUIEdgeInsets(*(UIEdgeInsets *)a3);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = *(double *)&v64;
        _os_log_impl(&dword_18DFCD000, v63, OS_LOG_TYPE_INFO, "-> textAlignmentInsets: %@", buf, 0xCu);

      }
    }
  }
LABEL_36:
  if (a4)
  {
    *(_BYTE *)a4 = v34;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67109120;
        LODWORD(v74) = v66;
        _os_log_impl(&dword_18DFCD000, v65, OS_LOG_TYPE_INFO, "-> isSingleLine: %d", buf, 8u);
      }

    }
  }

LABEL_42:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      v84.width = size.width;
      v84.height = v11;
      NSStringFromCGSize(v84);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = *(double *)&v68;
      _os_log_impl(&dword_18DFCD000, v67, OS_LOG_TYPE_INFO, "-> sizeThatFits %@", buf, 0xCu);

    }
  }

  return size.width;
}

@end
