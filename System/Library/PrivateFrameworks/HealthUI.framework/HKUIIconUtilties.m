@implementation HKUIIconUtilties

+ (id)appleDeviceIconForHardwareVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CB59D8]) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CB59E0]) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CB59F0]) & 1) != 0
    || objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CB59E8]))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D3A838];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v5, "symbolForTypeIdentifier:error:", v6, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;

    v9 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_configurationWithHierarchicalColors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v13 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_systemImageNamed:withConfiguration:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
