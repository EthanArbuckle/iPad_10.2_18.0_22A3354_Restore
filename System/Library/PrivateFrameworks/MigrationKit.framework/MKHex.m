@implementation MKHex

- (id)dataToHex:(id)a3
{
  id v3;
  size_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = a3;
  v4 = 2 * objc_msgSend(v3, "length");
  v5 = malloc_type_malloc(v4, 0x5B83F660uLL);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __19__MKHex_dataToHex___block_invoke;
  v8[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v8[4] = v5;
  objc_msgSend(v3, "enumerateByteRangesUsingBlock:", v8);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v5, v4, 4);
  free(v5);
  return v6;
}

uint64_t __19__MKHex_dataToHex___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;

  if (a4)
  {
    v4 = 2 * a3;
    do
    {
      v5 = *a2++;
      *(_BYTE *)(*(_QWORD *)(result + 32) + v4) = dataToHex__intToHexMap[(unint64_t)v5 >> 4];
      *(_BYTE *)(*(_QWORD *)(result + 32) + v4 + 1) = dataToHex__intToHexMap[v5 & 0xF];
      v4 += 2;
      --a4;
    }
    while (a4);
  }
  return result;
}

- (id)hexToData:(id)a3
{
  id v3;
  size_t v4;
  _BYTE *v5;
  unint64_t v6;
  int v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  void *v12;

  v3 = a3;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    v12 = 0;
    goto LABEL_17;
  }
  v4 = (unint64_t)objc_msgSend(v3, "length") >> 1;
  v5 = malloc_type_malloc(v4, 0x2233AB8BuLL);
  if (!objc_msgSend(v3, "length"))
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v6 = 0;
  while (1)
  {
    v7 = objc_msgSend(v3, "characterAtIndex:", v6);
    if ((v7 - 48) >= 0xA)
      break;
    v8 = -48;
LABEL_10:
    v9 = v8 + v7;
    v10 = v6 >> 1;
    if ((v6 & 1) != 0)
      v11 = v5[v10] | v9;
    else
      v11 = 16 * v9;
    v5[v10] = v11;
    if (++v6 >= objc_msgSend(v3, "length"))
      goto LABEL_14;
  }
  if ((v7 - 97) < 6)
  {
    v8 = -87;
    goto LABEL_10;
  }
  if ((v7 - 65) <= 5)
  {
    v8 = -55;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_15:
  free(v5);
LABEL_17:

  return v12;
}

@end
