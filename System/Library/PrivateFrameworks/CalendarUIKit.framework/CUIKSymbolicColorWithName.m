@implementation CUIKSymbolicColorWithName

void __CUIKSymbolicColorWithName_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0DDBBE8];
  v0 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarPurple"), v22, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v23[1] = *MEMORY[0x1E0DDBBD8];
  v1 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarGreen"), v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  v23[2] = *MEMORY[0x1E0DDBBC0];
  v2 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarBlue"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v4;
  v23[3] = *MEMORY[0x1E0DDBBF8];
  v5 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarYellow"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = *MEMORY[0x1E0DDBBC8];
  v8 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarBrown"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  v23[5] = *MEMORY[0x1E0DDBBF0];
  v11 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarRed"), v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v13;
  v23[6] = *MEMORY[0x1E0DDBBE0];
  v14 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CalendarOrange"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)CUIKSymbolicColorWithName_kColors;
  CUIKSymbolicColorWithName_kColors = v17;

}

@end
