@implementation PCNativeRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeRepresentation)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  PCNativeRepresentation *v8;
  double v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  NSString *accessibleAdCopy;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  NSString *accessibleHeadline;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  NSString *adCopy;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  PCNativeStyle *defaultStyle;
  id v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  NSArray *elements;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t v59;
  NSString *headline;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  NSString *localeIdentifier;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  NSString *sponsor;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t v85;
  NSURL *sponsoredByAssetURL;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  double v90;
  double v91;
  uint64_t v92;
  NSURL *sponsoredByAssetURLForDarkMode;
  id v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  double v106;
  uint64_t v107;
  NSArray *localizedHeadlines;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  double v112;
  double v113;
  uint64_t v114;
  PCNativeButton *button;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  double v119;
  double v120;
  uint64_t v121;
  NSURL *actionURL;
  objc_super v124;

  v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)PCNativeRepresentation;
  v8 = -[APRepresentationData initWithCoder:](&v124, sel_initWithCoder_, v4);
  if (v8)
  {
    v8->_adType = (int)objc_msgSend_decodeInt32ForKey_(v4, v5, (uint64_t)CFSTR("adType"), v6, v7, v9, v10);
    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("accessibleAdCopy"), v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    accessibleAdCopy = v8->_accessibleAdCopy;
    v8->_accessibleAdCopy = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("accessibleHeadline"), v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    accessibleHeadline = v8->_accessibleHeadline;
    v8->_accessibleHeadline = (NSString *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("adCopy"), v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    adCopy = v8->_adCopy;
    v8->_adCopy = (NSString *)v30;

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, (uint64_t)CFSTR("defaultStyle"), v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    defaultStyle = v8->_defaultStyle;
    v8->_defaultStyle = (PCNativeStyle *)v37;

    v39 = objc_alloc(MEMORY[0x24BDBCF20]);
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    v47 = (void *)objc_msgSend_initWithObjects_(v39, v42, v40, v43, v44, v45, v46, v41, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v47, (uint64_t)CFSTR("elements"), v49, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    elements = v8->_elements;
    v8->_elements = (NSArray *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, (uint64_t)CFSTR("headline"), v56, v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
    headline = v8->_headline;
    v8->_headline = (NSString *)v59;

    v61 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, (uint64_t)CFSTR("localeIdentifier"), v63, v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v8->_localeIdentifier;
    v8->_localeIdentifier = (NSString *)v66;

    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("sponsor"), v70, v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    sponsor = v8->_sponsor;
    v8->_sponsor = (NSString *)v73;

    v8->_adFormatType = (int)objc_msgSend_decodeInt32ForKey_(v4, v75, (uint64_t)CFSTR("adFormatType"), v76, v77, v78, v79);
    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("kSponsoredByAsset"), v82, v83, v84);
    v85 = objc_claimAutoreleasedReturnValue();
    sponsoredByAssetURL = v8->_sponsoredByAssetURL;
    v8->_sponsoredByAssetURL = (NSURL *)v85;

    v87 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, (uint64_t)CFSTR("kSponsoredByAssetForDarkMode"), v89, v90, v91);
    v92 = objc_claimAutoreleasedReturnValue();
    sponsoredByAssetURLForDarkMode = v8->_sponsoredByAssetURLForDarkMode;
    v8->_sponsoredByAssetURLForDarkMode = (NSURL *)v92;

    v94 = objc_alloc(MEMORY[0x24BDBCF20]);
    v95 = objc_opt_class();
    v96 = objc_opt_class();
    v102 = (void *)objc_msgSend_initWithObjects_(v94, v97, v95, v98, v99, v100, v101, v96, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v103, (uint64_t)v102, (uint64_t)CFSTR("kLocalizedHeadlines"), v104, v105, v106);
    v107 = objc_claimAutoreleasedReturnValue();
    localizedHeadlines = v8->_localizedHeadlines;
    v8->_localizedHeadlines = (NSArray *)v107;

    v109 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v110, v109, (uint64_t)CFSTR("kButton"), v111, v112, v113);
    v114 = objc_claimAutoreleasedReturnValue();
    button = v8->_button;
    v8->_button = (PCNativeButton *)v114;

    v116 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v117, v116, (uint64_t)CFSTR("lActionURL"), v118, v119, v120);
    v121 = objc_claimAutoreleasedReturnValue();
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v121;

  }
  return v8;
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
  uint64_t v11;
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
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  double v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  double v146;
  double v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  double v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  double v157;
  double v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  double v168;
  double v169;
  objc_super v170;

  v170.receiver = self;
  v170.super_class = (Class)PCNativeRepresentation;
  v4 = a3;
  -[APRepresentationData encodeWithCoder:](&v170, sel_encodeWithCoder_, v4);
  v11 = objc_msgSend_adType(self, v5, v6, v7, v8, v9, v10, v170.receiver, v170.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v12, v11, (uint64_t)CFSTR("adType"), v13, v14, v15);
  objc_msgSend_accessibleAdCopy(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("accessibleAdCopy"), v24, v25, v26);

  objc_msgSend_accessibleHeadline(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("accessibleHeadline"), v35, v36, v37);

  objc_msgSend_adCopy(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("adCopy"), v46, v47, v48);

  objc_msgSend_defaultStyle(self, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("defaultStyle"), v57, v58, v59);

  objc_msgSend_elements(self, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, (uint64_t)CFSTR("elements"), v68, v69, v70);

  objc_msgSend_headline(self, v71, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, (uint64_t)CFSTR("headline"), v79, v80, v81);

  objc_msgSend_localeIdentifier(self, v82, v83, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, (uint64_t)CFSTR("localeIdentifier"), v90, v91, v92);

  objc_msgSend_sponsor(self, v93, v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, (uint64_t)CFSTR("sponsor"), v101, v102, v103);

  v110 = objc_msgSend_adFormatType(self, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeInt32_forKey_(v4, v111, v110, (uint64_t)CFSTR("adFormatType"), v112, v113, v114);
  objc_msgSend_sponsoredByAssetURL(self, v115, v116, v117, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v122, (uint64_t)v121, (uint64_t)CFSTR("kSponsoredByAsset"), v123, v124, v125);

  objc_msgSend_sponsoredByAssetURLForDarkMode(self, v126, v127, v128, v129, v130, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v133, (uint64_t)v132, (uint64_t)CFSTR("kSponsoredByAssetForDarkMode"), v134, v135, v136);

  objc_msgSend_localizedHeadlines(self, v137, v138, v139, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v144, (uint64_t)v143, (uint64_t)CFSTR("kLocalizedHeadlines"), v145, v146, v147);

  objc_msgSend_button(self, v148, v149, v150, v151, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v155, (uint64_t)v154, (uint64_t)CFSTR("kButton"), v156, v157, v158);

  objc_msgSend_actionURL(self, v159, v160, v161, v162, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v166, (uint64_t)v165, (uint64_t)CFSTR("lActionURL"), v167, v168, v169);

}

- (int64_t)adType
{
  return self->_adType;
}

- (void)setAdType:(int64_t)a3
{
  self->_adType = a3;
}

- (NSString)accessibleAdCopy
{
  return self->_accessibleAdCopy;
}

- (void)setAccessibleAdCopy:(id)a3
{
  objc_storeStrong((id *)&self->_accessibleAdCopy, a3);
}

- (NSString)accessibleHeadline
{
  return self->_accessibleHeadline;
}

- (void)setAccessibleHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_accessibleHeadline, a3);
}

- (NSString)adCopy
{
  return self->_adCopy;
}

- (void)setAdCopy:(id)a3
{
  objc_storeStrong((id *)&self->_adCopy, a3);
}

- (PCNativeStyle)defaultStyle
{
  return self->_defaultStyle;
}

- (void)setDefaultStyle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultStyle, a3);
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_headline, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSString)sponsor
{
  return self->_sponsor;
}

- (void)setSponsor:(id)a3
{
  objc_storeStrong((id *)&self->_sponsor, a3);
}

- (int64_t)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(int64_t)a3
{
  self->_adFormatType = a3;
}

- (NSURL)sponsoredByAssetURL
{
  return self->_sponsoredByAssetURL;
}

- (void)setSponsoredByAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, a3);
}

- (NSURL)sponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode;
}

- (void)setSponsoredByAssetURLForDarkMode:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, a3);
}

- (NSArray)localizedHeadlines
{
  return self->_localizedHeadlines;
}

- (void)setLocalizedHeadlines:(id)a3
{
  objc_storeStrong((id *)&self->_localizedHeadlines, a3);
}

- (PCNativeButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)sponsorshipIdentifier
{
  return self->_sponsorshipIdentifier;
}

- (void)setSponsorshipIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sponsorshipIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsorshipIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_localizedHeadlines, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, 0);
  objc_storeStrong((id *)&self->_sponsor, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_defaultStyle, 0);
  objc_storeStrong((id *)&self->_adCopy, 0);
  objc_storeStrong((id *)&self->_accessibleHeadline, 0);
  objc_storeStrong((id *)&self->_accessibleAdCopy, 0);
}

@end
