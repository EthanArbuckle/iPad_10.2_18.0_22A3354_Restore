@implementation HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion

void __HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion_block_invoke()
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[14];
  _QWORD v22[16];

  v22[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786689);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AS"), CFSTR("GU"), CFSTR("MP"), CFSTR("PR"), CFSTR("US"), CFSTR("UM"), CFSTR("VI"), 0);
  v22[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786944);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("HK"), CFSTR("GB"), CFSTR("IE"), CFSTR("DK"), CFSTR("NO"), CFSTR("DE"), CFSTR("AT"), CFSTR("CH"), CFSTR("GR"), CFSTR("HU"), CFSTR("FI"), CFSTR("SE"), CFSTR("FR"), CFSTR("BE"), CFSTR("LU"), CFSTR("NL"), CFSTR("PT"),
                  CFSTR("IT"),
                  CFSTR("ES"),
                  CFSTR("RO"),
                  0);
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 787200);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PL"), CFSTR("CZ"), CFSTR("SK"), CFSTR("IS"), CFSTR("HR"), 0);
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 787456);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CA"), CFSTR("SG"), 0);
  v22[3] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 851968);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v12;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("IN"), 0);
  v22[4] = v0;
  v21[5] = &unk_1E3896700;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("TR"), CFSTR("CL"), CFSTR("NZ"), 0);
  v22[5] = v1;
  v21[6] = &unk_1E3896718;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SA"), 0);
  v22[6] = v2;
  v21[7] = &unk_1E3896730;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ZA"), CFSTR("BH"), CFSTR("BR"), 0);
  v22[7] = v3;
  v21[8] = &unk_1E3896748;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CO"), CFSTR("IL"), CFSTR("KW"), CFSTR("OM"), CFSTR("QA"), CFSTR("AE"), 0);
  v22[8] = v4;
  v21[9] = &unk_1E3896760;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("RU"), CFSTR("KR"), 0);
  v22[9] = v5;
  v21[10] = &unk_1E3896778;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("TW"), 0);
  v22[10] = v6;
  v21[11] = &unk_1E3896790;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("JP"), CFSTR("TH"), 0);
  v22[11] = v7;
  v21[12] = &unk_1E38967A8;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PE"), 0);
  v22[12] = v8;
  v21[13] = &unk_1E38967C0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CN"), 0);
  v22[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion_cinnamonSupportedCountries;
  HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion_cinnamonSupportedCountries = v10;

}

@end
