@implementation ACCNavigationLaneGuidanceInfo(ACCNavigationInfo)

- (uint64_t)cr_setInfo:()ACCNavigationInfo data:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  if ((_DWORD)a3 == 2)
  {
    objc_opt_class();
    v7 = v6;
    if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    v9 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_setInfo_data___block_invoke;
    v13[3] = &unk_250963B10;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
    v6 = v10;

  }
  v11 = objc_msgSend(a1, "setInfo:data:", a3, v6);

  return v11;
}

- (id)cr_dictionary
{
  void *v2;
  unsigned __int16 v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = (void *)objc_opt_new();
  v3 = 0;
  do
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(a1, "copyInfo:", v3);
    if (v5)
    {
      if (v3 == 2)
      {
        v6 = (void *)objc_opt_new();
        objc_opt_class();
        v7 = v5;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;

        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __65__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_dictionary__block_invoke;
        v12[3] = &unk_250963B38;
        v13 = v6;
        v9 = v6;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v3);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v8);
      }

    }
    ++v3;
  }
  while (v4 < 3);
  return v2;
}

@end
