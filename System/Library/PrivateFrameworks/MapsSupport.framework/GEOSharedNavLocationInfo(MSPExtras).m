@implementation GEOSharedNavLocationInfo(MSPExtras)

- (uint64_t)hasMatchedCoordinate
{
  uint64_t result;

  result = objc_msgSend(a1, "hasMatchedCoordinateIndex");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hasMatchedCoordinateOffset");
  return result;
}

- (unint64_t)matchedCoordinate
{
  unsigned int v2;
  unsigned int v3;

  if (objc_msgSend(a1, "hasMatchedCoordinate"))
  {
    v2 = objc_msgSend(a1, "matchedCoordinateIndex");
    objc_msgSend(a1, "matchedCoordinateOffset");
  }
  else
  {
    v2 = *MEMORY[0x1E0D26A38];
    v3 = *(_DWORD *)(MEMORY[0x1E0D26A38] + 4);
  }
  return v2 | ((unint64_t)v3 << 32);
}

- (uint64_t)setMatchedCoordinate:()MSPExtras
{
  int v4;
  double v5;

  v4 = HIDWORD(a3);
  objc_msgSend(a1, "setMatchedCoordinateIndex:");
  LODWORD(v5) = v4;
  return objc_msgSend(a1, "setMatchedCoordinateOffset:", v5);
}

- (uint64_t)clearMatchedCoordinate
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "hasMatchedCoordinate");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "setMatchedCoordinateIndex:", 0);
    objc_msgSend(a1, "setHasMatchedCoordinateIndex:", 0);
    LODWORD(v3) = 0;
    objc_msgSend(a1, "setMatchedCoordinateOffset:", v3);
    return objc_msgSend(a1, "setHasMatchedCoordinateOffset:", 0);
  }
  return result;
}

- (__CFString)mspDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  if (objc_msgSend(a1, "hasCoordinate"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "coordinate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lat");
    v5 = v4;
    objc_msgSend(a1, "coordinate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lng");
    objc_msgSend(v2, "stringWithFormat:", CFSTR("(%lf, %lf)"), v5, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(no coordinate)");
  }
  return v8;
}

@end
