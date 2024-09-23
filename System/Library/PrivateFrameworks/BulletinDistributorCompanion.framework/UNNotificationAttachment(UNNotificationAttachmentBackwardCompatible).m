@implementation UNNotificationAttachment(UNNotificationAttachmentBackwardCompatible)

+ (void)blt_swizzleEncodeWithCoder
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__UNNotificationAttachment_UNNotificationAttachmentBackwardCompatible__blt_swizzleEncodeWithCoder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blt_swizzleEncodeWithCoder_onceToken != -1)
    dispatch_once(&blt_swizzleEncodeWithCoder_onceToken, block);
}

- (void)blt_encodeWithCoder:()UNNotificationAttachmentBackwardCompatible
{
  id v4;
  void *v5;
  NSObject *v6;
  UNImageNotificationAttachmentOptions *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __objc2_class *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(a1, "blt_encodeWithCoder:", v4);
  objc_msgSend(a1, "_blt_encodedShouldAddNotificationAttachmentOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(a1, "family") == 2)
    {
      blt_ids_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "Encoding UNImageNotificationAttachmentOptions", buf, 2u);
      }

      v7 = objc_alloc_init(UNImageNotificationAttachmentOptions);
      -[UNImageNotificationAttachmentOptions setHiddenFromDefaultExpandedView:](v7, "setHiddenFromDefaultExpandedView:", 0);
      objc_msgSend(a1, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "displayLocation");

      if (v9 == 1)
        -[UNImageNotificationAttachmentOptions setHiddenFromDefaultExpandedView:](v7, "setHiddenFromDefaultExpandedView:", 1);
    }
    else
    {
      if (objc_msgSend(a1, "family") == 3)
      {
        blt_ids_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_2173D9000, v10, OS_LOG_TYPE_DEFAULT, "Encoding UNMovieNotificationAttachmentOptions", v14, 2u);
        }

        v11 = UNMovieNotificationAttachmentOptions;
      }
      else
      {
        if (objc_msgSend(a1, "family") != 1)
        {
LABEL_17:
          objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(a1, "family"), CFSTR("family"));
          goto LABEL_18;
        }
        blt_ids_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_DEFAULT, "Encoding UNSoundNotificationAttachmentOptions", v13, 2u);
        }

        v11 = UNAudioNotificationAttachmentOptions;
      }
      v7 = (UNImageNotificationAttachmentOptions *)objc_alloc_init(v11);
    }
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("options"));

    goto LABEL_17;
  }
LABEL_18:

}

- (void)blt_preEncodeShouldAddNotificationAttachmentOptions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF8830], "blt_swizzleEncodeWithCoder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_blt_setEncodedShouldAddNotificationAttachmentOptions:", v2);

}

- (uint64_t)blt_postEncodeNotificationAttachmentOptions
{
  return objc_msgSend(a1, "_blt_setEncodedShouldAddNotificationAttachmentOptions:", 0);
}

- (void)_blt_setEncodedShouldAddNotificationAttachmentOptions:()UNNotificationAttachmentBackwardCompatible
{
  objc_setAssociatedObject(a1, sel__blt_encodedShouldAddNotificationAttachmentOptions, a3, (void *)0x301);
}

- (id)_blt_encodedShouldAddNotificationAttachmentOptions
{
  void *v1;
  void *v2;
  id v3;

  objc_getAssociatedObject(a1, sel__blt_encodedShouldAddNotificationAttachmentOptions);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

@end
