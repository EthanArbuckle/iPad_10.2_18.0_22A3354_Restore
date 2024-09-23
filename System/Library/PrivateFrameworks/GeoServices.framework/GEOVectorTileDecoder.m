@implementation GEOVectorTileDecoder

- (GEOVectorTile)decodeTile:(void *)a3 forKey:(uint64_t)a4
{
  id v5;
  id v6;
  GEOVectorTile *v7;
  id v9;
  id v10;

  v9 = 0;
  v10 = 0;
  GEOTileUnpackageBaseAndLocalization(a3, &v10, &v9);
  v5 = v10;
  v6 = v9;
  v7 = -[GEOVectorTile initWithVMP4:localizationData:tileKey:]([GEOVectorTile alloc], "initWithVMP4:localizationData:tileKey:", v5, v6, a4);

  return v7;
}

- (uint64_t)canDecodeTile:(uint64_t)a3 quickly:(_BYTE *)a4
{
  int v4;
  uint64_t result;
  unsigned int v8;

  *a4 = 0;
  v8 = 0;
  v4 = GEOTileKeyStyle(a3, &v8);
  result = 0;
  if (v4)
  {
    result = 1;
    if ((v8 > 0x3E || ((1 << v8) & 0x40618020401C2802) == 0)
      && (v8 - 68 > 0x13 || ((1 << (v8 - 68)) & 0x80023) == 0))
    {
      return 0;
    }
  }
  return result;
}

@end
