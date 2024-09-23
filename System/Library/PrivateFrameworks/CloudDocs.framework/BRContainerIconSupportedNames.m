@implementation BRContainerIconSupportedNames

void ___BRContainerIconSupportedNames_block_invoke()
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
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 40, 40, CFSTR("iOS"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 80, 80, CFSTR("iOS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 120, 120, CFSTR("iOS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 16, 16, CFSTR("OSX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 32, 32, CFSTR("OSX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 64, 64, CFSTR("OSX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 128, 128, CFSTR("OSX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), 256, 256, CFSTR("OSX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "initWithArray:", v8);
  v10 = (void *)_BRContainerIconSupportedNames_iconNames;
  _BRContainerIconSupportedNames_iconNames = v9;

}

@end
