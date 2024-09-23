@implementation NSValue(CoreMaterialAdditions)

- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "mt_identityValueForMaterialSettingsProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "isEqual:", v5);
  return v6;
}

+ (id)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4;
  id *v5;
  id v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("luminanceAmount")) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0CD2E20];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("blurRadius")) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0CD2C88];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("saturation")) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0CD2C00];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("brightness")) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0CD2BB8];
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("colorMatrix")) & 1) == 0)
    {

      goto LABEL_14;
    }
    v5 = (id *)MEMORY[0x1E0CD2BF0];
  }
  v6 = *v5;

  if (v6)
  {
    objc_msgSend(a1, "mt_identityValueForFilter:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_14:
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("backdropScale")) & 1) != 0)
  {
    v6 = 0;
    v7 = &unk_1E587FDE8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("averageColorEnabled")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("blurAtEnd")) & 1) != 0)
  {
    v6 = 0;
    v7 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v7 = &unk_1E587FD28;
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tintAlpha")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("zoom")))
        v7 = 0;
    }
  }
LABEL_19:

  return v7;
}

+ (id)mt_identityValueForFilter:()CoreMaterialAdditions
{
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;
  _OWORD v10[5];

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD2C00]) & 1) != 0)
  {
    v4 = &unk_1E587FDE8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD2BF0]))
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    v10[2] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    v10[3] = v5;
    v10[4] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
    v10[0] = *MEMORY[0x1E0CD2338];
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v10, "{CAColorMatrix=ffffffffffffffffffff}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (v4)
    v7 = v4;
  else
    v7 = &unk_1E587FD28;
  v8 = v7;

  return v8;
}

- (uint64_t)mt_isIdentityValueForFilter:()CoreMaterialAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "mt_identityValueForFilter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "isEqual:", v5);
  return v6;
}

@end
