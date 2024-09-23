@implementation MIMachOFileIterateImageVersions

uint64_t __MIMachOFileIterateImageVersions_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3 = *(id *)(a1 + 32);
  dyld_get_image_versions();
  v1 = *((unsigned __int8 *)v5 + 24);

  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __MIMachOFileIterateImageVersions_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
