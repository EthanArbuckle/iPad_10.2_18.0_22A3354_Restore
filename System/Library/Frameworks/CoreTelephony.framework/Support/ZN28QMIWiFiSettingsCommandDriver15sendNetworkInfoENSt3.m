@implementation ZN28QMIWiFiSettingsCommandDriver15sendNetworkInfoENSt3

size_t *___ZN28QMIWiFiSettingsCommandDriver15sendNetworkInfoENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6__block_invoke_2(size_t *result, char *__dst)
{
  size_t *v3;
  const void *v4;
  size_t v5;
  int v6;

  v3 = result;
  *(_QWORD *)(__dst + 30) = 0;
  *(_OWORD *)__dst = 0u;
  *((_OWORD *)__dst + 1) = 0u;
  if (*((char *)result + 55) < 0)
  {
    v4 = (const void *)result[4];
    v5 = result[5];
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = result + 4;
  v5 = *((unsigned __int8 *)result + 55);
  if (*((_BYTE *)result + 55))
LABEL_3:
    result = (size_t *)memmove(__dst, v4, v5);
LABEL_4:
  v6 = *((_DWORD *)v3 + 14);
  *((_WORD *)__dst + 18) = *((_WORD *)v3 + 30);
  *((_DWORD *)__dst + 8) = v6;
  return result;
}

@end
