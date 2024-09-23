@implementation MPMRInitPropertyRadioStationMap

id ___MPMRInitPropertyRadioStationMap_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raPrID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMRInitPropertyRadioStationMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raBID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMRInitPropertyRadioStationMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raPUL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ___MPMRInitPropertyRadioStationMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raSty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMRInitPropertyRadioStationMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raTy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMRInitPropertyRadioStationMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("raAttrLbl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___MPMRInitPropertyRadioStationMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___MPMRInitPropertyRadioStationMap_block_invoke_2;
  v6[3] = &unk_1E3162BD0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "setRadioIdentifiersWithBlock:", v6);

}

void ___MPMRInitPropertyRadioStationMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "radioStationStringIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStationStringID:", v4);

}

@end
