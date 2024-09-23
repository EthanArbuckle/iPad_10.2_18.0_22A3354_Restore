@implementation AMDDomains

+ (int64_t)getCodeForDomain:(id)a3
{
  id v3;
  void *v4;
  int64_t v6;
  id v7;
  int v8;
  id location[3];
  int64_t v10;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (!getCodeForDomain__domainMap)
    {
      v11[0] = CFSTR("apps");
      v12[0] = &unk_1EA4CED10;
      v11[1] = CFSTR("books");
      v12[1] = &unk_1EA4CED28;
      v11[2] = CFSTR("commerce");
      v12[2] = &unk_1EA4CED40;
      v11[3] = CFSTR("music");
      v12[3] = &unk_1EA4CED58;
      v11[4] = CFSTR("fitness");
      v12[4] = &unk_1EA4CED70;
      v11[5] = CFSTR("podcasts");
      v12[5] = &unk_1EA4CED88;
      v11[6] = CFSTR("video");
      v12[6] = &unk_1EA4CEDA0;
      v11[7] = CFSTR("common");
      v12[7] = &unk_1EA4CEDB8;
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
      v4 = (void *)getCodeForDomain__domainMap;
      getCodeForDomain__domainMap = (uint64_t)v3;

    }
    v7 = (id)objc_msgSend((id)getCodeForDomain__domainMap, "objectForKey:", location[0]);
    if (v7)
      v6 = objc_msgSend(v7, "unsignedIntValue");
    else
      v6 = 0;
    v10 = v6;
    v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v10 = 0;
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

@end
