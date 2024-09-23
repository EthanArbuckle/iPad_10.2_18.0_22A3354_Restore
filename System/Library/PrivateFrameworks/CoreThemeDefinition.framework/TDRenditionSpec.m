@implementation TDRenditionSpec

- (void)awakeFromInsert
{
  TDRenditionKeySpec *v3;

  if (!-[TDRenditionSpec keySpec](self, "keySpec"))
  {
    v3 = -[TDRenditionKeySpec initWithEntity:insertIntoManagedObjectContext:]([TDRenditionKeySpec alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("RenditionKeySpec")), -[TDRenditionSpec managedObjectContext](self, "managedObjectContext"));
    -[TDRenditionSpec setKeySpec:](self, "setKeySpec:", v3);

  }
}

- (void)resetToBaseKeySpec
{
  if (-[TDRenditionSpec production](self, "production"))
  {
    if (-[TDRenditionSpec keySpec](self, "keySpec"))
      objc_msgSend((id)-[TDRenditionSpec keySpec](self, "keySpec"), "setValuesForKeysWithDictionary:", objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "baseKeySpec"), "dictionaryWithValuesForKeys:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec keySpec](self, "keySpec"), "entity"), "propertiesByName"), "allKeys")));
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDRenditionSpec.m"), 67, CFSTR("-[TDRenditionSpec createCSIRepresentationWithCompression:colorSpaceID:document:] is abstract and should not be called"));
  return 0;
}

- (id)propertiesAsDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)-[TDRenditionSpec properties](self, "properties");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "addToDictionary:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (TDRenditionType)renditionType
{
  TDRenditionType *v3;

  -[TDRenditionSpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("renditionType"));
  v3 = (TDRenditionType *)-[TDRenditionSpec primitiveRenditionType](self, "primitiveRenditionType");
  -[TDRenditionSpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("renditionType"));
  if (v3)
    return v3;
  else
    return (TDRenditionType *)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "renditionType");
}

- (void)setRenditionType:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "identifier");
  if (v5 == objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "renditionType"), "identifier")|| v5 == 1010|| v5 == 6)
  {
    -[TDRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("renditionType"));
    -[TDRenditionSpec setPrimitiveRenditionType:](self, "setPrimitiveRenditionType:", a3);
    -[TDRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("renditionType"));
  }
  else if (-[TDRenditionSpec production](self, "production"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Incompatible rendition type '%@'.  Must gradient or multisize image set."), objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "name"), "name"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Missing production."));
  }
}

- (void)setPackedPoint:(CGPoint)a3
{
  double y;

  y = a3.y;
  -[TDRenditionSpec setPackedPointX:](self, "setPackedPointX:", (int)a3.x);
  -[TDRenditionSpec setPackedPointY:](self, "setPackedPointY:", (int)y);
}

- (CGPoint)packedPoint
{
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = (double)(int)-[TDRenditionSpec packedPointX](self, "packedPointX");
  v4 = (double)(int)-[TDRenditionSpec packedPointY](self, "packedPointY");
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  int v4;
  int v5;
  BOOL result;
  unsigned int v7;
  unsigned int v8;
  char v9;

  v4 = -[TDRenditionSpec width](self, "width", a3);
  v5 = -[TDRenditionSpec height](self, "height");
  result = 0;
  if (v4 && v5)
  {
    v7 = objc_msgSend((id)-[TDRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
    if ((-[TDRenditionSpec alphaCrop](self, "alphaCrop") & 1) == 0
      && v5 * v4 > +[CoreThemeDocument maximumAreaOfPackableImageForScale:](CoreThemeDocument, "maximumAreaOfPackableImageForScale:", v7))
    {
      return 0;
    }
    v8 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
    v9 = v8;
    if (v8 > 9)
      return 0;
    result = 1;
    if (((1 << v9) & 0x13F) == 0)
      return 0;
  }
  return result;
}

@end
