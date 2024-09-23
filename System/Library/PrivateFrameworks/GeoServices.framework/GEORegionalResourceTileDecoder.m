@implementation GEORegionalResourceTileDecoder

- (GEORegionalResourceTileData)decodeTile:(void *)a3 forKey:
{
  id v3;
  GEORegionalResourceTileData *v4;

  v3 = a3;
  v4 = -[GEORegionalResourceTileData initWithData:]([GEORegionalResourceTileData alloc], "initWithData:", v3);

  return v4;
}

- (BOOL)canDecodeTile:(uint64_t)a3 quickly:(_BYTE *)a4
{
  _BOOL8 result;

  result = 0;
  *a4 = 0;
  if ((*(_BYTE *)a3 & 0x7F) == 8)
    return (*(_QWORD *)(a3 + 1) & 0x3E0000000000) == 0;
  return result;
}

@end
