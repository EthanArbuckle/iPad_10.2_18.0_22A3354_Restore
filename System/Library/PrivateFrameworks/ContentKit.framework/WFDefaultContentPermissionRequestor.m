@implementation WFDefaultContentPermissionRequestor

- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor requestUserConsentToLoadWebContentAtURL:completionHandler:]";
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Denying load of external web resources due to missing WFContentPermissionRequestor.", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
}

- (void)allowContactsAccessWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *, _QWORD))a3;
  getWFContentGraphLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor allowContactsAccessWithCompletionHandler:]";
    _os_log_impl(&dword_20BBAD000, v4, OS_LOG_TYPE_DEFAULT, "%s Client requested -makeContactAccessResourceAvailable, but no WFContentPermissionRequestor was provided, using default contact store.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  v3[2](v3, v5, 0);

}

- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[WFDefaultContentPermissionRequestor allowNetworkAccessAfterPromptingForURLs:completionHandler:]";
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Denying unrestricted network access due to missing WFContentPermissionRequestor", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
}

- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3
{
  -[WFDefaultContentPermissionRequestor allowNetworkAccessAfterPromptingForURLs:completionHandler:](self, "allowNetworkAccessAfterPromptingForURLs:completionHandler:", MEMORY[0x24BDBD1A8], a3);
}

- (WFContactStore)contactStore
{
  NSObject *v3;
  WFContactStore *contactStore;
  WFContactStore *v5;
  WFContactStore *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getWFContentGraphLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[WFDefaultContentPermissionRequestor contactStore]";
    _os_log_impl(&dword_20BBAD000, v3, OS_LOG_TYPE_DEFAULT, "%s Returning default contact store.", (uint8_t *)&v8, 0xCu);
  }

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = (WFContactStore *)objc_opt_new();
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
