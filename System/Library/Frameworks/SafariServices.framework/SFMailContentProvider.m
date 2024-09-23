@implementation SFMailContentProvider

uint64_t __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMessageBody:isHTML:", a2, 1);
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2_cold_1(v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addAttachmentData:mimeType:fileName:", a2, CFSTR("application/pdf"), a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __118___SFMailContentProvider_getMailComposeViewControllerWithMailToURL_contentURL_preferredContentType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59___SFMailContentProvider__getWebArchiveDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

void __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Reader content collection failed", v1, 2u);
}

@end
