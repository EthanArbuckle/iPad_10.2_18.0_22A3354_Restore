@implementation MLULookupItem

- (void)dealloc
{
  __DDResult *ddResult;
  objc_super v4;

  ddResult = self->_ddResult;
  if (ddResult)
  {
    CFRelease(ddResult);
    self->_ddResult = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MLULookupItem;
  -[MLULookupItem dealloc](&v4, sel_dealloc);
}

- (MLULookupItem)initWithAttachments:(id)a3 currentAttachment:(unint64_t)a4
{
  id v6;
  MLULookupItem *v7;
  NSArray *v8;
  NSArray *attachments;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLULookupItem;
  v7 = -[MLULookupItem init](&v11, sel_init);
  if (v7)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "count") <= a4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MLULookupItem initWithAttachments:currentAttachment:].cold.1(v6, a4);
      attachments = v7->_attachments;
      v7->_attachments = 0;
      a4 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = (NSArray *)v6;
      attachments = v7->_attachments;
      v7->_attachments = v8;
    }

    v7->_currentAttachmentIndex = a4;
  }

  return v7;
}

- (MLULookupItem)initWithURL:(id)a3 dataDetectorsResult:(__DDResult *)a4 text:(id)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  MLULookupItem *v14;
  objc_super v16;

  length = a6.length;
  location = a6.location;
  v12 = a3;
  v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MLULookupItem;
  v14 = -[MLULookupItem init](&v16, sel_init);
  if (v14)
  {
    if (a4)
    {
      CFRetain(a4);
      v14->_ddResult = a4;
    }
    objc_storeStrong((id *)&v14->_url, a3);
    objc_storeStrong((id *)&v14->_text, a5);
    v14->_focusRange.location = location;
    v14->_focusRange.length = length;
    v14->_proposedRange.location = location;
    v14->_proposedRange.length = length;
  }

  return v14;
}

- (BOOL)_resolveAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSArray *attachments;
  NSArray *v19;
  unint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDE5EC0];
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "canPreviewItem:", v9);

  if (v10)
  {
    v23 = v7;
    v11 = (NSArray *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(MEMORY[0x24BDE5EC0], "canPreviewItem:", v17))
            -[NSArray addObject:](v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    attachments = self->_attachments;
    self->_attachments = v11;
    v19 = v11;

    v7 = v23;
    v20 = -[NSArray indexOfObject:](v19, "indexOfObject:", v23);
    self->_currentAttachmentIndex = v20;
    +[MLULookupItemContent contentWithAttachments:currentAttachmentIndex:](MLULookupItemContent, "contentWithAttachments:currentAttachmentIndex:", self->_attachments, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLULookupItem setPreviewContent:](self, "setPreviewContent:", v21);
  }

  return v10;
}

- (BOOL)_resolveURL:(id)a3 DDResult:(__DDResult *)a4 focusRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  NSRange v13;
  NSRange v14;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  -[MLULookupItem documentProperties](self, "documentProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLULookupItemContent contentWithURL:result:documentProperties:](MLULookupItemContent, "contentWithURL:result:documentProperties:", v9, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13.length = -[NSString length](self->_text, "length");
    v13.location = 0;
    v14.location = location;
    v14.length = length;
    self->_proposedRange = NSIntersectionRange(v13, v14);
    -[MLULookupItem setPreviewContent:](self, "setPreviewContent:", v11);
  }

  return v11 != 0;
}

- (BOOL)_resolveText:(id)a3 focusRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  const void *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  const void *ValueAtIndex;
  unint64_t Range;
  uint64_t v19;
  BOOL v21;
  void *v22;
  NSUInteger v24;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (-[NSString length](self->_text, "length"))
  {
    v8 = DDScannerCreate();
    if (v8)
    {
      v9 = (const void *)v8;
      DDScannerScanString();
      v10 = (const __CFArray *)DDScannerCopyResultsWithOptions();
      if (v10)
      {
        v11 = v10;
        Count = CFArrayGetCount(v10);
        v24 = length;
        if (Count < 1)
        {
          v14 = 0;
        }
        else
        {
          v13 = Count;
          v14 = 0;
          v15 = location + length;
          v16 = 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, v16 - 1);
            Range = DDResultGetRange();
            if (Range + v19 >= location && Range < v15)
              v14 = -[MLULookupItem _resolveURL:DDResult:focusRange:](self, "_resolveURL:DDResult:focusRange:", 0, ValueAtIndex, Range, v19);
            if (v16 >= v13)
              break;
            ++v16;
          }
          while (!v14);
        }
        CFRelease(v11);
        CFRelease(v9);
        length = v24;
        if (v14)
        {
          v21 = 1;
          goto LABEL_21;
        }
      }
      else
      {
        CFRelease(v9);
      }
    }
    +[MLULookupItemContent contentWithText:range:](MLULookupItemContent, "contentWithText:range:", v7, location, length);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22 != 0;
    if (v22)
      -[MLULookupItem setPreviewContent:](self, "setPreviewContent:", v22);

  }
  else
  {
    v21 = 0;
  }
LABEL_21:

  return v21;
}

- (BOOL)resolve
{
  NSString *v4;
  NSString *v5;
  NSString *text;
  NSUInteger v7;

  if (self->_resolved)
    return 0;
  self->_resolved = 1;
  if (self->_attachments
    && self->_currentAttachmentIndex != 0x7FFFFFFFFFFFFFFFLL
    && -[MLULookupItem _resolveAttachments:currentAttachmentIndex:](self, "_resolveAttachments:currentAttachmentIndex:"))
  {
    return 1;
  }
  if (*(_OWORD *)&self->_url != 0)
  {
    if (!-[MLULookupItem _resolveURL:DDResult:focusRange:](self, "_resolveURL:DDResult:focusRange:"))
    {
      if (self->_ddResult)
      {
        if (!self->_text)
        {
          DDResultGetMatchedString();
          v5 = (NSString *)objc_claimAutoreleasedReturnValue();
          text = self->_text;
          self->_text = v5;

          v7 = -[NSString length](self->_text, "length");
          self->_focusRange.location = 0;
          self->_focusRange.length = v7;
        }
      }
      goto LABEL_7;
    }
    return 1;
  }
LABEL_7:
  v4 = self->_text;
  if (!v4)
    return 0;
  return -[MLULookupItem _resolveText:focusRange:](self, "_resolveText:focusRange:", v4, self->_focusRange.location, self->_focusRange.length);
}

- (id)webUrlToPresent
{
  return self->_url;
}

- (_NSRange)proposedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_proposedRange.length;
  location = self->_proposedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)viewControllerToPresent
{
  void *v2;
  void *v3;

  -[MLULookupItem previewContent](self, "previewContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)commit
{
  void *v3;
  void *v4;
  id v5;

  -[MLULookupItem previewContent](self, "previewContent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MLULookupItem viewControllerToPresent](self, "viewControllerToPresent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitPreviewInController:", v4);

}

- (unint64_t)commitType
{
  void *v2;
  unint64_t v3;

  -[MLULookupItem previewContent](self, "previewContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "commitType");

  return v3;
}

- (void)commitWithTransitionForPreviewViewController:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  MLUBlurryView *v15;
  MLUBlurryView *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  MLUBlurryView *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  MLUBlurryView *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  MLUBlurryView *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v43 = a5;
  -[MLULookupItem commit](self, "commit");
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(v11, "bounds");
  v13 = (void *)objc_msgSend(v12, "initWithFrame:");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  objc_msgSend(v13, "setUserInteractionEnabled:", 0);
  objc_msgSend(v11, "addSubview:", v13);
  v15 = [MLUBlurryView alloc];
  objc_msgSend(v11, "bounds");
  v16 = -[MLUBlurryView initWithFrame:](v15, "initWithFrame:");
  -[MLUBlurryView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0);
  objc_msgSend(v11, "addSubview:", v16);
  objc_msgSend(v8, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v9;
  v46 = v8;
  v44 = v11;
  v41 = v13;
  if (v17)
  {
    do
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsString:", CFSTR("_UIPreviewPresentationContainerView"), v41);

      if ((v20 & 1) != 0)
        break;
      objc_msgSend(v17, "superview");
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v21;
    }
    while (v21);
  }
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  v56 = 0u;
  objc_msgSend(v17, "superview", v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subviews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v57;
    while (2)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v57 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v28);
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsString:", CFSTR("UIImageView"));

        if (v32)
        {
          v33 = v29;
          goto LABEL_14;
        }
        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v26)
        continue;
      break;
    }
  }
  v33 = 0;
LABEL_14:

  objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUBlurryView addSubview:](v16, "addSubview:", v34);
  objc_msgSend(v17, "setHidden:", 1);
  objc_msgSend(v33, "setHidden:", 1);
  v35 = (void *)MEMORY[0x24BDF6F90];
  v36 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke;
  v52[3] = &unk_24E22D990;
  v53 = v16;
  v54 = v34;
  v55 = v42;
  v47[0] = v36;
  v47[1] = 3221225472;
  v47[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_7;
  v47[3] = &unk_24E22D9B8;
  v48 = v54;
  v49 = v53;
  v50 = v55;
  v51 = v43;
  v37 = v54;
  v38 = v53;
  v39 = v55;
  v40 = v43;
  objc_msgSend(v35, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v52, v47, 0.4, 0.0);

}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_2;
  v16[3] = &unk_24E22D968;
  v17 = a1[4];
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v16, 0.0, 0.1);
  v4 = (void *)MEMORY[0x24BDF6F90];
  v14[0] = v2;
  v14[1] = 3221225472;
  v14[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_3;
  v14[3] = &unk_24E22D968;
  v15 = a1[4];
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v14, 0.1, 1.0);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_4;
  v12[3] = &unk_24E22D968;
  v13 = a1[4];
  objc_msgSend(v5, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v12, 0.0, 0.8);
  v6 = (void *)MEMORY[0x24BDF6F90];
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_5;
  v10[3] = &unk_24E22D968;
  v11 = a1[5];
  objc_msgSend(v6, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, 0.3, 0.7);
  v7 = (void *)MEMORY[0x24BDF6F90];
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_6;
  v8[3] = &unk_24E22D968;
  v9 = a1[6];
  objc_msgSend(v7, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 0.2);

}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  CATransform3D v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v2, 1.10000002, 1.10000002, 1.0);
  objc_msgSend(v1, "setTransform:", &v2);

}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  CATransform3D v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v2, 1.5, 1.5, 1.0);
  objc_msgSend(v1, "setTransform:", &v2);

}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBlurRadius:", 50.0);
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.200000003);
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  usleep(0x7A120u);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSDictionary)documentProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDocumentProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MLULookupItemContent)previewContent
{
  return self->_previewContent;
}

- (void)setPreviewContent:(id)a3
{
  objc_storeStrong((id *)&self->_previewContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewContent, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithAttachments:(void *)a1 currentAttachment:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = a2;
  v4 = 2048;
  v5 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_21E1ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Inconsistent attachment index in -[MLULookupItem initWithAttachments:currentAttachment:] index %ld is not in the array range (array size = %ld)", (uint8_t *)&v2, 0x16u);
}

@end
