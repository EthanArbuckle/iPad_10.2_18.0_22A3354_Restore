@implementation FSURLGetResourcePropertyFlags

const void *___FSURLGetResourcePropertyFlags_block_invoke()
{
  uint64_t *v0;
  const void *result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable & 1) == 0)
  {
    v3 = *MEMORY[0x1E0C9B520];
    _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1;
    *(_QWORD *)algn_1EDC2BA68 = v3;
    qword_1EDC2BA70 = 0;
    qword_1EDC2BA78 = 2;
    qword_1EDC2BA80 = *MEMORY[0x1E0C9B4E0];
    unk_1EDC2BA88 = 0;
    v4 = *MEMORY[0x1E0C9B530];
    qword_1EDC2BA90 = 4;
    unk_1EDC2BA98 = v4;
    qword_1EDC2BAA0 = 0;
    unk_1EDC2BAA8 = 8;
    qword_1EDC2BAB0 = *MEMORY[0x1E0C9B550];
    unk_1EDC2BAB8 = 0;
    v5 = *MEMORY[0x1E0C9B508];
    qword_1EDC2BAC0 = 16;
    unk_1EDC2BAC8 = v5;
    qword_1EDC2BAD0 = 0;
    unk_1EDC2BAD8 = 32;
    qword_1EDC2BAE0 = *MEMORY[0x1E0C9B538];
    unk_1EDC2BAE8 = 0;
    v6 = *MEMORY[0x1E0C9B548];
    qword_1EDC2BAF0 = 64;
    unk_1EDC2BAF8 = v6;
    qword_1EDC2BB00 = 0;
    unk_1EDC2BB08 = 128;
    qword_1EDC2BB10 = *MEMORY[0x1E0C9B4F8];
    unk_1EDC2BB18 = 0;
    v7 = *MEMORY[0x1E0C9B4C8];
    qword_1EDC2BB20 = 256;
    unk_1EDC2BB28 = v7;
    qword_1EDC2BB30 = 0;
    unk_1EDC2BB38 = 512;
    qword_1EDC2BB40 = *MEMORY[0x1E0C9B4D8];
    unk_1EDC2BB48 = 0;
    v8 = *MEMORY[0x1E0C9AC88];
    qword_1EDC2BB50 = 1024;
    unk_1EDC2BB58 = v8;
    qword_1EDC2BB60 = 0;
    unk_1EDC2BB68 = 2048;
    qword_1EDC2BB70 = *MEMORY[0x1E0C9ABF8];
    unk_1EDC2BB78 = 0;
    v9 = *MEMORY[0x1E0C9B518];
    qword_1EDC2BB80 = 4096;
    unk_1EDC2BB88 = v9;
    qword_1EDC2BB90 = 0;
    unk_1EDC2BB98 = 0x2000;
    qword_1EDC2BBA0 = *MEMORY[0x1E0C9B558];
    unk_1EDC2BBA8 = 0;
    v10 = *MEMORY[0x1E0C9B4F0];
    qword_1EDC2BBB0 = 0x4000;
    unk_1EDC2BBB8 = v10;
    qword_1EDC2BBC0 = 0;
    unk_1EDC2BBC8 = 0x8000;
    qword_1EDC2BBD0 = *MEMORY[0x1E0C9B4D0];
    unk_1EDC2BBD8 = 0;
    v11 = *MEMORY[0x1E0C9B500];
    qword_1EDC2BBE0 = 0x10000;
    unk_1EDC2BBE8 = v11;
    xmmword_1EDC2BBF0 = 0u;
    unk_1EDC2BC00 = 0u;
    _ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1;
  }
  _FSURLGetResourcePropertyFlags::maskToPropertyTable = (uint64_t)&_ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
  _FSURLGetResourcePropertyFlags::maskToPropertyTableCount = 1;
  v0 = &qword_1EDC2BA78;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD2A668, (const void *)*(v0 - 2));
    *(v0 - 1) = (uint64_t)result;
    v2 = *v0;
    v0 += 3;
  }
  while (v2);
  return result;
}

@end
