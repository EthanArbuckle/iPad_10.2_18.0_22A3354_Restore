@implementation NEFilterBlockPage

- (NEFilterBlockPage)init
{
  NEFilterBlockPage *v2;
  void *v3;
  NSString *formActionURL;
  NSString *remediationButtonText;
  uint64_t v6;
  NSURL *pageTemplateURL;
  NSString *unblockStyle;
  NSString *organization;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEFilterBlockPage;
  v2 = -[NEFilterBlockPage init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    formActionURL = v2->_formActionURL;
    v2->_formActionURL = (NSString *)&stru_1E3CC53C8;

    remediationButtonText = v2->_remediationButtonText;
    v2->_remediationButtonText = (NSString *)CFSTR("Request Access");

    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("blockpage"), CFSTR("html"));
    v6 = objc_claimAutoreleasedReturnValue();
    pageTemplateURL = v2->_pageTemplateURL;
    v2->_pageTemplateURL = (NSURL *)v6;

    unblockStyle = v2->_unblockStyle;
    v2->_unblockStyle = (NSString *)&stru_1E3CC53C8;

    organization = v2->_organization;
    v2->_organization = (NSString *)&stru_1E3CC53C8;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remediationButtonText, 0);
  objc_storeStrong((id *)&self->_unblockStyle, 0);
  objc_storeStrong((id *)&self->_formActionURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
  objc_storeStrong((id *)&self->_pageTemplateURL, 0);
  objc_storeStrong((id *)&self->_organization, 0);
}

- (id)page
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a1[2];
  if (v2)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v2, 4, &v17);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v17;
    v5 = v4;
    if (v3)
    {

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("blockpage_style"), CFSTR("css"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        *(_QWORD *)buf = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v7, 4, buf);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

      objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UNBLOCK_URL_NO_LOC"), a1[4]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UNBLOCK_BUTTON_TEXT_NO_LOC"), a1[6]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UNBLOCK_STYLE_NO_LOC"), a1[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PROVIDER_ORGANIZATION_NO_LOC"), a1[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (a1[3])
      {
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("USER_VISIBLE_RESTRICTED_URL_NO_LOC"));
        v14 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v14;
      }
      if (v8)
      {
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("INCLUDE_CSS_FILE_NO_LOC"), v8);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }

      goto LABEL_16;
    }
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "Error loading block page: %@", buf, 0xCu);
    }

  }
  v3 = 0;
  v10 = 0;
LABEL_16:

  return v10;
}

@end
