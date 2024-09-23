@implementation IMMomentShareUtilities

+ (id)photoShareURLFromPluginBundleID:(id)a3 contentString:(id)a4 payload:(id)a5 shouldAccept:(BOOL *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.messages.URLBalloonProvider")))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(a4, "length");
    v12 = *MEMORY[0x1E0D365F0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19E2F0370;
    v17[3] = &unk_1E3FB8790;
    v17[4] = v10;
    objc_msgSend(a4, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v17);
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      v13 = (void *)objc_msgSend(v10, "firstObject");
      v14 = v13;
      if (v13 && !_IMShouldProcessURLForPhotosExtension(v13))
        v14 = 0;
      if (v10)

      goto LABEL_10;
    }
    if (v10)

    return 0;
  }
  if (!objc_msgSend(a3, "isEqualToString:", IMBalloonExtensionIDWithSuffix((uint64_t)CFSTR("com.apple.mobileslideshow.PhotosMessagesApp"))))return 0;
  v14 = (void *)IMPhotosShareURLFromPayloadData((uint64_t)a5);
LABEL_10:
  if (a6)
  {
    if (v14)
    {
      *a6 = 1;
      v15 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1), "objectForKey:", CFSTR("md-disable-photo-share-auto-accept"));
      if (v15)
      {
        if (objc_msgSend(v15, "BOOLValue"))
          *a6 = 0;
      }
    }
  }
  return v14;
}

@end
