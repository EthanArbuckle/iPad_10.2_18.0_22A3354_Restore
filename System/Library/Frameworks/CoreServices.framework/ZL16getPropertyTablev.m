@implementation ZL16getPropertyTablev

_QWORD *___ZL16getPropertyTablev_block_invoke()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  unsigned __int8 v2;
  uint64_t *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  {
    v20 = *MEMORY[0x1E0C9AC60];
    once_createPropertyTable(void)::baseDependencyKeys = *MEMORY[0x1E0C9B5A0];
    *(_QWORD *)algn_1ECD2A1B8 = v20;
    v21 = *MEMORY[0x1E0C9B4F0];
    qword_1ECD2A1C0 = *MEMORY[0x1E0C9B4E0];
    unk_1ECD2A1C8 = v21;
    v22 = *MEMORY[0x1E0C9AD28];
    qword_1ECD2A1D0 = *MEMORY[0x1E0C9B5B0];
    unk_1ECD2A1D8 = v22;
    v23 = *MEMORY[0x1E0C9B4D0];
    qword_1ECD2A1E0 = *MEMORY[0x1E0C9AD50];
    unk_1ECD2A1E8 = v23;
    v24 = *MEMORY[0x1E0C9B4C8];
    qword_1ECD2A1F0 = *MEMORY[0x1E0C9B550];
    unk_1ECD2A1F8 = v24;
  }
  if ((v1 & 1) == 0
  {
    v25 = *MEMORY[0x1E0C9AC60];
    once_createPropertyTable(void)::isApplicationDependencyKeys = *MEMORY[0x1E0C9B5A0];
    unk_1ECD2A2D0 = v25;
    v26 = *MEMORY[0x1E0C9B4F0];
    qword_1ECD2A2D8 = *MEMORY[0x1E0C9B4E0];
    unk_1ECD2A2E0 = v26;
    v27 = *MEMORY[0x1E0C9AD28];
    qword_1ECD2A2E8 = *MEMORY[0x1E0C9B5B0];
    unk_1ECD2A2F0 = v27;
    v28 = *MEMORY[0x1E0C9B4D0];
    qword_1ECD2A2F8 = *MEMORY[0x1E0C9AD50];
    unk_1ECD2A300 = v28;
    v29 = *MEMORY[0x1E0C9B3F0];
    qword_1ECD2A308 = *MEMORY[0x1E0C9B550];
    unk_1ECD2A310 = v29;
  }
  v3 = (uint64_t *)MEMORY[0x1E0C9B580];
  if ((v2 & 1) == 0
  {
    v30 = *v3;
    once_createPropertyTable(void)::distinctLocalizedNameKeys = *MEMORY[0x1E0C9B5A0];
    *(_QWORD *)algn_1ECD2A2B8 = v30;
  }
  if ((v4 & 1) == 0
  {
    v31 = *MEMORY[0x1E0C9B718];
    once_createPropertyTable(void)::volLocNameDependencyKeys = *MEMORY[0x1E0C9B7E8];
    unk_1ECD2A280 = v31;
    v32 = *MEMORY[0x1E0C9B550];
    qword_1ECD2A288 = *MEMORY[0x1E0C9B5A0];
    unk_1ECD2A290 = v32;
    v33 = *MEMORY[0x1E0C9B4E0];
    qword_1ECD2A298 = *MEMORY[0x1E0C9B500];
    unk_1ECD2A2A0 = v33;
  }
  if ((v5 & 1) == 0
  {
    once_createPropertyTable(void)::canSetHiddenExtensionKeys = *v3;
  }
  if ((v6 & 1) == 0
  {
    once_createPropertyTable(void)::hiddenBySystemDependencyKeys = *MEMORY[0x1E0C9B4D8];
  }
  {
    v34 = *MEMORY[0x1E0C9AC60];
    once_createPropertyTable(void)::bindingDependencyKeys = *MEMORY[0x1E0C9B5A0];
    *(_QWORD *)algn_1ECD2A248 = v34;
    v35 = *MEMORY[0x1E0C9B5B0];
    qword_1ECD2A250 = *MEMORY[0x1E0C9ACA0];
    unk_1ECD2A258 = v35;
    v36 = *MEMORY[0x1E0C9AD28];
    qword_1ECD2A260 = *MEMORY[0x1E0C9B3F0];
    unk_1ECD2A268 = v36;
    qword_1ECD2A270 = *MEMORY[0x1E0C9AD50];
  }
  v9 = (uint64_t *)MEMORY[0x1E0C9B5E0];
  {
    once_createPropertyTable(void)::typeDescriptionKeys = *v9;
  }
  if ((v10 & 1) != 0)
  {
    v11 = *MEMORY[0x1E0C9B4D8];
  }
  else
  {
    v11 = *MEMORY[0x1E0C9B4D8];
    if (v37)
    {
      once_createPropertyTable(void)::architecturesDependencyKeys = *MEMORY[0x1E0C9B4D8];
    }
  }
  v12 = *MEMORY[0x1E0C9B508];
  v13 = *MEMORY[0x1E0C9ABD0];
  v14 = *MEMORY[0x1E0C9ABC8];
  v15 = *v3;
  v16 = *MEMORY[0x1E0C9AC20];
  v17 = *MEMORY[0x1E0C9AD08];
  v38 = *MEMORY[0x1E0C9AD10];
  v39 = *MEMORY[0x1E0C9AD00];
  v40 = *MEMORY[0x1E0C9ABF8];
  v41 = *v9;
  v42 = *MEMORY[0x1E0C9AC10];
  v43 = *MEMORY[0x1E0C9B588];
  v44 = *MEMORY[0x1E0C9AD18];
  v45 = *MEMORY[0x1E0C9ABF0];
  v46 = *MEMORY[0x1E0C9AC78];
  v47 = *MEMORY[0x1E0C9ABE0];
  v48 = *MEMORY[0x1E0C9ABB8];
  v49 = *MEMORY[0x1E0C9B700];
  v50 = *MEMORY[0x1E0C9ABC0];
  v18 = (char *)operator new(0x4D0uLL);
  *(_QWORD *)v18 = v12;
  *((_QWORD *)v18 + 1) = 1;
  *((_QWORD *)v18 + 2) = LaunchServices::URLPropertyProvider::prepareIsPackageValue;
  *((_QWORD *)v18 + 3) = LaunchServices::URLPropertyProvider::prepareIsPackageMimic;
  *((_QWORD *)v18 + 4) = LaunchServices::URLPropertyProvider::setIsPackageValue;
  *((_QWORD *)v18 + 5) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 6) = 10;
  *((_QWORD *)v18 + 7) = v11;
  *((_QWORD *)v18 + 8) = 0;
  *((_QWORD *)v18 + 9) = LaunchServices::URLPropertyProvider::prepareIsApplicationValue;
  *((_QWORD *)v18 + 10) = LaunchServices::URLPropertyProvider::prepareIsApplicationMimic;
  *((_QWORD *)v18 + 11) = 0;
  *((_QWORD *)v18 + 12) = &once_createPropertyTable(void)::isApplicationDependencyKeys;
  *((_QWORD *)v18 + 13) = 10;
  *((_QWORD *)v18 + 14) = v13;
  *((_QWORD *)v18 + 15) = 0;
  *((_QWORD *)v18 + 16) = LaunchServices::URLPropertyProvider::prepareApplicationFlags;
  *((_QWORD *)v18 + 17) = LaunchServices::URLPropertyProvider::prepareAppFlagsMimic;
  *((_QWORD *)v18 + 18) = 0;
  *((_QWORD *)v18 + 19) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 20) = 10;
  *((_QWORD *)v18 + 21) = v14;
  *((_QWORD *)v18 + 22) = 0;
  *((_QWORD *)v18 + 23) = LaunchServices::URLPropertyProvider::prepareApplicationFlags;
  *((_QWORD *)v18 + 24) = LaunchServices::URLPropertyProvider::prepareAppFlagsMimic;
  *((_QWORD *)v18 + 25) = 0;
  *((_QWORD *)v18 + 26) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 27) = 10;
  *((_QWORD *)v18 + 28) = v15;
  *((_QWORD *)v18 + 29) = 1;
  *((_QWORD *)v18 + 30) = LaunchServices::URLPropertyProvider::prepareLocalizedNameValue;
  *((_QWORD *)v18 + 31) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((_QWORD *)v18 + 32) = 0;
  *((_QWORD *)v18 + 33) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 34) = 10;
  *((_QWORD *)v18 + 35) = v16;
  *((_QWORD *)v18 + 36) = 0;
  *((_QWORD *)v18 + 37) = LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue;
  *((_OWORD *)v18 + 19) = 0u;
  *((_QWORD *)v18 + 40) = &once_createPropertyTable(void)::distinctLocalizedNameKeys;
  *((_QWORD *)v18 + 41) = 2;
  *((_QWORD *)v18 + 42) = v17;
  *((_QWORD *)v18 + 43) = 0;
  *((_QWORD *)v18 + 44) = LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue;
  *((_QWORD *)v18 + 45) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((_QWORD *)v18 + 46) = 0;
  *((_QWORD *)v18 + 47) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 48) = 10;
  *((_QWORD *)v18 + 49) = v38;
  *((_QWORD *)v18 + 50) = 0;
  *((_QWORD *)v18 + 51) = LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue;
  *((_QWORD *)v18 + 52) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((_QWORD *)v18 + 53) = 0;
  *((_QWORD *)v18 + 54) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 55) = 10;
  *((_QWORD *)v18 + 56) = v39;
  *((_QWORD *)v18 + 57) = 0;
  *((_QWORD *)v18 + 58) = LaunchServices::URLPropertyProvider::prepareLocalizedNameComponentsValue;
  *((_QWORD *)v18 + 59) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((_QWORD *)v18 + 60) = 0;
  *((_QWORD *)v18 + 61) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 62) = 10;
  *((_QWORD *)v18 + 63) = v40;
  *((_QWORD *)v18 + 64) = 0;
  *((_QWORD *)v18 + 65) = LaunchServices::URLPropertyProvider::prepareCanSetHiddenExtensionValue;
  *((_QWORD *)v18 + 66) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((_QWORD *)v18 + 67) = 0;
  *((_QWORD *)v18 + 68) = &once_createPropertyTable(void)::canSetHiddenExtensionKeys;
  *((_QWORD *)v18 + 69) = 1;
  *((_QWORD *)v18 + 70) = v41;
  *((_QWORD *)v18 + 71) = 1;
  *((_QWORD *)v18 + 72) = LaunchServices::URLPropertyProvider::prepareTypeIdentifierAndObjectValue;
  *((_QWORD *)v18 + 73) = LaunchServices::URLPropertyProvider::prepareTypeMimic;
  *((_QWORD *)v18 + 74) = 0;
  *((_QWORD *)v18 + 75) = &once_createPropertyTable(void)::bindingDependencyKeys;
  *((_QWORD *)v18 + 76) = 7;
  *((_QWORD *)v18 + 77) = v42;
  *((_QWORD *)v18 + 78) = 1;
  *((_QWORD *)v18 + 79) = LaunchServices::URLPropertyProvider::prepareTypeIdentifierAndObjectValue;
  *((_QWORD *)v18 + 80) = LaunchServices::URLPropertyProvider::prepareTypeMimic;
  *((_QWORD *)v18 + 81) = 0;
  *((_QWORD *)v18 + 82) = &once_createPropertyTable(void)::bindingDependencyKeys;
  *((_QWORD *)v18 + 83) = 7;
  *((_QWORD *)v18 + 84) = v43;
  *((_QWORD *)v18 + 85) = 1;
  *((_QWORD *)v18 + 86) = LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionValue;
  *((_QWORD *)v18 + 87) = LaunchServices::URLPropertyProvider::prepareBindingMimic;
  *((_QWORD *)v18 + 88) = 0;
  *((_QWORD *)v18 + 89) = &once_createPropertyTable(void)::typeDescriptionKeys;
  *((_QWORD *)v18 + 90) = 1;
  *((_QWORD *)v18 + 91) = v44;
  *((_QWORD *)v18 + 92) = 0;
  *((_QWORD *)v18 + 93) = LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue;
  *((_QWORD *)v18 + 94) = LaunchServices::URLPropertyProvider::prepareBindingMimic;
  *((_QWORD *)v18 + 95) = 0;
  *((_QWORD *)v18 + 96) = &once_createPropertyTable(void)::typeDescriptionKeys;
  *((_QWORD *)v18 + 97) = 1;
  *((_QWORD *)v18 + 98) = v45;
  *((_QWORD *)v18 + 99) = 0;
  *((_QWORD *)v18 + 100) = LaunchServices::URLPropertyProvider::prepareBundleIdentifierValue;
  *((_QWORD *)v18 + 101) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 102) = 0;
  *((_QWORD *)v18 + 103) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 104) = 10;
  *((_QWORD *)v18 + 105) = v46;
  *((_QWORD *)v18 + 106) = 0;
  *((_QWORD *)v18 + 107) = LaunchServices::URLPropertyProvider::prepareHFSTypeCodeValue;
  *((_QWORD *)v18 + 108) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 109) = 0;
  *((_QWORD *)v18 + 110) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 111) = 10;
  *((_QWORD *)v18 + 112) = v47;
  *((_QWORD *)v18 + 113) = 0;
  *((_QWORD *)v18 + 114) = LaunchServices::URLPropertyProvider::prepareArchitecturesValue;
  *((_QWORD *)v18 + 115) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 116) = 0;
  *((_QWORD *)v18 + 117) = &once_createPropertyTable(void)::architecturesDependencyKeys;
  *((_QWORD *)v18 + 118) = 1;
  *((_QWORD *)v18 + 119) = v48;
  *((_QWORD *)v18 + 120) = 0;
  *((_QWORD *)v18 + 121) = LaunchServices::URLPropertyProvider::prepareArchitecturesValue;
  *((_QWORD *)v18 + 122) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 123) = 0;
  *((_QWORD *)v18 + 124) = &once_createPropertyTable(void)::architecturesDependencyKeys;
  *((_QWORD *)v18 + 125) = 1;
  *((_QWORD *)v18 + 126) = v49;
  *((_QWORD *)v18 + 127) = 0;
  *((_QWORD *)v18 + 128) = LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue;
  *(_OWORD *)(v18 + 1032) = 0u;
  *((_QWORD *)v18 + 131) = &once_createPropertyTable(void)::volLocNameDependencyKeys;
  *((_QWORD *)v18 + 132) = 6;
  *((_QWORD *)v18 + 133) = CFSTR("_NSURLIsHiddenBySystemKey");
  *((_QWORD *)v18 + 134) = 0;
  *((_QWORD *)v18 + 135) = LaunchServices::URLPropertyProvider::prepareIsHiddenBySystemValue;
  *((_QWORD *)v18 + 136) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 137) = 0;
  *((_QWORD *)v18 + 138) = &once_createPropertyTable(void)::hiddenBySystemDependencyKeys;
  *((_QWORD *)v18 + 139) = 1;
  *((_QWORD *)v18 + 140) = CFSTR("_NSURLIsHiddenBySystemChangedNotificationsKey");
  *((_QWORD *)v18 + 141) = 0;
  *((_QWORD *)v18 + 142) = LaunchServices::URLPropertyProvider::prepareIsHiddenBySystemNotificationsValue;
  *((_QWORD *)v18 + 143) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((_QWORD *)v18 + 144) = 0;
  *((_QWORD *)v18 + 145) = &once_createPropertyTable(void)::hiddenBySystemDependencyKeys;
  *((_QWORD *)v18 + 146) = 1;
  *((_QWORD *)v18 + 147) = v50;
  *((_QWORD *)v18 + 148) = 0;
  *((_QWORD *)v18 + 149) = LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue;
  *((_OWORD *)v18 + 75) = 0u;
  *((_QWORD *)v18 + 152) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((_QWORD *)v18 + 153) = 10;
  result = (_QWORD *)operator new();
  *result = v18;
  result[1] = v18 + 1232;
  result[2] = v18 + 1232;
  LaunchServices::URLPropertyProvider::propertyTable = (uint64_t)result;
  return result;
}

@end
