@implementation ICTextContentStorageDelegate

- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  _QWORD *v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  BOOL v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  BOOL v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke;
    v69[3] = &unk_1EA7DF1A8;
    v70 = v6;
    objc_msgSend(v7, "setMarkerTextAttributeOverrides:", v69);

  }
  if (!ICInternalSettingsIsCollapsibleSectionsEnabled())
    goto LABEL_8;
  objc_msgSend(v7, "textContentManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLayoutManagers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ic_containsObjectPassingTest:", &__block_literal_global_8);

  if ((v10 & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "isEmpty") & 1) == 0)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentRange");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "offsetFromLocation:toLocation:", v17, v18);

    objc_msgSend(v16, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "uuid");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v45 = 1;
      goto LABEL_30;
    }
    v23 = (void *)v22;
    v68 = v21;
    objc_msgSend(v21, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v16, "isUUIDHidden:", v24);

    if (!v25)
    {
      v45 = 1;
LABEL_29:
      v21 = v68;
LABEL_30:

      if (!v45)
        goto LABEL_9;
      goto LABEL_8;
    }
    objc_opt_class();
    objc_opt_class();
    ICDynamicCast();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v67 = v16;
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "documentRange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "location");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v6, "offsetFromLocation:toLocation:", v30, v31);

    v33 = (void *)v28;
    v16 = v67;
    objc_msgSend(v33, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "substringWithRange:", v19, v32 - v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v35, "ic_containsNonWhitespaceCharacters") & 1) == 0)
    {
      objc_msgSend(v33, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length");
      v38 = v32 + 1;

      if (v37 > v38)
      {
        v66 = v33;
        objc_msgSend(v33, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v38, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "outlineController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uuid");
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v42 = (void *)v41;
          v65 = v40;
          objc_msgSend(v39, "uuid");
          v43 = v39;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v67, "isUUIDHidden:", v44))
          {

            v39 = v43;
            v40 = v65;
          }
          else
          {
            objc_msgSend(v43, "uuid");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v64) = objc_msgSend(v65, "isUUIDCollapsible:", v46);

            v47 = (_QWORD *)MEMORY[0x1E0D63928];
            v39 = v43;
            v40 = v65;
            if ((_DWORD)v64)
            {
              objc_msgSend(v68, "uuid");
              v64 = v39;
              v48 = v47;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "closestVisibleAncestorForUUID:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "attribute:atIndex:effectiveRange:", *v48, objc_msgSend(v65, "rangeForUUID:", v50), 0);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v48) = objc_msgSend(v64, "style");
              v52 = objc_msgSend(v51, "style");

              v53 = v48 >= v52;
              v39 = v64;
              v40 = v65;
              if (!v53)
              {

                LOBYTE(v14) = 1;
                v33 = v66;
LABEL_28:

                v45 = 0;
                goto LABEL_29;
              }
            }
          }
        }

        v33 = v66;
      }
    }
    objc_msgSend(v67, "textStorage", v64);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "alwaysEnumerateTrailingParagraph");

    if (!v55)
      goto LABEL_27;
    objc_msgSend(v6, "documentRange");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "location");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endLocation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v33;
    v60 = objc_msgSend(v6, "offsetFromLocation:toLocation:", v57, v58);

    objc_msgSend(v67, "textStorage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "length");

    v63 = v60 == v62;
    v33 = v59;
    v16 = v67;
    if (v63)
      LOBYTE(v14) = 1;
    else
LABEL_27:
      LOBYTE(v14) = 0;
    goto LABEL_28;
  }

LABEL_8:
  LOBYTE(v14) = 1;
LABEL_9:

  return v14 & 1;
}

id __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "documentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "offsetFromLocation:toLocation:", v9, v11);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v7, "elementRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "endLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "offsetFromLocation:toLocation:", v15, v17);

  if (v18)
  {
    objc_opt_class();
    objc_opt_class();
    ICDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v12, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v21, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], v12, 0);
    v24 = v5;
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v21, "styler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0D64D60];
    objc_msgSend(v27, "zoomController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "zoomFactor");
    v47 = (void *)v25;
    v48 = (void *)v22;
    v30 = v25;
    v5 = v24;
    objc_msgSend(v28, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v30, v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v31, "objectForKeyedSubscript:", v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v23);

    v34 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, v34);

    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC1160]);
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC1248]);
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC11A8]);
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC1100]);
    v36 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
      v39 = v37;
    else
      v39 = objc_alloc_init(MEMORY[0x1E0DC1290]);
    v40 = v39;

    v41 = (void *)objc_msgSend(v40, "mutableCopy");
    objc_msgSend(v27, "tabStopsForAttributedString:inRange:", v21, v12, v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTabStops:", v42);

    objc_msgSend(v41, "tabStops");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "location");
    objc_msgSend(v41, "setHeadIndent:");

    v45 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v45, v36);

  }
  else
  {
    v32 = v5;
  }

  return v32;
}

- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (**v27)(_QWORD);
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  NSUInteger v48;
  NSUInteger v49;
  _QWORD aBlock[4];
  id v51;
  uint64_t *v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = v6;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC10F8];
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], location, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v8;
    if (objc_msgSend(v10, "isList"))
    {
      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 0;
        goto LABEL_17;
      }
    }
    v42 = v12;
    v43 = v10;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__7;
    v59 = __Block_byref_object_dispose__7;
    v60 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke;
    aBlock[3] = &unk_1EA7DF210;
    v52 = &v55;
    v13 = v7;
    v51 = v13;
    v53 = location;
    v54 = length;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_opt_class();
    objc_msgSend(v13, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v44, "textViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "editorController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v20;
    objc_msgSend(v20, "calculateDocumentController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "ic_range");
    objc_msgSend(v21, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v22, v24, v25, location, 0);

    objc_msgSend(v13, "textStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke_2;
    v46[3] = &unk_1EA7DF238;
    v48 = location;
    v49 = length;
    v27 = v14;
    v47 = v27;
    objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", v42, location, length, 0, v46);

    objc_msgSend(v13, "attributedString");
    v10 = v43;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (objc_msgSend(v43, "style") == 4 && location + length == v29)
    {
      v14[2](v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x1E0DC1178];
      objc_msgSend(v30, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      ICDynamicCast();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "mutableCopy");

      objc_msgSend(v34, "setParagraphSpacing:", *MEMORY[0x1E0D64E30]);
      v14[2](v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "copy");
      objc_msgSend(v35, "addAttribute:value:range:", v31, v36, 0, length);

      v10 = v43;
    }
    v37 = (void *)v56[5];
    if (v37 && objc_msgSend(v37, "length") != length)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!updatedAttributedString || updatedAttributedString.length == range.length", "-[ICTextContentStorageDelegate textContentStorage:textParagraphWithRange:]", 1, 0, CFSTR("Text paragraph length has changed"));
    if (v56[5])
    {
      v38 = objc_alloc(MEMORY[0x1E0DC1310]);
      v39 = (void *)objc_msgSend((id)v56[5], "copy");
      v8 = (void *)objc_msgSend(v38, "initWithAttributedString:", v39);

    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v55, 8);
    goto LABEL_17;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

id __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedSubstringFromRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

uint64_t __86__ICTextContentStorageDelegate_textContentManager_shouldEnumerateTextElement_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "insideSiriSnippet");

  return v6;
}

void __74__ICTextContentStorageDelegate_textContentStorage_textParagraphWithRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  if (v7)
  {
    v12 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v12;
    if ((isKindOfClass & 1) == 0)
    {
      v9 = a3 - *(_QWORD *)(a1 + 40);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x1E0DC1248], v9, a4);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E0DC11A8], v9, a4);

      v7 = v12;
    }
  }

}

@end
