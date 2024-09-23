@implementation ZL28

void *___ZL28_HDDefaultSourceOrderCompareP8HKSourceS0__block_invoke(void *a1)
{
  id v1;
  void *v2;
  char v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "_isPreferredSource"))
  {
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7630]);

    if ((v3 & 1) != 0)
    {
      v4 = &unk_1E6DFAE80;
    }
    else if ((objc_msgSend(v1, "_isConnectedGymSource") & 1) != 0)
    {
      v4 = &unk_1E6DFAE98;
    }
    else if ((objc_msgSend(v1, "_isAppleWatch") & 1) != 0)
    {
      v4 = &unk_1E6DFAEB0;
    }
    else if ((objc_msgSend(v1, "_isAppleDevice") & 1) != 0)
    {
      v4 = &unk_1E6DFAEC8;
    }
    else if (objc_msgSend(v1, "_isApplication"))
    {
      v4 = &unk_1E6DFAEE0;
    }
    else
    {
      v4 = &unk_1E6DFAEF8;
    }
  }
  else
  {
    v4 = &unk_1E6DFAF10;
  }

  return v4;
}

@end
