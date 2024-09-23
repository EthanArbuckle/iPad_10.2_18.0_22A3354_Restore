@implementation BRCFSDownloaderUtil

+ (int)downloadKindWithEtagIfLoser:(id)a3 options:(unint64_t)a4
{
  int v4;

  if ((a4 & 0x20) != 0)
    v4 = 3;
  else
    v4 = 0;
  if (a3)
    return 2;
  else
    return v4;
}

@end
