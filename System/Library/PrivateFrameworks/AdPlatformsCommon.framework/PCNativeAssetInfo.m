@implementation PCNativeAssetInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeAssetInfo)init
{
  PCNativeAssetInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCNativeAssetInfo;
  result = -[PCNativeAssetInfo init](&v3, sel_init);
  if (result)
    result->_contentType = -1;
  return result;
}

- (PCNativeAssetInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;

  v4 = a3;
  v14 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v14)
  {
    *(_QWORD *)(v14 + 16) = (int)objc_msgSend_decodeInt32ForKey_(v4, v11, (uint64_t)CFSTR("contentType"), v12, v13, v15, v16);
    *(_QWORD *)(v14 + 24) = (int)objc_msgSend_decodeInt32ForKey_(v4, v17, (uint64_t)CFSTR("width"), v18, v19, v20, v21);
    *(_QWORD *)(v14 + 32) = (int)objc_msgSend_decodeInt32ForKey_(v4, v22, (uint64_t)CFSTR("height"), v23, v24, v25, v26);
    *(_QWORD *)(v14 + 48) = (int)objc_msgSend_decodeInt32ForKey_(v4, v27, (uint64_t)CFSTR("length"), v28, v29, v30, v31);
    objc_msgSend_decodeDoubleForKey_(v4, v32, (uint64_t)CFSTR("bitrate"), v33, v34, v35, v36);
    *(_QWORD *)(v14 + 56) = v37;
    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("url"), v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v43;

    *(_BYTE *)(v14 + 8) = objc_msgSend_decodeBoolForKey_(v4, v45, (uint64_t)CFSTR("autoloop"), v46, v47, v48, v49);
  }

  return (PCNativeAssetInfo *)v14;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  double v79;
  double v80;
  id v81;

  v81 = a3;
  v10 = objc_msgSend_contentType(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInt32_forKey_(v81, v11, v10, (uint64_t)CFSTR("contentType"), v12, v13, v14);
  v21 = objc_msgSend_width(self, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeInt32_forKey_(v81, v22, v21, (uint64_t)CFSTR("width"), v23, v24, v25);
  v32 = objc_msgSend_height(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt32_forKey_(v81, v33, v32, (uint64_t)CFSTR("height"), v34, v35, v36);
  objc_msgSend_url(self, v37, v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v81, v44, (uint64_t)v43, (uint64_t)CFSTR("url"), v45, v46, v47);

  v54 = objc_msgSend_length(self, v48, v49, v50, v51, v52, v53);
  objc_msgSend_encodeInt32_forKey_(v81, v55, v54, (uint64_t)CFSTR("length"), v56, v57, v58);
  objc_msgSend_bitrate(self, v59, v60, v61, v62, v63, v64);
  objc_msgSend_encodeDouble_forKey_(v81, v65, (uint64_t)CFSTR("bitrate"), v66, v67, v68, v69);
  v76 = objc_msgSend_autoloop(self, v70, v71, v72, v73, v74, v75);
  objc_msgSend_encodeBool_forKey_(v81, v77, v76, (uint64_t)CFSTR("autoloop"), v78, v79, v80);

}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(double)a3
{
  self->_bitrate = a3;
}

- (BOOL)autoloop
{
  return self->_autoloop;
}

- (void)setAutoloop:(BOOL)a3
{
  self->_autoloop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
