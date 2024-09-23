@implementation CFDataj

const __CFString *___ZL27CreateMetadataFromDatablockP19IIOImageReadSessionPK6tagdefmmbPK8__CFDataj_block_invoke()
{
  const __CFString *result;
  uint64_t v1;
  uint64_t v2;
  const __CFString ***v3;
  const __CFString **v4;
  const __CFString **v5;
  const __CFString *v6;

  result = (const __CFString *)malloc_type_malloc(0x108uLL, 0x2004093837F09uLL);
  v1 = (uint64_t)result;
  if (result)
  {
    v2 = 0;
    v3 = (const __CFString ***)&qword_1E1B833C8;
    do
    {
      v4 = *(v3 - 4);
      if (v4)
        result = *v4;
      else
        result = 0;
      v5 = *v3;
      if (*v3 || (v5 = *(v3 - 1)) != 0)
      {
        v6 = 0;
        if (result && *v5)
        {
          result = (const __CFString *)CGImageMetadataTagKeyCreate(result, *v5);
          v6 = result;
        }
      }
      else
      {
        v6 = 0;
      }
      *(_QWORD *)(v1 + v2) = v6;
      v3 += 7;
      v2 += 8;
    }
    while (v2 != 264);
  }
  IFD0TagKeys = v1;
  return result;
}

const __CFString *___ZL27CreateMetadataFromDatablockP19IIOImageReadSessionPK6tagdefmmbPK8__CFDataj_block_invoke_3()
{
  const __CFString *result;
  uint64_t v1;
  uint64_t v2;
  const __CFString ***v3;
  const __CFString **v4;
  const __CFString **v5;
  const __CFString *v6;

  result = (const __CFString *)malloc_type_malloc(0x260uLL, 0x2004093837F09uLL);
  v1 = (uint64_t)result;
  if (result)
  {
    v2 = 0;
    v3 = (const __CFString ***)&qword_1E1B822F0;
    do
    {
      v4 = *(v3 - 4);
      if (v4)
        result = *v4;
      else
        result = 0;
      v5 = *v3;
      if (*v3 || (v5 = *(v3 - 1)) != 0)
      {
        v6 = 0;
        if (result && *v5)
        {
          result = (const __CFString *)CGImageMetadataTagKeyCreate(result, *v5);
          v6 = result;
        }
      }
      else
      {
        v6 = 0;
      }
      *(_QWORD *)(v1 + v2) = v6;
      v3 += 7;
      v2 += 8;
    }
    while (v2 != 608);
  }
  ExifTagKeys = v1;
  return result;
}

const __CFString *___ZL27CreateMetadataFromDatablockP19IIOImageReadSessionPK6tagdefmmbPK8__CFDataj_block_invoke_2()
{
  const __CFString *result;
  uint64_t v1;
  uint64_t v2;
  const __CFString ***v3;
  const __CFString **v4;
  const __CFString **v5;
  const __CFString *v6;

  result = (const __CFString *)malloc_type_malloc(0x58uLL, 0x2004093837F09uLL);
  v1 = (uint64_t)result;
  if (result)
  {
    v2 = 0;
    v3 = (const __CFString ***)&off_1E1BC4708;
    do
    {
      v4 = *(v3 - 3);
      if (v4)
        result = *v4;
      else
        result = 0;
      v5 = *v3;
      if (*v3)
      {
        v6 = 0;
        if (result && *v5)
        {
          result = (const __CFString *)CGImageMetadataTagKeyCreate(result, *v5);
          v6 = result;
        }
      }
      else
      {
        v6 = 0;
      }
      *(_QWORD *)(v1 + v2) = v6;
      v2 += 8;
      v3 += 7;
    }
    while (v2 != 88);
  }
  IFD1TagKeys = v1;
  return result;
}

const __CFString *___ZL27CreateMetadataFromDatablockP19IIOImageReadSessionPK6tagdefmmbPK8__CFDataj_block_invoke_4()
{
  const __CFString *result;
  uint64_t v1;
  uint64_t v2;
  const __CFString ***v3;
  const __CFString **v4;
  const __CFString **v5;
  const __CFString *v6;

  result = (const __CFString *)malloc_type_malloc(0x100uLL, 0x2004093837F09uLL);
  v1 = (uint64_t)result;
  if (result)
  {
    v2 = 0;
    v3 = (const __CFString ***)&off_1E1B81BB8;
    do
    {
      v4 = *(v3 - 4);
      if (v4)
        result = *v4;
      else
        result = 0;
      v5 = *v3;
      if (*v3 || (v5 = *(v3 - 1)) != 0)
      {
        v6 = 0;
        if (result && *v5)
        {
          result = (const __CFString *)CGImageMetadataTagKeyCreate(result, *v5);
          v6 = result;
        }
      }
      else
      {
        v6 = 0;
      }
      *(_QWORD *)(v1 + v2) = v6;
      v3 += 7;
      v2 += 8;
    }
    while (v2 != 256);
  }
  GPSTagKeys = v1;
  return result;
}

@end
