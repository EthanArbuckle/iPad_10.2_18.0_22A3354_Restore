@implementation ICGalleryAttachmentViewCell

- (void)dealloc
{
  objc_super v3;

  -[ICGalleryAttachmentViewCell setAttachment:](self, "setAttachment:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICGalleryAttachmentViewCell;
  -[ICGalleryAttachmentViewCell dealloc](&v3, sel_dealloc);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICGalleryAttachmentViewCell;
  -[ICGalleryAttachmentViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[ICGalleryAttachmentViewCell setDelegate:](self, "setDelegate:", 0);
  -[ICGalleryAttachmentViewCell setAttachment:](self, "setAttachment:", 0);
  -[ICGalleryAttachmentViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[ICGalleryAttachmentViewCell setFadeMaskLayer:](self, "setFadeMaskLayer:", 0);
  -[ICGalleryAttachmentViewCell setFadeImageLayer:](self, "setFadeImageLayer:", 0);
  -[ICGalleryAttachmentViewCell setFadeWhiteLayer:](self, "setFadeWhiteLayer:", 0);
  -[ICGalleryAttachmentViewCell layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMask:", 0);

}

- (void)setAttachment:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICAttachment *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  ICAttachment *v18;

  v18 = (ICAttachment *)a3;
  -[ICGalleryAttachmentViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 3.0);

  -[ICGalleryAttachmentViewCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  -[ICGalleryAttachmentViewCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMode:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", *MEMORY[0x1E0D64970], 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentViewCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = v18;
  if (self->_attachment != v18)
  {
    -[ICGalleryAttachmentViewCell setShouldFade:](self, "setShouldFade:", 0);
    objc_storeStrong((id *)&self->_attachment, a3);
    v12 = v18;
    if (v18)
    {
      -[ICAttachment sizeWidth](v18, "sizeWidth");
      v14 = v13;
      -[ICAttachment sizeHeight](v18, "sizeHeight");
      if (v15 > 0.0)
      {
        v16 = v14 / v15;
        v17 = v16 > *MEMORY[0x1E0D64978] || v16 < *MEMORY[0x1E0D64980];
        -[ICGalleryAttachmentViewCell setShouldFade:](self, "setShouldFade:", v17);
      }
      -[ICGalleryAttachmentViewCell updateImage](self, "updateImage");
      v12 = v18;
    }
  }

}

- (void)updateImage
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Using scan document image from cache for: %@", (uint8_t *)&v5, 0xCu);

}

id __42__ICGalleryAttachmentViewCell_updateImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v24;
  _QWORD v25[4];
  id v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;

  v3 = a2;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "scale");
  v9 = v5 * (v8 / *(double *)(a1 + 32));
  objc_msgSend(v3, "scale");
  if (v9 > 0.0)
  {
    v11 = v7 * (v10 / *(double *)(a1 + 32));
    if (v11 > 0.0)
    {
      v12 = vrndpq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x3FF199999999999AuLL)));
      v14 = *MEMORY[0x1E0C9D648];
      v13 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
      v15 = v9 / v11;
      v16 = v12.f64[1];
      if (v15 <= 1.0)
      {
        v17 = v12.f64[0];
        v20 = v12.f64[0] / v15;
      }
      else
      {
        v17 = vmuld_lane_f64(v15, v12, 1);
        v18 = v17 - v12.f64[0];
        if (v17 - v12.f64[0] < 0.0)
          v18 = 0.0;
        v19 = v14 - v18;
        if (*(_BYTE *)(a1 + 56))
          v14 = v19;
        v20 = v12.f64[1];
      }
      objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat", *(_OWORD *)&v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setScale:", *(double *)(a1 + 32));
      objc_msgSend(v21, "setOpaque:", 1);
      objc_msgSend(v21, "setPreferredRange:", 2);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v24, v16);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2;
      v25[3] = &unk_1EA7DD450;
      v26 = v3;
      v27 = v14;
      v28 = v13;
      v29 = v17;
      v30 = v20;
      objc_msgSend(v22, "imageWithActions:", v25);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

uint64_t __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);

    if (v6 == v7)
    {
      objc_msgSend(v5, "updateFadeMask:", objc_msgSend(v5, "shouldFade"));
      v8 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(v5, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2_18;
      v10[3] = &unk_1EA7DD498;
      v11 = v5;
      v12 = v3;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v10, 0, 0.200000003);

    }
  }

}

void __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2_18(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (BOOL)isPortrait
{
  double v3;
  double v4;
  double v5;

  -[ICGalleryAttachmentViewCell bounds](self, "bounds");
  v4 = v3;
  -[ICGalleryAttachmentViewCell bounds](self, "bounds");
  return v4 > v5;
}

- (void)updateFadeMask:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double x;
  double v51;
  double y;
  double v53;
  double width;
  double v55;
  double height;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  CGAffineTransform v83;
  CGAffineTransform v84;
  CGAffineTransform v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v3 = a3;
  -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[ICGalleryAttachmentViewCell setFadeMaskLayer:](self, "setFadeMaskLayer:", v6);

    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("gallery_fade_gradient"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[ICGalleryAttachmentViewCell setFadeImageLayer:](self, "setFadeImageLayer:", v8);

    v9 = objc_msgSend(v7, "ic_CGImage");
    -[ICGalleryAttachmentViewCell fadeImageLayer](self, "fadeImageLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContents:", v9);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentViewCell setFadeWhiteLayer:](self, "setFadeWhiteLayer:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[ICGalleryAttachmentViewCell fadeWhiteLayer](self, "fadeWhiteLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentViewCell fadeWhiteLayer](self, "fadeWhiteLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v16);

    -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentViewCell fadeImageLayer](self, "fadeImageLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v18);

  }
  -[ICGalleryAttachmentViewCell bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  if (v3)
  {
    v28 = objc_msgSend(MEMORY[0x1E0DC1290], "ic_isRTL");
    v29 = -[ICGalleryAttachmentViewCell isPortrait](self, "isPortrait");
    -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v39 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v85.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v85.c = v39;
    *(_OWORD *)&v85.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v29)
    {
      -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      TSDRectGetMaxPoint();

      TSDRectWithPoints();
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      TSDRectWithPoints();
      x = v49;
      y = v51;
      width = v53;
      height = v55;
    }
    else
    {
      v57 = v32;
      v58 = v34;
      v59 = v36;
      v60 = v38;
      if (v28)
      {
        CGRectGetMaxY(*(CGRect *)&v57);
        TSDRectWithPoints();
        x = v86.origin.x;
        y = v86.origin.y;
        width = v86.size.width;
        height = v86.size.height;
        CGRectGetMinX(v86);
        -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "frame");
        TSDRectGetMaxPoint();
        TSDRectWithPoints();
        v42 = v62;
        v44 = v63;
        v46 = v64;
        v48 = v65;

        v66 = 1.57079633;
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v57);
        -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "frame");
        TSDRectGetMaxPoint();
        TSDRectWithPoints();
        x = v68;
        y = v69;
        width = v70;
        height = v71;

        v87.origin.x = x;
        v87.origin.y = y;
        v87.size.width = width;
        v87.size.height = height;
        CGRectGetMinX(v87);
        -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "frame");
        CGRectGetMaxY(v88);
        TSDRectWithPoints();
        v42 = v73;
        v44 = v74;
        v46 = v75;
        v48 = v76;

        v66 = -1.57079633;
      }
      CGAffineTransformMakeRotation(&v85, v66);
    }
    v84 = v85;
    -[ICGalleryAttachmentViewCell fadeImageLayer](self, "fadeImageLayer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v84;
    objc_msgSend(v77, "setAffineTransform:", &v83);

    -[ICGalleryAttachmentViewCell fadeWhiteLayer](self, "fadeWhiteLayer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFrame:", v42, v44, v46, v48);

    -[ICGalleryAttachmentViewCell fadeImageLayer](self, "fadeImageLayer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", x, y, width, height);

    -[ICGalleryAttachmentViewCell fadeMaskLayer](self, "fadeMaskLayer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentViewCell layer](self, "layer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setMask:", v80);

  }
  else
  {
    -[ICGalleryAttachmentViewCell layer](self, "layer");
    v82 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setMask:", 0);

  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (ICGalleryAttachmentViewCellDelegate)delegate
{
  return (ICGalleryAttachmentViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (CALayer)fadeMaskLayer
{
  return self->_fadeMaskLayer;
}

- (void)setFadeMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeMaskLayer, a3);
}

- (CALayer)fadeImageLayer
{
  return self->_fadeImageLayer;
}

- (void)setFadeImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeImageLayer, a3);
}

- (CALayer)fadeWhiteLayer
{
  return self->_fadeWhiteLayer;
}

- (void)setFadeWhiteLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeWhiteLayer, a3);
}

- (BOOL)shouldFade
{
  return self->_shouldFade;
}

- (void)setShouldFade:(BOOL)a3
{
  self->_shouldFade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeWhiteLayer, 0);
  objc_storeStrong((id *)&self->_fadeImageLayer, 0);
  objc_storeStrong((id *)&self->_fadeMaskLayer, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
