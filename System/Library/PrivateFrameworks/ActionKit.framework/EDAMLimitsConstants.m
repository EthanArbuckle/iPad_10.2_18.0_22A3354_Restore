@implementation EDAMLimitsConstants

+ (id)EDAM_MIME_TYPE_GIF
{
  return CFSTR("image/gif");
}

+ (id)EDAM_MIME_TYPE_JPEG
{
  return CFSTR("image/jpeg");
}

+ (id)EDAM_MIME_TYPE_PNG
{
  return CFSTR("image/png");
}

+ (id)EDAM_MIME_TYPE_WAV
{
  return CFSTR("audio/wav");
}

+ (id)EDAM_MIME_TYPE_MP3
{
  return CFSTR("audio/mpeg");
}

+ (id)EDAM_MIME_TYPE_AMR
{
  return CFSTR("audio/amr");
}

+ (id)EDAM_MIME_TYPE_MP4_VIDEO
{
  return CFSTR("video/mp4");
}

+ (id)EDAM_MIME_TYPE_INK
{
  return CFSTR("application/vnd.evernote.ink");
}

+ (id)EDAM_MIME_TYPE_PDF
{
  return CFSTR("application/pdf");
}

+ (int)EDAM_TAG_NAME_LEN_MIN
{
  return 1;
}

+ (int)EDAM_TAG_NAME_LEN_MAX
{
  return 100;
}

+ (id)EDAM_TAG_NAME_REGEX
{
  return CFSTR("^[^,\\p{Cc}\\p{Z}]([^,\\p{Cc}\\p{Zl}\\p{Zp}]{0,98}[^,\\p{Cc}\\p{Z}])?$");
}

+ (int)EDAM_NOTE_TITLE_LEN_MIN
{
  return 1;
}

+ (int)EDAM_NOTE_TITLE_LEN_MAX
{
  return 255;
}

+ (id)EDAM_NOTE_TITLE_REGEX
{
  return CFSTR("^[^\\p{Cc}\\p{Z}]([^\\p{Cc}\\p{Zl}\\p{Zp}]{0,253}[^\\p{Cc}\\p{Z}])?$");
}

+ (int)EDAM_NOTE_CONTENT_LEN_MIN
{
  return 0;
}

+ (int)EDAM_NOTE_CONTENT_LEN_MAX
{
  return 5242880;
}

+ (int)EDAM_NOTE_RESOURCES_MAX
{
  return 1000;
}

+ (int)EDAM_RESOURCE_SIZE_MAX_FREE
{
  return 26214400;
}

+ (int)EDAM_RESOURCE_SIZE_MAX_PREMIUM
{
  return 209715200;
}

+ (int)EDAM_DEVICE_ID_LEN_MAX
{
  return 32;
}

+ (id)EDAM_DEVICE_ID_REGEX
{
  return CFSTR("^[^\\p{Cc}]{1,32}$");
}

+ (int)EDAM_DEVICE_DESCRIPTION_LEN_MAX
{
  return 64;
}

+ (id)EDAM_DEVICE_DESCRIPTION_REGEX
{
  return CFSTR("^[^\\p{Cc}]{1,64}$");
}

@end
