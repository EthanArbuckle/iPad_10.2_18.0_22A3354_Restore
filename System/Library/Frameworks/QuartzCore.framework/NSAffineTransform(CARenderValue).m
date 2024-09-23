@implementation NSAffineTransform(CARenderValue)

- (_DWORD)CA_copyRenderValue
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "transformStruct");
    v3 = v7;
    v4 = v8;
    v5 = v9;
  }
  else
  {
    v3 = 0uLL;
    v4 = 0uLL;
    v5 = 0uLL;
  }
  v7 = v3;
  v8 = v4;
  v9 = v5;
  return CA::Render::Vector::new_vector((CA::Render::Vector *)6, &v7, a3);
}

- (uint64_t)CA_numericValueCount
{
  return 6;
}

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = 0uLL;
  if (a1)
  {
    objc_msgSend(a1, "transformStruct");
    v4 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  else
  {
    v5 = 0uLL;
    v6 = 0uLL;
  }
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v6;
  return 6;
}

@end
