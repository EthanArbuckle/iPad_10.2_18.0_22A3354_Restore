@implementation NSValue(HUGrid)

+ (id)valueWithGridPosition:()HUGrid
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{HUGridPosition=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithGridSize:()HUGrid
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{HUGridSize=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)gridPositionValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return v2[0];
}

- (uint64_t)gridSizeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return v2[0];
}

@end
