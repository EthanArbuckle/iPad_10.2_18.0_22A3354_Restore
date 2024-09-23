@implementation NAUIEnumerateContentSizeCategoriesInIncreasingOrder

void __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDF76B8];
  v13[0] = *MEMORY[0x24BDF7690];
  v13[1] = v0;
  v13[2] = *MEMORY[0x24BDF76A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes = v1;

  v3 = *MEMORY[0x24BDF7688];
  v12[0] = *MEMORY[0x24BDF76A0];
  v12[1] = v3;
  v4 = *MEMORY[0x24BDF7678];
  v12[2] = *MEMORY[0x24BDF7680];
  v12[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes = v5;

  v7 = *MEMORY[0x24BDF7658];
  v11[0] = *MEMORY[0x24BDF7660];
  v11[1] = v7;
  v8 = *MEMORY[0x24BDF7648];
  v11[2] = *MEMORY[0x24BDF7650];
  v11[3] = v8;
  v11[4] = *MEMORY[0x24BDF7640];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes = v9;

}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
