@implementation TDNamedColorRenditionSpec

- (void)setColorPropertiesFromCGColor:(CGColor *)a3
{
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  double v7;
  double v8;
  double v9;
  double v10;

  if (TDColorSpaceGetExtendedRangeSRGB___once != -1)
    dispatch_once(&TDColorSpaceGetExtendedRangeSRGB___once, &__block_literal_global_4);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace((CGColorSpaceRef)TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace, kCGRenderingIntentRelativeColorimetric, a3, 0);
  -[TDNamedColorRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("colorSpaceID"));
  -[TDNamedColorRenditionSpec setColorSpaceID:](self, "setColorSpaceID:", 4);
  -[TDNamedColorRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("colorSpaceID"));
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  v7 = 1.0;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  switch(CGColorGetNumberOfComponents(CopyByMatchingToColorSpace))
  {
    case 0uLL:
      break;
    case 1uLL:
      v8 = *Components;
      goto LABEL_7;
    case 2uLL:
      v8 = *Components;
      v7 = Components[1];
LABEL_7:
      v9 = v8;
      v10 = v8;
      break;
    case 3uLL:
      v8 = *Components;
      v9 = Components[1];
      v10 = Components[2];
      break;
    default:
      v8 = *Components;
      v9 = Components[1];
      v10 = Components[2];
      v7 = Components[3];
      break;
  }
  -[TDNamedColorRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("red"));
  -[TDNamedColorRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("green"));
  -[TDNamedColorRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("blue"));
  -[TDNamedColorRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("alpha"));
  -[TDNamedColorRenditionSpec setRed:](self, "setRed:", v8);
  -[TDNamedColorRenditionSpec setGreen:](self, "setGreen:", v9);
  -[TDNamedColorRenditionSpec setBlue:](self, "setBlue:", v10);
  -[TDNamedColorRenditionSpec setAlpha:](self, "setAlpha:", v7);
  -[TDNamedColorRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("red"));
  -[TDNamedColorRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("green"));
  -[TDNamedColorRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("blue"));
  -[TDNamedColorRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("alpha"));
  CGColorRelease(CopyByMatchingToColorSpace);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend((id)-[TDNamedColorRenditionSpec production](self, "production", a3, a4), "name"), "name");
  if ((-[TDNamedColorRenditionSpec colorSpaceID](self, "colorSpaceID") | 4) == 6)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec red](self, "red");
    v22[0] = objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec alpha](self, "alpha");
    v22[1] = objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = v22;
    v12 = 2;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec red](self, "red");
    v21[0] = objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec green](self, "green");
    v21[1] = objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec blue](self, "blue");
    v21[2] = objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)MEMORY[0x24BDD16E0];
    -[TDNamedColorRenditionSpec alpha](self, "alpha");
    v21[3] = objc_msgSend(v16, "numberWithDouble:");
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = v21;
    v12 = 4;
  }
  v17 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithColorNamed:colorSpaceID:components:linkedToSystemColorWithName:", v7, -[TDNamedColorRenditionSpec colorSpaceID](self, "colorSpaceID"), v17, -[TDNamedColorRenditionSpec systemColorName](self, "systemColorName"));
  objc_msgSend(v18, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v18, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  objc_msgSend(v18, "setPreserveForArchiveOnly:", -[TDNamedColorRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v19 = (void *)objc_msgSend(v18, "CSIRepresentationWithCompression:", 0);

  return v19;
}

@end
