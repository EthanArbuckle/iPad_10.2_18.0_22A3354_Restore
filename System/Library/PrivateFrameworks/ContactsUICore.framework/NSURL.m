@implementation NSURL

void __24__NSURL_ContactsUI__log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("contactsui", "nsurl");
  v1 = (void *)log_cn_once_object_3;
  log_cn_once_object_3 = (uint64_t)v0;

}

id __64__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_telephonyURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __68__NSURL_ContactsUI___cnui_faceTimeAudioURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_faceTimeAudioURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __68__NSURL_ContactsUI___cnui_faceTimeVideoURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_faceTimeVideoURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __58__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_ttyURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __63__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_ttyRelayURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __82__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_channelIdentifier___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 56), "_cnui_telephonyURLWithHandle:contact:channelIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __76__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact_channelIdentifier___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 56), "_cnui_ttyURLWithHandle:contact:channelIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __81__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact_channelIdentifier___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 56), "_cnui_ttyRelayURLWithHandle:contact:channelIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __56__NSURL_ContactsUI___cnui_skypeTextURLFutureWithHandle___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeTextURLWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __57__NSURL_ContactsUI___cnui_skypeVoiceURLFutureWithHandle___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeVoiceURLWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __57__NSURL_ContactsUI___cnui_skypeVideoURLFutureWithHandle___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeVideoURLWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __63__NSURL_ContactsUI___cnui_messagesURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_messagesURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __59__NSURL_ContactsUI___cnui_mailURLFutureWithHandle_contact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "_cnui_mailURLWithHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __56__NSURL_ContactsUI___cnui_walletPayURLFutureWithHandle___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "_cnui_walletPayURLWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

id __54__NSURL_ContactsUI___cnui_expanseURLFutureWithHandle___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "_cnui_expanseURLWithHandle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
      *a2 = objc_retainAutorelease(v6);

  }
  return v4;
}

@end
