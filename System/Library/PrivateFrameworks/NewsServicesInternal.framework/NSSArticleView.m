@implementation NSSArticleView

- (NSSArticleView)initWithFrame:(CGRect)a3
{
  NSSArticleView *v3;
  NSSArticleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSArticleView;
  v3 = -[NSSArticleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NSSArticleView _commonInit](v3, "_commonInit");
  return v4;
}

- (NSSArticleView)init
{
  NSSArticleView *v2;
  NSSArticleView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSArticleView;
  v2 = -[NSSArticleView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NSSArticleView _commonInit](v2, "_commonInit");
  return v3;
}

- (void)setArticle:(id)a3
{
  NSSArticleInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  double v20;
  _QWORD v21[5];
  CGRect v22;

  v5 = (NSSArticleInternal *)a3;
  if (self->_article != v5)
  {
    objc_storeStrong((id *)&self->_article, a3);
    -[NSSArticleInternal thumbnailImage](v5, "thumbnailImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView thumbnailImageView](self, "thumbnailImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    -[NSSArticleInternal title](v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[NSSArticleInternal shortExcerpt](v5, "shortExcerpt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[NSSArticleInternal publisherName](v5, "publisherName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[NSSArticleView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceStyle");

    if (v15 == 2)
      -[NSSArticleInternal publisherLogoMaskImage](v5, "publisherLogoMaskImage");
    else
      -[NSSArticleInternal publisherLogoImage](v5, "publisherLogoImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

    -[NSSArticleInternal publishDate](v5, "publishDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __29__NSSArticleView_setArticle___block_invoke;
    v21[3] = &unk_1E9BDC930;
    v21[4] = self;
    objc_msgSend(v18, "nss_gregorianDescriptionWithFlags:options:completion:", 1, 0, v21);

    -[NSSArticleView bounds](self, "bounds");
    v19 = CGRectGetWidth(v22) + -32.0;
    -[NSSArticleView calculateHeightForWidth:](self, "calculateHeightForWidth:", v19);
    -[NSSArticleView setPreferredSize:](self, "setPreferredSize:", v19, round(v20));
    -[NSSArticleView setNeedsLayout](self, "setNeedsLayout");
  }

}

void __29__NSSArticleView_setArticle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dateLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (double)calculateHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[NSSArticleView thumbnailImageView](self, "thumbnailImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView publisherLabel](self, "publisherLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView excerptLabel](self, "excerptLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView dateLabel](self, "dateLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 16.0;
  v18 = a3 * 3.0 * 0.25 + 16.0;
  if (v6)
    v19 = 18.0;
  else
    v19 = 0.0;
  if (v6)
    v20 = a3 * 3.0 * 0.25 + 16.0;
  else
    v20 = 16.0;
  if (v8)
  {
    v17 = v19 + 16.0;
    v20 = v20 + v19 + 16.0;
  }
  else
  {
    if (!v10)
      goto LABEL_12;
    -[NSSArticleView publisherLabel](self, "publisherLabel", 16.0, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sizeToFit");

    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v20 = v20 + v19 + CGRectGetHeight(v33);

  }
  v19 = 8.0;
LABEL_12:
  if (v12)
  {
    -[NSSArticleView titleLabel](self, "titleLabel", v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeToFit");

    -[NSSArticleView titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v20 = v20 + v19 + CGRectGetHeight(v34);

    v19 = 5.0;
  }
  if (v14)
  {
    if (v6)
      v25 = 2;
    else
      v25 = 8;
    -[NSSArticleView excerptLabel](self, "excerptLabel", v17, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", v25);

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, a3, 0.0);

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeToFit");

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v20 = v20 + v19 + CGRectGetHeight(v35);

    v19 = 8.0;
  }
  if (v16)
  {
    -[NSSArticleView dateLabel](self, "dateLabel", v17, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeToFit");

    -[NSSArticleView dateLabel](self, "dateLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v20 = v20 + v19 + CGRectGetHeight(v36);

  }
  return v20 + 16.0;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  objc_super v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v85.receiver = self;
  v85.super_class = (Class)NSSArticleView;
  -[NSSArticleView layoutSubviews](&v85, sel_layoutSubviews);
  -[NSSArticleView bounds](self, "bounds");
  v3 = CGRectGetWidth(v86) + -32.0;
  -[NSSArticleView thumbnailImageView](self, "thumbnailImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSArticleView thumbnailContainerView](self, "thumbnailContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "setHidden:", 0);

    -[NSSArticleView thumbnailContainerView](self, "thumbnailContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", 16.0, 16.0, v3, v3 * 3.0 * 0.25);

    -[NSSArticleView thumbnailContainerView](self, "thumbnailContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v88 = CGRectIntegral(v87);
    x = v88.origin.x;
    y = v88.origin.y;
    width = v88.size.width;
    height = v88.size.height;
    -[NSSArticleView thumbnailContainerView](self, "thumbnailContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", x, y, width, height);

    v17 = v3 * 3.0 * 0.25 + 16.0;
    v18 = 18.0;
  }
  else
  {
    objc_msgSend(v8, "setHidden:", 1);

    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[NSSArticleView thumbnailContainerView](self, "thumbnailContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v19, v20, v21, v22);

    v17 = 16.0;
    v18 = 0.0;
  }
  if (v7)
  {
    -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 0);

    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 1);

    -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    v29 = v28;
    v31 = v30;

    v32 = 16.0;
    -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = 16.0;
    v36 = 16.0;
    v37 = v18 + v17;
    v38 = v29 * 16.0 / v31;
  }
  else
  {
    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidden:", 0);

    -[NSSArticleView publisherLogoImageView](self, "publisherLogoImageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setHidden:", 1);

    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v3, 0.0);

    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sizeToFit");

    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v32 = CGRectGetHeight(v89);

    v90.origin.y = v18 + v17;
    v90.origin.x = 16.0;
    v90.size.width = v3;
    v90.size.height = v32;
    v91 = CGRectIntegral(v90);
    v44 = v91.origin.x;
    v45 = v91.origin.y;
    v46 = v91.size.width;
    v47 = v91.size.height;
    -[NSSArticleView publisherLabel](self, "publisherLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = v44;
    v37 = v45;
    v38 = v46;
    v36 = v47;
  }
  objc_msgSend(v33, "setFrame:", v35, v37, v38, v36);

  v48 = v17 + v18 + v32;
  -[NSSArticleView titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "text");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[NSSArticleView titleLabel](self, "titleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFrame:", 0.0, 0.0, v3, 0.0);

    -[NSSArticleView titleLabel](self, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "sizeToFit");

    -[NSSArticleView titleLabel](self, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    v54 = CGRectGetHeight(v92);

    v93.origin.y = v48 + 8.0;
    v93.origin.x = 16.0;
    v93.size.width = v3;
    v93.size.height = v54;
    v94 = CGRectIntegral(v93);
    v55 = v94.origin.x;
    v56 = v94.origin.y;
    v57 = v94.size.width;
    v58 = v94.size.height;
    -[NSSArticleView titleLabel](self, "titleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFrame:", v55, v56, v57, v58);

    v48 = v48 + v54 + 8.0;
    v60 = 5.0;
  }
  else
  {
    v60 = 8.0;
  }
  -[NSSArticleView excerptLabel](self, "excerptLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "text");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    if (v5)
      v63 = 2;
    else
      v63 = 8;
    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setNumberOfLines:", v63);

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFrame:", 0.0, 0.0, v3, 0.0);

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "sizeToFit");

    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "frame");
    v68 = CGRectGetHeight(v95);

    v96.origin.y = v60 + v48;
    v96.origin.x = 16.0;
    v96.size.width = v3;
    v96.size.height = v68;
    v97 = CGRectIntegral(v96);
    v69 = v97.origin.x;
    v70 = v97.origin.y;
    v71 = v97.size.width;
    v72 = v97.size.height;
    -[NSSArticleView excerptLabel](self, "excerptLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFrame:", v69, v70, v71, v72);

    v48 = v48 + v60 + v68;
    v60 = 8.0;
  }
  -[NSSArticleView dateLabel](self, "dateLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "text");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[NSSArticleView dateLabel](self, "dateLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFrame:", 0.0, 0.0, v3, 0.0);

    -[NSSArticleView dateLabel](self, "dateLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "sizeToFit");

    -[NSSArticleView dateLabel](self, "dateLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "frame");
    v79 = CGRectGetHeight(v98);

    v99.origin.y = v60 + v48;
    v99.origin.x = 16.0;
    v99.size.width = v3;
    v99.size.height = v79;
    v100 = CGRectIntegral(v99);
    v80 = v100.origin.x;
    v81 = v100.origin.y;
    v82 = v100.size.width;
    v83 = v100.size.height;
    -[NSSArticleView dateLabel](self, "dateLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setFrame:", v80, v81, v82, v83);

  }
  -[NSSArticleView preferredSize](self, "preferredSize");
  -[NSSArticleView setPreferredSize:](self, "setPreferredSize:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NSSArticleView;
  -[NSSArticleView encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NSSArticleView article](self, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSSArticleView article](self, "article");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("article"));

  }
}

- (NSSArticleView)initWithCoder:(id)a3
{
  id v4;
  NSSArticleView *v5;
  NSSArticleView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSArticleView;
  v5 = -[NSSArticleView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[NSSArticleView _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("article"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleView setArticle:](v6, "setArticle:", v7);

  }
  return v6;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.62745098, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.37254902, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nss_dynamicColor:withDarkStyleVariant:", v4, v5);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CEA700]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  objc_msgSend(v11, "setNumberOfLines:", 3);
  objc_msgSend(v11, "setTextAlignment:", 0);
  objc_msgSend(v11, "setLineBreakMode:", 4);
  objc_msgSend(v11, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

  -[NSSArticleView addSubview:](self, "addSubview:", v11);
  -[NSSArticleView setTitleLabel:](self, "setTitleLabel:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v13, "setNumberOfLines:", 2);
  objc_msgSend(v13, "setTextAlignment:", 0);
  objc_msgSend(v13, "setLineBreakMode:", 4);
  objc_msgSend(v13, "setAutoresizingMask:", 2);
  v14 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.431372549, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.568627451, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nss_dynamicColor:withDarkStyleVariant:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v17);

  -[NSSArticleView addSubview:](self, "addSubview:", v13);
  -[NSSArticleView setExcerptLabel:](self, "setExcerptLabel:", v13);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v18, "setTextAlignment:", 0);
  objc_msgSend(v18, "setTextColor:", v29);
  -[NSSArticleView addSubview:](self, "addSubview:", v18);
  -[NSSArticleView setPublisherLabel:](self, "setPublisherLabel:", v18);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v19, "setTextAlignment:", 0);
  objc_msgSend(v19, "setTextColor:", v29);
  -[NSSArticleView addSubview:](self, "addSubview:", v19);
  -[NSSArticleView setDateLabel:](self, "setDateLabel:", v19);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMasksToBounds:", 1);

  objc_msgSend(v20, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 8.0);

  -[NSSArticleView addSubview:](self, "addSubview:", v20);
  -[NSSArticleView setThumbnailContainerView:](self, "setThumbnailContainerView:", v20);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v23, "setAutoresizingMask:", 18);
  objc_msgSend(v23, "setContentMode:", 2);
  objc_msgSend(v20, "addSubview:", v23);
  -[NSSArticleView setThumbnailImageView:](self, "setThumbnailImageView:", v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v7, v8, v9, v10);
  v25 = *MEMORY[0x1E0CD2EF8];
  objc_msgSend(v24, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMinificationFilter:", v25);

  objc_msgSend(v24, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMagnificationFilter:", v25);

  objc_msgSend(v24, "setAutoresizingMask:", 18);
  objc_msgSend(v24, "setContentMode:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTintColor:", v28);

  -[NSSArticleView addSubview:](self, "addSubview:", v24);
  -[NSSArticleView setPublisherLogoImageView:](self, "setPublisherLogoImageView:", v24);
  -[NSSArticleView _updateFonts](self, "_updateFonts");

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5B8], 64, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB550], 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v12, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleView excerptLabel](self, "excerptLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleView publisherLabel](self, "publisherLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleView dateLabel](self, "dateLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  CGFloat v4;
  double v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)NSSArticleView;
  -[NSSArticleView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[NSSArticleView bounds](self, "bounds");
  v4 = CGRectGetWidth(v7) + -32.0;
  -[NSSArticleView calculateHeightForWidth:](self, "calculateHeightForWidth:", v4);
  -[NSSArticleView setPreferredSize:](self, "setPreferredSize:", v4, round(v5));
  -[NSSArticleView setNeedsLayout](self, "setNeedsLayout");
}

- (NSSArticleInternal)article
{
  return self->_article;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)excerptLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_excerptLabel);
}

- (void)setExcerptLabel:(id)a3
{
  objc_storeWeak((id *)&self->_excerptLabel, a3);
}

- (UIImageView)thumbnailImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_thumbnailImageView);
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailImageView, a3);
}

- (UIView)thumbnailContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_thumbnailContainerView);
}

- (void)setThumbnailContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailContainerView, a3);
}

- (UILabel)publisherLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_publisherLabel);
}

- (void)setPublisherLabel:(id)a3
{
  objc_storeWeak((id *)&self->_publisherLabel, a3);
}

- (UILabel)dateLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_dateLabel);
}

- (void)setDateLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dateLabel, a3);
}

- (UIImageView)publisherLogoImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_publisherLogoImageView);
}

- (void)setPublisherLogoImageView:(id)a3
{
  objc_storeWeak((id *)&self->_publisherLogoImageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_publisherLogoImageView);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_publisherLabel);
  objc_destroyWeak((id *)&self->_thumbnailContainerView);
  objc_destroyWeak((id *)&self->_thumbnailImageView);
  objc_destroyWeak((id *)&self->_excerptLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_article, 0);
}

@end
