@implementation HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion

void __HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion_block_invoke()
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
  _QWORD v16[14];
  _QWORD v17[16];

  v17[14] = *MEMORY[0x1E0C80C00];
  v16[0] = &unk_1E38965B0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AS"), CFSTR("GU"), CFSTR("MP"), CFSTR("PR"), CFSTR("US"), CFSTR("UM"), CFSTR("VI"), 0);
  v17[0] = v15;
  v16[1] = &unk_1E38965C8;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("HK"), CFSTR("GB"), CFSTR("IE"), CFSTR("DK"), CFSTR("NO"), CFSTR("DE"), CFSTR("AT"), CFSTR("CH"), CFSTR("GR"), CFSTR("HU"), CFSTR("FI"), CFSTR("SE"), CFSTR("FR"), CFSTR("BE"), CFSTR("LU"), CFSTR("NL"), CFSTR("PT"),
                  CFSTR("IT"),
                  CFSTR("ES"),
                  CFSTR("RO"),
                  0);
  v17[1] = v14;
  v16[2] = &unk_1E38965E0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PL"), CFSTR("CZ"), CFSTR("SK"), CFSTR("IS"), CFSTR("HR"), 0);
  v17[2] = v13;
  v16[3] = &unk_1E38965F8;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CA"), CFSTR("SG"), 0);
  v17[3] = v12;
  v16[4] = &unk_1E3896610;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("IN"), 0);
  v17[4] = v0;
  v16[5] = &unk_1E3896628;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("TR"), CFSTR("CL"), CFSTR("NZ"), 0);
  v17[5] = v1;
  v16[6] = &unk_1E3896640;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SA"), 0);
  v17[6] = v2;
  v16[7] = &unk_1E3896658;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ZA"), CFSTR("BH"), CFSTR("BR"), 0);
  v17[7] = v3;
  v16[8] = &unk_1E3896670;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CO"), CFSTR("IL"), CFSTR("KW"), CFSTR("OM"), CFSTR("QA"), CFSTR("AE"), 0);
  v17[8] = v4;
  v16[9] = &unk_1E3896688;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("RU"), CFSTR("KR"), 0);
  v17[9] = v5;
  v16[10] = &unk_1E38966A0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("TW"), 0);
  v17[10] = v6;
  v16[11] = &unk_1E38966B8;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("JP"), CFSTR("TH"), 0);
  v17[11] = v7;
  v16[12] = &unk_1E38966D0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("PE"), 0);
  v17[12] = v8;
  v16[13] = &unk_1E38966E8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("CN"), 0);
  v17[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion_cinnamonSupportedCountries;
  HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion_cinnamonSupportedCountries = v10;

}

@end
