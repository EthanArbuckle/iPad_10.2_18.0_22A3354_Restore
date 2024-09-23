@implementation CNUICoreContactPhotoValueFilter

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_20 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_20, &__block_literal_global_69);
    v5 = CNGuardOSLog_cn_once_object_0_20;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_20, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactRelationshipsFilter contactByFilteringOutPropertyValueOfContact:].cold.1(v5);
  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[CNUICoreContactPhotoValueFilter filterPropertyValuesFromContact:](self, "filterPropertyValuesFromContact:", v6);

  return v6;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setImageData:", 0);
  objc_msgSend(v3, "setThumbnailImageData:", 0);
  objc_msgSend(v3, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setImageType:", 0);
  objc_msgSend(v3, "setImageHash:", 0);
  objc_msgSend(v3, "setExternalImageURI:", 0);
  objc_msgSend(v3, "setFullscreenImageData:", 0);

}

- (NSString)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
