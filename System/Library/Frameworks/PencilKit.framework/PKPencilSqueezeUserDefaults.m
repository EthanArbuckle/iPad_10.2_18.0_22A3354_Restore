@implementation PKPencilSqueezeUserDefaults

- (PKPencilSqueezeUserDefaults)init
{
  PKPencilSqueezeUserDefaults *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPencilSqueezeUserDefaults;
  v2 = -[PKPencilSqueezeUserDefaults init](&v6, sel_init);
  if (v2)
  {
    PKUserDefaults();
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (void)saveLastPaletteViewStartAngle:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134283521;
      v8 = a2;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Save last palette view start angle: %{private}f", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("PKPencilSqueezeLastPaletteViewStartAngle"));

  }
}

- (id)loadLastPaletteViewStartAngle
{
  void *v1;
  NSObject *v2;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("PKPencilSqueezeLastPaletteViewStartAngle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138477827;
    v5 = v1;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Load last palette view start angle: %{private}@", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

- (void)saveLastPaletteHoverLocation:(CGFloat)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  CGPoint v13;
  CGPoint v14;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13.x = a2;
      v13.y = a3;
      NSStringFromCGPoint(v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138477827;
      v11 = v7;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Save last palette hover location: %{private}@", (uint8_t *)&v10, 0xCu);

    }
    v8 = *(void **)(a1 + 8);
    v14.x = a2;
    v14.y = a3;
    NSStringFromCGPoint(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PKPencilSqueezeLastPaletteHoverLocation"));

  }
}

- (id)loadLastPaletteHoverLocation
{
  NSString *v1;
  NSObject *v2;
  CGPoint v3;
  void *v4;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("PKPencilSqueezeLastPaletteHoverLocation"));
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138477827;
    v7 = v1;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Load last palette hover location: %{private}@", (uint8_t *)&v6, 0xCu);
  }

  if (v1)
  {
    v3 = CGPointFromString(v1);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v3.x, v3.y);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
