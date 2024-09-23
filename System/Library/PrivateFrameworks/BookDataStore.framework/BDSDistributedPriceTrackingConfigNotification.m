@implementation BDSDistributedPriceTrackingConfigNotification

- (BDSDistributedPriceTrackingConfigNotification)initWithTitleSingleAudiobook:(id)a3 titleSingleBook:(id)a4 titleMultiple:(id)a5 bodySingleAudiobook:(id)a6 bodySingleBook:(id)a7 bodyMultiple:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BDSDistributedPriceTrackingConfigNotification *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __CFString *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __CFString *v62;
  objc_super v64;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v64.receiver = self;
  v64.super_class = (Class)BDSDistributedPriceTrackingConfigNotification;
  v24 = -[BDSDistributedPriceTrackingConfigNotification init](&v64, sel_init);
  if (v24)
  {
    v25 = objc_msgSend_copy(v14, v20, v21, v22, v23);
    v26 = (void *)v25;
    if (v25)
      v27 = (__CFString *)v25;
    else
      v27 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_titleSingleAudiobook, v27);

    v32 = objc_msgSend_copy(v15, v28, v29, v30, v31);
    v33 = (void *)v32;
    if (v32)
      v34 = (__CFString *)v32;
    else
      v34 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_titleSingleBook, v34);

    v39 = objc_msgSend_copy(v16, v35, v36, v37, v38);
    v40 = (void *)v39;
    if (v39)
      v41 = (__CFString *)v39;
    else
      v41 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_titleMultiple, v41);

    v46 = objc_msgSend_copy(v17, v42, v43, v44, v45);
    v47 = (void *)v46;
    if (v46)
      v48 = (__CFString *)v46;
    else
      v48 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_bodySingleAudiobook, v48);

    v53 = objc_msgSend_copy(v18, v49, v50, v51, v52);
    v54 = (void *)v53;
    if (v53)
      v55 = (__CFString *)v53;
    else
      v55 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_bodySingleBook, v55);

    v60 = objc_msgSend_copy(v19, v56, v57, v58, v59);
    v61 = (void *)v60;
    if (v60)
      v62 = (__CFString *)v60;
    else
      v62 = &stru_24F091B90;
    objc_storeStrong((id *)&v24->_bodyMultiple, v62);

  }
  return v24;
}

- (NSString)title
{
  return (NSString *)&stru_24F091B90;
}

- (NSString)subtitleSingle
{
  return (NSString *)&stru_24F091B90;
}

- (BDSDistributedPriceTrackingConfigNotification)initWithTitle:(id)a3 subtitleSingle:(id)a4 bodySingleAudiobook:(id)a5 bodySingleBook:(id)a6 bodyMultiple:(id)a7
{
  return (BDSDistributedPriceTrackingConfigNotification *)objc_msgSend_initWithTitleSingleAudiobook_titleSingleBook_titleMultiple_bodySingleAudiobook_bodySingleBook_bodyMultiple_(self, a2, (uint64_t)&stru_24F091B90, (uint64_t)&stru_24F091B90, (uint64_t)&stru_24F091B90, &stru_24F091B90, &stru_24F091B90, &stru_24F091B90);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v4 = a3;
  objc_msgSend_titleSingleAudiobook(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("titleSingleAudiobook"), v11);

  objc_msgSend_titleSingleBook(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("titleSingleBook"), v18);

  objc_msgSend_titleMultiple(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("titleMultiple"), v25);

  objc_msgSend_bodySingleAudiobook(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("bodySingleAudiobook"), v32);

  objc_msgSend_bodySingleBook(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("bodySingleBook"), v39);

  objc_msgSend_bodyMultiple(self, v40, v41, v42, v43);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v46, (uint64_t)CFSTR("bodyMultiple"), v45);

}

- (BDSDistributedPriceTrackingConfigNotification)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  BDSDistributedPriceTrackingConfigNotification *v30;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("titleSingleAudiobook"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("titleSingleBook"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("titleMultiple"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("bodySingleAudiobook"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("bodySingleBook"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("bodyMultiple"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (BDSDistributedPriceTrackingConfigNotification *)objc_msgSend_initWithTitleSingleAudiobook_titleSingleBook_titleMultiple_bodySingleAudiobook_bodySingleBook_bodyMultiple_(self, v29, (uint64_t)v8, (uint64_t)v12, (uint64_t)v16, v20, v24, v28);
  return v30;
}

- (NSString)titleSingleAudiobook
{
  return self->_titleSingleAudiobook;
}

- (NSString)titleSingleBook
{
  return self->_titleSingleBook;
}

- (NSString)titleMultiple
{
  return self->_titleMultiple;
}

- (NSString)bodySingleAudiobook
{
  return self->_bodySingleAudiobook;
}

- (NSString)bodySingleBook
{
  return self->_bodySingleBook;
}

- (NSString)bodyMultiple
{
  return self->_bodyMultiple;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyMultiple, 0);
  objc_storeStrong((id *)&self->_bodySingleBook, 0);
  objc_storeStrong((id *)&self->_bodySingleAudiobook, 0);
  objc_storeStrong((id *)&self->_titleMultiple, 0);
  objc_storeStrong((id *)&self->_titleSingleBook, 0);
  objc_storeStrong((id *)&self->_titleSingleAudiobook, 0);
}

@end
