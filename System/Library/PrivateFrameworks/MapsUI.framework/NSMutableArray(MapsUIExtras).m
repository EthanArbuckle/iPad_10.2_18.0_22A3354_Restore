@implementation NSMutableArray(MapsUIExtras)

- (void)_mapsui_addObjectIfNotNil:()MapsUIExtras
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)_mapsui_addObjectsFromArrayIfNotNil:()MapsUIExtras
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(a1, "addObjectsFromArray:", v4);

}

@end
