@implementation FigCaptureMetadataUtilitiesCreateMetadataAttachments

uint64_t __FigCaptureMetadataUtilitiesCreateMetadataAttachments_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  FigCaptureMetadataUtilitiesCreateMetadataAttachments_sMarketingNameString = MGCopyAnswer();
  FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSoftwareProductVersion = MGCopyAnswer();
  v2 = MGCopyAnswer();
  v3 = (void *)v2;
  if (FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSoftwareProductVersion && v2)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSoftwareProductBuildVersionString = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ (%@)"), FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSoftwareProductVersion, v3);
  }

  FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter, "setLocale:", v0);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sDateTimeFormatter, "setCalendar:", v1);
  FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter, "setDateFormat:", CFSTR("SSS"));
  objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter, "setLocale:", v0);
  return objc_msgSend((id)FigCaptureMetadataUtilitiesCreateMetadataAttachments_sSubsecTimeFormatter, "setCalendar:", v1);
}

@end
