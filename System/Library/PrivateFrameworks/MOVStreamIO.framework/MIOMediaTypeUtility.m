@implementation MIOMediaTypeUtility

+ (id)matchingAVMediaTypeFromMIOMediaType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return **((id **)&unk_24CA45058 + a3);
}

+ (int64_t)matchingMIOMediaTypeFromCMType:(unsigned int)a3
{
  if ((int)a3 <= 1936684397)
  {
    if (a3 == 1835365473)
      return 2;
    if (a3 == 1935893870)
      return 3;
  }
  else
  {
    switch(a3)
    {
      case 0x76696465u:
        return 0;
      case 0x746D6364u:
        return 4;
      case 0x736F756Eu:
        return 1;
    }
  }
  return -1;
}

+ (id)matchingAVMediaTypeFromCMType:(unsigned int)a3
{
  return +[MIOMediaTypeUtility matchingAVMediaTypeFromMIOMediaType:](MIOMediaTypeUtility, "matchingAVMediaTypeFromMIOMediaType:", +[MIOMediaTypeUtility matchingMIOMediaTypeFromCMType:](MIOMediaTypeUtility, "matchingMIOMediaTypeFromCMType:", *(_QWORD *)&a3));
}

@end
