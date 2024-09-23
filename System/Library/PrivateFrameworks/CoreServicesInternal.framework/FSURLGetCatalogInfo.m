@implementation FSURLGetCatalogInfo

const void *___FSURLGetCatalogInfo_block_invoke()
{
  int *v0;
  const void *result;
  int v2;

  if ((_ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable & 1) == 0)
  {
    _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 2;
    qword_1EDC2C050 = *MEMORY[0x1E0C9B548];
    unk_1EDC2C058 = 0;
    dword_1EDC2C060 = 2;
    qword_1EDC2C068 = *MEMORY[0x1E0C9B538];
    unk_1EDC2C070 = 0;
    dword_1EDC2C078 = 49154;
    qword_1EDC2C080 = *MEMORY[0x1E0C9B4E0];
    unk_1EDC2C088 = 0;
    dword_1EDC2C090 = 2;
    qword_1EDC2C098 = *MEMORY[0x1E0C9B570];
    unk_1EDC2C0A0 = 0;
    dword_1EDC2C0A8 = 2;
    qword_1EDC2C0B0 = *MEMORY[0x1E0C9B500];
    unk_1EDC2C0B8 = 0;
    dword_1EDC2C0C0 = 8;
    qword_1EDC2C0C8 = *MEMORY[0x1E0C9AD30];
    unk_1EDC2C0D0 = 0;
    dword_1EDC2C0D8 = 24;
    qword_1EDC2C0E0 = *MEMORY[0x1E0C9AC50];
    unk_1EDC2C0E8 = 0;
    dword_1EDC2C0F0 = 32;
    qword_1EDC2C0F8 = *MEMORY[0x1E0C9B408];
    unk_1EDC2C100 = 0;
    dword_1EDC2C108 = 64;
    qword_1EDC2C110 = *MEMORY[0x1E0C9B400];
    unk_1EDC2C118 = 0;
    dword_1EDC2C120 = 128;
    qword_1EDC2C128 = *MEMORY[0x1E0C9B3C0];
    unk_1EDC2C130 = 0;
    dword_1EDC2C138 = 256;
    qword_1EDC2C140 = *MEMORY[0x1E0C9B3F8];
    unk_1EDC2C148 = 0;
    dword_1EDC2C150 = 1024;
    qword_1EDC2C158 = qword_1EDC2C080;
    unk_1EDC2C160 = 0;
    dword_1EDC2C168 = 0x400000;
    qword_1EDC2C170 = *MEMORY[0x1E0C9B4A0];
    unk_1EDC2C178 = 0;
    dword_1EDC2C180 = 268288;
    qword_1EDC2C188 = *MEMORY[0x1E0C9B530];
    unk_1EDC2C190 = 0;
    dword_1EDC2C198 = 268288;
    qword_1EDC2C1A0 = *MEMORY[0x1E0C9AC60];
    unk_1EDC2C1A8 = 0;
    dword_1EDC2C1B0 = 0x4000;
    qword_1EDC2C1B8 = *MEMORY[0x1E0C9B4A8];
    unk_1EDC2C1C0 = 0;
    dword_1EDC2C1C8 = 0x4000;
    qword_1EDC2C1D0 = *MEMORY[0x1E0C9B420];
    unk_1EDC2C1D8 = 0;
    dword_1EDC2C1E0 = 0x8000;
    qword_1EDC2C1E8 = *MEMORY[0x1E0C9AC58];
    unk_1EDC2C1F0 = 0;
    dword_1EDC2C1F8 = 0x8000;
    qword_1EDC2C200 = *MEMORY[0x1E0C9AC40];
    unk_1EDC2C208 = 0;
    dword_1EDC2C210 = 0x80000;
    qword_1EDC2C218 = *MEMORY[0x1E0C9B518];
    unk_1EDC2C220 = 0;
    dword_1EDC2C228 = 0x80000;
    qword_1EDC2C230 = *MEMORY[0x1E0C9B558];
    unk_1EDC2C238 = 0;
    dword_1EDC2C240 = 0x80000;
    qword_1EDC2C248 = *MEMORY[0x1E0C9B4F0];
    qword_1EDC2C250 = 0;
    dword_1EDC2C258 = 0x80000000;
    qword_1EDC2C260 = *MEMORY[0x1E0C9B5A0];
    qword_1EDC2C268 = 0;
    dword_1EDC2C270 = 0;
    qword_1EDC2C280 = 0;
    qword_1EDC2C278 = 0;
    _ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 1;
  }
  _FSURLGetCatalogInfo::maskToPropertyTable = (uint64_t)&_ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
  v0 = &dword_1EDC2C060;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, *((const void **)v0 - 2));
    *((_QWORD *)v0 - 1) = result;
    v2 = *v0;
    v0 += 6;
  }
  while (v2);
  return result;
}

@end
