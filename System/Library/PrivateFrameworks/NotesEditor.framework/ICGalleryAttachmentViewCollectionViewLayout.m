@implementation ICGalleryAttachmentViewCollectionViewLayout

- (ICGalleryAttachmentViewCollectionViewLayout)initWithAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5 margins:(CGSize)a6
{
  double height;
  double width;
  id v11;
  ICGalleryAttachmentViewCollectionViewLayout *v12;
  ICGalleryAttachmentViewCollectionViewLayout *v13;
  objc_super v15;

  height = a6.height;
  width = a6.width;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICGalleryAttachmentViewCollectionViewLayout;
  v12 = -[UICollectionViewFlowLayout init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[ICGalleryAttachmentViewCollectionViewLayout setAttachmentModel:](v12, "setAttachmentModel:", v11);
    -[ICGalleryAttachmentViewCollectionViewLayout setItemHeight:](v13, "setItemHeight:", a4);
    -[ICGalleryAttachmentViewCollectionViewLayout setItemSpacing:](v13, "setItemSpacing:", a5);
    -[ICGalleryAttachmentViewCollectionViewLayout setMargins:](v13, "setMargins:", width, height);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v13, "setMinimumInteritemSpacing:", a5);
    -[UICollectionViewFlowLayout setItemSize:](v13, "setItemSize:", a4, a4);
    -[UICollectionViewFlowLayout setScrollDirection:](v13, "setScrollDirection:", 1);
  }

  return v13;
}

+ (double)contentWidthForAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5
{
  id v7;
  uint64_t v8;
  double v9;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__ICGalleryAttachmentViewCollectionViewLayout_contentWidthForAttachmentGalleryModel_itemHeight_itemSpacing___block_invoke;
  v11[3] = &unk_1EA7E1820;
  v11[4] = &v12;
  *(double *)&v11[5] = a4;
  objc_msgSend(v7, "enumerateSubAttachmentsWithBlock:", v11);
  if ((unint64_t)objc_msgSend(v7, "subAttachmentCount") <= 1)
  {
    v9 = v13[3];
  }
  else
  {
    v8 = objc_msgSend(v7, "subAttachmentCount");
    v9 = v13[3] + (double)(unint64_t)(v8 - 1) * a5;
    v13[3] = v9;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

double __108__ICGalleryAttachmentViewCollectionViewLayout_contentWidthForAttachmentGalleryModel_itemHeight_itemSpacing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double result;

  v3 = a2;
  objc_msgSend(v3, "sizeWidth");
  v5 = v4;
  objc_msgSend(v3, "sizeHeight");
  v7 = v6;

  +[ICGalleryAttachmentView effectiveAspectRatioForWidth:height:](ICGalleryAttachmentView, "effectiveAspectRatioForWidth:height:", v5, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = round(v8 * *(double *)(a1 + 40)) + *(double *)(v9 + 24);
  *(double *)(v9 + 24) = result;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 0;
}

- (void)invalidateLayoutWithNewItemHeight:(double)a3
{
  -[ICGalleryAttachmentViewCollectionViewLayout setItemHeight:](self, "setItemHeight:");
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", a3, a3);
  -[ICGalleryAttachmentViewCollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (void)setItemHeight:(double)a3
{
  self->_itemHeight = a3;
}

- (ICAttachmentGalleryModel)attachmentModel
{
  return self->_attachmentModel;
}

- (void)setAttachmentModel:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentModel, a3);
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (CGSize)margins
{
  double width;
  double height;
  CGSize result;

  width = self->_margins.width;
  height = self->_margins.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMargins:(CGSize)a3
{
  self->_margins = a3;
}

- (NSArray)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (CGSize)cachedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedContentSize.width;
  height = self->_cachedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAttributes, 0);
  objc_storeStrong((id *)&self->_attachmentModel, 0);
}

@end
