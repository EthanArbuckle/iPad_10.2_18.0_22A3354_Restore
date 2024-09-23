@implementation NSData(FPFileMetadataSerialization)

+ (id)fp_dataWithLastUsedDate:()FPFileMetadataSerialization
{
  double v3;
  void *v4;
  uint64_t v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  objc_msgSend(a3, "timeIntervalSince1970");
  v6[0] = (uint64_t)v3;
  v6[1] = 0;
  if ((fpfs_serialize_last_use_date(v6, (UInt8 *)v7, 0x10uLL, 1) & 0x80000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fp_lastUsedDate
{
  id v1;
  void *v2;
  uint64_t v4[2];

  v4[0] = 0;
  v4[1] = 0;
  v1 = objc_retainAutorelease(a1);
  if ((fpfs_deserialize_last_use_date(v4, (const UInt8 *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), 1) & 0x80000000) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v4[0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)fp_dataWithFavoriteRank:()FPFileMetadataSerialization
{
  int v3;
  void *v4;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = fpfs_serialize_favorite_rank(objc_msgSend(a3, "unsignedLongLongValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         (UInt8 *)&v6,
         0x80uLL);
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fp_favoriteRank
{
  id v1;
  int v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = fpfs_deserialize_favorite_rank(&v5, (const UInt8 *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"));
  v3 = 0;
  if ((v2 & 0x80000000) == 0 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
