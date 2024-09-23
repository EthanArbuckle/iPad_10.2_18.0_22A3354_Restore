@implementation UNNotificationContent(BLTBackwardCompatible)

+ (void)blt_swizzleEncodeWithCoder
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__UNNotificationContent_BLTBackwardCompatible__blt_swizzleEncodeWithCoder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blt_swizzleEncodeWithCoder_onceToken_34 != -1)
    dispatch_once(&blt_swizzleEncodeWithCoder_onceToken_34, block);
}

- (void)blt_encodeWithCoder:()BLTBackwardCompatible
{
  id v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "blt_encodeWithCoder:", v4);
  objc_msgSend(a1, "_blt_encodedShouldAddToNotificationsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    blt_ids_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = objc_msgSend(v5, "BOOLValue");
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "Encoding content shouldAddToNotificationsList: %{BOOL}u", (uint8_t *)v7, 8u);
    }

    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "BOOLValue"), CFSTR("shouldAddToNotificationsList"));
  }

}

- (void)blt_preEncodeShouldAddToNotificationsList:()BLTBackwardCompatible
{
  id v5;

  objc_msgSend(MEMORY[0x24BDF8848], "blt_swizzleEncodeWithCoder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_blt_setEncodedShouldAddToNotificationsList:", v5);

}

- (uint64_t)blt_postEncode
{
  return objc_msgSend(a1, "_blt_setEncodedShouldAddToNotificationsList:", 0);
}

- (void)_blt_setEncodedShouldAddToNotificationsList:()BLTBackwardCompatible
{
  objc_setAssociatedObject(a1, sel__blt_encodedShouldAddToNotificationsList, a3, (void *)0x301);
}

- (id)_blt_encodedShouldAddToNotificationsList
{
  void *v1;
  void *v2;
  id v3;

  objc_getAssociatedObject(a1, sel__blt_encodedShouldAddToNotificationsList);
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
