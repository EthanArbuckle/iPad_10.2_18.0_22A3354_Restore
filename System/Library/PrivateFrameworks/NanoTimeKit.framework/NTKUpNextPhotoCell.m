@implementation NTKUpNextPhotoCell

- (void)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double Width;
  double Height;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NTKUpNextPhotoCell;
  -[NTKUpNextBaseCell configureWithContent:](&v29, sel_configureWithContent_, v4);
  objc_msgSend(v4, "overrideBodyImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  self->_aspectRatio = v6 / v7;
  -[NTKUpNextBaseCell device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  if (self->_aspectRatio <= 1.0)
  {
    Width = CGRectGetWidth(*(CGRect *)&v17);
    v31.origin.x = v10;
    v31.origin.y = v12;
    v31.size.width = v14;
    v31.size.height = v16;
    Height = CGRectGetWidth(v31) / self->_aspectRatio;
  }
  else
  {
    Width = CGRectGetHeight(*(CGRect *)&v17) * self->_aspectRatio;
    v30.origin.x = v10;
    v30.origin.y = v12;
    v30.size.width = v14;
    v30.size.height = v16;
    Height = CGRectGetHeight(v30);
  }
  self->_wantsFullCellPhoto = 0;
  objc_msgSend(v4, "objectForKey:", CFSTR("NTKUpNextWantsFullScreenPhotoContent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_wantsFullCellPhoto = objc_msgSend(v23, "BOOLValue");
  }
  self->_scaledImageSize.width = Width;
  self->_scaledImageSize.height = Height;
  objc_msgSend(v4, "imageFocusRect");
  self->_facesRect.origin.x = v24;
  self->_facesRect.origin.y = v25;
  self->_facesRect.size.width = v26;
  self->_facesRect.size.height = v27;
  objc_msgSend(v4, "overrideBodyImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextBaseCell setOverrideContentImage:](self, "setOverrideContentImage:", v28);

  -[NTKUpNextPhotoCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double y;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Width;
  double v17;
  double v18;
  BOOL v19;
  double Height;
  double v21;
  CGRect *p_facesRect;
  CGFloat v23;
  CGFloat v24;
  CGFloat x;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidY;
  void *v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v33.receiver = self;
  v33.super_class = (Class)NTKUpNextPhotoCell;
  -[NTKUpNextBaseCell layoutSubviews](&v33, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  if (self->_wantsFullCellPhoto)
  {
    y = 0.0;
    v4 = 1.0;
    v5 = 1.0;
    v6 = 0.0;
  }
  else
  {
    -[NTKUpNextBaseCell device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screenBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[NTKUpNextPhotoCell bounds](self, "bounds");
    Width = CGRectGetWidth(v34);
    v17 = self->_scaledImageSize.width;
    v35.origin.x = v9;
    v35.origin.y = v11;
    v35.size.width = v13;
    v35.size.height = v15;
    v18 = 0.0;
    v19 = CGRectGetWidth(v35) < v17;
    if (v19)
      v5 = Width / v17;
    else
      v5 = 1.0;
    if (v19)
      v6 = (1.0 - Width / v17) * 0.5;
    else
      v6 = 0.0;
    -[NTKUpNextPhotoCell bounds](self, "bounds");
    Height = CGRectGetHeight(v36);
    v21 = self->_scaledImageSize.height;
    p_facesRect = &self->_facesRect;
    if (CGRectIsNull(self->_facesRect))
    {
      v4 = Height / v21;
      y = v4 * -0.5 + 0.333333333;
    }
    else
    {
      v37.origin.x = p_facesRect->origin.x;
      v37.origin.y = self->_facesRect.origin.y;
      v37.size.width = self->_facesRect.size.width;
      v37.size.height = self->_facesRect.size.height;
      v23 = CGRectGetWidth(v37) * -0.1;
      v38.origin.x = p_facesRect->origin.x;
      v38.origin.y = self->_facesRect.origin.y;
      v38.size.width = self->_facesRect.size.width;
      v38.size.height = self->_facesRect.size.height;
      v24 = CGRectGetHeight(v38) * -0.1;
      v39.origin.x = p_facesRect->origin.x;
      v39.origin.y = self->_facesRect.origin.y;
      v39.size.width = self->_facesRect.size.width;
      v39.size.height = self->_facesRect.size.height;
      v40 = CGRectInset(v39, v23, v24);
      x = v40.origin.x;
      y = v40.origin.y;
      v26 = v40.size.width;
      v4 = v40.size.height;
      -[NTKUpNextPhotoCell bounds](self, "bounds");
      v27 = CGRectGetWidth(v41);
      -[NTKUpNextPhotoCell bounds](self, "bounds");
      v28 = v27 / CGRectGetHeight(v42);
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = v26;
      v43.size.height = v4;
      v29 = CGRectGetHeight(v43) * v28 / self->_aspectRatio;
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = v26;
      v44.size.height = v4;
      v30 = CGRectGetMidX(v44) + v29 * -0.5;
      v45.origin.x = v30;
      v45.origin.y = y;
      v45.size.width = v29;
      v45.size.height = v4;
      if (CGRectGetMinX(v45) >= 0.0)
      {
        v46.origin.x = v30;
        v46.origin.y = y;
        v46.size.width = v29;
        v46.size.height = v4;
        if (CGRectGetMaxX(v46) <= 1.0)
        {
          v18 = v30;
        }
        else
        {
          v47.origin.x = v30;
          v47.origin.y = y;
          v47.size.width = v29;
          v47.size.height = v4;
          v18 = v30 - (CGRectGetMaxX(v47) + -1.0);
        }
      }
      v48.origin.x = v18;
      v48.origin.y = y;
      v48.size.width = v29;
      v48.size.height = v4;
      v5 = 1.0;
      if (CGRectGetMaxX(v48) <= 1.0
        && (v49.origin.x = v18, v49.origin.y = y, v49.size.width = v29, v49.size.height = v4, CGRectGetMinX(v49) >= 0.0))
      {
        v5 = v29;
        v6 = v18;
      }
      else
      {
        v6 = 0.0;
        v50.origin.x = 0.0;
        v50.size.width = 1.0;
        v50.origin.y = y;
        v50.size.height = v4;
        MidY = CGRectGetMidY(v50);
        v4 = self->_aspectRatio / v28;
        v51.origin.x = 0.0;
        v51.size.width = 1.0;
        v51.origin.y = y;
        v51.size.height = v4;
        y = MidY + CGRectGetHeight(v51) * -0.5;
      }
    }
  }
  -[NTKUpNextBaseCell imageLayer](self, "imageLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContentsRect:", v6, y, v5, v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)transitionContextInView:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextPhotoCell;
  -[NTKUpNextBaseCell prepareForReuse](&v4, sel_prepareForReuse);
  -[NTKUpNextPhotoCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextPhotoCell;
  -[NTKUpNextBaseCell applyLayoutAttributes:](&v3, sel_applyLayoutAttributes_, a3);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (fabs(a3) < 0.00000011920929)
  {
    -[NTKUpNextPhotoCell layer](self, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", 0);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 1, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    -[NTKUpNextPhotoCell layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v8);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  id v5;

  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTKUpNextPhotoCell layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v5);

  }
}

@end
