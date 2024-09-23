@implementation ICAbstractTextAttachment

- (ICBaseAttachment)attachment
{
  return self->_attachment;
}

- (BOOL)supportsMultiplePresentationSizes
{
  void *v2;
  BOOL v3;

  -[ICAbstractTextAttachment supportedPresentationSizes](self, "supportedPresentationSizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

void __42__ICAbstractTextAttachment_viewIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)viewIdentifier
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__43;
  v12 = __Block_byref_object_dispose__43;
  v13 = 0;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ICAbstractTextAttachment_viewIdentifier__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (id)newlyCreatedViewForTextContainer:(id)a3
{
  return -[ICAbstractTextAttachment newlyCreatedViewForManualRendering:textContainer:](self, "newlyCreatedViewForManualRendering:textContainer:", 0, a3);
}

- (id)newlyCreatedViewForManualRendering:(BOOL)a3 textContainer:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_class *v7;
  id v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  v7 = -[ICAbstractTextAttachment attachmentViewClassForTextContainer:](self, "attachmentViewClassForTextContainer:", v6);
  if (-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_1EECBC270))
  {
    v8 = (id)objc_msgSend([v7 alloc], "initWithTextAttachment:textContainer:forManualRendering:", self, v6, v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = objc_alloc_init(v7);
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (ICAbstractTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  ICAbstractTextAttachment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAbstractTextAttachment;
  result = -[ICAbstractTextAttachment initWithData:ofType:](&v5, sel_initWithData_ofType_, a3, a4);
  if (result)
    result->_foregroundAlpha = 1.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

+ (id)textAttachmentWithBaseAttachment:(id)a3
{
  id v3;
  void *v4;
  ICInlineTextAttachment *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ICInlineTextAttachment initWithAttachment:]([ICInlineTextAttachment alloc], "initWithAttachment:", v4);
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = (ICInlineTextAttachment *)objc_msgSend(objc_alloc(+[ICTextAttachment textAttachmentClassForAttachment:](ICTextAttachment, "textAttachmentClassForAttachment:", v6)), "initWithAttachment:", v6);
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)isUnsupported
{
  return 1;
}

- (Class)attachmentViewClassForTextContainer:(id)a3
{
  NSObject *v4;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICAbstractTextAttachment attachmentViewClassForTextContainer:].cold.1((uint64_t)self, v4);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)newlyCreatedViewForManualRenderingInTextContainer:(id)a3
{
  return -[ICAbstractTextAttachment newlyCreatedViewForManualRendering:textContainer:](self, "newlyCreatedViewForManualRendering:textContainer:", 1, a3);
}

- (Class)attachmentViewControllerClass
{
  return 0;
}

- (NSArray)supportedPresentationSizes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D63C60], "isAttachment:equalToModelComparable:", self, a3);
}

- (NSString)attachmentIdentifier
{
  return (NSString *)&stru_1E5C2F8C0;
}

- (NSString)attachmentUTI
{
  return (NSString *)&stru_1E5C2F8C0;
}

- (id)attachmentInContext:(id)a3
{
  return 0;
}

- (id)inlineAttachmentInContext:(id)a3
{
  return 0;
}

- (BOOL)allowsTextAttachmentView
{
  return 1;
}

- (BOOL)containsFindableText
{
  return -[objc_class conformsToProtocol:](-[ICAbstractTextAttachment attachmentViewControllerClass](self, "attachmentViewControllerClass"), "conformsToProtocol:", &unk_1EED6F610);
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)attachmentViewClassForTextContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Trying to get a view class for an attachment with an unknown text attachment type: %@", (uint8_t *)&v2, 0xCu);
}

@end
