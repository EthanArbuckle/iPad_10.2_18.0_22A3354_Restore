@implementation CRImage(CoreRecognition)

- (id)imageByCroppingTextFeature:()CoreRecognition correctedBoundingBox:padding:networkInputSize:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  _OWORD v19[2];
  _BYTE v20[32];
  void *v21[2];
  __int128 v22;

  v14 = a7;
  v15 = a8;
  objc_msgSend(a1, "vImage");
  if (+[GeometricCutTools derotateContentsOf:inImage:andOutputTo:withPadding:networkInputSize:](GeometricCutTools, "derotateContentsOf:inImage:andOutputTo:withPadding:networkInputSize:", v15, v20, v21, a2, a3, a4, a5))
  {
    v16 = objc_alloc(MEMORY[0x24BEB5B80]);
    v19[0] = *(_OWORD *)v21;
    v19[1] = v22;
    v17 = (void *)objc_msgSend(v16, "initWithVImageBuffer:inColorSpace:", v19, 0);
    free(v21[0]);
  }
  else
  {
    NSLog(CFSTR("[CRImage imageByCroppingTextFeature:correctedBoundingBox:padding:networkInputSize:] Failed to crop text feature %@"), v14);
    v17 = 0;
  }

  return v17;
}

@end
