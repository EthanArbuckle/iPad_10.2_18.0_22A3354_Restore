@implementation NSData(MFUUDecoder)

- (id)mf_decodeUuencoded
{
  unint64_t v2;
  void *v3;

  if (!a1)
    goto LABEL_5;
  v2 = vcvtpd_u64_f64((double)-[NSData length](a1, "length") * 0.74 + 100.0);
  if (v2 <= 0x64)
    v2 = 100;
  if (v2 > 0x20000)
  {
    -[NSData _uudecoded_large](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[NSData _uudecoded_small](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_uudecoded_small
{
}

- (_QWORD)_uudecoded_small
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E5AA0FF8;
  result[1] = v3;
  return result;
}

- (uint64_t)_uudecoded_small
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (double)_uudecoded_small
{
  double result;

  *(_QWORD *)&result = OutputBuffer::write(*(_QWORD *)(a1 + 8), a2).n128_u64[0];
  return result;
}

- (void)_uudecoded_large
{
}

- (_QWORD)_uudecoded_large
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E5AA0F48;
  result[1] = v3;
  return result;
}

- (uint64_t)_uudecoded_large
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (size_t)_uudecoded_large
{
  uint64_t v2;
  size_t result;

  v2 = *(_QWORD *)(a1 + 8);
  result = fwrite(__ptr, 0x2DuLL, 1uLL, *(FILE **)(v2 + 16));
  *(_QWORD *)(v2 + 24) += 45;
  return result;
}

@end
