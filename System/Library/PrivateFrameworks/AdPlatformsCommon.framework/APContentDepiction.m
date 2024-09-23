@implementation APContentDepiction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (APContentDepiction)initWithCoder:(id)a3
{
  id v4;
  APContentDepiction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  NSUUID *identifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  NSString *language;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  NSString *locale;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  NSArray *searchTerms;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  NSArray *keywords;
  const char *v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t v62;
  NSArray *categories;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)APContentDepiction;
  v5 = -[APContentDepiction init](&v65, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("identifier"), v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v5->_placement = (int)objc_msgSend_decodeIntForKey_(v4, v13, (uint64_t)CFSTR("placement"), v14, v15, v16, v17);
    v5->_adjacency = (int)objc_msgSend_decodeIntForKey_(v4, v18, (uint64_t)CFSTR("adjacency"), v19, v20, v21, v22);
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("language"), v25, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("locale"), v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v44, v39, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, (uint64_t)CFSTR("searchTerms"), v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)v50;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v52, (uint64_t)v45, (uint64_t)CFSTR("keywords"), v53, v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v56;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v58, (uint64_t)v45, (uint64_t)CFSTR("categories"), v59, v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v62;

  }
  return v5;
}

- (id)init:(unint64_t)a3 adjacency:(unint64_t)a4 language:(id)a5 locale:(id)a6 searchTerm:(id)a7 keywords:(id)a8 categories:(id)a9
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  id *v25;
  id v27;
  id v28;
  id v29;

  v29 = a5;
  v28 = a6;
  v27 = a7;
  v16 = a8;
  v17 = a9;
  v24 = objc_msgSend_init(self, v18, v19, v20, v21, v22, v23);
  v25 = (id *)v24;
  if (v24)
  {
    *(_QWORD *)(v24 + 16) = a3;
    *(_QWORD *)(v24 + 24) = a4;
    objc_storeStrong((id *)(v24 + 32), a5);
    objc_storeStrong(v25 + 5, a6);
    objc_storeStrong(v25 + 6, a7);
    objc_storeStrong(v25 + 7, a8);
    objc_storeStrong(v25 + 8, a9);
  }

  return v25;
}

- (APContentDepiction)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  APContentDepiction *v6;
  double v7;
  double v8;
  uint64_t v9;
  NSUUID *identifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)APContentDepiction;
  v6 = -[APContentDepiction init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v2, v3, v4, v5, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;

  }
  return v6;
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
  uint64_t v22;
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
  uint64_t v33;
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
  void *v66;
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
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  double v91;
  id v92;

  v4 = a3;
  objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("identifier"), v13, v14, v15);

  v22 = objc_msgSend_placement(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt_forKey_(v4, v23, v22, (uint64_t)CFSTR("placement"), v24, v25, v26);
  v33 = objc_msgSend_adjacency(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeInt_forKey_(v4, v34, v33, (uint64_t)CFSTR("adjacency"), v35, v36, v37);
  objc_msgSend_language(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("language"), v46, v47, v48);

  objc_msgSend_locale(self, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("locale"), v57, v58, v59);

  objc_msgSend_searchTerms(self, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, (uint64_t)CFSTR("searchTerms"), v68, v69, v70);

  objc_msgSend_keywords(self, v71, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, (uint64_t)CFSTR("keywords"), v79, v80, v81);

  objc_msgSend_categories(self, v82, v83, v84, v85, v86, v87);
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v92, (uint64_t)CFSTR("categories"), v89, v90, v91);

}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)keywords
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)categories
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)placement
{
  return self->_placement;
}

- (unint64_t)adjacency
{
  return self->_adjacency;
}

- (NSArray)searchTerms
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (void)setAdjacency:(unint64_t)a3
{
  self->_adjacency = a3;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setSearchTerms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
