@implementation CHMutableTextInputTargetContentInfo

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger active;
  const char *v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char isSingleLine;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *CharacterLevelPosition;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char isCursorStrong;
  NSUInteger v110;
  NSUInteger v111;
  NSUInteger v112;
  NSUInteger v113;
  const void *v114;
  NSUInteger v115;
  NSUInteger v116;
  void *v117;
  unint64_t v118;
  void *v119;
  CHTextInputTargetContentInfo *v120;

  v120 = [CHTextInputTargetContentInfo alloc];
  objc_msgSend_textInputTarget(self, v4, v5, v6, v7, v8);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend_textContentLength(self, v9, v10, v11, v12, v13);
  objc_msgSend_referenceSubstring(self, v14, v15, v16, v17, v18);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_referenceSubstringRange(self, v19, v20, v21, v22, v23);
  v115 = (NSUInteger)v25;
  v116 = v24;
  v114 = (const void *)objc_msgSend_characterRectsInReferenceSubstring(self, v25, v26, v27, v28, v29);
  v35 = objc_msgSend_strokeCoveredTextRange(self, v30, v31, v32, v33, v34);
  v112 = (NSUInteger)v36;
  v113 = v35;
  v41 = objc_msgSend_selectedTextRange(self, v36, v37, v38, v39, v40);
  v110 = (NSUInteger)v42;
  v111 = v41;
  isCursorStrong = objc_msgSend_isCursorStrong(self, v42, v43, v44, v45, v46);
  active = objc_msgSend_activePreviewRange(self, v47, v48, v49, v50, v51);
  v54 = (NSUInteger)v53;
  v59 = objc_msgSend_contentType(self, v53, v55, v56, v57, v58);
  v65 = objc_msgSend_autoCapitalizationMode(self, v60, v61, v62, v63, v64);
  v71 = objc_msgSend_autoCorrectionMode(self, v66, v67, v68, v69, v70);
  v77 = (void *)objc_msgSend_baseWritingDirection(self, v72, v73, v74, v75, v76);
  isSingleLine = objc_msgSend_isSingleLine(self, v78, v79, v80, v81, v82);
  CharacterLevelPosition = (void *)objc_msgSend_lastCharacterLevelPosition(self, v84, v85, v86, v87, v88);
  objc_msgSend_protectedCharacterIndexes(self, v90, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = sub_1BE6A4994(v120, v119, v118, v117, v116, v115, v114, v96, v113, v112, v111, v110, isCursorStrong, active, v54, v59, v65, v71, v77,
          isSingleLine,
          CharacterLevelPosition,
          v95);

  *((_BYTE *)v97 + 89) = objc_msgSend_containsCommittedStrokes(self, v98, v99, v100, v101, v102);
  *((_BYTE *)v97 + 137) = objc_msgSend_supportsAutoLineBreaks(self, v103, v104, v105, v106, v107);
  return v97;
}

- (_NSRange)referenceSubstringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->super._referenceSubstringRange.length;
  location = self->super._referenceSubstringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)characterRectsInReferenceSubstring
{
  return self->super._characterRectsInReferenceSubstring;
}

- (id)referenceSubstring
{
  return self->super._referenceSubstring;
}

- (void)setTextInputTarget:(id)a3
{
  CHTextInputTarget *v5;
  CHTextInputTarget **p_textInputTarget;
  CHTextInputTarget *textInputTarget;
  CHTextInputTarget *v8;

  v5 = (CHTextInputTarget *)a3;
  textInputTarget = self->super._textInputTarget;
  p_textInputTarget = &self->super._textInputTarget;
  if (textInputTarget != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_textInputTarget, a3);
    v5 = v8;
  }

}

- (void)setTextContentLength:(int64_t)a3
{
  self->super._textContentLength = a3;
}

- (void)setStrokeCoveredTextRange:(_NSRange)a3
{
  self->super._strokeCoveredTextRange = a3;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  self->super._selectedTextRange = a3;
}

- (void)setIsCursorStrong:(BOOL)a3
{
  self->super._isCursorStrong = a3;
}

- (void)setContainsCommittedStrokes:(BOOL)a3
{
  self->super._containsCommittedStrokes = a3;
}

- (void)setActivePreviewRange:(_NSRange)a3
{
  self->super._activePreviewRange = a3;
}

- (void)setContentType:(int)a3
{
  self->super._contentType = a3;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  self->super._autoCapitalizationMode = a3;
}

- (void)setAutoCorrectionMode:(int)a3
{
  self->super._autoCorrectionMode = a3;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(_QWORD *)&self->super._isSingleLine = *(_QWORD *)&a3;
}

- (void)setIsSingleLine:(BOOL)a3
{
  LOBYTE(self->super._lastCharacterLevelPosition) = a3;
}

- (void)setSupportsAutoLineBreaks:(BOOL)a3
{
  BYTE1(self->super._lastCharacterLevelPosition) = a3;
}

- (void)setLastCharacterLevelPosition:(int64_t)a3
{
  self->super._protectedCharacterIndexes = (NSIndexSet *)a3;
}

- (void)setProtectedCharacterIndexes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v7;
  Class isa;

  if (self[1].super.super.isa != a3)
  {
    v7 = (objc_class *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
    isa = self[1].super.super.isa;
    self[1].super.super.isa = v7;

  }
}

- (void)setReferenceSubstring:(id)a3 range:(_NSRange)a4 characterRects:(CGRect *)a5
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  NSString *referenceSubstring;
  NSObject *v23;
  void *v24;
  CGRect *characterRectsInReferenceSubstring;
  CGRect *v26;
  int v27;
  void *v28;
  uint64_t v29;

  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = (NSString *)a3;
  if (objc_msgSend_length(v9, v10, v11, v12, v13, v14) != length)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v20 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_FAULT, "The referenceSubstring length must be equal to the range that it covers", (uint8_t *)&v27, 2u);
    }

  }
  self->super._referenceSubstringRange.location = location;
  self->super._referenceSubstringRange.length = length;
  if (self->super._referenceSubstring != v9)
  {
    v21 = (NSString *)objc_msgSend_copy(v9, v15, v16, v17, v18, v19);
    referenceSubstring = self->super._referenceSubstring;
    self->super._referenceSubstring = v21;

    length = self->super._referenceSubstringRange.length;
  }
  if (length)
  {
    if (!a5)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v23 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        NSStringFromRange(self->super._referenceSubstringRange);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v24;
        _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_FAULT, "charRectsInReferenceSubstring cannot be NULL for referenceSubstringRange: %@", (uint8_t *)&v27, 0xCu);

      }
    }
    characterRectsInReferenceSubstring = self->super._characterRectsInReferenceSubstring;
    if (characterRectsInReferenceSubstring != a5)
    {
      if (characterRectsInReferenceSubstring)
        free(characterRectsInReferenceSubstring);
      v26 = (CGRect *)malloc_type_calloc(self->super._referenceSubstringRange.length, 0x20uLL, 0x1000040E0EAB150uLL);
      self->super._characterRectsInReferenceSubstring = v26;
      memcpy(v26, a5, 32 * self->super._referenceSubstringRange.length);
    }
  }

}

@end
