@implementation ENMIMEUtils

+ (id)fileExtensionForMIMEType:(id)a3
{
  __CFString *v3;
  void *v4;
  char v5;
  __CFString *v6;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v29;

  v3 = (__CFString *)a3;
  +[EDAMLimitsConstants EDAM_MIME_TYPE_INK](EDAMLimitsConstants, "EDAM_MIME_TYPE_INK");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1660], v3, 0);
    if (PreferredIdentifierForTag)
    {
      v8 = PreferredIdentifierForTag;
      v9 = UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC1658]);
      v6 = (__CFString *)v9;
      if (v9 && CFStringGetLength(v9) <= 0)
      {
        CFRelease(v6);
        v6 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v6 = 0;
    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF](EDAMLimitsConstants, "EDAM_MIME_TYPE_GIF");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v10))
    {
      v11 = CFSTR("gif");
      v12 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("gif"));

      if ((v12 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG](EDAMLimitsConstants, "EDAM_MIME_TYPE_JPEG");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v13))
    {
      v11 = CFSTR("jpg");
      v14 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("jpg"));

      if ((v14 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG](EDAMLimitsConstants, "EDAM_MIME_TYPE_PNG");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v3, "isEqualToString:", v15) & 1) != 0
      || -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("image/x-png")))
    {
      v11 = CFSTR("png");
      v16 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("png"));

      if ((v16 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV](EDAMLimitsConstants, "EDAM_MIME_TYPE_WAV");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v17))
    {
      v11 = CFSTR("wav");
      v18 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("wav"));

      if ((v18 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP3");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v19))
    {
      v11 = CFSTR("mp3");
      v20 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("mp3"));

      if ((v20 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR](EDAMLimitsConstants, "EDAM_MIME_TYPE_AMR");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v21))
    {
      v11 = CFSTR("amr");
      v22 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("amr"));

      if ((v22 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP4_VIDEO");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v23))
    {
      v11 = CFSTR("mp4");
      v24 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("mp4"));

      if ((v24 & 1) == 0)
        goto LABEL_40;
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_INK](EDAMLimitsConstants, "EDAM_MIME_TYPE_INK");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v25))
    {
      v11 = CFSTR("png");
      v26 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("png"));

      if ((v26 & 1) == 0)
      {
LABEL_40:
        v27 = v6;
LABEL_41:

        v6 = (__CFString *)v11;
        goto LABEL_42;
      }
    }
    else
    {

    }
    +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF](EDAMLimitsConstants, "EDAM_MIME_TYPE_PDF");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", v27))
    {
      v11 = CFSTR("pdf");
      v29 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("pdf"));

      v27 = v6;
      if ((v29 & 1) != 0)
        goto LABEL_42;
    }
    else
    {
      v11 = v6;
    }
    goto LABEL_41;
  }
  v6 = CFSTR("png");
LABEL_42:

  return v6;
}

+ (id)determineMIMETypeForFile:(id)a3
{
  __CFString *v3;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;

  objc_msgSend(a3, "pathExtension");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v3, 0);
  if (PreferredIdentifierForTag)
  {
    v5 = PreferredIdentifierForTag;
    v6 = UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC1660]);
    v7 = (void *)v6;
    if (v6 && CFStringGetLength(v6) <= 0)
    {
      CFRelease(v7);
      v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF](EDAMLimitsConstants, "EDAM_MIME_TYPE_GIF");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
  {

  }
  else
  {
    v9 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("gif"));

    if (v9)
    {
      +[EDAMLimitsConstants EDAM_MIME_TYPE_GIF](EDAMLimitsConstants, "EDAM_MIME_TYPE_GIF");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_38:
      v23 = v7;
      v7 = (void *)v10;
      goto LABEL_39;
    }
  }
  +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG](EDAMLimitsConstants, "EDAM_MIME_TYPE_JPEG");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) != 0)
  {

    goto LABEL_15;
  }
  v12 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("jpg"));

  if (v12)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_JPEG](EDAMLimitsConstants, "EDAM_MIME_TYPE_JPEG");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_15:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG](EDAMLimitsConstants, "EDAM_MIME_TYPE_PNG");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v13) & 1) != 0)
  {

    goto LABEL_19;
  }
  v14 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("png"));

  if (v14)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_PNG](EDAMLimitsConstants, "EDAM_MIME_TYPE_PNG");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_19:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV](EDAMLimitsConstants, "EDAM_MIME_TYPE_WAV");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v15) & 1) != 0)
  {

    goto LABEL_23;
  }
  v16 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("wav"));

  if (v16)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_WAV](EDAMLimitsConstants, "EDAM_MIME_TYPE_WAV");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_23:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP3");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v17) & 1) != 0)
  {

    goto LABEL_27;
  }
  v18 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("mp3"));

  if (v18)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_MP3](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP3");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_27:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR](EDAMLimitsConstants, "EDAM_MIME_TYPE_AMR");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v19) & 1) != 0)
  {

    goto LABEL_31;
  }
  v20 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("amr"));

  if (v20)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_AMR](EDAMLimitsConstants, "EDAM_MIME_TYPE_AMR");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_31:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP4_VIDEO");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v21) & 1) != 0)
  {

    goto LABEL_35;
  }
  v22 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("mp4"));

  if (v22)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_MP4_VIDEO](EDAMLimitsConstants, "EDAM_MIME_TYPE_MP4_VIDEO");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_35:
  +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF](EDAMLimitsConstants, "EDAM_MIME_TYPE_PDF");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v23) & 1) != 0)
  {
LABEL_39:

    goto LABEL_40;
  }
  v24 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("pdf"));

  if (v24)
  {
    +[EDAMLimitsConstants EDAM_MIME_TYPE_PDF](EDAMLimitsConstants, "EDAM_MIME_TYPE_PDF");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_40:

  return v7;
}

+ (id)mimeTypeForUTI:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  v4 = UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x24BDC1660]);
  if (v4)
  {
    v5 = (__CFString *)v4;
    if (CFStringGetLength(v4) > 0)
      goto LABEL_9;
    CFRelease(v5);
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("public.jpeg")) & 1) != 0)
  {
    v5 = CFSTR("image/jpeg");
  }
  else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("public.png")))
  {
    v5 = CFSTR("image/png");
  }
  else
  {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

@end
