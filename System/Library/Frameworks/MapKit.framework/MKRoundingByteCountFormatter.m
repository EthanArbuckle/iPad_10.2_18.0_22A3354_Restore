@implementation MKRoundingByteCountFormatter

+ (id)stringFromByteCount:(int64_t)a3 roundedToNearest:(int64_t)a4
{
  int64_t v4;

  v4 = +[MKRoundingByteCountFormatter roundByteCount:toNearest:](MKRoundingByteCountFormatter, "roundByteCount:toNearest:", a3, a4);
  return (id)objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v4, 2);
}

+ (int64_t)roundByteCount:(int64_t)a3 toNearest:(int64_t)a4
{
  return llround((double)a3 / (double)a4) * a4;
}

+ (id)stringFromByteCountWithRoundingTo1MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:roundedToNearest:](MKRoundingByteCountFormatter, "stringFromByteCount:roundedToNearest:", a3, 1000000);
}

+ (id)stringFromByteCountWithRoundingTo5MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:roundedToNearest:](MKRoundingByteCountFormatter, "stringFromByteCount:roundedToNearest:", a3, 5000000);
}

+ (id)stringFromByteCountWithRoundingTo10MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:roundedToNearest:](MKRoundingByteCountFormatter, "stringFromByteCount:roundedToNearest:", a3, 10000000);
}

@end
