@implementation SFActivityItemCustomizationController

id __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  id result;

  switch(objc_msgSend(a2, "integerValue"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      _WBSLocalizedString();
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 32), "_contentTypeForAllowedContentAtIndex:", objc_msgSend(a2, "selectedOptionIndex"));
  return objc_msgSend(*(id *)(a1 + 32), "_customizationsDidChange");
}

uint64_t __54___SFActivityItemCustomizationController_setDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  _SFWebArchiveProvider *v5;
  _SFWebArchiveProvider *v6;

  switch(a2)
  {
    case 1:
      if (!*(_BYTE *)(a1 + 40))
        goto LABEL_7;
      v3 = *(_BYTE *)(a1 + 41) == 0;
      break;
    case 2:
      if (!*(_BYTE *)(a1 + 40))
        goto LABEL_7;
      v4 = *(unsigned __int8 *)(a1 + 42);
      goto LABEL_11;
    case 3:
      v5 = -[_SFWebArchiveProvider initWithWebView:]([_SFWebArchiveProvider alloc], "initWithWebView:", *(_QWORD *)(a1 + 32));
      v6 = v5;
      if (*(_BYTE *)(a1 + 43))
        v3 = 0;
      else
        v3 = -[_SFWebArchiveProvider canGenerateWebArchive](v5, "canGenerateWebArchive");

      break;
    case 4:
      v4 = *(unsigned __int8 *)(a1 + 44);
LABEL_11:
      v3 = v4 != 0;
      break;
    case 5:
LABEL_7:
      v3 = 0;
      break;
    default:
      v3 = 1;
      break;
  }
  return v3;
}

@end
