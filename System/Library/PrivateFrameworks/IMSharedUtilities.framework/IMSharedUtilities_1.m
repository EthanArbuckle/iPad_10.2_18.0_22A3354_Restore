void sub_19E36CF8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593C0(&dword_19E239000, a1, a3, "IMStickerPack trying to add nil sticker", a5, a6, a7, a8, 0);
}

void sub_19E36CFC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593C0(&dword_19E239000, a1, a3, "Sticker properties does not have a sticker GUID", a5, a6, a7, a8, 0);
}

void sub_19E36CFF4(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_19E2B4E28(&dword_19E239000, MEMORY[0x1E0C81028], a3, "IMReplySuggestionGenerator - Unexpected and invalid SROSmartRepliesSuggestion.", a1);
}

uint64_t sub_19E36D02C()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36D050(v0);
}

uint64_t sub_19E36D050()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36D074(v0);
}

uint64_t sub_19E36D074()
{
  abort_report_np();
  return sub_19E36D098();
}

uint64_t sub_19E36D098()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36D0BC(v0);
}

void sub_19E36D0BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2B6BD0(&dword_19E239000, a1, a3, "Do not have NSAdaptiveImageGlyph for replacement (possibly pending download or oop generation).", a5, a6, a7, a8, 0);
}

void sub_19E36D0F0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19E239000, a2, OS_LOG_TYPE_ERROR, "Ending all holds on updates! Previous hold reasons: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_19E36D168()
{
  int v0;
  uint64_t v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 138412546;
  v1 = qword_1EE500EC0;
  v2 = 2080;
  v3 = "mutableInfo";
  _os_log_error_impl(&dword_19E239000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_19E36D200(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "handleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_19E239000, a3, OS_LOG_TYPE_ERROR, "Error fetching subscription service for handle: \"%@\" Error: %@", v6, 0x16u);

}

void sub_19E36D2B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Off grid mode could not get any payload for \"%@\", returning unknown off grid mode", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36D310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Could not get device identifier in payload for \"%@\", returning nil", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36D370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "No normalizedID available for handle, falling back to regular ID. Handle: %@", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36D3D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "appRecord record is nil for appName for URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D3FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "can't get lsApp record for appStoreID with nil URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "appRecord record is nil for appStoreID for URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "iTunes metadata is nil for appStoreID for URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "unable to get storeItemIdentifer for sharing from URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D4AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "can't get appRecord record for appName with nil URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D4D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "unable to get app name from sharing URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "Unable to create appStoreURL from sharing URL", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D530(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "Error while initializing IDSOffGridStateManager", v1, 2u);
}

void sub_19E36D570(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "Error getting invited handles: %@", a5, a6, a7, a8, 2u);
  sub_19E2593D0();
}

void sub_19E36D5D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "Error determining if handle is already invited: %@", a5, a6, a7, a8, 2u);
  sub_19E2593D0();
}

uint64_t sub_19E36D638()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36D65C(v0);
}

void sub_19E36D65C()
{
  abort_report_np();
  sub_19E36D680();
}

void sub_19E36D680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "stickerGUID cannot be nil", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D6AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "Failed to save emoji image to file.", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D6D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "Failed to create adaptive image glyph directory.", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D704(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E239000, a2, OS_LOG_TYPE_ERROR, "stickerPathComponent %@ is invalid", (uint8_t *)&v2, 0xCu);
}

void sub_19E36D778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593EC();
  sub_19E2593C0(&dword_19E239000, v0, v1, "externalURI is nil, returning nil userInfoDictionary", v2, v3, v4, v5, v6);
  sub_19E2593E4();
}

void sub_19E36D7A4(void *a1)
{

  objc_end_catch();
}

void sub_19E36D7C4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E239000, a2, OS_LOG_TYPE_ERROR, "Failed to create a CNMutableContact for ID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_19E36D838(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19E239000, log, OS_LOG_TYPE_DEBUG, "Image source was valid. Creating thumbnail from image source", v1, 2u);
}

void sub_19E36D878(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E268400(&dword_19E239000, v2, v3, "Method is already swizzled: %@", v4, v5, v6, v7, 2u);

  sub_19E268414();
}

void sub_19E36D8F4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E268400(&dword_19E239000, v2, v3, "Other Method is already swizzled: %@", v4, v5, v6, v7, 2u);

  sub_19E268414();
}

void sub_19E36D970(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "Swizzling failed because encodings for feature swizzle did not match. This means the two methods have different signatures", v1, 2u);
}

void sub_19E36D9B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E268400(&dword_19E239000, v2, v3, "Trying to unswizzle an method that is not swizzled: %@", v4, v5, v6, v7, 2u);

  sub_19E268414();
}

void sub_19E36DA2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593C0(&dword_19E239000, a1, a3, "Message Part Guid is required", a5, a6, a7, a8, 0);
}

void sub_19E36DA60(NSRange a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  sub_19E2D5CB4(&dword_19E239000, a2, v4, "A valid message part range required: %@", (uint8_t *)&v5);

}

void sub_19E36DAEC(unsigned __int8 a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  sub_19E2D5CB4(&dword_19E239000, a2, a3, "Invalid message highlight type: %ld", (uint8_t *)&v3);
}

void sub_19E36DB5C(unsigned __int16 a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "Invalid SyndicationAction version. Got: %d, expected: %d", (uint8_t *)v3, 0xEu);
}

uint64_t sub_19E36DBE4()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36DC08(v0);
}

uint64_t sub_19E36DC08()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36DC2C(v0);
}

void sub_19E36DC2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "Error! Sender ID (%@) is neither email nor phone number.", a5, a6, a7, a8, 2u);
}

void sub_19E36DC94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "Error! Sender ID (%@) should be blackholed (!email && !phoneNumber).", a5, a6, a7, a8, 2u);
}

void sub_19E36DCFC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "Cannot show genmoji, file transfer is nil.", v1, 2u);
}

void sub_19E36DD3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Cannot show genmoji, transfer %@ is in a thumbnail only state", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36DD9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Cannot show genmoji, transfer %@ is in a rejected state", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36DDFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Cannot show genmoji, transfer %@ is in an error state", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36DE5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Cannot show genmoji, transfer %@ is in recoverable error state, but there is no user recovery UI", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36DEBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Cannot show genmoji, finished transfer %@ no longer exists at local path.", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36DF1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593C0(&dword_19E239000, a1, a3, "Could not create IMTapback for IMAssociatedMessageItem because sticker tapback has nil transfer guid", a5, a6, a7, a8, 0);
}

void sub_19E36DF50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593C0(&dword_19E239000, a1, a3, "Unexpected type found when decoding attributed string.", a5, a6, a7, a8, 0);
}

void sub_19E36DF84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36E284(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "Failed to get a temporaryPreviewURL for sourceURL: %@", a5, a6, a7, a8, 2u);
  sub_19E2593D0();
}

void sub_19E36E2E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a2, a3, "BlatDoor failed to create emoji image asset from source URL: %@", a5, a6, a7, a8, 2u);
  sub_19E2593D0();
}

void sub_19E36E34C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "Failed to write adaptive image glyph preview: temporaryPreviewURL=%@, error=%@", (uint8_t *)&v3, 0x16u);
  sub_19E2593D0();
}

void sub_19E36E3CC(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19E239000, a2, OS_LOG_TYPE_DEBUG, "Setting always use singletons to %@", (uint8_t *)&v3, 0xCu);
}

void sub_19E36E458()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  sub_19E2EDA1C(&dword_19E239000, v2, v3, "Created singleton for class %@", v4, v5, v6, v7, v8);

  sub_19E268414();
}

void sub_19E36E4D4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  sub_19E2EDA1C(&dword_19E239000, v2, v3, "Created singleton for class %@ (in singleton proxy)", v4, v5, v6, v7, v8);

  sub_19E268414();
}

void sub_19E36E550(Class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(*a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  sub_19E2EDA1C(&dword_19E239000, v2, v3, "Singleton override of type %@ was deleted, reverting to original object", v4, v5, v6, v7, v8);

  sub_19E268414();
}

void sub_19E36E5CC(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_19E239000, a3, OS_LOG_TYPE_DEBUG, "Removing singleton override of type: %@: %@", (uint8_t *)&v7, 0x16u);

}

void sub_19E36E698(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  sub_19E2EDA1C(&dword_19E239000, v2, v3, "Now using singleton override: %@", v4, v5, v6, v7, v8);

  sub_19E268414();
}

void sub_19E36E710(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19E239000, a3, OS_LOG_TYPE_ERROR, "Failed to post notification %@ due to error %@", (uint8_t *)&v6, 0x16u);

}

uint64_t sub_19E36E7C4()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36E7E8(v0);
}

uint64_t sub_19E36E7E8()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36E80C(v0);
}

uint64_t sub_19E36E80C()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36E830(v0);
}

void sub_19E36E830(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2FB3F0();
  sub_19E2FB3DC(&dword_19E239000, v3, v4, "Failed to get file size for item at path: %@, with error: %@", v5, v6, v7, v8, v9);

  sub_19E2FB408();
}

void sub_19E36E8B4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2FB3F0();
  sub_19E2FB3DC(&dword_19E239000, v3, v4, "%@: error getting children: %@", v5, v6, v7, v8, v9);

  sub_19E2FB408();
}

void sub_19E36E938(uint64_t a1, int *a2, NSObject *a3)
{
  int v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  v6 = strerror(*a2);
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v5;
  v11 = 2080;
  v12 = v6;
  _os_log_error_impl(&dword_19E239000, a3, OS_LOG_TYPE_ERROR, "Failed to get purgable flags for item at path: %@, with error: %d (%s)", (uint8_t *)&v7, 0x1Cu);
}

void sub_19E36E9EC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "rootPath is nil", v1, 2u);
}

void sub_19E36EA2C(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "standardizedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_19E239000, a3, OS_LOG_TYPE_ERROR, "Unable to get size of preview while trying to avoid cropping due to: %@ for file: %@", (uint8_t *)&v7, 0x16u);

}

uint64_t sub_19E36EAEC()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36EB10(v0);
}

uint64_t sub_19E36EB10()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36EB34(v0);
}

void sub_19E36EB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36EBB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36EC34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

void sub_19E36ECB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_19E2EAAC8();
  sub_19E2AC638(&dword_19E239000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_19E2593D0();
}

uint64_t sub_19E36ED34()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36ED58(v0);
}

uint64_t sub_19E36ED58()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36ED7C(v0);
}

uint64_t sub_19E36ED7C()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_19E36EDA0(v0);
}

void sub_19E36EDA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "IMMessagePartSyndicationRange type is out of range %ld", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36EE00(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E239000, log, OS_LOG_TYPE_ERROR, "IMMessagePartSyndicationRange can not have an empty range", v1, 2u);
}

void sub_19E36EE40(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2593D8();
  sub_19E2D5CB4(&dword_19E239000, a2, v4, "Message part range has length 0 in token: %@", v5);

  sub_19E268414();
}

void sub_19E36EEC8(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E31C25C();
  sub_19E2FB3DC(&dword_19E239000, v4, v5, "Unable to decode date from token: %@, in tokens: %@", v6, v7, v8, v9, 2u);

  sub_19E2FB408();
}

void sub_19E36EF70(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E31C25C();
  sub_19E2FB3DC(&dword_19E239000, v2, v3, "Unable to decode date from long value: %lld, in tokens: %@", v4, v5, v6, v7, 2u);

  sub_19E2FB408();
}

void sub_19E36F000(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  sub_19E31C26C(&dword_19E239000, v1, v2, "Expecting %ld or %ld tokens, but got %ld", v3, v4, v5, v6, 0);
  sub_19E31C280();
}

void sub_19E36F08C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  sub_19E31C26C(&dword_19E239000, v1, v2, "Expecting %ld or %ld tokens, but got %ld", v3, v4, v5, v6, 0);
  sub_19E31C280();
}

void sub_19E36F118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "no tokens parse for string: %@", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36F178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "expecting more than one token for string: %@", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36F1D8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "componentsJoinedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E31C25C();
  sub_19E2FB3DC(&dword_19E239000, v3, v4, "Failed to decode syndication range from string: %@, tokens: %@", v5, v6, v7, v8, 2u);

  sub_19E2FB408();
}

void sub_19E36F26C(uint64_t a1, uint64_t a2)
{
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  sub_19E31C25C();
  _os_log_error_impl(&dword_19E239000, v2, OS_LOG_TYPE_ERROR, "Unknown serialized version: %ld, %@", (uint8_t *)&v3, 0x16u);
  sub_19E2593D0();
}

void sub_19E36F2E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Failed to parse initial tokens from string: %@", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36F344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Failed to decode all the ranges for string: %@", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36F3A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19E2593D8();
  sub_19E2593B0(&dword_19E239000, v0, v1, "Decoding string: %@ failed", v2, v3, v4, v5, v6);
  sub_19E2593D0();
}

void sub_19E36F404(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19E2593B0(&dword_19E239000, a1, a3, "%s No asset syndications present for range", a5, a6, a7, a8, 2u);
  sub_19E2593D0();
}

uint64_t sub_19E36F474()
{
  return MEMORY[0x1E0CAE068]();
}

uint64_t sub_19E36F480()
{
  return MEMORY[0x1E0CAE0A0]();
}

uint64_t sub_19E36F48C()
{
  return MEMORY[0x1E0CAE0B0]();
}

uint64_t sub_19E36F498()
{
  return MEMORY[0x1E0CAE1A8]();
}

uint64_t sub_19E36F4A4()
{
  return MEMORY[0x1E0CAE1D0]();
}

uint64_t sub_19E36F4B0()
{
  return MEMORY[0x1E0CAE1E0]();
}

uint64_t sub_19E36F4BC()
{
  return MEMORY[0x1E0CAE420]();
}

uint64_t sub_19E36F4C8()
{
  return MEMORY[0x1E0CAE428]();
}

uint64_t sub_19E36F4D4()
{
  return MEMORY[0x1E0CAE448]();
}

uint64_t sub_19E36F4E0()
{
  return MEMORY[0x1E0CAE4B0]();
}

uint64_t sub_19E36F4EC()
{
  return MEMORY[0x1E0CAE660]();
}

uint64_t sub_19E36F4F8()
{
  return MEMORY[0x1E0CAE688]();
}

uint64_t sub_19E36F504()
{
  return MEMORY[0x1E0CAE770]();
}

uint64_t sub_19E36F510()
{
  return MEMORY[0x1E0CAE7D8]();
}

uint64_t sub_19E36F51C()
{
  return MEMORY[0x1E0CAE7E8]();
}

uint64_t sub_19E36F528()
{
  return MEMORY[0x1E0CAE850]();
}

uint64_t sub_19E36F534()
{
  return MEMORY[0x1E0CAE880]();
}

uint64_t sub_19E36F540()
{
  return MEMORY[0x1E0CAE888]();
}

uint64_t sub_19E36F54C()
{
  return MEMORY[0x1E0CAEB28]();
}

uint64_t sub_19E36F558()
{
  return MEMORY[0x1E0CAEB30]();
}

uint64_t sub_19E36F564()
{
  return MEMORY[0x1E0CAEB58]();
}

uint64_t sub_19E36F570()
{
  return MEMORY[0x1E0CAF978]();
}

uint64_t sub_19E36F57C()
{
  return MEMORY[0x1E0CAF988]();
}

uint64_t sub_19E36F588()
{
  return MEMORY[0x1E0CAFB48]();
}

uint64_t sub_19E36F594()
{
  return MEMORY[0x1E0CAFB60]();
}

uint64_t sub_19E36F5A0()
{
  return MEMORY[0x1E0CAFB88]();
}

uint64_t sub_19E36F5AC()
{
  return MEMORY[0x1E0CAFDA8]();
}

uint64_t sub_19E36F5B8()
{
  return MEMORY[0x1E0CAFDE8]();
}

uint64_t sub_19E36F5C4()
{
  return MEMORY[0x1E0CAFE40]();
}

uint64_t sub_19E36F5D0()
{
  return MEMORY[0x1E0CAFEF8]();
}

uint64_t sub_19E36F5DC()
{
  return MEMORY[0x1E0CAFF28]();
}

uint64_t sub_19E36F5E8()
{
  return MEMORY[0x1E0CAFFF0]();
}

uint64_t sub_19E36F5F4()
{
  return MEMORY[0x1E0CB00A8]();
}

uint64_t sub_19E36F600()
{
  return MEMORY[0x1E0CB01E8]();
}

uint64_t sub_19E36F60C()
{
  return MEMORY[0x1E0CB0230]();
}

uint64_t sub_19E36F618()
{
  return MEMORY[0x1E0CB0278]();
}

uint64_t sub_19E36F624()
{
  return MEMORY[0x1E0CB06C0]();
}

uint64_t sub_19E36F630()
{
  return MEMORY[0x1E0CB0868]();
}

uint64_t sub_19E36F63C()
{
  return MEMORY[0x1E0CB0878]();
}

uint64_t sub_19E36F648()
{
  return MEMORY[0x1E0CB0908]();
}

uint64_t sub_19E36F654()
{
  return MEMORY[0x1E0CB0990]();
}

uint64_t sub_19E36F660()
{
  return MEMORY[0x1E0CB09A0]();
}

uint64_t sub_19E36F66C()
{
  return MEMORY[0x1E0CB1710]();
}

uint64_t sub_19E36F678()
{
  return MEMORY[0x1E0CB1730]();
}

uint64_t sub_19E36F684()
{
  return MEMORY[0x1E0DBF158]();
}

uint64_t sub_19E36F690()
{
  return MEMORY[0x1E0DBF170]();
}

uint64_t sub_19E36F69C()
{
  return MEMORY[0x1E0DBF180]();
}

uint64_t sub_19E36F6A8()
{
  return MEMORY[0x1E0DBF190]();
}

uint64_t sub_19E36F6B4()
{
  return MEMORY[0x1E0DBF198]();
}

uint64_t sub_19E36F6C0()
{
  return MEMORY[0x1E0DBF1A0]();
}

uint64_t sub_19E36F6CC()
{
  return MEMORY[0x1E0D26070]();
}

uint64_t sub_19E36F6D8()
{
  return MEMORY[0x1E0D26098]();
}

uint64_t sub_19E36F6E4()
{
  return MEMORY[0x1E0D260C0]();
}

uint64_t sub_19E36F6F0()
{
  return MEMORY[0x1E0D260E0]();
}

uint64_t sub_19E36F6FC()
{
  return MEMORY[0x1E0D260F0]();
}

uint64_t sub_19E36F708()
{
  return MEMORY[0x1E0D26158]();
}

uint64_t sub_19E36F714()
{
  return MEMORY[0x1E0D26170]();
}

uint64_t sub_19E36F720()
{
  return MEMORY[0x1E0DF0180]();
}

uint64_t sub_19E36F72C()
{
  return MEMORY[0x1E0DF0268]();
}

uint64_t sub_19E36F738()
{
  return MEMORY[0x1E0DF02C0]();
}

uint64_t sub_19E36F744()
{
  return MEMORY[0x1E0DF02C8]();
}

uint64_t sub_19E36F750()
{
  return MEMORY[0x1E0DF02D0]();
}

uint64_t sub_19E36F75C()
{
  return MEMORY[0x1E0DF02E0]();
}

uint64_t sub_19E36F768()
{
  return MEMORY[0x1E0DF0308]();
}

uint64_t sub_19E36F774()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_19E36F780()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_19E36F78C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19E36F798()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_19E36F7A4()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_19E36F7B0()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_19E36F7BC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_19E36F7C8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_19E36F7D4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_19E36F7E0()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_19E36F7EC()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_19E36F7F8()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_19E36F804()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_19E36F810()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_19E36F81C()
{
  return MEMORY[0x1E0CB17E0]();
}

uint64_t sub_19E36F828()
{
  return MEMORY[0x1E0CB1800]();
}

uint64_t sub_19E36F834()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_19E36F840()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_19E36F84C()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_19E36F858()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19E36F864()
{
  return MEMORY[0x1E0CB1938]();
}

uint64_t sub_19E36F870()
{
  return MEMORY[0x1E0CB1958]();
}

uint64_t sub_19E36F87C()
{
  return MEMORY[0x1E0CB1968]();
}

uint64_t sub_19E36F888()
{
  return MEMORY[0x1E0CB1978]();
}

uint64_t sub_19E36F894()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19E36F8A0()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_19E36F8AC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_19E36F8B8()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19E36F8C4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19E36F8D0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19E36F8DC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_19E36F8E8()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_19E36F8F4()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_19E36F900()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_19E36F90C()
{
  return MEMORY[0x1E0DEACE0]();
}

uint64_t sub_19E36F918()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_19E36F924()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_19E36F930()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_19E36F93C()
{
  return MEMORY[0x1E0DEAD58]();
}

uint64_t sub_19E36F948()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19E36F954()
{
  return MEMORY[0x1E0CB1AC8]();
}

uint64_t sub_19E36F960()
{
  return MEMORY[0x1E0CB1AF0]();
}

uint64_t sub_19E36F96C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_19E36F978()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19E36F984()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19E36F990()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_19E36F99C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19E36F9A8()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_19E36F9B4()
{
  return MEMORY[0x1E0CB1B30]();
}

uint64_t sub_19E36F9C0()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_19E36F9CC()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_19E36F9D8()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_19E36F9E4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_19E36F9F0()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_19E36F9FC()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_19E36FA08()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_19E36FA14()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_19E36FA20()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_19E36FA2C()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_19E36FA38()
{
  return MEMORY[0x1E0CB1B58]();
}

uint64_t sub_19E36FA44()
{
  return MEMORY[0x1E0CB1BA8]();
}

uint64_t sub_19E36FA50()
{
  return MEMORY[0x1E0CB1BC8]();
}

uint64_t sub_19E36FA5C()
{
  return MEMORY[0x1E0CB1BD0]();
}

uint64_t sub_19E36FA68()
{
  return MEMORY[0x1E0CB1C08]();
}

uint64_t sub_19E36FA74()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_19E36FA80()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_19E36FA8C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_19E36FA98()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19E36FAA4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_19E36FAB0()
{
  return MEMORY[0x1E0CB1E60]();
}

uint64_t sub_19E36FABC()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_19E36FAC8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_19E36FAD4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_19E36FAE0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_19E36FAEC()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_19E36FAF8()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_19E36FB04()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_19E36FB10()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_19E36FB1C()
{
  return MEMORY[0x1E0DEF928]();
}

uint64_t sub_19E36FB28()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_19E36FB34()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_19E36FB40()
{
  return MEMORY[0x1E0DEF9E8]();
}

uint64_t sub_19E36FB4C()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_19E36FB58()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_19E36FB64()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_19E36FB70()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_19E36FB7C()
{
  return MEMORY[0x1E0CB1FA8]();
}

uint64_t sub_19E36FB88()
{
  return MEMORY[0x1E0CB2018]();
}

uint64_t sub_19E36FB94()
{
  return MEMORY[0x1E0CB2030]();
}

uint64_t sub_19E36FBA0()
{
  return MEMORY[0x1E0CB20D8]();
}

uint64_t sub_19E36FBAC()
{
  return MEMORY[0x1E0CB20E8]();
}

uint64_t sub_19E36FBB8()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_19E36FBC4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_19E36FBD0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19E36FBDC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19E36FBE8()
{
  return MEMORY[0x1E0CB2488]();
}

uint64_t sub_19E36FBF4()
{
  return MEMORY[0x1E0CB24E0]();
}

uint64_t sub_19E36FC00()
{
  return MEMORY[0x1E0CB2580]();
}

uint64_t sub_19E36FC0C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19E36FC18()
{
  return MEMORY[0x1E0DEC010]();
}

uint64_t sub_19E36FC24()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_19E36FC30()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_19E36FC3C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_19E36FC48()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_19E36FC54()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_19E36FC60()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_19E36FC6C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_19E36FC78()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_19E36FC84()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19E36FC90()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19E36FC9C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19E36FCA8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_19E36FCB4()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_19E36FCC0()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_19E36FCCC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19E36FCD8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_19E36FCE4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19E36FCF0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19E36FCFC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19E36FD08()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19E36FD14()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19E36FD20()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_19E36FD2C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19E36FD38()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_19E36FD44()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_19E36FD50()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_19E36FD5C()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_19E36FD68()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_19E36FD74()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_19E36FD80()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_19E36FD8C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_19E36FD98()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_19E36FDA4()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_19E36FDB0()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_19E36FDBC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_19E36FDC8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_19E36FDD4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_19E36FDE0()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_19E36FDEC()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_19E36FDF8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19E36FE04()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_19E36FE10()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19E36FE1C()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_19E36FE28()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t sub_19E36FE34()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_19E36FE40()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_19E36FE4C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19E36FE58()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19E36FE64()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19E36FE70()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19E36FE7C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19E36FE88()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19E36FE94()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19E36FEA0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19E36FEAC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_19E36FEB8()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_19E36FEC4()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_19E36FED0()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_19E36FEDC()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1E0C80100](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1E0C80120]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1E0C80228]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1E0C80230]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x1E0D15CE8]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x1E0D15D28]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1E0D15D90]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x1E0D15DB0]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x1E0C9C3F8](c, components);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CB88](image);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBD0](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC300](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC330](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC350](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC360](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC520](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC538](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC548]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC560](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC580](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC598](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5B8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5E8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC610](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CMFBlockListAddItemForAllServices()
{
  return MEMORY[0x1E0D13258]();
}

uint64_t CMFBlockListCopyItemsForAllServicesService()
{
  return MEMORY[0x1E0D13260]();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x1E0D13268]();
}

uint64_t CMFBlockListRemoveItemFromAllServices()
{
  return MEMORY[0x1E0D13270]();
}

uint64_t CMFItemCopyEmailAddress()
{
  return MEMORY[0x1E0D13288]();
}

uint64_t CMFItemCopyPhoneNumber()
{
  return MEMORY[0x1E0D13290]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x1E0D132A0]();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return MEMORY[0x1E0D132A8]();
}

uint64_t CMFItemGetType()
{
  return MEMORY[0x1E0D132B0]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

uint64_t CPBitmapWriterAddImage()
{
  return MEMORY[0x1E0CFA1E8]();
}

uint64_t CPBitmapWriterCreateWithPath()
{
  return MEMORY[0x1E0CFA200]();
}

uint64_t CPBitmapWriterFinalize()
{
  return MEMORY[0x1E0CFA208]();
}

uint64_t CPFreeSpaceRequestBytesAtPathWithCompletionBlock()
{
  return MEMORY[0x1E0CFA290]();
}

uint64_t IDSCopyIDForBusinessID()
{
  return MEMORY[0x1E0D33DD8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IDSGetUUIDData()
{
  return MEMORY[0x1E0D34740]();
}

uint64_t IDSSubscriptionSlotFromCTSIMSlot()
{
  return MEMORY[0x1E0D34288]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1E0D36360]();
}

uint64_t IMCopyURLEscapedString()
{
  return MEMORY[0x1E0D36390]();
}

uint64_t IMCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1E0D36398]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1E0D363A0]();
}

uint64_t IMCreateDictionaryFromXPCObjectWithStandardAllowlist()
{
  return MEMORY[0x1E0D363A8]();
}

uint64_t IMCreateXPCObjectFromDictionary()
{
  return MEMORY[0x1E0D363C0]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1E0D36400]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1E0D36428]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1E0D36470]();
}

uint64_t IMFormattedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x1E0D36480]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x1E0D36498]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1E0D364B0]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1E0D364B8]();
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364C0]();
}

uint64_t IMGetCachedDomainIntForKey()
{
  return MEMORY[0x1E0D364C8]();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364D0]();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return MEMORY[0x1E0D364D8]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1E0D364E8]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364F0]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x1E0D364F8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1E0D36500]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x1E0D36610]();
}

uint64_t IMLogSimulateCrashForProcessAndPID()
{
  return MEMORY[0x1E0D36638]();
}

uint64_t IMMMSEmailAddressToMatch()
{
  return MEMORY[0x1E0D36658]();
}

uint64_t IMMMSEnabled()
{
  return MEMORY[0x1E0D36660]();
}

uint64_t IMMMSMaxImageDimension()
{
  return MEMORY[0x1E0D36668]();
}

uint64_t IMMMSMaxRecipients()
{
  return MEMORY[0x1E0D36670]();
}

uint64_t IMMMSMaximumMessageByteCount()
{
  return MEMORY[0x1E0D36678]();
}

uint64_t IMMMSMaximumSlideCount()
{
  return MEMORY[0x1E0D36680]();
}

uint64_t IMMMSRestrictedModeEnabled()
{
  return MEMORY[0x1E0D36698]();
}

uint64_t IMMMSSupportsH264Video()
{
  return MEMORY[0x1E0D366A0]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1E0D366D8]();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x1E0D366E0]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1E0D366F0]();
}

uint64_t IMPCDoesInterfaceExist()
{
  return MEMORY[0x1E0D36700]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x1E0D36718]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1E0D367F8]();
}

uint64_t IMSetDomainIntForKey()
{
  return MEMORY[0x1E0D36800]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1E0D36808]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x1E0D36838]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1E0D36860]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1E0D368A0]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1E0D368B0]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x1E0D368B8]();
}

uint64_t IMSystemRootDirectory()
{
  return MEMORY[0x1E0D368D0]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1E0D36970]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1E0D36978]();
}

uint64_t IMiMessageMaxTransferAudioFileSizeForWifi()
{
  return MEMORY[0x1E0D369A8]();
}

uint64_t IMiMessageMaxTransferFileSizeForWifi()
{
  return MEMORY[0x1E0D369B0]();
}

uint64_t JWDecodeCodableObjectWithStandardAllowlist()
{
  return MEMORY[0x1E0D369D8]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x1E0D369E0]();
}

uint64_t JWEncodeCodableObject()
{
  return MEMORY[0x1E0D369E8]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x1E0D369F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1E0D36B30]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1E0D36B38]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PNDecomposeForCountry()
{
  return MEMORY[0x1E0D17880]();
}

uint64_t PNPhoneNumbersEqual()
{
  return MEMORY[0x1E0D17898]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1E0CA5970](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x1E0D20C38]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1E0D36B60]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1E0D36BA8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1E0D36BB0]();
}

uint64_t _NSNewStringByAppendingStrings()
{
  return MEMORY[0x1E0CB3C40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _dirhelper()
{
  return MEMORY[0x1E0C80CC8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1E0C811A0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1E0DDFE90]();
}

uint64_t dirstat_np()
{
  return MEMORY[0x1E0C82BB8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x1E0D36BB8]();
}

uint64_t im_notify_register_dispatch()
{
  return MEMORY[0x1E0D36BE0]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x1E0D36BF0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1E0CCFA60]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_set_queue()
{
  return MEMORY[0x1E0CCFD50]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD58]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x1E0CCFD68]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1E0DE8080](proto, other);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_issue_file_to_process_by_pid()
{
  return MEMORY[0x1E0C851B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void tidyBufAttach(TidyBuffer *buf, byte *bp, uint size)
{
  MEMORY[0x1E0DE8B38](buf, bp, *(_QWORD *)&size);
}

void tidyBufDetach(TidyBuffer *buf)
{
  MEMORY[0x1E0DE8B40](buf);
}

void tidyBufFree(TidyBuffer *buf)
{
  MEMORY[0x1E0DE8B48](buf);
}

int tidyCleanAndRepair(TidyDoc tdoc)
{
  return MEMORY[0x1E0DE8B50](tdoc);
}

TidyDoc tidyCreate(void)
{
  return (TidyDoc)MEMORY[0x1E0DE8B58]();
}

Bool tidyOptSetBool(TidyDoc tdoc, TidyOptionId optId, Bool val)
{
  return MEMORY[0x1E0DE8B60](tdoc, *(_QWORD *)&optId, *(_QWORD *)&val);
}

Bool tidyOptSetInt(TidyDoc tdoc, TidyOptionId optId, ulong val)
{
  return MEMORY[0x1E0DE8B68](tdoc, *(_QWORD *)&optId, val);
}

int tidyParseBuffer(TidyDoc tdoc, TidyBuffer *buf)
{
  return MEMORY[0x1E0DE8B70](tdoc, buf);
}

void tidyRelease(TidyDoc tdoc)
{
  MEMORY[0x1E0DE8B78](tdoc);
}

int tidyRunDiagnostics(TidyDoc tdoc)
{
  return MEMORY[0x1E0DE8B80](tdoc);
}

int tidySaveBuffer(TidyDoc tdoc, TidyBuffer *buf)
{
  return MEMORY[0x1E0DE8B88](tdoc, buf);
}

int tidySetCharEncoding(TidyDoc tdoc, ctmbstr encnam)
{
  return MEMORY[0x1E0DE8B90](tdoc, encnam);
}

int tidySetErrorBuffer(TidyDoc tdoc, TidyBuffer *errbuf)
{
  return MEMORY[0x1E0DE8B98](tdoc, errbuf);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1E0C85970](__b1, __b2, __len);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

