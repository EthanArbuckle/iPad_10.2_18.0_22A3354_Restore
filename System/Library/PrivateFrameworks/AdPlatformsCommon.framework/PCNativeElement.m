@implementation PCNativeElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeElement)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  PCNativeElement *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  NSString *accessibleCaption;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  NSURL *actionURL;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  PCNativeAsset *asset;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  PCNativeButton *button;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  NSString *caption;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  PCNativeStyle *style;

  v4 = a3;
  v11 = (PCNativeElement *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("accessibleCaption"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    accessibleCaption = v11->_accessibleCaption;
    v11->_accessibleCaption = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("actionURL"), v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("asset"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    asset = v11->_asset;
    v11->_asset = (PCNativeAsset *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("button"), v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    button = v11->_button;
    v11->_button = (PCNativeButton *)v38;

    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, (uint64_t)CFSTR("caption"), v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    caption = v11->_caption;
    v11->_caption = (NSString *)v45;

    v11->_elementID = (int)objc_msgSend_decodeIntForKey_(v4, v47, (uint64_t)CFSTR("elementID"), v48, v49, v50, v51);
    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)CFSTR("style"), v54, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    style = v11->_style;
    v11->_style = (PCNativeStyle *)v57;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  double v80;
  id v81;

  v4 = a3;
  objc_msgSend_accessibleCaption(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("accessibleCaption"), v13, v14, v15);

  objc_msgSend_actionURL(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("actionURL"), v24, v25, v26);

  objc_msgSend_asset(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("asset"), v35, v36, v37);

  objc_msgSend_button(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("button"), v46, v47, v48);

  objc_msgSend_caption(self, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("caption"), v57, v58, v59);

  v66 = objc_msgSend_elementID(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeInteger_forKey_(v4, v67, v66, (uint64_t)CFSTR("elementID"), v68, v69, v70);
  objc_msgSend_style(self, v71, v72, v73, v74, v75, v76);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v81, (uint64_t)CFSTR("style"), v78, v79, v80);

}

- (NSString)accessibleCaption
{
  return self->_accessibleCaption;
}

- (void)setAccessibleCaption:(id)a3
{
  objc_storeStrong((id *)&self->_accessibleCaption, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (PCNativeAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PCNativeButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_storeStrong((id *)&self->_caption, a3);
}

- (int64_t)elementID
{
  return self->_elementID;
}

- (void)setElementID:(int64_t)a3
{
  self->_elementID = a3;
}

- (PCNativeStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_accessibleCaption, 0);
}

@end
