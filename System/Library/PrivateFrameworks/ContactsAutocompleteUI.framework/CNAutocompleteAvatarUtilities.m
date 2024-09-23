@implementation CNAutocompleteAvatarUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_1_2 != -1)
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_17);
  return (id)os_log_cn_once_object_1_2;
}

void __39__CNAutocompleteAvatarUtilities_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "avatar");
  v1 = (void *)os_log_cn_once_object_1_2;
  os_log_cn_once_object_1_2 = (uint64_t)v0;

}

+ (id)roadsideImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (roadsideImage_cn_once_token_3 != -1)
    dispatch_once(&roadsideImage_cn_once_token_3, block);
  return (id)roadsideImage_cn_once_object_3;
}

void __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke()
{
  NSObject *v0;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  CGColor *v3;
  CGColor *v4;
  CGGradient *v5;
  CGFloat MinY;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CGFloat v15[2];
  CGFloat locations[2];
  _QWORD v17[2];
  CGFloat v18[2];
  __int128 v19;
  CGFloat components[2];
  __int128 v21;
  uint64_t v22;
  CGSize v23;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke_cold_1(v0);

  v23.width = 100.0;
  v23.height = 100.0;
  UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1B1144E90;
  v21 = unk_1B1144EA0;
  v3 = CGColorCreate(DeviceRGB, components);
  *(_OWORD *)v18 = xmmword_1B1144EB0;
  v19 = unk_1B1144EC0;
  v4 = CGColorCreate(DeviceRGB, v18);
  v17[0] = v3;
  v17[1] = v4;
  *(_OWORD *)locations = xmmword_1B1144E80;
  v5 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2), locations);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = 100.0;
  v26.size.height = 100.0;
  MinY = CGRectGetMinY(v26);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = 100.0;
  v27.size.height = 100.0;
  v25.y = CGRectGetMaxY(v27);
  v24.x = 0.0;
  v25.x = 0.0;
  v24.y = MinY;
  CGContextDrawLinearGradient(CurrentContext, v5, v24, v25, 0);
  CGGradientRelease(v5);
  CGColorRelease(v3);
  CGColorRelease(v4);
  CGColorSpaceRelease(DeviceRGB);
  v7 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("car.front.waves.down.fill"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = 100.0;
  v28.size.height = 100.0;
  v29 = CGRectInset(v28, 20.0, 20.0);
  objc_msgSend(v12, "drawInRect:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  v14 = (void *)roadsideImage_cn_once_object_3;
  roadsideImage_cn_once_object_3 = v13;

}

void __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B10FF000, log, OS_LOG_TYPE_DEBUG, "Generating roadside image", v1, 2u);
}

@end
